
org $948000


PostGrappleCollisionDetection_Horizontal_Slope_NonSquare:
    LDA.W $0B02                                                          ;948000;
    LSR A                                                                ;948003;
    BCC .left                                                            ;948004;
    JMP.W .right                                                         ;948006;


.left:
    LDA.W $0DC4                                                          ;948009;
    STA.W HW_WRDIV                                                       ;94800C;
    SEP #$20                                                             ;94800F;
    LDA.W $07A5                                                          ;948011;
    STA.W HW_WRDIVB                                                      ;948014;
    REP #$20                                                             ;948017;
    LDA.W $0AF6                                                          ;948019;
    LSR A                                                                ;94801C;
    LSR A                                                                ;94801D;
    LSR A                                                                ;94801E;
    LSR A                                                                ;94801F;
    CMP.W HW_RDMPY                                                       ;948020;
    BEQ ..centerInBlock                                                  ;948023;
    CLC                                                                  ;948025;
    RTS                                                                  ;948026;


..centerInBlock:
    LDA.B $20                                                            ;948027;
    AND.W #$000F                                                         ;948029;
    STA.W $0DD4                                                          ;94802C;
    LDA.L $7F6402,X                                                      ;94802F;
    AND.W #$001F                                                         ;948033;
    ASL A                                                                ;948036;
    ASL A                                                                ;948037;
    ASL A                                                                ;948038;
    ASL A                                                                ;948039;
    STA.W $0DD6                                                          ;94803A;
    LDA.L $7F6401,X                                                      ;94803D;
    ASL A                                                                ;948041;
    BPL ..gotoSolid                                                      ;948042;
    LDA.L $7F6401,X                                                      ;948044;
    BMI ..blockBTSMSB                                                    ;948048;
    LDA.W $0AFA                                                          ;94804A;
    BRA +                                                                ;94804D;


..blockBTSMSB:
    LDA.W $0AFA                                                          ;94804F;
    EOR.W #$000F                                                         ;948052;

  + AND.W #$000F                                                         ;948055;
    CLC                                                                  ;948058;
    ADC.W $0DD6                                                          ;948059;
    TAX                                                                  ;94805C;
    LDA.W SlopeDefinitions_SlopeLeftXOffsetByYPixel,X                    ;94805D;
    AND.W #$001F                                                         ;948060;
    SEC                                                                  ;948063;
    SBC.W $0DD4                                                          ;948064;
    DEC A                                                                ;948067;
    BEQ ..returnCarrySet                                                 ;948068;
    BMI ..returnCarryClear                                               ;94806A;

..returnCarrySet:
    SEC                                                                  ;94806C;
    RTS                                                                  ;94806D;


..returnCarryClear:
    CLC                                                                  ;94806E;
    RTS                                                                  ;94806F;


..gotoSolid:
    JMP.W PostGrappleCollisionDetection_Horizontal_Solid                 ;948070;


.right:
    LDA.W $0DC4                                                          ;948073;
    STA.W HW_WRDIV                                                       ;948076;
    SEP #$20                                                             ;948079;
    LDA.W $07A5                                                          ;94807B;
    STA.W HW_WRDIVB                                                      ;94807E;
    REP #$20                                                             ;948081;
    LDA.W $0AF6                                                          ;948083;
    LSR A                                                                ;948086;
    LSR A                                                                ;948087;
    LSR A                                                                ;948088;
    LSR A                                                                ;948089;
    CMP.W HW_RDMPY                                                       ;94808A;
    BEQ ..centerInBlock                                                  ;94808D;
    CLC                                                                  ;94808F;
    RTS                                                                  ;948090;


..centerInBlock:
    LDA.B $20                                                            ;948091;
    AND.W #$000F                                                         ;948093;
    STA.W $0DD4                                                          ;948096;
    LDA.L $7F6402,X                                                      ;948099;
    AND.W #$001F                                                         ;94809D;
    ASL A                                                                ;9480A0;
    ASL A                                                                ;9480A1;
    ASL A                                                                ;9480A2;
    ASL A                                                                ;9480A3;
    STA.W $0DD6                                                          ;9480A4;
    LDA.L $7F6401,X                                                      ;9480A7;
    ASL A                                                                ;9480AB;
    BMI ..gotoSolid                                                      ;9480AC;
    LDA.L $7F6401,X                                                      ;9480AE;
    BMI ..blockBTSMSB                                                    ;9480B2;
    LDA.W $0AFA                                                          ;9480B4;
    BRA +                                                                ;9480B7;


..blockBTSMSB:
    LDA.W $0AFA                                                          ;9480B9;
    EOR.W #$000F                                                         ;9480BC;

  + AND.W #$000F                                                         ;9480BF;
    CLC                                                                  ;9480C2;
    ADC.W $0DD6                                                          ;9480C3;
    TAX                                                                  ;9480C6;
    LDA.W SlopeDefinitions_SlopeLeftXOffsetByYPixel,X                    ;9480C7;
    AND.W #$001F                                                         ;9480CA;
    SEC                                                                  ;9480CD;
    SBC.W $0DD4                                                          ;9480CE;
    DEC A                                                                ;9480D1;
    BEQ +                                                                ;9480D2;
    BPL ..returnCarryClear                                               ;9480D4;

  + EOR.W #$FFFF                                                         ;9480D6;
    SEC                                                                  ;9480D9;
    RTS                                                                  ;9480DA;


..returnCarryClear:
    CLC                                                                  ;9480DB;
    RTS                                                                  ;9480DC;


..gotoSolid:
    JMP.W PostGrappleCollisionDetection_Horizontal_Solid                 ;9480DD;


PostGrappleCollisionDetection_Vertical_Slope_NonSquare:
    LDA.W $0B02                                                          ;9480E0;
    LSR A                                                                ;9480E3;
    BCC .up                                                              ;9480E4;
    JMP.W .down                                                          ;9480E6;


.up:
    LDA.W $0DC4                                                          ;9480E9;
    STA.W HW_WRDIV                                                       ;9480EC;
    SEP #$20                                                             ;9480EF;
    LDA.W $07A5                                                          ;9480F1;
    STA.W HW_WRDIVB                                                      ;9480F4;
    REP #$20                                                             ;9480F7;
    LDA.W $0AF6                                                          ;9480F9;
    LSR A                                                                ;9480FC;
    LSR A                                                                ;9480FD;
    LSR A                                                                ;9480FE;
    LSR A                                                                ;9480FF;
    CMP.W HW_RDMPY                                                       ;948100;
    BEQ ..centerInBlock                                                  ;948103;
    CLC                                                                  ;948105;
    RTS                                                                  ;948106;


..centerInBlock:
    LDA.B $20                                                            ;948107;
    AND.W #$000F                                                         ;948109;
    STA.W $0DD4                                                          ;94810C;
    LDA.L $7F6402,X                                                      ;94810F;
    AND.W #$001F                                                         ;948113;
    ASL A                                                                ;948116;
    ASL A                                                                ;948117;
    ASL A                                                                ;948118;
    ASL A                                                                ;948119;
    STA.W $0DD6                                                          ;94811A;
    LDA.L $7F6401,X                                                      ;94811D;
    BPL ..gotoSolid                                                      ;948121;
    ASL A                                                                ;948123;
    BMI ..blockBTS40                                                     ;948124;
    LDA.W $0AF6                                                          ;948126;
    BRA +                                                                ;948129;


..blockBTS40:
    LDA.W $0AF6                                                          ;94812B;
    EOR.W #$000F                                                         ;94812E;

  + AND.W #$000F                                                         ;948131;
    CLC                                                                  ;948134;
    ADC.W $0DD6                                                          ;948135;
    TAX                                                                  ;948138;
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X                     ;948139;
    AND.W #$001F                                                         ;94813C;
    SEC                                                                  ;94813F;
    SBC.W $0DD4                                                          ;948140;
    DEC A                                                                ;948143;
    BEQ ..returnCarrySet                                                 ;948144;
    BMI ..returnCarryClear                                               ;948146;

..returnCarrySet:
    SEC                                                                  ;948148;
    RTS                                                                  ;948149;


..returnCarryClear:
    CLC                                                                  ;94814A;
    RTS                                                                  ;94814B;


..gotoSolid:
    JMP.W PostGrappleCollisionDetection_Vertical_Solid                   ;94814C;


.down:
    LDA.W $0DC4                                                          ;94814F;
    STA.W HW_WRDIV                                                       ;948152;
    SEP #$20                                                             ;948155;
    LDA.W $07A5                                                          ;948157;
    STA.W HW_WRDIVB                                                      ;94815A;
    REP #$20                                                             ;94815D;
    LDA.W $0AF6                                                          ;94815F;
    LSR A                                                                ;948162;
    LSR A                                                                ;948163;
    LSR A                                                                ;948164;
    LSR A                                                                ;948165;
    CMP.W HW_RDMPY                                                       ;948166;
    BEQ ..centerInBlock                                                  ;948169;
    CLC                                                                  ;94816B;
    RTS                                                                  ;94816C;


..centerInBlock:
    LDA.B $20                                                            ;94816D;
    AND.W #$000F                                                         ;94816F;
    STA.W $0DD4                                                          ;948172;
    LDA.L $7F6402,X                                                      ;948175;
    AND.W #$001F                                                         ;948179;
    ASL A                                                                ;94817C;
    ASL A                                                                ;94817D;
    ASL A                                                                ;94817E;
    ASL A                                                                ;94817F;
    STA.W $0DD6                                                          ;948180;
    LDA.L $7F6401,X                                                      ;948183;
    BMI ..gotoSolid                                                      ;948187;
    ASL A                                                                ;948189;
    BMI ..blockBTS40                                                     ;94818A;
    LDA.W $0AF6                                                          ;94818C;
    BRA +                                                                ;94818F;


..blockBTS40:
    LDA.W $0AF6                                                          ;948191;
    EOR.W #$000F                                                         ;948194;

  + AND.W #$000F                                                         ;948197;
    CLC                                                                  ;94819A;
    ADC.W $0DD6                                                          ;94819B;
    TAX                                                                  ;94819E;
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X                     ;94819F;
    AND.W #$001F                                                         ;9481A2;
    SEC                                                                  ;9481A5;
    SBC.W $0DD4                                                          ;9481A6;
    DEC A                                                                ;9481A9;
    BEQ +                                                                ;9481AA;
    BPL ..returnCarryClear                                               ;9481AC;

  + EOR.W #$FFFF                                                         ;9481AE;
    SEC                                                                  ;9481B1;
    RTS                                                                  ;9481B2;


..returnCarryClear:
    CLC                                                                  ;9481B3;
    RTS                                                                  ;9481B4;


..gotoSolid:
    JMP.W PostGrappleCollisionDetection_Vertical_Solid                   ;9481B5;


PostGrappleCollisionDetection_Horizontal_Slope_Square:
    LDA.L $7F6402,X                                                      ;9481B8;
    AND.W #$001F                                                         ;9481BC;
    ASL A                                                                ;9481BF;
    ASL A                                                                ;9481C0;
    STA.W $0DD4                                                          ;9481C1;
    LDA.L $7F6401,X                                                      ;9481C4;
    ROL A                                                                ;9481C8;
    ROL A                                                                ;9481C9;
    ROL A                                                                ;9481CA;
    AND.W #$0003                                                         ;9481CB;
    STA.W $0DD6                                                          ;9481CE;
    LDA.B $20                                                            ;9481D1;
    AND.W #$0008                                                         ;9481D3;
    LSR A                                                                ;9481D6;
    LSR A                                                                ;9481D7;
    LSR A                                                                ;9481D8;
    EOR.W $0DD6                                                          ;9481D9;
    ADC.W $0DD4                                                          ;9481DC;
    TAX                                                                  ;9481DF;
    LDA.B $1A                                                            ;9481E0;
    BNE .top                                                             ;9481E2;
    LDA.W $0AFA                                                          ;9481E4;
    CLC                                                                  ;9481E7;
    ADC.W $0B00                                                          ;9481E8;
    DEC A                                                                ;9481EB;
    AND.W #$0008                                                         ;9481EC;
    BNE .checkBothHalves                                                 ;9481EF;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;9481F1;
    BMI .solid                                                           ;9481F4;
    BRA .noCollision                                                     ;9481F6;


.top:
    CMP.B $1C                                                            ;9481F8;
    BNE .checkBothHalves                                                 ;9481FA;
    LDA.W $0AFA                                                          ;9481FC;
    SEC                                                                  ;9481FF;
    SBC.W $0B00                                                          ;948200;
    AND.W #$0008                                                         ;948203;
    BNE .checkBottomHalf                                                 ;948206;

.checkBothHalves:
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;948208;
    BMI .solid                                                           ;94820B;

.checkBottomHalf:
    TXA                                                                  ;94820D;
    EOR.W #$0002                                                         ;94820E;
    TAX                                                                  ;948211;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;948212;
    BMI .solid                                                           ;948215;

.noCollision:
    CLC                                                                  ;948217;
    RTS                                                                  ;948218;


.solid:
    LDA.W $0B02                                                          ;948219;
    LSR A                                                                ;94821C;
    BCC .left                                                            ;94821D;
    LDA.B $20                                                            ;94821F;
    AND.W #$0007                                                         ;948221;
    SEC                                                                  ;948224;
    RTS                                                                  ;948225;


.left:
    LDA.B $20                                                            ;948226;
    AND.W #$0007                                                         ;948228;
    EOR.W #$0007                                                         ;94822B;
    SEC                                                                  ;94822E;
    RTS                                                                  ;94822F;


PostGrappleCollisionDetection_Vertical_Slope_Square:
    LDA.L $7F6402,X                                                      ;948230;
    AND.W #$001F                                                         ;948234;
    ASL A                                                                ;948237;
    ASL A                                                                ;948238;
    STA.W $0DD4                                                          ;948239;
    LDA.L $7F6401,X                                                      ;94823C;
    ROL A                                                                ;948240;
    ROL A                                                                ;948241;
    ROL A                                                                ;948242;
    AND.W #$0003                                                         ;948243;
    STA.W $0DD6                                                          ;948246;
    LDA.B $20                                                            ;948249;
    AND.W #$0008                                                         ;94824B;
    LSR A                                                                ;94824E;
    LSR A                                                                ;94824F;
    EOR.W $0DD6                                                          ;948250;
    ADC.W $0DD4                                                          ;948253;
    TAX                                                                  ;948256;
    LDA.B $1A                                                            ;948257;
    BNE .leftmostBlock                                                   ;948259;
    LDA.W $0AF6                                                          ;94825B;
    CLC                                                                  ;94825E;
    ADC.W $0AFE                                                          ;94825F;
    DEC A                                                                ;948262;
    AND.W #$0008                                                         ;948263;
    BNE .checkBothHalves                                                 ;948266;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;948268;
    BMI .solid                                                           ;94826B;
    BRA .returnNoCollision                                               ;94826D;


.leftmostBlock:
    CMP.B $1C                                                            ;94826F;
    BNE .checkBothHalves                                                 ;948271;
    LDA.W $0AF6                                                          ;948273;
    SEC                                                                  ;948276;
    SBC.W $0AFE                                                          ;948277;
    AND.W #$0008                                                         ;94827A;
    BNE .right                                                           ;94827D;

.checkBothHalves:
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;94827F;
    BMI .solid                                                           ;948282;

.right:
    TXA                                                                  ;948284;
    EOR.W #$0001                                                         ;948285;
    TAX                                                                  ;948288;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;948289;
    BMI .solid                                                           ;94828C;

.returnNoCollision:
    CLC                                                                  ;94828E;
    RTS                                                                  ;94828F;


.solid:
    LDA.W $0B02                                                          ;948290;
    LSR A                                                                ;948293;
    BCC .up                                                              ;948294;
    LDA.B $20                                                            ;948296;
    AND.W #$0007                                                         ;948298;
    SEC                                                                  ;94829B;
    RTS                                                                  ;94829C;


.up:
    LDA.B $20                                                            ;94829D;
    AND.W #$0007                                                         ;94829F;
    EOR.W #$0007                                                         ;9482A2;
    SEC                                                                  ;9482A5;
    RTS                                                                  ;9482A6;


CLCRTS_9482A7:
    CLC                                                                  ;9482A7;
    RTS                                                                  ;9482A8;


PostGrappleCollisionDetection_Horizontal_Slope:
    LDX.W $0DC4                                                          ;9482A9;
    LDA.L $7F6402,X                                                      ;9482AC;
    AND.W #$001F                                                         ;9482B0;
    CMP.W #$0005                                                         ;9482B3;
    BCC .gotoSquare                                                      ;9482B6;
    JMP.W PostGrappleCollisionDetection_Horizontal_Slope_NonSquare       ;9482B8;


.gotoSquare:
    JMP.W PostGrappleCollisionDetection_Horizontal_Slope_Square          ;9482BB;


PostGrappleCollisionDetection_Horizontal_Solid:
    LDA.B $20                                                            ;9482BE;
    AND.W #$000F                                                         ;9482C0;
    SEC                                                                  ;9482C3;
    RTS                                                                  ;9482C4;


PostGrappleCollisionDetection_Vertical_Slope:
    LDX.W $0DC4                                                          ;9482C5;
    LDA.L $7F6402,X                                                      ;9482C8;
    AND.W #$001F                                                         ;9482CC;
    CMP.W #$0005                                                         ;9482CF;
    BCC .gotoSquare                                                      ;9482D2;
    JMP.W PostGrappleCollisionDetection_Vertical_Slope_NonSquare         ;9482D4;


.gotoSquare:
    JMP.W PostGrappleCollisionDetection_Vertical_Slope_Square            ;9482D7;


PostGrappleCollisionDetection_Vertical_Solid:
    LDA.B $20                                                            ;9482DA;
    AND.W #$000F                                                         ;9482DC;
    SEC                                                                  ;9482DF;
    RTS                                                                  ;9482E0;


PostGrappleCollisionDetection_Horizontal_JumpTable:
    dw CLCRTS_9482A7                                                     ;9482E1;
    dw PostGrappleCollisionDetection_Horizontal_Slope                    ;9482E3;
    dw CLCRTS_9482A7                                                     ;9482E5;
    dw CLCRTS_9482A7                                                     ;9482E7;
    dw CLCRTS_9482A7                                                     ;9482E9;
    dw CLCRTS_9482A7                                                     ;9482EB;
    dw CLCRTS_9482A7                                                     ;9482ED;
    dw CLCRTS_9482A7                                                     ;9482EF;
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;9482F1;
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;9482F3;
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;9482F5;
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;9482F7;
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;9482F9;
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;9482FB;
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;9482FD;
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;9482FF;

PostGrappleCollisionDetection_Vertical_JumpTable:
    dw CLCRTS_9482A7                                                     ;948301;
    dw PostGrappleCollisionDetection_Vertical_Slope                      ;948303;
    dw CLCRTS_9482A7                                                     ;948305;
    dw CLCRTS_9482A7                                                     ;948307;
    dw CLCRTS_9482A7                                                     ;948309;
    dw CLCRTS_9482A7                                                     ;94830B;
    dw CLCRTS_9482A7                                                     ;94830D;
    dw CLCRTS_9482A7                                                     ;94830F;
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;948311;
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;948313;
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;948315;
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;948317;
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;948319;
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;94831B;
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;94831D;
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;94831F;

PostGrappleCollisionDetection_Horizontal_SingleBlock:
    PHX                                                                  ;948321;
    TXA                                                                  ;948322;
    LSR A                                                                ;948323;
    STA.W $0DC4                                                          ;948324;
    LDA.L $7F0002,X                                                      ;948327;
    AND.W #$F000                                                         ;94832B;
    XBA                                                                  ;94832E;
    LSR A                                                                ;94832F;
    LSR A                                                                ;948330;
    LSR A                                                                ;948331;
    TAX                                                                  ;948332;
    JSR.W (PostGrappleCollisionDetection_Horizontal_JumpTable,X)         ;948333;
    PLX                                                                  ;948336;
    RTS                                                                  ;948337;


PostGrappleCollisionDetection_Vertical_SingleBlock:
    PHX                                                                  ;948338;
    TXA                                                                  ;948339;
    LSR A                                                                ;94833A;
    STA.W $0DC4                                                          ;94833B;
    LDA.L $7F0002,X                                                      ;94833E;
    AND.W #$F000                                                         ;948342;
    XBA                                                                  ;948345;
    LSR A                                                                ;948346;
    LSR A                                                                ;948347;
    LSR A                                                                ;948348;
    TAX                                                                  ;948349;
    JSR.W (PostGrappleCollisionDetection_Vertical_JumpTable,X)           ;94834A;
    PLX                                                                  ;94834D;
    RTS                                                                  ;94834E;


PostGrappleCollisionDetection_Rightwards:
    PHB                                                                  ;94834F;
    PHK                                                                  ;948350;
    PLB                                                                  ;948351;
    LDA.W #$0001                                                         ;948352;
    STA.W $0B02                                                          ;948355;
    STZ.W $0E04                                                          ;948358;
    JSR.W CalculateSamusYBlockSpan                                       ;94835B;
    LDA.W $0AFA                                                          ;94835E;
    SEC                                                                  ;948361;
    SBC.W $0B00                                                          ;948362;
    LSR A                                                                ;948365;
    LSR A                                                                ;948366;
    LSR A                                                                ;948367;
    LSR A                                                                ;948368;
    SEP #$20                                                             ;948369;
    STA.W HW_WRMPYA                                                      ;94836B;
    LDA.W $07A5                                                          ;94836E;
    STA.W HW_WRMPYB                                                      ;948371;
    REP #$20                                                             ;948374;
    LDA.W $0AF8                                                          ;948376;
    STA.B $16                                                            ;948379;
    LDA.W $0AF6                                                          ;94837B;
    STA.B $18                                                            ;94837E;
    CLC                                                                  ;948380;
    ADC.W $0AFE                                                          ;948381;
    DEC A                                                                ;948384;
    STA.B $20                                                            ;948385;
    LSR A                                                                ;948387;
    LSR A                                                                ;948388;
    LSR A                                                                ;948389;
    LSR A                                                                ;94838A;
    CLC                                                                  ;94838B;
    ADC.W HW_RDMPY                                                       ;94838C;
    STA.W $0DC4                                                          ;94838F;
    ASL A                                                                ;948392;
    TAX                                                                  ;948393;

.loop:
    JSR.W PostGrappleCollisionDetection_Horizontal_SingleBlock           ;948394;
    BCC .noCollision                                                     ;948397;
    INC A                                                                ;948399;
    CMP.W $0E04                                                          ;94839A;
    BCC .noCollision                                                     ;94839D;
    STA.W $0E04                                                          ;94839F;

.noCollision:
    TXA                                                                  ;9483A2;
    CLC                                                                  ;9483A3;
    ADC.W $07A5                                                          ;9483A4;
    ADC.W $07A5                                                          ;9483A7;
    TAX                                                                  ;9483AA;
    DEC.B $1A                                                            ;9483AB;
    BPL .loop                                                            ;9483AD;
    PLB                                                                  ;9483AF;
    RTS                                                                  ;9483B0;


PostGrappleCollisionDetection_Leftwards:
    PHB                                                                  ;9483B1;
    PHK                                                                  ;9483B2;
    PLB                                                                  ;9483B3;
    STZ.W $0B02                                                          ;9483B4;
    STZ.W $0E06                                                          ;9483B7;
    JSR.W CalculateSamusYBlockSpan                                       ;9483BA;
    LDA.W $0AFA                                                          ;9483BD;
    SEC                                                                  ;9483C0;
    SBC.W $0B00                                                          ;9483C1;
    LSR A                                                                ;9483C4;
    LSR A                                                                ;9483C5;
    LSR A                                                                ;9483C6;
    LSR A                                                                ;9483C7;
    SEP #$20                                                             ;9483C8;
    STA.W HW_WRMPYA                                                      ;9483CA;
    LDA.W $07A5                                                          ;9483CD;
    STA.W HW_WRMPYB                                                      ;9483D0;
    REP #$20                                                             ;9483D3;
    LDA.W $0AF8                                                          ;9483D5;
    STA.B $16                                                            ;9483D8;
    LDA.W $0AF6                                                          ;9483DA;
    STA.B $18                                                            ;9483DD;
    SEC                                                                  ;9483DF;
    SBC.W $0AFE                                                          ;9483E0;
    STA.B $20                                                            ;9483E3;
    LSR A                                                                ;9483E5;
    LSR A                                                                ;9483E6;
    LSR A                                                                ;9483E7;
    LSR A                                                                ;9483E8;
    CLC                                                                  ;9483E9;
    ADC.W HW_RDMPY                                                       ;9483EA;
    STA.W $0DC4                                                          ;9483ED;
    ASL A                                                                ;9483F0;
    TAX                                                                  ;9483F1;

.loop:
    JSR.W PostGrappleCollisionDetection_Horizontal_SingleBlock           ;9483F2;
    BCC .noCollision                                                     ;9483F5;
    INC A                                                                ;9483F7;
    CMP.W $0E06                                                          ;9483F8;
    BCC .noCollision                                                     ;9483FB;
    STA.W $0E06                                                          ;9483FD;

.noCollision:
    TXA                                                                  ;948400;
    CLC                                                                  ;948401;
    ADC.W $07A5                                                          ;948402;
    ADC.W $07A5                                                          ;948405;
    TAX                                                                  ;948408;
    DEC.B $1A                                                            ;948409;
    BPL .loop                                                            ;94840B;
    PLB                                                                  ;94840D;
    RTS                                                                  ;94840E;


PostGrappleCollisionDetection_Downwards:
    PHB                                                                  ;94840F;
    PHK                                                                  ;948410;
    PLB                                                                  ;948411;
    LDA.W #$0003                                                         ;948412;
    STA.W $0B02                                                          ;948415;
    STZ.W $0E08                                                          ;948418;
    JSR.W CalculateSamusXBlockSpan                                       ;94841B;
    LDA.W $0AFC                                                          ;94841E;
    STA.B $16                                                            ;948421;
    LDA.W $0AFA                                                          ;948423;
    STA.B $18                                                            ;948426;
    CLC                                                                  ;948428;
    ADC.W $0B00                                                          ;948429;
    DEC A                                                                ;94842C;
    STA.B $20                                                            ;94842D;
    LSR A                                                                ;94842F;
    LSR A                                                                ;948430;
    LSR A                                                                ;948431;
    LSR A                                                                ;948432;
    SEP #$20                                                             ;948433;
    STA.W HW_WRMPYA                                                      ;948435;
    LDA.W $07A5                                                          ;948438;
    STA.W HW_WRMPYB                                                      ;94843B;
    REP #$20                                                             ;94843E;
    LDA.W $0AF6                                                          ;948440;
    SEC                                                                  ;948443;
    SBC.W $0AFE                                                          ;948444;
    LSR A                                                                ;948447;
    LSR A                                                                ;948448;
    LSR A                                                                ;948449;
    LSR A                                                                ;94844A;
    CLC                                                                  ;94844B;
    ADC.W HW_RDMPY                                                       ;94844C;
    STA.W $0DC4                                                          ;94844F;
    ASL A                                                                ;948452;
    TAX                                                                  ;948453;

.loop:
    JSR.W PostGrappleCollisionDetection_Vertical_SingleBlock             ;948454;
    BCC .nocollision                                                     ;948457;
    INC A                                                                ;948459;
    CMP.W $0E08                                                          ;94845A;
    BCC .nocollision                                                     ;94845D;
    STA.W $0E08                                                          ;94845F;

.nocollision:
    INX                                                                  ;948462;
    INX                                                                  ;948463;
    DEC.B $1A                                                            ;948464;
    BPL .loop                                                            ;948466;
    PLB                                                                  ;948468;
    RTS                                                                  ;948469;


PostGrappleCollisionDetection_Upwards:
    PHB                                                                  ;94846A;
    PHK                                                                  ;94846B;
    PLB                                                                  ;94846C;
    LDA.W #$0002                                                         ;94846D;
    STA.W $0B02                                                          ;948470;
    STZ.W $0E0A                                                          ;948473;
    JSR.W CalculateSamusXBlockSpan                                       ;948476;
    LDA.W $0AFC                                                          ;948479;
    STA.B $16                                                            ;94847C;
    LDA.W $0AFA                                                          ;94847E;
    STA.B $18                                                            ;948481;
    SEC                                                                  ;948483;
    SBC.W $0B00                                                          ;948484;
    STA.B $20                                                            ;948487;
    LSR A                                                                ;948489;
    LSR A                                                                ;94848A;
    LSR A                                                                ;94848B;
    LSR A                                                                ;94848C;
    SEP #$20                                                             ;94848D;
    STA.W HW_WRMPYA                                                      ;94848F;
    LDA.W $07A5                                                          ;948492;
    STA.W HW_WRMPYB                                                      ;948495;
    REP #$20                                                             ;948498;
    LDA.W $0AF6                                                          ;94849A;
    SEC                                                                  ;94849D;
    SBC.W $0AFE                                                          ;94849E;
    LSR A                                                                ;9484A1;
    LSR A                                                                ;9484A2;
    LSR A                                                                ;9484A3;
    LSR A                                                                ;9484A4;
    CLC                                                                  ;9484A5;
    ADC.W HW_RDMPY                                                       ;9484A6;
    STA.W $0DC4                                                          ;9484A9;
    ASL A                                                                ;9484AC;
    TAX                                                                  ;9484AD;

.loop:
    JSR.W PostGrappleCollisionDetection_Vertical_SingleBlock             ;9484AE;
    BCC .noCollision                                                     ;9484B1;
    INC A                                                                ;9484B3;
    CMP.W $0E0A                                                          ;9484B4;
    BCC .noCollision                                                     ;9484B7;
    STA.W $0E0A                                                          ;9484B9;

.noCollision:
    INX                                                                  ;9484BC;
    INX                                                                  ;9484BD;
    DEC.B $1A                                                            ;9484BE;
    BPL .loop                                                            ;9484C0;
    PLB                                                                  ;9484C2;
    RTS                                                                  ;9484C3;


PostGrappleCollisionDetection_Horizontal:
    PHP                                                                  ;9484C4;
    JSR.W PostGrappleCollisionDetection_Rightwards                       ;9484C5;
    JSR.W PostGrappleCollisionDetection_Leftwards                        ;9484C8;
    PLP                                                                  ;9484CB;
    RTL                                                                  ;9484CC;


PostGrappleCollisionDetection_Vertical:
    PHP                                                                  ;9484CD;
    JSR.W PostGrappleCollisionDetection_Downwards                        ;9484CE;
    JSR.W PostGrappleCollisionDetection_Upwards                          ;9484D1;
    PLP                                                                  ;9484D4;
    RTL                                                                  ;9484D5;


SamusBlockCollisionDetection_Horizontal_Slope_NonSquare:
    LDA.W $1E77                                                          ;9484D6;
    BIT.W #$0080                                                         ;9484D9;
    BNE .returnNoCollision                                               ;9484DC;
    LDA.W $0B2C                                                          ;9484DE;
    ORA.W $0B2E                                                          ;9484E1;
    BEQ .SamusOnSlopeSurface                                             ;9484E4;

.returnNoCollision:
    CLC                                                                  ;9484E6;
    RTS                                                                  ;9484E7;


.SamusOnSlopeSurface:
    LDA.W $1E77                                                          ;9484E8;
    AND.W #$001F                                                         ;9484EB;
    ASL A                                                                ;9484EE;
    ASL A                                                                ;9484EF;
    TAX                                                                  ;9484F0;
    LDA.B $12                                                            ;9484F1;
    BPL .right                                                           ;9484F3;
    LDA.W $0B48                                                          ;9484F5;
    ORA.W $0B46                                                          ;9484F8;
    BEQ .backToReality                                                   ;9484FB;
    LDA.W $1E77                                                          ;9484FD;
    BIT.W #$0040                                                         ;948500;
    BNE +                                                                ;948503;
    LDA.W $0B48                                                          ;948505;
    CLC                                                                  ;948508;
    ADC.W .speedModifiers,X                                              ;948509;
    BCC .backToReality                                                   ;94850C;
    BRA .backToReality                                                   ;94850E;


  + LDA.W $0B48                                                          ;948510;
    SEC                                                                  ;948513;
    SBC.W .speedModifiers,X                                              ;948514;
    BCS .backToReality                                                   ;948517; >.<

.backToReality:
    SEP #$20                                                             ;948519;
    LDA.B $12                                                            ;94851B;
    XBA                                                                  ;94851D;
    LDA.B $15                                                            ;94851E;
    REP #$20                                                             ;948520;
    EOR.W #$FFFF                                                         ;948522;
    INC A                                                                ;948525;
    LDY.W .adjustedDistanceMultiplier,X                                  ;948526;
    JSL.L A_Y_16bit_UnsignedMultiplication                               ;948529;
    LDA.W $05F1                                                          ;94852D;
    EOR.W #$FFFF                                                         ;948530;
    CLC                                                                  ;948533;
    ADC.W #$0001                                                         ;948534;
    STA.B $14                                                            ;948537;
    LDA.W $05F3                                                          ;948539;
    EOR.W #$FFFF                                                         ;94853C;
    ADC.W #$0000                                                         ;94853F;
    STA.B $12                                                            ;948542;
    CLC                                                                  ;948544;
    RTS                                                                  ;948545;


.right:
    LDA.W $0B48                                                          ;948546;
    ORA.W $0B46                                                          ;948549;
    BEQ ..backToReality                                                  ;94854C;
    LDA.W $1E77                                                          ;94854E;
    BIT.W #$0040                                                         ;948551;
    BEQ +                                                                ;948554;
    LDA.W $0B48                                                          ;948556;
    CLC                                                                  ;948559;
    ADC.W .speedModifiers,X                                              ;94855A;
    BCC ..backToReality                                                  ;94855D;
    BRA ..backToReality                                                  ;94855F;


  + LDA.W $0B48                                                          ;948561;
    SEC                                                                  ;948564;
    SBC.W .speedModifiers,X                                              ;948565;
    BCS ..backToReality                                                  ;948568;

..backToReality:
    SEP #$20                                                             ;94856A;
    LDA.B $12                                                            ;94856C;
    XBA                                                                  ;94856E;
    LDA.B $15                                                            ;94856F;
    REP #$20                                                             ;948571;
    LDY.W .adjustedDistanceMultiplier,X                                  ;948573;
    JSL.L A_Y_16bit_UnsignedMultiplication                               ;948576;
    LDA.W $05F1                                                          ;94857A;
    STA.B $14                                                            ;94857D;
    LDA.W $05F3                                                          ;94857F;
    STA.B $12                                                            ;948582;
    CLC                                                                  ;948584;
    RTS                                                                  ;948585;


.speedModifiers:
    dw $0000                                                             ;948586;

.adjustedDistanceMultiplier:
    dw $0100,$0000,$0100,$0000,$0100,$0000,$0100,$0000                   ;948588;
    dw $0100,$0000,$0100,$0000,$0100,$0000,$0100,$0000                   ;948598;
    dw $0100,$0000,$0100,$0000,$0100,$0000,$0100,$0000                   ;9485A8;
    dw $0100,$0000,$0100,$1000,$00B0,$1000,$00B0,$0000                   ;9485B8;
    dw $0100,$0000,$0100,$1000,$00C0,$0000,$0100,$1000                   ;9485C8;
    dw $00C0,$1000,$00C0,$0800,$00D8,$0800,$00D8,$0600                   ;9485D8;
    dw $00F0,$0600,$00F0,$0600,$00F0,$4000,$0080,$4000                   ;9485E8;
    dw $0080,$6000,$0050,$6000,$0050,$6000,$0050                         ;9485F8;

UNUSED_948606:
    LDA.W $0DC4                                                          ;948606;
    STA.W HW_WRDIV                                                       ;948609;
    SEP #$20                                                             ;94860C;
    LDA.W $07A5                                                          ;94860E;
    STA.W HW_WRDIVB                                                      ;948611;
    REP #$20                                                             ;948614;
    LDA.W $0AF6                                                          ;948616;
    LSR A                                                                ;948619;
    LSR A                                                                ;94861A;
    LSR A                                                                ;94861B;
    LSR A                                                                ;94861C;
    CMP.W HW_RDMPY                                                       ;94861D;
    BEQ .centerInBlock                                                   ;948620;
    CLC                                                                  ;948622;
    RTS                                                                  ;948623;


.centerInBlock:
    LDA.B $18                                                            ;948624;
    SEC                                                                  ;948626;
    SBC.W $0AFE                                                          ;948627;
    AND.W #$000F                                                         ;94862A;
    EOR.W #$000F                                                         ;94862D;
    STA.W $0DD4                                                          ;948630;
    LDA.L $7F6402,X                                                      ;948633;
    AND.W #$001F                                                         ;948637;
    ASL A                                                                ;94863A;
    ASL A                                                                ;94863B;
    ASL A                                                                ;94863C;
    ASL A                                                                ;94863D;
    STA.W $0DD6                                                          ;94863E;
    LDA.L $7F6401,X                                                      ;948641;
    ASL A                                                                ;948645;
    BPL .gotoSolidShootableGrapple                                       ;948646;
    LDA.L $7F6401,X                                                      ;948648;
    BMI .blockBTSMSB                                                     ;94864C;
    LDA.W $0AFA                                                          ;94864E;
    BRA +                                                                ;948651;


.blockBTSMSB:
    LDA.W $0AFA                                                          ;948653;
    EOR.W #$000F                                                         ;948656;

  + AND.W #$000F                                                         ;948659;
    CLC                                                                  ;94865C;
    ADC.W $0DD6                                                          ;94865D;
    TAX                                                                  ;948660;
    LDA.W SlopeDefinitions_SlopeLeftXOffsetByYPixel,X                    ;948661;
    AND.W #$001F                                                         ;948664;
    SEC                                                                  ;948667;
    SBC.W $0DD4                                                          ;948668;
    DEC A                                                                ;94866B;
    BEQ +                                                                ;94866C;
    BPL ..returnNoCollision                                              ;94866E;

  + CLC                                                                  ;948670;
    ADC.B $12                                                            ;948671;
    BPL +                                                                ;948673;
    LDA.W #$0000                                                         ;948675;

  + STA.B $12                                                            ;948678;
    STZ.B $14                                                            ;94867A;
    SEC                                                                  ;94867C;
    RTS                                                                  ;94867D;


..returnNoCollision:
    CLC                                                                  ;94867E;
    RTS                                                                  ;94867F;


.gotoSolidShootableGrapple:
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple   ;948680;


.right:
    LDA.W $0DC4                                                          ;948683;
    STA.W HW_WRDIV                                                       ;948686;
    SEP #$20                                                             ;948689;
    LDA.W $07A5                                                          ;94868B;
    STA.W HW_WRDIVB                                                      ;94868E;
    REP #$20                                                             ;948691;
    LDA.W $0AF6                                                          ;948693;
    LSR A                                                                ;948696;
    LSR A                                                                ;948697;
    LSR A                                                                ;948698;
    LSR A                                                                ;948699;
    CMP.W HW_RDMPY                                                       ;94869A;
    BEQ ..centerInBlock                                                  ;94869D;
    CLC                                                                  ;94869F;
    RTS                                                                  ;9486A0;


..centerInBlock:
    LDA.B $18                                                            ;9486A1;
    CLC                                                                  ;9486A3;
    ADC.W $0AFE                                                          ;9486A4;
    DEC A                                                                ;9486A7;
    AND.W #$000F                                                         ;9486A8;
    STA.W $0DD4                                                          ;9486AB;
    LDA.L $7F6402,X                                                      ;9486AE;
    AND.W #$001F                                                         ;9486B2;
    ASL A                                                                ;9486B5;
    ASL A                                                                ;9486B6;
    ASL A                                                                ;9486B7;
    ASL A                                                                ;9486B8;
    STA.W $0DD6                                                          ;9486B9;
    LDA.L $7F6401,X                                                      ;9486BC;
    ASL A                                                                ;9486C0;
    BMI ..gotoSolidShootableGrapple                                      ;9486C1;
    LDA.L $7F6401,X                                                      ;9486C3;
    BMI ..blockBTSMSB                                                    ;9486C7;
    LDA.W $0AFA                                                          ;9486C9;
    BRA +                                                                ;9486CC;


..blockBTSMSB:
    LDA.W $0AFA                                                          ;9486CE;
    EOR.W #$000F                                                         ;9486D1;

  + AND.W #$000F                                                         ;9486D4;
    CLC                                                                  ;9486D7;
    ADC.W $0DD6                                                          ;9486D8;
    TAX                                                                  ;9486DB;
    LDA.W SlopeDefinitions_SlopeLeftXOffsetByYPixel,X                    ;9486DC;
    AND.W #$001F                                                         ;9486DF;
    SEC                                                                  ;9486E2;
    SBC.W $0DD4                                                          ;9486E3;
    DEC A                                                                ;9486E6;
    BEQ +                                                                ;9486E7;
    BPL ..returnNoCollision                                              ;9486E9;

  + CLC                                                                  ;9486EB;
    ADC.B $12                                                            ;9486EC;
    BPL +                                                                ;9486EE;
    LDA.W #$0000                                                         ;9486F0;

  + STA.B $12                                                            ;9486F3;
    STZ.B $14                                                            ;9486F5;
    SEC                                                                  ;9486F7;
    RTS                                                                  ;9486F8;


..returnNoCollision:
    CLC                                                                  ;9486F9;
    RTS                                                                  ;9486FA;


..gotoSolidShootableGrapple:
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple   ;9486FB;


SamusBlockCollisionReaction_Vertical_Slope_NonSquare:
    LDA.W $0B02                                                          ;9486FE;
    LSR A                                                                ;948701;
    BCC .up                                                              ;948702;
    JMP.W .down                                                          ;948704;


.up:
    LDA.W $0DC4                                                          ;948707;
    STA.W HW_WRDIV                                                       ;94870A;
    SEP #$20                                                             ;94870D;
    LDA.W $07A5                                                          ;94870F;
    STA.W HW_WRDIVB                                                      ;948712;
    REP #$20                                                             ;948715;
    LDA.W $0AF6                                                          ;948717;
    LSR A                                                                ;94871A;
    LSR A                                                                ;94871B;
    LSR A                                                                ;94871C;
    LSR A                                                                ;94871D;
    CMP.W HW_RDMPY                                                       ;94871E;
    BEQ ..centerInBlock                                                  ;948721;
    CLC                                                                  ;948723;
    RTS                                                                  ;948724;


..centerInBlock:
    LDA.B $18                                                            ;948725;
    SEC                                                                  ;948727;
    SBC.W $0B00                                                          ;948728;
    AND.W #$000F                                                         ;94872B;
    EOR.W #$000F                                                         ;94872E;
    STA.W $0DD4                                                          ;948731;
    LDA.L $7F6402,X                                                      ;948734;
    AND.W #$001F                                                         ;948738;
    ASL A                                                                ;94873B;
    ASL A                                                                ;94873C;
    ASL A                                                                ;94873D;
    ASL A                                                                ;94873E;
    STA.W $0DD6                                                          ;94873F;
    LDA.L $7F6401,X                                                      ;948742;
    BPL ..gotoReturnNoCollision                                          ;948746;
    ASL A                                                                ;948748;
    BMI ..blockBTS40                                                     ;948749;
    LDA.W $0AF6                                                          ;94874B;
    BRA +                                                                ;94874E;


..blockBTS40:
    LDA.W $0AF6                                                          ;948750;
    EOR.W #$000F                                                         ;948753;

  + AND.W #$000F                                                         ;948756;
    CLC                                                                  ;948759;
    ADC.W $0DD6                                                          ;94875A;
    TAX                                                                  ;94875D;
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X                     ;94875E;
    AND.W #$001F                                                         ;948761;
    SEC                                                                  ;948764;
    SBC.W $0DD4                                                          ;948765;
    DEC A                                                                ;948768;
    BEQ +                                                                ;948769;
    BPL ..returnNoCollision                                              ;94876B;

  + CLC                                                                  ;94876D;
    ADC.B $12                                                            ;94876E;
    BPL +                                                                ;948770;
    LDA.W #$0000                                                         ;948772;

  + STA.B $12                                                            ;948775;
    STZ.B $14                                                            ;948777;
    SEC                                                                  ;948779;
    RTS                                                                  ;94877A;


..returnNoCollision:
    CLC                                                                  ;94877B;
    RTS                                                                  ;94877C;


..gotoReturnNoCollision:
    JMP.W ..returnNoCollision                                            ;94877D; >.<


.down:
    LDA.W $0DC4                                                          ;948780;
    STA.W HW_WRDIV                                                       ;948783;
    SEP #$20                                                             ;948786;
    LDA.W $07A5                                                          ;948788;
    STA.W HW_WRDIVB                                                      ;94878B;
    REP #$20                                                             ;94878E;
    LDA.W $0AF6                                                          ;948790;
    LSR A                                                                ;948793;
    LSR A                                                                ;948794;
    LSR A                                                                ;948795;
    LSR A                                                                ;948796;
    CMP.W HW_RDMPY                                                       ;948797;
    BEQ ..centerInBlock                                                  ;94879A;
    CLC                                                                  ;94879C;
    RTS                                                                  ;94879D;


..centerInBlock:
    LDA.B $18                                                            ;94879E;
    CLC                                                                  ;9487A0;
    ADC.W $0B00                                                          ;9487A1;
    DEC A                                                                ;9487A4;
    AND.W #$000F                                                         ;9487A5;
    STA.W $0DD4                                                          ;9487A8;
    LDA.L $7F6402,X                                                      ;9487AB;
    AND.W #$001F                                                         ;9487AF;
    ASL A                                                                ;9487B2;
    ASL A                                                                ;9487B3;
    ASL A                                                                ;9487B4;
    ASL A                                                                ;9487B5;
    STA.W $0DD6                                                          ;9487B6;
    LDA.L $7F6401,X                                                      ;9487B9;
    BMI ..returnNoCollision                                              ;9487BD;
    ASL A                                                                ;9487BF;
    BMI ..blockBTS40                                                     ;9487C0;
    LDA.W $0AF6                                                          ;9487C2;
    BRA +                                                                ;9487C5;


..blockBTS40:
    LDA.W $0AF6                                                          ;9487C7;
    EOR.W #$000F                                                         ;9487CA;

  + AND.W #$000F                                                         ;9487CD;
    CLC                                                                  ;9487D0;
    ADC.W $0DD6                                                          ;9487D1;
    TAX                                                                  ;9487D4;
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X                     ;9487D5;
    AND.W #$001F                                                         ;9487D8;
    SEC                                                                  ;9487DB;
    SBC.W $0DD4                                                          ;9487DC;
    DEC A                                                                ;9487DF;
    BEQ +                                                                ;9487E0;
    BPL ..returnNoCollision                                              ;9487E2;

  + CLC                                                                  ;9487E4;
    ADC.B $12                                                            ;9487E5;
    BPL +                                                                ;9487E7;
    LDA.W #$0000                                                         ;9487E9;

  + STA.B $12                                                            ;9487EC;
    STZ.B $14                                                            ;9487EE;
    SEC                                                                  ;9487F0;
    RTS                                                                  ;9487F1;


..returnNoCollision:
    CLC                                                                  ;9487F2;
    RTS                                                                  ;9487F3;


Align_SamusYPosition_WithNonSquareSlope:
    PHB                                                                  ;9487F4;
    PHK                                                                  ;9487F5;
    PLB                                                                  ;9487F6;
    LDA.W $0A46                                                          ;9487F7;
    BIT.W #$0002                                                         ;9487FA;
    BNE .bottom                                                          ;9487FD;
    JMP.W .return                                                        ;9487FF;


.bottom:
    LDA.W $0AF6                                                          ;948802;
    STA.B $1A                                                            ;948805;
    LDA.W $0AFA                                                          ;948807;
    CLC                                                                  ;94880A;
    ADC.W $0B00                                                          ;94880B;
    DEC A                                                                ;94880E;
    STA.B $1C                                                            ;94880F;
    STZ.B $1E                                                            ;948811;
    STZ.B $20                                                            ;948813;
    JSR.W CalculateBlockAt_12_1E_1C_20                                   ;948815;
    LDA.W $0DC4                                                          ;948818;
    ASL A                                                                ;94881B;
    TAX                                                                  ;94881C;
    LDA.L $7F0002,X                                                      ;94881D;
    AND.W #$F000                                                         ;948821;
    CMP.W #$1000                                                         ;948824;
    BNE .SamusTopCheck                                                   ;948827;
    LDX.W $0DC4                                                          ;948829;
    LDA.L $7F6402,X                                                      ;94882C;
    AND.W #$001F                                                         ;948830;
    CMP.W #$0005                                                         ;948833;
    BCC .SamusTopCheck                                                   ;948836;
    LDA.W $0AFA                                                          ;948838;
    CLC                                                                  ;94883B;
    ADC.W $0B00                                                          ;94883C;
    DEC A                                                                ;94883F;
    AND.W #$000F                                                         ;948840;
    STA.W $0DD4                                                          ;948843;
    LDA.L $7F6402,X                                                      ;948846;
    AND.W #$001F                                                         ;94884A;
    ASL A                                                                ;94884D;
    ASL A                                                                ;94884E;
    ASL A                                                                ;94884F;
    ASL A                                                                ;948850;
    STA.W $0DD6                                                          ;948851;
    LDA.L $7F6401,X                                                      ;948854;
    BMI .SamusTopCheck                                                   ;948858;
    ASL A                                                                ;94885A;
    BMI ..blockBTS40                                                     ;94885B;
    LDA.W $0AF6                                                          ;94885D;
    BRA +                                                                ;948860;


..blockBTS40:
    LDA.W $0AF6                                                          ;948862;
    EOR.W #$000F                                                         ;948865;

  + AND.W #$000F                                                         ;948868;
    CLC                                                                  ;94886B;
    ADC.W $0DD6                                                          ;94886C;
    TAX                                                                  ;94886F;
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X                     ;948870;
    AND.W #$001F                                                         ;948873;
    SEC                                                                  ;948876;
    SBC.W $0DD4                                                          ;948877;
    DEC A                                                                ;94887A;
    BPL .SamusTopCheck                                                   ;94887B;
    CLC                                                                  ;94887D;
    ADC.W $0AFA                                                          ;94887E;
    STA.W $0AFA                                                          ;948881;
    LDA.W #$0001                                                         ;948884;
    STA.W $0DBA                                                          ;948887;

.SamusTopCheck:
    LDA.W $0AF6                                                          ;94888A;
    STA.B $1A                                                            ;94888D;
    LDA.W $0AFA                                                          ;94888F;
    SEC                                                                  ;948892;
    SBC.W $0B00                                                          ;948893;
    STA.B $1C                                                            ;948896;
    STZ.B $1E                                                            ;948898;
    STZ.B $20                                                            ;94889A;
    JSR.W CalculateBlockAt_12_1E_1C_20                                   ;94889C;
    LDA.W $0DC4                                                          ;94889F;
    ASL A                                                                ;9488A2;
    TAX                                                                  ;9488A3;
    LDA.L $7F0002,X                                                      ;9488A4;
    AND.W #$F000                                                         ;9488A8;
    CMP.W #$1000                                                         ;9488AB;
    BNE .return                                                          ;9488AE;
    LDX.W $0DC4                                                          ;9488B0;
    LDA.L $7F6402,X                                                      ;9488B3;
    AND.W #$001F                                                         ;9488B7;
    CMP.W #$0005                                                         ;9488BA;
    BCC .return                                                          ;9488BD;
    LDA.W $0AFA                                                          ;9488BF;
    SEC                                                                  ;9488C2;
    SBC.W $0B00                                                          ;9488C3;
    AND.W #$000F                                                         ;9488C6;
    EOR.W #$000F                                                         ;9488C9;
    STA.W $0DD4                                                          ;9488CC;
    LDA.L $7F6402,X                                                      ;9488CF;
    AND.W #$001F                                                         ;9488D3;
    ASL A                                                                ;9488D6;
    ASL A                                                                ;9488D7;
    ASL A                                                                ;9488D8;
    ASL A                                                                ;9488D9;
    STA.W $0DD6                                                          ;9488DA;
    LDA.L $7F6401,X                                                      ;9488DD;
    BPL .return                                                          ;9488E1;
    ASL A                                                                ;9488E3;
    BMI ..blockBTS40                                                     ;9488E4;
    LDA.W $0AF6                                                          ;9488E6;
    BRA +                                                                ;9488E9;


..blockBTS40:
    LDA.W $0AF6                                                          ;9488EB;
    EOR.W #$000F                                                         ;9488EE;

  + AND.W #$000F                                                         ;9488F1;
    CLC                                                                  ;9488F4;
    ADC.W $0DD6                                                          ;9488F5;
    TAX                                                                  ;9488F8;
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X                     ;9488F9;
    AND.W #$001F                                                         ;9488FC;
    SEC                                                                  ;9488FF;
    SBC.W $0DD4                                                          ;948900;
    DEC A                                                                ;948903;
    BEQ +                                                                ;948904;
    BPL .return                                                          ;948906;

  + EOR.W #$FFFF                                                         ;948908;
    INC A                                                                ;94890B;
    CLC                                                                  ;94890C;
    ADC.W $0AFA                                                          ;94890D;
    STA.W $0AFA                                                          ;948910;
    LDA.W #$0001                                                         ;948913;
    STA.W $0DBA                                                          ;948916;

.return:
    PLB                                                                  ;948919;
    RTL                                                                  ;94891A;


UNUSED_SlopeDefinitions_94891B:
    db $0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01,$00   ;94891B;

SlopeDefinitions_SlopeLeftXOffsetByYPixel:
    db $10,$10,$10,$10,$10,$10,$10,$10,$00,$00,$00,$00,$00,$00,$00,$00   ;94892B;
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08   ;94893B;
    db $10,$10,$10,$10,$10,$10,$10,$10,$08,$08,$08,$08,$08,$08,$08,$08   ;94894B;
    db $08,$08,$08,$08,$08,$08,$08,$08,$00,$00,$00,$00,$00,$00,$00,$00   ;94895B;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;94896B;
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$09,$0A,$0B,$0C,$0D,$0E,$0F,$10   ;94897B;
    db $10,$0E,$0C,$0A,$08,$06,$04,$02,$02,$04,$06,$08,$0A,$0C,$0E,$10   ;94898B;
    db $10,$10,$10,$10,$10,$10,$10,$10,$00,$00,$00,$00,$00,$00,$00,$00   ;94899B;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;9489AB;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;9489BB;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;9489CB;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;9489DB;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;9489EB;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;9489FB;
    db $0C,$0C,$0C,$0C,$08,$08,$08,$08,$04,$04,$04,$04,$00,$00,$00,$00   ;948A0B;
    db $0E,$0E,$0C,$0C,$0A,$0A,$08,$08,$06,$06,$04,$04,$02,$02,$00,$00   ;948A1B;
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10   ;948A2B;
    db $14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$10,$10,$10   ;948A3B;
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01   ;948A4B;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948A5B;
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$0F,$0E,$0D,$0C,$0B,$0A,$09   ;948A6B;
    db $08,$07,$06,$05,$04,$03,$02,$01,$00,$00,$00,$00,$00,$00,$00,$00   ;948A7B;
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$0E,$0C,$0A,$08,$06,$04,$02   ;948A8B;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$04,$06,$08,$0A,$0C,$0E   ;948A9B;
    db $10,$10,$10,$0F,$0F,$0F,$0E,$0E,$0E,$0D,$0D,$0D,$0C,$0C,$0C,$0B   ;948AAB;
    db $0B,$0B,$0A,$0A,$0A,$09,$09,$09,$08,$08,$08,$07,$07,$07,$06,$06   ;948ABB;
    db $06,$05,$05,$05,$04,$04,$04,$03,$03,$03,$02,$02,$02,$01,$01,$01   ;948ACB;
    db $14,$14,$14,$14,$14,$14,$14,$14,$10,$0E,$0C,$0A,$08,$06,$04,$02   ;948ADB;
    db $10,$0E,$0C,$0A,$08,$06,$04,$02,$00,$00,$00,$00,$00,$00,$00,$00   ;948AEB;
    db $14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$0F,$0C,$09,$06,$03   ;948AFB;
    db $14,$14,$14,$14,$14,$14,$0E,$0B,$08,$05,$02,$00,$00,$00,$00,$00   ;948B0B;
    db $10,$0D,$0A,$07,$04,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948B1B;

SlopeDefinitions_SlopeTopXOffsetByYPixel:
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08   ;948B2B;
    db $10,$10,$10,$10,$10,$10,$10,$10,$00,$00,$00,$00,$00,$00,$00,$00   ;948B3B;
    db $10,$10,$10,$10,$10,$10,$10,$10,$08,$08,$08,$08,$08,$08,$08,$08   ;948B4B;
    db $08,$08,$08,$08,$08,$08,$08,$08,$00,$00,$00,$00,$00,$00,$00,$00   ;948B5B;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948B6B;
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$09,$0A,$0B,$0C,$0D,$0E,$0F,$10   ;948B7B;
    db $10,$0E,$0C,$0A,$08,$06,$04,$02,$02,$04,$06,$08,$0A,$0C,$0E,$10   ;948B8B;
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08   ;948B9B;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948BAB;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948BBB;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948BCB;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948BDB;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948BEB;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948BFB;
    db $0C,$0C,$0C,$0C,$08,$08,$08,$08,$04,$04,$04,$04,$00,$00,$00,$00   ;948C0B;
    db $0E,$0E,$0C,$0C,$0A,$0A,$08,$08,$06,$06,$04,$04,$02,$02,$00,$00   ;948C1B;
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10   ;948C2B;
    db $14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$10,$10,$10   ;948C3B;
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01   ;948C4B;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948C5B;
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$0F,$0E,$0D,$0C,$0B,$0A,$09   ;948C6B;
    db $08,$07,$06,$05,$04,$03,$02,$01,$00,$00,$00,$00,$00,$00,$00,$00   ;948C7B;
    db $10,$10,$0F,$0F,$0E,$0E,$0D,$0D,$0C,$0C,$0B,$0B,$0A,$0A,$09,$09   ;948C8B;
    db $08,$08,$07,$07,$06,$06,$05,$05,$04,$04,$03,$03,$02,$02,$01,$01   ;948C9B;
    db $10,$10,$10,$0F,$0F,$0F,$0E,$0E,$0E,$0D,$0D,$0D,$0C,$0C,$0C,$0B   ;948CAB;
    db $0B,$0B,$0A,$0A,$0A,$09,$09,$09,$08,$08,$08,$07,$07,$07,$06,$06   ;948CBB;
    db $06,$05,$05,$05,$04,$04,$04,$03,$03,$03,$02,$02,$02,$01,$01,$01   ;948CCB;
    db $14,$14,$14,$14,$14,$14,$14,$14,$10,$0E,$0C,$0A,$08,$06,$04,$02   ;948CDB;
    db $10,$0E,$0C,$0A,$08,$06,$04,$02,$00,$00,$00,$00,$00,$00,$00,$00   ;948CEB;
    db $14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$0F,$0C,$09,$06,$03   ;948CFB;
    db $14,$14,$14,$14,$14,$14,$0E,$0B,$08,$05,$02,$00,$00,$00,$00,$00   ;948D0B;
    db $10,$0D,$0A,$07,$04,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948D1B;

SamusBlockCollisionReaction_Horizontal_Slope_Square:
    ASL A                                                                ;948D2B;
    ASL A                                                                ;948D2C;
    STA.W $0DD4                                                          ;948D2D;
    LDA.L $7F6401,X                                                      ;948D30;
    ROL A                                                                ;948D34;
    ROL A                                                                ;948D35;
    ROL A                                                                ;948D36;
    AND.W #$0003                                                         ;948D37;
    STA.W $0DD6                                                          ;948D3A;
    LDA.B $20                                                            ;948D3D;
    AND.W #$0008                                                         ;948D3F;
    LSR A                                                                ;948D42;
    LSR A                                                                ;948D43;
    LSR A                                                                ;948D44;
    EOR.W $0DD6                                                          ;948D45;
    ADC.W $0DD4                                                          ;948D48;
    TAX                                                                  ;948D4B;
    LDA.B $1A                                                            ;948D4C;
    BNE .top                                                             ;948D4E;
    LDA.W $0AFA                                                          ;948D50;
    CLC                                                                  ;948D53;
    ADC.W $0B00                                                          ;948D54;
    DEC A                                                                ;948D57;
    AND.W #$0008                                                         ;948D58;
    BNE .checkBothHalves                                                 ;948D5B;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;948D5D;
    BMI .solid                                                           ;948D60;
    BRA .returnNoCollision                                               ;948D62;


.top:
    CMP.B $1C                                                            ;948D64;
    BNE .checkBothHalves                                                 ;948D66;
    LDA.W $0AFA                                                          ;948D68;
    SEC                                                                  ;948D6B;
    SBC.W $0B00                                                          ;948D6C;
    AND.W #$0008                                                         ;948D6F;
    BNE .checkBottomHalf                                                 ;948D72;

.checkBothHalves:
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;948D74;
    BMI .solid                                                           ;948D77;

.checkBottomHalf:
    TXA                                                                  ;948D79;
    EOR.W #$0002                                                         ;948D7A;
    TAX                                                                  ;948D7D;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;948D7E;
    BMI .solid                                                           ;948D81;

.returnNoCollision:
    CLC                                                                  ;948D83;
    RTS                                                                  ;948D84;


.solid:
    STZ.B $14                                                            ;948D85;
    LDA.B $20                                                            ;948D87;
    BIT.B $12                                                            ;948D89;
    BMI .negative12                                                      ;948D8B;
    AND.W #$FFF8                                                         ;948D8D;
    SEC                                                                  ;948D90;
    SBC.W $0AFE                                                          ;948D91;
    SBC.W $0AF6                                                          ;948D94;
    BPL .notMinimum                                                      ;948D97;
    LDA.W #$0000                                                         ;948D99;

.notMinimum:
    STA.B $12                                                            ;948D9C;
    LDA.W #$FFFF                                                         ;948D9E;
    STA.W $0AF8                                                          ;948DA1;
    SEC                                                                  ;948DA4;
    RTS                                                                  ;948DA5;


.negative12:
    ORA.W #$0007                                                         ;948DA6;
    SEC                                                                  ;948DA9;
    ADC.W $0AFE                                                          ;948DAA;
    SEC                                                                  ;948DAD;
    SBC.W $0AF6                                                          ;948DAE;
    BMI .notMin                                                          ;948DB1;
    LDA.W #$0000                                                         ;948DB3;

.notMin:
    STA.B $12                                                            ;948DB6;
    STZ.W $0AF8                                                          ;948DB8;
    SEC                                                                  ;948DBB;
    RTS                                                                  ;948DBC;


SamusBlockCollisionReaction_Vertical_Slope_Square:
    ASL A                                                                ;948DBD;
    ASL A                                                                ;948DBE;
    STA.W $0DD4                                                          ;948DBF;
    LDA.L $7F6401,X                                                      ;948DC2;
    ROL A                                                                ;948DC6;
    ROL A                                                                ;948DC7;
    ROL A                                                                ;948DC8;
    AND.W #$0003                                                         ;948DC9;
    STA.W $0DD6                                                          ;948DCC;
    LDA.B $20                                                            ;948DCF;
    AND.W #$0008                                                         ;948DD1;
    LSR A                                                                ;948DD4;
    LSR A                                                                ;948DD5;
    EOR.W $0DD6                                                          ;948DD6;
    ADC.W $0DD4                                                          ;948DD9;
    TAX                                                                  ;948DDC;
    LDA.B $1A                                                            ;948DDD;
    BNE .checkLeft                                                       ;948DDF;
    LDA.W $0AF6                                                          ;948DE1;
    CLC                                                                  ;948DE4;
    ADC.W $0AFE                                                          ;948DE5;
    DEC A                                                                ;948DE8;
    AND.W #$0008                                                         ;948DE9;
    BNE .checkBothHalves                                                 ;948DEC;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;948DEE;
    BMI .solid                                                           ;948DF1;
    BRA .returnNoCollision                                               ;948DF3;


.checkLeft:
    CMP.B $1C                                                            ;948DF5;
    BNE .checkBothHalves                                                 ;948DF7;
    LDA.W $0AF6                                                          ;948DF9;
    SEC                                                                  ;948DFC;
    SBC.W $0AFE                                                          ;948DFD;
    AND.W #$0008                                                         ;948E00;
    BNE .checkRightHalf                                                  ;948E03;

.checkBothHalves:
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;948E05;
    BMI .solid                                                           ;948E08;

.checkRightHalf:
    TXA                                                                  ;948E0A;
    EOR.W #$0001                                                         ;948E0B;
    TAX                                                                  ;948E0E;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;948E0F;
    BMI .solid                                                           ;948E12;

.returnNoCollision:
    CLC                                                                  ;948E14;
    RTS                                                                  ;948E15;


.solid:
    STZ.B $14                                                            ;948E16;
    LDA.B $20                                                            ;948E18;
    BIT.B $12                                                            ;948E1A;
    BMI .negative12                                                      ;948E1C;
    AND.W #$FFF8                                                         ;948E1E;
    SEC                                                                  ;948E21;
    SBC.W $0B00                                                          ;948E22;
    SBC.W $0AFA                                                          ;948E25;
    BPL .notMin                                                          ;948E28;
    LDA.W #$0000                                                         ;948E2A;

.notMin:
    STA.B $12                                                            ;948E2D;
    LDA.W #$FFFF                                                         ;948E2F;
    STA.W $0AFC                                                          ;948E32;
    LDA.W #$0001                                                         ;948E35;
    STA.W $0DBA                                                          ;948E38;
    SEC                                                                  ;948E3B;
    RTS                                                                  ;948E3C;


.negative12:
    ORA.W #$0007                                                         ;948E3D;
    SEC                                                                  ;948E40;
    ADC.W $0B00                                                          ;948E41;
    SEC                                                                  ;948E44;
    SBC.W $0AFA                                                          ;948E45;
    BMI .notMinimum                                                      ;948E48;
    LDA.W #$0000                                                         ;948E4A;

.notMinimum:
    STA.B $12                                                            ;948E4D;
    STZ.W $0AFC                                                          ;948E4F;
    SEC                                                                  ;948E52;
    RTS                                                                  ;948E53;


SquareSlopeDefinitions_Bank94:
    db $00,$00,$80,$80,$00,$80,$00,$80,$00,$00,$00,$80,$00,$80,$80,$80   ;948E54;
    db $80,$80,$80,$80                                                   ;948E64;

UNUSED_DetermineSamusSuitPaletteIndex_948E68:
    LDY.W #$0004                                                         ;948E68;
    LDA.W $09A2                                                          ;948E6B;
    BIT.W #$0020                                                         ;948E6E;
    BNE .return                                                          ;948E71;
    DEY                                                                  ;948E73;
    DEY                                                                  ;948E74;
    BIT.W #$0001                                                         ;948E75;
    BNE .return                                                          ;948E78;
    DEY                                                                  ;948E7A;
    DEY                                                                  ;948E7B;

.return:
    RTS                                                                  ;948E7C;


CLCRTS_948E7D:
    CLC                                                                  ;948E7D;
    RTS                                                                  ;948E7E;


CLCRTS_948E7F:
    CLC                                                                  ;948E7F;
    RTS                                                                  ;948E80;


CLCRTS_948E81:
    CLC                                                                  ;948E81;
    RTS                                                                  ;948E82;


SamusBlockCollisionReaction_SpikeBlock_BTS0_GenericSpike:
    LDA.W $079F                                                          ;948E83;
    CMP.W #$0003                                                         ;948E86;
    BNE .notWreckedShip                                                  ;948E89;
    LDA.W #$0001                                                         ;948E8B;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;948E8E;
    BCC .return                                                          ;948E92;

.notWreckedShip:
    LDA.W $18A8                                                          ;948E94;
    BNE .return                                                          ;948E97;
    LDA.W #$003C                                                         ;948E99;
    STA.W $18A8                                                          ;948E9C;
    LDA.W #$000A                                                         ;948E9F;
    STA.W $18AA                                                          ;948EA2;
    LDA.W $0A4E                                                          ;948EA5;
    CLC                                                                  ;948EA8;
    ADC.W #$0000                                                         ;948EA9;
    STA.W $0A4E                                                          ;948EAC;
    LDA.W $0A50                                                          ;948EAF;
    ADC.W #$003C                                                         ;948EB2;
    STA.W $0A50                                                          ;948EB5;
    LDA.W $0A1E                                                          ;948EB8;
    EOR.W #$000C                                                         ;948EBB;
    BIT.W #$0008                                                         ;948EBE;
    BEQ .left                                                            ;948EC1;
    LDA.W #$0001                                                         ;948EC3;
    STA.W $0A54                                                          ;948EC6;
    BRA .return                                                          ;948EC9;


.left:
    STZ.W $0A54                                                          ;948ECB;

.return:
    RTS                                                                  ;948ECE;


SamusBlockCollisionReaction_SpikeBlock_BTS1_KraidsLairSpike:
    LDA.W $18A8                                                          ;948ECF;
    BNE .return                                                          ;948ED2;
    LDA.W #$003C                                                         ;948ED4;
    STA.W $18A8                                                          ;948ED7;
    LDA.W #$000A                                                         ;948EDA;
    STA.W $18AA                                                          ;948EDD;
    LDA.W $0A4E                                                          ;948EE0;
    CLC                                                                  ;948EE3;
    ADC.W #$0000                                                         ;948EE4;
    STA.W $0A4E                                                          ;948EE7;
    LDA.W $0A50                                                          ;948EEA;
    ADC.W #$0010                                                         ;948EED;
    STA.W $0A50                                                          ;948EF0;
    LDA.W $0A1E                                                          ;948EF3;
    EOR.W #$000C                                                         ;948EF6;
    BIT.W #$0008                                                         ;948EF9;
    BEQ .left                                                            ;948EFC;
    LDA.W #$0001                                                         ;948EFE;
    STA.W $0A54                                                          ;948F01;
    BRA .return                                                          ;948F04;


.left:
    STZ.W $0A54                                                          ;948F06;

.return:
    RTS                                                                  ;948F09;


SamusBlockCollisionReact_SpikeBlock_BTS3_DraygonBrokenTurret:
    LDA.W $18A8                                                          ;948F0A;
    BNE .return                                                          ;948F0D;
    LDA.W #$003C                                                         ;948F0F;
    STA.W $18A8                                                          ;948F12;
    LDA.W #$000A                                                         ;948F15;
    STA.W $18AA                                                          ;948F18;
    LDA.W $0A4E                                                          ;948F1B;
    CLC                                                                  ;948F1E;
    ADC.W #$0000                                                         ;948F1F;
    STA.W $0A4E                                                          ;948F22;
    LDA.W $0A50                                                          ;948F25;
    ADC.W #$0010                                                         ;948F28;
    STA.W $0A50                                                          ;948F2B;
    LDA.W $0A1E                                                          ;948F2E;
    EOR.W #$000C                                                         ;948F31;
    BIT.W #$0008                                                         ;948F34;
    BEQ .left                                                            ;948F37;
    LDA.W #$0001                                                         ;948F39;
    STA.W $0A54                                                          ;948F3C;
    BRA .return                                                          ;948F3F;


.left:
    STZ.W $0A54                                                          ;948F41;

.return:
    RTS                                                                  ;948F44;


SECRTS_948F45:
    SEC                                                                  ;948F45;
    RTS                                                                  ;948F46;


CLCRTS_948F47:
    CLC                                                                  ;948F47;
    RTS                                                                  ;948F48;


SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple:
    STZ.B $14                                                            ;948F49;
    LDA.B $20                                                            ;948F4B;
    BIT.B $12                                                            ;948F4D;
    BMI .negative12                                                      ;948F4F;
    AND.W #$FFF0                                                         ;948F51;
    SEC                                                                  ;948F54;
    SBC.W $0AFE                                                          ;948F55;
    SEC                                                                  ;948F58;
    SBC.W $0AF6                                                          ;948F59;
    BPL .leftNotMin                                                      ;948F5C;
    LDA.W #$0000                                                         ;948F5E;

.leftNotMin:
    STA.B $12                                                            ;948F61;
    LDA.W #$FFFF                                                         ;948F63;
    STA.W $0AF8                                                          ;948F66;
    SEC                                                                  ;948F69;
    RTS                                                                  ;948F6A;


.negative12:
    ORA.W #$000F                                                         ;948F6B;
    SEC                                                                  ;948F6E;
    ADC.W $0AFE                                                          ;948F6F;
    SEC                                                                  ;948F72;
    SBC.W $0AF6                                                          ;948F73;
    BMI .rightNotMin                                                     ;948F76;
    LDA.W #$0000                                                         ;948F78;

.rightNotMin:
    STA.B $12                                                            ;948F7B;
    STZ.W $0AF8                                                          ;948F7D;
    SEC                                                                  ;948F80;
    RTS                                                                  ;948F81;


SamusBlockCollisionReaction_Vertical_SolidShootableGrapple:
    STZ.B $14                                                            ;948F82;
    LDA.B $20                                                            ;948F84;
    BIT.B $12                                                            ;948F86;
    BMI .negative12                                                      ;948F88;
    AND.W #$FFF0                                                         ;948F8A;
    SEC                                                                  ;948F8D;
    SBC.W $0B00                                                          ;948F8E;
    SEC                                                                  ;948F91;
    SBC.W $0AFA                                                          ;948F92;
    BPL .bottomNotMin                                                    ;948F95;
    LDA.W #$0000                                                         ;948F97;

.bottomNotMin:
    STA.B $12                                                            ;948F9A;
    LDA.W #$FFFF                                                         ;948F9C;
    STA.W $0AFC                                                          ;948F9F;
    SEC                                                                  ;948FA2;
    RTS                                                                  ;948FA3;


.negative12:
    ORA.W #$000F                                                         ;948FA4;
    SEC                                                                  ;948FA7;
    ADC.W $0B00                                                          ;948FA8;
    SEC                                                                  ;948FAB;
    SBC.W $0AFA                                                          ;948FAC;
    BMI .topNotMin                                                       ;948FAF;
    LDA.W #$0000                                                         ;948FB1;

.topNotMin:
    STA.B $12                                                            ;948FB4;
    STZ.W $0AFC                                                          ;948FB6;
    SEC                                                                  ;948FB9;
    RTS                                                                  ;948FBA;


SamusBlockCollisionReaction_Horizontal_Slope:
    LDX.W $0DC4                                                          ;948FBB;
    LDA.L $7F6402,X                                                      ;948FBE;
    AND.W #$001F                                                         ;948FC2;
    CMP.W #$0005                                                         ;948FC5;
    BCC .gotoSquare                                                      ;948FC8;
    LDA.L $7F6402,X                                                      ;948FCA;
    AND.W #$00FF                                                         ;948FCE;
    STA.W $1E77                                                          ;948FD1;
    JMP.W SamusBlockCollisionDetection_Horizontal_Slope_NonSquare        ;948FD4;


.gotoSquare:
    JMP.W SamusBlockCollisionReaction_Horizontal_Slope_Square            ;948FD7;


SamusBlockCollisionReaction_Vertical_Slope:
    LDX.W $0DC4                                                          ;948FDA;
    LDA.L $7F6402,X                                                      ;948FDD;
    AND.W #$001F                                                         ;948FE1;
    CMP.W #$0005                                                         ;948FE4;
    BCC .gotoSquare                                                      ;948FE7;
    LDA.L $7F6402,X                                                      ;948FE9;
    STA.W $1E77                                                          ;948FED;
    JMP.W SamusBlockCollisionReaction_Vertical_Slope_NonSquare           ;948FF0;


.gotoSquare:
    JMP.W SamusBlockCollisionReaction_Vertical_Slope_Square              ;948FF3;


SamusBlockCollisionReaction_Vertical_SpikeAir_JumpTable:
    dw CLCRTS_948E81                                                     ;948FF6;
    dw CLCRTS_948E81                                                     ;948FF8;
    dw CLCRTS_948E81                                                     ;948FFA;
    dw CLCRTS_948E81                                                     ;948FFC;
    dw CLCRTS_948E81                                                     ;948FFE;
    dw CLCRTS_948E81                                                     ;949000;
    dw CLCRTS_948E81                                                     ;949002;
    dw CLCRTS_948E81                                                     ;949004;
    dw CLCRTS_948E81                                                     ;949006;
    dw CLCRTS_948E81                                                     ;949008;
    dw CLCRTS_948E81                                                     ;94900A;
    dw CLCRTS_948E81                                                     ;94900C;
    dw CLCRTS_948E81                                                     ;94900E;
    dw CLCRTS_948E81                                                     ;949010;
    dw CLCRTS_948E81                                                     ;949012;
    dw CLCRTS_948E81                                                     ;949014;
    dw CLCRTS_948E81                                                     ;949016;

CLCRTS_949018:
    CLC                                                                  ;949018;
    RTS                                                                  ;949019;


SamusBlockCollisionReaction_Vertical_SpikeAir:
    LDX.W $0DC4                                                          ;94901A;
    LDA.L $7F6402,X                                                      ;94901D;
    AND.W #$00FF                                                         ;949021;
    ASL A                                                                ;949024;
    TAX                                                                  ;949025;
    JSR.W (SamusBlockCollisionReaction_Vertical_SpikeAir_JumpTable,X)    ;949026;
    CLC                                                                  ;949029;
    RTS                                                                  ;94902A;


SamusBlockCollisionReaction_Vertical_SpikeBlock_JumpTable:
    dw SamusBlockCollisionReaction_SpikeBlock_BTS0_GenericSpike          ;94902B;
    dw SamusBlockCollisionReaction_SpikeBlock_BTS1_KraidsLairSpike       ;94902D;
    dw SECRTS_948F45                                                     ;94902F;
    dw SamusBlockCollisionReact_SpikeBlock_BTS3_DraygonBrokenTurret      ;949031;
    dw SECRTS_948F45                                                     ;949033;
    dw SECRTS_948F45                                                     ;949035;
    dw SECRTS_948F45                                                     ;949037;
    dw SECRTS_948F45                                                     ;949039;
    dw SECRTS_948F45                                                     ;94903B;
    dw SECRTS_948F45                                                     ;94903D;
    dw SECRTS_948F45                                                     ;94903F;
    dw SECRTS_948F45                                                     ;949041;
    dw SECRTS_948F45                                                     ;949043;
    dw SECRTS_948F45                                                     ;949045;
    dw SECRTS_948F45                                                     ;949047;
    dw SECRTS_948F45                                                     ;949049;

SamusBlockCollisionReaction_Horizontal_SpikeBlock:
    LDX.W $0DC4                                                          ;94904B;
    LDA.L $7F6402,X                                                      ;94904E;
    ASL A                                                                ;949052;
    AND.W #$01FF                                                         ;949053;
    TAX                                                                  ;949056;
    JSR.W (SamusBlockCollisionReaction_Vertical_SpikeBlock_JumpTable,X)  ;949057;
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple   ;94905A;


SamusBlockCollisionReaction_Vertical_SpikeBlock:
    LDX.W $0DC4                                                          ;94905D;
    LDA.L $7F6402,X                                                      ;949060;
    ASL A                                                                ;949064;
    AND.W #$01FF                                                         ;949065;
    TAX                                                                  ;949068;
    JSR.W (SamusBlockCollisionReaction_Vertical_SpikeBlock_JumpTable,X)  ;949069;
    JMP.W SamusBlockCollisionReaction_Vertical_SolidShootableGrapple     ;94906C;


SamusBlockCollisionReaction_Horizontal_SpecialAir:
    LDX.W $0DC4                                                          ;94906F;
    LDA.L $7F6401,X                                                      ;949072;
    AND.W #$FF00                                                         ;949076;
    XBA                                                                  ;949079;
    BMI .blockBTSMSB                                                     ;94907A;
    ASL A                                                                ;94907C;
    TAX                                                                  ;94907D;
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_areaIndependent,X ;94907E;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949081;
    CLC                                                                  ;949085;
    RTS                                                                  ;949086;


.blockBTSMSB:
    AND.W #$007F                                                         ;949087;
    ASL A                                                                ;94908A;
    TAY                                                                  ;94908B;
    LDA.W $079F                                                          ;94908C;
    ASL A                                                                ;94908F;
    TAX                                                                  ;949090;
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_AirPointers,X     ;949091;
    STA.B $22                                                            ;949094;
    LDA.B ($22),Y                                                        ;949096;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949098;
    RTS                                                                  ;94909C;


SamusBlockCollisionReaction_Vertical_SpecialAir:
    LDX.W $0DC4                                                          ;94909D;
    LDA.L $7F6401,X                                                      ;9490A0;
    AND.W #$FF00                                                         ;9490A4;
    XBA                                                                  ;9490A7;
    BMI .blockBTSMSB                                                     ;9490A8;
    ASL A                                                                ;9490AA;
    TAX                                                                  ;9490AB;
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_areaIndependent,X ;9490AC;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;9490AF;
    CLC                                                                  ;9490B3;
    RTS                                                                  ;9490B4;


.blockBTSMSB:
    AND.W #$007F                                                         ;9490B5;
    ASL A                                                                ;9490B8;
    TAY                                                                  ;9490B9;
    LDA.W $079F                                                          ;9490BA;
    ASL A                                                                ;9490BD;
    TAX                                                                  ;9490BE;
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_AirPointers,X     ;9490BF;
    STA.B $22                                                            ;9490C2;
    LDA.B ($22),Y                                                        ;9490C4;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;9490C6;
    RTS                                                                  ;9490CA;


SamusBlockCollisionReaction_Horizontal_SpecialBlock:
    LDX.W $0DC4                                                          ;9490CB;
    LDA.L $7F6401,X                                                      ;9490CE;
    AND.W #$FF00                                                         ;9490D2;
    XBA                                                                  ;9490D5;
    BMI .areaDependent                                                   ;9490D6;
    ASL A                                                                ;9490D8;
    TAX                                                                  ;9490D9;
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_areaIndependent,X ;9490DA;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;9490DD;
    BCC .return                                                          ;9490E1;
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple   ;9490E3;


.return:
    RTS                                                                  ;9490E6;


.areaDependent:
    AND.W #$007F                                                         ;9490E7;
    ASL A                                                                ;9490EA;
    TAY                                                                  ;9490EB;
    LDA.W $079F                                                          ;9490EC;
    ASL A                                                                ;9490EF;
    TAX                                                                  ;9490F0;
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_BlockPointers,X   ;9490F1;
    STA.B $22                                                            ;9490F4;
    LDA.B ($22),Y                                                        ;9490F6;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;9490F8;
    BCC ..return                                                         ;9490FC;
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple   ;9490FE;


..return:
    RTS                                                                  ;949101;


SamusBlockCollisionReaction_Vertical_SpecialBlock:
    LDX.W $0DC4                                                          ;949102;
    LDA.L $7F6401,X                                                      ;949105;
    AND.W #$FF00                                                         ;949109;
    XBA                                                                  ;94910C;
    BMI .areaDependent                                                   ;94910D;
    ASL A                                                                ;94910F;
    TAX                                                                  ;949110;
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_areaIndependent,X ;949111;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949114;
    BCC .return                                                          ;949118;
    JMP.W SamusBlockCollisionReaction_Vertical_SolidShootableGrapple     ;94911A;


.return:
    RTS                                                                  ;94911D;


.areaDependent:
    AND.W #$007F                                                         ;94911E;
    ASL A                                                                ;949121;
    TAY                                                                  ;949122;
    LDA.W $079F                                                          ;949123;
    ASL A                                                                ;949126;
    TAX                                                                  ;949127;
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_BlockPointers,X   ;949128;
    STA.B $22                                                            ;94912B;
    LDA.B ($22),Y                                                        ;94912D;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;94912F;
    BCC ..return                                                         ;949133;
    JMP.W SamusBlockCollisionReaction_Vertical_SolidShootableGrapple     ;949135;


..return:
    RTS                                                                  ;949138;


SamusBlockCollisionReaction_Special_PLMTable_areaIndependent:
    dw PLMEntries_Collision_1x1RespawningCrumbleBlock                    ;949139;
    dw PLMEntries_Collision_2x1RespawningCrumbleBlock                    ;94913B;
    dw PLMEntries_Collision_1x2RespawningCrumbleBlock                    ;94913D;
    dw PLMEntries_Collision_2x2RespawningCrumbleBlock                    ;94913F;
    dw PLMEntries_Collision_1x1CrumbleBlock                              ;949141;
    dw PLMEntries_Collision_2x1CrumbleBlock                              ;949143;
    dw PLMEntries_Collision_1x2CrumbleBlock                              ;949145;
    dw PLMEntries_Collision_2x2CrumbleBlock                              ;949147;
    dw PLMEntries_nothing                                                ;949149;
    dw PLMEntries_nothing                                                ;94914B;
    dw PLMEntries_nothing                                                ;94914D;
    dw PLMEntries_nothing                                                ;94914F;
    dw PLMEntries_nothing                                                ;949151;
    dw PLMEntries_nothing                                                ;949153;
    dw PLMEntries_Collision_RespawningSpeedBoostBlock                    ;949155;
    dw PLMEntries_Collision_SpeedBoostBlock                              ;949157;
    dw PLMEntries_nothing                                                ;949159;
    dw PLMEntries_nothing                                                ;94915B;
    dw PLMEntries_nothing                                                ;94915D;
    dw PLMEntries_nothing                                                ;94915F;
    dw PLMEntries_nothing                                                ;949161;
    dw PLMEntries_nothing                                                ;949163;
    dw PLMEntries_nothing                                                ;949165;
    dw PLMEntries_nothing                                                ;949167;
    dw PLMEntries_nothing                                                ;949169;
    dw PLMEntries_nothing                                                ;94916B;
    dw PLMEntries_nothing                                                ;94916D;
    dw PLMEntries_nothing                                                ;94916F;
    dw PLMEntries_nothing                                                ;949171;
    dw PLMEntries_nothing                                                ;949173;
    dw PLMEntries_nothing                                                ;949175;
    dw PLMEntries_nothing                                                ;949177;
    dw PLMEntries_nothing                                                ;949179;
    dw PLMEntries_nothing                                                ;94917B;
    dw PLMEntries_nothing                                                ;94917D;
    dw PLMEntries_nothing                                                ;94917F;
    dw PLMEntries_nothing                                                ;949181;
    dw PLMEntries_nothing                                                ;949183;
    dw PLMEntries_nothing                                                ;949185;
    dw PLMEntries_nothing                                                ;949187;
    dw PLMEntries_nothing                                                ;949189;
    dw PLMEntries_nothing                                                ;94918B;
    dw PLMEntries_nothing                                                ;94918D;
    dw PLMEntries_nothing                                                ;94918F;
    dw PLMEntries_nothing                                                ;949191;
    dw PLMEntries_nothing                                                ;949193;
    dw PLMEntries_nothing                                                ;949195;
    dw PLMEntries_nothing                                                ;949197;
    dw PLMEntries_nothing                                                ;949199;
    dw PLMEntries_nothing                                                ;94919B;
    dw PLMEntries_nothing                                                ;94919D;
    dw PLMEntries_nothing                                                ;94919F;
    dw PLMEntries_nothing                                                ;9491A1;
    dw PLMEntries_nothing                                                ;9491A3;
    dw PLMEntries_nothing                                                ;9491A5;
    dw PLMEntries_nothing                                                ;9491A7;
    dw PLMEntries_nothing                                                ;9491A9;
    dw PLMEntries_nothing                                                ;9491AB;
    dw PLMEntries_nothing                                                ;9491AD;
    dw PLMEntries_nothing                                                ;9491AF;
    dw PLMEntries_nothing                                                ;9491B1;
    dw PLMEntries_nothing                                                ;9491B3;
    dw PLMEntries_nothing                                                ;9491B5;
    dw PLMEntries_nothing                                                ;9491B7;
    dw PLMEntries_nothing                                                ;9491B9;
    dw PLMEntries_nothing                                                ;9491BB;
    dw PLMEntries_nothing                                                ;9491BD;
    dw PLMEntries_nothing                                                ;9491BF;
    dw PLMEntries_genericShotTriggerForAPLM                              ;9491C1;
    dw PLMEntries_ItemCollisionDetection                                 ;9491C3;
    dw PLMEntries_scrollPLMTrigger                                       ;9491C5;
    dw PLMEntries_mapStationRightAccess                                  ;9491C7;
    dw PLMEntries_mapStationLeftAccess                                   ;9491C9;
    dw PLMEntries_energyStationRightAccess                               ;9491CB;
    dw PLMEntries_energyStationLeftAccess                                ;9491CD;
    dw PLMEntries_missileStationRightAccess                              ;9491CF;
    dw PLMEntries_missileStationLeftAccess                               ;9491D1;
    dw PLMEntries_saveStationTrigger                                     ;9491D3;
    dw PLMEntries_nothing                                                ;9491D5;
    dw PLMEntries_nothing                                                ;9491D7;

SamusBlockCollisionReaction_Special_PLMTable_crateria:
    dw PLMEntries_nothing                                                ;9491D9;
    dw PLMEntries_nothing                                                ;9491DB;
    dw PLMEntries_nothing                                                ;9491DD;
    dw PLMEntries_nothing                                                ;9491DF;
    dw PLMEntries_nothing                                                ;9491E1;
    dw PLMEntries_nothing                                                ;9491E3;
    dw PLMEntries_nothing                                                ;9491E5;
    dw PLMEntries_nothing                                                ;9491E7;
    dw PLMEntries_nothing                                                ;9491E9;
    dw PLMEntries_nothing                                                ;9491EB;
    dw PLMEntries_nothing                                                ;9491ED;
    dw PLMEntries_nothing                                                ;9491EF;
    dw PLMEntries_nothing                                                ;9491F1;
    dw PLMEntries_nothing                                                ;9491F3;
    dw PLMEntries_nothing                                                ;9491F5;
    dw PLMEntries_nothing                                                ;9491F7;

SamusBlockCollisionReaction_Special_PLMTable_brinstar:
    dw PLMEntries_collisionReactionClearCarry                            ;9491F9;
    dw PLMEntries_collisionReactionClearCarry                            ;9491FB;
    dw PLMEntries_Collision_BTS82                                        ;9491FD;
    dw PLMEntries_Collision_BTS83                                        ;9491FF;
    dw PLMEntries_Collision_DachoraRespawningSpeedBoostBlock             ;949201;
    dw PLMEntries_Collision_SpeedBoostBlock                              ;949203;
    dw PLMEntries_nothing                                                ;949205;
    dw PLMEntries_nothing                                                ;949207;
    dw PLMEntries_nothing                                                ;949209;
    dw PLMEntries_nothing                                                ;94920B;
    dw PLMEntries_nothing                                                ;94920D;
    dw PLMEntries_nothing                                                ;94920F;
    dw PLMEntries_nothing                                                ;949211;
    dw PLMEntries_nothing                                                ;949213;
    dw PLMEntries_nothing                                                ;949215;
    dw PLMEntries_nothing                                                ;949217;

SamusBlockCollisionReaction_Special_PLMTable_norfair:
    dw PLMEntries_nothing                                                ;949219;
    dw PLMEntries_nothing                                                ;94921B;
    dw PLMEntries_nothing                                                ;94921D;
    dw PLMEntries_Collision_LowerNorfairChozoHandCheck                   ;94921F;
    dw PLMEntries_nothing                                                ;949221;
    dw PLMEntries_nothing                                                ;949223;
    dw PLMEntries_nothing                                                ;949225;
    dw PLMEntries_nothing                                                ;949227;
    dw PLMEntries_nothing                                                ;949229;
    dw PLMEntries_nothing                                                ;94922B;
    dw PLMEntries_nothing                                                ;94922D;
    dw PLMEntries_nothing                                                ;94922F;
    dw PLMEntries_nothing                                                ;949231;
    dw PLMEntries_nothing                                                ;949233;
    dw PLMEntries_nothing                                                ;949235;
    dw PLMEntries_nothing                                                ;949237;

SamusBlockCollisionReaction_Special_PLMTable_wreckedShip:
    dw PLMEntries_Collision_WreckedShipChozoHandCheck                    ;949239;
    dw PLMEntries_nothing                                                ;94923B;
    dw PLMEntries_nothing                                                ;94923D;
    dw PLMEntries_nothing                                                ;94923F;
    dw PLMEntries_nothing                                                ;949241;
    dw PLMEntries_nothing                                                ;949243;
    dw PLMEntries_nothing                                                ;949245;
    dw PLMEntries_nothing                                                ;949247;
    dw PLMEntries_nothing                                                ;949249;
    dw PLMEntries_nothing                                                ;94924B;
    dw PLMEntries_nothing                                                ;94924D;
    dw PLMEntries_nothing                                                ;94924F;
    dw PLMEntries_nothing                                                ;949251;
    dw PLMEntries_nothing                                                ;949253;
    dw PLMEntries_nothing                                                ;949255;
    dw PLMEntries_nothing                                                ;949257;

SamusBlockCollisionReaction_Special_PLMTable_maridia:
    dw PLMEntries_collisionReactionQuicksandSurface                      ;949259;
    dw PLMEntries_collisionReactionQuicksandSurface                      ;94925B;
    dw PLMEntries_collisionReactionQuicksandSurface                      ;94925D;
    dw PLMEntries_collisionReactionSubmergingQuicksand                   ;94925F;
    dw PLMEntries_collisionReactionSandFallsSlow                         ;949261;
    dw PLMEntries_collisionReactionSandFallsFast                         ;949263;
    dw PLMEntries_nothing                                                ;949265;
    dw PLMEntries_nothing                                                ;949267;
    dw PLMEntries_nothing                                                ;949269;
    dw PLMEntries_nothing                                                ;94926B;
    dw PLMEntries_nothing                                                ;94926D;
    dw PLMEntries_nothing                                                ;94926F;
    dw PLMEntries_nothing                                                ;949271;
    dw PLMEntries_nothing                                                ;949273;
    dw PLMEntries_nothing                                                ;949275;
    dw PLMEntries_nothing                                                ;949277;

SamusBlockCollisionReaction_Special_PLMTable_tourian:
    dw PLMEntries_nothing                                                ;949279;
    dw PLMEntries_nothing                                                ;94927B;
    dw PLMEntries_nothing                                                ;94927D;
    dw PLMEntries_nothing                                                ;94927F;
    dw PLMEntries_nothing                                                ;949281;
    dw PLMEntries_nothing                                                ;949283;
    dw PLMEntries_nothing                                                ;949285;
    dw PLMEntries_nothing                                                ;949287;
    dw PLMEntries_nothing                                                ;949289;
    dw PLMEntries_nothing                                                ;94928B;
    dw PLMEntries_nothing                                                ;94928D;
    dw PLMEntries_nothing                                                ;94928F;
    dw PLMEntries_nothing                                                ;949291;
    dw PLMEntries_nothing                                                ;949293;
    dw PLMEntries_nothing                                                ;949295;
    dw PLMEntries_nothing                                                ;949297;

SamusBlockCollisionReaction_Special_PLMTable_colony:
    dw PLMEntries_nothing                                                ;949299;
    dw PLMEntries_nothing                                                ;94929B;
    dw PLMEntries_nothing                                                ;94929D;
    dw PLMEntries_nothing                                                ;94929F;
    dw PLMEntries_nothing                                                ;9492A1;
    dw PLMEntries_nothing                                                ;9492A3;
    dw PLMEntries_nothing                                                ;9492A5;
    dw PLMEntries_nothing                                                ;9492A7;
    dw PLMEntries_nothing                                                ;9492A9;
    dw PLMEntries_nothing                                                ;9492AB;
    dw PLMEntries_nothing                                                ;9492AD;
    dw PLMEntries_nothing                                                ;9492AF;
    dw PLMEntries_nothing                                                ;9492B1;
    dw PLMEntries_nothing                                                ;9492B3;
    dw PLMEntries_nothing                                                ;9492B5;
    dw PLMEntries_nothing                                                ;9492B7;

SamusBlockCollisionReaction_Special_PLMTable_debug:
    dw PLMEntries_nothing                                                ;9492B9;
    dw PLMEntries_nothing                                                ;9492BB;
    dw PLMEntries_nothing                                                ;9492BD;
    dw PLMEntries_nothing                                                ;9492BF;
    dw PLMEntries_nothing                                                ;9492C1;
    dw PLMEntries_nothing                                                ;9492C3;
    dw PLMEntries_nothing                                                ;9492C5;
    dw PLMEntries_nothing                                                ;9492C7;
    dw PLMEntries_nothing                                                ;9492C9;
    dw PLMEntries_nothing                                                ;9492CB;
    dw PLMEntries_nothing                                                ;9492CD;
    dw PLMEntries_nothing                                                ;9492CF;
    dw PLMEntries_nothing                                                ;9492D1;
    dw PLMEntries_nothing                                                ;9492D3;
    dw PLMEntries_nothing                                                ;9492D5;
    dw PLMEntries_nothing                                                ;9492D7;

SamusBlockCollisionReaction_Special_PLMTable_AirPointers:
    dw SamusBlockCollisionReaction_Special_PLMTable_crateria             ;9492D9;
    dw SamusBlockCollisionReaction_Special_PLMTable_brinstar             ;9492DB;
    dw SamusBlockCollisionReaction_Special_PLMTable_norfair              ;9492DD;
    dw SamusBlockCollisionReaction_Special_PLMTable_wreckedShip          ;9492DF;
    dw SamusBlockCollisionReaction_Special_PLMTable_maridia              ;9492E1;
    dw SamusBlockCollisionReaction_Special_PLMTable_tourian              ;9492E3;
    dw SamusBlockCollisionReaction_Special_PLMTable_colony               ;9492E5;
    dw SamusBlockCollisionReaction_Special_PLMTable_debug                ;9492E7;

SamusBlockCollisionReaction_Special_PLMTable_BlockPointers:
    dw SamusBlockCollisionReaction_Special_PLMTable_crateria             ;9492E9;
    dw SamusBlockCollisionReaction_Special_PLMTable_brinstar             ;9492EB;
    dw SamusBlockCollisionReaction_Special_PLMTable_norfair              ;9492ED;
    dw SamusBlockCollisionReaction_Special_PLMTable_wreckedShip          ;9492EF;
    dw SamusBlockCollisionReaction_Special_PLMTable_maridia              ;9492F1;
    dw SamusBlockCollisionReaction_Special_PLMTable_tourian              ;9492F3;
    dw SamusBlockCollisionReaction_Special_PLMTable_colony               ;9492F5;
    dw SamusBlockCollisionReaction_Special_PLMTable_debug                ;9492F7;

SamusBlockCollisionReaction_Horizontal_BombableAir:
    LDX.W $0DC4                                                          ;9492F9;
    LDA.L $7F6401,X                                                      ;9492FC;
    AND.W #$FF00                                                         ;949300;
    XBA                                                                  ;949303;
    BMI .returnNoCollision                                               ;949304;
    ASL A                                                                ;949306;
    TAX                                                                  ;949307;
    LDA.W SamusBlockCollisionReaction_Bombable_PLMTable,X                ;949308;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;94930B;
    CLC                                                                  ;94930F;
    RTS                                                                  ;949310;


.returnNoCollision:
    CLC                                                                  ;949311;
    RTS                                                                  ;949312;


SamusBlockCollisionReaction_Vertical_BombableAir:
    LDX.W $0DC4                                                          ;949313;
    LDA.L $7F6401,X                                                      ;949316;
    AND.W #$FF00                                                         ;94931A;
    XBA                                                                  ;94931D;
    BMI .returnNoCollision                                               ;94931E;
    ASL A                                                                ;949320;
    TAX                                                                  ;949321;
    LDA.W SamusBlockCollisionReaction_Bombable_PLMTable,X                ;949322;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949325;
    CLC                                                                  ;949329;
    RTS                                                                  ;94932A;


.returnNoCollision:
    CLC                                                                  ;94932B;
    RTS                                                                  ;94932C;


SamusBlockCollisionReaction_Horizontal_BombBlock:
    LDX.W $0DC4                                                          ;94932D;
    LDA.L $7F6401,X                                                      ;949330;
    AND.W #$FF00                                                         ;949334;
    XBA                                                                  ;949337;
    BMI .gotoSolidShootableGrapple                                       ;949338;
    ASL A                                                                ;94933A;
    TAX                                                                  ;94933B;
    LDA.W SamusBlockCollisionReaction_Bombable_PLMTable,X                ;94933C;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;94933F;
    BCC .return                                                          ;949343;
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple   ;949345;


.gotoSolidShootableGrapple:
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple   ;949348;


.return:
    RTS                                                                  ;94934B;


SamusBlockCollisionReaction_Vertical_BombBlock:
    LDX.W $0DC4                                                          ;94934C;
    LDA.L $7F6401,X                                                      ;94934F;
    AND.W #$FF00                                                         ;949353;
    XBA                                                                  ;949356;
    BMI .gotoSolidShootableGrapple                                       ;949357;
    ASL A                                                                ;949359;
    TAX                                                                  ;94935A;
    LDA.W SamusBlockCollisionReaction_Bombable_PLMTable,X                ;94935B;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;94935E;
    BCC .return                                                          ;949362;
    JMP.W SamusBlockCollisionReaction_Vertical_SolidShootableGrapple     ;949364;


.gotoSolidShootableGrapple:
    JMP.W SamusBlockCollisionReaction_Vertical_SolidShootableGrapple     ;949367;


.return:
    RTS                                                                  ;94936A;


SamusBlockCollisionReaction_Bombable_PLMTable:
    dw PLMEntries_Collision_1x1RespawningBombBlock                       ;94936B;
    dw PLMEntries_Collision_2x1RespawningBombBlock                       ;94936D;
    dw PLMEntries_Collision_1x2RespawningBombBlock                       ;94936F;
    dw PLMEntries_Collision_2x2RespawningBombBlock                       ;949371;
    dw PLMEntries_Collision_1x1BombBlock                                 ;949373;
    dw PLMEntries_Collision_2x1BombBlock                                 ;949375;
    dw PLMEntries_Collision_1x2BombBlock                                 ;949377;
    dw PLMEntries_Collision_2x2BombBlock                                 ;949379;
    dw PLMEntries_nothing                                                ;94937B;
    dw PLMEntries_nothing                                                ;94937D;
    dw PLMEntries_nothing                                                ;94937F;
    dw PLMEntries_nothing                                                ;949381;
    dw PLMEntries_nothing                                                ;949383;
    dw PLMEntries_nothing                                                ;949385;
    dw PLMEntries_nothing                                                ;949387;
    dw PLMEntries_nothing                                                ;949389;

SamusBlockCollisionReaction_Horizontal_Door:
    LDA.W #DoorTransitionFunction_HandleElevator                         ;94938B;
    STA.W $099C                                                          ;94938E;
    LDX.W $0DC4                                                          ;949391;
    LDA.L $7F6401,X                                                      ;949394;
    AND.W #$FF00                                                         ;949398;
    XBA                                                                  ;94939B;
    STA.W $078F                                                          ;94939C;
    AND.W #$007F                                                         ;94939F;
    ASL A                                                                ;9493A2;
    ADC.W $07B5                                                          ;9493A3;
    TAX                                                                  ;9493A6;
    LDA.L $8F0000,X                                                      ;9493A7;
    TAX                                                                  ;9493AB;
    LDA.L $830000,X                                                      ;9493AC;
    BPL .notAPointer                                                     ;9493B0;
    STX.W $078D                                                          ;9493B2;
    LDA.W #$0009                                                         ;9493B5;
    STA.W $0998                                                          ;9493B8;
    CLC                                                                  ;9493BB;
    RTS                                                                  ;9493BC;


.notAPointer:
    LDA.W $0A1C                                                          ;9493BD;
    CMP.W #$0009                                                         ;9493C0;
    BCS .gotoSolidShootableGrapple                                       ;9493C3;
    LDA.W #$0001                                                         ;9493C5;
    STA.W $0E16                                                          ;9493C8;

.gotoSolidShootableGrapple:
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple   ;9493CB;


SamusBlockCollisionReaction_Vertical_Door:
    LDA.W #DoorTransitionFunction_HandleElevator                         ;9493CE;
    STA.W $099C                                                          ;9493D1;
    LDX.W $0DC4                                                          ;9493D4;
    LDA.L $7F6401,X                                                      ;9493D7;
    AND.W #$FF00                                                         ;9493DB;
    XBA                                                                  ;9493DE;
    STA.W $078F                                                          ;9493DF;
    AND.W #$007F                                                         ;9493E2;
    ASL A                                                                ;9493E5;
    ADC.W $07B5                                                          ;9493E6;
    TAX                                                                  ;9493E9;
    LDA.L $8F0000,X                                                      ;9493EA;
    TAX                                                                  ;9493EE;
    LDA.L $830000,X                                                      ;9493EF;
    BPL .notAPointer                                                     ;9493F3;
    STX.W $078D                                                          ;9493F5;
    LDA.W #$0009                                                         ;9493F8;
    STA.W $0998                                                          ;9493FB;
    CLC                                                                  ;9493FE;
    RTS                                                                  ;9493FF;


.notAPointer:
    LDA.W $0A1C                                                          ;949400;
    CMP.W #$0009                                                         ;949403;
    BCS .gotoSolidShootableGrapple                                       ;949406;
    LDA.W #$0001                                                         ;949408;
    STA.W $0E16                                                          ;94940B;

.gotoSolidShootableGrapple:
    JMP.W SamusBlockCollisionReaction_Vertical_SolidShootableGrapple     ;94940E;


BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt:
    LDX.W $0DC4                                                          ;949411;
    LDA.L $7F6402,X                                                      ;949414;
    AND.W #$00FF                                                         ;949418;
    BEQ .returnNoCollision                                               ;94941B;
    BIT.W #$0080                                                         ;94941D;
    BNE .highByte                                                        ;949420;
    AND.W #$00FF                                                         ;949422;
    BRA +                                                                ;949425;


.highByte:
    ORA.W #$FF00                                                         ;949427;

  + CLC                                                                  ;94942A;
    ADC.W $0DC4                                                          ;94942B;
    STA.W $0DC4                                                          ;94942E;
    ASL A                                                                ;949431;
    TAX                                                                  ;949432;
    LDA.L $7F0002,X                                                      ;949433;
    AND.W #$F000                                                         ;949437;
    XBA                                                                  ;94943A;
    LSR A                                                                ;94943B;
    LSR A                                                                ;94943C;
    LSR A                                                                ;94943D;
    TAX                                                                  ;94943E;
    PLA                                                                  ;94943F;
    SEC                                                                  ;949440;
    SBC.W #$0003                                                         ;949441;
    PHA                                                                  ;949444;

.returnNoCollision:
    CLC                                                                  ;949445;
    RTS                                                                  ;949446;


BlockShotBombedGrappledCollisionInsideReaction_VerticalExt:
    LDX.W $0DC4                                                          ;949447;
    LDA.L $7F6402,X                                                      ;94944A;
    AND.W #$00FF                                                         ;94944E;
    BEQ .returnNoCollision                                               ;949451;
    BIT.W #$0080                                                         ;949453;
    BNE .highByte                                                        ;949456;
    STA.W $0DD4                                                          ;949458;
    LDA.W $0DC4                                                          ;94945B;

.loopUpper:
    CLC                                                                  ;94945E;
    ADC.W $07A5                                                          ;94945F;
    DEC.W $0DD4                                                          ;949462;
    BNE .loopUpper                                                       ;949465;
    JMP.W +                                                              ;949467;


.highByte:
    ORA.W #$FF00                                                         ;94946A;
    STA.W $0DD4                                                          ;94946D;
    LDA.W $0DC4                                                          ;949470;

.loopLower:
    SEC                                                                  ;949473;
    SBC.W $07A5                                                          ;949474;
    INC.W $0DD4                                                          ;949477;
    BNE .loopLower                                                       ;94947A;

  + STA.W $0DC4                                                          ;94947C;
    ASL A                                                                ;94947F;
    TAX                                                                  ;949480;
    LDA.L $7F0002,X                                                      ;949481;
    AND.W #$F000                                                         ;949485;
    XBA                                                                  ;949488;
    LSR A                                                                ;949489;
    LSR A                                                                ;94948A;
    LSR A                                                                ;94948B;
    TAX                                                                  ;94948C;
    PLA                                                                  ;94948D;
    SEC                                                                  ;94948E;
    SBC.W #$0003                                                         ;94948F;
    PHA                                                                  ;949492;

.returnNoCollision:
    CLC                                                                  ;949493;
    RTS                                                                  ;949494;


CalculateSamusYBlockSpan:
    LDA.W $0AFA                                                          ;949495;
    SEC                                                                  ;949498;
    SBC.W $0B00                                                          ;949499;
    AND.W #$FFF0                                                         ;94949C;
    STA.B $1A                                                            ;94949F;
    LDA.W $0AFA                                                          ;9494A1;
    CLC                                                                  ;9494A4;
    ADC.W $0B00                                                          ;9494A5;
    DEC A                                                                ;9494A8;
    SEC                                                                  ;9494A9;
    SBC.B $1A                                                            ;9494AA;
    LSR A                                                                ;9494AC;
    LSR A                                                                ;9494AD;
    LSR A                                                                ;9494AE;
    LSR A                                                                ;9494AF;
    STA.B $1A                                                            ;9494B0;
    STA.B $1C                                                            ;9494B2;
    RTS                                                                  ;9494B4;


CalculateSamusXBlockSpan:
    LDA.W $0AF6                                                          ;9494B5;
    SEC                                                                  ;9494B8;
    SBC.W $0AFE                                                          ;9494B9;
    AND.W #$FFF0                                                         ;9494BC;
    STA.B $1A                                                            ;9494BF;
    LDA.W $0AF6                                                          ;9494C1;
    CLC                                                                  ;9494C4;
    ADC.W $0AFE                                                          ;9494C5;
    DEC A                                                                ;9494C8;
    SEC                                                                  ;9494C9;
    SBC.B $1A                                                            ;9494CA;
    LSR A                                                                ;9494CC;
    LSR A                                                                ;9494CD;
    LSR A                                                                ;9494CE;
    LSR A                                                                ;9494CF;
    STA.B $1A                                                            ;9494D0;
    STA.B $1C                                                            ;9494D2;
    RTS                                                                  ;9494D4;


SamusBlockCollisionReactionPointers_Horizontal:
    dw CLCRTS_948F47                                                     ;9494D5;
    dw SamusBlockCollisionReaction_Horizontal_Slope                      ;9494D7;
    dw CLCRTS_949018                                                     ;9494D9;
    dw SamusBlockCollisionReaction_Horizontal_SpecialAir                 ;9494DB;
    dw CLCRTS_948F47                                                     ;9494DD;
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ;9494DF;
    dw CLCRTS_948F47                                                     ;9494E1;
    dw SamusBlockCollisionReaction_Horizontal_BombableAir                ;9494E3;
    dw SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple      ;9494E5;
    dw SamusBlockCollisionReaction_Horizontal_Door                       ;9494E7;
    dw SamusBlockCollisionReaction_Horizontal_SpikeBlock                 ;9494E9;
    dw SamusBlockCollisionReaction_Horizontal_SpecialBlock               ;9494EB;
    dw SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple      ;9494ED;
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ;9494EF;
    dw SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple      ;9494F1;
    dw SamusBlockCollisionReaction_Horizontal_BombBlock                  ;9494F3;

SamusBlockCollisionReactionPointers_Vertical:
    dw CLCRTS_948F47                                                     ;9494F5;
    dw SamusBlockCollisionReaction_Vertical_Slope                        ;9494F7;
    dw SamusBlockCollisionReaction_Vertical_SpikeAir                     ;9494F9;
    dw SamusBlockCollisionReaction_Vertical_SpecialAir                   ;9494FB;
    dw CLCRTS_948F47                                                     ;9494FD;
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ;9494FF;
    dw CLCRTS_948F47                                                     ;949501;
    dw SamusBlockCollisionReaction_Vertical_BombableAir                  ;949503;
    dw SamusBlockCollisionReaction_Vertical_SolidShootableGrapple        ;949505;
    dw SamusBlockCollisionReaction_Vertical_Door                         ;949507;
    dw SamusBlockCollisionReaction_Vertical_SpikeBlock                   ;949509;
    dw SamusBlockCollisionReaction_Vertical_SpecialBlock                 ;94950B;
    dw SamusBlockCollisionReaction_Vertical_SolidShootableGrapple        ;94950D;
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ;94950F;
    dw SamusBlockCollisionReaction_Vertical_SolidShootableGrapple        ;949511;
    dw SamusBlockCollisionReaction_Vertical_BombBlock                    ;949513;

SamusBlockCollisionReaction_Horizontal:
    PHX                                                                  ;949515;
    TXA                                                                  ;949516;
    LSR A                                                                ;949517;
    STA.W $0DC4                                                          ;949518;
    LDA.L $7F0002,X                                                      ;94951B;
    AND.W #$F000                                                         ;94951F;
    XBA                                                                  ;949522;
    LSR A                                                                ;949523;
    LSR A                                                                ;949524;
    LSR A                                                                ;949525;
    TAX                                                                  ;949526;
    JSR.W (SamusBlockCollisionReactionPointers_Horizontal,X)             ;949527;
    PLX                                                                  ;94952A;
    RTS                                                                  ;94952B;


SamusBlockCollisionReaction_Vertical:
    PHX                                                                  ;94952C;
    TXA                                                                  ;94952D;
    LSR A                                                                ;94952E;
    STA.W $0DC4                                                          ;94952F;
    LDA.L $7F0002,X                                                      ;949532;
    AND.W #$F000                                                         ;949536;
    XBA                                                                  ;949539;
    LSR A                                                                ;94953A;
    LSR A                                                                ;94953B;
    LSR A                                                                ;94953C;
    TAX                                                                  ;94953D;
    JSR.W (SamusBlockCollisionReactionPointers_Vertical,X)               ;94953E;
    PLX                                                                  ;949541;
    RTS                                                                  ;949542;


SamusBlockCollisionDetection_Horizontal:
    JSR.W CalculateSamusYBlockSpan                                       ;949543;
    LDA.W $0AFA                                                          ;949546;
    SEC                                                                  ;949549;
    SBC.W $0B00                                                          ;94954A;
    LSR A                                                                ;94954D;
    LSR A                                                                ;94954E;
    LSR A                                                                ;94954F;
    LSR A                                                                ;949550;
    SEP #$20                                                             ;949551;
    STA.W HW_WRMPYA                                                      ;949553;
    LDA.W $07A5                                                          ;949556;
    STA.W HW_WRMPYB                                                      ;949559;
    REP #$20                                                             ;94955C;
    LDA.W $0AF8                                                          ;94955E;
    CLC                                                                  ;949561;
    ADC.B $14                                                            ;949562;
    STA.B $16                                                            ;949564;
    LDA.W $0AF6                                                          ;949566;
    ADC.B $12                                                            ;949569;
    STA.B $18                                                            ;94956B;
    BIT.B $12                                                            ;94956D;
    BPL .movingRight                                                     ;94956F;
    SEC                                                                  ;949571;
    SBC.W $0AFE                                                          ;949572;
    BRA +                                                                ;949575;


.movingRight:
    CLC                                                                  ;949577;
    ADC.W $0AFE                                                          ;949578;
    DEC A                                                                ;94957B;

  + STA.B $20                                                            ;94957C;
    LSR A                                                                ;94957E;
    LSR A                                                                ;94957F;
    LSR A                                                                ;949580;
    LSR A                                                                ;949581;
    CLC                                                                  ;949582;
    ADC.W HW_RDMPY                                                       ;949583;
    ASL A                                                                ;949586;
    TAX                                                                  ;949587;

.loop:
    JSR.W SamusBlockCollisionReaction_Horizontal                         ;949588;
    BCS .returnCollision                                                 ;94958B;
    TXA                                                                  ;94958D;
    CLC                                                                  ;94958E;
    ADC.W $07A5                                                          ;94958F;
    ADC.W $07A5                                                          ;949592;
    TAX                                                                  ;949595;
    DEC.B $1A                                                            ;949596;
    BPL .loop                                                            ;949598;
    CLC                                                                  ;94959A;
    RTS                                                                  ;94959B;


.returnCollision:
    SEC                                                                  ;94959C;
    RTS                                                                  ;94959D;


SamusBlockCollisionDetection_Vertical_LeftToRight:
    JSR.W CalculateSamusXBlockSpan                                       ;94959E;
    LDA.W $0AFC                                                          ;9495A1;
    CLC                                                                  ;9495A4;
    ADC.B $14                                                            ;9495A5;
    STA.B $16                                                            ;9495A7;
    LDA.W $0AFA                                                          ;9495A9;
    ADC.B $12                                                            ;9495AC;
    STA.B $18                                                            ;9495AE;
    BIT.B $12                                                            ;9495B0;
    BPL .movingDown                                                      ;9495B2;
    SEC                                                                  ;9495B4;
    SBC.W $0B00                                                          ;9495B5;
    BRA +                                                                ;9495B8;


.movingDown:
    CLC                                                                  ;9495BA;
    ADC.W $0B00                                                          ;9495BB;
    DEC A                                                                ;9495BE;

  + STA.B $20                                                            ;9495BF;
    LSR A                                                                ;9495C1;
    LSR A                                                                ;9495C2;
    LSR A                                                                ;9495C3;
    LSR A                                                                ;9495C4;
    SEP #$20                                                             ;9495C5;
    STA.W HW_WRMPYA                                                      ;9495C7;
    LDA.W $07A5                                                          ;9495CA;
    STA.W HW_WRMPYB                                                      ;9495CD;
    REP #$20                                                             ;9495D0;
    LDA.W $0AF6                                                          ;9495D2;
    SEC                                                                  ;9495D5;
    SBC.W $0AFE                                                          ;9495D6;
    LSR A                                                                ;9495D9;
    LSR A                                                                ;9495DA;
    LSR A                                                                ;9495DB;
    LSR A                                                                ;9495DC;
    CLC                                                                  ;9495DD;
    ADC.W HW_RDMPY                                                       ;9495DE;
    STA.W $0DC4                                                          ;9495E1;
    ASL A                                                                ;9495E4;
    TAX                                                                  ;9495E5;

.loop:
    JSR.W SamusBlockCollisionReaction_Vertical                           ;9495E6;
    BCS .returnCollision                                                 ;9495E9;
    INX                                                                  ;9495EB;
    INX                                                                  ;9495EC;
    DEC.B $1A                                                            ;9495ED;
    BPL .loop                                                            ;9495EF;
    CLC                                                                  ;9495F1;
    RTS                                                                  ;9495F2;


.returnCollision:
    SEC                                                                  ;9495F3;
    RTS                                                                  ;9495F4;


SamusBlockCollisionDetection_Vertical_RightToLeft:
    JSR.W CalculateSamusXBlockSpan                                       ;9495F5;
    STZ.B $1A                                                            ;9495F8;
    LDA.W $0AFC                                                          ;9495FA;
    CLC                                                                  ;9495FD;
    ADC.B $14                                                            ;9495FE;
    STA.B $16                                                            ;949600;
    LDA.W $0AFA                                                          ;949602;
    ADC.B $12                                                            ;949605;
    STA.B $18                                                            ;949607;
    BIT.B $12                                                            ;949609;
    BPL .movingDown                                                      ;94960B;
    SEC                                                                  ;94960D;
    SBC.W $0B00                                                          ;94960E;
    BRA +                                                                ;949611;


.movingDown:
    CLC                                                                  ;949613;
    ADC.W $0B00                                                          ;949614;
    DEC A                                                                ;949617;

  + STA.B $20                                                            ;949618;
    LSR A                                                                ;94961A;
    LSR A                                                                ;94961B;
    LSR A                                                                ;94961C;
    LSR A                                                                ;94961D;
    SEP #$20                                                             ;94961E;
    STA.W HW_WRMPYA                                                      ;949620;
    LDA.W $07A5                                                          ;949623;
    STA.W HW_WRMPYB                                                      ;949626;
    REP #$20                                                             ;949629;
    LDA.W $0AF6                                                          ;94962B;
    CLC                                                                  ;94962E;
    ADC.W $0AFE                                                          ;94962F;
    DEC A                                                                ;949632;
    LSR A                                                                ;949633;
    LSR A                                                                ;949634;
    LSR A                                                                ;949635;
    LSR A                                                                ;949636;
    CLC                                                                  ;949637;
    ADC.W HW_RDMPY                                                       ;949638;
    STA.W $0DC4                                                          ;94963B;
    ASL A                                                                ;94963E;
    TAX                                                                  ;94963F;

.loop:
    JSR.W SamusBlockCollisionReaction_Vertical                           ;949640;
    BCS .returnCollision                                                 ;949643;
    DEX                                                                  ;949645;
    DEX                                                                  ;949646;
    INC.B $1A                                                            ;949647;
    LDA.B $1C                                                            ;949649;
    CMP.B $1A                                                            ;94964B;
    BCS .loop                                                            ;94964D;
    CLC                                                                  ;94964F;
    RTS                                                                  ;949650;


.returnCollision:
    SEC                                                                  ;949651;
    RTS                                                                  ;949652;


Get_12_14_949653:
    LDA.B $12                                                            ;949653;
    BPL .return                                                          ;949655;
    EOR.W #$FFFF                                                         ;949657;
    STA.B $12                                                            ;94965A;
    LDA.B $14                                                            ;94965C;
    EOR.W #$FFFF                                                         ;94965E;
    INC A                                                                ;949661;
    STA.B $14                                                            ;949662;
    BNE .return                                                          ;949664;
    INC.B $12                                                            ;949666;

.return:
    RTS                                                                  ;949668;


Get_12_14_949669:
    LDA.B $12                                                            ;949669;
    BPL .return                                                          ;94966B;
    EOR.W #$FFFF                                                         ;94966D;
    STA.B $12                                                            ;949670;
    LDA.B $14                                                            ;949672;
    EOR.W #$FFFF                                                         ;949674;
    INC A                                                                ;949677;
    STA.B $14                                                            ;949678;
    BNE .return                                                          ;94967A;
    INC.B $12                                                            ;94967C;

.return:
    RTS                                                                  ;94967E;


WallJumpBlockCollisionDetection:
    PHP                                                                  ;94967F;
    PHB                                                                  ;949680;
    PHK                                                                  ;949681;
    PLB                                                                  ;949682;
    LDA.W $0B02                                                          ;949683;
    ORA.W #$000F                                                         ;949686;
    STA.W $0B02                                                          ;949689;
    STZ.W $1E71                                                          ;94968C;
    JSR.W SamusBlockCollisionDetection_Horizontal                        ;94968F;
    BCC .noCollision                                                     ;949692;
    JSR.W Get_12_14_949653                                               ;949694;
    PLB                                                                  ;949697;
    PLP                                                                  ;949698;
    SEC                                                                  ;949699;
    LDA.W #$0001                                                         ;94969A;
    STA.W $0DD0                                                          ;94969D;
    RTL                                                                  ;9496A0;


.noCollision:
    JSR.W Get_12_14_949653                                               ;9496A1;
    PLB                                                                  ;9496A4;
    PLP                                                                  ;9496A5;
    CLC                                                                  ;9496A6;
    STZ.W $0DD0                                                          ;9496A7;
    RTL                                                                  ;9496AA;


BlockCollisionDetectionDueToChangeOfPose:
    LDA.B $12                                                            ;9496AB;
    BPL .positive                                                        ;9496AD;
    EOR.W #$FFFF                                                         ;9496AF;
    INC A                                                                ;9496B2;

.positive:
    AND.W #$FFF8                                                         ;9496B3;
    BNE +                                                                ;9496B6;
    JSL.L BlockCollisionDetectionDueToChangeOfPose_SingleBlock           ;9496B8;
    RTL                                                                  ;9496BC;


  + LDA.B $12                                                            ;9496BD;
    PHA                                                                  ;9496BF;
    LDA.B $14                                                            ;9496C0;
    PHA                                                                  ;9496C2;
    LDA.B $12                                                            ;9496C3;
    AND.W #$FFF8                                                         ;9496C5;
    ORA.W #$0008                                                         ;9496C8;
    STA.B $12                                                            ;9496CB;
    STZ.B $14                                                            ;9496CD;
    JSL.L BlockCollisionDetectionDueToChangeOfPose_SingleBlock           ;9496CF;
    BCC .noCollision                                                     ;9496D3;
    PLA                                                                  ;9496D5;
    PLA                                                                  ;9496D6;
    RTL                                                                  ;9496D7;


.noCollision:
    PLA                                                                  ;9496D8;
    STA.B $14                                                            ;9496D9;
    PLA                                                                  ;9496DB;
    STA.B $12                                                            ;9496DC;
    JSL.L BlockCollisionDetectionDueToChangeOfPose_SingleBlock           ;9496DE;
    RTL                                                                  ;9496E2;


BlockCollisionDetectionDueToChangeOfPose_SingleBlock:
    PHP                                                                  ;9496E3;
    PHB                                                                  ;9496E4;
    REP #$30                                                             ;9496E5;
    PHK                                                                  ;9496E7;
    PLB                                                                  ;9496E8;
    LDA.W $0B02                                                          ;9496E9;
    ORA.W #$000F                                                         ;9496EC;
    STA.W $0B02                                                          ;9496EF;
    STZ.W $1E71                                                          ;9496F2;
    LDA.W $05B6                                                          ;9496F5;
    LSR A                                                                ;9496F8;
    BCS .nonZeroFrameCounter                                             ;9496F9;
    JSR.W SamusBlockCollisionDetection_Vertical_LeftToRight              ;9496FB;
    BCC .noCollision                                                     ;9496FE;
    BCS .collision                                                       ;949700;

.nonZeroFrameCounter:
    JSR.W SamusBlockCollisionDetection_Vertical_RightToLeft              ;949702;
    BCC .noCollision                                                     ;949705;

.collision:
    JSR.W Get_12_14_949669                                               ;949707;
    PLB                                                                  ;94970A;
    PLP                                                                  ;94970B;
    SEC                                                                  ;94970C;
    LDA.W #$0001                                                         ;94970D;
    STA.W $0DD0                                                          ;949710;
    RTL                                                                  ;949713;


.noCollision:
    JSR.W Get_12_14_949669                                               ;949714;
    PLB                                                                  ;949717;
    PLP                                                                  ;949718;
    CLC                                                                  ;949719;
    STZ.W $0DD0                                                          ;94971A;
    RTL                                                                  ;94971D;


MoveSamusRight_NoSolidEnemyCollision:
    PHP                                                                  ;94971E;
    PHB                                                                  ;94971F;
    PHK                                                                  ;949720;
    PLB                                                                  ;949721;
    LDA.B $14                                                            ;949722;
    ORA.B $12                                                            ;949724;
    BEQ .noCollision                                                     ;949726;
    STZ.W $1E71                                                          ;949728;
    JSR.W SamusBlockCollisionDetection_Horizontal                        ;94972B;
    BCC .noCollision                                                     ;94972E;
    LDA.W $0AF8                                                          ;949730;
    CLC                                                                  ;949733;
    ADC.B $14                                                            ;949734;
    STA.W $0AF8                                                          ;949736;
    LDA.W $0AF6                                                          ;949739;
    ADC.B $12                                                            ;94973C;
    STA.W $0AF6                                                          ;94973E;
    PLB                                                                  ;949741;
    PLP                                                                  ;949742;
    SEC                                                                  ;949743;
    LDA.W #$0001                                                         ;949744;
    STA.W $0DD0                                                          ;949747;
    RTL                                                                  ;94974A;


.noCollision:
    LDA.W $0AF8                                                          ;94974B;
    CLC                                                                  ;94974E;
    ADC.B $14                                                            ;94974F;
    STA.W $0AF8                                                          ;949751;
    LDA.W $0AF6                                                          ;949754;
    ADC.B $12                                                            ;949757;
    STA.W $0AF6                                                          ;949759;
    PLB                                                                  ;94975C;
    PLP                                                                  ;94975D;
    CLC                                                                  ;94975E;
    STZ.W $0DD0                                                          ;94975F;
    RTL                                                                  ;949762;


MoveSamusDown_NoSolidEnemyCollision:
    PHP                                                                  ;949763;
    PHB                                                                  ;949764;
    REP #$30                                                             ;949765;
    PHK                                                                  ;949767;
    PLB                                                                  ;949768;
    LDA.B $14                                                            ;949769;
    ORA.B $12                                                            ;94976B;
    BEQ .noCollision                                                     ;94976D;
    STZ.W $0DBA                                                          ;94976F;
    STZ.W $1E71                                                          ;949772;
    LDA.W $05B6                                                          ;949775;
    LSR A                                                                ;949778;
    BCS .nonZeroFrameCounter                                             ;949779;
    JSR.W SamusBlockCollisionDetection_Vertical_LeftToRight              ;94977B;
    BCC .noCollision                                                     ;94977E;
    BCS .moveVertically                                                  ;949780;

.nonZeroFrameCounter:
    JSR.W SamusBlockCollisionDetection_Vertical_RightToLeft              ;949782;
    BCC .noCollision                                                     ;949785;

.moveVertically:
    LDA.W $0AFC                                                          ;949787;
    CLC                                                                  ;94978A;
    ADC.B $14                                                            ;94978B;
    STA.W $0AFC                                                          ;94978D;
    LDA.W $0AFA                                                          ;949790;
    ADC.B $12                                                            ;949793;
    STA.W $0AFA                                                          ;949795;

.collision:
    PLB                                                                  ;949798;
    PLP                                                                  ;949799;
    SEC                                                                  ;94979A;
    LDA.W #$0001                                                         ;94979B;
    STA.W $0DD0                                                          ;94979E;
    RTL                                                                  ;9497A1;


.noCollision:
    LDA.W $0AFC                                                          ;9497A2;
    CLC                                                                  ;9497A5;
    ADC.B $14                                                            ;9497A6;
    STA.W $0AFC                                                          ;9497A8;
    LDA.W $0AFA                                                          ;9497AB;
    ADC.B $12                                                            ;9497AE;
    STA.W $0AFA                                                          ;9497B0;
    LDA.W $1E71                                                          ;9497B3;
    BNE .collision                                                       ;9497B6;
    PLB                                                                  ;9497B8;
    PLP                                                                  ;9497B9;
    CLC                                                                  ;9497BA;
    STZ.W $0DD0                                                          ;9497BB;
    RTL                                                                  ;9497BE;


BlockInsideReaction_Slope:
    LDX.W $0DC4                                                          ;9497BF;
    LDA.L $7F6402,X                                                      ;9497C2;
    AND.W #$001F                                                         ;9497C6;
    CMP.W #$0005                                                         ;9497C9;
    BCS .returnDuplicate                                                 ;9497CC; >.<
    RTS                                                                  ;9497CE;


.returnDuplicate:
    RTS                                                                  ;9497CF;


BlockInsideReaction_Air_ShootableAir_BombableAir:
    LDA.W #SamusXSpeedTable_Normal                                       ;9497D0;
    STA.W $0A6C                                                          ;9497D3;
    RTS                                                                  ;9497D6;


RTS_9497D7:
    RTS                                                                  ;9497D7;


CLCRTS_9497D8:
    CLC                                                                  ;9497D8;
    RTS                                                                  ;9497D9;

    LDA.W $0A4E                                                          ;9497DA;
    CLC                                                                  ;9497DD;
    STA.W $0A4E                                                          ;9497DE;
    LDA.W $0A50                                                          ;9497E1;
    ADC.W #$0001                                                         ;9497E4;
    STA.W $0A50                                                          ;9497E7;
    STZ.W $0B42                                                          ;9497EA;
    STZ.W $0B46                                                          ;9497ED;
    CLC                                                                  ;9497F0;
    RTS                                                                  ;9497F1;


UNUSED_SomeKindOfUpwardsBoost_9497F2:
    LDA.W $0B36                                                          ;9497F2;
    CMP.W #$0001                                                         ;9497F5;
    BNE .down                                                            ;9497F8;
    LDA.W #$0000                                                         ;9497FA;
    STA.W $0B32                                                          ;9497FD;
    LDA.W #$0002                                                         ;949800;
    STA.W $0B34                                                          ;949803;
    CLC                                                                  ;949806;
    RTS                                                                  ;949807;


.down:
    STZ.W $0B2E                                                          ;949808;
    STZ.W $0B2C                                                          ;94980B;
    CLC                                                                  ;94980E;
    RTS                                                                  ;94980F;


CLCRTS_949810:
    CLC                                                                  ;949810;
    RTS                                                                  ;949811;


CLCRTS_949812:
    CLC                                                                  ;949812;
    RTS                                                                  ;949813;

    LDY.W #$0000                                                         ;949814;
    LDA.W $0A4E                                                          ;949817;
    CLC                                                                  ;94981A;
    STA.W $0A4E                                                          ;94981B;
    LDA.W $0A50                                                          ;94981E;
    ADC.W #$0001                                                         ;949821;
    STA.W $0A50                                                          ;949824;
    LDA.W #SamusXSpeedTable_InLavaAcid                                   ;949827;
    STA.W $0A6C                                                          ;94982A;
    STZ.W $0B32                                                          ;94982D;
    STZ.W $0B34                                                          ;949830;
    LDA.W $0B36                                                          ;949833;
    CMP.W #$0001                                                         ;949836;
    BNE .down                                                            ;949839;
    LDA.W .data1,Y                                                       ;94983B;
    STA.W $0B32                                                          ;94983E;
    LDA.W .data2,Y                                                       ;949841;
    STA.W $0B34                                                          ;949844;
    CLC                                                                  ;949847;
    RTS                                                                  ;949848;


.down:
    STZ.W $0B2E                                                          ;949849;
    STZ.W $0B2C                                                          ;94984C;
    LDA.W .data3,Y                                                       ;94984F;
    STA.W $0B5A                                                          ;949852;
    LDA.W .data4,Y                                                       ;949855;
    STA.W $0B5C                                                          ;949858;
    CLC                                                                  ;94985B;
    RTS                                                                  ;94985C;


.data1:
    dw $0000                                                             ;94985D;

.data2:
    dw $0005                                                             ;94985F;

.data3:
    dw $0000                                                             ;949861;

.data4:
    dw $0002                                                             ;949863;

RTS_949865:
    RTS                                                                  ;949865;


BlockInsideReaction_SpikeAir_BTS2_AirSpike:
    LDA.W $0A6E                                                          ;949866;
    BNE .return                                                          ;949869;
    LDA.W $18A8                                                          ;94986B;
    BNE .return                                                          ;94986E;
    LDA.W #$003C                                                         ;949870;
    STA.W $18A8                                                          ;949873;
    LDA.W #$000A                                                         ;949876;
    STA.W $18AA                                                          ;949879;
    LDA.W $0A4E                                                          ;94987C;
    CLC                                                                  ;94987F;
    ADC.W #$0000                                                         ;949880;
    STA.W $0A4E                                                          ;949883;
    LDA.W $0A50                                                          ;949886;
    ADC.W #$0010                                                         ;949889;
    STA.W $0A50                                                          ;94988C;
    LDA.W $0A1E                                                          ;94988F;
    EOR.W #$000C                                                         ;949892;
    BIT.W #$0008                                                         ;949895;
    BEQ .facingRight                                                     ;949898;
    LDA.W #$0001                                                         ;94989A;
    STA.W $0A54                                                          ;94989D;
    BRA .return                                                          ;9498A0;


.facingRight:
    STZ.W $0A54                                                          ;9498A2;

.return:
    LDA.W #SamusXSpeedTable_Normal                                       ;9498A5;
    STA.W $0A6C                                                          ;9498A8;
    RTS                                                                  ;9498AB;


BlockInsideReaction_SpikeAir_JumpTable:
    dw CLCRTS_9497D8                                                     ;9498AC;
    dw CLCRTS_949812                                                     ;9498AE;
    dw BlockInsideReaction_SpikeAir_BTS2_AirSpike                        ;9498B0;
    dw RTS_9497D7                                                        ;9498B2;
    dw RTS_9497D7                                                        ;9498B4;
    dw RTS_9497D7                                                        ;9498B6;
    dw RTS_9497D7                                                        ;9498B8;
    dw RTS_9497D7                                                        ;9498BA;
    dw RTS_9497D7                                                        ;9498BC;
    dw RTS_9497D7                                                        ;9498BE;
    dw RTS_9497D7                                                        ;9498C0;
    dw RTS_9497D7                                                        ;9498C2;
    dw RTS_9497D7                                                        ;9498C4;
    dw RTS_9497D7                                                        ;9498C6;
    dw RTS_9497D7                                                        ;9498C8;
    dw RTS_9497D7                                                        ;9498CA;

BlockInsideReaction_SpikeAir:
    LDX.W $0DC4                                                          ;9498CC;
    LDA.L $7F6402,X                                                      ;9498CF;
    AND.W #$00FF                                                         ;9498D3;
    ASL A                                                                ;9498D6;
    TAX                                                                  ;9498D7;
    JSR.W (BlockInsideReaction_SpikeAir_JumpTable,X)                     ;9498D8;
    RTS                                                                  ;9498DB;


BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb:
    LDA.W #SamusXSpeedTable_Normal                                       ;9498DC;
    STA.W $0A6C                                                          ;9498DF;
    RTS                                                                  ;9498E2;


BlockInsideReaction_SpecialAir_Default:
    LDA.W #SamusXSpeedTable_Normal                                       ;9498E3;
    STA.W $0A6C                                                          ;9498E6;
    RTS                                                                  ;9498E9;


BlockInsideReaction_SpecialAir_BTS8_WSTreadmill_Right:
    LDA.W $079F                                                          ;9498EA;
    CMP.W #$0003                                                         ;9498ED;
    BNE .notWreckedShip                                                  ;9498F0;
    LDA.W #$0001                                                         ;9498F2;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;9498F5;
    BCC .return                                                          ;9498F9;

.notWreckedShip:
    LDA.W $0B2E                                                          ;9498FB;
    BNE .return                                                          ;9498FE;
    STZ.W $0B56                                                          ;949900;
    LDA.W #$0002                                                         ;949903;
    STA.W $0B58                                                          ;949906;

.return:
    LDA.W #SamusXSpeedTable_Normal                                       ;949909;
    STA.W $0A6C                                                          ;94990C;
    RTS                                                                  ;94990F;


BlockInsideReaction_SpecialAir_BTS9_WSTreadmill_Left:
    LDA.W $079F                                                          ;949910;
    CMP.W #$0003                                                         ;949913;
    BNE .notWreckedShip                                                  ;949916;
    LDA.W #$0001                                                         ;949918;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;94991B;
    BCC .return                                                          ;94991F;

.notWreckedShip:
    LDA.W $0B2E                                                          ;949921;
    BNE .return                                                          ;949924;
    STZ.W $0B56                                                          ;949926;
    LDA.W #$FFFE                                                         ;949929;
    STA.W $0B58                                                          ;94992C;

.return:
    LDA.W #SamusXSpeedTable_Normal                                       ;94992F;
    STA.W $0A6C                                                          ;949932;
    RTS                                                                  ;949935;


BlockInsideReaction_SpecialAir_BTSA_RightwardsTreadmill:
    STZ.W $0B56                                                          ;949936;
    LDA.W #$0002                                                         ;949939;
    STA.W $0B58                                                          ;94993C;
    LDA.W #SamusXSpeedTable_Normal                                       ;94993F;
    STA.W $0A6C                                                          ;949942;
    RTS                                                                  ;949945;


BlockInsideReaction_SpecialAir_BTSB_LeftwardsTreadmill:
    STZ.W $0B56                                                          ;949946;
    LDA.W #$FFFE                                                         ;949949;
    STA.W $0B58                                                          ;94994C;
    LDA.W #SamusXSpeedTable_Normal                                       ;94994F;
    STA.W $0A6C                                                          ;949952;
    RTS                                                                  ;949955;


BlockInsideReaction_SpecialAir_BTS46_ScrollPLMTrigger:
    LDA.W $1E73                                                          ;949956;
    CMP.W #$0001                                                         ;949959;
    BNE .return                                                          ;94995C;
    LDA.W #PLMEntries_scrollPLMTrigger                                   ;94995E;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949961;

.return:
    RTS                                                                  ;949965;


BlockInsideReaction_SpecialAir_JumpTable:
    dw BlockInsideReaction_SpecialAir_Default                            ;949966;
    dw BlockInsideReaction_SpecialAir_Default                            ;949968;
    dw BlockInsideReaction_SpecialAir_Default                            ;94996A;
    dw BlockInsideReaction_SpecialAir_Default                            ;94996C;
    dw BlockInsideReaction_SpecialAir_Default                            ;94996E;
    dw BlockInsideReaction_SpecialAir_Default                            ;949970;
    dw BlockInsideReaction_SpecialAir_Default                            ;949972;
    dw BlockInsideReaction_SpecialAir_Default                            ;949974;
    dw BlockInsideReaction_SpecialAir_BTS8_WSTreadmill_Right             ;949976;
    dw BlockInsideReaction_SpecialAir_BTS9_WSTreadmill_Left              ;949978;
    dw BlockInsideReaction_SpecialAir_BTSA_RightwardsTreadmill           ;94997A;
    dw BlockInsideReaction_SpecialAir_BTSB_LeftwardsTreadmill            ;94997C;
    dw BlockInsideReaction_SpecialAir_Default                            ;94997E;
    dw BlockInsideReaction_SpecialAir_Default                            ;949980;
    dw BlockInsideReaction_SpecialAir_Default                            ;949982;
    dw BlockInsideReaction_SpecialAir_Default                            ;949984;
    dw BlockInsideReaction_SpecialAir_Default                            ;949986;
    dw BlockInsideReaction_SpecialAir_Default                            ;949988;
    dw BlockInsideReaction_SpecialAir_Default                            ;94998A;
    dw BlockInsideReaction_SpecialAir_Default                            ;94998C;
    dw BlockInsideReaction_SpecialAir_Default                            ;94998E;
    dw BlockInsideReaction_SpecialAir_Default                            ;949990;
    dw BlockInsideReaction_SpecialAir_Default                            ;949992;
    dw BlockInsideReaction_SpecialAir_Default                            ;949994;
    dw BlockInsideReaction_SpecialAir_Default                            ;949996;
    dw BlockInsideReaction_SpecialAir_Default                            ;949998;
    dw BlockInsideReaction_SpecialAir_Default                            ;94999A;
    dw BlockInsideReaction_SpecialAir_Default                            ;94999C;
    dw BlockInsideReaction_SpecialAir_Default                            ;94999E;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499A0;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499A2;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499A4;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499A6;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499A8;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499AA;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499AC;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499AE;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499B0;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499B2;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499B4;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499B6;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499B8;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499BA;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499BC;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499BE;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499C0;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499C2;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499C4;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499C6;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499C8;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499CA;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499CC;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499CE;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499D0;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499D2;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499D4;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499D6;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499D8;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499DA;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499DC;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499DE;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499E0;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499E2;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499E4;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499E6;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499E8;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499EA;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499EC;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499EE;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499F0;
    dw BlockInsideReaction_SpecialAir_BTS46_ScrollPLMTrigger             ;9499F2;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499F4;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499F6;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499F8;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499FA;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499FC;
    dw BlockInsideReaction_SpecialAir_Default                            ;9499FE;
    dw BlockInsideReaction_SpecialAir_Default                            ;949A00;
    dw BlockInsideReaction_SpecialAir_Default                            ;949A02;
    dw BlockInsideReaction_SpecialAir_Default                            ;949A04;

BlockInsideReaction_SpecialAir_PLMTable_crateria:
    dw PLMEntries_insideReactionCrateria80                               ;949A06;
    dw PLMEntries_nothing                                                ;949A08;
    dw PLMEntries_nothing                                                ;949A0A;
    dw PLMEntries_nothing                                                ;949A0C;
    dw PLMEntries_nothing                                                ;949A0E;
    dw PLMEntries_nothing                                                ;949A10;
    dw PLMEntries_nothing                                                ;949A12;
    dw PLMEntries_nothing                                                ;949A14;
    dw PLMEntries_nothing                                                ;949A16;
    dw PLMEntries_nothing                                                ;949A18;
    dw PLMEntries_nothing                                                ;949A1A;
    dw PLMEntries_nothing                                                ;949A1C;
    dw PLMEntries_nothing                                                ;949A1E;
    dw PLMEntries_nothing                                                ;949A20;
    dw PLMEntries_nothing                                                ;949A22;
    dw PLMEntries_nothing                                                ;949A24;

BlockInsideReaction_SpecialAir_PLMTable_brinstar:
    dw PLMEntries_insideReactionBrinstarFloorPlant                       ;949A26;
    dw PLMEntries_insideReactionBrinstarCeilingPlant                     ;949A28;
    dw PLMEntries_nothing                                                ;949A2A;
    dw PLMEntries_nothing                                                ;949A2C;
    dw PLMEntries_nothing                                                ;949A2E;
    dw PLMEntries_nothing                                                ;949A30;
    dw PLMEntries_nothing                                                ;949A32;
    dw PLMEntries_nothing                                                ;949A34;
    dw PLMEntries_nothing                                                ;949A36;
    dw PLMEntries_nothing                                                ;949A38;
    dw PLMEntries_nothing                                                ;949A3A;
    dw PLMEntries_nothing                                                ;949A3C;
    dw PLMEntries_nothing                                                ;949A3E;
    dw PLMEntries_nothing                                                ;949A40;
    dw PLMEntries_nothing                                                ;949A42;
    dw PLMEntries_nothing                                                ;949A44;

BlockInsideReaction_SpecialAir_PLMTable_norfair:
    dw PLMEntries_insideReactionNothing_B653                             ;949A46;
    dw PLMEntries_insideReactionNothing_B657                             ;949A48;
    dw PLMEntries_insideReactionNothing_B65B                             ;949A4A;
    dw PLMEntries_nothing                                                ;949A4C;
    dw PLMEntries_nothing                                                ;949A4E;
    dw PLMEntries_nothing                                                ;949A50;
    dw PLMEntries_nothing                                                ;949A52;
    dw PLMEntries_nothing                                                ;949A54;
    dw PLMEntries_nothing                                                ;949A56;
    dw PLMEntries_nothing                                                ;949A58;
    dw PLMEntries_nothing                                                ;949A5A;
    dw PLMEntries_nothing                                                ;949A5C;
    dw PLMEntries_nothing                                                ;949A5E;
    dw PLMEntries_nothing                                                ;949A60;
    dw PLMEntries_nothing                                                ;949A62;
    dw PLMEntries_nothing                                                ;949A64;

BlockInsideReaction_SpecialAir_PLMTable_wreckedShip:
    dw PLMEntries_nothing                                                ;949A66;
    dw PLMEntries_nothing                                                ;949A68;
    dw PLMEntries_nothing                                                ;949A6A;
    dw PLMEntries_nothing                                                ;949A6C;
    dw PLMEntries_nothing                                                ;949A6E;
    dw PLMEntries_nothing                                                ;949A70;
    dw PLMEntries_nothing                                                ;949A72;
    dw PLMEntries_nothing                                                ;949A74;
    dw PLMEntries_nothing                                                ;949A76;
    dw PLMEntries_nothing                                                ;949A78;
    dw PLMEntries_nothing                                                ;949A7A;
    dw PLMEntries_nothing                                                ;949A7C;
    dw PLMEntries_nothing                                                ;949A7E;
    dw PLMEntries_nothing                                                ;949A80;
    dw PLMEntries_nothing                                                ;949A82;
    dw PLMEntries_nothing                                                ;949A84;

BlockInsideReaction_SpecialAir_PLMTable_maridia:
    dw PLMEntries_insideReactionQuicksandSurface                         ;949A86;
    dw PLMEntries_insideReactionQuicksandSurface                         ;949A88;
    dw PLMEntries_insideReactionQuicksandSurface                         ;949A8A;
    dw PLMEntries_insideReactionSubmergingQuicksand                      ;949A8C;
    dw PLMEntries_insideReactionSandFallsSlow                            ;949A8E;
    dw PLMEntries_insideReactionSandFallsFast                            ;949A90;
    dw PLMEntries_nothing                                                ;949A92;
    dw PLMEntries_nothing                                                ;949A94;
    dw PLMEntries_nothing                                                ;949A96;
    dw PLMEntries_nothing                                                ;949A98;
    dw PLMEntries_nothing                                                ;949A9A;
    dw PLMEntries_nothing                                                ;949A9C;
    dw PLMEntries_nothing                                                ;949A9E;
    dw PLMEntries_nothing                                                ;949AA0;
    dw PLMEntries_nothing                                                ;949AA2;
    dw PLMEntries_nothing                                                ;949AA4;

BlockInsideReaction_SpecialAir_PLMTable_tourian:
    dw PLMEntries_nothing                                                ;949AA6;
    dw PLMEntries_nothing                                                ;949AA8;
    dw PLMEntries_nothing                                                ;949AAA;
    dw PLMEntries_nothing                                                ;949AAC;
    dw PLMEntries_nothing                                                ;949AAE;
    dw PLMEntries_nothing                                                ;949AB0;
    dw PLMEntries_nothing                                                ;949AB2;
    dw PLMEntries_nothing                                                ;949AB4;
    dw PLMEntries_nothing                                                ;949AB6;
    dw PLMEntries_nothing                                                ;949AB8;
    dw PLMEntries_nothing                                                ;949ABA;
    dw PLMEntries_nothing                                                ;949ABC;
    dw PLMEntries_nothing                                                ;949ABE;
    dw PLMEntries_nothing                                                ;949AC0;
    dw PLMEntries_nothing                                                ;949AC2;
    dw PLMEntries_nothing                                                ;949AC4;

BlockInsideReaction_SpecialAir_PLMTable_colony:
    dw PLMEntries_nothing                                                ;949AC6;
    dw PLMEntries_nothing                                                ;949AC8;
    dw PLMEntries_nothing                                                ;949ACA;
    dw PLMEntries_nothing                                                ;949ACC;
    dw PLMEntries_nothing                                                ;949ACE;
    dw PLMEntries_nothing                                                ;949AD0;
    dw PLMEntries_nothing                                                ;949AD2;
    dw PLMEntries_nothing                                                ;949AD4;
    dw PLMEntries_nothing                                                ;949AD6;
    dw PLMEntries_nothing                                                ;949AD8;
    dw PLMEntries_nothing                                                ;949ADA;
    dw PLMEntries_nothing                                                ;949ADC;
    dw PLMEntries_nothing                                                ;949ADE;
    dw PLMEntries_nothing                                                ;949AE0;
    dw PLMEntries_nothing                                                ;949AE2;
    dw PLMEntries_nothing                                                ;949AE4;

BlockInsideReaction_SpecialAir_PLMTable_debug:
    dw PLMEntries_insideReactionCrateria80                               ;949AE6;
    dw PLMEntries_nothing                                                ;949AE8;
    dw PLMEntries_nothing                                                ;949AEA;
    dw PLMEntries_nothing                                                ;949AEC;
    dw PLMEntries_nothing                                                ;949AEE;
    dw PLMEntries_nothing                                                ;949AF0;
    dw PLMEntries_nothing                                                ;949AF2;
    dw PLMEntries_nothing                                                ;949AF4;
    dw PLMEntries_nothing                                                ;949AF6;
    dw PLMEntries_nothing                                                ;949AF8;
    dw PLMEntries_nothing                                                ;949AFA;
    dw PLMEntries_nothing                                                ;949AFC;
    dw PLMEntries_nothing                                                ;949AFE;
    dw PLMEntries_nothing                                                ;949B00;
    dw PLMEntries_nothing                                                ;949B02;
    dw PLMEntries_nothing                                                ;949B04;

BlockInsideReaction_SpecialAir_PLMTable_Pointers:
    dw BlockInsideReaction_SpecialAir_PLMTable_crateria                  ;949B06;
    dw BlockInsideReaction_SpecialAir_PLMTable_brinstar                  ;949B08;
    dw BlockInsideReaction_SpecialAir_PLMTable_norfair                   ;949B0A;
    dw BlockInsideReaction_SpecialAir_PLMTable_wreckedShip               ;949B0C;
    dw BlockInsideReaction_SpecialAir_PLMTable_maridia                   ;949B0E;
    dw BlockInsideReaction_SpecialAir_PLMTable_tourian                   ;949B10;
    dw BlockInsideReaction_SpecialAir_PLMTable_colony                    ;949B12;
    dw BlockInsideReaction_SpecialAir_PLMTable_debug                     ;949B14;

BlockInsideReaction_SpecialAir:
    LDX.W $0DC4                                                          ;949B16;
    LDA.L $7F6401,X                                                      ;949B19;
    BMI .negativeBTS                                                     ;949B1D;
    AND.W #$FF00                                                         ;949B1F;
    XBA                                                                  ;949B22;
    ASL A                                                                ;949B23;
    TAX                                                                  ;949B24;
    JSR.W (BlockInsideReaction_SpecialAir_JumpTable,X)                   ;949B25;
    RTS                                                                  ;949B28;


.negativeBTS:
    XBA                                                                  ;949B29;
    AND.W #$007F                                                         ;949B2A;
    ASL A                                                                ;949B2D;
    TAY                                                                  ;949B2E;
    LDA.W $079F                                                          ;949B2F;
    ASL A                                                                ;949B32;
    TAX                                                                  ;949B33;
    LDA.W BlockInsideReaction_SpecialAir_PLMTable_Pointers,X             ;949B34;
    STA.B $22                                                            ;949B37;
    LDA.B ($22),Y                                                        ;949B39;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949B3B;
    RTS                                                                  ;949B3F;


BlockInsideReactionPointers:
    dw BlockInsideReaction_Air_ShootableAir_BombableAir                  ;949B40;
    dw BlockInsideReaction_Slope                                         ;949B42;
    dw BlockInsideReaction_SpikeAir                                      ;949B44;
    dw BlockInsideReaction_SpecialAir                                    ;949B46;
    dw BlockInsideReaction_Air_ShootableAir_BombableAir                  ;949B48;
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ;949B4A;
    dw BlockInsideReaction_Air_ShootableAir_BombableAir                  ;949B4C;
    dw BlockInsideReaction_Air_ShootableAir_BombableAir                  ;949B4E;
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb          ;949B50;
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb          ;949B52;
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb          ;949B54;
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb          ;949B56;
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb          ;949B58;
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ;949B5A;
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb          ;949B5C;
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb          ;949B5E;

SamusBlockInsideHandling:
    PHB                                                                  ;949B60;
    PHK                                                                  ;949B61;
    PLB                                                                  ;949B62;
    STZ.W $0B4C                                                          ;949B63;
    STZ.W $0B56                                                          ;949B66;
    STZ.W $0B58                                                          ;949B69;
    STZ.W $0B5A                                                          ;949B6C;
    STZ.W $0B5C                                                          ;949B6F;
    STZ.W $1E73                                                          ;949B72;
    LDA.W $0AF6                                                          ;949B75;
    STA.B $1A                                                            ;949B78;
    LDA.W $0AFA                                                          ;949B7A;
    CLC                                                                  ;949B7D;
    ADC.W $0B00                                                          ;949B7E;
    DEC A                                                                ;949B81;
    STA.W $0E02                                                          ;949B82;
    STA.B $1C                                                            ;949B85;
    STZ.B $1E                                                            ;949B87;
    STZ.B $20                                                            ;949B89;
    JSR.W CalculateBlockAt_12_1E_1C_20                                   ;949B8B;
    LDA.W $0DC4                                                          ;949B8E;
    ASL A                                                                ;949B91;
    TAX                                                                  ;949B92;
    LDA.L $7F0003,X                                                      ;949B93;
    AND.W #$00F0                                                         ;949B97;
    LSR A                                                                ;949B9A;
    LSR A                                                                ;949B9B;
    LSR A                                                                ;949B9C;
    TAX                                                                  ;949B9D;
    JSR.W (BlockInsideReactionPointers,X)                                ;949B9E;
    LDA.W #$0001                                                         ;949BA1;
    STA.W $1E73                                                          ;949BA4;
    LDA.W $0AFA                                                          ;949BA7;
    EOR.W $0E02                                                          ;949BAA;
    AND.W #$FFF0                                                         ;949BAD;
    BEQ .top                                                             ;949BB0;
    LDA.W $0AF6                                                          ;949BB2;
    STA.B $1A                                                            ;949BB5;
    LDA.W $0AFA                                                          ;949BB7;
    STA.B $1C                                                            ;949BBA;
    STZ.B $1E                                                            ;949BBC;
    STZ.B $20                                                            ;949BBE;
    JSR.W CalculateBlockAt_12_1E_1C_20                                   ;949BC0;
    LDA.W $0DC4                                                          ;949BC3;
    ASL A                                                                ;949BC6;
    TAX                                                                  ;949BC7;
    LDA.L $7F0003,X                                                      ;949BC8;
    AND.W #$00F0                                                         ;949BCC;
    LSR A                                                                ;949BCF;
    LSR A                                                                ;949BD0;
    LSR A                                                                ;949BD1;
    TAX                                                                  ;949BD2;
    JSR.W (BlockInsideReactionPointers,X)                                ;949BD3;

.top:
    LDA.W #$0002                                                         ;949BD6;
    STA.W $1E73                                                          ;949BD9;
    LDA.W $0AFA                                                          ;949BDC;
    SEC                                                                  ;949BDF;
    SBC.W $0B00                                                          ;949BE0;
    EOR.W $0E02                                                          ;949BE3;
    AND.W #$FFF0                                                         ;949BE6;
    BEQ .return                                                          ;949BE9;
    EOR.W $0AFA                                                          ;949BEB;
    AND.W #$FFF0                                                         ;949BEE;
    BEQ .return                                                          ;949BF1;
    LDA.W $0AF6                                                          ;949BF3;
    STA.B $1A                                                            ;949BF6;
    LDA.W $0AFA                                                          ;949BF8;
    SEC                                                                  ;949BFB;
    SBC.W $0B00                                                          ;949BFC;
    STA.B $1C                                                            ;949BFF;
    STZ.B $1E                                                            ;949C01;
    STZ.B $20                                                            ;949C03;
    JSR.W CalculateBlockAt_12_1E_1C_20                                   ;949C05;
    LDA.W $0DC4                                                          ;949C08;
    ASL A                                                                ;949C0B;
    TAX                                                                  ;949C0C;
    LDA.L $7F0003,X                                                      ;949C0D;
    AND.W #$00F0                                                         ;949C11;
    LSR A                                                                ;949C14;
    LSR A                                                                ;949C15;
    LSR A                                                                ;949C16;
    TAX                                                                  ;949C17;
    JSR.W (BlockInsideReactionPointers,X)                                ;949C18;

.return:
    PLB                                                                  ;949C1B;
    RTL                                                                  ;949C1C;


CalculateBlockAt_12_1E_1C_20:
    PHP                                                                  ;949C1D;
    REP #$30                                                             ;949C1E;
    LDA.B $1A                                                            ;949C20;
    CLC                                                                  ;949C22;
    ADC.B $1E                                                            ;949C23;
    BMI .giveUp                                                          ;949C25;
    CMP.W #$1000                                                         ;949C27;
    BPL .giveUp                                                          ;949C2A;
    AND.W #$FFF0                                                         ;949C2C;
    LSR A                                                                ;949C2F;
    LSR A                                                                ;949C30;
    LSR A                                                                ;949C31;
    LSR A                                                                ;949C32;
    STA.W $0DD4                                                          ;949C33;
    LDA.B $1C                                                            ;949C36;
    CLC                                                                  ;949C38;
    ADC.B $20                                                            ;949C39;
    BMI .giveUp                                                          ;949C3B;
    CMP.W #$1000                                                         ;949C3D;
    BPL .giveUp                                                          ;949C40;
    AND.W #$FFF0                                                         ;949C42;
    LSR A                                                                ;949C45;
    LSR A                                                                ;949C46;
    LSR A                                                                ;949C47;
    LSR A                                                                ;949C48;
    TAY                                                                  ;949C49;
    BEQ .zeroIndex                                                       ;949C4A;
    LDX.W #$0000                                                         ;949C4C;
    SEP #$20                                                             ;949C4F;
    LDA.W $07A5                                                          ;949C51;
    STA.W HW_WRMPYA                                                      ;949C54;
    STY.W HW_WRMPYB                                                      ;949C57;
    NOP                                                                  ;949C5A;
    NOP                                                                  ;949C5B;
    NOP                                                                  ;949C5C;
    REP #$20                                                             ;949C5D;
    LDA.W HW_RDMPY                                                       ;949C5F;

.zeroIndex:
    CLC                                                                  ;949C62;
    ADC.W $0DD4                                                          ;949C63;
    STA.W $0DC4                                                          ;949C66;
    BRA .return                                                          ;949C69;


.giveUp:
    LDA.W #$FFFF                                                         ;949C6B;
    STA.W $0DC4                                                          ;949C6E;

.return:
    PLP                                                                  ;949C71;
    RTS                                                                  ;949C72;


DetermineProjectile_Prototype:
    PHP                                                                  ;949C73;
    PHB                                                                  ;949C74;
    PHX                                                                  ;949C75;
    PEA.W $9000                                                          ;949C76;
    PLB                                                                  ;949C79;
    PLB                                                                  ;949C7A;
    LDA.W $0C19,X                                                        ;949C7B;
    AND.W #$000F                                                         ;949C7E;
    BNE .notBeam                                                         ;949C81;
    LDA.W $0C18,X                                                        ;949C83;
    AND.W #$000F                                                         ;949C86;
    STA.B $12                                                            ;949C89;
    ASL A                                                                ;949C8B;
    ADC.B $12                                                            ;949C8C;
    INC A                                                                ;949C8E;
    INC A                                                                ;949C8F;
    TAX                                                                  ;949C90;
    LDA.W ProtoWeaponConstants_Beams,X                                   ;949C91;
    AND.W #$00FF                                                         ;949C94;
    STA.W $0DD2                                                          ;949C97;
    BRA .return                                                          ;949C9A;


.notBeam:
    ASL A                                                                ;949C9C;
    INC A                                                                ;949C9D;
    TAX                                                                  ;949C9E;
    LDA.W ProtoWeaponConstants_NonBeams,X                                ;949C9F;
    AND.W #$00FF                                                         ;949CA2;
    STA.W $0DD2                                                          ;949CA5;

.return:
    PLX                                                                  ;949CA8;
    PLB                                                                  ;949CA9;
    PLP                                                                  ;949CAA;
    RTS                                                                  ;949CAB;


BombAndPowerBombExplosionBlockCollisionHandling:
    PHP                                                                  ;949CAC;
    PHB                                                                  ;949CAD;
    PHK                                                                  ;949CAE;
    PLB                                                                  ;949CAF;
    REP #$30                                                             ;949CB0;
    JSR.W DetermineProjectile_Prototype                                  ;949CB2;
    LDA.W $0B64,X                                                        ;949CB5;
    BMI .return                                                          ;949CB8;
    STA.B $1A                                                            ;949CBA;
    XBA                                                                  ;949CBC;
    AND.W #$00FF                                                         ;949CBD;
    CMP.W $07A9                                                          ;949CC0;
    BPL .return                                                          ;949CC3;
    LDA.W $0B78,X                                                        ;949CC5;
    BMI .return                                                          ;949CC8;
    STA.B $1C                                                            ;949CCA;
    XBA                                                                  ;949CCC;
    AND.W #$00FF                                                         ;949CCD;
    CMP.W $07AB                                                          ;949CD0;
    BPL .return                                                          ;949CD3;
    STZ.B $1E                                                            ;949CD5;
    STZ.B $20                                                            ;949CD7;
    STZ.W $0DC4                                                          ;949CD9;
    PHX                                                                  ;949CDC;
    JSR.W CalculateBlockAt_12_1E_1C_20                                   ;949CDD;
    PLX                                                                  ;949CE0;
    LDA.W $0DD2                                                          ;949CE1;
    CMP.W #$0002                                                         ;949CE4;
    BEQ .bomb                                                            ;949CE7;
    JSR.W PowerBombExplosionBlockCollisionHandling                       ;949CE9;
    BRA .return                                                          ;949CEC;


.bomb:
    JSR.W BombExplosionBlockCollisionHandling                            ;949CEE;

.return:
    PLB                                                                  ;949CF1;
    PLP                                                                  ;949CF2;
    RTL                                                                  ;949CF3;


BombExplosionBlockCollisionHandling:
    LDA.W $0C7C,X                                                        ;949CF4;
    BNE .return                                                          ;949CF7;
    LDA.W $0C18,X                                                        ;949CF9;
    BIT.W #$0001                                                         ;949CFC;
    BNE .return                                                          ;949CFF;
    ORA.W #$0001                                                         ;949D01;
    STA.W $0C18,X                                                        ;949D04;
    LDA.W $0DC4                                                          ;949D07;
    CMP.W #$FFFF                                                         ;949D0A;
    BEQ .return                                                          ;949D0D;
    LDY.W #$0000                                                         ;949D0F;
    LDA.W $0DC4                                                          ;949D12;
    ASL A                                                                ;949D15;
    TAX                                                                  ;949D16;
    JSR.W BlockBombedReaction                                            ;949D17;
    JSR.W MoveBlockIndexX_OneBlockUp                                     ;949D1A;
    JSR.W BlockBombedReaction                                            ;949D1D;
    JSR.W MoveBlockIndexX_OneRowDown_OneColumnRight                      ;949D20;
    JSR.W BlockBombedReaction                                            ;949D23;
    JSR.W MoveBlockIndexX_TwoColumnsLeft                                 ;949D26;
    JSR.W BlockBombedReaction                                            ;949D29;
    JSR.W MoveBlockIndexX_OneRowDown_OneColumRight_duplicate             ;949D2C;
    JSR.W BlockBombedReaction                                            ;949D2F;

.return:
    RTS                                                                  ;949D32;


RTS_949D33:
    RTS                                                                  ;949D33;


MoveBlockIndexX_OneBlockUp:
    TXA                                                                  ;949D34;
    SEC                                                                  ;949D35;
    SBC.W $07A5                                                          ;949D36;
    SBC.W $07A5                                                          ;949D39;
    TAX                                                                  ;949D3C;
    RTS                                                                  ;949D3D;


MoveBlockIndexX_OneRowDown_OneColumnRight:
    TXA                                                                  ;949D3E;
    SEC                                                                  ;949D3F;
    ADC.W $07A5                                                          ;949D40;
    ADC.W $07A5                                                          ;949D43;
    INC A                                                                ;949D46;
    TAX                                                                  ;949D47;
    RTS                                                                  ;949D48;


MoveBlockIndexX_TwoColumnsLeft:
    DEX                                                                  ;949D49;
    DEX                                                                  ;949D4A;
    DEX                                                                  ;949D4B;
    DEX                                                                  ;949D4C;
    RTS                                                                  ;949D4D;


MoveBlockIndexX_OneRowDown_OneColumRight_duplicate:
    TXA                                                                  ;949D4E;
    SEC                                                                  ;949D4F;
    ADC.W $07A5                                                          ;949D50;
    ADC.W $07A5                                                          ;949D53;
    INC A                                                                ;949D56;
    TAX                                                                  ;949D57;
    RTS                                                                  ;949D58;


CLCRTS_949D59:
    CLC                                                                  ;949D59;
    RTS                                                                  ;949D5A;


SECRTS_949D5B:
    SEC                                                                  ;949D5B;
    RTS                                                                  ;949D5C;


BombSpreadBlockReaction_Slope:
    LDX.W $0DC4                                                          ;949D5D;
    LDA.L $7F6402,X                                                      ;949D60;
    AND.W #$001F                                                         ;949D64;
    CMP.W #$0005                                                         ;949D67;
    BCC .returnCollision                                                 ;949D6A;
    JMP.W BlockShotReaction_Horizontal_Slope_NonSquare                   ;949D6C;


.returnCollision:
    SEC                                                                  ;949D6F;
    RTS                                                                  ;949D70;


BlockBombedReaction_SpecialBlock:
    LDX.W $0DC4                                                          ;949D71;
    LDA.L $7F6401,X                                                      ;949D74;
    AND.W #$FF00                                                         ;949D78;
    XBA                                                                  ;949D7B;
    BMI .areaDependent                                                   ;949D7C;
    ASL A                                                                ;949D7E;
    TAX                                                                  ;949D7F;
    LDA.W BlockBombedReaction_SpecialBlock_PLMTable_areaIndependent,X    ;949D80;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949D83;
    REP #$40                                                             ;949D87;
    SEC                                                                  ;949D89;
    RTS                                                                  ;949D8A;


.areaDependent:
    AND.W #$007F                                                         ;949D8B;
    ASL A                                                                ;949D8E;
    TAY                                                                  ;949D8F;
    LDA.W $079F                                                          ;949D90;
    ASL A                                                                ;949D93;
    TAX                                                                  ;949D94;
    LDA.W BlockBombedReaction_SpecialBlock_PLMTable_areaPointers,X       ;949D95;
    STA.B $12                                                            ;949D98;
    LDA.B ($12),Y                                                        ;949D9A;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949D9C;
    REP #$40                                                             ;949DA0;
    SEC                                                                  ;949DA2;
    RTS                                                                  ;949DA3;


BlockBombedReaction_SpecialBlock_PLMTable_areaIndependent:
    dw PLMEntries_1x1RespawningCrumbleBlock                              ;949DA4;
    dw PLMEntries_2x1RespawningCrumbleBlock                              ;949DA6;
    dw PLMEntries_1x2RespawningCrumbleBlock                              ;949DA8;
    dw PLMEntries_2x2RespawningCrumbleBlock                              ;949DAA;
    dw PLMEntries_1x1RespawningCrumbleBlock                              ;949DAC;
    dw PLMEntries_2x1RespawningCrumbleBlock                              ;949DAE;
    dw PLMEntries_1x2RespawningCrumbleBlock                              ;949DB0;
    dw PLMEntries_2x2RespawningCrumbleBlock                              ;949DB2;
    dw PLMEntries_nothing                                                ;949DB4;
    dw PLMEntries_nothing                                                ;949DB6;
    dw PLMEntries_nothing                                                ;949DB8;
    dw PLMEntries_nothing                                                ;949DBA;
    dw PLMEntries_nothing                                                ;949DBC;
    dw PLMEntries_nothing                                                ;949DBE;
    dw PLMEntries_BombReaction_SpeedBoostBlock                           ;949DC0;
    dw PLMEntries_BombReaction_SpeedBoostBlock                           ;949DC2;

BlockBombedReaction_SpecialBlock_PLMTable_crateria:
    dw PLMEntries_nothing                                                ;949DC4;
    dw PLMEntries_nothing                                                ;949DC6;
    dw PLMEntries_nothing                                                ;949DC8;
    dw PLMEntries_nothing                                                ;949DCA;
    dw PLMEntries_nothing                                                ;949DCC;
    dw PLMEntries_nothing                                                ;949DCE;
    dw PLMEntries_nothing                                                ;949DD0;
    dw PLMEntries_nothing                                                ;949DD2;

BlockBombedReaction_SpecialBlock_PLMTable_brinstar:
    dw PLMEntries_nothing                                                ;949DD4;
    dw PLMEntries_nothing                                                ;949DD6;
    dw PLMEntries_BombReaction_SpeedBoostBlock                           ;949DD8;
    dw PLMEntries_BombReaction_SpeedBoostBlock                           ;949DDA;
    dw PLMEntries_BombReaction_SpeedBoostBlock                           ;949DDC;
    dw PLMEntries_BombReaction_SpeedBoostBlock                           ;949DDE;
    dw PLMEntries_nothing                                                ;949DE0;
    dw PLMEntries_nothing                                                ;949DE2;

BlockBombedReaction_SpecialBlock_PLMTable_norfair:
    dw PLMEntries_nothing                                                ;949DE4;
    dw PLMEntries_nothing                                                ;949DE6;
    dw PLMEntries_nothing                                                ;949DE8;
    dw PLMEntries_nothing                                                ;949DEA;
    dw PLMEntries_nothing                                                ;949DEC;
    dw PLMEntries_nothing                                                ;949DEE;
    dw PLMEntries_nothing                                                ;949DF0;
    dw PLMEntries_nothing                                                ;949DF2;

BlockBombedReaction_SpecialBlock_PLMTable_wreckedShip:
    dw PLMEntries_nothing                                                ;949DF4;
    dw PLMEntries_nothing                                                ;949DF6;
    dw PLMEntries_nothing                                                ;949DF8;
    dw PLMEntries_nothing                                                ;949DFA;
    dw PLMEntries_nothing                                                ;949DFC;
    dw PLMEntries_nothing                                                ;949DFE;
    dw PLMEntries_nothing                                                ;949E00;
    dw PLMEntries_nothing                                                ;949E02;

BlockBombedReaction_SpecialBlock_PLMTable_maridia:
    dw PLMEntries_nothing                                                ;949E04;
    dw PLMEntries_nothing                                                ;949E06;
    dw PLMEntries_nothing                                                ;949E08;
    dw PLMEntries_nothing                                                ;949E0A;
    dw PLMEntries_nothing                                                ;949E0C;
    dw PLMEntries_nothing                                                ;949E0E;
    dw PLMEntries_nothing                                                ;949E10;
    dw PLMEntries_nothing                                                ;949E12;

BlockBombedReaction_SpecialBlock_PLMTable_tourian:
    dw PLMEntries_nothing                                                ;949E14;
    dw PLMEntries_nothing                                                ;949E16;
    dw PLMEntries_nothing                                                ;949E18;
    dw PLMEntries_nothing                                                ;949E1A;
    dw PLMEntries_nothing                                                ;949E1C;
    dw PLMEntries_nothing                                                ;949E1E;
    dw PLMEntries_nothing                                                ;949E20;
    dw PLMEntries_nothing                                                ;949E22;

BlockBombedReaction_SpecialBlock_PLMTable_colony:
    dw PLMEntries_nothing                                                ;949E24;
    dw PLMEntries_nothing                                                ;949E26;
    dw PLMEntries_nothing                                                ;949E28;
    dw PLMEntries_nothing                                                ;949E2A;
    dw PLMEntries_nothing                                                ;949E2C;
    dw PLMEntries_nothing                                                ;949E2E;
    dw PLMEntries_nothing                                                ;949E30;
    dw PLMEntries_nothing                                                ;949E32;

BlockBombedReaction_SpecialBlock_PLMTable_debug:
    dw PLMEntries_nothing                                                ;949E34;
    dw PLMEntries_nothing                                                ;949E36;
    dw PLMEntries_nothing                                                ;949E38;
    dw PLMEntries_nothing                                                ;949E3A;
    dw PLMEntries_nothing                                                ;949E3C;
    dw PLMEntries_nothing                                                ;949E3E;
    dw PLMEntries_nothing                                                ;949E40;
    dw PLMEntries_nothing                                                ;949E42;

BlockBombedReaction_SpecialBlock_PLMTable_areaPointers:
    dw BlockBombedReaction_SpecialBlock_PLMTable_crateria                ;949E44;
    dw BlockBombedReaction_SpecialBlock_PLMTable_brinstar                ;949E46;
    dw BlockBombedReaction_SpecialBlock_PLMTable_norfair                 ;949E48;
    dw BlockBombedReaction_SpecialBlock_PLMTable_wreckedShip             ;949E4A;
    dw BlockBombedReaction_SpecialBlock_PLMTable_maridia                 ;949E4C;
    dw BlockBombedReaction_SpecialBlock_PLMTable_tourian                 ;949E4E;
    dw BlockBombedReaction_SpecialBlock_PLMTable_colony                  ;949E50;
    dw BlockBombedReaction_SpecialBlock_PLMTable_debug                   ;949E52;

RTS_949E54:
    RTS                                                                  ;949E54;


BlockBombShotGrappledReaction_ShootableAir:
    LDX.W $0DC4                                                          ;949E55;
    LDA.L $7F6401,X                                                      ;949E58;
    AND.W #$FF00                                                         ;949E5C;
    XBA                                                                  ;949E5F;
    BMI .returnDuplicate                                                 ;949E60;
    ASL A                                                                ;949E62;
    TAX                                                                  ;949E63;
    LDA.W BlockBombShotGrappledReaction_Shootable_PLMTable_noArea,X      ;949E64;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949E67;
    REP #$40                                                             ;949E6B;
    CLC                                                                  ;949E6D; >.<
    RTS                                                                  ;949E6E;


.returnDuplicate:
    REP #$40                                                             ;949E6F;
    CLC                                                                  ;949E71; >.<
    RTS                                                                  ;949E72;


BlockBombShotGrappledReaction_ShootableBlock:
    LDX.W $0DC4                                                          ;949E73;
    LDA.L $7F6401,X                                                      ;949E76;
    AND.W #$FF00                                                         ;949E7A;
    XBA                                                                  ;949E7D;
    BMI .areaDependent                                                   ;949E7E;
    ASL A                                                                ;949E80;
    TAX                                                                  ;949E81;
    LDA.W BlockBombShotGrappledReaction_Shootable_PLMTable_noArea,X      ;949E82;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949E85;
    REP #$40                                                             ;949E89;
    SEC                                                                  ;949E8B;
    RTS                                                                  ;949E8C;


.areaDependent:
    AND.W #$007F                                                         ;949E8D;
    ASL A                                                                ;949E90;
    TAY                                                                  ;949E91;
    LDA.W $079F                                                          ;949E92;
    ASL A                                                                ;949E95;
    TAX                                                                  ;949E96;
    LDA.W BlockBombShotGrappledReaction_Shootable_PLMTable_areaPointer,X ;949E97;
    STA.B $12                                                            ;949E9A;
    LDA.B ($12),Y                                                        ;949E9C;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949E9E;
    REP #$40                                                             ;949EA2;
    SEC                                                                  ;949EA4;
    RTS                                                                  ;949EA5;


BlockBombShotGrappledReaction_Shootable_PLMTable_noArea:
    dw PLMEntries_Reaction_1x1RespawningShotBlock                        ;949EA6;
    dw PLMEntries_Reaction_2x1RespawningShotBlock                        ;949EA8;
    dw PLMEntries_Reaction_1x2RespawningShotBlock                        ;949EAA;
    dw PLMEntries_Reaction_2x2RespawningShotBlock                        ;949EAC;
    dw PLMEntries_Reaction_1x1ShotBlock                                  ;949EAE;
    dw PLMEntries_Reaction_2x1ShotBlock                                  ;949EB0;
    dw PLMEntries_Reaction_1x2ShotBlock                                  ;949EB2;
    dw PLMEntries_Reaction_2x2ShotBlock                                  ;949EB4;
    dw PLMEntries_Reaction_RespawningPowerBombBlock                      ;949EB6;
    dw PLMEntries_Reaction_PowerBombBlock                                ;949EB8;
    dw PLMEntries_Reaction_RespawningSuperMissileBlock                   ;949EBA;
    dw PLMEntries_Reaction_SuperMissileBlock                             ;949EBC;
    dw PLMEntries_nothing                                                ;949EBE;
    dw PLMEntries_nothing                                                ;949EC0;
    dw PLMEntries_nothing                                                ;949EC2;
    dw PLMEntries_nothing                                                ;949EC4;
    dw PLMEntries_gateBlock                                              ;949EC6;
    dw PLMEntries_nothing                                                ;949EC8;
    dw PLMEntries_nothing                                                ;949ECA;
    dw PLMEntries_nothing                                                ;949ECC;
    dw PLMEntries_nothing                                                ;949ECE;
    dw PLMEntries_nothing                                                ;949ED0;
    dw PLMEntries_nothing                                                ;949ED2;
    dw PLMEntries_nothing                                                ;949ED4;
    dw PLMEntries_nothing                                                ;949ED6;
    dw PLMEntries_nothing                                                ;949ED8;
    dw PLMEntries_nothing                                                ;949EDA;
    dw PLMEntries_nothing                                                ;949EDC;
    dw PLMEntries_nothing                                                ;949EDE;
    dw PLMEntries_nothing                                                ;949EE0;
    dw PLMEntries_nothing                                                ;949EE2;
    dw PLMEntries_nothing                                                ;949EE4;
    dw PLMEntries_nothing                                                ;949EE6;
    dw PLMEntries_nothing                                                ;949EE8;
    dw PLMEntries_nothing                                                ;949EEA;
    dw PLMEntries_nothing                                                ;949EEC;
    dw PLMEntries_nothing                                                ;949EEE;
    dw PLMEntries_nothing                                                ;949EF0;
    dw PLMEntries_nothing                                                ;949EF2;
    dw PLMEntries_nothing                                                ;949EF4;
    dw PLMEntries_nothing                                                ;949EF6;
    dw PLMEntries_nothing                                                ;949EF8;
    dw PLMEntries_nothing                                                ;949EFA;
    dw PLMEntries_nothing                                                ;949EFC;
    dw PLMEntries_nothing                                                ;949EFE;
    dw PLMEntries_nothing                                                ;949F00;
    dw PLMEntries_nothing                                                ;949F02;
    dw PLMEntries_nothing                                                ;949F04;
    dw PLMEntries_nothing                                                ;949F06;
    dw PLMEntries_nothing                                                ;949F08;
    dw PLMEntries_nothing                                                ;949F0A;
    dw PLMEntries_nothing                                                ;949F0C;
    dw PLMEntries_nothing                                                ;949F0E;
    dw PLMEntries_nothing                                                ;949F10;
    dw PLMEntries_nothing                                                ;949F12;
    dw PLMEntries_nothing                                                ;949F14;
    dw PLMEntries_nothing                                                ;949F16;
    dw PLMEntries_nothing                                                ;949F18;
    dw PLMEntries_nothing                                                ;949F1A;
    dw PLMEntries_nothing                                                ;949F1C;
    dw PLMEntries_nothing                                                ;949F1E;
    dw PLMEntries_nothing                                                ;949F20;
    dw PLMEntries_nothing                                                ;949F22;
    dw PLMEntries_nothing                                                ;949F24;
    dw PLMEntries_blueDoorFacingLeft                                     ;949F26;
    dw PLMEntries_blueDoorFacingRight                                    ;949F28;
    dw PLMEntries_blueDoorFacingUp                                       ;949F2A;
    dw PLMEntries_blueDoorFacingDown                                     ;949F2C;
    dw PLMEntries_genericShotTriggerForAPLM                              ;949F2E;
    dw PLMEntries_ItemCollisionDetection                                 ;949F30;
    dw PLMEntries_leftBlueGateTrigger                                    ;949F32;
    dw PLMEntries_rightBlueGateTrigger                                   ;949F34;
    dw PLMEntries_leftRedGateTrigger                                     ;949F36;
    dw PLMEntries_rightRedGateTrigger                                    ;949F38;
    dw PLMEntries_leftGreenGateTrigger                                   ;949F3A;
    dw PLMEntries_rightGreenGateTrigger                                  ;949F3C;
    dw PLMEntries_leftYellowGateTrigger                                  ;949F3E;
    dw PLMEntries_rightYellowGateTrigger                                 ;949F40;
    dw PLMEntries_nothing                                                ;949F42;
    dw PLMEntries_Reaction_CrittersEscapeBlock                           ;949F44;

BlockBombShotGrappledReaction_Shootable_PLMTable_crateria:
    dw PLMEntries_nothing                                                ;949F46;
    dw PLMEntries_nothing                                                ;949F48;
    dw PLMEntries_nothing                                                ;949F4A;
    dw PLMEntries_nothing                                                ;949F4C;
    dw PLMEntries_nothing                                                ;949F4E;
    dw PLMEntries_nothing                                                ;949F50;
    dw PLMEntries_nothing                                                ;949F52;
    dw PLMEntries_nothing                                                ;949F54;

BlockBombShotGrappledReaction_Shootable_PLMTable_brinstar:
    dw PLMEntries_nothing                                                ;949F56;
    dw PLMEntries_nothing                                                ;949F58;
    dw PLMEntries_nothing                                                ;949F5A;
    dw PLMEntries_nothing                                                ;949F5C;
    dw PLMEntries_nothing                                                ;949F5E;
    dw PLMEntries_nothing                                                ;949F60;
    dw PLMEntries_nothing                                                ;949F62;
    dw PLMEntries_nothing                                                ;949F64;

BlockBombShotGrappledReaction_Shootable_PLMTable_norfair:
    dw PLMEntries_nothing                                                ;949F66;
    dw PLMEntries_nothing                                                ;949F68;
    dw PLMEntries_nothing                                                ;949F6A;
    dw PLMEntries_nothing                                                ;949F6C;
    dw PLMEntries_nothing                                                ;949F6E;
    dw PLMEntries_nothing                                                ;949F70;
    dw PLMEntries_nothing                                                ;949F72;
    dw PLMEntries_nothing                                                ;949F74;

BlockBombShotGrappledReaction_Shootable_PLMTable_wreckedShip:
    dw PLMEntries_nothing                                                ;949F76;
    dw PLMEntries_nothing                                                ;949F78;
    dw PLMEntries_nothing                                                ;949F7A;
    dw PLMEntries_nothing                                                ;949F7C;
    dw PLMEntries_nothing                                                ;949F7E;
    dw PLMEntries_nothing                                                ;949F80;
    dw PLMEntries_nothing                                                ;949F82;
    dw PLMEntries_nothing                                                ;949F84;

BlockBombShotGrappledReaction_Shootable_PLMTable_maridia:
    dw PLMEntries_nothing                                                ;949F86;
    dw PLMEntries_nothing                                                ;949F88;
    dw PLMEntries_nothing                                                ;949F8A;
    dw PLMEntries_nothing                                                ;949F8C;
    dw PLMEntries_nothing                                                ;949F8E;
    dw PLMEntries_nothing                                                ;949F90;
    dw PLMEntries_nothing                                                ;949F92;
    dw PLMEntries_nothing                                                ;949F94;

BlockBombShotGrappledReaction_Shootable_PLMTable_tourian:
    dw PLMEntries_nothing                                                ;949F96;
    dw PLMEntries_nothing                                                ;949F98;
    dw PLMEntries_nothing                                                ;949F9A;
    dw PLMEntries_nothing                                                ;949F9C;
    dw PLMEntries_nothing                                                ;949F9E;
    dw PLMEntries_nothing                                                ;949FA0;
    dw PLMEntries_nothing                                                ;949FA2;
    dw PLMEntries_nothing                                                ;949FA4;

BlockBombShotGrappledReaction_Shootable_PLMTable_colony:
    dw PLMEntries_nothing                                                ;949FA6;
    dw PLMEntries_nothing                                                ;949FA8;
    dw PLMEntries_nothing                                                ;949FAA;
    dw PLMEntries_nothing                                                ;949FAC;
    dw PLMEntries_nothing                                                ;949FAE;
    dw PLMEntries_nothing                                                ;949FB0;
    dw PLMEntries_nothing                                                ;949FB2;
    dw PLMEntries_nothing                                                ;949FB4;

BlockBombShotGrappledReaction_Shootable_PLMTable_debug:
    dw PLMEntries_nothing                                                ;949FB6;
    dw PLMEntries_nothing                                                ;949FB8;
    dw PLMEntries_nothing                                                ;949FBA;
    dw PLMEntries_nothing                                                ;949FBC;
    dw PLMEntries_nothing                                                ;949FBE;
    dw PLMEntries_nothing                                                ;949FC0;
    dw PLMEntries_nothing                                                ;949FC2;
    dw PLMEntries_nothing                                                ;949FC4;

BlockBombShotGrappledReaction_Shootable_PLMTable_areaPointer:
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_crateria         ;949FC6;
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_brinstar         ;949FC8;
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_norfair          ;949FCA;
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_wreckedShip      ;949FCC;
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_maridia          ;949FCE;
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_tourian          ;949FD0;
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_colony           ;949FD2;
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_debug            ;949FD4;

BlockShotBombedGrappledReaction_BombableAir:
    LDX.W $0DC4                                                          ;949FD6;
    LDA.L $7F6401,X                                                      ;949FD9;
    AND.W #$FF00                                                         ;949FDD;
    XBA                                                                  ;949FE0;
    BMI .returnDuplicate                                                 ;949FE1;
    ASL A                                                                ;949FE3;
    TAX                                                                  ;949FE4;
    LDA.W BlockShotBombedGrappledReaction_Bombable_PLMTable,X            ;949FE5;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949FE8;
    REP #$40                                                             ;949FEC;
    CLC                                                                  ;949FEE; >.<
    RTS                                                                  ;949FEF;


.returnDuplicate:
    REP #$40                                                             ;949FF0;
    CLC                                                                  ;949FF2; >.<
    RTS                                                                  ;949FF3;


BlockShotBombedGrappledReaction_BombableBlock:
    LDX.W $0DC4                                                          ;949FF4;
    LDA.L $7F6401,X                                                      ;949FF7;
    AND.W #$FF00                                                         ;949FFB;
    XBA                                                                  ;949FFE;
    BMI .returnDuplicate                                                 ;949FFF;
    ASL A                                                                ;94A001;
    TAX                                                                  ;94A002;
    LDA.W BlockShotBombedGrappledReaction_Bombable_PLMTable,X            ;94A003;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;94A006;
    REP #$40                                                             ;94A00A;
    SEC                                                                  ;94A00C;
    RTS                                                                  ;94A00D;


.returnDuplicate:
    REP #$40                                                             ;94A00E;
    SEC                                                                  ;94A010;
    RTS                                                                  ;94A011;


BlockShotBombedGrappledReaction_Bombable_PLMTable:
    dw PLMEntries_Reaction_1x1RespawningBombBlock                        ;94A012;
    dw PLMEntries_Reaction_2x1RespawningBombBlock                        ;94A014;
    dw PLMEntries_Reaction_1x2RespawningBombBlock                        ;94A016;
    dw PLMEntries_Reaction_2x2RespawningBombBlock                        ;94A018;
    dw PLMEntries_Reaction_1x1BombBlock                                  ;94A01A;
    dw PLMEntries_Reaction_2x1BombBlock                                  ;94A01C;
    dw PLMEntries_Reaction_1x2BombBlock                                  ;94A01E;
    dw PLMEntries_Reaction_2x2BombBlock                                  ;94A020;
    dw PLMEntries_nothing                                                ;94A022;
    dw PLMEntries_nothing                                                ;94A024;
    dw PLMEntries_nothing                                                ;94A026;
    dw PLMEntries_nothing                                                ;94A028;
    dw PLMEntries_nothing                                                ;94A02A;
    dw PLMEntries_nothing                                                ;94A02C;
    dw PLMEntries_nothing                                                ;94A02E;
    dw PLMEntries_nothing                                                ;94A030;

BlockBombedReactionPointers:
    dw CLCRTS_949D59                                                     ;94A032;
    dw CLCRTS_949D59                                                     ;94A034;
    dw CLCRTS_949D59                                                     ;94A036;
    dw CLCRTS_949D59                                                     ;94A038;
    dw BlockBombShotGrappledReaction_ShootableAir                        ;94A03A;
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ;94A03C;
    dw CLCRTS_949D59                                                     ;94A03E;
    dw BlockShotBombedGrappledReaction_BombableAir                       ;94A040;
    dw SECRTS_949D5B                                                     ;94A042;
    dw SECRTS_949D5B                                                     ;94A044;
    dw SECRTS_949D5B                                                     ;94A046;
    dw BlockBombedReaction_SpecialBlock                                  ;94A048;
    dw BlockBombShotGrappledReaction_ShootableBlock                      ;94A04A;
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ;94A04C;
    dw SECRTS_949D5B                                                     ;94A04E;
    dw BlockShotBombedGrappledReaction_BombableBlock                     ;94A050;

BlockBombedReaction:
    PHX                                                                  ;94A052;
    STX.W $0DC4                                                          ;94A053;
    LSR.W $0DC4                                                          ;94A056;
    LDA.L $7F0002,X                                                      ;94A059;
    AND.W #$F000                                                         ;94A05D;
    XBA                                                                  ;94A060;
    LSR A                                                                ;94A061;
    LSR A                                                                ;94A062;
    LSR A                                                                ;94A063;
    TAX                                                                  ;94A064;
    JSR.W (BlockBombedReactionPointers,X)                                ;94A065;
    PLX                                                                  ;94A068;
    RTS                                                                  ;94A069;


PowerBombExplosionBlockCollisionHandling:
    LDA.W $0C7C,X                                                        ;94A06A;
    BEQ .zero                                                            ;94A06D;
    BPL .return                                                          ;94A06F;
    STZ.W $0C7C,X                                                        ;94A071;

.return:
    RTS                                                                  ;94A074;


.zero:
    LDA.W $0CEB                                                          ;94A075;
    AND.W #$00FF                                                         ;94A078;
    STA.B $12                                                            ;94A07B;
    ASL A                                                                ;94A07D;
    ADC.B $12                                                            ;94A07E;
    LSR A                                                                ;94A080;
    LSR A                                                                ;94A081;
    STA.B $14                                                            ;94A082;
    LDA.W $0CE2                                                          ;94A084;
    SEC                                                                  ;94A087;
    SBC.B $12                                                            ;94A088;
    BPL .set16                                                           ;94A08A;
    LDA.W #$0000                                                         ;94A08C;

.set16:
    LSR A                                                                ;94A08F;
    LSR A                                                                ;94A090;
    LSR A                                                                ;94A091;
    LSR A                                                                ;94A092;
    STA.B $16                                                            ;94A093;
    LDA.W $0CE2                                                          ;94A095;
    CLC                                                                  ;94A098;
    ADC.B $12                                                            ;94A099;
    LSR A                                                                ;94A09B;
    LSR A                                                                ;94A09C;
    LSR A                                                                ;94A09D;
    LSR A                                                                ;94A09E;
    CMP.W $07A5                                                          ;94A09F;
    BCC .set18                                                           ;94A0A2;
    LDA.W $07A5                                                          ;94A0A4;
    DEC A                                                                ;94A0A7;

.set18:
    STA.B $18                                                            ;94A0A8;
    LDA.W $0CE4                                                          ;94A0AA;
    SEC                                                                  ;94A0AD;
    SBC.B $14                                                            ;94A0AE;
    BPL .set1A                                                           ;94A0B0;
    LDA.W #$0000                                                         ;94A0B2;

.set1A:
    LSR A                                                                ;94A0B5;
    LSR A                                                                ;94A0B6;
    LSR A                                                                ;94A0B7;
    LSR A                                                                ;94A0B8;
    STA.B $1A                                                            ;94A0B9;
    LDA.W $0CE4                                                          ;94A0BB;
    CLC                                                                  ;94A0BE;
    ADC.B $14                                                            ;94A0BF;
    LSR A                                                                ;94A0C1;
    LSR A                                                                ;94A0C2;
    LSR A                                                                ;94A0C3;
    LSR A                                                                ;94A0C4;
    CMP.W $07A7                                                          ;94A0C5;
    BCC .set1C                                                           ;94A0C8;
    LDA.W $07A7                                                          ;94A0CA;
    DEC A                                                                ;94A0CD;

.set1C:
    STA.B $1C                                                            ;94A0CE;
    LDA.B $15                                                            ;94A0D0;
    AND.W #$FF00                                                         ;94A0D2;
    ORA.B $1A                                                            ;94A0D5;
    PHA                                                                  ;94A0D7;
    JSR.W PowerBombExplosionBlockCollisionHandling_Row                   ;94A0D8;
    PLA                                                                  ;94A0DB;
    JSR.W PowerBombExplosionBlockCollisionHandling_Column                ;94A0DC;
    LDA.B $15                                                            ;94A0DF;
    AND.W #$FF00                                                         ;94A0E1;
    ORA.B $1C                                                            ;94A0E4;
    JSR.W PowerBombExplosionBlockCollisionHandling_Row                   ;94A0E6;
    LDA.B $17                                                            ;94A0E9;
    AND.W #$FF00                                                         ;94A0EB;
    ORA.B $1A                                                            ;94A0EE;
    JSR.W PowerBombExplosionBlockCollisionHandling_Column                ;94A0F0;
    RTS                                                                  ;94A0F3;


PowerBombExplosionBlockCollisionHandling_Row:
    SEP #$20                                                             ;94A0F4;
    STA.W HW_WRMPYA                                                      ;94A0F6;
    LDA.W $07A5                                                          ;94A0F9;
    STA.W HW_WRMPYB                                                      ;94A0FC;
    LDA.B #$00                                                           ;94A0FF;
    XBA                                                                  ;94A101;
    REP #$31                                                             ;94A102;
    ADC.W HW_RDMPY                                                       ;94A104;
    ASL A                                                                ;94A107;
    TAX                                                                  ;94A108;
    LDA.B $18                                                            ;94A109;
    SEC                                                                  ;94A10B;
    SBC.B $16                                                            ;94A10C;
    TAY                                                                  ;94A10E;

.loop:
    PHY                                                                  ;94A10F;
    JSR.W BlockBombedReaction                                            ;94A110;
    PLY                                                                  ;94A113;
    INX                                                                  ;94A114;
    INX                                                                  ;94A115;
    DEY                                                                  ;94A116;
    BPL .loop                                                            ;94A117;
    RTS                                                                  ;94A119;


PowerBombExplosionBlockCollisionHandling_Column:
    SEP #$20                                                             ;94A11A;
    STA.W HW_WRMPYA                                                      ;94A11C;
    LDA.W $07A5                                                          ;94A11F;
    STA.W HW_WRMPYB                                                      ;94A122;
    LDA.B #$00                                                           ;94A125;
    XBA                                                                  ;94A127;
    REP #$31                                                             ;94A128;
    ADC.W HW_RDMPY                                                       ;94A12A;
    ASL A                                                                ;94A12D;
    TAX                                                                  ;94A12E;
    LDA.B $1C                                                            ;94A12F;
    SEC                                                                  ;94A131;
    SBC.B $1A                                                            ;94A132;
    TAY                                                                  ;94A134;

.loop:
    PHY                                                                  ;94A135;
    JSR.W BlockBombedReaction                                            ;94A136;
    PLY                                                                  ;94A139;
    TXA                                                                  ;94A13A;
    CLC                                                                  ;94A13B;
    ADC.W $07A5                                                          ;94A13C;
    ADC.W $07A5                                                          ;94A13F;
    TAX                                                                  ;94A142;
    DEY                                                                  ;94A143;
    BPL .loop                                                            ;94A144;
    RTS                                                                  ;94A146;


BlockShotReaction_Horizontal_Slope:
    LDX.W $0DC4                                                          ;94A147;
    LDA.L $7F6402,X                                                      ;94A14A;
    AND.W #$001F                                                         ;94A14E;
    CMP.W #$0005                                                         ;94A151;
    BCC .gotoSquare                                                      ;94A154;
    JMP.W BlockShotReaction_Horizontal_Slope_NonSquare                   ;94A156;


.gotoSquare:
    JMP.W BlockShotReaction_Horizontal_Slope_Square                      ;94A159;


SECRTS_94A15C:
    SEC                                                                  ;94A15C;
    RTS                                                                  ;94A15D;


BlockShotReaction_Vertical_Slope:
    LDX.W $0DC4                                                          ;94A15E;
    LDA.L $7F6402,X                                                      ;94A161;
    AND.W #$001F                                                         ;94A165;
    CMP.W #$0005                                                         ;94A168;
    BCC .gotoSquare                                                      ;94A16B;
    JMP.W BlockShotReaction_Vertical_Slope_NonSquare                     ;94A16D;


.gotoSquare:
    JMP.W BlockShotReaction_Vertical_Slope_Square                        ;94A170;


SECRTS_94A173:
    SEC                                                                  ;94A173;
    RTS                                                                  ;94A174;


BlockShotReactionPointers_Horizontal:
    dw CLCRTS_949D59                                                     ;94A175;
    dw BlockShotReaction_Horizontal_Slope                                ;94A177;
    dw CLCRTS_949D59                                                     ;94A179;
    dw CLCRTS_949D59                                                     ;94A17B;
    dw BlockBombShotGrappledReaction_ShootableAir                        ;94A17D;
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ;94A17F;
    dw CLCRTS_949D59                                                     ;94A181;
    dw BlockShotBombedGrappledReaction_BombableAir                       ;94A183;
    dw SECRTS_949D5B                                                     ;94A185;
    dw SECRTS_949D5B                                                     ;94A187;
    dw SECRTS_949D5B                                                     ;94A189;
    dw SECRTS_949D5B                                                     ;94A18B;
    dw BlockBombShotGrappledReaction_ShootableBlock                      ;94A18D;
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ;94A18F;
    dw SECRTS_949D5B                                                     ;94A191;
    dw BlockShotBombedGrappledReaction_BombableBlock                     ;94A193;

BlockShotReactionPointers_Vertical:
    dw CLCRTS_949D59                                                     ;94A195;
    dw BlockShotReaction_Vertical_Slope                                  ;94A197;
    dw CLCRTS_949D59                                                     ;94A199;
    dw CLCRTS_949D59                                                     ;94A19B;
    dw BlockBombShotGrappledReaction_ShootableAir                        ;94A19D;
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ;94A19F;
    dw CLCRTS_949D59                                                     ;94A1A1;
    dw BlockShotBombedGrappledReaction_BombableAir                       ;94A1A3;
    dw SECRTS_949D5B                                                     ;94A1A5;
    dw SECRTS_949D5B                                                     ;94A1A7;
    dw SECRTS_949D5B                                                     ;94A1A9;
    dw SECRTS_949D5B                                                     ;94A1AB;
    dw BlockBombShotGrappledReaction_ShootableBlock                      ;94A1AD;
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ;94A1AF;
    dw SECRTS_949D5B                                                     ;94A1B1;
    dw BlockShotBombedGrappledReaction_BombableBlock                     ;94A1B3;

BlockShotReaction_Horizontal:
    CPX.W $07B9                                                          ;94A1B5;
    BCS .return                                                          ;94A1B8;
    PHX                                                                  ;94A1BA;
    STX.W $0DC4                                                          ;94A1BB;
    LSR.W $0DC4                                                          ;94A1BE;
    LDA.L $7F0002,X                                                      ;94A1C1;
    AND.W #$F000                                                         ;94A1C5;
    XBA                                                                  ;94A1C8;
    LSR A                                                                ;94A1C9;
    LSR A                                                                ;94A1CA;
    LSR A                                                                ;94A1CB;
    TAX                                                                  ;94A1CC;
    JSR.W (BlockShotReactionPointers_Horizontal,X)                       ;94A1CD;
    BCC .blockCollision                                                  ;94A1D0;
    DEC.B $28                                                            ;94A1D2;

.blockCollision:
    PLX                                                                  ;94A1D4;

.return:
    RTS                                                                  ;94A1D5;


BlockShotReaction_Vertical:
    CPX.W $07B9                                                          ;94A1D6;
    BCS .return                                                          ;94A1D9;
    PHX                                                                  ;94A1DB;
    STX.W $0DC4                                                          ;94A1DC;
    LSR.W $0DC4                                                          ;94A1DF;
    LDA.L $7F0002,X                                                      ;94A1E2;
    AND.W #$F000                                                         ;94A1E6;
    XBA                                                                  ;94A1E9;
    LSR A                                                                ;94A1EA;
    LSR A                                                                ;94A1EB;
    LSR A                                                                ;94A1EC;
    TAX                                                                  ;94A1ED;
    JSR.W (BlockShotReactionPointers_Vertical,X)                         ;94A1EE;
    BCC .blockCollision                                                  ;94A1F1;
    DEC.B $28                                                            ;94A1F3;

.blockCollision:
    PLX                                                                  ;94A1F5;

.return:
    RTS                                                                  ;94A1F6;


CalculateProjectileYBlockSpan:
    LDA.W $0B78,X                                                        ;94A1F7;
    SEC                                                                  ;94A1FA;
    SBC.W $0BC8,X                                                        ;94A1FB;
    AND.W #$FFF0                                                         ;94A1FE;
    STA.B $26                                                            ;94A201;
    LDA.W $0B78,X                                                        ;94A203;
    CLC                                                                  ;94A206;
    ADC.W $0BC8,X                                                        ;94A207;
    DEC A                                                                ;94A20A;
    SEC                                                                  ;94A20B;
    SBC.B $26                                                            ;94A20C;
    LSR A                                                                ;94A20E;
    LSR A                                                                ;94A20F;
    LSR A                                                                ;94A210;
    LSR A                                                                ;94A211;
    STA.B $26                                                            ;94A212;
    STA.B $1A                                                            ;94A214;
    STA.B $28                                                            ;94A216;
    RTS                                                                  ;94A218;


CalculateProjectileXBlockSpan:
    LDA.W $0B64,X                                                        ;94A219;
    SEC                                                                  ;94A21C;
    SBC.W $0BB4,X                                                        ;94A21D;
    AND.W #$FFF0                                                         ;94A220;
    STA.B $26                                                            ;94A223;
    LDA.W $0B64,X                                                        ;94A225;
    CLC                                                                  ;94A228;
    ADC.W $0BB4,X                                                        ;94A229;
    DEC A                                                                ;94A22C;
    SEC                                                                  ;94A22D;
    SBC.B $26                                                            ;94A22E;
    LSR A                                                                ;94A230;
    LSR A                                                                ;94A231;
    LSR A                                                                ;94A232;
    LSR A                                                                ;94A233;
    STA.B $26                                                            ;94A234;
    STA.B $1A                                                            ;94A236;
    STA.B $28                                                            ;94A238;
    RTS                                                                  ;94A23A;


MoveBeamHorizontally_NoWaveBeam:
    PHB                                                                  ;94A23B;
    PHX                                                                  ;94A23C;
    PHK                                                                  ;94A23D;
    PLB                                                                  ;94A23E;
    STZ.B $1E                                                            ;94A23F;
    STZ.B $12                                                            ;94A241;
    STZ.B $14                                                            ;94A243;
    LDA.W $0BDC,X                                                        ;94A245;
    BPL +                                                                ;94A248;
    DEC.B $14                                                            ;94A24A;

  + STA.B $13                                                            ;94A24C;
    JSR.W CalculateProjectileYBlockSpan                                  ;94A24E;
    LDA.W $0B78,X                                                        ;94A251;
    SEC                                                                  ;94A254;
    SBC.W $0BC8,X                                                        ;94A255;
    LSR A                                                                ;94A258;
    LSR A                                                                ;94A259;
    LSR A                                                                ;94A25A;
    LSR A                                                                ;94A25B;
    SEP #$20                                                             ;94A25C;
    STA.W HW_WRMPYA                                                      ;94A25E;
    LDA.W $07A5                                                          ;94A261;
    STA.W HW_WRMPYB                                                      ;94A264;
    REP #$20                                                             ;94A267;
    LDA.W $0B8C,X                                                        ;94A269;
    CLC                                                                  ;94A26C;
    ADC.B $12                                                            ;94A26D;
    STA.W $0B8C,X                                                        ;94A26F;
    STA.B $16                                                            ;94A272;
    LDA.W $0B64,X                                                        ;94A274;
    ADC.B $14                                                            ;94A277;
    STA.W $0B64,X                                                        ;94A279;
    STA.B $18                                                            ;94A27C;
    BIT.B $14                                                            ;94A27E;
    BMI .negative14                                                      ;94A280;
    CLC                                                                  ;94A282;
    ADC.W $0BB4,X                                                        ;94A283;
    DEC A                                                                ;94A286;
    BRA +                                                                ;94A287;


.negative14:
    SEC                                                                  ;94A289;
    SBC.W $0BB4,X                                                        ;94A28A;

  + STA.B $1C                                                            ;94A28D;
    LSR A                                                                ;94A28F;
    LSR A                                                                ;94A290;
    LSR A                                                                ;94A291;
    LSR A                                                                ;94A292;
    CLC                                                                  ;94A293;
    ADC.W HW_RDMPY                                                       ;94A294;
    ASL A                                                                ;94A297;
    TAX                                                                  ;94A298;
    LDA.B $26                                                            ;94A299;
    CMP.W #$0010                                                         ;94A29B;
    BPL .noCollision                                                     ;94A29E;
    LDA.B $1D                                                            ;94A2A0;
    AND.W #$00FF                                                         ;94A2A2;
    CMP.W $07A9                                                          ;94A2A5;
    BPL .noCollision                                                     ;94A2A8;

.loop:
    JSR.W BlockShotReaction_Horizontal                                   ;94A2AA;
    TXA                                                                  ;94A2AD;
    CLC                                                                  ;94A2AE;
    ADC.W $07A5                                                          ;94A2AF;
    ADC.W $07A5                                                          ;94A2B2;
    TAX                                                                  ;94A2B5;
    DEC.B $26                                                            ;94A2B6;
    BPL .loop                                                            ;94A2B8;
    LDA.B $28                                                            ;94A2BA;
    BMI .completeCollision                                               ;94A2BC;

.noCollision:
    PLX                                                                  ;94A2BE;
    PLB                                                                  ;94A2BF;
    CLC                                                                  ;94A2C0;
    RTL                                                                  ;94A2C1;


.completeCollision:
    PLX                                                                  ;94A2C2;
    JSL.L Kill_Projectile                                                ;94A2C3;
    PLB                                                                  ;94A2C7;
    SEC                                                                  ;94A2C8;
    RTL                                                                  ;94A2C9;


MoveBeamVertically_NoWaveBeam:
    PHB                                                                  ;94A2CA;
    PHX                                                                  ;94A2CB;
    PHK                                                                  ;94A2CC;
    PLB                                                                  ;94A2CD;
    STZ.B $1E                                                            ;94A2CE;
    STZ.B $12                                                            ;94A2D0;
    STZ.B $14                                                            ;94A2D2;
    LDA.W $0BF0,X                                                        ;94A2D4;
    BPL +                                                                ;94A2D7;
    DEC.B $14                                                            ;94A2D9;

  + STA.B $13                                                            ;94A2DB;
    JSR.W CalculateProjectileXBlockSpan                                  ;94A2DD;
    LDA.W $0BA0,X                                                        ;94A2E0;
    CLC                                                                  ;94A2E3;
    ADC.B $12                                                            ;94A2E4;
    STA.W $0BA0,X                                                        ;94A2E6;
    STA.B $16                                                            ;94A2E9;
    LDA.W $0B78,X                                                        ;94A2EB;
    ADC.B $14                                                            ;94A2EE;
    STA.W $0B78,X                                                        ;94A2F0;
    STA.B $18                                                            ;94A2F3;
    BIT.B $14                                                            ;94A2F5;
    BMI .negative14                                                      ;94A2F7;
    CLC                                                                  ;94A2F9;
    ADC.W $0BC8,X                                                        ;94A2FA;
    DEC A                                                                ;94A2FD;
    BRA +                                                                ;94A2FE;


.negative14:
    SEC                                                                  ;94A300;
    SBC.W $0BC8,X                                                        ;94A301;

  + STA.B $1C                                                            ;94A304;
    LSR A                                                                ;94A306;
    LSR A                                                                ;94A307;
    LSR A                                                                ;94A308;
    LSR A                                                                ;94A309;
    SEP #$20                                                             ;94A30A;
    STA.W HW_WRMPYA                                                      ;94A30C;
    LDA.W $07A5                                                          ;94A30F;
    STA.W HW_WRMPYB                                                      ;94A312;
    REP #$20                                                             ;94A315;
    LDA.W $0B64,X                                                        ;94A317;
    SEC                                                                  ;94A31A;
    SBC.W $0BB4,X                                                        ;94A31B;
    LSR A                                                                ;94A31E;
    LSR A                                                                ;94A31F;
    LSR A                                                                ;94A320;
    LSR A                                                                ;94A321;
    CLC                                                                  ;94A322;
    ADC.W HW_RDMPY                                                       ;94A323;
    ASL A                                                                ;94A326;
    TAX                                                                  ;94A327;
    LDA.B $26                                                            ;94A328;
    CMP.W #$0010                                                         ;94A32A;
    BPL .noCollision                                                     ;94A32D;
    LDA.B $1D                                                            ;94A32F;
    AND.W #$00FF                                                         ;94A331;
    CMP.W $07AB                                                          ;94A334;
    BPL .noCollision                                                     ;94A337;

.loop:
    JSR.W BlockShotReaction_Vertical                                     ;94A339;
    INX                                                                  ;94A33C;
    INX                                                                  ;94A33D;
    DEC.B $26                                                            ;94A33E;
    BPL .loop                                                            ;94A340;
    LDA.B $28                                                            ;94A342;
    BMI .completeCollision                                               ;94A344;

.noCollision:
    PLX                                                                  ;94A346;
    PLB                                                                  ;94A347;
    CLC                                                                  ;94A348;
    RTL                                                                  ;94A349;


.completeCollision:
    PLX                                                                  ;94A34A;
    JSL.L Kill_Projectile                                                ;94A34B;
    PLB                                                                  ;94A34F;
    SEC                                                                  ;94A350;
    RTL                                                                  ;94A351;


MoveBeamHorizontally_WaveBeam:
    PHB                                                                  ;94A352;
    PHX                                                                  ;94A353;
    PHK                                                                  ;94A354;
    PLB                                                                  ;94A355;
    STZ.B $1E                                                            ;94A356;
    STZ.B $12                                                            ;94A358;
    STZ.B $14                                                            ;94A35A;
    LDA.W $0BDC,X                                                        ;94A35C;
    BPL +                                                                ;94A35F;
    DEC.B $14                                                            ;94A361;

  + STA.B $13                                                            ;94A363;
    JSR.W CalculateProjectileYBlockSpan                                  ;94A365;
    LDA.W $0B78,X                                                        ;94A368;
    SEC                                                                  ;94A36B;
    SBC.W $0BC8,X                                                        ;94A36C;
    LSR A                                                                ;94A36F;
    LSR A                                                                ;94A370;
    LSR A                                                                ;94A371;
    LSR A                                                                ;94A372;
    SEP #$20                                                             ;94A373;
    STA.W HW_WRMPYA                                                      ;94A375;
    LDA.W $07A5                                                          ;94A378;
    STA.W HW_WRMPYB                                                      ;94A37B;
    REP #$20                                                             ;94A37E;
    LDA.W $0B8C,X                                                        ;94A380;
    CLC                                                                  ;94A383;
    ADC.B $12                                                            ;94A384;
    STA.W $0B8C,X                                                        ;94A386;
    STA.B $16                                                            ;94A389;
    LDA.W $0B64,X                                                        ;94A38B;
    ADC.B $14                                                            ;94A38E;
    STA.W $0B64,X                                                        ;94A390;
    STA.B $18                                                            ;94A393;
    BIT.B $14                                                            ;94A395;
    BMI .leftBoundary                                                    ;94A397;
    CLC                                                                  ;94A399;
    ADC.W $0BB4,X                                                        ;94A39A;
    DEC A                                                                ;94A39D;
    BRA +                                                                ;94A39E;


.leftBoundary:
    SEC                                                                  ;94A3A0;
    SBC.W $0BB4,X                                                        ;94A3A1;

  + STA.B $1C                                                            ;94A3A4;
    LSR A                                                                ;94A3A6;
    LSR A                                                                ;94A3A7;
    LSR A                                                                ;94A3A8;
    LSR A                                                                ;94A3A9;
    CLC                                                                  ;94A3AA;
    ADC.W HW_RDMPY                                                       ;94A3AB;
    ASL A                                                                ;94A3AE;
    TAY                                                                  ;94A3AF;
    LDA.B $26                                                            ;94A3B0;
    CMP.W #$0010                                                         ;94A3B2;
    BPL .returnNoCollision                                               ;94A3B5;
    LDA.W $0B78,X                                                        ;94A3B7;
    XBA                                                                  ;94A3BA;
    BMI .returnNoCollision                                               ;94A3BB;
    AND.W #$00FF                                                         ;94A3BD;
    CMP.W $07AB                                                          ;94A3C0;
    BPL .returnNoCollision                                               ;94A3C3;
    LDA.B $1D                                                            ;94A3C5;
    AND.W #$00FF                                                         ;94A3C7;
    CMP.W $07A9                                                          ;94A3CA;
    BPL .returnNoCollision                                               ;94A3CD;
    TYX                                                                  ;94A3CF;

.loop:
    JSR.W BlockShotReaction_Horizontal                                   ;94A3D0;
    TXA                                                                  ;94A3D3;
    CLC                                                                  ;94A3D4;
    ADC.W $07A5                                                          ;94A3D5;
    ADC.W $07A5                                                          ;94A3D8;
    TAX                                                                  ;94A3DB;
    DEC.B $26                                                            ;94A3DC;
    BPL .loop                                                            ;94A3DE;

.returnNoCollision:
    PLX                                                                  ;94A3E0;
    PLB                                                                  ;94A3E1;
    CLC                                                                  ;94A3E2;
    RTL                                                                  ;94A3E3;


MoveBeamVertically_WaveBeam:
    PHB                                                                  ;94A3E4;
    PHX                                                                  ;94A3E5;
    PHK                                                                  ;94A3E6;
    PLB                                                                  ;94A3E7;
    STZ.B $1E                                                            ;94A3E8;
    STZ.B $12                                                            ;94A3EA;
    STZ.B $14                                                            ;94A3EC;
    LDA.W $0BF0,X                                                        ;94A3EE;
    BPL +                                                                ;94A3F1;
    DEC.B $14                                                            ;94A3F3;

  + STA.B $13                                                            ;94A3F5;
    JSR.W CalculateProjectileXBlockSpan                                  ;94A3F7;
    LDA.W $0BA0,X                                                        ;94A3FA;
    CLC                                                                  ;94A3FD;
    ADC.B $12                                                            ;94A3FE;
    STA.W $0BA0,X                                                        ;94A400;
    STA.B $16                                                            ;94A403;
    LDA.W $0B78,X                                                        ;94A405;
    ADC.B $14                                                            ;94A408;
    STA.W $0B78,X                                                        ;94A40A;
    STA.B $18                                                            ;94A40D;
    BIT.B $14                                                            ;94A40F;
    BMI .negative14                                                      ;94A411;
    CLC                                                                  ;94A413;
    ADC.W $0BC8,X                                                        ;94A414;
    DEC A                                                                ;94A417;
    BRA +                                                                ;94A418;


.negative14:
    SEC                                                                  ;94A41A;
    SBC.W $0BC8,X                                                        ;94A41B;

  + STA.B $1C                                                            ;94A41E;
    LSR A                                                                ;94A420;
    LSR A                                                                ;94A421;
    LSR A                                                                ;94A422;
    LSR A                                                                ;94A423;
    SEP #$20                                                             ;94A424;
    STA.W HW_WRMPYA                                                      ;94A426;
    LDA.W $07A5                                                          ;94A429;
    STA.W HW_WRMPYB                                                      ;94A42C;
    REP #$20                                                             ;94A42F;
    LDA.W $0B64,X                                                        ;94A431;
    SEC                                                                  ;94A434;
    SBC.W $0BB4,X                                                        ;94A435;
    LSR A                                                                ;94A438;
    LSR A                                                                ;94A439;
    LSR A                                                                ;94A43A;
    LSR A                                                                ;94A43B;
    CLC                                                                  ;94A43C;
    ADC.W HW_RDMPY                                                       ;94A43D;
    ASL A                                                                ;94A440;
    TAY                                                                  ;94A441;
    LDA.B $26                                                            ;94A442;
    CMP.W #$0010                                                         ;94A444;
    BPL .returnNoCollision                                               ;94A447;
    LDA.W $0B64,X                                                        ;94A449;
    XBA                                                                  ;94A44C;
    BMI .returnNoCollision                                               ;94A44D;
    AND.W #$00FF                                                         ;94A44F;
    CMP.W $07A9                                                          ;94A452;
    BPL .returnNoCollision                                               ;94A455;
    LDA.B $1D                                                            ;94A457;
    AND.W #$00FF                                                         ;94A459;
    CMP.W $07AB                                                          ;94A45C;
    BPL .returnNoCollision                                               ;94A45F;
    TYX                                                                  ;94A461;

.loop:
    JSR.W BlockShotReaction_Vertical                                     ;94A462;
    INX                                                                  ;94A465;
    INX                                                                  ;94A466;
    DEC.B $26                                                            ;94A467;
    BPL .loop                                                            ;94A469;

.returnNoCollision:
    PLX                                                                  ;94A46B;
    PLB                                                                  ;94A46C;
    CLC                                                                  ;94A46D;
    RTL                                                                  ;94A46E;


MoveMissileHorizontally:
    PHB                                                                  ;94A46F;
    PHX                                                                  ;94A470;
    PHK                                                                  ;94A471;
    PLB                                                                  ;94A472;
    LDA.W #$0001                                                         ;94A473;
    STA.B $1E                                                            ;94A476;
    STZ.B $26                                                            ;94A478;
    STZ.B $1A                                                            ;94A47A;
    STZ.B $12                                                            ;94A47C;
    STZ.B $14                                                            ;94A47E;
    LDA.W $0BDC,X                                                        ;94A480;
    BPL +                                                                ;94A483;
    DEC.B $14                                                            ;94A485;

  + STA.B $13                                                            ;94A487;
    LDA.W $0B78,X                                                        ;94A489;
    LSR A                                                                ;94A48C;
    LSR A                                                                ;94A48D;
    LSR A                                                                ;94A48E;
    LSR A                                                                ;94A48F;
    SEP #$20                                                             ;94A490;
    STA.W HW_WRMPYA                                                      ;94A492;
    LDA.W $07A5                                                          ;94A495;
    STA.W HW_WRMPYB                                                      ;94A498;
    REP #$20                                                             ;94A49B;
    LDA.W $0B8C,X                                                        ;94A49D;
    CLC                                                                  ;94A4A0;
    ADC.B $12                                                            ;94A4A1;
    STA.W $0B8C,X                                                        ;94A4A3;
    STA.B $16                                                            ;94A4A6;
    LDA.W $0B64,X                                                        ;94A4A8;
    ADC.B $14                                                            ;94A4AB;
    STA.W $0B64,X                                                        ;94A4AD;
    STA.B $18                                                            ;94A4B0;
    STA.B $1C                                                            ;94A4B2;
    LSR A                                                                ;94A4B4;
    LSR A                                                                ;94A4B5;
    LSR A                                                                ;94A4B6;
    LSR A                                                                ;94A4B7;
    CLC                                                                  ;94A4B8;
    ADC.W HW_RDMPY                                                       ;94A4B9;
    ASL A                                                                ;94A4BC;
    TAX                                                                  ;94A4BD;
    LDA.B $19                                                            ;94A4BE;
    AND.W #$00FF                                                         ;94A4C0;
    CMP.W $07A9                                                          ;94A4C3;
    BPL .noCollision                                                     ;94A4C6;
    JSR.W BlockShotReaction_Horizontal                                   ;94A4C8;
    BCS .collision                                                       ;94A4CB;

.noCollision:
    PLX                                                                  ;94A4CD;
    PLB                                                                  ;94A4CE;
    CLC                                                                  ;94A4CF;
    RTL                                                                  ;94A4D0;


.collision:
    PLX                                                                  ;94A4D1;
    JSL.L Kill_Projectile                                                ;94A4D2;
    PLB                                                                  ;94A4D6;
    SEC                                                                  ;94A4D7;
    RTL                                                                  ;94A4D8;


MoveMissileVertically:
    PHB                                                                  ;94A4D9;
    PHX                                                                  ;94A4DA;
    PHK                                                                  ;94A4DB;
    PLB                                                                  ;94A4DC;
    LDA.W #$0001                                                         ;94A4DD;
    STA.B $1E                                                            ;94A4E0;
    STZ.B $26                                                            ;94A4E2;
    STZ.B $1A                                                            ;94A4E4;
    STZ.B $12                                                            ;94A4E6;
    STZ.B $14                                                            ;94A4E8;
    LDA.W $0BF0,X                                                        ;94A4EA;
    BPL +                                                                ;94A4ED;
    DEC.B $14                                                            ;94A4EF;

  + STA.B $13                                                            ;94A4F1;
    LDA.W $0BA0,X                                                        ;94A4F3;
    CLC                                                                  ;94A4F6;
    ADC.B $12                                                            ;94A4F7;
    STA.W $0BA0,X                                                        ;94A4F9;
    STA.B $16                                                            ;94A4FC;
    LDA.W $0B78,X                                                        ;94A4FE;
    ADC.B $14                                                            ;94A501;
    STA.W $0B78,X                                                        ;94A503;
    STA.B $18                                                            ;94A506;
    STA.B $1C                                                            ;94A508;
    LSR A                                                                ;94A50A;
    LSR A                                                                ;94A50B;
    LSR A                                                                ;94A50C;
    LSR A                                                                ;94A50D;
    SEP #$20                                                             ;94A50E;
    STA.W HW_WRMPYA                                                      ;94A510;
    LDA.W $07A5                                                          ;94A513;
    STA.W HW_WRMPYB                                                      ;94A516;
    REP #$20                                                             ;94A519;
    LDA.W $0B64,X                                                        ;94A51B;
    LSR A                                                                ;94A51E;
    LSR A                                                                ;94A51F;
    LSR A                                                                ;94A520;
    LSR A                                                                ;94A521;
    CLC                                                                  ;94A522;
    ADC.W HW_RDMPY                                                       ;94A523;
    ASL A                                                                ;94A526;
    TAX                                                                  ;94A527;
    LDA.B $19                                                            ;94A528;
    AND.W #$00FF                                                         ;94A52A;
    CMP.W $07AB                                                          ;94A52D;
    BPL .noCollision                                                     ;94A530;
    JSR.W BlockShotReaction_Vertical                                     ;94A532;
    BCS .collision                                                       ;94A535;

.noCollision:
    PLX                                                                  ;94A537;
    PLB                                                                  ;94A538;
    CLC                                                                  ;94A539;
    RTL                                                                  ;94A53A;


.collision:
    PLX                                                                  ;94A53B;
    JSL.L Kill_Projectile                                                ;94A53C;
    PLB                                                                  ;94A540;
    SEC                                                                  ;94A541;
    RTL                                                                  ;94A542;


BlockShotReaction_Horizontal_Slope_NonSquare:
    REP #$20                                                             ;94A543;
    LDX.W $0DC4                                                          ;94A545;
    LDY.W $0DDE                                                          ;94A548;
    LDA.W $0DC4                                                          ;94A54B;
    STA.W HW_WRDIV                                                       ;94A54E;
    SEP #$20                                                             ;94A551;
    LDA.W $07A5                                                          ;94A553;
    STA.W HW_WRDIVB                                                      ;94A556;
    REP #$20                                                             ;94A559;
    LDA.W $0B78,Y                                                        ;94A55B;
    LSR A                                                                ;94A55E;
    LSR A                                                                ;94A55F;
    LSR A                                                                ;94A560;
    LSR A                                                                ;94A561;
    CMP.W $4214                                                          ;94A562;
    BEQ BlockShotReaction_Slope_NonSquare                                ;94A565;
    CLC                                                                  ;94A567;
    RTS                                                                  ;94A568;


BlockShotReaction_Vertical_Slope_NonSquare:
    REP #$20                                                             ;94A569;
    LDX.W $0DC4                                                          ;94A56B;
    LDY.W $0DDE                                                          ;94A56E;
    LDA.W $0DC4                                                          ;94A571;
    STA.W HW_WRDIV                                                       ;94A574;
    SEP #$20                                                             ;94A577;
    LDA.W $07A5                                                          ;94A579;
    STA.W HW_WRDIVB                                                      ;94A57C;
    REP #$20                                                             ;94A57F;
    LDA.W $0B64,Y                                                        ;94A581;
    LSR A                                                                ;94A584;
    LSR A                                                                ;94A585;
    LSR A                                                                ;94A586;
    LSR A                                                                ;94A587;
    CMP.W HW_RDMPY                                                       ;94A588;
    BEQ BlockShotReaction_Slope_NonSquare                                ;94A58B;
    CLC                                                                  ;94A58D;
    RTS                                                                  ;94A58E;


BlockShotReaction_Slope_NonSquare:
    LDA.L $7F6402,X                                                      ;94A58F;
    AND.W #$001F                                                         ;94A593;
    ASL A                                                                ;94A596;
    ASL A                                                                ;94A597;
    ASL A                                                                ;94A598;
    ASL A                                                                ;94A599;
    STA.W $0DD6                                                          ;94A59A;
    LDA.L $7F6401,X                                                      ;94A59D;
    ASL A                                                                ;94A5A1;
    BMI .blockBTS40                                                      ;94A5A2;
    LDA.W $0B64,Y                                                        ;94A5A4;
    BRA +                                                                ;94A5A7;


.blockBTS40:
    LDA.W $0B64,Y                                                        ;94A5A9;
    EOR.W #$000F                                                         ;94A5AC;

  + AND.W #$000F                                                         ;94A5AF;
    CLC                                                                  ;94A5B2;
    ADC.W $0DD6                                                          ;94A5B3;
    PHA                                                                  ;94A5B6;
    LDA.L $7F6401,X                                                      ;94A5B7;
    BMI .blockBTSMSB                                                     ;94A5BB;
    JMP.W .YFlip                                                         ;94A5BD;


.blockBTSMSB:
    PLX                                                                  ;94A5C0;
    LDA.W $0B78,Y                                                        ;94A5C1;
    AND.W #$000F                                                         ;94A5C4;
    EOR.W #$000F                                                         ;94A5C7;
    STA.W $0DD4                                                          ;94A5CA;
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X                     ;94A5CD;
    AND.W #$001F                                                         ;94A5D0;
    CMP.W $0DD4                                                          ;94A5D3;
    BMI .collision                                                       ;94A5D6;
    BEQ .collision                                                       ;94A5D8;
    CLC                                                                  ;94A5DA;
    RTS                                                                  ;94A5DB;


.collision:
    STZ.B $26                                                            ;94A5DC;
    STZ.B $28                                                            ;94A5DE;
    SEC                                                                  ;94A5E0;
    RTS                                                                  ;94A5E1;


.YFlip:
    PLX                                                                  ;94A5E2;
    LDA.W $0B78,Y                                                        ;94A5E3;
    AND.W #$000F                                                         ;94A5E6;
    STA.W $0DD4                                                          ;94A5E9;
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X                     ;94A5EC;
    AND.W #$001F                                                         ;94A5EF;
    CMP.W $0DD4                                                          ;94A5F2;
    BMI ..collision                                                      ;94A5F5;
    BEQ ..collision                                                      ;94A5F7;
    CLC                                                                  ;94A5F9;
    RTS                                                                  ;94A5FA;


..collision:
    STZ.B $26                                                            ;94A5FB;
    STZ.B $28                                                            ;94A5FD;
    SEC                                                                  ;94A5FF;
    RTS                                                                  ;94A600;


BombSpreadBlockReaction_Pointers:
    dw CLCRTS_949D59                                                     ;94A601;
    dw BombSpreadBlockReaction_Slope                                     ;94A603;
    dw CLCRTS_949D59                                                     ;94A605;
    dw CLCRTS_949D59                                                     ;94A607;
    dw SECRTS_949D5B                                                     ;94A609;
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ;94A60B;
    dw CLCRTS_949D59                                                     ;94A60D;
    dw CLCRTS_949D59                                                     ;94A60F;
    dw SECRTS_949D5B                                                     ;94A611;
    dw SECRTS_949D5B                                                     ;94A613;
    dw SECRTS_949D5B                                                     ;94A615;
    dw SECRTS_949D5B                                                     ;94A617;
    dw SECRTS_949D5B                                                     ;94A619;
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ;94A61B;
    dw SECRTS_949D5B                                                     ;94A61D;
    dw SECRTS_949D5B                                                     ;94A61F;

BombSpreadBlockCollisionDetection:
    PHP                                                                  ;94A621;
    PHB                                                                  ;94A622;
    PHK                                                                  ;94A623;
    PLB                                                                  ;94A624;
    REP #$30                                                             ;94A625;
    LDA.W $0B64,X                                                        ;94A627;
    STA.B $1A                                                            ;94A62A;
    LDA.W $0B78,X                                                        ;94A62C;
    STA.B $1C                                                            ;94A62F;
    STZ.B $1E                                                            ;94A631;
    STZ.B $20                                                            ;94A633;
    STZ.W $0DC4                                                          ;94A635;
    PHX                                                                  ;94A638;
    JSR.W CalculateBlockAt_12_1E_1C_20                                   ;94A639;
    PLX                                                                  ;94A63C;
    LDA.W $0C7C,X                                                        ;94A63D;
    BNE .nonZeroTimer                                                    ;94A640;
    JSR.W BombExplosionBlockCollisionHandling                            ;94A642;
    BRA .returnNoCollision                                               ;94A645;


.nonZeroTimer:
    LDA.W $0DC4                                                          ;94A647;
    CMP.W #$FFFF                                                         ;94A64A;
    BEQ .returnCollision                                                 ;94A64D;
    ASL A                                                                ;94A64F;
    TAX                                                                  ;94A650;
    LDA.L $7F0002,X                                                      ;94A651;
    AND.W #$F000                                                         ;94A655;
    XBA                                                                  ;94A658;
    LSR A                                                                ;94A659;
    LSR A                                                                ;94A65A;
    LSR A                                                                ;94A65B;
    TAX                                                                  ;94A65C;
    JSR.W (BombSpreadBlockReaction_Pointers,X)                           ;94A65D;
    BCS .returnCollision                                                 ;94A660;

.returnNoCollision:
    PLB                                                                  ;94A662;
    PLP                                                                  ;94A663;
    CLC                                                                  ;94A664;
    RTL                                                                  ;94A665;


.returnCollision:
    PLB                                                                  ;94A666;
    PLP                                                                  ;94A667;
    SEC                                                                  ;94A668;
    RTL                                                                  ;94A669;


BlockShotReaction_Horizontal_Slope_Square:
    ASL A                                                                ;94A66A;
    ASL A                                                                ;94A66B;
    STA.W $0DD4                                                          ;94A66C;
    LDA.L $7F6401,X                                                      ;94A66F;
    ROL A                                                                ;94A673;
    ROL A                                                                ;94A674;
    ROL A                                                                ;94A675;
    AND.W #$0003                                                         ;94A676;
    STA.W $0DD6                                                          ;94A679;
    LDA.B $1C                                                            ;94A67C;
    AND.W #$0008                                                         ;94A67E;
    LSR A                                                                ;94A681;
    LSR A                                                                ;94A682;
    LSR A                                                                ;94A683;
    EOR.W $0DD6                                                          ;94A684;
    ADC.W $0DD4                                                          ;94A687;
    TAX                                                                  ;94A68A;
    LDY.W $0DDE                                                          ;94A68B;
    LDA.B $1E                                                            ;94A68E;
    BNE .missile                                                         ;94A690;
    LDA.B $1A                                                            ;94A692;
    BNE .multiBlock                                                      ;94A694;
    LDA.W $0B78,Y                                                        ;94A696;
    SEC                                                                  ;94A699;
    SBC.W $0BC8,Y                                                        ;94A69A;
    AND.W #$0008                                                         ;94A69D;
    BNE .bottomHalf                                                      ;94A6A0;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;94A6A2;
    BMI .gotoReturnCollision                                             ;94A6A5;

.bottomHalf:
    TXA                                                                  ;94A6A7;
    EOR.W #$0002                                                         ;94A6A8;
    TAX                                                                  ;94A6AB;
    LDA.W $0B78,Y                                                        ;94A6AC;
    CLC                                                                  ;94A6AF;
    ADC.W $0BC8,Y                                                        ;94A6B0;
    DEC A                                                                ;94A6B3;
    AND.W #$0008                                                         ;94A6B4;
    BEQ .returnNoCollision                                               ;94A6B7;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;94A6B9;
    BMI .gotoReturnCollision                                             ;94A6BC;

.returnNoCollision:
    CLC                                                                  ;94A6BE;
    RTS                                                                  ;94A6BF;


.gotoReturnCollision:
    JMP.W .returnCollision                                               ;94A6C0; >.<


.multiBlock:
    LDA.B $26                                                            ;94A6C3;
    BNE .topBlockCheck                                                   ;94A6C5;
    LDA.W $0B78,Y                                                        ;94A6C7;
    CLC                                                                  ;94A6CA;
    ADC.W $0BC8,Y                                                        ;94A6CB;
    DEC A                                                                ;94A6CE;
    AND.W #$0008                                                         ;94A6CF;
    BNE .checkBothHalves                                                 ;94A6D2;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;94A6D4;
    BMI .completeWaste                                                   ;94A6D7;
    BRA .returnNoCollisionDuplicate                                      ;94A6D9;


.topBlockCheck:
    CMP.B $1A                                                            ;94A6DB;
    BNE .checkBothHalves                                                 ;94A6DD;
    LDA.W $0B78,Y                                                        ;94A6DF;
    SEC                                                                  ;94A6E2;
    SBC.W $0BC8,Y                                                        ;94A6E3;
    AND.W #$0008                                                         ;94A6E6;
    BNE .checkBottomHalf                                                 ;94A6E9;

.checkBothHalves:
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;94A6EB;
    BMI .completeWaste                                                   ;94A6EE;

.checkBottomHalf:
    TXA                                                                  ;94A6F0;
    EOR.W #$0002                                                         ;94A6F1;
    TAX                                                                  ;94A6F4;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;94A6F5;
    BMI .completeWaste                                                   ;94A6F8;

.returnNoCollisionDuplicate:
    CLC                                                                  ;94A6FA;
    RTS                                                                  ;94A6FB;


.completeWaste:
    JMP.W .returnCollision                                               ;94A6FC;


.returnCollision:
    SEC                                                                  ;94A6FF;
    RTS                                                                  ;94A700;


.missile:
    LDY.W $0DDE                                                          ;94A701;
    LDA.W $0B78,Y                                                        ;94A704;
    AND.W #$0008                                                         ;94A707;
    BEQ +                                                                ;94A70A;
    TXA                                                                  ;94A70C;
    EOR.W #$0002                                                         ;94A70D;
    TAX                                                                  ;94A710;

  + LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;94A711;
    BMI .returnCollisionDuplicate                                        ;94A714;
    CLC                                                                  ;94A716;
    RTS                                                                  ;94A717;


.returnCollisionDuplicate:
    SEC                                                                  ;94A718;
    RTS                                                                  ;94A719;


BlockShotReaction_Vertical_Slope_Square:
    ASL A                                                                ;94A71A;
    ASL A                                                                ;94A71B;
    STA.W $0DD4                                                          ;94A71C;
    LDA.L $7F6401,X                                                      ;94A71F;
    ROL A                                                                ;94A723;
    ROL A                                                                ;94A724;
    ROL A                                                                ;94A725;
    AND.W #$0003                                                         ;94A726;
    STA.W $0DD6                                                          ;94A729;
    LDA.B $1C                                                            ;94A72C;
    AND.W #$0008                                                         ;94A72E;
    LSR A                                                                ;94A731;
    LSR A                                                                ;94A732;
    EOR.W $0DD6                                                          ;94A733;
    ADC.W $0DD4                                                          ;94A736;
    TAX                                                                  ;94A739;
    LDY.W $0DDE                                                          ;94A73A;
    LDA.B $1E                                                            ;94A73D;
    BNE .missile                                                         ;94A73F;
    LDA.B $1A                                                            ;94A741;
    BNE .multiBlock                                                      ;94A743;
    LDA.W $0B64,Y                                                        ;94A745;
    SEC                                                                  ;94A748;
    SBC.W $0BB4,Y                                                        ;94A749;
    AND.W #$0008                                                         ;94A74C;
    BNE .right                                                           ;94A74F;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;94A751;
    BMI .gotoReturnCollision                                             ;94A754;

.right:
    TXA                                                                  ;94A756;
    EOR.W #$0001                                                         ;94A757;
    TAX                                                                  ;94A75A;
    LDA.W $0B64,Y                                                        ;94A75B;
    CLC                                                                  ;94A75E;
    ADC.W $0BB4,Y                                                        ;94A75F;
    DEC A                                                                ;94A762;
    AND.W #$0008                                                         ;94A763;
    BEQ .returnNoCollision                                               ;94A766;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;94A768;
    BMI .gotoReturnCollision                                             ;94A76B;

.returnNoCollision:
    CLC                                                                  ;94A76D;
    RTS                                                                  ;94A76E;


.gotoReturnCollision:
    JMP.W .returnCollision                                               ;94A76F;


.multiBlock:
    LDA.B $26                                                            ;94A772;
    BNE .leftmostBlockCheck                                              ;94A774;
    LDA.W $0B64,Y                                                        ;94A776;
    CLC                                                                  ;94A779;
    ADC.W $0BB4,Y                                                        ;94A77A;
    DEC A                                                                ;94A77D;
    AND.W #$0008                                                         ;94A77E;
    BNE .checkBothHalves                                                 ;94A781;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;94A783;
    BMI .gotoNowhere                                                     ;94A786;
    BRA .returnNoCollisionDuplicate                                      ;94A788;


.leftmostBlockCheck:
    CMP.B $1A                                                            ;94A78A;
    BNE .checkBothHalves                                                 ;94A78C;
    LDA.W $0B64,Y                                                        ;94A78E;
    SEC                                                                  ;94A791;
    SBC.W $0BB4,Y                                                        ;94A792;
    AND.W #$0008                                                         ;94A795;
    BNE .checkLeftHalf                                                   ;94A798;

.checkBothHalves:
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;94A79A;
    BMI .gotoNowhere                                                     ;94A79D;

.checkLeftHalf:
    TXA                                                                  ;94A79F;
    EOR.W #$0001                                                         ;94A7A0;
    TAX                                                                  ;94A7A3;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;94A7A4;
    BMI .gotoNowhere                                                     ;94A7A7;

.returnNoCollisionDuplicate:
    CLC                                                                  ;94A7A9;
    RTS                                                                  ;94A7AA;


.gotoNowhere:
    JMP.W .returnCollision                                               ;94A7AB; >.<


.returnCollision:
    SEC                                                                  ;94A7AE;
    RTS                                                                  ;94A7AF;


.missile:
    LDY.W $0DDE                                                          ;94A7B0;
    LDA.W $0B64,Y                                                        ;94A7B3;
    AND.W #$0008                                                         ;94A7B6;
    BEQ .leftHalf                                                        ;94A7B9;
    TXA                                                                  ;94A7BB;
    EOR.W #$0001                                                         ;94A7BC;
    TAX                                                                  ;94A7BF;

.leftHalf:
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;94A7C0;
    BMI .returnCollisionDuplicate                                        ;94A7C3;
    CLC                                                                  ;94A7C5;
    RTS                                                                  ;94A7C6;


.returnCollisionDuplicate:
    SEC                                                                  ;94A7C7;
    RTS                                                                  ;94A7C8;


BlockGrappleReaction_Air_SpikeAir_SpecialAir:
    REP #$40                                                             ;94A7C9;
    CLC                                                                  ;94A7CB; >.<
    RTS                                                                  ;94A7CC;


BlockGrappleReaction_Slope_SolidBlock_DoorBlock_SpecialBlock:
    REP #$40                                                             ;94A7CD;
    SEC                                                                  ;94A7CF;
    RTS                                                                  ;94A7D0;


BlockGrappleReaction_GrappleBlock:
    LDA.W #$8000                                                         ;94A7D1;
    TRB.W $0CF4                                                          ;94A7D4;
    LDX.W $0DC4                                                          ;94A7D7;
    LDA.L $7F6401,X                                                      ;94A7DA;
    XBA                                                                  ;94A7DE;
    BMI +                                                                ;94A7DF;
    AND.W #$007F                                                         ;94A7E1;
    ASL A                                                                ;94A7E4;
    TAX                                                                  ;94A7E5;
    LDA.W .PLMs,X                                                        ;94A7E6;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;94A7E9;
    RTS                                                                  ;94A7ED;


  + AND.W #$007F                                                         ;94A7EE; >_<
    REP #$40                                                             ;94A7F1;
    CLC                                                                  ;94A7F3;
    RTS                                                                  ;94A7F4;


.PLMs:
    dw PLMEntries_Grappled_GrappleBlock                                  ;94A7F5;
    dw PLMEntries_Grappled_RespawningBreakableGrappleBlock               ;94A7F7;
    dw PLMEntries_Grappled_BreakableGrappleBlock                         ;94A7F9;
    dw PLMEntries_Grappled_GrappleBlock                                  ;94A7FB;

BlockGrappleReaction_SpikeBlock:
    LDX.W $0DC4                                                          ;94A7FD;
    LDA.L $7F6401,X                                                      ;94A800;
    XBA                                                                  ;94A804;
    BMI +                                                                ;94A805;
    AND.W #$007F                                                         ;94A807;
    ASL A                                                                ;94A80A;
    TAX                                                                  ;94A80B;
    LDA.W .PLMs,X                                                        ;94A80C;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;94A80F;
    RTS                                                                  ;94A813;


  + AND.W #$007F                                                         ;94A814; >_<
    REP #$40                                                             ;94A817;
    CLC                                                                  ;94A819;
    RTS                                                                  ;94A81A;


.PLMs:
    dw PLMEntries_Grappled_GenericSpikeBlock                             ;94A81B;
    dw PLMEntries_Grappled_GenericSpikeBlock                             ;94A81D;
    dw PLMEntries_Grappled_GenericSpikeBlock                             ;94A81F;
    dw PLMEntries_Grappled_DraygonsBrokenTurret                          ;94A821;
    dw PLMEntries_Grappled_GenericSpikeBlock                             ;94A823;
    dw PLMEntries_Grappled_GenericSpikeBlock                             ;94A825;
    dw PLMEntries_Grappled_GenericSpikeBlock                             ;94A827;
    dw PLMEntries_Grappled_GenericSpikeBlock                             ;94A829;
    dw PLMEntries_Grappled_GenericSpikeBlock                             ;94A82B;
    dw PLMEntries_Grappled_GenericSpikeBlock                             ;94A82D;
    dw PLMEntries_Grappled_GenericSpikeBlock                             ;94A82F;
    dw PLMEntries_Grappled_GenericSpikeBlock                             ;94A831;
    dw PLMEntries_Grappled_GenericSpikeBlock                             ;94A833;
    dw PLMEntries_Grappled_GenericSpikeBlock                             ;94A835;
    dw PLMEntries_Grappled_GenericSpikeBlock                             ;94A837;
    dw PLMEntries_Grappled_GenericSpikeBlock                             ;94A839;

BlockGrappleReaction_Pointers:
    dw BlockGrappleReaction_Air_SpikeAir_SpecialAir                      ;94A83B;
    dw BlockGrappleReaction_Slope_SolidBlock_DoorBlock_SpecialBlock      ;94A83D;
    dw BlockGrappleReaction_Air_SpikeAir_SpecialAir                      ;94A83F;
    dw BlockGrappleReaction_Air_SpikeAir_SpecialAir                      ;94A841;
    dw BlockBombShotGrappledReaction_ShootableAir                        ;94A843;
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ;94A845;
    dw BlockGrappleReaction_Air_SpikeAir_SpecialAir                      ;94A847;
    dw BlockShotBombedGrappledReaction_BombableAir                       ;94A849;
    dw BlockGrappleReaction_Slope_SolidBlock_DoorBlock_SpecialBlock      ;94A84B;
    dw BlockGrappleReaction_Slope_SolidBlock_DoorBlock_SpecialBlock      ;94A84D;
    dw BlockGrappleReaction_SpikeBlock                                   ;94A84F;
    dw BlockGrappleReaction_Slope_SolidBlock_DoorBlock_SpecialBlock      ;94A851;
    dw BlockBombShotGrappledReaction_ShootableBlock                      ;94A853;
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ;94A855;
    dw BlockGrappleReaction_GrappleBlock                                 ;94A857;
    dw BlockShotBombedGrappledReaction_BombableBlock                     ;94A859;

GrappleBeamBlockCollisionDetection:
    PHB                                                                  ;94A85B;
    PHK                                                                  ;94A85C;
    PLB                                                                  ;94A85D;
    LDA.W $0D22                                                          ;94A85E;
    STA.W $0D83                                                          ;94A861;
    CLC                                                                  ;94A864;
    ROR.W $0D84                                                          ;94A865;
    ROR.W $0D82                                                          ;94A868;
    ROR.W $0D84                                                          ;94A86B;
    ROR.W $0D82                                                          ;94A86E;
    LDA.W $0D22                                                          ;94A871;
    BPL .YQuarterVelocity                                                ;94A874;
    LDA.W #$FFC0                                                         ;94A876;
    TSB.W $0D84                                                          ;94A879;

.YQuarterVelocity:
    LDA.W $0D24                                                          ;94A87C;
    STA.W $0D87                                                          ;94A87F;
    CLC                                                                  ;94A882;
    ROR.W $0D88                                                          ;94A883;
    ROR.W $0D86                                                          ;94A886;
    ROR.W $0D88                                                          ;94A889;
    ROR.W $0D86                                                          ;94A88C;
    LDA.W $0D24                                                          ;94A88F;
    BPL .loopSetup                                                       ;94A892;
    LDA.W #$FFC0                                                         ;94A894;
    TSB.W $0D88                                                          ;94A897;

.loopSetup:
    LDA.W #$0004                                                         ;94A89A;
    STA.W $0D8A                                                          ;94A89D;

.loop:
    LDA.W $0D0E                                                          ;94A8A0;
    CLC                                                                  ;94A8A3;
    ADC.W $0D82                                                          ;94A8A4;
    STA.W $0D0E                                                          ;94A8A7;
    LDA.W $0D10                                                          ;94A8AA;
    ADC.W $0D84                                                          ;94A8AD;
    STA.W $0D10                                                          ;94A8B0;
    LDA.W $0D12                                                          ;94A8B3;
    CLC                                                                  ;94A8B6;
    ADC.W $0D86                                                          ;94A8B7;
    STA.W $0D12                                                          ;94A8BA;
    LDA.W $0D14                                                          ;94A8BD;
    ADC.W $0D88                                                          ;94A8C0;
    STA.W $0D14                                                          ;94A8C3;
    LDA.W $0AF8                                                          ;94A8C6;
    CLC                                                                  ;94A8C9;
    ADC.W $0D0E                                                          ;94A8CA;
    STA.W $0D06                                                          ;94A8CD;
    LDA.W $0AF6                                                          ;94A8D0;
    ADC.W $0D10                                                          ;94A8D3;
    CLC                                                                  ;94A8D6;
    ADC.W $0D02                                                          ;94A8D7;
    STA.W $0D08                                                          ;94A8DA;
    LDA.W $0AFC                                                          ;94A8DD;
    CLC                                                                  ;94A8E0;
    ADC.W $0D12                                                          ;94A8E1;
    STA.W $0D0A                                                          ;94A8E4;
    LDA.W $0AFA                                                          ;94A8E7;
    ADC.W $0D14                                                          ;94A8EA;
    CLC                                                                  ;94A8ED;
    ADC.W $0D04                                                          ;94A8EE;
    STA.W $0D0C                                                          ;94A8F1;
    JSL.L BlockGrappleReaction                                           ;94A8F4;
    BVC .notConnected                                                    ;94A8F8;
    BCC .notConnected                                                    ;94A8FA;
    PHP                                                                  ;94A8FC;
    LDA.W $0D08                                                          ;94A8FD;
    AND.W #$FFF0                                                         ;94A900;
    ORA.W #$0008                                                         ;94A903;
    STA.W $0D08                                                          ;94A906;
    LDA.W $0D0C                                                          ;94A909;
    AND.W #$FFF0                                                         ;94A90C;
    ORA.W #$0008                                                         ;94A90F;
    STA.W $0D0C                                                          ;94A912;
    PLP                                                                  ;94A915;
    PLB                                                                  ;94A916;
    RTL                                                                  ;94A917;


.notConnected:
    DEC.W $0D8A                                                          ;94A918;
    BNE .loop                                                            ;94A91B;
    PLB                                                                  ;94A91D;
    RTL                                                                  ;94A91E;


BlockGrappleReaction:
    PHB                                                                  ;94A91F;
    PHK                                                                  ;94A920;
    PLB                                                                  ;94A921;
    LDA.W $0D0C                                                          ;94A922;
    LSR A                                                                ;94A925;
    LSR A                                                                ;94A926;
    LSR A                                                                ;94A927;
    LSR A                                                                ;94A928;
    SEP #$20                                                             ;94A929;
    STA.W HW_WRMPYA                                                      ;94A92B;
    LDA.W $07A5                                                          ;94A92E;
    STA.W HW_WRMPYB                                                      ;94A931;
    REP #$20                                                             ;94A934;
    LDA.W $0D08                                                          ;94A936;
    LSR A                                                                ;94A939;
    LSR A                                                                ;94A93A;
    LSR A                                                                ;94A93B;
    LSR A                                                                ;94A93C;
    CLC                                                                  ;94A93D;
    ADC.W HW_RDMPY                                                       ;94A93E;
    STA.W $0DC4                                                          ;94A941;
    ASL A                                                                ;94A944;
    TAX                                                                  ;94A945;
    LDA.L $7F0002,X                                                      ;94A946;
    AND.W #$F000                                                         ;94A94A;
    XBA                                                                  ;94A94D;
    LSR A                                                                ;94A94E;
    LSR A                                                                ;94A94F;
    LSR A                                                                ;94A950;
    TAX                                                                  ;94A951;
    JSR.W (BlockGrappleReaction_Pointers,X)                              ;94A952;
    PLB                                                                  ;94A955;
    RTL                                                                  ;94A956;


CalculatePositionFromGrappleBeamEndWithDistanceAndAngle:
    LDX.W $0D82                                                          ;94A957;
    LDA.W $0CF4                                                          ;94A95A;
    BMI .grapplingEnemy                                                  ;94A95D;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;94A95F;
    BMI .angleLessThan80                                                 ;94A963;
    LDA.W $0D08                                                          ;94A965;
    AND.W #$FFF0                                                         ;94A968;
    ORA.W #$0008                                                         ;94A96B;
    BRA +                                                                ;94A96E;


.angleLessThan80:
    LDA.W $0D08                                                          ;94A970;
    AND.W #$FFF0                                                         ;94A973;
    ORA.W #$0007                                                         ;94A976;

  + STA.W $0D08                                                          ;94A979;
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X                 ;94A97C;
    BMI .notBetween40_C0                                                 ;94A980;
    LDA.W $0D0C                                                          ;94A982;
    AND.W #$FFF0                                                         ;94A985;
    ORA.W #$0008                                                         ;94A988;
    BRA .setEndPosition                                                  ;94A98B;


.notBetween40_C0:
    LDA.W $0D0C                                                          ;94A98D;
    AND.W #$FFF0                                                         ;94A990;
    ORA.W #$0007                                                         ;94A993;

.setEndPosition:
    STA.W $0D0C                                                          ;94A996;

.grapplingEnemy:
    SEP #$20                                                             ;94A999;
    LDA.W $0D84                                                          ;94A99B;
    STA.W HW_WRMPYA                                                      ;94A99E;
    REP #$20                                                             ;94A9A1;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;94A9A3;
    BMI .negative                                                        ;94A9A7;
    CMP.W #$0100                                                         ;94A9A9;
    BNE .not100                                                          ;94A9AC;
    LDA.W $0D08                                                          ;94A9AE;
    CLC                                                                  ;94A9B1;
    ADC.W $0D84                                                          ;94A9B2;
    BRA +                                                                ;94A9B5;


.not100:
    SEP #$20                                                             ;94A9B7;
    STA.W HW_WRMPYB                                                      ;94A9B9;
    REP #$20                                                             ;94A9BC;
    NOP                                                                  ;94A9BE;
    NOP                                                                  ;94A9BF;
    LDA.W HW_RDMPY                                                       ;94A9C0;
    AND.W #$FF00                                                         ;94A9C3;
    XBA                                                                  ;94A9C6;
    CLC                                                                  ;94A9C7;
    ADC.W $0D08                                                          ;94A9C8;
    BRA +                                                                ;94A9CB;


.negative:
    CMP.W #$FF00                                                         ;94A9CD;
    BNE .notFF00                                                         ;94A9D0;
    LDA.W $0D08                                                          ;94A9D2;
    SEC                                                                  ;94A9D5;
    SBC.W $0D84                                                          ;94A9D6;
    BRA +                                                                ;94A9D9;


.notFF00:
    SEP #$20                                                             ;94A9DB;
    EOR.B #$FF                                                           ;94A9DD;
    INC A                                                                ;94A9DF;
    STA.W HW_WRMPYB                                                      ;94A9E0;
    REP #$20                                                             ;94A9E3;
    NOP                                                                  ;94A9E5;
    NOP                                                                  ;94A9E6;
    LDA.W HW_RDMPY                                                       ;94A9E7;
    AND.W #$FF00                                                         ;94A9EA;
    XBA                                                                  ;94A9ED;
    EOR.W #$FFFF                                                         ;94A9EE;
    INC A                                                                ;94A9F1;
    CLC                                                                  ;94A9F2;
    ADC.W $0D08                                                          ;94A9F3;

  + STA.W $0D90                                                          ;94A9F6;
    LSR A                                                                ;94A9F9;
    LSR A                                                                ;94A9FA;
    LSR A                                                                ;94A9FB;
    LSR A                                                                ;94A9FC;
    AND.W #$00FF                                                         ;94A9FD;
    STA.W $0D94                                                          ;94AA00;
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X                 ;94AA03;
    BMI .negativeAgain                                                   ;94AA07;
    CMP.W #$0100                                                         ;94AA09;
    BNE .not100again                                                     ;94AA0C;
    LDA.W $0D0C                                                          ;94AA0E;
    CLC                                                                  ;94AA11;
    ADC.W $0D84                                                          ;94AA12;
    BRA +                                                                ;94AA15;


.not100again:
    SEP #$20                                                             ;94AA17;
    STA.W HW_WRMPYB                                                      ;94AA19;
    REP #$20                                                             ;94AA1C;
    NOP                                                                  ;94AA1E;
    NOP                                                                  ;94AA1F;
    LDA.W HW_RDMPY                                                       ;94AA20;
    AND.W #$FF00                                                         ;94AA23;
    XBA                                                                  ;94AA26;
    CLC                                                                  ;94AA27;
    ADC.W $0D0C                                                          ;94AA28;
    BRA +                                                                ;94AA2B;


.negativeAgain:
    CMP.W #$FF00                                                         ;94AA2D;
    BNE .notFF00again                                                    ;94AA30;
    LDA.W $0D0C                                                          ;94AA32;
    SEC                                                                  ;94AA35;
    SBC.W $0D84                                                          ;94AA36;
    BRA +                                                                ;94AA39;


.notFF00again:
    SEP #$20                                                             ;94AA3B;
    EOR.B #$FF                                                           ;94AA3D;
    INC A                                                                ;94AA3F;
    STA.W HW_WRMPYB                                                      ;94AA40;
    REP #$20                                                             ;94AA43;
    NOP                                                                  ;94AA45;
    NOP                                                                  ;94AA46;
    LDA.W HW_RDMPY                                                       ;94AA47;
    AND.W #$FF00                                                         ;94AA4A;
    XBA                                                                  ;94AA4D;
    EOR.W #$FFFF                                                         ;94AA4E;
    INC A                                                                ;94AA51;
    CLC                                                                  ;94AA52;
    ADC.W $0D0C                                                          ;94AA53;

  + STA.W $0D92                                                          ;94AA56;
    LSR A                                                                ;94AA59;
    LSR A                                                                ;94AA5A;
    LSR A                                                                ;94AA5B;
    LSR A                                                                ;94AA5C;
    AND.W #$00FF                                                         ;94AA5D;
    STA.W $0D96                                                          ;94AA60;
    RTS                                                                  ;94AA63;


GrappleSwingCollisionReaction:
    SEP #$20                                                             ;94AA64;
    LDA.W $0D96                                                          ;94AA66;
    STA.W HW_WRMPYA                                                      ;94AA69;
    LDA.W $07A5                                                          ;94AA6C;
    STA.W HW_WRMPYB                                                      ;94AA6F;
    REP #$21                                                             ;94AA72;
    LDA.W $0D94                                                          ;94AA74;
    ADC.W HW_RDMPY                                                       ;94AA77;
    STA.W $0DC4                                                          ;94AA7A;
    ASL A                                                                ;94AA7D;
    TAX                                                                  ;94AA7E;
    LDA.L $7F0002,X                                                      ;94AA7F;
    AND.W #$F000                                                         ;94AA83;
    PHA                                                                  ;94AA86;
    PHX                                                                  ;94AA87;
    XBA                                                                  ;94AA88;
    LSR A                                                                ;94AA89;
    LSR A                                                                ;94AA8A;
    LSR A                                                                ;94AA8B;
    TAX                                                                  ;94AA8C;
    JSR.W (GrappleSwingCollisionReaction_Pointers,X)                     ;94AA8D;
    BCS .returnCollision                                                 ;94AA90;
    PLX                                                                  ;94AA92;
    PLA                                                                  ;94AA93;
    CLC                                                                  ;94AA94;
    RTS                                                                  ;94AA95;


.returnCollision:
    PLX                                                                  ;94AA96;
    PLA                                                                  ;94AA97;
    SEC                                                                  ;94AA98;
    RTS                                                                  ;94AA99;


CLCRTS_94AA9A:
    CLC                                                                  ;94AA9A;
    RTS                                                                  ;94AA9B;


SECRTS_94AA9C:
    SEC                                                                  ;94AA9C;
    RTS                                                                  ;94AA9D;


GrappleSwingCollisionReaction_SpikeAir:
    LDA.W $18A8                                                          ;94AA9E;
    BNE .return                                                          ;94AAA1;
    LDX.W $0DC4                                                          ;94AAA3;
    LDA.L $7F6402,X                                                      ;94AAA6;
    BMI .return                                                          ;94AAAA;
    ASL A                                                                ;94AAAC;
    TAX                                                                  ;94AAAD;
    LDA.W .zeroes0,X                                                     ;94AAAE;
    ORA.W .zeroes1,X                                                     ;94AAB1;
    BEQ .return                                                          ;94AAB4;
    LDA.W $0A4E                                                          ;94AAB6;
    CLC                                                                  ;94AAB9;
    ADC.W .zeroes0,X                                                     ;94AABA;
    STA.W $0A4E                                                          ;94AABD;
    LDA.W $0A50                                                          ;94AAC0;
    ADC.W .zeroes1,X                                                     ;94AAC3;
    STA.W $0A50                                                          ;94AAC6;
    LDA.W #$003C                                                         ;94AAC9;
    STA.W $18A8                                                          ;94AACC;
    LDA.W #$000A                                                         ;94AACF;
    STA.W $18AA                                                          ;94AAD2;

.return:
    CLC                                                                  ;94AAD5;
    RTS                                                                  ;94AAD6;


.zeroes0:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;94AAD7;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;94AAE7;

.zeroes1:
    dw $0000,$0000,$0010,$0000,$0000,$0000,$0000,$0000                   ;94AAF7;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;94AB07;

GrappleSwingCollisionReaction_SpikeBlock:
    LDA.W $18A8                                                          ;94AB17;
    BNE .return                                                          ;94AB1A;
    LDX.W $0DC4                                                          ;94AB1C;
    LDA.L $7F6402,X                                                      ;94AB1F;
    BMI .return                                                          ;94AB23;
    ASL A                                                                ;94AB25;
    TAX                                                                  ;94AB26;
    LDA.W .zeroes,X                                                      ;94AB27;
    ORA.W .damage,X                                                      ;94AB2A;
    BEQ .return                                                          ;94AB2D;
    LDA.W $0A4E                                                          ;94AB2F;
    CLC                                                                  ;94AB32;
    ADC.W .zeroes,X                                                      ;94AB33;
    STA.W $0A4E                                                          ;94AB36;
    LDA.W $0A50                                                          ;94AB39;
    ADC.W .damage,X                                                      ;94AB3C;
    STA.W $0A50                                                          ;94AB3F;
    LDA.W #$003C                                                         ;94AB42;
    STA.W $18A8                                                          ;94AB45;
    LDA.W #$000A                                                         ;94AB48;
    STA.W $18AA                                                          ;94AB4B;

.return:
    SEC                                                                  ;94AB4E;
    RTS                                                                  ;94AB4F;


.zeroes:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;94AB50;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;94AB60;

.damage:
    dw $003C,$0010,$0000,$0000,$0000,$0000,$0000,$0000                   ;94AB70;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;94AB80;

GrappleSwingCollisionReaction_Pointers:
    dw CLCRTS_94AA9A                                                     ;94AB90;
    dw SECRTS_94AA9C                                                     ;94AB92;
    dw GrappleSwingCollisionReaction_SpikeAir                            ;94AB94;
    dw CLCRTS_94AA9A                                                     ;94AB96;
    dw CLCRTS_94AA9A                                                     ;94AB98;
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ;94AB9A;
    dw CLCRTS_94AA9A                                                     ;94AB9C;
    dw CLCRTS_94AA9A                                                     ;94AB9E;
    dw SECRTS_94AA9C                                                     ;94ABA0;
    dw SECRTS_94AA9C                                                     ;94ABA2;
    dw GrappleSwingCollisionReaction_SpikeBlock                          ;94ABA4;
    dw SECRTS_94AA9C                                                     ;94ABA6;
    dw SECRTS_94AA9C                                                     ;94ABA8;
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ;94ABAA;
    dw SECRTS_94AA9C                                                     ;94ABAC;
    dw SECRTS_94AA9C                                                     ;94ABAE;

GrappleSwingCollisionReaction_duplicate:
    SEP #$20                                                             ;94ABB0;
    LDA.W $0D96                                                          ;94ABB2;
    STA.W HW_WRMPYA                                                      ;94ABB5;
    LDA.W $07A5                                                          ;94ABB8;
    STA.W HW_WRMPYB                                                      ;94ABBB;
    REP #$21                                                             ;94ABBE;
    LDA.W $0D94                                                          ;94ABC0;
    ADC.W HW_RDMPY                                                       ;94ABC3;
    STA.W $0DC4                                                          ;94ABC6;
    ASL A                                                                ;94ABC9;
    TAX                                                                  ;94ABCA;
    LDA.L $7F0002,X                                                      ;94ABCB;
    AND.W #$F000                                                         ;94ABCF;
    PHA                                                                  ;94ABD2;
    PHX                                                                  ;94ABD3;
    XBA                                                                  ;94ABD4;
    LSR A                                                                ;94ABD5;
    LSR A                                                                ;94ABD6;
    LSR A                                                                ;94ABD7;
    TAX                                                                  ;94ABD8;
    JSR.W (GrappleSwingCollisionReaction_Pointers,X)                     ;94ABD9;
    BCS .returnCollision                                                 ;94ABDC;
    PLX                                                                  ;94ABDE;
    PLA                                                                  ;94ABDF;
    CLC                                                                  ;94ABE0;
    RTS                                                                  ;94ABE1;


.returnCollision:
    PLX                                                                  ;94ABE2;
    PLA                                                                  ;94ABE3;
    SEC                                                                  ;94ABE4;
    RTS                                                                  ;94ABE5;


GrappleSwingCollisionDetectionDueToSwinging:
    LDA.W #$0006                                                         ;94ABE6;
    STA.W $0D98                                                          ;94ABE9;
    LDA.W #$0008                                                         ;94ABEC;
    CLC                                                                  ;94ABEF;
    ADC.W $0CFE                                                          ;94ABF0;
    STA.W $0D84                                                          ;94ABF3;

.loop:
    JSR.W CalculatePositionFromGrappleBeamEndWithDistanceAndAngle        ;94ABF6;
    JSR.W GrappleSwingCollisionReaction_duplicate                        ;94ABF9;
    BCS .return                                                          ;94ABFC;
    LDA.W $0D84                                                          ;94ABFE;
    CLC                                                                  ;94AC01;
    ADC.W #$0008                                                         ;94AC02;
    STA.W $0D84                                                          ;94AC05;
    DEC.W $0D98                                                          ;94AC08;
    BNE .loop                                                            ;94AC0B;
    CLC                                                                  ;94AC0D;
    RTS                                                                  ;94AC0E;


.return:
    NOP                                                                  ;94AC0F; >_<
    RTS                                                                  ;94AC10;


UpdateGrappleBeamStartPositionDuringGrappleSwinging:
    LDA.W $0CFB                                                          ;94AC11;
    AND.W #$00FF                                                         ;94AC14;
    ASL A                                                                ;94AC17;
    STA.W $0D82                                                          ;94AC18;
    LDA.W $0CFE                                                          ;94AC1B;
    STA.W $0D84                                                          ;94AC1E;
    JSR.W CalculatePositionFromGrappleBeamEndWithDistanceAndAngle        ;94AC21;
    LDA.W $0D90                                                          ;94AC24;
    STA.W $0D16                                                          ;94AC27;
    LDA.W $0D92                                                          ;94AC2A;
    STA.W $0D18                                                          ;94AC2D;
    RTL                                                                  ;94AC30;


HandleGrappleBeamLengthChange:
    PHB                                                                  ;94AC31;
    PHK                                                                  ;94AC32;
    PLB                                                                  ;94AC33;
    LDA.W $0D00                                                          ;94AC34;
    BNE .nonZeroLengthDelta                                              ;94AC37;
    JMP.W .returnCarryClear                                              ;94AC39;


.nonZeroLengthDelta:
    BMI .positiveGrappleBeamLengthDelta                                  ;94AC3C;
    JMP.W .increaseLength                                                ;94AC3E;


.positiveGrappleBeamLengthDelta:
    LDA.W $0CFE                                                          ;94AC41;
    CLC                                                                  ;94AC44;
    ADC.W $0D00                                                          ;94AC45;
    CMP.W #$0008                                                         ;94AC48;
    BCS .greaterThanEqualTo8                                             ;94AC4B;
    STZ.W $0D00                                                          ;94AC4D;
    LDA.W #$0008                                                         ;94AC50;

.greaterThanEqualTo8:
    STA.W $0D8C                                                          ;94AC53;
    LDA.W #$0008                                                         ;94AC56;
    STA.W $0D8E                                                          ;94AC59;
    LDA.W $0CFB                                                          ;94AC5C;
    AND.W #$00FF                                                         ;94AC5F;
    ASL A                                                                ;94AC62;
    STA.W $0D82                                                          ;94AC63;
    LDA.W $0CFE                                                          ;94AC66;
    CMP.W $0D8C                                                          ;94AC69;
    BEQ .decreasedToTargetLength                                         ;94AC6C;

.decreaseLength:
    STA.W $0D8A                                                          ;94AC6E;
    DEC A                                                                ;94AC71;
    CLC                                                                  ;94AC72;
    ADC.W $0D8E                                                          ;94AC73;
    STA.W $0D84                                                          ;94AC76;
    JSR.W CalculatePositionFromGrappleBeamEndWithDistanceAndAngle        ;94AC79;
    JSR.W GrappleSwingCollisionReaction                                  ;94AC7C;
    BCS .collision                                                       ;94AC7F;
    DEC.W $0D8A                                                          ;94AC81;
    LDA.W $0D8A                                                          ;94AC84;
    CMP.W $0D8C                                                          ;94AC87;
    BNE .decreaseLength                                                  ;94AC8A;

.decreasedToTargetLength:
    LDA.W $0D8C                                                          ;94AC8C;
    STA.W $0CFE                                                          ;94AC8F;
    PLB                                                                  ;94AC92;
    CLC                                                                  ;94AC93;
    RTL                                                                  ;94AC94;


.collision:
    LDA.W $0D8A                                                          ;94AC95;
    STA.W $0CFE                                                          ;94AC98;
    PLB                                                                  ;94AC9B;
    SEC                                                                  ;94AC9C;
    RTL                                                                  ;94AC9D;


.increaseLength:
    LDA.W $0CFE                                                          ;94AC9E;
    CLC                                                                  ;94ACA1;
    ADC.W $0D00                                                          ;94ACA2;
    CMP.W #$003F                                                         ;94ACA5;
    BCC .lessThan3F                                                      ;94ACA8;
    STZ.W $0D00                                                          ;94ACAA;
    LDA.W #$003F                                                         ;94ACAD;

.lessThan3F:
    STA.W $0D8C                                                          ;94ACB0;
    LDA.W #$0038                                                         ;94ACB3;
    STA.W $0D8E                                                          ;94ACB6;
    LDA.W $0CFB                                                          ;94ACB9;
    AND.W #$00FF                                                         ;94ACBC;
    ASL A                                                                ;94ACBF;
    STA.W $0D82                                                          ;94ACC0;
    LDA.W $0CFE                                                          ;94ACC3;
    CMP.W $0D8C                                                          ;94ACC6;
    BEQ .increasedToTargetLength                                         ;94ACC9;

.loopIncreaseLength:
    STA.W $0D8A                                                          ;94ACCB;
    INC A                                                                ;94ACCE;
    CLC                                                                  ;94ACCF;
    ADC.W $0D8E                                                          ;94ACD0;
    STA.W $0D84                                                          ;94ACD3;
    JSR.W CalculatePositionFromGrappleBeamEndWithDistanceAndAngle        ;94ACD6;
    JSR.W GrappleSwingCollisionReaction                                  ;94ACD9;
    BCS .collision                                                       ;94ACDC;
    INC.W $0D8A                                                          ;94ACDE;
    LDA.W $0D8A                                                          ;94ACE1;
    CMP.W $0D8C                                                          ;94ACE4;
    BNE .loopIncreaseLength                                              ;94ACE7;

.increasedToTargetLength:
    LDA.W $0D8C                                                          ;94ACE9;
    STA.W $0CFE                                                          ;94ACEC;
    PLB                                                                  ;94ACEF;
    CLC                                                                  ;94ACF0;
    RTL                                                                  ;94ACF1;

    LDA.W $0D8A                                                          ;94ACF2; dead code
    STA.W $0CFE                                                          ;94ACF5;
    PLB                                                                  ;94ACF8;
    SEC                                                                  ;94ACF9;
    RTL                                                                  ;94ACFA;


.returnCarryClear:
    PLB                                                                  ;94ACFB;
    CLC                                                                  ;94ACFC;
    RTL                                                                  ;94ACFD;


HandleGrappleBeamSwingingMovement:
    PHB                                                                  ;94ACFE;
    PHK                                                                  ;94ACFF;
    PLB                                                                  ;94AD00;
    LDY.W #$0100                                                         ;94AD01;
    LDA.W $0CF4                                                          ;94AD04;
    BIT.W #$0001                                                         ;94AD07;
    BEQ .nonLiquidPhysics                                                ;94AD0A;
    LDY.W #$00A0                                                         ;94AD0C;

.nonLiquidPhysics:
    LDA.W $0D26                                                          ;94AD0F;
    CLC                                                                  ;94AD12;
    ADC.W $0D2E                                                          ;94AD13;
    BPL .preClockwise                                                    ;94AD16;
    EOR.W #$FFFF                                                         ;94AD18;
    INC A                                                                ;94AD1B;
    JSL.L A_Y_16bit_UnsignedMultiplication                               ;94AD1C;
    LDA.W $05F2                                                          ;94AD20;
    EOR.W #$FFFF                                                         ;94AD23;
    INC A                                                                ;94AD26;
    BEQ .gotoFailedMovement                                              ;94AD27;
    STA.W $0D9C                                                          ;94AD29;
    JMP.W .anticlockwise                                                 ;94AD2C;


.preClockwise:
    JSL.L A_Y_16bit_UnsignedMultiplication                               ;94AD2F;
    LDA.W $05F2                                                          ;94AD33;
    BEQ .gotoFailedMovement                                              ;94AD36;
    STA.W $0D9C                                                          ;94AD38;
    BRA .clockwise                                                       ;94AD3B;


.gotoFailedMovement:
    JMP.W .failedMovement                                                ;94AD3D;


.clockwise:
    CLC                                                                  ;94AD40;
    ADC.W $0CFA                                                          ;94AD41;
    XBA                                                                  ;94AD44;
    AND.W #$00FF                                                         ;94AD45;
    ASL A                                                                ;94AD48;
    STA.W $0D88                                                          ;94AD49;
    LDA.W $0CFE                                                          ;94AD4C;
    STA.W $0D84                                                          ;94AD4F;
    LDA.W $0CFB                                                          ;94AD52;
    AND.W #$00FF                                                         ;94AD55;
    ASL A                                                                ;94AD58;
    CMP.W $0D88                                                          ;94AD59;
    BEQ ..reachedTarget                                                  ;94AD5C;

..loop:
    STA.W $0D86                                                          ;94AD5E;
    INC A                                                                ;94AD61;
    INC A                                                                ;94AD62;
    AND.W #$01FF                                                         ;94AD63;
    STA.W $0D82                                                          ;94AD66;
    JSR.W GrappleSwingCollisionDetectionDueToSwinging                    ;94AD69;
    BCS ..collision                                                      ;94AD6C;
    LDA.W $0D86                                                          ;94AD6E;
    INC A                                                                ;94AD71;
    INC A                                                                ;94AD72;
    AND.W #$01FF                                                         ;94AD73;
    CMP.W $0D88                                                          ;94AD76;
    BNE ..loop                                                           ;94AD79;

..reachedTarget:
    LDA.W $0CFA                                                          ;94AD7B;
    CLC                                                                  ;94AD7E;
    ADC.W $0D9C                                                          ;94AD7F;
    STA.W $0CFA                                                          ;94AD82;
    STA.W $0CFC                                                          ;94AD85;
    LDA.W #$8000                                                         ;94AD88;
    TRB.W $0D36                                                          ;94AD8B;
    DEC.W $0D30                                                          ;94AD8E;
    BPL +                                                                ;94AD91;
    STZ.W $0D30                                                          ;94AD93;

  + LDA.W $0D2E                                                          ;94AD96;
    BPL +                                                                ;94AD99;
    CLC                                                                  ;94AD9B;
    ADC.W #$0006                                                         ;94AD9C;
    BPL ..zero                                                           ;94AD9F;
    BRA ..returnCarryClear                                               ;94ADA1;


  + SEC                                                                  ;94ADA3;
    SBC.W #$0006                                                         ;94ADA4;
    BMI ..zero                                                           ;94ADA7;
    BRA ..returnCarryClear                                               ;94ADA9;


..zero:
    LDA.W #$0000                                                         ;94ADAB;

..returnCarryClear:
    STA.W $0D2E                                                          ;94ADAE;
    PLB                                                                  ;94ADB1;
    CLC                                                                  ;94ADB2;
    RTL                                                                  ;94ADB3;


..collision:
    LDA.W $0D86                                                          ;94ADB4;
    LSR A                                                                ;94ADB7;
    AND.W #$00FF                                                         ;94ADB8;
    XBA                                                                  ;94ADBB;
    ORA.W #$0080                                                         ;94ADBC;
    STA.W $0CFA                                                          ;94ADBF;
    STA.W $0CFC                                                          ;94ADC2;
    LDA.W $0D98                                                          ;94ADC5;
    CMP.W #$0006                                                         ;94ADC8;
    BEQ ..noBounce                                                       ;94ADCB;
    CMP.W #$0005                                                         ;94ADCD;
    BNE ..bounce                                                         ;94ADD0;

..noBounce:
    LDA.W $0CFE                                                          ;94ADD2;
    CMP.W #$0008                                                         ;94ADD5;
    BNE ..bounce                                                         ;94ADD8;
    LDA.W #$8000                                                         ;94ADDA;
    TSB.W $0D36                                                          ;94ADDD;
    STZ.W $0D26                                                          ;94ADE0;
    STZ.W $0D2E                                                          ;94ADE3;
    PLB                                                                  ;94ADE6;
    SEC                                                                  ;94ADE7;
    RTL                                                                  ;94ADE8;


..bounce:
    LDA.W #$0010                                                         ;94ADE9;
    STA.W $0D30                                                          ;94ADEC;
    LDA.W $0D26                                                          ;94ADEF;
    ASL A                                                                ;94ADF2;
    LDA.W $0D26                                                          ;94ADF3;
    ROR A                                                                ;94ADF6;
    EOR.W #$FFFF                                                         ;94ADF7;
    INC A                                                                ;94ADFA;
    STA.W $0D26                                                          ;94ADFB;
    LDA.W $0D2E                                                          ;94ADFE;
    ASL A                                                                ;94AE01;
    LDA.W $0D2E                                                          ;94AE02;
    ROR A                                                                ;94AE05;
    EOR.W #$FFFF                                                         ;94AE06;
    INC A                                                                ;94AE09;
    STA.W $0D2E                                                          ;94AE0A;
    PLB                                                                  ;94AE0D;
    SEC                                                                  ;94AE0E;
    RTL                                                                  ;94AE0F;


.anticlockwise:
    CLC                                                                  ;94AE10;
    ADC.W $0CFA                                                          ;94AE11;
    XBA                                                                  ;94AE14;
    AND.W #$00FF                                                         ;94AE15;
    ASL A                                                                ;94AE18;
    STA.W $0D88                                                          ;94AE19;
    LDA.W $0CFE                                                          ;94AE1C;
    STA.W $0D84                                                          ;94AE1F;
    LDA.W $0CFB                                                          ;94AE22;
    AND.W #$00FF                                                         ;94AE25;
    ASL A                                                                ;94AE28;
    CMP.W $0D88                                                          ;94AE29;
    BEQ ..reachedTarget                                                  ;94AE2C;

..loop:
    STA.W $0D86                                                          ;94AE2E;
    DEC A                                                                ;94AE31;
    DEC A                                                                ;94AE32;
    AND.W #$01FF                                                         ;94AE33;
    STA.W $0D82                                                          ;94AE36;
    JSR.W GrappleSwingCollisionDetectionDueToSwinging                    ;94AE39;
    BCS ..collision                                                      ;94AE3C;
    LDA.W $0D86                                                          ;94AE3E;
    DEC A                                                                ;94AE41;
    DEC A                                                                ;94AE42;
    AND.W #$01FF                                                         ;94AE43;
    CMP.W $0D88                                                          ;94AE46;
    BNE ..loop                                                           ;94AE49;

..reachedTarget:
    LDA.W $0CFA                                                          ;94AE4B;
    CLC                                                                  ;94AE4E;
    ADC.W $0D9C                                                          ;94AE4F;
    STA.W $0CFA                                                          ;94AE52;
    STA.W $0CFC                                                          ;94AE55;
    LDA.W #$8000                                                         ;94AE58;
    TRB.W $0D36                                                          ;94AE5B;
    DEC.W $0D30                                                          ;94AE5E;
    BPL +                                                                ;94AE61;
    STZ.W $0D30                                                          ;94AE63;

  + LDA.W $0D2E                                                          ;94AE66;
    BPL +                                                                ;94AE69;
    CLC                                                                  ;94AE6B;
    ADC.W #$0006                                                         ;94AE6C;
    BPL ..zero                                                           ;94AE6F;
    BRA ..returnCarryClear                                               ;94AE71;


  + SEC                                                                  ;94AE73;
    SBC.W #$0006                                                         ;94AE74;
    BMI ..zero                                                           ;94AE77;
    BRA ..returnCarryClear                                               ;94AE79;


..zero:
    LDA.W #$0000                                                         ;94AE7B;

..returnCarryClear:
    STA.W $0D2E                                                          ;94AE7E;
    PLB                                                                  ;94AE81;
    CLC                                                                  ;94AE82;
    RTL                                                                  ;94AE83;


..collision:
    LDA.W $0D86                                                          ;94AE84;
    LSR A                                                                ;94AE87;
    AND.W #$00FF                                                         ;94AE88;
    XBA                                                                  ;94AE8B;
    ORA.W #$0080                                                         ;94AE8C;
    STA.W $0CFA                                                          ;94AE8F;
    STA.W $0CFC                                                          ;94AE92;
    LDA.W $0D98                                                          ;94AE95;
    CMP.W #$0006                                                         ;94AE98;
    BEQ +                                                                ;94AE9B;
    CMP.W #$0005                                                         ;94AE9D;
    BNE ..bounce                                                         ;94AEA0;

  + LDA.W $0CFE                                                          ;94AEA2;
    CMP.W #$0008                                                         ;94AEA5;
    BNE ..bounce                                                         ;94AEA8;
    LDA.W #$8000                                                         ;94AEAA;
    TSB.W $0D36                                                          ;94AEAD;
    STZ.W $0D26                                                          ;94AEB0;
    STZ.W $0D2E                                                          ;94AEB3;
    PLB                                                                  ;94AEB6;
    SEC                                                                  ;94AEB7;
    RTL                                                                  ;94AEB8;


..bounce:
    LDA.W #$0010                                                         ;94AEB9;
    STA.W $0D30                                                          ;94AEBC;
    LDA.W $0D26                                                          ;94AEBF;
    ASL A                                                                ;94AEC2;
    LDA.W $0D26                                                          ;94AEC3;
    ROR A                                                                ;94AEC6;
    EOR.W #$FFFF                                                         ;94AEC7;
    INC A                                                                ;94AECA;
    STA.W $0D26                                                          ;94AECB;
    LDA.W $0D2E                                                          ;94AECE;
    ASL A                                                                ;94AED1;
    LDA.W $0D2E                                                          ;94AED2;
    ROR A                                                                ;94AED5;
    EOR.W #$FFFF                                                         ;94AED6;
    INC A                                                                ;94AED9;
    STA.W $0D2E                                                          ;94AEDA;
    PLB                                                                  ;94AEDD;
    SEC                                                                  ;94AEDE;
    RTL                                                                  ;94AEDF;


.failedMovement:
    PLB                                                                  ;94AEE0;
    CLC                                                                  ;94AEE1;
    RTL                                                                  ;94AEE2;

    LDA.W $0CFA                                                          ;94AEE3; dead code
    EOR.W $0D26                                                          ;94AEE6;
    BMI ..rising                                                         ;94AEE9;
    INC.W $0D38                                                          ;94AEEB;
    LDA.W $0D38                                                          ;94AEEE;
    CMP.W #$0020                                                         ;94AEF1;
    BNE ..lessThan20                                                     ;94AEF4;
    LDA.W #GrappleBeamFunction_Dropped                                   ;94AEF6;
    STA.W $0D32                                                          ;94AEF9;

..lessThan20:
    STZ.W $0D26                                                          ;94AEFC;
    STZ.W $0D2E                                                          ;94AEFF;
    PLB                                                                  ;94AF02;
    SEC                                                                  ;94AF03;
    RTL                                                                  ;94AF04;


..rising:
    STZ.W $0D38                                                          ;94AF05;
    PLB                                                                  ;94AF08;
    SEC                                                                  ;94AF09;
    RTL                                                                  ;94AF0A;


CLCRTL_94AF0B:
    CLC                                                                  ;94AF0B;
    RTL                                                                  ;94AF0C;

    PHB                                                                  ;94AF0D; dead code
    PHK                                                                  ;94AF0E;
    PLB                                                                  ;94AF0F;
    LDA.W $0D08                                                          ;94AF10;
    LSR A                                                                ;94AF13;
    LSR A                                                                ;94AF14;
    LSR A                                                                ;94AF15;
    LSR A                                                                ;94AF16;
    AND.W #$00FF                                                         ;94AF17;
    XBA                                                                  ;94AF1A;
    STA.W $0D94                                                          ;94AF1B;
    LDA.W $0D0C                                                          ;94AF1E;
    LSR A                                                                ;94AF21;
    LSR A                                                                ;94AF22;
    LSR A                                                                ;94AF23;
    LSR A                                                                ;94AF24;
    AND.W #$00FF                                                         ;94AF25;
    XBA                                                                  ;94AF28;
    STA.W $0D96                                                          ;94AF29;
    LDA.W $0CFE                                                          ;94AF2C;
    LSR A                                                                ;94AF2F;
    LSR A                                                                ;94AF30;
    LSR A                                                                ;94AF31;
    LSR A                                                                ;94AF32;
    STA.W $0D98                                                          ;94AF33;

.loop:
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X                 ;94AF36;
    CLC                                                                  ;94AF3A;
    ADC.W $0D96                                                          ;94AF3B;
    STA.W $0D96                                                          ;94AF3E;
    XBA                                                                  ;94AF41;
    SEP #$20                                                             ;94AF42;
    STA.W HW_WRMPYA                                                      ;94AF44;
    LDA.W $07A5                                                          ;94AF47;
    STA.W HW_WRMPYB                                                      ;94AF4A;
    REP #$21                                                             ;94AF4D;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;94AF4F;
    ADC.W $0D94                                                          ;94AF53;
    STA.W $0D94                                                          ;94AF56;
    AND.W #$FF00                                                         ;94AF59;
    XBA                                                                  ;94AF5C;
    ADC.W HW_RDMPY                                                       ;94AF5D;
    STA.W $0DC4                                                          ;94AF60;
    ASL A                                                                ;94AF63;
    TAX                                                                  ;94AF64;
    LDA.L $7F0002,X                                                      ;94AF65;
    AND.W #$F000                                                         ;94AF69;
    XBA                                                                  ;94AF6C;
    LSR A                                                                ;94AF6D;
    LSR A                                                                ;94AF6E;
    LSR A                                                                ;94AF6F;
    TAX                                                                  ;94AF70;
    JSR.W (GrappleSwingCollisionReaction_Pointers,X)                     ;94AF71;
    BCS +                                                                ;94AF74;
    DEC.W $0D98                                                          ;94AF76;
    BPL .loop                                                            ;94AF79;
    PLB                                                                  ;94AF7B;
    CLC                                                                  ;94AF7C;
    RTL                                                                  ;94AF7D;


  + LDA.W #GrappleBeamFunction_Dropped                                   ;94AF7E;
    STA.W $0D32                                                          ;94AF81;
    PLB                                                                  ;94AF84;
    SEC                                                                  ;94AF85;
    RTL                                                                  ;94AF86;


InitializeGrappleSegmentAnimations:
    LDX.W #$001E                                                         ;94AF87;

.loop:
    LDA.W #InstList_DrawGrappleBeam_GrappleSegmentAnimations_3           ;94AF8A;
    STA.W $0D62,X                                                        ;94AF8D;
    LDA.W #InstList_DrawGrappleBeam_GrappleSegmentAnimations_2           ;94AF90;
    STA.W $0D60,X                                                        ;94AF93;
    LDA.W #InstList_DrawGrappleBeam_GrappleSegmentAnimations_1           ;94AF96;
    STA.W $0D5E,X                                                        ;94AF99;
    LDA.W #InstList_DrawGrappleBeam_GrappleSegmentAnimations_0           ;94AF9C;
    STA.W $0D5C,X                                                        ;94AF9F;
    LDA.W #$0001                                                         ;94AFA2;
    STA.W $0D42,X                                                        ;94AFA5;
    STA.W $0D40,X                                                        ;94AFA8;
    STA.W $0D3E,X                                                        ;94AFAB;
    STA.W $0D3C,X                                                        ;94AFAE;
    TXA                                                                  ;94AFB1;
    SEC                                                                  ;94AFB2;
    SBC.W #$0008                                                         ;94AFB3;
    TAX                                                                  ;94AFB6;
    BPL .loop                                                            ;94AFB7;
    RTL                                                                  ;94AFB9;


DrawGrappleBeam:
    PHB                                                                  ;94AFBA;
    PHK                                                                  ;94AFBB;
    PLB                                                                  ;94AFBC;
    LDA.W $0D08                                                          ;94AFBD;
    SEC                                                                  ;94AFC0;
    SBC.W $0D1A                                                          ;94AFC1;
    STA.B $12                                                            ;94AFC4;
    LDA.W $0D0C                                                          ;94AFC6;
    SEC                                                                  ;94AFC9;
    SBC.W $0D1C                                                          ;94AFCA;
    STA.B $14                                                            ;94AFCD;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;94AFCF;
    ASL A                                                                ;94AFD3;
    TAX                                                                  ;94AFD4;
    STZ.B $1A                                                            ;94AFD5;
    STZ.B $1C                                                            ;94AFD7;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;94AFD9;
    ASL A                                                                ;94AFDD;
    ASL A                                                                ;94AFDE;
    ASL A                                                                ;94AFDF;
    BPL +                                                                ;94AFE0;
    DEC.B $1C                                                            ;94AFE2;

  + STA.B $1B                                                            ;94AFE4;
    STZ.B $1E                                                            ;94AFE6;
    STZ.B $20                                                            ;94AFE8;
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X                 ;94AFEA;
    ASL A                                                                ;94AFEE;
    ASL A                                                                ;94AFEF;
    ASL A                                                                ;94AFF0;
    BPL +                                                                ;94AFF1;
    DEC.B $20                                                            ;94AFF3;

  + STA.B $1F                                                            ;94AFF5;
    LDA.W $0CFA                                                          ;94AFF7;
    AND.W #$8000                                                         ;94AFFA;
    LSR A                                                                ;94AFFD;
    STA.B $26                                                            ;94AFFE;
    EOR.W $0CFA                                                          ;94B000;
    AND.W #$4000                                                         ;94B003;
    EOR.W #$4000                                                         ;94B006;
    ASL A                                                                ;94B009;
    ORA.B $26                                                            ;94B00A;
    STA.B $26                                                            ;94B00C;
    LDA.W $0D1A                                                          ;94B00E;
    SEC                                                                  ;94B011;
    SBC.W $0911                                                          ;94B012;
    SEC                                                                  ;94B015;
    SBC.W #$0004                                                         ;94B016;
    STA.B $14                                                            ;94B019;
    STZ.B $12                                                            ;94B01B;
    LDA.W $0D1C                                                          ;94B01D;
    SEC                                                                  ;94B020;
    SBC.W $0915                                                          ;94B021;
    SEC                                                                  ;94B024;
    SBC.W #$0004                                                         ;94B025;
    STA.B $18                                                            ;94B028;
    STZ.B $16                                                            ;94B02A;
    LDA.W $0CFE                                                          ;94B02C;
    BMI .return                                                          ;94B02F;
    STA.W HW_WRDIV                                                       ;94B031;
    SEP #$20                                                             ;94B034;
    LDA.B #$08                                                           ;94B036;
    STA.W HW_WRDIVB                                                      ;94B038;
    REP #$20                                                             ;94B03B;
    NOP                                                                  ;94B03D;
    NOP                                                                  ;94B03E;
    NOP                                                                  ;94B03F;
    NOP                                                                  ;94B040;
    NOP                                                                  ;94B041;
    NOP                                                                  ;94B042;
    LDA.W $4214                                                          ;94B043;
    BMI .return                                                          ;94B046;
    AND.W #$000F                                                         ;94B048;
    SEC                                                                  ;94B04B;
    SBC.W #$0001                                                         ;94B04C;
    STA.B $28                                                            ;94B04F;
    LDX.W #$001E                                                         ;94B051;

.loopAnimations:
    DEC.W $0D42,X                                                        ;94B054;
    BNE .processedInstructions                                           ;94B057;
    LDY.W $0D62,X                                                        ;94B059;

.loopInstructions:
    LDA.W $0000,Y                                                        ;94B05C;
    BPL .notInstruction                                                  ;94B05F;
    STA.B $24                                                            ;94B061;
    PEA.W .loopInstructions-1                                            ;94B063;
    INY                                                                  ;94B066;
    INY                                                                  ;94B067;
    JMP.W ($0024)                                                        ;94B068;


.notInstruction:
    STA.W $0D42,X                                                        ;94B06B;
    TYA                                                                  ;94B06E;
    CLC                                                                  ;94B06F;
    ADC.W #$0004                                                         ;94B070;
    STA.W $0D62,X                                                        ;94B073;

.processedInstructions:
    LDA.B $14                                                            ;94B076;
    ORA.B $18                                                            ;94B078;
    AND.W #$FF00                                                         ;94B07A;
    BNE +                                                                ;94B07D;
    PHX                                                                  ;94B07F;
    LDY.W $0D62,X                                                        ;94B080;
    DEY                                                                  ;94B083;
    DEY                                                                  ;94B084;
    LDA.W $0000,Y                                                        ;94B085;
    TAY                                                                  ;94B088;
    JSR.W DrawGrappleSegment                                             ;94B089;
    PLX                                                                  ;94B08C;
    DEX                                                                  ;94B08D;
    DEX                                                                  ;94B08E;
    DEC.B $28                                                            ;94B08F;
    BPL .loopAnimations                                                  ;94B091;

  + LDA.W $0A1C                                                          ;94B093;
    CMP.W #$00B2                                                         ;94B096;
    BEQ .connectedEnd                                                    ;94B099;
    CMP.W #$00B3                                                         ;94B09B;
    BEQ .connectedEnd                                                    ;94B09E;
    JSR.W DrawGrappleBeamEnd_NotConnected                                ;94B0A0;
    BRA .return                                                          ;94B0A3;


.connectedEnd:
    JSR.W DrawGrappleBeamEnd_Connected                                   ;94B0A5;

.return:
    PLB                                                                  ;94B0A8;
    RTL                                                                  ;94B0A9;


DrawGrappleSegment:
    LDX.W $0590                                                          ;94B0AA;
    CLC                                                                  ;94B0AD;
    LDA.B $14                                                            ;94B0AE;
    STA.W $0370,X                                                        ;94B0B0;
    LDA.B $12                                                            ;94B0B3;
    CLC                                                                  ;94B0B5;
    ADC.B $1A                                                            ;94B0B6;
    STA.B $12                                                            ;94B0B8;
    LDA.B $14                                                            ;94B0BA;
    ADC.B $1C                                                            ;94B0BC;
    STA.B $14                                                            ;94B0BE;
    AND.W #$0100                                                         ;94B0C0;
    BRA +                                                                ;94B0C3;

    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;94B0C5; dead code
    STA.B $22                                                            ;94B0C9;
    LDA.B ($22)                                                          ;94B0CB;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;94B0CD;
    STA.B ($22)                                                          ;94B0D1;

  + LDA.B $18                                                            ;94B0D3;
    STA.W $0371,X                                                        ;94B0D5;
    LDA.B $16                                                            ;94B0D8;
    CLC                                                                  ;94B0DA;
    ADC.B $1E                                                            ;94B0DB;
    STA.B $16                                                            ;94B0DD;
    LDA.B $18                                                            ;94B0DF;
    ADC.B $20                                                            ;94B0E1;
    STA.B $18                                                            ;94B0E3;
    TYA                                                                  ;94B0E5;
    ORA.B $26                                                            ;94B0E6;
    STA.W $0372,X                                                        ;94B0E8;
    TXA                                                                  ;94B0EB;
    CLC                                                                  ;94B0EC;
    ADC.W #$0004                                                         ;94B0ED;
    STA.W $0590                                                          ;94B0F0;
    RTS                                                                  ;94B0F3;


Instruction_DrawGrappleBeam_GotoY:
    LDA.W $0000,Y                                                        ;94B0F4;
    TAY                                                                  ;94B0F7;
    RTS                                                                  ;94B0F8;


DrawGrappleBeamEnd_NotConnected:
    LDA.W $0D0C                                                          ;94B0F9;
    SEC                                                                  ;94B0FC;
    SBC.W $0915                                                          ;94B0FD;
    BIT.W #$FF00                                                         ;94B100;
    BNE .return                                                          ;94B103;
    LDX.W $0590                                                          ;94B105;
    CLC                                                                  ;94B108;
    LDA.B $14                                                            ;94B109;
    LDA.W $0D08                                                          ;94B10B;
    SEC                                                                  ;94B10E;
    SBC.W $0911                                                          ;94B10F;
    SEC                                                                  ;94B112;
    SBC.W #$0004                                                         ;94B113;
    STA.W $0370,X                                                        ;94B116;
    AND.W #$0100                                                         ;94B119;
    BEQ +                                                                ;94B11C;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;94B11E;
    STA.B $22                                                            ;94B122;
    LDA.B ($22)                                                          ;94B124;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;94B126;
    STA.B ($22)                                                          ;94B12A;

  + LDA.B $18                                                            ;94B12C; >_<
    LDA.W $0D0C                                                          ;94B12E;
    SEC                                                                  ;94B131;
    SBC.W $0915                                                          ;94B132;
    SEC                                                                  ;94B135;
    SBC.W #$0004                                                         ;94B136;
    STA.W $0371,X                                                        ;94B139;
    LDA.W #$3A20                                                         ;94B13C;
    STA.W $0372,X                                                        ;94B13F;
    TXA                                                                  ;94B142;
    CLC                                                                  ;94B143;
    ADC.W #$0004                                                         ;94B144;
    STA.W $0590                                                          ;94B147;

.return:
    RTS                                                                  ;94B14A;


DrawGrappleBeamEnd_Connected:
    LDX.W $0590                                                          ;94B14B;
    CLC                                                                  ;94B14E;
    LDA.W $0D08                                                          ;94B14F;
    SEC                                                                  ;94B152;
    SBC.W $0911                                                          ;94B153;
    SBC.W #$0004                                                         ;94B156;
    STA.W $0370,X                                                        ;94B159;
    AND.W #$0100                                                         ;94B15C;
    BEQ +                                                                ;94B15F;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;94B161;
    STA.B $22                                                            ;94B165;
    LDA.B ($22)                                                          ;94B167;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;94B169;
    STA.B ($22)                                                          ;94B16D;

  + LDA.W $0D0C                                                          ;94B16F;
    SEC                                                                  ;94B172;
    SBC.W $0915                                                          ;94B173;
    SBC.W #$0004                                                         ;94B176;
    STA.W $0371,X                                                        ;94B179;
    LDA.W #$3A20                                                         ;94B17C;
    STA.W $0372,X                                                        ;94B17F;
    TXA                                                                  ;94B182;
    CLC                                                                  ;94B183;
    ADC.W #$0004                                                         ;94B184;
    STA.W $0590                                                          ;94B187;
    RTS                                                                  ;94B18A;


InstList_DrawGrappleBeam_GrappleSegmentAnimations_0:
    dw $0005,$3A21                                                       ;94B18B;

InstList_DrawGrappleBeam_GrappleSegmentAnimations_1:
    dw $0005,$3A22                                                       ;94B18F;

InstList_DrawGrappleBeam_GrappleSegmentAnimations_2:
    dw $0005,$3A23                                                       ;94B193;

InstList_DrawGrappleBeam_GrappleSegmentAnimations_3:
    dw $0005,$3A24                                                       ;94B197;
    dw Instruction_DrawGrappleBeam_GotoY                                 ;94B19B;
    dw InstList_DrawGrappleBeam_GrappleSegmentAnimations_0               ;94B19D;


Freespace_Bank94_B19F:                                                   ;94B19F;
; $1661 bytes


warnpc $94C800
org $94C800

Tiles_GunshipLiftoffDustClouds:
incbin "../data/Tiles_GunshipLiftoffDustClouds.bin" ; $1400 bytes

Freespace_Bank94_DC00:                                                   ;94DC00;
; $1400 bytes


warnpc $94E000
; see bank_94..99.asm
