
; Block collision, grapple

org $948000


;;; $8000: Post grapple collision detection - horizontal - slope - non-square ;;;
PostGrappleCollisionDetection_Horizontal_Slope_NonSquare:
;; Parameters:
;;     X: Block index
;;     $20: Samus left/right boundary
;; Returns:
;;     Carry: Set if Samus collides with slope, clear otherwise
;;     A: If carry set, X depth into slope in pixels
    LDA.W CollisionMovementDirection                                     ;948000;
    LSR                                                                  ;948003;
    BCC .left                                                            ;948004;
    JMP.W .right                                                         ;948006;

  .left:
    LDA.W CurrentBlockIndex                                              ;948009;
    STA.W $4204                                                          ;94800C;
    SEP #$20                                                             ;94800F;
    LDA.W RoomWidthBlocks                                                ;948011;
    STA.W $4206                                                          ;948014;
    REP #$20                                                             ;948017;
    LDA.W SamusXPosition                                                 ;948019;
    LSR                                                                  ;94801C;
    LSR                                                                  ;94801D;
    LSR                                                                  ;94801E;
    LSR                                                                  ;94801F;
    CMP.W $4216                                                          ;948020;
    BEQ ..centerInBlock                                                  ;948023;
    CLC                                                                  ;948025;
    RTS                                                                  ;948026;

  ..centerInBlock:
    LDA.B DP_Temp20                                                      ;948027;
    AND.W #$000F                                                         ;948029;
    STA.W SamusLeftRightXOffset                                          ;94802C;
    LDA.L BTS,X                                                          ;94802F;
    AND.W #$001F                                                         ;948033;
    ASL                                                                  ;948036;
    ASL                                                                  ;948037;
    ASL                                                                  ;948038;
    ASL                                                                  ;948039;
    STA.W SlopeCollisionDefinitionTableBaseIndex                         ;94803A;
    LDA.L BTS-1,X                                                        ;94803D;
    ASL                                                                  ;948041;
    BPL ..gotoSolid                                                      ;948042;
    LDA.L BTS-1,X                                                        ;948044;
    BMI ..blockBTSMSB                                                    ;948048;
    LDA.W SamusYPosition                                                 ;94804A;
    BRA +                                                                ;94804D;

  ..blockBTSMSB:
    LDA.W SamusYPosition                                                 ;94804F;
    EOR.W #$000F                                                         ;948052;

+   AND.W #$000F                                                         ;948055;
    CLC                                                                  ;948058;
    ADC.W SlopeCollisionDefinitionTableBaseIndex                         ;948059;
    TAX                                                                  ;94805C;
    LDA.W SlopeDefinitions_SlopeLeftXOffsetByYPixel,X                    ;94805D;
    AND.W #$001F                                                         ;948060;
    SEC                                                                  ;948063;
    SBC.W SamusLeftRightXOffset                                          ;948064;
    DEC                                                                  ;948067;
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
    LDA.W CurrentBlockIndex                                              ;948073;
    STA.W $4204                                                          ;948076;
    SEP #$20                                                             ;948079;
    LDA.W RoomWidthBlocks                                                ;94807B;
    STA.W $4206                                                          ;94807E;
    REP #$20                                                             ;948081;
    LDA.W SamusXPosition                                                 ;948083;
    LSR                                                                  ;948086;
    LSR                                                                  ;948087;
    LSR                                                                  ;948088;
    LSR                                                                  ;948089;
    CMP.W $4216                                                          ;94808A;
    BEQ ..centerInBlock                                                  ;94808D;
    CLC                                                                  ;94808F;
    RTS                                                                  ;948090;

  ..centerInBlock:
    LDA.B DP_Temp20                                                      ;948091;
    AND.W #$000F                                                         ;948093;
    STA.W SamusLeftRightXOffset                                          ;948096;
    LDA.L BTS,X                                                          ;948099;
    AND.W #$001F                                                         ;94809D;
    ASL                                                                  ;9480A0;
    ASL                                                                  ;9480A1;
    ASL                                                                  ;9480A2;
    ASL                                                                  ;9480A3;
    STA.W SlopeCollisionDefinitionTableBaseIndex                         ;9480A4;
    LDA.L BTS-1,X                                                        ;9480A7;
    ASL                                                                  ;9480AB;
    BMI ..gotoSolid                                                      ;9480AC;
    LDA.L BTS-1,X                                                        ;9480AE;
    BMI ..blockBTSMSB                                                    ;9480B2;
    LDA.W SamusYPosition                                                 ;9480B4;
    BRA +                                                                ;9480B7;

  ..blockBTSMSB:
    LDA.W SamusYPosition                                                 ;9480B9;
    EOR.W #$000F                                                         ;9480BC;

+   AND.W #$000F                                                         ;9480BF;
    CLC                                                                  ;9480C2;
    ADC.W SlopeCollisionDefinitionTableBaseIndex                         ;9480C3;
    TAX                                                                  ;9480C6;
    LDA.W SlopeDefinitions_SlopeLeftXOffsetByYPixel,X                    ;9480C7;
    AND.W #$001F                                                         ;9480CA;
    SEC                                                                  ;9480CD;
    SBC.W SamusLeftRightXOffset                                          ;9480CE;
    DEC                                                                  ;9480D1;
    BEQ +                                                                ;9480D2;
    BPL ..returnCarryClear                                               ;9480D4;

+   EOR.W #$FFFF                                                         ;9480D6;
    SEC                                                                  ;9480D9;
    RTS                                                                  ;9480DA;

  ..returnCarryClear:
    CLC                                                                  ;9480DB;
    RTS                                                                  ;9480DC;

  ..gotoSolid:
    JMP.W PostGrappleCollisionDetection_Horizontal_Solid                 ;9480DD;


;;; $80E0: Post grapple collision detection - vertical - slope - non-square ;;;
PostGrappleCollisionDetection_Vertical_Slope_NonSquare:
;; Parameters:
;;     X: Block index
;;     $20: Samus bottom/top boundary
;; Returns:
;;     Carry: Set if Samus collides with slope, clear otherwise
;;     A: If carry set, Y depth into slope in pixels
    LDA.W CollisionMovementDirection                                     ;9480E0;
    LSR                                                                  ;9480E3;
    BCC .up                                                              ;9480E4;
    JMP.W .down                                                          ;9480E6;

  .up:
    LDA.W CurrentBlockIndex                                              ;9480E9;
    STA.W $4204                                                          ;9480EC;
    SEP #$20                                                             ;9480EF;
    LDA.W RoomWidthBlocks                                                ;9480F1;
    STA.W $4206                                                          ;9480F4;
    REP #$20                                                             ;9480F7;
    LDA.W SamusXPosition                                                 ;9480F9;
    LSR                                                                  ;9480FC;
    LSR                                                                  ;9480FD;
    LSR                                                                  ;9480FE;
    LSR                                                                  ;9480FF;
    CMP.W $4216                                                          ;948100;
    BEQ ..centerInBlock                                                  ;948103;
    CLC                                                                  ;948105;
    RTS                                                                  ;948106;

  ..centerInBlock:
    LDA.B DP_Temp20                                                      ;948107;
    AND.W #$000F                                                         ;948109;
    STA.W SamusBottomTopYOffset                                          ;94810C;
    LDA.L BTS,X                                                          ;94810F;
    AND.W #$001F                                                         ;948113;
    ASL                                                                  ;948116;
    ASL                                                                  ;948117;
    ASL                                                                  ;948118;
    ASL                                                                  ;948119;
    STA.W SlopeCollisionDefinitionTableBaseIndex                         ;94811A;
    LDA.L BTS-1,X                                                        ;94811D;
    BPL ..gotoSolid                                                      ;948121;
    ASL                                                                  ;948123;
    BMI ..blockBTS40                                                     ;948124;
    LDA.W SamusXPosition                                                 ;948126;
    BRA +                                                                ;948129;

  ..blockBTS40:
    LDA.W SamusXPosition                                                 ;94812B;
    EOR.W #$000F                                                         ;94812E;

+   AND.W #$000F                                                         ;948131;
    CLC                                                                  ;948134;
    ADC.W SlopeCollisionDefinitionTableBaseIndex                         ;948135;
    TAX                                                                  ;948138;
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X                     ;948139;
    AND.W #$001F                                                         ;94813C;
    SEC                                                                  ;94813F;
    SBC.W SamusBottomTopYOffset                                          ;948140;
    DEC                                                                  ;948143;
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
    LDA.W CurrentBlockIndex                                              ;94814F;
    STA.W $4204                                                          ;948152;
    SEP #$20                                                             ;948155;
    LDA.W RoomWidthBlocks                                                ;948157;
    STA.W $4206                                                          ;94815A;
    REP #$20                                                             ;94815D;
    LDA.W SamusXPosition                                                 ;94815F;
    LSR                                                                  ;948162;
    LSR                                                                  ;948163;
    LSR                                                                  ;948164;
    LSR                                                                  ;948165;
    CMP.W $4216                                                          ;948166;
    BEQ ..centerInBlock                                                  ;948169;
    CLC                                                                  ;94816B;
    RTS                                                                  ;94816C;

  ..centerInBlock:
    LDA.B DP_Temp20                                                      ;94816D;
    AND.W #$000F                                                         ;94816F;
    STA.W SamusBottomTopYOffset                                          ;948172;
    LDA.L BTS,X                                                          ;948175;
    AND.W #$001F                                                         ;948179;
    ASL                                                                  ;94817C;
    ASL                                                                  ;94817D;
    ASL                                                                  ;94817E;
    ASL                                                                  ;94817F;
    STA.W SlopeCollisionDefinitionTableBaseIndex                         ;948180;
    LDA.L BTS-1,X                                                        ;948183;
    BMI ..gotoSolid                                                      ;948187;
    ASL                                                                  ;948189;
    BMI ..blockBTS40                                                     ;94818A;
    LDA.W SamusXPosition                                                 ;94818C;
    BRA +                                                                ;94818F;

  ..blockBTS40:
    LDA.W SamusXPosition                                                 ;948191;
    EOR.W #$000F                                                         ;948194;

+   AND.W #$000F                                                         ;948197;
    CLC                                                                  ;94819A;
    ADC.W SlopeCollisionDefinitionTableBaseIndex                         ;94819B;
    TAX                                                                  ;94819E;
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X                     ;94819F;
    AND.W #$001F                                                         ;9481A2;
    SEC                                                                  ;9481A5;
    SBC.W SamusBottomTopYOffset                                          ;9481A6;
    DEC                                                                  ;9481A9;
    BEQ +                                                                ;9481AA;
    BPL ..returnCarryClear                                               ;9481AC;

+   EOR.W #$FFFF                                                         ;9481AE;
    SEC                                                                  ;9481B1;
    RTS                                                                  ;9481B2;

  ..returnCarryClear:
    CLC                                                                  ;9481B3;
    RTS                                                                  ;9481B4;

  ..gotoSolid:
    JMP.W PostGrappleCollisionDetection_Vertical_Solid                   ;9481B5;


;;; $81B8: Post grapple collision detection - horizontal - slope - square ;;;
PostGrappleCollisionDetection_Horizontal_Slope_Square:
;; Parameters:
;;     X: Block index
;;     $1A: Number of blocks left to check (0 if final (bottom) block)
;;     $1C: Samus' Y block span
;;     $20: Samus left/right boundary
;; Returns:
;;     Carry: Set if Samus collides with solid slope, clear otherwise
;;     A: If carry set, X depth into slope in pixels
    LDA.L BTS,X                                                          ;9481B8;
    AND.W #$001F                                                         ;9481BC;
    ASL                                                                  ;9481BF;
    ASL                                                                  ;9481C0;
    STA.W SolidSlopeDefinitionTableBaseIndex                             ;9481C1;
    LDA.L BTS-1,X                                                        ;9481C4;
    ROL                                                                  ;9481C8;
    ROL                                                                  ;9481C9;
    ROL                                                                  ;9481CA;
    AND.W #$0003                                                         ;9481CB;
    STA.W SlopeCollisionFlipFlags                                        ;9481CE;
    LDA.B DP_Temp20                                                      ;9481D1;
    AND.W #$0008                                                         ;9481D3;
    LSR                                                                  ;9481D6;
    LSR                                                                  ;9481D7;
    LSR                                                                  ;9481D8;
    EOR.W SlopeCollisionFlipFlags                                        ;9481D9;
    ADC.W SolidSlopeDefinitionTableBaseIndex                             ;9481DC;
    TAX                                                                  ;9481DF;
    LDA.B DP_Temp1A                                                      ;9481E0;
    BNE .top                                                             ;9481E2;
    LDA.W SamusYPosition                                                 ;9481E4;
    CLC                                                                  ;9481E7;
    ADC.W SamusYRadius                                                   ;9481E8;
    DEC                                                                  ;9481EB;
    AND.W #$0008                                                         ;9481EC;
    BNE .checkBothHalves                                                 ;9481EF;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;9481F1;
    BMI .solid                                                           ;9481F4;
    BRA .noCollision                                                     ;9481F6;

  .top:
    CMP.B DP_Temp1C                                                      ;9481F8;
    BNE .checkBothHalves                                                 ;9481FA;
    LDA.W SamusYPosition                                                 ;9481FC;
    SEC                                                                  ;9481FF;
    SBC.W SamusYRadius                                                   ;948200;
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
    LDA.W CollisionMovementDirection                                     ;948219;
    LSR                                                                  ;94821C;
    BCC .left                                                            ;94821D;
    LDA.B DP_Temp20                                                      ;94821F;
    AND.W #$0007                                                         ;948221;
    SEC                                                                  ;948224;
    RTS                                                                  ;948225;

  .left:
    LDA.B DP_Temp20                                                      ;948226;
    AND.W #$0007                                                         ;948228;
    EOR.W #$0007                                                         ;94822B;
    SEC                                                                  ;94822E;
    RTS                                                                  ;94822F;


;;; $8230: Post grapple collision detection - vertical - slope - square ;;;
PostGrappleCollisionDetection_Vertical_Slope_Square:
;; Parameters:
;;     X: Block index
;;     $1A: Number of blocks left to check (0 if final (rightmost) block)
;;     $1C: Samus' X block span
;;     $20: Samus bottom/top boundary
;; Returns:
;;     Carry: Set if Samus collides with solid slope, clear otherwise
;;     A: If carry set, Y depth into slope in pixels
    LDA.L BTS,X                                                          ;948230;
    AND.W #$001F                                                         ;948234;
    ASL                                                                  ;948237;
    ASL                                                                  ;948238;
    STA.W SolidSlopeDefinitionTableBaseIndex                             ;948239;
    LDA.L BTS-1,X                                                        ;94823C;
    ROL                                                                  ;948240;
    ROL                                                                  ;948241;
    ROL                                                                  ;948242;
    AND.W #$0003                                                         ;948243;
    STA.W SlopeCollisionFlipFlags                                        ;948246;
    LDA.B DP_Temp20                                                      ;948249;
    AND.W #$0008                                                         ;94824B;
    LSR                                                                  ;94824E;
    LSR                                                                  ;94824F;
    EOR.W SlopeCollisionFlipFlags                                        ;948250;
    ADC.W SolidSlopeDefinitionTableBaseIndex                             ;948253;
    TAX                                                                  ;948256;
    LDA.B DP_Temp1A                                                      ;948257;
    BNE .leftmostBlock                                                   ;948259;
    LDA.W SamusXPosition                                                 ;94825B;
    CLC                                                                  ;94825E;
    ADC.W SamusXRadius                                                   ;94825F;
    DEC                                                                  ;948262;
    AND.W #$0008                                                         ;948263;
    BNE .checkBothHalves                                                 ;948266;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;948268;
    BMI .solid                                                           ;94826B;
    BRA .returnNoCollision                                               ;94826D;

  .leftmostBlock:
    CMP.B DP_Temp1C                                                      ;94826F;
    BNE .checkBothHalves                                                 ;948271;
    LDA.W SamusXPosition                                                 ;948273;
    SEC                                                                  ;948276;
    SBC.W SamusXRadius                                                   ;948277;
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
    LDA.W CollisionMovementDirection                                     ;948290;
    LSR                                                                  ;948293;
    BCC .up                                                              ;948294;
    LDA.B DP_Temp20                                                      ;948296;
    AND.W #$0007                                                         ;948298;
    SEC                                                                  ;94829B;
    RTS                                                                  ;94829C;

  .up:
    LDA.B DP_Temp20                                                      ;94829D;
    AND.W #$0007                                                         ;94829F;
    EOR.W #$0007                                                         ;9482A2;
    SEC                                                                  ;9482A5;
    RTS                                                                  ;9482A6;


;;; $82A7: Clear carry ;;;
CLCRTS_9482A7:
    CLC                                                                  ;9482A7;
    RTS                                                                  ;9482A8;


;;; $82A9: Post grapple collision detection - horizontal - slope ;;;
PostGrappleCollisionDetection_Horizontal_Slope:
;; Parameters:
;;     $1A: Number of blocks left to check (0 if final (bottom) block)
;;     $1C: Samus' Y block span
;;     $20: Samus left/right boundary
;; Returns:
;;     Carry: Set if Samus collides with slope, clear otherwise
;;     A: If carry set, X depth into slope in pixels
    LDX.W CurrentBlockIndex                                              ;9482A9;
    LDA.L BTS,X                                                          ;9482AC;
    AND.W #$001F                                                         ;9482B0;
    CMP.W #$0005                                                         ;9482B3;
    BCC .gotoSquare                                                      ;9482B6;
    JMP.W PostGrappleCollisionDetection_Horizontal_Slope_NonSquare       ;9482B8;

  .gotoSquare:
    JMP.W PostGrappleCollisionDetection_Horizontal_Slope_Square          ;9482BB;


;;; $82BE: Post grapple collision detection - horizontal - solid ;;;
PostGrappleCollisionDetection_Horizontal_Solid:
;; Parameters:
;;     $20: Samus left/right boundary
;; Returns:
;;     Carry: Set (Samus collides with block)
;;     A: X depth into block in pixels
    LDA.B DP_Temp20                                                      ;9482BE;
    AND.W #$000F                                                         ;9482C0;
    SEC                                                                  ;9482C3;
    RTS                                                                  ;9482C4;


;;; $82C5: Post grapple collision detection - vertical - slope ;;;
PostGrappleCollisionDetection_Vertical_Slope:
;; Parameters:
;;     $1A: Number of blocks left to check (0 if final (rightmost) block)
;;     $1C: Samus' X block span
;;     $20: Samus bottom/top boundary
;; Returns:
;;     Carry: Set if Samus collides with slope, clear otherwise
;;     A: If carry set, Y depth into slope in pixels
    LDX.W CurrentBlockIndex                                              ;9482C5;
    LDA.L BTS,X                                                          ;9482C8;
    AND.W #$001F                                                         ;9482CC;
    CMP.W #$0005                                                         ;9482CF;
    BCC .gotoSquare                                                      ;9482D2;
    JMP.W PostGrappleCollisionDetection_Vertical_Slope_NonSquare         ;9482D4;

  .gotoSquare:
    JMP.W PostGrappleCollisionDetection_Vertical_Slope_Square            ;9482D7;


;;; $82DA: Post grapple collision detection - vertical - solid ;;;
PostGrappleCollisionDetection_Vertical_Solid:
;; Parameters:
;;     $20: Samus bottom/top boundary
;; Returns:
;;     Carry: Set (Samus collides with block)
;;     A: Y depth into block in pixels
    LDA.B DP_Temp20                                                      ;9482DA;
    AND.W #$000F                                                         ;9482DC;
    SEC                                                                  ;9482DF;
    RTS                                                                  ;9482E0;


;;; $82E1: Post grapple collision detection - horizontal - jump table ;;;
PostGrappleCollisionDetection_Horizontal_JumpTable:
    dw CLCRTS_9482A7                                                     ;9482E1;  0: Air
    dw PostGrappleCollisionDetection_Horizontal_Slope                    ;9482E3; *1: Slope
    dw CLCRTS_9482A7                                                     ;9482E5;  2: Spike air
    dw CLCRTS_9482A7                                                     ;9482E7;  3: Special air
    dw CLCRTS_9482A7                                                     ;9482E9;  4: Shootable air
    dw CLCRTS_9482A7                                                     ;9482EB;  5: Horizontal extension
    dw CLCRTS_9482A7                                                     ;9482ED;  6: Unused air
    dw CLCRTS_9482A7                                                     ;9482EF;  7: Bombable air
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;9482F1;  8: Solid block
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;9482F3;  9: Door block
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;9482F5;  Ah: Spike block
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;9482F7;  Bh: Special block
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;9482F9;  Ch: Shootable block
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;9482FB;  Dh: Vertical extension
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;9482FD;  Eh: Grapple block
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;9482FF;  Fh: Bombable block


;;; $8301: Post grapple collision detection - vertical - jump table ;;;
PostGrappleCollisionDetection_Vertical_JumpTable:
    dw CLCRTS_9482A7                                                     ;948301;  0: Air
    dw PostGrappleCollisionDetection_Vertical_Slope                      ;948303; *1: Slope
    dw CLCRTS_9482A7                                                     ;948305;  2: Spike air
    dw CLCRTS_9482A7                                                     ;948307;  3: Special air
    dw CLCRTS_9482A7                                                     ;948309;  4: Shootable air
    dw CLCRTS_9482A7                                                     ;94830B;  5: Horizontal extension
    dw CLCRTS_9482A7                                                     ;94830D;  6: Unused air
    dw CLCRTS_9482A7                                                     ;94830F;  7: Bombable air
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;948311;  8: Solid block
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;948313;  9: Door block
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;948315;  Ah: Spike block
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;948317;  Bh: Special block
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;948319;  Ch: Shootable block
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;94831B;  Dh: Vertical extension
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;94831D;  Eh: Grapple block
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;94831F;  Fh: Bombable block


;;; $8321: Post grapple collision detection - horizontal - single block ;;;
PostGrappleCollisionDetection_Horizontal_SingleBlock:
;; Parameters:
;;     X: Block index
;;     $1A: Number of blocks left to check (0 if final (bottom) block)
;;     $1C: Samus Y block span
;;     $20: Samus left/right boundary
;; Returns:
;;     Carry: Set if Samus collides with block, clear otherwise
;;     A: If carry set, X depth into block in pixels
    PHX                                                                  ;948321;
    TXA                                                                  ;948322;
    LSR                                                                  ;948323;
    STA.W CurrentBlockIndex                                              ;948324;
    LDA.L LevelData,X                                                    ;948327;
    AND.W #$F000                                                         ;94832B;
    XBA                                                                  ;94832E;
    LSR                                                                  ;94832F;
    LSR                                                                  ;948330;
    LSR                                                                  ;948331;
    TAX                                                                  ;948332;
    JSR.W (PostGrappleCollisionDetection_Horizontal_JumpTable,X)         ;948333;
    PLX                                                                  ;948336;
    RTS                                                                  ;948337;


;;; $8338: Post grapple collision detection - vertical - single block ;;;
PostGrappleCollisionDetection_Vertical_SingleBlock:
;; Parameters:
;;     X: Block index
;;     $1A: Number of blocks left to check (0 if final (rightmost) block)
;;     $1C: Samus' X block span
;;     $20: Samus bottom/top boundary
;; Returns:
;;     Carry: Set if Samus collides with block, clear otherwise
;;     A: If carry set, Y depth into block in pixels
    PHX                                                                  ;948338;
    TXA                                                                  ;948339;
    LSR                                                                  ;94833A;
    STA.W CurrentBlockIndex                                              ;94833B;
    LDA.L LevelData,X                                                    ;94833E;
    AND.W #$F000                                                         ;948342;
    XBA                                                                  ;948345;
    LSR                                                                  ;948346;
    LSR                                                                  ;948347;
    LSR                                                                  ;948348;
    TAX                                                                  ;948349;
    JSR.W (PostGrappleCollisionDetection_Vertical_JumpTable,X)           ;94834A;
    PLX                                                                  ;94834D;
    RTS                                                                  ;94834E;


;;; $834F: Post grapple collision detection - rightwards ;;;
PostGrappleCollisionDetection_Rightwards:
    PHB                                                                  ;94834F;
    PHK                                                                  ;948350;
    PLB                                                                  ;948351;
    LDA.W #$0001                                                         ;948352;
    STA.W CollisionMovementDirection                                     ;948355;
    STZ.W DistanceToEjectSamusLeftDueToPostGrappleCollision              ;948358;
    JSR.W CalculateSamusYBlockSpan                                       ;94835B;
    LDA.W SamusYPosition                                                 ;94835E;
    SEC                                                                  ;948361;
    SBC.W SamusYRadius                                                   ;948362;
    LSR                                                                  ;948365;
    LSR                                                                  ;948366;
    LSR                                                                  ;948367;
    LSR                                                                  ;948368;
    SEP #$20                                                             ;948369;
    STA.W $4202                                                          ;94836B;
    LDA.W RoomWidthBlocks                                                ;94836E;
    STA.W $4203                                                          ;948371;
    REP #$20                                                             ;948374;
    LDA.W SamusXSubPosition                                              ;948376;
    STA.B DP_Temp16                                                      ;948379;
    LDA.W SamusXPosition                                                 ;94837B;
    STA.B DP_Temp18                                                      ;94837E;
    CLC                                                                  ;948380;
    ADC.W SamusXRadius                                                   ;948381;
    DEC                                                                  ;948384;
    STA.B DP_Temp20                                                      ;948385;
    LSR                                                                  ;948387;
    LSR                                                                  ;948388;
    LSR                                                                  ;948389;
    LSR                                                                  ;94838A;
    CLC                                                                  ;94838B;
    ADC.W $4216                                                          ;94838C;
    STA.W CurrentBlockIndex                                              ;94838F;
    ASL                                                                  ;948392;
    TAX                                                                  ;948393;

  .loop:
    JSR.W PostGrappleCollisionDetection_Horizontal_SingleBlock           ;948394;
    BCC .noCollision                                                     ;948397;
    INC                                                                  ;948399;
    CMP.W DistanceToEjectSamusLeftDueToPostGrappleCollision              ;94839A;
    BCC .noCollision                                                     ;94839D;
    STA.W DistanceToEjectSamusLeftDueToPostGrappleCollision                                                          ;94839F;

  .noCollision:
    TXA                                                                  ;9483A2;
    CLC                                                                  ;9483A3;
    ADC.W RoomWidthBlocks                                                ;9483A4;
    ADC.W RoomWidthBlocks                                                ;9483A7;
    TAX                                                                  ;9483AA;
    DEC.B DP_Temp1A                                                      ;9483AB;
    BPL .loop                                                            ;9483AD;
    PLB                                                                  ;9483AF;
    RTS                                                                  ;9483B0;


;;; $83B1: Post grapple collision detection - leftwards ;;;
PostGrappleCollisionDetection_Leftwards:
    PHB                                                                  ;9483B1;
    PHK                                                                  ;9483B2;
    PLB                                                                  ;9483B3;
    STZ.W CollisionMovementDirection                                     ;9483B4;
    STZ.W DistanceToEjectSamusRightDueToPostGrappleCollision             ;9483B7;
    JSR.W CalculateSamusYBlockSpan                                       ;9483BA;
    LDA.W SamusYPosition                                                 ;9483BD;
    SEC                                                                  ;9483C0;
    SBC.W SamusYRadius                                                   ;9483C1;
    LSR                                                                  ;9483C4;
    LSR                                                                  ;9483C5;
    LSR                                                                  ;9483C6;
    LSR                                                                  ;9483C7;
    SEP #$20                                                             ;9483C8;
    STA.W $4202                                                          ;9483CA;
    LDA.W RoomWidthBlocks                                                ;9483CD;
    STA.W $4203                                                          ;9483D0;
    REP #$20                                                             ;9483D3;
    LDA.W SamusXSubPosition                                              ;9483D5;
    STA.B DP_Temp16                                                      ;9483D8;
    LDA.W SamusXPosition                                                 ;9483DA;
    STA.B DP_Temp18                                                      ;9483DD;
    SEC                                                                  ;9483DF;
    SBC.W SamusXRadius                                                   ;9483E0;
    STA.B DP_Temp20                                                      ;9483E3;
    LSR                                                                  ;9483E5;
    LSR                                                                  ;9483E6;
    LSR                                                                  ;9483E7;
    LSR                                                                  ;9483E8;
    CLC                                                                  ;9483E9;
    ADC.W $4216                                                          ;9483EA;
    STA.W CurrentBlockIndex                                              ;9483ED;
    ASL                                                                  ;9483F0;
    TAX                                                                  ;9483F1;

  .loop:
    JSR.W PostGrappleCollisionDetection_Horizontal_SingleBlock           ;9483F2;
    BCC .noCollision                                                     ;9483F5;
    INC                                                                  ;9483F7;
    CMP.W DistanceToEjectSamusRightDueToPostGrappleCollision             ;9483F8;
    BCC .noCollision                                                     ;9483FB;
    STA.W DistanceToEjectSamusRightDueToPostGrappleCollision             ;9483FD;

  .noCollision:
    TXA                                                                  ;948400;
    CLC                                                                  ;948401;
    ADC.W RoomWidthBlocks                                                ;948402;
    ADC.W RoomWidthBlocks                                                ;948405;
    TAX                                                                  ;948408;
    DEC.B DP_Temp1A                                                      ;948409;
    BPL .loop                                                            ;94840B;
    PLB                                                                  ;94840D;
    RTS                                                                  ;94840E;


;;; $840F: Post grapple collision detection - downwards ;;;
PostGrappleCollisionDetection_Downwards:
    PHB                                                                  ;94840F;
    PHK                                                                  ;948410;
    PLB                                                                  ;948411;
    LDA.W #$0003                                                         ;948412;
    STA.W CollisionMovementDirection                                     ;948415;
    STZ.W DistanceToEjectSamusUpDueToPostGrappleCollision                ;948418;
    JSR.W CalculateSamusXBlockSpan                                       ;94841B;
    LDA.W SamusYSubPosition                                              ;94841E;
    STA.B DP_Temp16                                                      ;948421;
    LDA.W SamusYPosition                                                 ;948423;
    STA.B DP_Temp18                                                      ;948426;
    CLC                                                                  ;948428;
    ADC.W SamusYRadius                                                   ;948429;
    DEC                                                                  ;94842C;
    STA.B DP_Temp20                                                      ;94842D;
    LSR                                                                  ;94842F;
    LSR                                                                  ;948430;
    LSR                                                                  ;948431;
    LSR                                                                  ;948432;
    SEP #$20                                                             ;948433;
    STA.W $4202                                                          ;948435;
    LDA.W RoomWidthBlocks                                                ;948438;
    STA.W $4203                                                          ;94843B;
    REP #$20                                                             ;94843E;
    LDA.W SamusXPosition                                                 ;948440;
    SEC                                                                  ;948443;
    SBC.W SamusXRadius                                                   ;948444;
    LSR                                                                  ;948447;
    LSR                                                                  ;948448;
    LSR                                                                  ;948449;
    LSR                                                                  ;94844A;
    CLC                                                                  ;94844B;
    ADC.W $4216                                                          ;94844C;
    STA.W CurrentBlockIndex                                              ;94844F;
    ASL                                                                  ;948452;
    TAX                                                                  ;948453;

  .loop:
    JSR.W PostGrappleCollisionDetection_Vertical_SingleBlock             ;948454;
    BCC .nocollision                                                     ;948457;
    INC                                                                  ;948459;
    CMP.W DistanceToEjectSamusUpDueToPostGrappleCollision                ;94845A;
    BCC .nocollision                                                     ;94845D;
    STA.W DistanceToEjectSamusUpDueToPostGrappleCollision                ;94845F;

  .nocollision:
    INX                                                                  ;948462;
    INX                                                                  ;948463;
    DEC.B DP_Temp1A                                                      ;948464;
    BPL .loop                                                            ;948466;
    PLB                                                                  ;948468;
    RTS                                                                  ;948469;


;;; $846A: Post grapple collision detection - upwards ;;;
PostGrappleCollisionDetection_Upwards:
    PHB                                                                  ;94846A;
    PHK                                                                  ;94846B;
    PLB                                                                  ;94846C;
    LDA.W #$0002                                                         ;94846D;
    STA.W CollisionMovementDirection                                     ;948470;
    STZ.W DistanceToEjectSamusDownDueToPostGrappleCollision              ;948473;
    JSR.W CalculateSamusXBlockSpan                                       ;948476;
    LDA.W SamusYSubPosition                                              ;948479;
    STA.B DP_Temp16                                                      ;94847C;
    LDA.W SamusYPosition                                                 ;94847E;
    STA.B DP_Temp18                                                      ;948481;
    SEC                                                                  ;948483;
    SBC.W SamusYRadius                                                   ;948484;
    STA.B DP_Temp20                                                      ;948487;
    LSR                                                                  ;948489;
    LSR                                                                  ;94848A;
    LSR                                                                  ;94848B;
    LSR                                                                  ;94848C;
    SEP #$20                                                             ;94848D;
    STA.W $4202                                                          ;94848F;
    LDA.W RoomWidthBlocks                                                ;948492;
    STA.W $4203                                                          ;948495;
    REP #$20                                                             ;948498;
    LDA.W SamusXPosition                                                 ;94849A;
    SEC                                                                  ;94849D;
    SBC.W SamusXRadius                                                   ;94849E;
    LSR                                                                  ;9484A1;
    LSR                                                                  ;9484A2;
    LSR                                                                  ;9484A3;
    LSR                                                                  ;9484A4;
    CLC                                                                  ;9484A5;
    ADC.W $4216                                                          ;9484A6;
    STA.W CurrentBlockIndex                                              ;9484A9;
    ASL                                                                  ;9484AC;
    TAX                                                                  ;9484AD;

  .loop:
    JSR.W PostGrappleCollisionDetection_Vertical_SingleBlock             ;9484AE;
    BCC .noCollision                                                     ;9484B1;
    INC                                                                  ;9484B3;
    CMP.W DistanceToEjectSamusDownDueToPostGrappleCollision              ;9484B4;
    BCC .noCollision                                                     ;9484B7;
    STA.W DistanceToEjectSamusDownDueToPostGrappleCollision              ;9484B9;

  .noCollision:
    INX                                                                  ;9484BC;
    INX                                                                  ;9484BD;
    DEC.B DP_Temp1A                                                      ;9484BE;
    BPL .loop                                                            ;9484C0;
    PLB                                                                  ;9484C2;
    RTS                                                                  ;9484C3;


;;; $84C4: Post grapple collision detection - horizontal ;;;
PostGrappleCollisionDetection_Horizontal:
; Called by PostGrappleCollisionDetection
; This routine is used to calculate $0E04/06 (distance to eject Samus left/right), which is never read,
; making this routine and all its subroutines entirely pointless
    PHP                                                                  ;9484C4;
    JSR.W PostGrappleCollisionDetection_Rightwards                       ;9484C5;
    JSR.W PostGrappleCollisionDetection_Leftwards                        ;9484C8;
    PLP                                                                  ;9484CB;
    RTL                                                                  ;9484CC;


;;; $84CD: Post grapple collision detection - vertical ;;;
PostGrappleCollisionDetection_Vertical:
; Called by PostGrappleCollisionDetection, sometimes twice (if Samus was ejected up and her hitbox is >= 10h pixels tall)
    PHP                                                                  ;9484CD;
    JSR.W PostGrappleCollisionDetection_Downwards                        ;9484CE;
    JSR.W PostGrappleCollisionDetection_Upwards                          ;9484D1;
    PLP                                                                  ;9484D4;
    RTL                                                                  ;9484D5;


;;; $84D6: Samus block collision reaction - horizontal - slope - non-square ;;;
SamusBlockCollisionDetection_Horizontal_Slope_NonSquare:
;; Parameters:
;;     $12.$14: Distance to check for collision
;; Returns:
;;     Carry: Clear (no collision)
;;     $12.$14: Adjusted distance to move Samus
    LDA.W CurrentSlopeBTS                                                ;9484D6;
    BIT.W #$0080                                                         ;9484D9;
    BNE .returnNoCollision                                               ;9484DC;
    LDA.W SamusYSubSpeed                                                 ;9484DE;
    ORA.W SamusYSpeed                                                    ;9484E1;
    BEQ .SamusOnSlopeSurface                                             ;9484E4;

  .returnNoCollision:
    CLC                                                                  ;9484E6;
    RTS                                                                  ;9484E7;

  .SamusOnSlopeSurface:
    LDA.W CurrentSlopeBTS                                                ;9484E8;
    AND.W #$001F                                                         ;9484EB;
    ASL                                                                  ;9484EE;
    ASL                                                                  ;9484EF;
    TAX                                                                  ;9484F0;
    LDA.B DP_Temp12                                                      ;9484F1;
    BPL .right                                                           ;9484F3;
    LDA.W SamusXBaseSubSpeed                                             ;9484F5;
    ORA.W SamusXBaseSpeed                                                ;9484F8;
    BEQ .backToReality                                                   ;9484FB;
    LDA.W CurrentSlopeBTS                                                ;9484FD;
    BIT.W #$0040                                                         ;948500;
    BNE +                                                                ;948503;
    LDA.W SamusXBaseSubSpeed                                             ;948505;
    CLC                                                                  ;948508;
    ADC.W .speedModifiers,X                                              ;948509;
    BCC .backToReality                                                   ;94850C;
    BRA .backToReality                                                   ;94850E;

+   LDA.W SamusXBaseSubSpeed                                             ;948510;
    SEC                                                                  ;948513;
    SBC.W .speedModifiers,X                                              ;948514;
    BCS .backToReality                                                   ;948517; >.<

  .backToReality:
    SEP #$20                                                             ;948519;
    LDA.B DP_Temp12                                                      ;94851B;
    XBA                                                                  ;94851D;
    LDA.B DP_Temp15                                                      ;94851E;
    REP #$20                                                             ;948520;
    EOR.W #$FFFF                                                         ;948522;
    INC                                                                  ;948525;
    LDY.W .adjustedDistanceMultiplier,X                                  ;948526;
    JSL.L A_Y_16bit_UnsignedMultiplication                               ;948529;
    LDA.W MultiplicationResult                                           ;94852D;
    EOR.W #$FFFF                                                         ;948530;
    CLC                                                                  ;948533;
    ADC.W #$0001                                                         ;948534;
    STA.B DP_Temp14                                                      ;948537;
    LDA.W MultiplicationResult+2                                         ;948539;
    EOR.W #$FFFF                                                         ;94853C;
    ADC.W #$0000                                                         ;94853F;
    STA.B DP_Temp12                                                      ;948542;
    CLC                                                                  ;948544;
    RTS                                                                  ;948545;

  .right:
    LDA.W SamusXBaseSubSpeed                                             ;948546;
    ORA.W SamusXBaseSpeed                                                ;948549;
    BEQ ..backToReality                                                  ;94854C;
    LDA.W CurrentSlopeBTS                                                ;94854E;
    BIT.W #$0040                                                         ;948551;
    BEQ +                                                                ;948554;
    LDA.W SamusXBaseSubSpeed                                             ;948556;
    CLC                                                                  ;948559;
    ADC.W .speedModifiers,X                                              ;94855A;
    BCC ..backToReality                                                  ;94855D;
    BRA ..backToReality                                                  ;94855F;

+   LDA.W SamusXBaseSubSpeed                                             ;948561;
    SEC                                                                  ;948564;
    SBC.W .speedModifiers,X                                              ;948565;
    BCS ..backToReality                                                  ;948568;

  ..backToReality:
    SEP #$20                                                             ;94856A;
    LDA.B DP_Temp12                                                      ;94856C;
    XBA                                                                  ;94856E;
    LDA.B DP_Temp15                                                      ;94856F;
    REP #$20                                                             ;948571;
    LDY.W .adjustedDistanceMultiplier,X                                  ;948573;
    JSL.L A_Y_16bit_UnsignedMultiplication                               ;948576;
    LDA.W MultiplicationResult                                           ;94857A;
    STA.B DP_Temp14                                                      ;94857D;
    LDA.W MultiplicationResult+2                                         ;94857F;
    STA.B DP_Temp12                                                      ;948582;
    CLC                                                                  ;948584;
    RTS                                                                  ;948585;

;        _________ Unused. Seem to be speed modifiers, added to or subtracted from Samus X base subspeed when moving down or up the slope respectively
;       |      ___ Adjusted distance multiplier * 100h
;       |     |
  .speedModifiers:
    dw $0000                                                             ;948586;
  .adjustedDistanceMultiplier:
    dw       $0100                                                       ;948588;
    dw $0000,$0100
    dw $0000,$0100
    dw $0000,$0100
    dw $0000,$0100
    dw $0000,$0100 ; 5: Unused. Half height isosceles triangle
    dw $0000,$0100 ; 6: Unused. Isosceles triangle
    dw $0000,$0100 ; 7: Half height rectangle
    dw $0000,$0100 ; 8: Unused. Rectangle
    dw $0000,$0100 ; 9: Unused. Rectangle
    dw $0000,$0100 ; Ah: Unused. Rectangle
    dw $0000,$0100 ; Bh: Unused. Rectangle
    dw $0000,$0100 ; Ch: Unused. Rectangle
    dw $0000,$0100 ; Dh: Unused. Rectangle
    dw $1000,$00B0 ; Eh: Unused. Very bumpy triangle
    dw $1000,$00B0 ; Fh: Bumpy triangle
    dw $0000,$0100 ; 10h: Unused
    dw $0000,$0100 ; 11h: Unused
    dw $1000,$00C0 ; 12h: Triangle
    dw $0000,$0100 ; 13h: Rectangle
    dw $1000,$00C0 ; 14h: Quarter triangle
    dw $1000,$00C0 ; 15h: Three quarter triangle
    dw $0800,$00D8 ; 16h: Lower half-height triangle
    dw $0800,$00D8 ; 17h: Upper half-height triangle
    dw $0600,$00F0 ; 18h: Unused. Lower third-height triangle
    dw $0600,$00F0 ; 19h: Unused. Middle third-height triangle
    dw $0600,$00F0 ; 1Ah: Unused. Upper third-height triangle
    dw $4000,$0080 ; 1Bh: Upper half-width triangle
    dw $4000,$0080 ; 1Ch: Lower half-width triangle
    dw $6000,$0050 ; 1Dh: Unused. Upper third-width triangle
    dw $6000,$0050 ; 1Eh: Unused. Middle third-width triangle
    dw $6000,$0050 ; 1Fh: Unused. Lower third-width triangle


if !FEATURE_KEEP_UNREFERENCED
;;; $8606: Unused ;;;
UNUSED_948606:
;; Parameters:
;;     X: Block index
;;     $12: Distance to check for collision
;;     $18: Target X position
;; Returns:
;;     Carry: Set if Samus collides with solid slope, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision

; This resembles $8000 adapted for block collision, or $86FE adapted for horizontal collision
; I guess this was written before it was decided that non-square slopes shouldn't have solid horizontal collision
; Looking at $86FE, I assume there's supposed to be a collision direction check here to branch to BRANCH_RIGHT
    LDA.W CurrentBlockIndex                                              ;948606;
    STA.W $4204                                                          ;948609;
    SEP #$20                                                             ;94860C;
    LDA.W RoomWidthBlocks                                                ;94860E;
    STA.W $4206                                                          ;948611;
    REP #$20                                                             ;948614;
    LDA.W SamusXPosition                                                 ;948616;
    LSR                                                                  ;948619;
    LSR                                                                  ;94861A;
    LSR                                                                  ;94861B;
    LSR                                                                  ;94861C;
    CMP.W $4216                                                          ;94861D;
    BEQ .centerInBlock                                                   ;948620;
    CLC                                                                  ;948622;
    RTS                                                                  ;948623;

  .centerInBlock:
    LDA.B DP_Temp18                                                      ;948624;
    SEC                                                                  ;948626;
    SBC.W SamusXRadius                                                   ;948627;
    AND.W #$000F                                                         ;94862A;
    EOR.W #$000F                                                         ;94862D;
    STA.W TargetLeftRightYOffset                                         ;948630;
    LDA.L BTS,X                                                          ;948633;
    AND.W #$001F                                                         ;948637;
    ASL                                                                  ;94863A;
    ASL                                                                  ;94863B;
    ASL                                                                  ;94863C;
    ASL                                                                  ;94863D;
    STA.W SlopeCollisionDefinitionTableBaseIndex                         ;94863E;
    LDA.L BTS-1,X                                                        ;948641;
    ASL                                                                  ;948645;
    BPL .gotoSolidShootableGrapple                                       ;948646;
    LDA.L BTS-1,X                                                        ;948648;
    BMI .blockBTSMSB                                                     ;94864C;
    LDA.W SamusYPosition                                                 ;94864E;
    BRA +                                                                ;948651;

  .blockBTSMSB:
    LDA.W SamusYPosition                                                 ;948653;
    EOR.W #$000F                                                         ;948656;

+   AND.W #$000F                                                         ;948659;
    CLC                                                                  ;94865C;
    ADC.W SlopeCollisionDefinitionTableBaseIndex                         ;94865D;
    TAX                                                                  ;948660;
    LDA.W SlopeDefinitions_SlopeLeftXOffsetByYPixel,X                    ;948661;
    AND.W #$001F                                                         ;948664;
    SEC                                                                  ;948667;
    SBC.W TargetLeftRightYOffset                                         ;948668;
    DEC                                                                  ;94866B;
    BEQ +                                                                ;94866C;
    BPL ..returnNoCollision                                              ;94866E;

+   CLC                                                                  ;948670;
    ADC.B DP_Temp12                                                      ;948671;
    BPL +                                                                ;948673;
    LDA.W #$0000                                                         ;948675;

+   STA.B DP_Temp12                                                      ;948678;
    STZ.B DP_Temp14                                                      ;94867A;
    SEC                                                                  ;94867C;
    RTS                                                                  ;94867D;

  ..returnNoCollision:
    CLC                                                                  ;94867E;
    RTS                                                                  ;94867F;

  .gotoSolidShootableGrapple:
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple   ;948680;

  .right:
    LDA.W CurrentBlockIndex                                              ;948683;
    STA.W $4204                                                          ;948686;
    SEP #$20                                                             ;948689;
    LDA.W RoomWidthBlocks                                                ;94868B;
    STA.W $4206                                                          ;94868E;
    REP #$20                                                             ;948691;
    LDA.W SamusXPosition                                                 ;948693;
    LSR                                                                  ;948696;
    LSR                                                                  ;948697;
    LSR                                                                  ;948698;
    LSR                                                                  ;948699;
    CMP.W $4216                                                          ;94869A;
    BEQ ..centerInBlock                                                  ;94869D;
    CLC                                                                  ;94869F;
    RTS                                                                  ;9486A0;

  ..centerInBlock:
    LDA.B DP_Temp18                                                      ;9486A1;
    CLC                                                                  ;9486A3;
    ADC.W SamusXRadius                                                   ;9486A4;
    DEC                                                                  ;9486A7;
    AND.W #$000F                                                         ;9486A8;
    STA.W TargetLeftRightYOffset                                         ;9486AB;
    LDA.L BTS,X                                                          ;9486AE;
    AND.W #$001F                                                         ;9486B2;
    ASL                                                                  ;9486B5;
    ASL                                                                  ;9486B6;
    ASL                                                                  ;9486B7;
    ASL                                                                  ;9486B8;
    STA.W SlopeCollisionDefinitionTableBaseIndex                         ;9486B9;
    LDA.L BTS-1,X                                                        ;9486BC;
    ASL                                                                  ;9486C0;
    BMI ..gotoSolidShootableGrapple                                      ;9486C1;
    LDA.L BTS-1,X                                                        ;9486C3;
    BMI ..blockBTSMSB                                                    ;9486C7;
    LDA.W SamusYPosition                                                 ;9486C9;
    BRA +                                                                ;9486CC;

  ..blockBTSMSB:
    LDA.W SamusYPosition                                                 ;9486CE;
    EOR.W #$000F                                                         ;9486D1;

+   AND.W #$000F                                                         ;9486D4;
    CLC                                                                  ;9486D7;
    ADC.W SlopeCollisionDefinitionTableBaseIndex                         ;9486D8;
    TAX                                                                  ;9486DB;
    LDA.W SlopeDefinitions_SlopeLeftXOffsetByYPixel,X                    ;9486DC;
    AND.W #$001F                                                         ;9486DF;
    SEC                                                                  ;9486E2;
    SBC.W TargetLeftRightYOffset                                         ;9486E3;
    DEC                                                                  ;9486E6;
    BEQ +                                                                ;9486E7;
    BPL ..returnNoCollision                                              ;9486E9;

+   CLC                                                                  ;9486EB;
    ADC.B DP_Temp12                                                      ;9486EC;
    BPL +                                                                ;9486EE;
    LDA.W #$0000                                                         ;9486F0;

+   STA.B DP_Temp12                                                      ;9486F3;
    STZ.B DP_Temp14                                                      ;9486F5;
    SEC                                                                  ;9486F7;
    RTS                                                                  ;9486F8;

  ..returnNoCollision:
    CLC                                                                  ;9486F9;
    RTS                                                                  ;9486FA;

  ..gotoSolidShootableGrapple:
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple   ;9486FB;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $86FE: Samus block collision reaction - vertical - slope - non-square ;;;
SamusBlockCollisionReaction_Vertical_Slope_NonSquare:
;; Parameters:
;;     X: Block index
;;     $12: Distance to check for collision
;;     $18: Target Y position
;; Returns:
;;     Carry: Set if Samus collides with solid slope, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    LDA.W CollisionMovementDirection                                     ;9486FE;
    LSR                                                                  ;948701;
    BCC .up                                                              ;948702;
    JMP.W .down                                                          ;948704;

  .up:
    LDA.W CurrentBlockIndex                                              ;948707;
    STA.W $4204                                                          ;94870A;
    SEP #$20                                                             ;94870D;
    LDA.W RoomWidthBlocks                                                ;94870F;
    STA.W $4206                                                          ;948712;
    REP #$20                                                             ;948715;
    LDA.W SamusXPosition                                                 ;948717;
    LSR                                                                  ;94871A;
    LSR                                                                  ;94871B;
    LSR                                                                  ;94871C;
    LSR                                                                  ;94871D;
    CMP.W $4216                                                          ;94871E;
    BEQ ..centerInBlock                                                  ;948721;
    CLC                                                                  ;948723;
    RTS                                                                  ;948724;

  ..centerInBlock:
    LDA.B DP_Temp18                                                      ;948725;
    SEC                                                                  ;948727;
    SBC.W SamusYRadius                                                   ;948728;
    AND.W #$000F                                                         ;94872B;
    EOR.W #$000F                                                         ;94872E;
    STA.W TargetBottomTopYOffset                                         ;948731;
    LDA.L BTS,X                                                          ;948734;
    AND.W #$001F                                                         ;948738;
    ASL                                                                  ;94873B;
    ASL                                                                  ;94873C;
    ASL                                                                  ;94873D;
    ASL                                                                  ;94873E;
    STA.W SlopeCollisionDefinitionTableBaseIndex                         ;94873F;
    LDA.L BTS-1,X                                                        ;948742;
    BPL ..gotoReturnNoCollision                                          ;948746;
    ASL                                                                  ;948748;
    BMI ..blockBTS40                                                     ;948749;
    LDA.W SamusXPosition                                                 ;94874B;
    BRA +                                                                ;94874E;

  ..blockBTS40:
    LDA.W SamusXPosition                                                 ;948750;
    EOR.W #$000F                                                         ;948753;

+   AND.W #$000F                                                         ;948756;
    CLC                                                                  ;948759;
    ADC.W SlopeCollisionDefinitionTableBaseIndex                         ;94875A;
    TAX                                                                  ;94875D;
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X                     ;94875E;
    AND.W #$001F                                                         ;948761;
    SEC                                                                  ;948764;
    SBC.W TargetBottomTopYOffset                                         ;948765;
    DEC                                                                  ;948768;
    BEQ +                                                                ;948769;
    BPL ..returnNoCollision                                              ;94876B;

+   CLC                                                                  ;94876D;
    ADC.B DP_Temp12                                                      ;94876E;
    BPL +                                                                ;948770;
    LDA.W #$0000                                                         ;948772;

+   STA.B DP_Temp12                                                      ;948775;
    STZ.B DP_Temp14                                                      ;948777;
    SEC                                                                  ;948779;
    RTS                                                                  ;94877A;

  ..returnNoCollision:
    CLC                                                                  ;94877B;
    RTS                                                                  ;94877C;

  ..gotoReturnNoCollision:
    JMP.W ..returnNoCollision                                            ;94877D; >.<

  .down:
    LDA.W CurrentBlockIndex                                              ;948780;
    STA.W $4204                                                          ;948783;
    SEP #$20                                                             ;948786;
    LDA.W RoomWidthBlocks                                                ;948788;
    STA.W $4206                                                          ;94878B;
    REP #$20                                                             ;94878E;
    LDA.W SamusXPosition                                                 ;948790;
    LSR                                                                  ;948793;
    LSR                                                                  ;948794;
    LSR                                                                  ;948795;
    LSR                                                                  ;948796;
    CMP.W $4216                                                          ;948797;
    BEQ ..centerInBlock                                                  ;94879A;
    CLC                                                                  ;94879C;
    RTS                                                                  ;94879D;

  ..centerInBlock:
    LDA.B DP_Temp18                                                      ;94879E;
    CLC                                                                  ;9487A0;
    ADC.W SamusYRadius                                                   ;9487A1;
    DEC                                                                  ;9487A4;
    AND.W #$000F                                                         ;9487A5;
    STA.W TargetBottomTopYOffset                                         ;9487A8;
    LDA.L BTS,X                                                          ;9487AB;
    AND.W #$001F                                                         ;9487AF;
    ASL                                                                  ;9487B2;
    ASL                                                                  ;9487B3;
    ASL                                                                  ;9487B4;
    ASL                                                                  ;9487B5;
    STA.W SlopeCollisionDefinitionTableBaseIndex                         ;9487B6;
    LDA.L BTS-1,X                                                        ;9487B9;
    BMI ..returnNoCollision                                              ;9487BD;
    ASL                                                                  ;9487BF;
    BMI ..blockBTS40                                                     ;9487C0;
    LDA.W SamusXPosition                                                 ;9487C2;
    BRA +                                                                ;9487C5;

  ..blockBTS40:
    LDA.W SamusXPosition                                                 ;9487C7;
    EOR.W #$000F                                                         ;9487CA;

+   AND.W #$000F                                                         ;9487CD;
    CLC                                                                  ;9487D0;
    ADC.W SlopeCollisionDefinitionTableBaseIndex                         ;9487D1;
    TAX                                                                  ;9487D4;
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X                     ;9487D5;
    AND.W #$001F                                                         ;9487D8;
    SEC                                                                  ;9487DB;
    SBC.W TargetBottomTopYOffset                                         ;9487DC;
    DEC                                                                  ;9487DF;
    BEQ +                                                                ;9487E0;
    BPL ..returnNoCollision                                              ;9487E2;

+   CLC                                                                  ;9487E4;
    ADC.B DP_Temp12                                                      ;9487E5;
    BPL +                                                                ;9487E7;
    LDA.W #$0000                                                         ;9487E9;

+   STA.B DP_Temp12                                                      ;9487EC;
    STZ.B DP_Temp14                                                      ;9487EE;
    SEC                                                                  ;9487F0;
    RTS                                                                  ;9487F1;

  ..returnNoCollision:
    CLC                                                                  ;9487F2;
    RTS                                                                  ;9487F3;


;;; $87F4: Align Samus Y position with non-square slope ;;;
Align_SamusYPosition_WithNonSquareSlope:
    PHB                                                                  ;9487F4;
    PHK                                                                  ;9487F5;
    PLB                                                                  ;9487F6;
    LDA.W HorizontalSlopeCollision                                       ;9487F7;
    BIT.W #$0002                                                         ;9487FA;
    BNE .bottom                                                          ;9487FD;
    JMP.W .return                                                        ;9487FF;

  .bottom:
    LDA.W SamusXPosition                                                 ;948802;
    STA.B DP_Temp1A                                                      ;948805;
    LDA.W SamusYPosition                                                 ;948807;
    CLC                                                                  ;94880A;
    ADC.W SamusYRadius                                                   ;94880B;
    DEC                                                                  ;94880E;
    STA.B DP_Temp1C                                                      ;94880F;
    STZ.B DP_Temp1E                                                      ;948811;
    STZ.B DP_Temp20                                                      ;948813;
    JSR.W CalculateBlockAt_12_1E_1C_20                                   ;948815;
    LDA.W CurrentBlockIndex                                              ;948818;
    ASL                                                                  ;94881B;
    TAX                                                                  ;94881C;
    LDA.L LevelData,X                                                    ;94881D;
    AND.W #$F000                                                         ;948821;
    CMP.W #$1000                                                         ;948824;
    BNE .SamusTopCheck                                                   ;948827;
    LDX.W CurrentBlockIndex                                              ;948829;
    LDA.L BTS,X                                                          ;94882C;
    AND.W #$001F                                                         ;948830;
    CMP.W #$0005                                                         ;948833;
    BCC .SamusTopCheck                                                   ;948836;
    LDA.W SamusYPosition                                                 ;948838;
    CLC                                                                  ;94883B;
    ADC.W SamusYRadius                                                   ;94883C;
    DEC                                                                  ;94883F;
    AND.W #$000F                                                         ;948840;
    STA.W TargetBottomTopYOffset                                         ;948843;
    LDA.L BTS,X                                                          ;948846;
    AND.W #$001F                                                         ;94884A;
    ASL                                                                  ;94884D;
    ASL                                                                  ;94884E;
    ASL                                                                  ;94884F;
    ASL                                                                  ;948850;
    STA.W SlopeCollisionDefinitionTableBaseIndex                         ;948851;
    LDA.L BTS-1,X                                                        ;948854;
    BMI .SamusTopCheck                                                   ;948858;
    ASL                                                                  ;94885A;
    BMI ..blockBTS40                                                     ;94885B;
    LDA.W SamusXPosition                                                 ;94885D;
    BRA +                                                                ;948860;

  ..blockBTS40:
    LDA.W SamusXPosition                                                 ;948862;
    EOR.W #$000F                                                         ;948865;

+   AND.W #$000F                                                         ;948868;
    CLC                                                                  ;94886B;
    ADC.W SlopeCollisionDefinitionTableBaseIndex                         ;94886C;
    TAX                                                                  ;94886F;
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X                     ;948870;
    AND.W #$001F                                                         ;948873;
    SEC                                                                  ;948876;
    SBC.W YDistanceIntoSlope                                             ;948877;
    DEC                                                                  ;94887A;
    BPL .SamusTopCheck                                                   ;94887B;
    CLC                                                                  ;94887D;
    ADC.W SamusYPosition                                                 ;94887E;
    STA.W SamusYPosition                                                 ;948881;
    LDA.W #$0001                                                         ;948884;
    STA.W SamusPositionAdjustedBySlopeFlag                               ;948887;

  .SamusTopCheck:
    LDA.W SamusXPosition                                                 ;94888A;
    STA.B DP_Temp1A                                                      ;94888D;
    LDA.W SamusYPosition                                                 ;94888F;
    SEC                                                                  ;948892;
    SBC.W SamusYRadius                                                   ;948893;
    STA.B DP_Temp1C                                                      ;948896;
    STZ.B DP_Temp1E                                                      ;948898;
    STZ.B DP_Temp20                                                      ;94889A;
    JSR.W CalculateBlockAt_12_1E_1C_20                                   ;94889C;
    LDA.W CurrentBlockIndex                                              ;94889F;
    ASL                                                                  ;9488A2;
    TAX                                                                  ;9488A3;
    LDA.L LevelData,X                                                    ;9488A4;
    AND.W #$F000                                                         ;9488A8;
    CMP.W #$1000                                                         ;9488AB;
    BNE .return                                                          ;9488AE;
    LDX.W CurrentBlockIndex                                              ;9488B0;
    LDA.L BTS,X                                                          ;9488B3;
    AND.W #$001F                                                         ;9488B7;
    CMP.W #$0005                                                         ;9488BA;
    BCC .return                                                          ;9488BD;
    LDA.W SamusYPosition                                                 ;9488BF;
    SEC                                                                  ;9488C2;
    SBC.W SamusYRadius                                                   ;9488C3;
    AND.W #$000F                                                         ;9488C6;
    EOR.W #$000F                                                         ;9488C9;
    STA.W YDistanceIntoSlope                                             ;9488CC;
    LDA.L BTS,X                                                          ;9488CF;
    AND.W #$001F                                                         ;9488D3;
    ASL                                                                  ;9488D6;
    ASL                                                                  ;9488D7;
    ASL                                                                  ;9488D8;
    ASL                                                                  ;9488D9;
    STA.W SlopeCollisionDefinitionTableBaseIndex                         ;9488DA;
    LDA.L BTS-1,X                                                        ;9488DD;
    BPL .return                                                          ;9488E1;
    ASL                                                                  ;9488E3;
    BMI ..blockBTS40                                                     ;9488E4;
    LDA.W SamusXPosition                                                 ;9488E6;
    BRA +                                                                ;9488E9;

  ..blockBTS40:
    LDA.W SamusXPosition                                                 ;9488EB;
    EOR.W #$000F                                                         ;9488EE;

+   AND.W #$000F                                                         ;9488F1;
    CLC                                                                  ;9488F4;
    ADC.W SlopeCollisionDefinitionTableBaseIndex                         ;9488F5;
    TAX                                                                  ;9488F8;
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X                     ;9488F9;
    AND.W #$001F                                                         ;9488FC;
    SEC                                                                  ;9488FF;
    SBC.W YDistanceIntoSlope                                             ;948900;
    DEC                                                                  ;948903;
    BEQ +                                                                ;948904;
    BPL .return                                                          ;948906;

+   EOR.W #$FFFF                                                         ;948908;
    INC                                                                  ;94890B;
    CLC                                                                  ;94890C;
    ADC.W SamusYPosition                                                 ;94890D;
    STA.W SamusYPosition                                                 ;948910;
    LDA.W #$0001                                                         ;948913;
    STA.W SamusPositionAdjustedBySlopeFlag                               ;948916;

  .return:
    PLB                                                                  ;948919;
    RTL                                                                  ;94891A;


if !FEATURE_KEEP_UNREFERENCED
;;; $891B: Unused slope definition ;;;
UNUSED_SlopeDefinitions_94891B:
    db $0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01,$00   ;94891B;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $892B: Slope definitions (slope left X offset by Y pixel) ;;;
SlopeDefinitions_SlopeLeftXOffsetByYPixel:
; ALMOST unused, used only by post-grapple collision detection (which has no effect), but referenced by some unused code too
; Data here looks incorrect, many of the rows here are identical to SlopeDefinitions_SlopeTopXOffsetByYPixel
; Indexed by ([block BTS] & 1Fh) * 10h + [Samus Y position] % 10h
    db $10,$10,$10,$10,$10,$10,$10,$10,$00,$00,$00,$00,$00,$00,$00,$00   ;94892B;
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08   ;94893B;
    db $10,$10,$10,$10,$10,$10,$10,$10,$08,$08,$08,$08,$08,$08,$08,$08   ;94894B;
    db $08,$08,$08,$08,$08,$08,$08,$08,$00,$00,$00,$00,$00,$00,$00,$00   ;94895B;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;94896B;
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$09,$0A,$0B,$0C,$0D,$0E,$0F,$10   ;94897B; 5: Unused. Half height isosceles triangl
    db $10,$0E,$0C,$0A,$08,$06,$04,$02,$02,$04,$06,$08,$0A,$0C,$0E,$10   ;94898B; 6: Unused. Isosceles triangle
    db $10,$10,$10,$10,$10,$10,$10,$10,$00,$00,$00,$00,$00,$00,$00,$00   ;94899B; 7: Half height rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;9489AB; 8: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;9489BB; 9: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;9489CB; Ah: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;9489DB; Bh: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;9489EB; Ch: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;9489FB; Dh: Unused. Rectangle
    db $0C,$0C,$0C,$0C,$08,$08,$08,$08,$04,$04,$04,$04,$00,$00,$00,$00   ;948A0B; Eh: Unused. Very bumpy triangle
    db $0E,$0E,$0C,$0C,$0A,$0A,$08,$08,$06,$06,$04,$04,$02,$02,$00,$00   ;948A1B; Fh: Bumpy triangle
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10   ;948A2B; 10h: Unused
    db $14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$10,$10,$10   ;948A3B; 11h: Unused
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01   ;948A4B; 12h: Triangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948A5B; 13h: Rectangle
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$0F,$0E,$0D,$0C,$0B,$0A,$09   ;948A6B; 14h: Quarter triangle
    db $08,$07,$06,$05,$04,$03,$02,$01,$00,$00,$00,$00,$00,$00,$00,$00   ;948A7B; 15h: Three quarter triangle
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$0E,$0C,$0A,$08,$06,$04,$02   ;948A8B; 16h: Lower half-height triangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$04,$06,$08,$0A,$0C,$0E   ;948A9B; 17h: Upper half-height triangle
    db $10,$10,$10,$0F,$0F,$0F,$0E,$0E,$0E,$0D,$0D,$0D,$0C,$0C,$0C,$0B   ;948AAB; 18h: Unused. Lower third-height triangle
    db $0B,$0B,$0A,$0A,$0A,$09,$09,$09,$08,$08,$08,$07,$07,$07,$06,$06   ;948ABB; 19h: Unused. Middle third-height triangl
    db $06,$05,$05,$05,$04,$04,$04,$03,$03,$03,$02,$02,$02,$01,$01,$01   ;948ACB; 1Ah: Unused. Upper third-height triangle
    db $14,$14,$14,$14,$14,$14,$14,$14,$10,$0E,$0C,$0A,$08,$06,$04,$02   ;948ADB; 1Bh: Upper half-width triangle
    db $10,$0E,$0C,$0A,$08,$06,$04,$02,$00,$00,$00,$00,$00,$00,$00,$00   ;948AEB; 1Ch: Lower half-width triangle
    db $14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$0F,$0C,$09,$06,$03   ;948AFB; 1Dh: Unused. Upper third-width triangle
    db $14,$14,$14,$14,$14,$14,$0E,$0B,$08,$05,$02,$00,$00,$00,$00,$00   ;948B0B; 1Eh: Unused. Middle third-width triangle
    db $10,$0D,$0A,$07,$04,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948B1B; 1Fh: Unused. Lower third-width triangle


;;; $8B2B: Slope definitions (slope top Y offset by X pixel) ;;;
SlopeDefinitions_SlopeTopXOffsetByYPixel:
; Indexed by ([block BTS] & 1Fh) * 10h + [Samus X position] % 10h
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08   ;948B2B;
    db $10,$10,$10,$10,$10,$10,$10,$10,$00,$00,$00,$00,$00,$00,$00,$00   ;948B3B;
    db $10,$10,$10,$10,$10,$10,$10,$10,$08,$08,$08,$08,$08,$08,$08,$08   ;948B4B;
    db $08,$08,$08,$08,$08,$08,$08,$08,$00,$00,$00,$00,$00,$00,$00,$00   ;948B5B;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948B6B;
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$09,$0A,$0B,$0C,$0D,$0E,$0F,$10   ;948B7B; 5: Unused. Half height isosceles triangle
    db $10,$0E,$0C,$0A,$08,$06,$04,$02,$02,$04,$06,$08,$0A,$0C,$0E,$10   ;948B8B; 6: Unused. Isosceles triangle
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08   ;948B9B; 7: Half height rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948BAB; 8: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948BBB; 9: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948BCB; Ah: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948BDB; Bh: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948BEB; Ch: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948BFB; Dh: Unused. Rectangle
    db $0C,$0C,$0C,$0C,$08,$08,$08,$08,$04,$04,$04,$04,$00,$00,$00,$00   ;948C0B; Eh: Unused. Very bumpy triangle
    db $0E,$0E,$0C,$0C,$0A,$0A,$08,$08,$06,$06,$04,$04,$02,$02,$00,$00   ;948C1B; Fh: Bumpy triangle
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10   ;948C2B; 10h: Unused
    db $14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$10,$10,$10   ;948C3B; 11h: Unused
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01   ;948C4B; 12h: Triangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948C5B; 13h: Rectangle
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$0F,$0E,$0D,$0C,$0B,$0A,$09   ;948C6B; 14h: Quarter triangle
    db $08,$07,$06,$05,$04,$03,$02,$01,$00,$00,$00,$00,$00,$00,$00,$00   ;948C7B; 15h: Three quarter triangle
    db $10,$10,$0F,$0F,$0E,$0E,$0D,$0D,$0C,$0C,$0B,$0B,$0A,$0A,$09,$09   ;948C8B; 16h: Lower half-height triangle
    db $08,$08,$07,$07,$06,$06,$05,$05,$04,$04,$03,$03,$02,$02,$01,$01   ;948C9B; 17h: Upper half-height triangle
    db $10,$10,$10,$0F,$0F,$0F,$0E,$0E,$0E,$0D,$0D,$0D,$0C,$0C,$0C,$0B   ;948CAB; 18h: Unused. Lower third-height triangle
    db $0B,$0B,$0A,$0A,$0A,$09,$09,$09,$08,$08,$08,$07,$07,$07,$06,$06   ;948CBB; 19h: Unused. Middle third-height triangle
    db $06,$05,$05,$05,$04,$04,$04,$03,$03,$03,$02,$02,$02,$01,$01,$01   ;948CCB; 1Ah: Unused. Upper third-height triangle
    db $14,$14,$14,$14,$14,$14,$14,$14,$10,$0E,$0C,$0A,$08,$06,$04,$02   ;948CDB; 1Bh: Upper half-width triangle
    db $10,$0E,$0C,$0A,$08,$06,$04,$02,$00,$00,$00,$00,$00,$00,$00,$00   ;948CEB; 1Ch: Lower half-width triangle
    db $14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$0F,$0C,$09,$06,$03   ;948CFB; 1Dh: Unused. Upper third-width triangle
    db $14,$14,$14,$14,$14,$14,$0E,$0B,$08,$05,$02,$00,$00,$00,$00,$00   ;948D0B; 1Eh: Unused. Middle third-width triangle
    db $10,$0D,$0A,$07,$04,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;948D1B; 1Fh: Unused. Lower third-width triangle


;;; $8D2B: Samus block collision reaction - horizontal - slope - square ;;;
SamusBlockCollisionReaction_Horizontal_Slope_Square:
;; Parameters:
;;     A: [Block BTS] & 1Fh
;;     X: Block index
;;     $12.$14: Distance to check for collision
;;     $1A: Number of blocks left to check (0 if final (bottom) block)
;;     $1C: Samus' Y block span
;;     $20: Target boundary position (left/right depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    ASL                                                                  ;948D2B;
    ASL                                                                  ;948D2C;
    STA.W SolidSlopeDefinitionTableBaseIndex                             ;948D2D;
    LDA.L BTS-1,X                                                        ;948D30;
    ROL                                                                  ;948D34;
    ROL                                                                  ;948D35;
    ROL                                                                  ;948D36;
    AND.W #$0003                                                         ;948D37;
    STA.W SlopeCollisionFlipFlags                                        ;948D3A;
    LDA.B DP_Temp20                                                      ;948D3D;
    AND.W #$0008                                                         ;948D3F;
    LSR                                                                  ;948D42;
    LSR                                                                  ;948D43;
    LSR                                                                  ;948D44;
    EOR.W SlopeCollisionFlipFlags                                        ;948D45;
    ADC.W SolidSlopeDefinitionTableBaseIndex                             ;948D48;
    TAX                                                                  ;948D4B;
    LDA.B DP_Temp1A                                                      ;948D4C;
    BNE .top                                                             ;948D4E;
    LDA.W SamusYPosition                                                 ;948D50;
    CLC                                                                  ;948D53;
    ADC.W SamusYRadius                                                   ;948D54;
    DEC                                                                  ;948D57;
    AND.W #$0008                                                         ;948D58;
    BNE .checkBothHalves                                                 ;948D5B;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;948D5D;
    BMI .solid                                                           ;948D60;
    BRA .returnNoCollision                                               ;948D62;

  .top:
    CMP.B DP_Temp1C                                                      ;948D64;
    BNE .checkBothHalves                                                 ;948D66;
    LDA.W SamusYPosition                                                 ;948D68;
    SEC                                                                  ;948D6B;
    SBC.W SamusYRadius                                                   ;948D6C;
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
    STZ.B DP_Temp14                                                      ;948D85;
    LDA.B DP_Temp20                                                      ;948D87;
    BIT.B DP_Temp12                                                      ;948D89;
    BMI .negative12                                                      ;948D8B;
    AND.W #$FFF8                                                         ;948D8D;
    SEC                                                                  ;948D90;
    SBC.W SamusXRadius                                                   ;948D91;
    SBC.W SamusXPosition                                                 ;948D94;
    BPL .notMinimum                                                      ;948D97;
    LDA.W #$0000                                                         ;948D99;

  .notMinimum:
    STA.B DP_Temp12                                                      ;948D9C;
    LDA.W #$FFFF                                                         ;948D9E;
    STA.W SamusXSubPosition                                              ;948DA1;
    SEC                                                                  ;948DA4;
    RTS                                                                  ;948DA5;

  .negative12:
    ORA.W #$0007                                                         ;948DA6;
    SEC                                                                  ;948DA9;
    ADC.W SamusXRadius                                                   ;948DAA;
    SEC                                                                  ;948DAD;
    SBC.W SamusXPosition                                                 ;948DAE;
    BMI .notMin                                                          ;948DB1;
    LDA.W #$0000                                                         ;948DB3;

  .notMin:
    STA.B DP_Temp12                                                      ;948DB6;
    STZ.W SamusXSubPosition                                              ;948DB8;
    SEC                                                                  ;948DBB;
    RTS                                                                  ;948DBC;


;;; $8DBD: Samus block collision reaction - vertical - slope - square ;;;
SamusBlockCollisionReaction_Vertical_Slope_Square:
;; Parameters:
;;     A: [Block BTS] & 1Fh
;;     X: Block index
;;     $12: Distance to check for collision
;;     $1A: Number of blocks left to check (0 if final (rightmost) block)
;;     $1C: Samus' X block span
;;     $20: Target boundary position (top/bottom depending on sign of [$12])
;; Returns:
;;     Carry: Set if Samus collides with solid slope, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    ASL                                                                  ;948DBD;
    ASL                                                                  ;948DBE;
    STA.W SolidSlopeDefinitionTableBaseIndex                             ;948DBF;
    LDA.L BTS-1,X                                                        ;948DC2;
    ROL                                                                  ;948DC6;
    ROL                                                                  ;948DC7;
    ROL                                                                  ;948DC8;
    AND.W #$0003                                                         ;948DC9;
    STA.W SlopeCollisionFlipFlags                                        ;948DCC;
    LDA.B DP_Temp20                                                      ;948DCF;
    AND.W #$0008                                                         ;948DD1;
    LSR                                                                  ;948DD4;
    LSR                                                                  ;948DD5;
    EOR.W SlopeCollisionFlipFlags                                        ;948DD6;
    ADC.W SolidSlopeDefinitionTableBaseIndex                             ;948DD9;
    TAX                                                                  ;948DDC;
    LDA.B DP_Temp1A                                                      ;948DDD;
    BNE .checkLeft                                                       ;948DDF;
    LDA.W SamusXPosition                                                 ;948DE1;
    CLC                                                                  ;948DE4;
    ADC.W SamusXRadius                                                   ;948DE5;
    DEC                                                                  ;948DE8;
    AND.W #$0008                                                         ;948DE9;
    BNE .checkBothHalves                                                 ;948DEC;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;948DEE;
    BMI .solid                                                           ;948DF1;
    BRA .returnNoCollision                                               ;948DF3;

  .checkLeft:
    CMP.B DP_Temp1C                                                      ;948DF5;
    BNE .checkBothHalves                                                 ;948DF7;
    LDA.W SamusXPosition                                                 ;948DF9;
    SEC                                                                  ;948DFC;
    SBC.W SamusXRadius                                                   ;948DFD;
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
    STZ.B DP_Temp14                                                      ;948E16;
    LDA.B DP_Temp20                                                      ;948E18;
    BIT.B DP_Temp12                                                      ;948E1A;
    BMI .negative12                                                      ;948E1C;
    AND.W #$FFF8                                                         ;948E1E;
    SEC                                                                  ;948E21;
    SBC.W SamusYRadius                                                   ;948E22;
    SBC.W SamusYPosition                                                 ;948E25;
    BPL .notMin                                                          ;948E28;
    LDA.W #$0000                                                         ;948E2A;

  .notMin:
    STA.B DP_Temp12                                                      ;948E2D;
    LDA.W #$FFFF                                                         ;948E2F;
    STA.W SamusYSubPosition                                              ;948E32;
    LDA.W #$0001                                                         ;948E35;
    STA.W SamusPositionAdjustedBySlopeFlag                               ;948E38;
    SEC                                                                  ;948E3B;
    RTS                                                                  ;948E3C;

  .negative12:
    ORA.W #$0007                                                         ;948E3D;
    SEC                                                                  ;948E40;
    ADC.W SamusYRadius                                                   ;948E41;
    SEC                                                                  ;948E44;
    SBC.W SamusYPosition                                                 ;948E45;
    BMI .notMinimum                                                      ;948E48;
    LDA.W #$0000                                                         ;948E4A;

  .notMinimum:
    STA.B DP_Temp12                                                      ;948E4D;
    STZ.W SamusYSubPosition                                              ;948E4F;
    SEC                                                                  ;948E52;
    RTS                                                                  ;948E53;


;;; $8E54: Square slope definitions ;;;
SquareSlopeDefinitions_Bank94:                                           ;948E54;
; Enemies use $A0:C435, enemy projectiles use $86:8729
; 0 = air, 80h = solid
;        _____________ Top-left
;       |    _________ Top-right
;       |   |    _____ Bottom-left
;       |   |   |    _ Bottom-right
;       |   |   |   |
    db $00,$00,$80,$80 ; 0: Half height
    db $00,$80,$00,$80 ; 1: Half width
    db $00,$00,$00,$80 ; 2: Quarter
    db $00,$80,$80,$80 ; 3: Three-quarters
    db $80,$80,$80,$80 ; 4: Whole


if !FEATURE_KEEP_UNREFERENCED
;;; $8E68: Unused. Determine Samus suit palette index ;;;
UNUSED_DetermineSamusSuitPaletteIndex_948E68:
;; Returns:
;;     Y: 4 if gravity suit equipped, 2 if varia suit equipped, 0 otherwise

; Basing this routine name on Determine_SamusSuitPalette_Index
    LDY.W #$0004                                                         ;948E68;
    LDA.W EquippedItems                                                  ;948E6B;
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
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8E7D: Unused. Clear carry ;;;
CLCRTS_948E7D:
    CLC                                                                  ;948E7D;
    RTS                                                                  ;948E7E;


;;; $8E7F: Unused. Clear carry ;;;
CLCRTS_948E7F:
    CLC                                                                  ;948E7F;
    RTS                                                                  ;948E80;


;;; $8E81: Clear carry ;;;
CLCRTS_948E81:
    CLC                                                                  ;948E81;
    RTS                                                                  ;948E82;


;;; $8E83: Samus block collision reaction - spike block - BTS 0 (generic spike) ;;;
SamusBlockCollisionReaction_SpikeBlock_BTS0_GenericSpike:
    LDA.W AreaIndex                                                      ;948E83;
    CMP.W #$0003                                                         ;948E86;
    BNE .notWreckedShip                                                  ;948E89;
    LDA.W #$0001                                                         ;948E8B;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;948E8E;
    BCC .return                                                          ;948E92;

  .notWreckedShip:
    LDA.W SamusInvincibilityTimer                                        ;948E94;
    BNE .return                                                          ;948E97;
    LDA.W #$003C                                                         ;948E99;
    STA.W SamusInvincibilityTimer                                        ;948E9C;
    LDA.W #$000A                                                         ;948E9F;
    STA.W SamusKnockbackTimer                                            ;948EA2;
    LDA.W PeriodicSubDamage                                              ;948EA5;
    CLC                                                                  ;948EA8; >.<
    ADC.W #$0000                                                         ;948EA9;
    STA.W PeriodicSubDamage                                              ;948EAC;
    LDA.W PeriodicDamage                                                 ;948EAF;
    ADC.W #$003C                                                         ;948EB2;
    STA.W PeriodicDamage                                                 ;948EB5;
    LDA.W PoseXDirection                                                 ;948EB8;
    EOR.W #$000C                                                         ;948EBB;
    BIT.W #$0008                                                         ;948EBE;
    BEQ .facingRight                                                     ;948EC1;
    LDA.W #$0001                                                         ;948EC3;
    STA.W KnockbackXDirection                                            ;948EC6;
    BRA .return                                                          ;948EC9;

  .facingRight:
    STZ.W KnockbackXDirection                                            ;948ECB;

  .return:
    RTS                                                                  ;948ECE;


;;; $8ECF: Samus block collision reaction - spike block - BTS 1 (Kraid's lair spike) ;;;
SamusBlockCollisionReaction_SpikeBlock_BTS1_KraidsLairSpike:
    LDA.W SamusInvincibilityTimer                                        ;948ECF;
    BNE .return                                                          ;948ED2;
    LDA.W #$003C                                                         ;948ED4;
    STA.W SamusInvincibilityTimer                                        ;948ED7;
    LDA.W #$000A                                                         ;948EDA;
    STA.W SamusKnockbackTimer                                            ;948EDD;
    LDA.W PeriodicSubDamage                                              ;948EE0;
    CLC                                                                  ;948EE3; >.<
    ADC.W #$0000                                                         ;948EE4;
    STA.W PeriodicSubDamage                                              ;948EE7;
    LDA.W PeriodicDamage                                                 ;948EEA;
    ADC.W #$0010                                                         ;948EED;
    STA.W PeriodicDamage                                                 ;948EF0;
    LDA.W PoseXDirection                                                 ;948EF3;
    EOR.W #$000C                                                         ;948EF6;
    BIT.W #$0008                                                         ;948EF9;
    BEQ .facingRight                                                     ;948EFC;
    LDA.W #$0001                                                         ;948EFE;
    STA.W KnockbackXDirection                                            ;948F01;
    BRA .return                                                          ;948F04;


  .facingRight:
    STZ.W KnockbackXDirection                                            ;948F06;

  .return:
    RTS                                                                  ;948F09;


;;; $8F0A: Samus block collision reaction - spike block - BTS 3 (Draygon's broken turret) ;;;
SamusBlockCollisionReact_SpikeBlock_BTS3_DraygonBrokenTurret:
; Clone of SamusBlockCollisionReaction_SpikeBlock_BTS1_KraidsLairSpike
    LDA.W SamusInvincibilityTimer                                        ;948F0A;
    BNE .return                                                          ;948F0D;
    LDA.W #$003C                                                         ;948F0F;
    STA.W SamusInvincibilityTimer                                        ;948F12;
    LDA.W #$000A                                                         ;948F15;
    STA.W SamusKnockbackTimer                                            ;948F18;
    LDA.W PeriodicSubDamage                                              ;948F1B;
    CLC                                                                  ;948F1E; >.<
    ADC.W #$0000                                                         ;948F1F;
    STA.W PeriodicSubDamage                                              ;948F22;
    LDA.W PeriodicDamage                                                 ;948F25;
    ADC.W #$0010                                                         ;948F28;
    STA.W PeriodicDamage                                                 ;948F2B;
    LDA.W PoseXDirection                                                 ;948F2E;
    EOR.W #$000C                                                         ;948F31;
    BIT.W #$0008                                                         ;948F34;
    BEQ .left                                                            ;948F37;
    LDA.W #$0001                                                         ;948F39;
    STA.W KnockbackXDirection                                            ;948F3C;
    BRA .return                                                          ;948F3F;

  .left:
    STZ.W KnockbackXDirection                                            ;948F41;

  .return:
    RTS                                                                  ;948F44;


;;; $8F45: Set carry ;;;
SECRTS_948F45:
    SEC                                                                  ;948F45;
    RTS                                                                  ;948F46;


;;; $8F47: Clear carry ;;;
CLCRTS_948F47:
    CLC                                                                  ;948F47;
    RTS                                                                  ;948F48;


;;; $8F49: Samus block collision reaction - horizontal - solid/shootable/grapple block ;;;
SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple:
;; Parameters:
;;     $12: Distance to check for collision
;;     $20: Target boundary position (left/right depending on sign of [$12])
;; Returns:
;;     Carry: Set. Unconditional collision
;;     $12.$14: Distance to collision

; RTS this routine to enable walk through walls, works surprisingly effectively
    STZ.B DP_Temp14                                                      ;948F49;
    LDA.B DP_Temp20                                                      ;948F4B;
    BIT.B DP_Temp12                                                      ;948F4D;
    BMI .negative12                                                      ;948F4F;
    AND.W #$FFF0                                                         ;948F51;
    SEC                                                                  ;948F54;
    SBC.W SamusXRadius                                                   ;948F55;
    SEC                                                                  ;948F58;
    SBC.W SamusXPosition                                                 ;948F59;
    BPL .leftNotMin                                                      ;948F5C;
    LDA.W #$0000                                                         ;948F5E;

  .leftNotMin:
    STA.B DP_Temp12                                                      ;948F61;
    LDA.W #$FFFF                                                         ;948F63;
    STA.W SamusXSubPosition                                              ;948F66;
    SEC                                                                  ;948F69;
    RTS                                                                  ;948F6A;

  .negative12:
    ORA.W #$000F                                                         ;948F6B;
    SEC                                                                  ;948F6E;
    ADC.W SamusXRadius                                                   ;948F6F;
    SEC                                                                  ;948F72;
    SBC.W SamusXPosition                                                 ;948F73;
    BMI .rightNotMin                                                     ;948F76;
    LDA.W #$0000                                                         ;948F78;

  .rightNotMin:
    STA.B DP_Temp12                                                      ;948F7B;
    STZ.W SamusXSubPosition                                              ;948F7D;
    SEC                                                                  ;948F80;
    RTS                                                                  ;948F81;


;;; $8F82: Samus block collision reaction - vertical - solid/shootable/grapple block ;;;
SamusBlockCollisionReaction_Vertical_SolidShootableGrapple:
;; Parameters:
;;     $12: Distance to check for collision
;;     $20: Target boundary position (top/bottom depending on sign of [$12])
;; Returns:
;;     Carry: Set. Unconditional collision
;;     $12.$14: Distance to collision
    STZ.B DP_Temp14                                                      ;948F82;
    LDA.B DP_Temp20                                                      ;948F84;
    BIT.B DP_Temp12                                                      ;948F86;
    BMI .negative12                                                      ;948F88;
    AND.W #$FFF0                                                         ;948F8A;
    SEC                                                                  ;948F8D;
    SBC.W SamusYRadius                                                   ;948F8E;
    SEC                                                                  ;948F91;
    SBC.W SamusYPosition                                                 ;948F92;
    BPL .bottomNotMin                                                    ;948F95;
    LDA.W #$0000                                                         ;948F97;

  .bottomNotMin:
    STA.B DP_Temp12                                                      ;948F9A;
    LDA.W #$FFFF                                                         ;948F9C;
    STA.W SamusYSubPosition                                              ;948F9F;
    SEC                                                                  ;948FA2;
    RTS                                                                  ;948FA3;

  .negative12:
    ORA.W #$000F                                                         ;948FA4;
    SEC                                                                  ;948FA7;
    ADC.W SamusYRadius                                                   ;948FA8;
    SEC                                                                  ;948FAB;
    SBC.W SamusYPosition                                                 ;948FAC;
    BMI .topNotMin                                                       ;948FAF;
    LDA.W #$0000                                                         ;948FB1;

  .topNotMin:
    STA.B DP_Temp12                                                      ;948FB4;
    STZ.W SamusYSubPosition                                              ;948FB6;
    SEC                                                                  ;948FB9;
    RTS                                                                  ;948FBA;


;;; $8FBB: Samus block collision reaction - horizontal - slope ;;;
SamusBlockCollisionReaction_Horizontal_Slope:
;; Parameters:
;;     $12.$14: Distance to check for collision
;;     $1A: Number of blocks left to check (0 if final (bottom) block)
;;     $1C: Samus' Y block span
;;     $20: Target boundary position (left/right depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    LDX.W CurrentBlockIndex                                              ;948FBB;
    LDA.L BTS,X                                                          ;948FBE;
    AND.W #$001F                                                         ;948FC2;
    CMP.W #$0005                                                         ;948FC5;
    BCC .gotoSquare                                                      ;948FC8;
    LDA.L BTS,X                                                          ;948FCA;
    AND.W #$00FF                                                         ;948FCE;
    STA.W CurrentSlopeBTS                                                ;948FD1;
    JMP.W SamusBlockCollisionDetection_Horizontal_Slope_NonSquare        ;948FD4;

  .gotoSquare:
    JMP.W SamusBlockCollisionReaction_Horizontal_Slope_Square            ;948FD7;


;;; $8FDA: Samus block collision reaction - vertical - slope ;;;
SamusBlockCollisionReaction_Vertical_Slope:
;; Parameters:
;;     $12.$14: Distance to check for collision
;;     $18: Target Y position
;;     $1A: Number of blocks left to check (0 if final (rightmost) block)
;;     $1C: Samus' X block span
;;     $20: Target boundary position (top/bottom depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    LDX.W CurrentBlockIndex                                              ;948FDA;
    LDA.L BTS,X                                                          ;948FDD;
    AND.W #$001F                                                         ;948FE1;
    CMP.W #$0005                                                         ;948FE4;
    BCC .gotoSquare                                                      ;948FE7;
    LDA.L BTS,X                                                          ;948FE9;
    STA.W CurrentSlopeBTS                                                ;948FED;
    JMP.W SamusBlockCollisionReaction_Vertical_Slope_NonSquare           ;948FF0;

  .gotoSquare:
    JMP.W SamusBlockCollisionReaction_Vertical_Slope_Square              ;948FF3;


;;; $8FF6: Samus block collision reaction - vertical - spike air - jump table ;;;
SamusBlockCollisionReaction_Vertical_SpikeAir_JumpTable:
; Yeah, great table
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


;;; $9018: Clear carry ;;;
CLCRTS_949018:
    CLC                                                                  ;949018;
    RTS                                                                  ;949019;


;;; $901A: Samus block collision reaction - vertical - spike air ;;;
SamusBlockCollisionReaction_Vertical_SpikeAir:
; Does nothing
    LDX.W CurrentBlockIndex                                              ;94901A;
    LDA.L BTS,X                                                          ;94901D;
    AND.W #$00FF                                                         ;949021;
    ASL                                                                  ;949024;
    TAX                                                                  ;949025;
    JSR.W (SamusBlockCollisionReaction_Vertical_SpikeAir_JumpTable,X)    ;949026;
    CLC                                                                  ;949029;
    RTS                                                                  ;94902A;


;;; $902B: Samus block collision reaction - spike block - jump table ;;;
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


;;; $904B: Samus block collision reaction - horizontal - spike block ;;;
SamusBlockCollisionReaction_Horizontal_SpikeBlock:
;; Parameters:
;;     $12: Distance to check for collision
;;     $20: Target boundary position (left/right depending on sign of [$12])
;; Returns:
;;     Carry: Set. Unconditional collision
;;     $12.$14: Distance to collision
    LDX.W CurrentBlockIndex                                              ;94904B;
    LDA.L BTS,X                                                          ;94904E;
    ASL                                                                  ;949052;
    AND.W #$01FF                                                         ;949053;
    TAX                                                                  ;949056;
    JSR.W (SamusBlockCollisionReaction_Vertical_SpikeBlock_JumpTable,X)  ;949057;
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple   ;94905A;


;;; $905D: Samus block collision reaction - vertical - spike block ;;;
SamusBlockCollisionReaction_Vertical_SpikeBlock:
;; Parameters:
;;     $12: Distance to check for collision
;;     $20: Target boundary position (top/bottom depending on sign of [$12])
;; Returns:
;;     Carry: Set. Unconditional collision
;;     $12.$14: Distance to collision
    LDX.W CurrentBlockIndex                                              ;94905D;
    LDA.L BTS,X                                                          ;949060;
    ASL                                                                  ;949064;
    AND.W #$01FF                                                         ;949065;
    TAX                                                                  ;949068;
    JSR.W (SamusBlockCollisionReaction_Vertical_SpikeBlock_JumpTable,X)  ;949069;
    JMP.W SamusBlockCollisionReaction_Vertical_SolidShootableGrapple     ;94906C;


;;; $906F: Samus block collision reaction - horizontal - special air ;;;
SamusBlockCollisionReaction_Horizontal_SpecialAir:
;; Parameters:
;;     $12.$14: Distance to check for collision
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision

; Area independent BTS can never cause a collision, but area dependent BTS can (according to the carry returned by their PLM setup)
    LDX.W CurrentBlockIndex                                              ;94906F;
    LDA.L BTS-1,X                                                        ;949072;
    AND.W #$FF00                                                         ;949076;
    XBA                                                                  ;949079;
    BMI .blockBTSMSB                                                     ;94907A;
    ASL                                                                  ;94907C;
    TAX                                                                  ;94907D;
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_areaIndependent,X ;94907E;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949081;
    CLC                                                                  ;949085;
    RTS                                                                  ;949086;

  .blockBTSMSB:
    AND.W #$007F                                                         ;949087;
    ASL                                                                  ;94908A;
    TAY                                                                  ;94908B;
    LDA.W AreaIndex                                                      ;94908C;
    ASL                                                                  ;94908F;
    TAX                                                                  ;949090;
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_AirPointers,X     ;949091;
    STA.B DP_Temp22                                                      ;949094;
    LDA.B (DP_Temp22),Y                                                  ;949096;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949098;
    RTS                                                                  ;94909C;


;;; $909D: Samus block collision reaction - vertical - special air ;;;
SamusBlockCollisionReaction_Vertical_SpecialAir:
;; Parameters:
;;     $12.$14: Distance to check for collision
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision

; Clone of SamusBlockCollisionReaction_Horizontal_SpecialAir
    LDX.W CurrentBlockIndex                                              ;94909D;
    LDA.L BTS-1,X                                                        ;9490A0;
    AND.W #$FF00                                                         ;9490A4;
    XBA                                                                  ;9490A7;
    BMI .blockBTSMSB                                                     ;9490A8;
    ASL                                                                  ;9490AA;
    TAX                                                                  ;9490AB;
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_areaIndependent,X ;9490AC;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;9490AF;
    CLC                                                                  ;9490B3;
    RTS                                                                  ;9490B4;

  .blockBTSMSB:
    AND.W #$007F                                                         ;9490B5;
    ASL                                                                  ;9490B8;
    TAY                                                                  ;9490B9;
    LDA.W AreaIndex                                                      ;9490BA;
    ASL                                                                  ;9490BD;
    TAX                                                                  ;9490BE;
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_AirPointers,X     ;9490BF;
    STA.B DP_Temp22                                                      ;9490C2;
    LDA.B (DP_Temp22),Y                                                  ;9490C4;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;9490C6;
    RTS                                                                  ;9490CA;


;;; $90CB: Samus block collision reaction - horizontal - special block ;;;
SamusBlockCollisionReaction_Horizontal_SpecialBlock:
;; Parameters:
;;     $12.$14: Distance to check for collision
;;     $20: Target boundary position (left/right depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    LDX.W CurrentBlockIndex                                              ;9490CB;
    LDA.L BTS-1,X                                                        ;9490CE;
    AND.W #$FF00                                                         ;9490D2;
    XBA                                                                  ;9490D5;
    BMI .areaDependent                                                   ;9490D6;
    ASL                                                                  ;9490D8;
    TAX                                                                  ;9490D9;
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_areaIndependent,X ;9490DA;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;9490DD;
    BCC .return                                                          ;9490E1;
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple   ;9490E3;

  .return:
    RTS                                                                  ;9490E6;

  .areaDependent:
    AND.W #$007F                                                         ;9490E7;
    ASL                                                                  ;9490EA;
    TAY                                                                  ;9490EB;
    LDA.W AreaIndex                                                      ;9490EC;
    ASL                                                                  ;9490EF;
    TAX                                                                  ;9490F0;
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_BlockPointers,X   ;9490F1;
    STA.B DP_Temp22                                                      ;9490F4;
    LDA.B (DP_Temp22),Y                                                  ;9490F6;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;9490F8;
    BCC ..return                                                         ;9490FC;
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple   ;9490FE;

  ..return:
    RTS                                                                  ;949101;


;;; $9102: Samus block collision reaction - vertical - special block ;;;
SamusBlockCollisionReaction_Vertical_SpecialBlock:
;; Parameters:
;;     $12.$14: Distance to check for collision
;;     $20: Target boundary position (left/right depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    LDX.W CurrentBlockIndex                                              ;949102;
    LDA.L BTS-1,X                                                        ;949105;
    AND.W #$FF00                                                         ;949109;
    XBA                                                                  ;94910C;
    BMI .areaDependent                                                   ;94910D;
    ASL                                                                  ;94910F;
    TAX                                                                  ;949110;
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_areaIndependent,X ;949111;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949114;
    BCC .return                                                          ;949118;
    JMP.W SamusBlockCollisionReaction_Vertical_SolidShootableGrapple     ;94911A;

  .return:
    RTS                                                                  ;94911D;

  .areaDependent:
    AND.W #$007F                                                         ;94911E;
    ASL                                                                  ;949121;
    TAY                                                                  ;949122;
    LDA.W AreaIndex                                                      ;949123;
    ASL                                                                  ;949126;
    TAX                                                                  ;949127;
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_BlockPointers,X   ;949128;
    STA.B DP_Temp22                                                      ;94912B;
    LDA.B (DP_Temp22),Y                                                  ;94912D;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;94912F;
    BCC ..return                                                         ;949133;
    JMP.W SamusBlockCollisionReaction_Vertical_SolidShootableGrapple     ;949135;

  ..return:
    RTS                                                                  ;949138;


;;; $9139: Samus block collision reaction - special - PLM table ;;;
SamusBlockCollisionReaction_Special_PLMTable:
  .areaIndependent:
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

  .crateria:
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

  .brinstar:
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

  .norfair:
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

  .wreckedShip:
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

  .maridia:
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

  .tourian:
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

  .ceres:
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

  .debug:
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

  .AirPointers:
; Special air pointers to the above
    dw SamusBlockCollisionReaction_Special_PLMTable_crateria             ;9492D9;
    dw SamusBlockCollisionReaction_Special_PLMTable_brinstar             ;9492DB;
    dw SamusBlockCollisionReaction_Special_PLMTable_norfair              ;9492DD;
    dw SamusBlockCollisionReaction_Special_PLMTable_wreckedShip          ;9492DF;
    dw SamusBlockCollisionReaction_Special_PLMTable_maridia              ;9492E1;
    dw SamusBlockCollisionReaction_Special_PLMTable_tourian              ;9492E3;
    dw SamusBlockCollisionReaction_Special_PLMTable_ceres                ;9492E5;
    dw SamusBlockCollisionReaction_Special_PLMTable_debug                ;9492E7;

  .BlockPointers:
; Special block pointers to the above
    dw SamusBlockCollisionReaction_Special_PLMTable_crateria             ;9492E9;
    dw SamusBlockCollisionReaction_Special_PLMTable_brinstar             ;9492EB;
    dw SamusBlockCollisionReaction_Special_PLMTable_norfair              ;9492ED;
    dw SamusBlockCollisionReaction_Special_PLMTable_wreckedShip          ;9492EF;
    dw SamusBlockCollisionReaction_Special_PLMTable_maridia              ;9492F1;
    dw SamusBlockCollisionReaction_Special_PLMTable_tourian              ;9492F3;
    dw SamusBlockCollisionReaction_Special_PLMTable_ceres                ;9492F5;
    dw SamusBlockCollisionReaction_Special_PLMTable_debug                ;9492F7;


;;; $92F9: Samus block collision reaction - horizontal - bombable air ;;;
SamusBlockCollisionReaction_Horizontal_BombableAir:
;; Returns:
;;     Carry: Clear. No collision
    LDX.W CurrentBlockIndex                                              ;9492F9;
    LDA.L BTS-1,X                                                        ;9492FC;
    AND.W #$FF00                                                         ;949300;
    XBA                                                                  ;949303;
    BMI .returnNoCollision                                               ;949304;
    ASL                                                                  ;949306;
    TAX                                                                  ;949307;
    LDA.W SamusBlockCollisionReaction_Bombable_PLMTable,X                ;949308;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;94930B;
    CLC                                                                  ;94930F;
    RTS                                                                  ;949310;

  .returnNoCollision:
    CLC                                                                  ;949311;
    RTS                                                                  ;949312;


;;; $9313: Samus block collision reaction - vertical - bombable air ;;;
SamusBlockCollisionReaction_Vertical_BombableAir:
;; Returns:
;;     Carry: Clear. No collision

; Clone of SamusBlockCollisionReaction_Horizontal_BombableAir
    LDX.W CurrentBlockIndex                                              ;949313;
    LDA.L BTS-1,X                                                        ;949316;
    AND.W #$FF00                                                         ;94931A;
    XBA                                                                  ;94931D;
    BMI .returnNoCollision                                               ;94931E;
    ASL                                                                  ;949320;
    TAX                                                                  ;949321;
    LDA.W SamusBlockCollisionReaction_Bombable_PLMTable,X                ;949322;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949325;
    CLC                                                                  ;949329;
    RTS                                                                  ;94932A;

  .returnNoCollision:
    CLC                                                                  ;94932B;
    RTS                                                                  ;94932C;


;;; $932D: Samus block collision reaction - horizontal - bomb block ;;;
SamusBlockCollisionReaction_Horizontal_BombBlock:
;; Parameters:
;;     $12: Distance to check for collision
;;     $20: Target boundary position (left/right depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: If carry set, distance to collision
    LDX.W CurrentBlockIndex                                              ;94932D;
    LDA.L BTS-1,X                                                        ;949330;
    AND.W #$FF00                                                         ;949334;
    XBA                                                                  ;949337;
    BMI .gotoSolidShootableGrapple                                       ;949338;
    ASL                                                                  ;94933A;
    TAX                                                                  ;94933B;
    %rumble16($22, 3)
    LDA.W SamusBlockCollisionReaction_Bombable_PLMTable,X                ;94933C;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;94933F;
    BCC .return                                                          ;949343;
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple   ;949345;

  .gotoSolidShootableGrapple:
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple   ;949348;

  .return:
    RTS                                                                  ;94934B;


;;; $934C: Samus block collision reaction - vertical - bomb block ;;;
SamusBlockCollisionReaction_Vertical_BombBlock:
;; Parameters:
;;     $12: Distance to check for collision
;;     $20: Target boundary position (top/bottom depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: If carry set, distance to collision
    LDX.W CurrentBlockIndex                                              ;94934C;
    LDA.L BTS-1,X                                                        ;94934F;
    AND.W #$FF00                                                         ;949353;
    XBA                                                                  ;949356;
    BMI .gotoSolidShootableGrapple                                       ;949357;
    ASL                                                                  ;949359;
    TAX                                                                  ;94935A;
    LDA.W SamusBlockCollisionReaction_Bombable_PLMTable,X                ;94935B;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;94935E;
    BCC .return                                                          ;949362;
    JMP.W SamusBlockCollisionReaction_Vertical_SolidShootableGrapple     ;949364;

  .gotoSolidShootableGrapple:
    JMP.W SamusBlockCollisionReaction_Vertical_SolidShootableGrapple     ;949367;

  .return:
    RTS                                                                  ;94936A;


;;; $936B: Samus block collision reaction - bombable - PLM table ;;;
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


;;; $938B: Samus block collision reaction - horizontal - door ;;;
SamusBlockCollisionReaction_Horizontal_Door:
;; Parameters:
;;     $12: Distance to check for collision
;;     $20: Target boundary position (left/right depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: If carry set, distance to collision
    LDA.W #DoorTransitionFunction_HandleElevator                         ;94938B;
    STA.W DoorTransitionFunction                                         ;94938E;
    LDX.W CurrentBlockIndex                                              ;949391;
    LDA.L BTS-1,X                                                        ;949394;
    AND.W #$FF00                                                         ;949398;
    XBA                                                                  ;94939B;
    STA.W DoorBTS                                                        ;94939C;
    AND.W #$007F                                                         ;94939F;
    ASL                                                                  ;9493A2;
    ADC.W DoorListPointer                                                ;9493A3;
    TAX                                                                  ;9493A6;
    LDA.L RoomDoors,X                                                    ;9493A7;
    TAX                                                                  ;9493AB;
    LDA.L DoorHeaders_destRoomHeader,X                                   ;9493AC;
    BPL .notAPointer                                                     ;9493B0;
    STX.W DoorPointer                                                    ;9493B2;
    LDA.W #$0009                                                         ;9493B5;
    STA.W GameState                                                      ;9493B8;
    CLC                                                                  ;9493BB;
    RTS                                                                  ;9493BC;

  .notAPointer:
    LDA.W Pose                                                           ;9493BD;
    CMP.W #$0009                                                         ;9493C0;
    BCS .gotoSolidShootableGrapple                                       ;9493C3;
    LDA.W #$0001                                                         ;9493C5;
    STA.W ElevatorProperties                                             ;9493C8;

  .gotoSolidShootableGrapple:
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple   ;9493CB;


;;; $93CE: Samus block collision reaction - vertical - door ;;;
SamusBlockCollisionReaction_Vertical_Door:
;; Parameters:
;;     $12: Distance to check for collision
;;     $20: Target boundary position (top/bottom depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: If carry set, distance to collision
    LDA.W #DoorTransitionFunction_HandleElevator                         ;9493CE;
    STA.W DoorTransitionFunction                                         ;9493D1;
    LDX.W CurrentBlockIndex                                              ;9493D4;
    LDA.L BTS-1,X                                                        ;9493D7;
    AND.W #$FF00                                                         ;9493DB;
    XBA                                                                  ;9493DE;
    STA.W DoorBTS                                                        ;9493DF;
    AND.W #$007F                                                         ;9493E2;
    ASL                                                                  ;9493E5;
    ADC.W DoorListPointer                                                ;9493E6;
    TAX                                                                  ;9493E9;
    LDA.L RoomDoors,X                                                    ;9493EA;
    TAX                                                                  ;9493EE;
    LDA.L DoorHeaders_destRoomHeader,X                                   ;9493EF;
    BPL .notAPointer                                                     ;9493F3;
    STX.W DoorPointer                                                    ;9493F5;
    LDA.W #$0009                                                         ;9493F8;
    STA.W GameState                                                      ;9493FB;
    CLC                                                                  ;9493FE;
    RTS                                                                  ;9493FF;

  .notAPointer:
    LDA.W Pose                                                           ;949400;
    CMP.W #$0009                                                         ;949403;
    BCS .gotoSolidShootableGrapple                                       ;949406;
    LDA.W #$0001                                                         ;949408;
    STA.W ElevatorProperties                                             ;94940B;

  .gotoSolidShootableGrapple:
    JMP.W SamusBlockCollisionReaction_Vertical_SolidShootableGrapple     ;94940E;


;;; $9411: Block shot/bombed/grappled/collision/inside reaction - horizontal extension ;;;
BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt:
;; Returns:
;;     Carry: Clear. No collision

; If BTS is 0, acts like air
; Otherwise, offsets block index by block BTS, updates X, and loops back to the `JSR (xxxx, X)` instruction that jumped to here
    LDX.W CurrentBlockIndex                                              ;949411;
    LDA.L BTS,X                                                          ;949414;
    AND.W #$00FF                                                         ;949418;
    BEQ .returnNoCollision                                               ;94941B;
    BIT.W #$0080                                                         ;94941D;
    BNE .highByte                                                        ;949420;
    AND.W #$00FF                                                         ;949422;
    BRA +                                                                ;949425;

  .highByte:
    ORA.W #$FF00                                                         ;949427;

+   CLC                                                                  ;94942A;
    ADC.W CurrentBlockIndex                                              ;94942B;
    STA.W CurrentBlockIndex                                              ;94942E;
    ASL                                                                  ;949431;
    TAX                                                                  ;949432;
    LDA.L LevelData,X                                                    ;949433;
    AND.W #$F000                                                         ;949437;
    XBA                                                                  ;94943A;
    LSR                                                                  ;94943B;
    LSR                                                                  ;94943C;
    LSR                                                                  ;94943D;
    TAX                                                                  ;94943E;
    PLA                                                                  ;94943F;
    SEC                                                                  ;949440;
    SBC.W #$0003                                                         ;949441;
    PHA                                                                  ;949444;

  .returnNoCollision:
    CLC                                                                  ;949445;
    RTS                                                                  ;949446;


;;; $9447: Block shot/bombed/grappled/collision/inside reaction - vertical extension ;;;
BlockShotBombedGrappledCollisionInsideReaction_VerticalExt:
;; Returns:
;;     Carry: Clear. No collision

; If BTS is 0, acts like air
; Otherwise, offsets block index by block BTS, updates X, and loops back to the `JSR (xxxx, X)` instruction that jumped to here
; Uses an addition/subtraction loop for multiplication, which is probably faster for an offset of 1 or maybe 2
    LDX.W CurrentBlockIndex                                              ;949447;
    LDA.L BTS,X                                                          ;94944A;
    AND.W #$00FF                                                         ;94944E;
    BEQ .returnNoCollision                                               ;949451;
    BIT.W #$0080                                                         ;949453;
    BNE .highByte                                                        ;949456;
    STA.W CollisionVariable                                              ;949458;
    LDA.W CurrentBlockIndex                                              ;94945B;

  .loopUpper:
    CLC                                                                  ;94945E;
    ADC.W RoomWidthBlocks                                                ;94945F;
    DEC.W CollisionVariable                                              ;949462;
    BNE .loopUpper                                                       ;949465;
    JMP.W +                                                              ;949467;

  .highByte:
    ORA.W #$FF00                                                         ;94946A;
    STA.W CollisionVariable                                              ;94946D;
    LDA.W CurrentBlockIndex                                              ;949470;

  .loopLower:
    SEC                                                                  ;949473;
    SBC.W RoomWidthBlocks                                                ;949474;
    INC.W CollisionVariable                                              ;949477;
    BNE .loopLower                                                       ;94947A;

+   STA.W CurrentBlockIndex                                              ;94947C;
    ASL                                                                  ;94947F;
    TAX                                                                  ;949480;
    LDA.L LevelData,X                                                    ;949481;
    AND.W #$F000                                                         ;949485;
    XBA                                                                  ;949488;
    LSR                                                                  ;949489;
    LSR                                                                  ;94948A;
    LSR                                                                  ;94948B;
    TAX                                                                  ;94948C;
    PLA                                                                  ;94948D;
    SEC                                                                  ;94948E;
    SBC.W #$0003                                                         ;94948F;
    PHA                                                                  ;949492;

  .returnNoCollision:
    CLC                                                                  ;949493;
    RTS                                                                  ;949494;


;;; $9495: Calculate Samus Y block span ;;;
CalculateSamusYBlockSpan:
; A = $1A = $1C = ([Samus Y position] + [Samus Y radius] - 1) / 10h
;               - ([Samus Y position] - [Samus Y radius]) / 10h
    LDA.W SamusYPosition                                                 ;949495;
    SEC                                                                  ;949498;
    SBC.W SamusYRadius                                                   ;949499;
    AND.W #$FFF0                                                         ;94949C;
    STA.B DP_Temp1A                                                      ;94949F;
    LDA.W SamusYPosition                                                 ;9494A1;
    CLC                                                                  ;9494A4;
    ADC.W SamusYRadius                                                   ;9494A5;
    DEC                                                                  ;9494A8;
    SEC                                                                  ;9494A9;
    SBC.B DP_Temp1A                                                      ;9494AA;
    LSR                                                                  ;9494AC;
    LSR                                                                  ;9494AD;
    LSR                                                                  ;9494AE;
    LSR                                                                  ;9494AF;
    STA.B DP_Temp1A                                                      ;9494B0;
    STA.B DP_Temp1C                                                      ;9494B2;
    RTS                                                                  ;9494B4;


;;; $94B5: Calculate Samus X block span ;;;
CalculateSamusXBlockSpan:
; A = $1A = $1C = ([Samus X position] + [Samus X radius] - 1) / 10h
;               - ([Samus X position] - [Samus X radius]) / 10h
    LDA.W SamusXPosition                                                 ;9494B5;
    SEC                                                                  ;9494B8;
    SBC.W SamusXRadius                                                   ;9494B9;
    AND.W #$FFF0                                                         ;9494BC;
    STA.B DP_Temp1A                                                      ;9494BF;
    LDA.W SamusXPosition                                                 ;9494C1;
    CLC                                                                  ;9494C4;
    ADC.W SamusXRadius                                                   ;9494C5;
    DEC                                                                  ;9494C8;
    SEC                                                                  ;9494C9;
    SBC.B DP_Temp1A                                                      ;9494CA;
    LSR                                                                  ;9494CC;
    LSR                                                                  ;9494CD;
    LSR                                                                  ;9494CE;
    LSR                                                                  ;9494CF;
    STA.B DP_Temp1A                                                      ;9494D0;
    STA.B DP_Temp1C                                                      ;9494D2;
    RTS                                                                  ;9494D4;


;;; $94D5: Samus block collision reaction pointers - horizontal ;;;
SamusBlockCollisionReactionPointers_Horizontal:
    dw CLCRTS_948F47                                                     ;9494D5; *0: Air
    dw SamusBlockCollisionReaction_Horizontal_Slope                      ;9494D7;  1: Slope
    dw CLCRTS_949018                                                     ;9494D9; *2: Spike air
    dw SamusBlockCollisionReaction_Horizontal_SpecialAir                 ;9494DB;  3: Special air
    dw CLCRTS_948F47                                                     ;9494DD; *4: Shootable air
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ;9494DF;  5: Horizontal extension
    dw CLCRTS_948F47                                                     ;9494E1; *6: Unused air
    dw SamusBlockCollisionReaction_Horizontal_BombableAir                ;9494E3;  7: Bombable air
    dw SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple      ;9494E5;  8: Solid block
    dw SamusBlockCollisionReaction_Horizontal_Door                       ;9494E7;  9: Door block
    dw SamusBlockCollisionReaction_Horizontal_SpikeBlock                 ;9494E9;  Ah: Spike block
    dw SamusBlockCollisionReaction_Horizontal_SpecialBlock               ;9494EB;  Bh: Special block
    dw SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple      ;9494ED;  Ch: Shootable block
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ;9494EF;  Dh: Vertical extension
    dw SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple      ;9494F1;  Eh: Grapple block
    dw SamusBlockCollisionReaction_Horizontal_BombBlock                  ;9494F3;  Fh: Bombable block


;;; $94F5: Samus block collision reaction pointers - vertical ;;;
SamusBlockCollisionReactionPointers_Vertical:
    dw CLCRTS_948F47                                                     ;9494F5; 0: Air
    dw SamusBlockCollisionReaction_Vertical_Slope                        ;9494F7; 1: Slope
    dw SamusBlockCollisionReaction_Vertical_SpikeAir                     ;9494F9; 2: Spike air
    dw SamusBlockCollisionReaction_Vertical_SpecialAir                   ;9494FB; 3: Special air
    dw CLCRTS_948F47                                                     ;9494FD; 4: Shootable air
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ;9494FF; 5: Horizontal extension
    dw CLCRTS_948F47                                                     ;949501; 6: Unused air
    dw SamusBlockCollisionReaction_Vertical_BombableAir                  ;949503; 7: Bombable air
    dw SamusBlockCollisionReaction_Vertical_SolidShootableGrapple        ;949505; 8: Solid block
    dw SamusBlockCollisionReaction_Vertical_Door                         ;949507; 9: Door block
    dw SamusBlockCollisionReaction_Vertical_SpikeBlock                   ;949509; Ah: Spike block
    dw SamusBlockCollisionReaction_Vertical_SpecialBlock                 ;94950B; Bh: Special block
    dw SamusBlockCollisionReaction_Vertical_SolidShootableGrapple        ;94950D; Ch: Shootable block
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ;94950F; Dh: Vertical extension
    dw SamusBlockCollisionReaction_Vertical_SolidShootableGrapple        ;949511; Eh: Grapple block
    dw SamusBlockCollisionReaction_Vertical_BombBlock                    ;949513; Fh: Bombable block


;;; $9515: Samus block collision reaction - horizontal ;;;
SamusBlockCollisionReaction_Horizontal:
;; Parameters:
;;     X: Block index (multiple of 2)
;;     $12.$14: Distance to check for collision
;;     $1A: Number of blocks left to check (0 if final (bottom) block)
;;     $1C: Samus' Y block span
;;     $20: Target boundary position (left/right depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    PHX                                                                  ;949515;
    TXA                                                                  ;949516;
    LSR                                                                  ;949517;
    STA.W CurrentBlockIndex                                              ;949518;
    LDA.L LevelData,X                                                    ;94951B;
    AND.W #$F000                                                         ;94951F;
    XBA                                                                  ;949522;
    LSR                                                                  ;949523;
    LSR                                                                  ;949524;
    LSR                                                                  ;949525;
    TAX                                                                  ;949526;
    JSR.W (SamusBlockCollisionReactionPointers_Horizontal,X)             ;949527;
    PLX                                                                  ;94952A;
    RTS                                                                  ;94952B;


;;; $952C: Samus block collision reaction - vertical ;;;
SamusBlockCollisionReaction_Vertical:
;; Parameters:
;;     X: Block index (multiple of 2)
;;     $12.$14: Distance to check for collision
;;     $18: Target Y position
;;     $20: Target boundary position (top/bottom depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    PHX                                                                  ;94952C;
    TXA                                                                  ;94952D;
    LSR                                                                  ;94952E;
    STA.W CurrentBlockIndex                                              ;94952F;
    LDA.L LevelData,X                                                    ;949532;
    AND.W #$F000                                                         ;949536;
    XBA                                                                  ;949539;
    LSR                                                                  ;94953A;
    LSR                                                                  ;94953B;
    LSR                                                                  ;94953C;
    TAX                                                                  ;94953D;
    JSR.W (SamusBlockCollisionReactionPointers_Vertical,X)               ;94953E;
    PLX                                                                  ;949541;
    RTS                                                                  ;949542;


;;; $9543: Samus block collision detection - horizontal ;;;
SamusBlockCollisionDetection_Horizontal:
;; Parameters:
;;     $12.$14: Distance to move Samus
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    JSR.W CalculateSamusYBlockSpan                                       ;949543;
    LDA.W SamusYPosition                                                 ;949546;
    SEC                                                                  ;949549;
    SBC.W SamusYRadius                                                   ;94954A;
    LSR                                                                  ;94954D;
    LSR                                                                  ;94954E;
    LSR                                                                  ;94954F;
    LSR                                                                  ;949550;
    SEP #$20                                                             ;949551;
    STA.W $4202                                                          ;949553;
    LDA.W RoomWidthBlocks                                                ;949556;
    STA.W $4203                                                          ;949559;
    REP #$20                                                             ;94955C;
    LDA.W SamusXSubPosition                                              ;94955E;
    CLC                                                                  ;949561;
    ADC.B DP_Temp14                                                      ;949562;
    STA.B DP_Temp16                                                      ;949564;
    LDA.W SamusXPosition                                                 ;949566;
    ADC.B DP_Temp12                                                      ;949569;
    STA.B DP_Temp18                                                      ;94956B;
    BIT.B DP_Temp12                                                      ;94956D;
    BPL .movingRight                                                     ;94956F;
    SEC                                                                  ;949571;
    SBC.W SamusXRadius                                                   ;949572;
    BRA +                                                                ;949575;

  .movingRight:
    CLC                                                                  ;949577;
    ADC.W SamusXRadius                                                   ;949578;
    DEC                                                                  ;94957B;

+   STA.B DP_Temp20                                                      ;94957C;
    LSR                                                                  ;94957E;
    LSR                                                                  ;94957F;
    LSR                                                                  ;949580;
    LSR                                                                  ;949581;
    CLC                                                                  ;949582;
    ADC.W $4216                                                          ;949583;
    ASL                                                                  ;949586;
    TAX                                                                  ;949587;

  .loop:
    JSR.W SamusBlockCollisionReaction_Horizontal                         ;949588;
    BCS .returnCollision                                                 ;94958B;
    TXA                                                                  ;94958D;
    CLC                                                                  ;94958E;
    ADC.W RoomWidthBlocks                                                ;94958F;
    ADC.W RoomWidthBlocks                                                ;949592;
    TAX                                                                  ;949595;
    DEC.B DP_Temp1A                                                      ;949596;
    BPL .loop                                                            ;949598;
    CLC                                                                  ;94959A;
    RTS                                                                  ;94959B;

  .returnCollision:
    SEC                                                                  ;94959C;
    RTS                                                                  ;94959D;


;;; $959E: Samus block collision detection - vertical - left to right ;;;
SamusBlockCollisionDetection_Vertical_LeftToRight:
;; Parameters:
;;     $12.$14: Distance to move Samus
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    JSR.W CalculateSamusXBlockSpan                                       ;94959E;
    LDA.W SamusYSubPosition                                              ;9495A1;
    CLC                                                                  ;9495A4;
    ADC.B DP_Temp14                                                      ;9495A5;
    STA.B DP_Temp16                                                      ;9495A7;
    LDA.W SamusYPosition                                                 ;9495A9;
    ADC.B DP_Temp12                                                      ;9495AC;
    STA.B DP_Temp18                                                      ;9495AE;
    BIT.B DP_Temp12                                                      ;9495B0;
    BPL .movingDown                                                      ;9495B2;
    SEC                                                                  ;9495B4;
    SBC.W SamusYRadius                                                   ;9495B5;
    BRA +                                                                ;9495B8;

  .movingDown:
    CLC                                                                  ;9495BA;
    ADC.W SamusYRadius                                                   ;9495BB;
    DEC                                                                  ;9495BE;

+   STA.B DP_Temp20                                                      ;9495BF;
    LSR                                                                  ;9495C1;
    LSR                                                                  ;9495C2;
    LSR                                                                  ;9495C3;
    LSR                                                                  ;9495C4;
    SEP #$20                                                             ;9495C5;
    STA.W $4202                                                          ;9495C7;
    LDA.W RoomWidthBlocks                                                ;9495CA;
    STA.W $4203                                                          ;9495CD;
    REP #$20                                                             ;9495D0;
    LDA.W SamusXPosition                                                 ;9495D2;
    SEC                                                                  ;9495D5;
    SBC.W SamusXRadius                                                   ;9495D6;
    LSR                                                                  ;9495D9;
    LSR                                                                  ;9495DA;
    LSR                                                                  ;9495DB;
    LSR                                                                  ;9495DC;
    CLC                                                                  ;9495DD;
    ADC.W $4216                                                          ;9495DE;
    STA.W CurrentBlockIndex                                              ;9495E1;
    ASL                                                                  ;9495E4;
    TAX                                                                  ;9495E5;

  .loop:
    JSR.W SamusBlockCollisionReaction_Vertical                           ;9495E6;
    BCS .returnCollision                                                 ;9495E9;
    INX                                                                  ;9495EB;
    INX                                                                  ;9495EC;
    DEC.B DP_Temp1A                                                      ;9495ED;
    BPL .loop                                                            ;9495EF;
    CLC                                                                  ;9495F1;
    RTS                                                                  ;9495F2;

  .returnCollision:
    SEC                                                                  ;9495F3;
    RTS                                                                  ;9495F4;


;;; $95F5: Samus block collision detection - vertical - right to left ;;;
SamusBlockCollisionDetection_Vertical_RightToLeft:
;; Parameters:
;;     $12.$14: Distance to check for collision
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    JSR.W CalculateSamusXBlockSpan                                       ;9495F5;
    STZ.B DP_Temp1A                                                      ;9495F8;
    LDA.W SamusYSubPosition                                              ;9495FA;
    CLC                                                                  ;9495FD;
    ADC.B DP_Temp14                                                      ;9495FE;
    STA.B DP_Temp16                                                      ;949600;
    LDA.W SamusYPosition                                                 ;949602;
    ADC.B DP_Temp12                                                      ;949605;
    STA.B DP_Temp18                                                      ;949607;
    BIT.B DP_Temp12                                                      ;949609;
    BPL .movingDown                                                      ;94960B;
    SEC                                                                  ;94960D;
    SBC.W SamusYRadius                                                   ;94960E;
    BRA +                                                                ;949611;

  .movingDown:
    CLC                                                                  ;949613;
    ADC.W SamusYRadius                                                   ;949614;
    DEC                                                                  ;949617;

+   STA.B DP_Temp20                                                      ;949618;
    LSR                                                                  ;94961A;
    LSR                                                                  ;94961B;
    LSR                                                                  ;94961C;
    LSR                                                                  ;94961D;
    SEP #$20                                                             ;94961E;
    STA.W $4202                                                          ;949620;
    LDA.W RoomWidthBlocks                                                ;949623;
    STA.W $4203                                                          ;949626;
    REP #$20                                                             ;949629;
    LDA.W SamusXPosition                                                 ;94962B;
    CLC                                                                  ;94962E;
    ADC.W SamusXRadius                                                   ;94962F;
    DEC                                                                  ;949632;
    LSR                                                                  ;949633;
    LSR                                                                  ;949634;
    LSR                                                                  ;949635;
    LSR                                                                  ;949636;
    CLC                                                                  ;949637;
    ADC.W $4216                                                          ;949638;
    STA.W CurrentBlockIndex                                              ;94963B;
    ASL                                                                  ;94963E;
    TAX                                                                  ;94963F;

  .loop:
    JSR.W SamusBlockCollisionReaction_Vertical                           ;949640;
    BCS .returnCollision                                                 ;949643;
    DEX                                                                  ;949645;
    DEX                                                                  ;949646;
    INC.B DP_Temp1A                                                      ;949647;
    LDA.B DP_Temp1C                                                      ;949649;
    CMP.B DP_Temp1A                                                      ;94964B;
    BCS .loop                                                            ;94964D;
    CLC                                                                  ;94964F;
    RTS                                                                  ;949650;

  .returnCollision:
    SEC                                                                  ;949651;
    RTS                                                                  ;949652;


;;; $9653: $12.$14 = |[$12].[$14]| ;;;
Get_12_14_949653:
    LDA.B DP_Temp12                                                      ;949653;
    BPL .return                                                          ;949655;
    EOR.W #$FFFF                                                         ;949657;
    STA.B DP_Temp12                                                      ;94965A;
    LDA.B DP_Temp14                                                      ;94965C;
    EOR.W #$FFFF                                                         ;94965E;
    INC                                                                  ;949661;
    STA.B DP_Temp14                                                      ;949662;
    BNE .return                                                          ;949664;
    INC.B DP_Temp12                                                      ;949666;

  .return:
    RTS                                                                  ;949668;


;;; $9669: $12.$14 = |[$12].[$14]| ;;;
Get_12_14_949669:
; So good they coded it twice
    LDA.B DP_Temp12                                                      ;949669;
    BPL .return                                                          ;94966B;
    EOR.W #$FFFF                                                         ;94966D;
    STA.B DP_Temp12                                                      ;949670;
    LDA.B DP_Temp14                                                      ;949672;
    EOR.W #$FFFF                                                         ;949674;
    INC                                                                  ;949677;
    STA.B DP_Temp14                                                      ;949678;
    BNE .return                                                          ;94967A;
    INC.B DP_Temp12                                                      ;94967C;

  .return:
    RTS                                                                  ;94967E;


;;; $967F: Wall jump block collision detection ;;;
WallJumpBlockCollisionDetection:
;; Parameters:
;;     $12.$14: Distance to check for collision
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12: If carry set: collision distance

; Wrapper function of SamusBlockCollisionDetection_Horizontal for wall-jump check ($90:9D35/ BombAndPowerBombExplosionBlockCollisionHandling) that ignores special air/block collisions
; The result stored to SamusSolidCollisionFlag is unused

; By setting CollisionMovementDirection to Fh, all of the collision direction checks in special air/block collision PLM setup routines
; (map/energy/missile station left/right access, quicksand surface, save station / chozo hand trigger, crumble block)
; result in no effect (no other subroutine of SamusBlockCollisionDetection_Horizontal checks collision direction)
    PHP                                                                  ;94967F;
    PHB                                                                  ;949680;
    PHK                                                                  ;949681;
    PLB                                                                  ;949682;
    LDA.W CollisionMovementDirection                                     ;949683;
    ORA.W #$000F                                                         ;949686;
    STA.W CollisionMovementDirection                                     ;949689;
    STZ.W SamusInQuicksand                                               ;94968C;
    JSR.W SamusBlockCollisionDetection_Horizontal                        ;94968F;
    BCC .noCollision                                                     ;949692;
    JSR.W Get_12_14_949653                                               ;949694;
    PLB                                                                  ;949697;
    PLP                                                                  ;949698;
    SEC                                                                  ;949699;
    LDA.W #$0001                                                         ;94969A;
    STA.W SamusSolidCollisionFlag                                        ;94969D;
    RTL                                                                  ;9496A0;

  .noCollision:
    JSR.W Get_12_14_949653                                               ;9496A1;
    PLB                                                                  ;9496A4;
    PLP                                                                  ;9496A5;
    CLC                                                                  ;9496A6;
    STZ.W SamusSolidCollisionFlag                                        ;9496A7;
    RTL                                                                  ;9496AA;


;;; $96AB: Block collision detection due to change of pose ;;;
BlockCollisionDetectionDueToChangeOfPose:
;; Parameters:
;;     $12: Distance to check for collision (assume less than 10h)
;;     $14: 0. Subdistance to check for collision
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12: Adjusted distance to move Samus or distance to collision

; Check for collision with the one or two blocks (depending on the distance to check) above or below Samus (depending on the sign of $12),
; ignoring special air/block collisions
    LDA.B DP_Temp12                                                      ;9496AB;
    BPL .positive                                                        ;9496AD;
    EOR.W #$FFFF                                                         ;9496AF;
    INC                                                                  ;9496B2;

  .positive:
    AND.W #$FFF8                                                         ;9496B3;
    BNE +                                                                ;9496B6;
    JSL.L BlockCollisionDetectionDueToChangeOfPose_SingleBlock           ;9496B8;
    RTL                                                                  ;9496BC;

+   LDA.B DP_Temp12                                                      ;9496BD;
    PHA                                                                  ;9496BF;
    LDA.B DP_Temp14                                                      ;9496C0;
    PHA                                                                  ;9496C2;
    LDA.B DP_Temp12                                                      ;9496C3;
    AND.W #$FFF8                                                         ;9496C5;
    ORA.W #$0008                                                         ;9496C8;
    STA.B DP_Temp12                                                      ;9496CB;
    STZ.B DP_Temp14                                                      ;9496CD;
    JSL.L BlockCollisionDetectionDueToChangeOfPose_SingleBlock           ;9496CF;
    BCC .noCollision                                                     ;9496D3;
    PLA                                                                  ;9496D5;
    PLA                                                                  ;9496D6;
    RTL                                                                  ;9496D7;

  .noCollision:
    PLA                                                                  ;9496D8;
    STA.B DP_Temp14                                                      ;9496D9;
    PLA                                                                  ;9496DB;
    STA.B DP_Temp12                                                      ;9496DC;
    JSL.L BlockCollisionDetectionDueToChangeOfPose_SingleBlock           ;9496DE;
    RTL                                                                  ;9496E2;


;;; $96E3: Block collision detection due to change of pose - single block ;;;
BlockCollisionDetectionDueToChangeOfPose_SingleBlock:
;; Parameters:
;;     $12: Distance to check for collision (assume less than 8)
;;     $14: 0. Subdistance to check for collision
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12: Adjusted distance to move Samus or distance to collision

; The result stored to SamusSolidCollisionFlag is unused

; By setting CollisionMovementDirection to Fh, all of the collision direction checks in special air/block collision PLM setup routines *except for quicksand surface*
; (map/energy/missile station left/right access, save station / chozo hand trigger, crumble block)
; result in no effect (no other subroutine of SamusBlockCollisionDetection_Vertical_LeftToRight / SamusBlockCollisionDetection_Vertical_RightToLeft checks collision direction)
; Quicksand surface collision is partially disabled, but can still set the Samus is in quicksand flag
; Not really sure if it makes sense to disable these interactions...
    PHP                                                                  ;9496E3;
    PHB                                                                  ;9496E4;
    REP #$30                                                             ;9496E5;
    PHK                                                                  ;9496E7;
    PLB                                                                  ;9496E8;
    LDA.W CollisionMovementDirection                                     ;9496E9;
    ORA.W #$000F                                                         ;9496EC;
    STA.W CollisionMovementDirection                                     ;9496EF;
    STZ.W SamusInQuicksand                                               ;9496F2;
    LDA.W NMI_FrameCounter                                               ;9496F5;
    LSR                                                                  ;9496F8;
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
    STA.W SamusSolidCollisionFlag                                        ;949710;
    RTL                                                                  ;949713;

  .noCollision:
    JSR.W Get_12_14_949669                                               ;949714;
    PLB                                                                  ;949717;
    PLP                                                                  ;949718;
    CLC                                                                  ;949719;
    STZ.W SamusSolidCollisionFlag                                        ;94971A;
    RTL                                                                  ;94971D;


;;; $971E: Move Samus right by [$12].[$14], no solid enemy collision ;;;
MoveSamusRight_NoSolidEnemyCollision:
;; Parameters:
;;     $12.$14: Distance to move Samus
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance Samus was moved
    PHP                                                                  ;94971E;
    PHB                                                                  ;94971F;
    PHK                                                                  ;949720;
    PLB                                                                  ;949721;
    LDA.B DP_Temp14                                                      ;949722;
    ORA.B DP_Temp12                                                      ;949724;
    BEQ .noCollision                                                     ;949726;
    STZ.W SamusInQuicksand                                               ;949728;
    JSR.W SamusBlockCollisionDetection_Horizontal                        ;94972B;
    BCC .noCollision                                                     ;94972E;
    LDA.W SamusXSubPosition                                              ;949730;
    CLC                                                                  ;949733;
    ADC.B DP_Temp14                                                      ;949734;
    STA.W SamusXSubPosition                                              ;949736;
    LDA.W SamusXPosition                                                 ;949739;
    ADC.B DP_Temp12                                                      ;94973C;
    STA.W SamusXPosition                                                 ;94973E;
    PLB                                                                  ;949741;
    PLP                                                                  ;949742;
    SEC                                                                  ;949743;
    LDA.W #$0001                                                         ;949744;
    STA.W SamusSolidCollisionFlag                                        ;949747;
    RTL                                                                  ;94974A;

  .noCollision:
    LDA.W SamusXSubPosition                                              ;94974B;
    CLC                                                                  ;94974E;
    ADC.B DP_Temp14                                                      ;94974F;
    STA.W SamusXSubPosition                                              ;949751;
    LDA.W SamusXPosition                                                 ;949754;
    ADC.B DP_Temp12                                                      ;949757;
    STA.W SamusXPosition                                                 ;949759;
    PLB                                                                  ;94975C;
    PLP                                                                  ;94975D;
    CLC                                                                  ;94975E;
    STZ.W SamusSolidCollisionFlag                                        ;94975F;
    RTL                                                                  ;949762;


;;; $9763: Move Samus down by [$12].[$14], no solid enemy collision ;;;
MoveSamusDown_NoSolidEnemyCollision:
;; Parameters:
;;     $12.$14: Distance to move Samus
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance Samus was moved
    PHP                                                                  ;949763;
    PHB                                                                  ;949764;
    REP #$30                                                             ;949765;
    PHK                                                                  ;949767;
    PLB                                                                  ;949768;
    LDA.B DP_Temp14                                                      ;949769;
    ORA.B DP_Temp12                                                      ;94976B;
    BEQ .noCollision                                                     ;94976D;
    STZ.W SamusPositionAdjustedBySlopeFlag                               ;94976F;
    STZ.W SamusInQuicksand                                               ;949772;
    LDA.W NMI_FrameCounter                                               ;949775;
    LSR                                                                  ;949778;
    BCS .nonZeroFrameCounter                                             ;949779;
    JSR.W SamusBlockCollisionDetection_Vertical_LeftToRight              ;94977B;
    BCC .noCollision                                                     ;94977E;
    BCS .moveVertically                                                  ;949780;

  .nonZeroFrameCounter:
    JSR.W SamusBlockCollisionDetection_Vertical_RightToLeft              ;949782;
    BCC .noCollision                                                     ;949785;

  .moveVertically:
    LDA.W SamusYSubPosition                                              ;949787;
    CLC                                                                  ;94978A;
    ADC.B DP_Temp14                                                      ;94978B;
    STA.W SamusYSubPosition                                              ;94978D;
    LDA.W SamusYPosition                                                 ;949790;
    ADC.B DP_Temp12                                                      ;949793;
    STA.W SamusYPosition                                                 ;949795;

  .collision:
    PLB                                                                  ;949798;
    PLP                                                                  ;949799;
    SEC                                                                  ;94979A;
    LDA.W #$0001                                                         ;94979B;
    STA.W SamusSolidCollisionFlag                                        ;94979E;
    RTL                                                                  ;9497A1;

  .noCollision:
    LDA.W SamusYSubPosition                                              ;9497A2;
    CLC                                                                  ;9497A5;
    ADC.B DP_Temp14                                                      ;9497A6;
    STA.W SamusYSubPosition                                              ;9497A8;
    LDA.W SamusYPosition                                                 ;9497AB;
    ADC.B DP_Temp12                                                      ;9497AE;
    STA.W SamusYPosition                                                 ;9497B0;
    LDA.W SamusInQuicksand                                               ;9497B3;
    BNE .collision                                                       ;9497B6;
    PLB                                                                  ;9497B8;
    PLP                                                                  ;9497B9;
    CLC                                                                  ;9497BA;
    STZ.W SamusSolidCollisionFlag                                        ;9497BB;
    RTL                                                                  ;9497BE;


;;; $97BF: Block inside reaction - slope ;;;
BlockInsideReaction_Slope:
; Check if the slope is a square slope (BTS 0..5) or not. Then do nothing
; Maybe they cared about the carry flag at one point, but probably not
    LDX.W CurrentBlockIndex                                              ;9497BF;
    LDA.L BTS,X                                                          ;9497C2;
    AND.W #$001F                                                         ;9497C6;
    CMP.W #$0005                                                         ;9497C9;
    BCS .returnDuplicate                                                 ;9497CC; >.<
    RTS                                                                  ;9497CE;

  .returnDuplicate:
    RTS                                                                  ;9497CF;


;;; $97D0: Block inside reaction - air/shootable air/unused air/bombable air ;;;
BlockInsideReaction_Air_ShootableAir_BombableAir:
    LDA.W #SamusXSpeedTable_Normal                                       ;9497D0;
    STA.W XSpeedTablePointer                                             ;9497D3;
    RTS                                                                  ;9497D6;


;;; $97D7: RTS ;;;
RTS_9497D7:
    RTS                                                                  ;9497D7;


;;; $97D8: Clear carry. Block inside reaction - spike air - BTS 0 (unused) ;;;
CLCRTS_9497D8:
; Looks like this block's effect was NOP'd out, although this block is never used anyway
    CLC                                                                  ;9497D8;
    RTS                                                                  ;9497D9;

    LDA.W PeriodicSubDamage                                              ;9497DA;
    CLC                                                                  ;9497DD; >.<
    STA.W PeriodicSubDamage                                              ;9497DE;
    LDA.W PeriodicDamage                                                 ;9497E1;
    ADC.W #$0001                                                         ;9497E4;
    STA.W PeriodicDamage                                                 ;9497E7;
    STZ.W SamusXExtraRunSpeed                                            ;9497EA;
    STZ.W SamusXBaseSpeed                                                ;9497ED;
    CLC                                                                  ;9497F0;
    RTS                                                                  ;9497F1;


if !FEATURE_KEEP_UNREFERENCED
;;; $97F2: Unused. Some kind of upwards boost ;;;
UNUSED_SomeKindOfUpwardsBoost_9497F2:
    LDA.W SamusYDirection                                                ;9497F2;
    CMP.W #$0001                                                         ;9497F5;
    BNE .down                                                            ;9497F8;
    LDA.W #$0000                                                         ;9497FA;
    STA.W SamusYSubAcceleration                                          ;9497FD;
    LDA.W #$0002                                                         ;949800;
    STA.W SamusYAcceleration                                             ;949803;
    CLC                                                                  ;949806;
    RTS                                                                  ;949807;

  .down:
    STZ.W SamusYSpeed                                                    ;949808;
    STZ.W SamusYSubSpeed                                                 ;94980B;
    CLC                                                                  ;94980E;
    RTS                                                                  ;94980F;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9810: Unused. Clear carry ;;;
CLCRTS_949810:
    CLC                                                                  ;949810;
    RTS                                                                  ;949811;


;;; $9812: Clear carry. Block inside reaction - spike air - BTS 1 (unused) ;;;
CLCRTS_949812:
; Looks like this block's effect was NOP'd out, although this block is never used anyway
    CLC                                                                  ;949812;
    RTS                                                                  ;949813;

; Damages Samus, kills her jump height, gives her lava X speed physics
    LDY.W #$0000                                                         ;949814;
    LDA.W PeriodicSubDamage                                              ;949817;
    CLC                                                                  ;94981A; >.<
    STA.W PeriodicSubDamage                                              ;94981B;
    LDA.W PeriodicDamage                                                 ;94981E;
    ADC.W #$0001                                                         ;949821;
    STA.W PeriodicDamage                                                 ;949824;
    LDA.W #SamusXSpeedTable_InLavaAcid                                   ;949827;
    STA.W XSpeedTablePointer                                             ;94982A;
    STZ.W SamusYSubAcceleration                                          ;94982D;
    STZ.W SamusYAcceleration                                             ;949830;
    LDA.W SamusYDirection                                                ;949833;
    CMP.W #$0001                                                         ;949836;
    BNE .down                                                            ;949839;
    LDA.W .data1,Y                                                       ;94983B;
    STA.W SamusYSubAcceleration                                          ;94983E;
    LDA.W .data2,Y                                                       ;949841;
    STA.W SamusYAcceleration                                             ;949844;
    CLC                                                                  ;949847;
    RTS                                                                  ;949848;

  .down:
    STZ.W SamusYSpeed                                                    ;949849;
    STZ.W SamusYSubSpeed                                                 ;94984C;
    LDA.W .data3,Y                                                       ;94984F;
    STA.W ExtraSamusYSubDisplacement                                     ;949852;
    LDA.W .data4,Y                                                       ;949855;
    STA.W ExtraSamusYDisplacement                                        ;949858;
    CLC                                                                  ;94985B;
    RTS                                                                  ;94985C;

  .data1:
    dw $0000                                                             ;94985D;
  .data2:
    dw       $0005                                                       ;94985F;
  .data3:
    dw $0000                                                             ;949861;
  .data4:
    dw       $0002                                                       ;949863;


;;; $9865: RTS ;;;
RTS_949865:
    RTS                                                                  ;949865;


;;; $9866: Block inside reaction - spike air - BTS 2 (air spike) ;;;
BlockInsideReaction_SpikeAir_BTS2_AirSpike:
    LDA.W ContactDamageIndex                                             ;949866;
    BNE .return                                                          ;949869;
    LDA.W SamusInvincibilityTimer                                        ;94986B;
    BNE .return                                                          ;94986E;
    LDA.W #$003C                                                         ;949870;
    STA.W SamusInvincibilityTimer                                        ;949873;
    LDA.W #$000A                                                         ;949876;
    STA.W SamusKnockbackTimer                                            ;949879;
    LDA.W PeriodicSubDamage                                              ;94987C;
    CLC                                                                  ;94987F; >.<
    ADC.W #$0000                                                         ;949880;
    STA.W PeriodicSubDamage                                              ;949883;
    LDA.W PeriodicDamage                                                 ;949886;
    ADC.W #$0010                                                         ;949889;
    STA.W PeriodicDamage                                                 ;94988C;
    LDA.W PoseXDirection                                                 ;94988F;
    EOR.W #$000C                                                         ;949892;
    BIT.W #$0008                                                         ;949895;
    BEQ .facingRight                                                     ;949898;
    LDA.W #$0001                                                         ;94989A;
    STA.W KnockbackXDirection                                            ;94989D;
    BRA .return                                                          ;9498A0;

  .facingRight:
    STZ.W KnockbackXDirection                                            ;9498A2;

  .return:
    LDA.W #SamusXSpeedTable_Normal                                       ;9498A5;
    STA.W XSpeedTablePointer                                             ;9498A8;
    RTS                                                                  ;9498AB;


;;; $98AC: Block inside reaction - spike air - jump table ;;;
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


;;; $98CC: Block inside reaction - spike air ;;;
BlockInsideReaction_SpikeAir:
    LDX.W CurrentBlockIndex                                              ;9498CC;
    LDA.L BTS,X                                                          ;9498CF;
    AND.W #$00FF                                                         ;9498D3;
    ASL                                                                  ;9498D6;
    TAX                                                                  ;9498D7;
    JSR.W (BlockInsideReaction_SpikeAir_JumpTable,X)                     ;9498D8;
    RTS                                                                  ;9498DB;


;;; $98DC: Block inside reaction - solid/door/spike/special/shootable/grapple/bombable block ;;;
BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb:
    LDA.W #SamusXSpeedTable_Normal                                       ;9498DC;
    STA.W XSpeedTablePointer                                             ;9498DF;
    RTS                                                                  ;9498E2;


;;; $98E3: Block inside reaction - special air - default ;;;
BlockInsideReaction_SpecialAir_Default:
    LDA.W #SamusXSpeedTable_Normal                                       ;9498E3;
    STA.W XSpeedTablePointer                                             ;9498E6;
    RTS                                                                  ;9498E9;


;;; $98EA: Block inside reaction - special air - BTS 8 (Wrecked Ship treadmill - rightwards) ;;;
BlockInsideReaction_SpecialAir_BTS8_WSTreadmill_Right:
    LDA.W AreaIndex                                                      ;9498EA;
    CMP.W #$0003                                                         ;9498ED;
    BNE .notWreckedShip                                                  ;9498F0;
    LDA.W #$0001                                                         ;9498F2;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;9498F5;
    BCC .return                                                          ;9498F9;

  .notWreckedShip:
    LDA.W SamusYSpeed                                                    ;9498FB;
    BNE .return                                                          ;9498FE;
    STZ.W ExtraSamusXSubDisplacement                                     ;949900;
    LDA.W #$0002                                                         ;949903;
    STA.W ExtraSamusXDisplacement                                        ;949906;

  .return:
    LDA.W #SamusXSpeedTable_Normal                                       ;949909;
    STA.W XSpeedTablePointer                                             ;94990C;
    RTS                                                                  ;94990F;


;;; $9910: Block inside reaction - special air - BTS 9 (Wrecked Ship treadmill - leftwards) ;;;
BlockInsideReaction_SpecialAir_BTS9_WSTreadmill_Left:
    LDA.W AreaIndex                                                      ;949910;
    CMP.W #$0003                                                         ;949913;
    BNE .notWreckedShip                                                  ;949916;
    LDA.W #$0001                                                         ;949918;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;94991B;
    BCC .return                                                          ;94991F;

  .notWreckedShip:
    LDA.W SamusYSpeed                                                    ;949921;
    BNE .return                                                          ;949924;
    STZ.W ExtraSamusXSubDisplacement                                     ;949926;
    LDA.W #$FFFE                                                         ;949929;
    STA.W ExtraSamusXDisplacement                                        ;94992C;

  .return:
    LDA.W #SamusXSpeedTable_Normal                                       ;94992F;
    STA.W XSpeedTablePointer                                             ;949932;
    RTS                                                                  ;949935;


;;; $9936: Block inside reaction - special air - BTS Ah (rightwards treadmill) ;;;
BlockInsideReaction_SpecialAir_BTSA_RightwardsTreadmill:
    STZ.W ExtraSamusXSubDisplacement                                     ;949936;
    LDA.W #$0002                                                         ;949939;
    STA.W ExtraSamusXDisplacement                                        ;94993C;
    LDA.W #SamusXSpeedTable_Normal                                       ;94993F;
    STA.W XSpeedTablePointer                                             ;949942;
    RTS                                                                  ;949945;


;;; $9946: Block inside reaction - special air - BTS Bh (leftwards treadmill) ;;;
BlockInsideReaction_SpecialAir_BTSB_LeftwardsTreadmill:
    STZ.W ExtraSamusXSubDisplacement                                     ;949946;
    LDA.W #$FFFE                                                         ;949949;
    STA.W ExtraSamusXDisplacement                                        ;94994C;
    LDA.W #SamusXSpeedTable_Normal                                       ;94994F;
    STA.W XSpeedTablePointer                                             ;949952;
    RTS                                                                  ;949955;


;;; $9956: Block inside reaction - special air - BTS 46h (scroll PLM trigger) ;;;
BlockInsideReaction_SpecialAir_BTS46_ScrollPLMTrigger:
; This routine is weird, block collision should have already spawned the scroll PLM trigger PLM,
; and the check here means the PLM is only spawned here if Samus' bottom boundary is in a different block than her center,
; which seems a bit random. As far as I can tell, this reaction can just be replaced with the default BlockInsideReaction_SpecialAir_Default

; Note that this routine doesn't set the Samus X speed table pointer,
; so spawning Samus in a scroll PLM will cause calculations to be done with a garbage pointer,
; which can cause Samus to get flung horizontally (notably in quickmet, this never happens in vanilla)
    LDA.W InsideBlockReactionSamusPoint                                  ;949956;
    CMP.W #$0001                                                         ;949959;
    BNE .return                                                          ;94995C;
    LDA.W #PLMEntries_scrollPLMTrigger                                   ;94995E;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949961;

  .return:
    RTS                                                                  ;949965;


;;; $9966: Block inside reaction - special air - jump table ;;;
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


;;; $9A06: Block inside reaction - special air - PLM table ;;;
BlockInsideReaction_SpecialAir_PLMTable:
; Region dependent
  .crateria:
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

  .brinstar:
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

  .norfair:
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

  .wreckedShip:
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

  .maridia:
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

  .tourian:
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

  .ceres:
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

  .debug:
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

  .Pointers:
    dw BlockInsideReaction_SpecialAir_PLMTable_crateria                  ;949B06;
    dw BlockInsideReaction_SpecialAir_PLMTable_brinstar                  ;949B08;
    dw BlockInsideReaction_SpecialAir_PLMTable_norfair                   ;949B0A;
    dw BlockInsideReaction_SpecialAir_PLMTable_wreckedShip               ;949B0C;
    dw BlockInsideReaction_SpecialAir_PLMTable_maridia                   ;949B0E;
    dw BlockInsideReaction_SpecialAir_PLMTable_tourian                   ;949B10;
    dw BlockInsideReaction_SpecialAir_PLMTable_ceres                     ;949B12;
    dw BlockInsideReaction_SpecialAir_PLMTable_debug                     ;949B14;


;;; $9B16: Block inside reaction - special air ;;;
BlockInsideReaction_SpecialAir:
    LDX.W CurrentBlockIndex                                              ;949B16;
    LDA.L BTS-1,X                                                        ;949B19;
    BMI .negativeBTS                                                     ;949B1D;
    AND.W #$FF00                                                         ;949B1F;
    XBA                                                                  ;949B22;
    ASL                                                                  ;949B23;
    TAX                                                                  ;949B24;
    JSR.W (BlockInsideReaction_SpecialAir_JumpTable,X)                   ;949B25;
    RTS                                                                  ;949B28;

  .negativeBTS:
    XBA                                                                  ;949B29;
    AND.W #$007F                                                         ;949B2A;
    ASL                                                                  ;949B2D;
    TAY                                                                  ;949B2E;
    LDA.W AreaIndex                                                      ;949B2F;
    ASL                                                                  ;949B32;
    TAX                                                                  ;949B33;
    LDA.W BlockInsideReaction_SpecialAir_PLMTable_Pointers,X             ;949B34;
    STA.B DP_Temp22                                                      ;949B37;
    LDA.B (DP_Temp22),Y                                                  ;949B39;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949B3B;
    RTS                                                                  ;949B3F;


;;; $9B40: Block inside reaction pointers ;;;
BlockInsideReactionPointers:
    dw BlockInsideReaction_Air_ShootableAir_BombableAir                  ;949B40; *0: Air
    dw BlockInsideReaction_Slope                                         ;949B42;  1: Slope
    dw BlockInsideReaction_SpikeAir                                      ;949B44;  2: Spike air
    dw BlockInsideReaction_SpecialAir                                    ;949B46;  3: Special air
    dw BlockInsideReaction_Air_ShootableAir_BombableAir                  ;949B48; *4: Shootable air
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ;949B4A;  5: Horizontal extension
    dw BlockInsideReaction_Air_ShootableAir_BombableAir                  ;949B4C; *6: Unused air
    dw BlockInsideReaction_Air_ShootableAir_BombableAir                  ;949B4E; *7: Bombable air
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb          ;949B50; *8: Solid block
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb          ;949B52; *9: Door block
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb          ;949B54; *Ah: Spike block
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb          ;949B56; *Bh: Special block
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb          ;949B58; *Ch: Shootable block
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ;949B5A;  Dh: Vertical extension
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb          ;949B5C; *Eh: Grapple block
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb          ;949B5E; *Fh: Bombable block


;;; $9B60: Samus block inside handling ;;;
SamusBlockInsideHandling:
; This routine uses XOR to test if two values are different, which is fine,
; but chaining it a second time ($94:9BEB) doesn't work at all,
; so that branch is very unlikely to be taken >_<;
; Result is that if Samus' top and center are in the same block (and her bottom is in a different block),
; that block's inside reaction will usually be executed twice
; I guess the reaction of the block her top is inside *won't* be executed under some circumstances too
    PHB                                                                  ;949B60;
    PHK                                                                  ;949B61;
    PLB                                                                  ;949B62;
    STZ.W SamusXDecelerationMultiplier                                   ;949B63;
    STZ.W ExtraSamusXSubDisplacement                                     ;949B66;
    STZ.W ExtraSamusXDisplacement                                        ;949B69;
    STZ.W ExtraSamusYSubDisplacement                                     ;949B6C;
    STZ.W ExtraSamusYDisplacement                                        ;949B6F;
    STZ.W InsideBlockReactionSamusPoint                                  ;949B72;
    LDA.W SamusXPosition                                                 ;949B75;
    STA.B DP_Temp1A                                                      ;949B78;
    LDA.W SamusYPosition                                                 ;949B7A;
    CLC                                                                  ;949B7D;
    ADC.W SamusYRadius                                                   ;949B7E;
    DEC                                                                  ;949B81;
    STA.W SamusBottomBoundaryPosition                                    ;949B82;
    STA.B DP_Temp1C                                                      ;949B85;
    STZ.B DP_Temp1E                                                      ;949B87;
    STZ.B DP_Temp20                                                      ;949B89;
    JSR.W CalculateBlockAt_12_1E_1C_20                                   ;949B8B;
    LDA.W CurrentBlockIndex                                              ;949B8E;
    ASL                                                                  ;949B91;
    TAX                                                                  ;949B92;
    LDA.L LevelData+1,X                                                  ;949B93;
    AND.W #$00F0                                                         ;949B97;
    LSR                                                                  ;949B9A;
    LSR                                                                  ;949B9B;
    LSR                                                                  ;949B9C;
    TAX                                                                  ;949B9D;
    JSR.W (BlockInsideReactionPointers,X)                                ;949B9E;
    LDA.W #$0001                                                         ;949BA1;
    STA.W InsideBlockReactionSamusPoint                                  ;949BA4;
    LDA.W SamusYPosition                                                 ;949BA7;
    EOR.W SamusBottomBoundaryPosition                                    ;949BAA;
    AND.W #$FFF0                                                         ;949BAD;
    BEQ .top                                                             ;949BB0;
    LDA.W SamusXPosition                                                 ;949BB2;
    STA.B DP_Temp1A                                                      ;949BB5;
    LDA.W SamusYPosition                                                 ;949BB7;
    STA.B DP_Temp1C                                                      ;949BBA;
    STZ.B DP_Temp1E                                                      ;949BBC;
    STZ.B DP_Temp20                                                      ;949BBE;
    JSR.W CalculateBlockAt_12_1E_1C_20                                   ;949BC0;
    LDA.W CurrentBlockIndex                                              ;949BC3;
    ASL                                                                  ;949BC6;
    TAX                                                                  ;949BC7;
    LDA.L LevelData+1,X                                                  ;949BC8;
    AND.W #$00F0                                                         ;949BCC;
    LSR                                                                  ;949BCF;
    LSR                                                                  ;949BD0;
    LSR                                                                  ;949BD1;
    TAX                                                                  ;949BD2;
    JSR.W (BlockInsideReactionPointers,X)                                ;949BD3;

  .top:
    LDA.W #$0002                                                         ;949BD6;
    STA.W InsideBlockReactionSamusPoint                                  ;949BD9;
    LDA.W SamusYPosition                                                 ;949BDC;
    SEC                                                                  ;949BDF;
    SBC.W SamusYRadius                                                   ;949BE0;
    EOR.W SamusBottomBoundaryPosition                                    ;949BE3;
    AND.W #$FFF0                                                         ;949BE6;
    BEQ .return                                                          ;949BE9;
    EOR.W SamusYPosition                                                 ;949BEB;
    AND.W #$FFF0                                                         ;949BEE;
    BEQ .return                                                          ;949BF1;
    LDA.W SamusXPosition                                                 ;949BF3;
    STA.B DP_Temp1A                                                      ;949BF6;
    LDA.W SamusYPosition                                                 ;949BF8;
    SEC                                                                  ;949BFB;
    SBC.W SamusYRadius                                                   ;949BFC;
    STA.B DP_Temp1C                                                      ;949BFF;
    STZ.B DP_Temp1E                                                      ;949C01;
    STZ.B DP_Temp20                                                      ;949C03;
    JSR.W CalculateBlockAt_12_1E_1C_20                                   ;949C05;
    LDA.W CurrentBlockIndex                                              ;949C08;
    ASL                                                                  ;949C0B;
    TAX                                                                  ;949C0C;
    LDA.L LevelData+1,X                                                  ;949C0D;
    AND.W #$00F0                                                         ;949C11;
    LSR                                                                  ;949C14;
    LSR                                                                  ;949C15;
    LSR                                                                  ;949C16;
    TAX                                                                  ;949C17;
    JSR.W (BlockInsideReactionPointers,X)                                ;949C18;

  .return:
    PLB                                                                  ;949C1B;
    RTL                                                                  ;949C1C;


;;; $9C1D: Calculate block at ([$1A] + [$1E], [$1C] + [$20]) ;;;
CalculateBlockAt_12_1E_1C_20:
; Every call site sets $1E and $20 to zero
; Sets X to zero if block index is calculated successfully (for no reason)
    PHP                                                                  ;949C1D;
    REP #$30                                                             ;949C1E;
    LDA.B DP_Temp1A                                                      ;949C20;
    CLC                                                                  ;949C22;
    ADC.B DP_Temp1E                                                      ;949C23;
    BMI .giveUp                                                          ;949C25;
    CMP.W #$1000                                                         ;949C27;
    BPL .giveUp                                                          ;949C2A;
    AND.W #$FFF0                                                         ;949C2C;
    LSR                                                                  ;949C2F;
    LSR                                                                  ;949C30;
    LSR                                                                  ;949C31;
    LSR                                                                  ;949C32;
    STA.W CollisionVariable                                              ;949C33;
    LDA.B DP_Temp1C                                                      ;949C36;
    CLC                                                                  ;949C38;
    ADC.B DP_Temp20                                                      ;949C39;
    BMI .giveUp                                                          ;949C3B;
    CMP.W #$1000                                                         ;949C3D;
    BPL .giveUp                                                          ;949C40;
    AND.W #$FFF0                                                         ;949C42;
    LSR                                                                  ;949C45;
    LSR                                                                  ;949C46;
    LSR                                                                  ;949C47;
    LSR                                                                  ;949C48;
    TAY                                                                  ;949C49;
    BEQ .zeroIndex                                                       ;949C4A;
    LDX.W #$0000                                                         ;949C4C;
    SEP #$20                                                             ;949C4F;
    LDA.W RoomWidthBlocks                                                ;949C51;
    STA.W $4202                                                          ;949C54;
    STY.W $4203                                                          ;949C57;
    NOP                                                                  ;949C5A;
    NOP                                                                  ;949C5B;
    NOP                                                                  ;949C5C;
    REP #$20                                                             ;949C5D;
    LDA.W $4216                                                          ;949C5F;

  .zeroIndex:
    CLC                                                                  ;949C62;
    ADC.W CollisionVariable                                              ;949C63;
    STA.W CurrentBlockIndex                                              ;949C66;
    BRA .return                                                          ;949C69;

  .giveUp:
    LDA.W #$FFFF                                                         ;949C6B;
    STA.W CurrentBlockIndex                                              ;949C6E;

  .return:
    PLP                                                                  ;949C71;
    RTS                                                                  ;949C72;


;;; $9C73: Determine projectile proto type ;;;
DetermineProjectile_Prototype:
;; Parameters:
;;     X: Projectile index

; Called only as part of BombAndPowerBombExplosionBlockCollisionHandling for determining if a (power) bomb is a normal bomb or not
; Highly likely that this is based on an old model of the projectile system and was supposed to have been entirely abandoned,
; but here we are

; The is a frame after the end of a power bomb explosion where this subroutine is called where the projectile type is 0,
; cause the code at $9C83 to be executed. I doubt this is intentional
    PHP                                                                  ;949C73;
    PHB                                                                  ;949C74;
    PHX                                                                  ;949C75;
    PEA.W $9000                                                          ;949C76;
    PLB                                                                  ;949C79;
    PLB                                                                  ;949C7A;
    LDA.W SamusProjectile_Types+1,X                                      ;949C7B;
    AND.W #$000F                                                         ;949C7E;
    BNE .notBeam                                                         ;949C81;
    LDA.W SamusProjectile_Types,X                                        ;949C83;
    AND.W #$000F                                                         ;949C86;
    STA.B DP_Temp12                                                      ;949C89;
    ASL                                                                  ;949C8B;
    ADC.B DP_Temp12                                                      ;949C8C;
    INC                                                                  ;949C8E;
    INC                                                                  ;949C8F;
    TAX                                                                  ;949C90;
    LDA.W ProtoWeaponConstants_Beams,X                                   ;949C91;
    AND.W #$00FF                                                         ;949C94;
    STA.W ProjectileProtoType                                            ;949C97;
    BRA .return                                                          ;949C9A;

  .notBeam:
    ASL                                                                  ;949C9C;
    INC                                                                  ;949C9D;
    TAX                                                                  ;949C9E;
    LDA.W ProtoWeaponConstants_NonBeams,X                                ;949C9F;
    AND.W #$00FF                                                         ;949CA2;
    STA.W ProjectileProtoType                                            ;949CA5;

  .return:
    PLX                                                                  ;949CA8;
    PLB                                                                  ;949CA9;
    PLP                                                                  ;949CAA;
    RTS                                                                  ;949CAB;


;;; $9CAC: (Power) bomb explosion block collision handling ;;;
BombAndPowerBombExplosionBlockCollisionHandling:
;; Parameters:
;;     X: Projectile index

; Executed for bombs on every frame, not just the frame(s) an explosion is active o_O
    PHP                                                                  ;949CAC;
    PHB                                                                  ;949CAD;
    PHK                                                                  ;949CAE;
    PLB                                                                  ;949CAF;
    REP #$30                                                             ;949CB0;
    JSR.W DetermineProjectile_Prototype                                  ;949CB2;
    LDA.W SamusProjectile_XPositions,X                                   ;949CB5;
    BMI .return                                                          ;949CB8;
    STA.B DP_Temp1A                                                      ;949CBA;
    XBA                                                                  ;949CBC;
    AND.W #$00FF                                                         ;949CBD;
    CMP.W RoomWidthScrolls                                               ;949CC0;
    BPL .return                                                          ;949CC3;
    LDA.W SamusProjectile_YPositions,X                                   ;949CC5;
    BMI .return                                                          ;949CC8;
    STA.B DP_Temp1C                                                      ;949CCA;
    XBA                                                                  ;949CCC;
    AND.W #$00FF                                                         ;949CCD;
    CMP.W RoomHeightScrolls                                              ;949CD0;
    BPL .return                                                          ;949CD3;
    STZ.B DP_Temp1E                                                      ;949CD5;
    STZ.B DP_Temp20                                                      ;949CD7;
    STZ.W CurrentBlockIndex                                              ;949CD9;
    PHX                                                                  ;949CDC;
    JSR.W CalculateBlockAt_12_1E_1C_20                                   ;949CDD;
    PLX                                                                  ;949CE0;
    LDA.W ProjectileProtoType                                            ;949CE1;
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


;;; $9CF4: Bomb explosion block collision handling ;;;
BombExplosionBlockCollisionHandling:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_Variables,X                                    ;949CF4;
    BNE .return                                                          ;949CF7;
    LDA.W SamusProjectile_Types,X                                        ;949CF9;
    BIT.W #$0001                                                         ;949CFC;
    BNE .return                                                          ;949CFF;
    ORA.W #$0001                                                         ;949D01;
    STA.W SamusProjectile_Types,X                                        ;949D04;
    LDA.W CurrentBlockIndex                                              ;949D07;
    CMP.W #$FFFF                                                         ;949D0A;
    BEQ .return                                                          ;949D0D;
    LDY.W #$0000                                                         ;949D0F;
    LDA.W CurrentBlockIndex                                              ;949D12;
    ASL                                                                  ;949D15;
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


;;; $9D33: RTS ;;;
RTS_949D33:
    RTS                                                                  ;949D33;


;;; $9D34: Move block index X one row up ;;;
MoveBlockIndexX_OneBlockUp:
    TXA                                                                  ;949D34;
    SEC                                                                  ;949D35;
    SBC.W RoomWidthBlocks                                                ;949D36;
    SBC.W RoomWidthBlocks                                                ;949D39;
    TAX                                                                  ;949D3C;
    RTS                                                                  ;949D3D;


;;; $9D3E: Move block index X one row down, one column right ;;;
MoveBlockIndexX_OneRowDown_OneColumnRight:
    TXA                                                                  ;949D3E;
    SEC                                                                  ;949D3F;
    ADC.W RoomWidthBlocks                                                ;949D40;
    ADC.W RoomWidthBlocks                                                ;949D43;
    INC                                                                  ;949D46;
    TAX                                                                  ;949D47;
    RTS                                                                  ;949D48;


;;; $9D49: Move block index X two columns left ;;;
MoveBlockIndexX_TwoColumnsLeft:
    DEX                                                                  ;949D49;
    DEX                                                                  ;949D4A;
    DEX                                                                  ;949D4B;
    DEX                                                                  ;949D4C;
    RTS                                                                  ;949D4D;


;;; $9D4E: Move block index X one row down, one column right ;;;
MoveBlockIndexX_OneRowDown_OneColumRight_duplicate:
; Clone of MoveBlockIndexX_OneRowDown_OneColumnRight
    TXA                                                                  ;949D4E;
    SEC                                                                  ;949D4F;
    ADC.W RoomWidthBlocks                                                ;949D50;
    ADC.W RoomWidthBlocks                                                ;949D53;
    INC                                                                  ;949D56;
    TAX                                                                  ;949D57;
    RTS                                                                  ;949D58;


;;; $9D59: Clear carry ;;;
CLCRTS_949D59:
    CLC                                                                  ;949D59;
    RTS                                                                  ;949D5A;


;;; $9D5B: Set carry ;;;
SECRTS_949D5B:
    SEC                                                                  ;949D5B;
    RTS                                                                  ;949D5C;


;;; $9D5D: Spread bomb block reaction - slope ;;;
BombSpreadBlockReaction_Slope:
;; Returns:
;;     Carry: Set if collision detected, clear otherwise
    LDX.W CurrentBlockIndex                                              ;949D5D;
    LDA.L BTS,X                                                          ;949D60;
    AND.W #$001F                                                         ;949D64;
    CMP.W #$0005                                                         ;949D67;
    BCC .returnCollision                                                 ;949D6A;
    JMP.W BlockShotReaction_Horizontal_Slope_NonSquare                   ;949D6C;

  .returnCollision:
    SEC                                                                  ;949D6F;
    RTS                                                                  ;949D70;


;;; $9D71: Block bombed reaction - special block ;;;
BlockBombedReaction_SpecialBlock:
    LDX.W CurrentBlockIndex                                              ;949D71;
    LDA.L BTS-1,X                                                        ;949D74;
    AND.W #$FF00                                                         ;949D78;
    XBA                                                                  ;949D7B;
    BMI .areaDependent                                                   ;949D7C;
    ASL                                                                  ;949D7E;
    TAX                                                                  ;949D7F;
    LDA.W BlockBombedReaction_SpecialBlock_PLMTable_areaIndependent,X    ;949D80;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949D83;
    REP #$40                                                             ;949D87;
    SEC                                                                  ;949D89;
    RTS                                                                  ;949D8A;

  .areaDependent:
    AND.W #$007F                                                         ;949D8B;
    ASL                                                                  ;949D8E;
    TAY                                                                  ;949D8F;
    LDA.W AreaIndex                                                      ;949D90;
    ASL                                                                  ;949D93;
    TAX                                                                  ;949D94;
    LDA.W BlockBombedReaction_SpecialBlock_PLMTable_areaPointers,X       ;949D95;
    STA.B DP_Temp12                                                      ;949D98;
    LDA.B (DP_Temp12),Y                                                  ;949D9A;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949D9C;
    REP #$40                                                             ;949DA0;
    SEC                                                                  ;949DA2;
    RTS                                                                  ;949DA3;


;;; $9DA4: Block bombed reaction - special block - PLM table ;;;
BlockBombedReaction_SpecialBlock_PLMTable:
  .areaIndependent:
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

  .crateria:
    dw PLMEntries_nothing                                                ;949DC4;
    dw PLMEntries_nothing                                                ;949DC6;
    dw PLMEntries_nothing                                                ;949DC8;
    dw PLMEntries_nothing                                                ;949DCA;
    dw PLMEntries_nothing                                                ;949DCC;
    dw PLMEntries_nothing                                                ;949DCE;
    dw PLMEntries_nothing                                                ;949DD0;
    dw PLMEntries_nothing                                                ;949DD2;

  .brinstar:
    dw PLMEntries_nothing                                                ;949DD4;
    dw PLMEntries_nothing                                                ;949DD6;
    dw PLMEntries_BombReaction_SpeedBoostBlock                           ;949DD8;
    dw PLMEntries_BombReaction_SpeedBoostBlock                           ;949DDA;
    dw PLMEntries_BombReaction_SpeedBoostBlock                           ;949DDC;
    dw PLMEntries_BombReaction_SpeedBoostBlock                           ;949DDE;
    dw PLMEntries_nothing                                                ;949DE0;
    dw PLMEntries_nothing                                                ;949DE2;

  .norfair:
    dw PLMEntries_nothing                                                ;949DE4;
    dw PLMEntries_nothing                                                ;949DE6;
    dw PLMEntries_nothing                                                ;949DE8;
    dw PLMEntries_nothing                                                ;949DEA;
    dw PLMEntries_nothing                                                ;949DEC;
    dw PLMEntries_nothing                                                ;949DEE;
    dw PLMEntries_nothing                                                ;949DF0;
    dw PLMEntries_nothing                                                ;949DF2;

  .wreckedShip:
    dw PLMEntries_nothing                                                ;949DF4;
    dw PLMEntries_nothing                                                ;949DF6;
    dw PLMEntries_nothing                                                ;949DF8;
    dw PLMEntries_nothing                                                ;949DFA;
    dw PLMEntries_nothing                                                ;949DFC;
    dw PLMEntries_nothing                                                ;949DFE;
    dw PLMEntries_nothing                                                ;949E00;
    dw PLMEntries_nothing                                                ;949E02;

  .maridia:
    dw PLMEntries_nothing                                                ;949E04;
    dw PLMEntries_nothing                                                ;949E06;
    dw PLMEntries_nothing                                                ;949E08;
    dw PLMEntries_nothing                                                ;949E0A;
    dw PLMEntries_nothing                                                ;949E0C;
    dw PLMEntries_nothing                                                ;949E0E;
    dw PLMEntries_nothing                                                ;949E10;
    dw PLMEntries_nothing                                                ;949E12;

  .tourian:
    dw PLMEntries_nothing                                                ;949E14;
    dw PLMEntries_nothing                                                ;949E16;
    dw PLMEntries_nothing                                                ;949E18;
    dw PLMEntries_nothing                                                ;949E1A;
    dw PLMEntries_nothing                                                ;949E1C;
    dw PLMEntries_nothing                                                ;949E1E;
    dw PLMEntries_nothing                                                ;949E20;
    dw PLMEntries_nothing                                                ;949E22;

  .ceres:
    dw PLMEntries_nothing                                                ;949E24;
    dw PLMEntries_nothing                                                ;949E26;
    dw PLMEntries_nothing                                                ;949E28;
    dw PLMEntries_nothing                                                ;949E2A;
    dw PLMEntries_nothing                                                ;949E2C;
    dw PLMEntries_nothing                                                ;949E2E;
    dw PLMEntries_nothing                                                ;949E30;
    dw PLMEntries_nothing                                                ;949E32;

  .debug:
    dw PLMEntries_nothing                                                ;949E34;
    dw PLMEntries_nothing                                                ;949E36;
    dw PLMEntries_nothing                                                ;949E38;
    dw PLMEntries_nothing                                                ;949E3A;
    dw PLMEntries_nothing                                                ;949E3C;
    dw PLMEntries_nothing                                                ;949E3E;
    dw PLMEntries_nothing                                                ;949E40;
    dw PLMEntries_nothing                                                ;949E42;

  .areaPointers:
    dw BlockBombedReaction_SpecialBlock_PLMTable_crateria                ;949E44;
    dw BlockBombedReaction_SpecialBlock_PLMTable_brinstar                ;949E46;
    dw BlockBombedReaction_SpecialBlock_PLMTable_norfair                 ;949E48;
    dw BlockBombedReaction_SpecialBlock_PLMTable_wreckedShip             ;949E4A;
    dw BlockBombedReaction_SpecialBlock_PLMTable_maridia                 ;949E4C;
    dw BlockBombedReaction_SpecialBlock_PLMTable_tourian                 ;949E4E;
    dw BlockBombedReaction_SpecialBlock_PLMTable_ceres                   ;949E50;
    dw BlockBombedReaction_SpecialBlock_PLMTable_debug                   ;949E52;


;;; $9E54: RTS ;;;
RTS_949E54:
    RTS                                                                  ;949E54;


;;; $9E55: Block shot/bombed/grappled reaction - shootable air ;;;
BlockBombShotGrappledReaction_ShootableAir:
;; Returns:
;;     Carry: Clear. No collision
;;     Overflow: Clear (no effect)
    LDX.W CurrentBlockIndex                                              ;949E55;
    LDA.L BTS-1,X                                                        ;949E58;
    AND.W #$FF00                                                         ;949E5C;
    XBA                                                                  ;949E5F;
    BMI .returnDuplicate                                                 ;949E60;
    ASL                                                                  ;949E62;
    TAX                                                                  ;949E63;
    LDA.W BlockBombShotGrappledReaction_Shootable_PLMTable_noArea,X      ;949E64;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949E67;
    REP #$40                                                             ;949E6B; reset overflow
    CLC                                                                  ;949E6D; >.<
    RTS                                                                  ;949E6E;

  .returnDuplicate:
    REP #$40                                                             ;949E6F; reset overflow
    CLC                                                                  ;949E71; >.<
    RTS                                                                  ;949E72;


;;; $9E73: Block shot/bombed/grappled reaction - shootable block ;;;
BlockBombShotGrappledReaction_ShootableBlock:
;; Returns:
;;     Carry: Set. Unconditional collision
;;     Overflow: Clear. Cancel grapple beam
    LDX.W CurrentBlockIndex                                              ;949E73;
    LDA.L BTS-1,X                                                        ;949E76;
    AND.W #$FF00                                                         ;949E7A;
    XBA                                                                  ;949E7D;
    BMI .areaDependent                                                   ;949E7E;
    ASL                                                                  ;949E80;
    TAX                                                                  ;949E81;
    LDA.W BlockBombShotGrappledReaction_Shootable_PLMTable_noArea,X      ;949E82;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949E85;
    REP #$40                                                             ;949E89;
    SEC                                                                  ;949E8B;
    RTS                                                                  ;949E8C;

  .areaDependent:
    AND.W #$007F                                                         ;949E8D;
    ASL                                                                  ;949E90;
    TAY                                                                  ;949E91;
    LDA.W AreaIndex                                                      ;949E92;
    ASL                                                                  ;949E95;
    TAX                                                                  ;949E96;
    LDA.W BlockBombShotGrappledReaction_Shootable_PLMTable_areaPointer,X ;949E97;
    STA.B DP_Temp12                                                      ;949E9A;
    LDA.B (DP_Temp12),Y                                                  ;949E9C;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;949E9E;
    REP #$40                                                             ;949EA2;
    SEC                                                                  ;949EA4;
    RTS                                                                  ;949EA5;


;;; $9EA6: Block shot/bombed/grappled reaction - shootable - PLM table ;;;
BlockBombShotGrappledReaction_Shootable_PLMTable:
  .noArea:
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

  .crateria:
    dw PLMEntries_nothing                                                ;949F46;
    dw PLMEntries_nothing                                                ;949F48;
    dw PLMEntries_nothing                                                ;949F4A;
    dw PLMEntries_nothing                                                ;949F4C;
    dw PLMEntries_nothing                                                ;949F4E;
    dw PLMEntries_nothing                                                ;949F50;
    dw PLMEntries_nothing                                                ;949F52;
    dw PLMEntries_nothing                                                ;949F54;

  .brinstar:
    dw PLMEntries_nothing                                                ;949F56;
    dw PLMEntries_nothing                                                ;949F58;
    dw PLMEntries_nothing                                                ;949F5A;
    dw PLMEntries_nothing                                                ;949F5C;
    dw PLMEntries_nothing                                                ;949F5E;
    dw PLMEntries_nothing                                                ;949F60;
    dw PLMEntries_nothing                                                ;949F62;
    dw PLMEntries_nothing                                                ;949F64;

  .norfair:
    dw PLMEntries_nothing                                                ;949F66;
    dw PLMEntries_nothing                                                ;949F68;
    dw PLMEntries_nothing                                                ;949F6A;
    dw PLMEntries_nothing                                                ;949F6C;
    dw PLMEntries_nothing                                                ;949F6E;
    dw PLMEntries_nothing                                                ;949F70;
    dw PLMEntries_nothing                                                ;949F72;
    dw PLMEntries_nothing                                                ;949F74;

  .wreckedShip:
    dw PLMEntries_nothing                                                ;949F76;
    dw PLMEntries_nothing                                                ;949F78;
    dw PLMEntries_nothing                                                ;949F7A;
    dw PLMEntries_nothing                                                ;949F7C;
    dw PLMEntries_nothing                                                ;949F7E;
    dw PLMEntries_nothing                                                ;949F80;
    dw PLMEntries_nothing                                                ;949F82;
    dw PLMEntries_nothing                                                ;949F84;

  .maridia:
    dw PLMEntries_nothing                                                ;949F86;
    dw PLMEntries_nothing                                                ;949F88;
    dw PLMEntries_nothing                                                ;949F8A;
    dw PLMEntries_nothing                                                ;949F8C;
    dw PLMEntries_nothing                                                ;949F8E;
    dw PLMEntries_nothing                                                ;949F90;
    dw PLMEntries_nothing                                                ;949F92;
    dw PLMEntries_nothing                                                ;949F94;

  .tourian:
    dw PLMEntries_nothing                                                ;949F96;
    dw PLMEntries_nothing                                                ;949F98;
    dw PLMEntries_nothing                                                ;949F9A;
    dw PLMEntries_nothing                                                ;949F9C;
    dw PLMEntries_nothing                                                ;949F9E;
    dw PLMEntries_nothing                                                ;949FA0;
    dw PLMEntries_nothing                                                ;949FA2;
    dw PLMEntries_nothing                                                ;949FA4;

  .ceres:
    dw PLMEntries_nothing                                                ;949FA6;
    dw PLMEntries_nothing                                                ;949FA8;
    dw PLMEntries_nothing                                                ;949FAA;
    dw PLMEntries_nothing                                                ;949FAC;
    dw PLMEntries_nothing                                                ;949FAE;
    dw PLMEntries_nothing                                                ;949FB0;
    dw PLMEntries_nothing                                                ;949FB2;
    dw PLMEntries_nothing                                                ;949FB4;

  .debug:
    dw PLMEntries_nothing                                                ;949FB6;
    dw PLMEntries_nothing                                                ;949FB8;
    dw PLMEntries_nothing                                                ;949FBA;
    dw PLMEntries_nothing                                                ;949FBC;
    dw PLMEntries_nothing                                                ;949FBE;
    dw PLMEntries_nothing                                                ;949FC0;
    dw PLMEntries_nothing                                                ;949FC2;
    dw PLMEntries_nothing                                                ;949FC4;

  .areaPointer:
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_crateria         ;949FC6;
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_brinstar         ;949FC8;
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_norfair          ;949FCA;
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_wreckedShip      ;949FCC;
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_maridia          ;949FCE;
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_tourian          ;949FD0;
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_ceres            ;949FD2;
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_debug            ;949FD4;


;;; $9FD6: Block shot/bombed/grappled reaction - bombable air ;;;
BlockShotBombedGrappledReaction_BombableAir:
;; Returns:
;;     Carry: Clear. No collision
;;     Overflow: Clear (no effect)
    LDX.W CurrentBlockIndex                                              ;949FD6;
    LDA.L BTS-1,X                                                        ;949FD9;
    AND.W #$FF00                                                         ;949FDD;
    XBA                                                                  ;949FE0;
    BMI .returnDuplicate                                                 ;949FE1;
    ASL                                                                  ;949FE3;
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


;;; $9FF4: Block shot/bombed/grappled reaction - bombable block ;;;
BlockShotBombedGrappledReaction_BombableBlock:
;; Returns:
;;     Carry: Set. Unconditional collision
;;     Overflow: Clear. Cancel grapple beam
    LDX.W CurrentBlockIndex                                              ;949FF4;
    LDA.L BTS-1,X                                                        ;949FF7;
    AND.W #$FF00                                                         ;949FFB;
    XBA                                                                  ;949FFE;
    BMI .returnDuplicate                                                 ;949FFF;
    ASL                                                                  ;94A001;
    TAX                                                                  ;94A002;
    LDA.W BlockShotBombedGrappledReaction_Bombable_PLMTable,X            ;94A003;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;94A006;
    REP #$40                                                             ;94A00A; reset overflow
    SEC                                                                  ;94A00C;
    RTS                                                                  ;94A00D;

  .returnDuplicate:
    REP #$40                                                             ;94A00E; reset overflow
    SEC                                                                  ;94A010;
    RTS                                                                  ;94A011;


;;; $A012: Block shot/bombed/grappled reaction - bombable - PLM table ;;;
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


;;; $A032: Block bombed reaction pointers ;;;
BlockBombedReactionPointers:
    dw CLCRTS_949D59                                                     ;94A032;  0: Air
    dw CLCRTS_949D59                                                     ;94A034;  1: Slope
    dw CLCRTS_949D59                                                     ;94A036;  2: Spike air
    dw CLCRTS_949D59                                                     ;94A038;  3: Special air
    dw BlockBombShotGrappledReaction_ShootableAir                        ;94A03A; *4: Shootable air
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ;94A03C; *5: Horizontal extension
    dw CLCRTS_949D59                                                     ;94A03E;  6: Unused air
    dw BlockShotBombedGrappledReaction_BombableAir                       ;94A040; *7: Bombable air
    dw SECRTS_949D5B                                                     ;94A042;  8: Solid block
    dw SECRTS_949D5B                                                     ;94A044;  9: Door block
    dw SECRTS_949D5B                                                     ;94A046;  Ah: Spike block
    dw BlockBombedReaction_SpecialBlock                                  ;94A048; *Bh: Special block
    dw BlockBombShotGrappledReaction_ShootableBlock                      ;94A04A; *Ch: Shootable block
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ;94A04C; *Dh: Vertical extension
    dw SECRTS_949D5B                                                     ;94A04E;  Eh: Grapple block
    dw BlockShotBombedGrappledReaction_BombableBlock                     ;94A050; *Fh: Bombable block


;;; $A052: Block bombed reaction ;;;
BlockBombedReaction:
;; Parameters:
;;     X: Block index
    PHX                                                                  ;94A052;
    STX.W CurrentBlockIndex                                              ;94A053;
    LSR.W CurrentBlockIndex                                              ;94A056;
    LDA.L LevelData,X                                                    ;94A059;
    AND.W #$F000                                                         ;94A05D;
    XBA                                                                  ;94A060;
    LSR                                                                  ;94A061;
    LSR                                                                  ;94A062;
    LSR                                                                  ;94A063;
    TAX                                                                  ;94A064;
    JSR.W (BlockBombedReactionPointers,X)                                ;94A065;
    PLX                                                                  ;94A068;
    RTS                                                                  ;94A069;


;;; $A06A: Power bomb explosion block collision handling ;;;
PowerBombExplosionBlockCollisionHandling:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_Variables,X                                    ;94A06A;
    BEQ .zero                                                            ;94A06D;
    BPL .return                                                          ;94A06F;
    STZ.W SamusProjectile_Variables,X                                    ;94A071;

  .return:
    RTS                                                                  ;94A074;

  .zero:
    LDA.W SamusProjectile_PowerBombExplosionRadius+1                     ;94A075;
    AND.W #$00FF                                                         ;94A078;
    STA.B DP_Temp12                                                      ;94A07B;
    ASL                                                                  ;94A07D;
    ADC.B DP_Temp12                                                      ;94A07E;
    LSR                                                                  ;94A080;
    LSR                                                                  ;94A081;
    STA.B DP_Temp14                                                      ;94A082;
    LDA.W SamusProjectile_PowerBombExplosionXPosition                    ;94A084;
    SEC                                                                  ;94A087;
    SBC.B DP_Temp12                                                      ;94A088;
    BPL .set16                                                           ;94A08A;
    LDA.W #$0000                                                         ;94A08C;

  .set16:
    LSR                                                                  ;94A08F;
    LSR                                                                  ;94A090;
    LSR                                                                  ;94A091;
    LSR                                                                  ;94A092;
    STA.B DP_Temp16                                                      ;94A093;
    LDA.W SamusProjectile_PowerBombExplosionXPosition                    ;94A095;
    CLC                                                                  ;94A098;
    ADC.B DP_Temp12                                                      ;94A099;
    LSR                                                                  ;94A09B;
    LSR                                                                  ;94A09C;
    LSR                                                                  ;94A09D;
    LSR                                                                  ;94A09E;
    CMP.W RoomWidthBlocks                                                ;94A09F;
    BCC .set18                                                           ;94A0A2;
    LDA.W RoomWidthBlocks                                                ;94A0A4;
    DEC                                                                  ;94A0A7;

  .set18:
    STA.B DP_Temp18                                                      ;94A0A8;
    LDA.W SamusProjectile_PowerBombExplosionYPosition                    ;94A0AA;
    SEC                                                                  ;94A0AD;
    SBC.B DP_Temp14                                                      ;94A0AE;
    BPL .set1A                                                           ;94A0B0;
    LDA.W #$0000                                                         ;94A0B2;

  .set1A:
    LSR                                                                  ;94A0B5;
    LSR                                                                  ;94A0B6;
    LSR                                                                  ;94A0B7;
    LSR                                                                  ;94A0B8;
    STA.B DP_Temp1A                                                      ;94A0B9;
    LDA.W SamusProjectile_PowerBombExplosionYPosition                    ;94A0BB;
    CLC                                                                  ;94A0BE;
    ADC.B DP_Temp14                                                      ;94A0BF;
    LSR                                                                  ;94A0C1;
    LSR                                                                  ;94A0C2;
    LSR                                                                  ;94A0C3;
    LSR                                                                  ;94A0C4;
    CMP.W RoomHeightBlocks                                               ;94A0C5;
    BCC .set1C                                                           ;94A0C8;
    LDA.W RoomHeightBlocks                                               ;94A0CA;
    DEC                                                                  ;94A0CD;

  .set1C:
    STA.B DP_Temp1C                                                      ;94A0CE;
    LDA.B DP_Temp15                                                      ;94A0D0;
    AND.W #$FF00                                                         ;94A0D2;
    ORA.B DP_Temp1A                                                      ;94A0D5;
    PHA                                                                  ;94A0D7;
    JSR.W PowerBombExplosionBlockCollisionHandling_Row                   ;94A0D8;
    PLA                                                                  ;94A0DB;
    JSR.W PowerBombExplosionBlockCollisionHandling_Column                ;94A0DC;
    LDA.B DP_Temp15                                                      ;94A0DF;
    AND.W #$FF00                                                         ;94A0E1;
    ORA.B DP_Temp1C                                                      ;94A0E4;
    JSR.W PowerBombExplosionBlockCollisionHandling_Row                   ;94A0E6;
    LDA.B DP_Temp17                                                      ;94A0E9;
    AND.W #$FF00                                                         ;94A0EB;
    ORA.B DP_Temp1A                                                      ;94A0EE;
    JSR.W PowerBombExplosionBlockCollisionHandling_Column                ;94A0F0;
    RTS                                                                  ;94A0F3;


;;; $A0F4: Power bomb explosion block collision handling - row ;;;
PowerBombExplosionBlockCollisionHandling_Row:
;; Parameters:
;;     A low: Origin Y block
;;     A high: Origin X block
;;     $16: Power bomb left boundary
;;     $18: Power bomb right boundary
    SEP #$20                                                             ;94A0F4;
    STA.W $4202                                                          ;94A0F6;
    LDA.W RoomWidthBlocks                                                ;94A0F9;
    STA.W $4203                                                          ;94A0FC;
    LDA.B #$00                                                           ;94A0FF;
    XBA                                                                  ;94A101;
    REP #$31                                                             ;94A102; clear carry
    ADC.W $4216                                                          ;94A104;
    ASL                                                                  ;94A107;
    TAX                                                                  ;94A108;
    LDA.B DP_Temp18                                                      ;94A109;
    SEC                                                                  ;94A10B;
    SBC.B DP_Temp16                                                      ;94A10C;
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


;;; $A11A: Power bomb explosion block collision handling - column ;;;
PowerBombExplosionBlockCollisionHandling_Column:
;; Parameters:
;;     A low: Origin Y block
;;     A high: Origin X block
;;     $1A: Power bomb top boundary
;;     $1C: Power bomb bottom boundary
    SEP #$20                                                             ;94A11A;
    STA.W $4202                                                          ;94A11C;
    LDA.W RoomWidthBlocks                                                ;94A11F;
    STA.W $4203                                                          ;94A122;
    LDA.B #$00                                                           ;94A125;
    XBA                                                                  ;94A127;
    REP #$31                                                             ;94A128; clear carry
    ADC.W $4216                                                          ;94A12A;
    ASL                                                                  ;94A12D;
    TAX                                                                  ;94A12E;
    LDA.B DP_Temp1C                                                      ;94A12F;
    SEC                                                                  ;94A131;
    SBC.B DP_Temp1A                                                      ;94A132;
    TAY                                                                  ;94A134;

  .loop:
    PHY                                                                  ;94A135;
    JSR.W BlockBombedReaction                                            ;94A136;
    PLY                                                                  ;94A139;
    TXA                                                                  ;94A13A;
    CLC                                                                  ;94A13B;
    ADC.W RoomWidthBlocks                                                ;94A13C;
    ADC.W RoomWidthBlocks                                                ;94A13F;
    TAX                                                                  ;94A142;
    DEY                                                                  ;94A143;
    BPL .loop                                                            ;94A144;
    RTS                                                                  ;94A146;


;;; $A147: Block shot reaction - horizontal - slope ;;;
BlockShotReaction_Horizontal_Slope:
;; Parameters:
;;     $1A: Projectile Y span - 1
;;     $1C: Target boundary (left/right depending on sign of projectile velocity)
;;     $1E: (Super) missile flag
;;     $26: Number of blocks left to check - 1
;;     $28: Target number of collisions - 1
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $26: Remaining number of blocks left to check - 1
;;     $28: Remaining target number of collisions - 1
    LDX.W CurrentBlockIndex                                              ;94A147;
    LDA.L BTS,X                                                          ;94A14A;
    AND.W #$001F                                                         ;94A14E;
    CMP.W #$0005                                                         ;94A151;
    BCC .gotoSquare                                                      ;94A154;
    JMP.W BlockShotReaction_Horizontal_Slope_NonSquare                   ;94A156;

  .gotoSquare:
    JMP.W BlockShotReaction_Horizontal_Slope_Square                      ;94A159;


;;; $A15C: Unused. Set carry ;;;
SECRTS_94A15C:
    SEC                                                                  ;94A15C;
    RTS                                                                  ;94A15D;


;;; $A15E: Block shot reaction - vertical - slope ;;;
BlockShotReaction_Vertical_Slope:
;; Parameters:
;;     $1A: Projectile Y span - 1
;;     $1C: Target boundary (left/right depending on sign of projectile velocity)
;;     $1E: (Super) missile flag
;;     $26: Number of blocks left to check - 1
;;     $28: Target number of collisions - 1
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $26: Remaining number of blocks left to check - 1
;;     $28: Remaining target number of collisions - 1
    LDX.W CurrentBlockIndex                                              ;94A15E;
    LDA.L BTS,X                                                          ;94A161;
    AND.W #$001F                                                         ;94A165;
    CMP.W #$0005                                                         ;94A168;
    BCC .gotoSquare                                                      ;94A16B;
    JMP.W BlockShotReaction_Vertical_Slope_NonSquare                     ;94A16D;

  .gotoSquare:
    JMP.W BlockShotReaction_Vertical_Slope_Square                        ;94A170;


;;; $A173: Unused. Set carry ;;;
SECRTS_94A173:
    SEC                                                                  ;94A173;
    RTS                                                                  ;94A174;


;;; $A175: Block shot reaction pointers - horizontal ;;;
BlockShotReactionPointers_Horizontal:
    dw CLCRTS_949D59                                                     ;94A175;  0: Air
    dw BlockShotReaction_Horizontal_Slope                                ;94A177; *1: Slope
    dw CLCRTS_949D59                                                     ;94A179;  2: Spike air
    dw CLCRTS_949D59                                                     ;94A17B;  3: Special air
    dw BlockBombShotGrappledReaction_ShootableAir                        ;94A17D; *4: Shootable air
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ;94A17F; *5: Horizontal extension
    dw CLCRTS_949D59                                                     ;94A181;  6: Unused air
    dw BlockShotBombedGrappledReaction_BombableAir                       ;94A183; *7: Bombable air
    dw SECRTS_949D5B                                                     ;94A185;  8: Solid block
    dw SECRTS_949D5B                                                     ;94A187;  9: Door block
    dw SECRTS_949D5B                                                     ;94A189;  Ah: Spike block
    dw SECRTS_949D5B                                                     ;94A18B;  Bh: Special block
    dw BlockBombShotGrappledReaction_ShootableBlock                      ;94A18D; *Ch: Shootable block
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ;94A18F; *Dh: Vertical extension
    dw SECRTS_949D5B                                                     ;94A191;  Eh: Grapple block
    dw BlockShotBombedGrappledReaction_BombableBlock                     ;94A193; *Fh: Bombable block


;;; $A195: Block shot reaction pointers - vertical ;;;
BlockShotReactionPointers_Vertical:
; Same as horizontal pointers except for slope
    dw CLCRTS_949D59                                                     ;94A195;  0: Air
    dw BlockShotReaction_Vertical_Slope                                  ;94A197; *1: Slope
    dw CLCRTS_949D59                                                     ;94A199;  2: Spike air
    dw CLCRTS_949D59                                                     ;94A19B;  3: Special air
    dw BlockBombShotGrappledReaction_ShootableAir                        ;94A19D; *4: Shootable air
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ;94A19F; *5: Horizontal extension
    dw CLCRTS_949D59                                                     ;94A1A1;  6: Unused air
    dw BlockShotBombedGrappledReaction_BombableAir                       ;94A1A3; *7: Bombable air
    dw SECRTS_949D5B                                                     ;94A1A5;  8: Solid block
    dw SECRTS_949D5B                                                     ;94A1A7;  9: Door block
    dw SECRTS_949D5B                                                     ;94A1A9;  Ah: Spike block
    dw SECRTS_949D5B                                                     ;94A1AB;  Bh: Special block
    dw BlockBombShotGrappledReaction_ShootableBlock                      ;94A1AD; *Ch: Shootable block
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ;94A1AF; *Dh: Vertical extension
    dw SECRTS_949D5B                                                     ;94A1B1;  Eh: Grapple block
    dw BlockShotBombedGrappledReaction_BombableBlock                     ;94A1B3; *Fh: Bombable block


;;; $A1B5: Block shot reaction - horizontal ;;;
BlockShotReaction_Horizontal:
;; Parameters:
;;     X: Block index
;;     $1A: Projectile Y span - 1
;;     $1C: Target boundary (left/right depending on sign of projectile velocity)
;;     $1E: (Super) missile flag
;;     $26: Number of blocks left to check - 1
;;     $28: Target number of collisions - 1
;; Returns:
;;     Carry: set if collided with block, clear otherwise
;;     $26: Remaining number of blocks left to check - 1
;;     $28: Remaining target number of collisions - 1
    CPX.W LevelDataSize                                                  ;94A1B5;
    BCS .return                                                          ;94A1B8;
    PHX                                                                  ;94A1BA;
    STX.W CurrentBlockIndex                                              ;94A1BB;
    LSR.W CurrentBlockIndex                                              ;94A1BE;
    LDA.L LevelData,X                                                    ;94A1C1;
    AND.W #$F000                                                         ;94A1C5;
    XBA                                                                  ;94A1C8;
    LSR                                                                  ;94A1C9;
    LSR                                                                  ;94A1CA;
    LSR                                                                  ;94A1CB;
    TAX                                                                  ;94A1CC;
    JSR.W (BlockShotReactionPointers_Horizontal,X)                       ;94A1CD;
    BCC .blockCollision                                                  ;94A1D0;
    DEC.B DP_Temp28                                                      ;94A1D2;

  .blockCollision:
    PLX                                                                  ;94A1D4;

  .return:
    RTS                                                                  ;94A1D5;


;;; $A1D6: Block shot reaction - vertical ;;;
BlockShotReaction_Vertical:
;; Parameters:
;;     X: Block index
;;     $1A: Projectile X span - 1
;;     $1C: Target boundary (top/bottom depending on sign of projectile velocity)
;;     $1E: (Super) missile flag
;;     $26: Number of blocks left to check - 1
;;     $28: Target number of collisions - 1
;; Returns:
;;     Carry: set if collided with block, clear otherwise
;;     $26: Remaining number of blocks left to check - 1
;;     $28: Remaining target number of collisions - 1
    CPX.W LevelDataSize                                                  ;94A1D6;
    BCS .return                                                          ;94A1D9;
    PHX                                                                  ;94A1DB;
    STX.W CurrentBlockIndex                                              ;94A1DC;
    LSR.W CurrentBlockIndex                                              ;94A1DF;
    LDA.L LevelData,X                                                    ;94A1E2;
    AND.W #$F000                                                         ;94A1E6;
    XBA                                                                  ;94A1E9;
    LSR                                                                  ;94A1EA;
    LSR                                                                  ;94A1EB;
    LSR                                                                  ;94A1EC;
    TAX                                                                  ;94A1ED;
    JSR.W (BlockShotReactionPointers_Vertical,X)                         ;94A1EE;
    BCC .blockCollision                                                  ;94A1F1;
    DEC.B DP_Temp28                                                      ;94A1F3;

  .blockCollision:
    PLX                                                                  ;94A1F5;

  .return:
    RTS                                                                  ;94A1F6;


;;; $A1F7: Calculate projectile Y block span ;;;
CalculateProjectileYBlockSpan:
;; Returns:
;;     $1A: Projectile Y span - 1
;;     $26: Number of blocks left to check - 1
;;     $28: Target number of collisions - 1

; $1A = $26 = $28 = (projectile bottom boundary) / 10h - (projectile top boundary) / 10h
    LDA.W SamusProjectile_YPositions,X                                   ;94A1F7;
    SEC                                                                  ;94A1FA;
    SBC.W SamusProjectile_YRadii,X                                       ;94A1FB;
    AND.W #$FFF0                                                         ;94A1FE;
    STA.B DP_Temp26                                                      ;94A201;
    LDA.W SamusProjectile_YPositions,X                                   ;94A203;
    CLC                                                                  ;94A206;
    ADC.W SamusProjectile_YRadii,X                                       ;94A207;
    DEC                                                                  ;94A20A;
    SEC                                                                  ;94A20B;
    SBC.B DP_Temp26                                                      ;94A20C;
    LSR                                                                  ;94A20E;
    LSR                                                                  ;94A20F;
    LSR                                                                  ;94A210;
    LSR                                                                  ;94A211;
    STA.B DP_Temp26                                                      ;94A212;
    STA.B DP_Temp1A                                                      ;94A214;
    STA.B DP_Temp28                                                      ;94A216;
    RTS                                                                  ;94A218;


;;; $A219: Calculate projectile X block span ;;;
CalculateProjectileXBlockSpan:
;; Returns:
;;     $1A: Projectile X span - 1
;;     $26: Number of blocks left to check - 1
;;     $28: Target number of collisions - 1

; $1A = $26 = $28 = (projectile right boundary) / 10h - (projectile left boundary) / 10h
    LDA.W SamusProjectile_XPositions,X                                   ;94A219;
    SEC                                                                  ;94A21C;
    SBC.W SamusProjectile_XRadii,X                                       ;94A21D;
    AND.W #$FFF0                                                         ;94A220;
    STA.B DP_Temp26                                                      ;94A223;
    LDA.W SamusProjectile_XPositions,X                                   ;94A225;
    CLC                                                                  ;94A228;
    ADC.W SamusProjectile_XRadii,X                                       ;94A229;
    DEC                                                                  ;94A22C;
    SEC                                                                  ;94A22D;
    SBC.B DP_Temp26                                                      ;94A22E;
    LSR                                                                  ;94A230;
    LSR                                                                  ;94A231;
    LSR                                                                  ;94A232;
    LSR                                                                  ;94A233;
    STA.B DP_Temp26                                                      ;94A234;
    STA.B DP_Temp1A                                                      ;94A236;
    STA.B DP_Temp28                                                      ;94A238;
    RTS                                                                  ;94A23A;


;;; $A23B: Move beam horizontally - no wave beam ;;;
MoveBeamHorizontally_NoWaveBeam:
;; Parameters:
;;     X: Projectile index
;; Returns:
;;     Carry: set if collided with block, clear otherwise
    PHB                                                                  ;94A23B;
    PHX                                                                  ;94A23C;
    PHK                                                                  ;94A23D;
    PLB                                                                  ;94A23E;
    STZ.B DP_Temp1E                                                      ;94A23F;
    STZ.B DP_Temp12                                                      ;94A241;
    STZ.B DP_Temp14                                                      ;94A243;
    LDA.W SamusProjectile_XVelocities,X                                  ;94A245;
    BPL +                                                                ;94A248;
    DEC.B DP_Temp14                                                      ;94A24A;

+   STA.B DP_Temp13                                                      ;94A24C;
    JSR.W CalculateProjectileYBlockSpan                                  ;94A24E;
    LDA.W SamusProjectile_YPositions,X                                   ;94A251;
    SEC                                                                  ;94A254;
    SBC.W SamusProjectile_YRadii,X                                       ;94A255;
    LSR                                                                  ;94A258;
    LSR                                                                  ;94A259;
    LSR                                                                  ;94A25A;
    LSR                                                                  ;94A25B;
    SEP #$20                                                             ;94A25C;
    STA.W $4202                                                          ;94A25E;
    LDA.W RoomWidthBlocks                                                ;94A261;
    STA.W $4203                                                          ;94A264;
    REP #$20                                                             ;94A267;
    LDA.W SamusProjectile_XSubPositions,X                                ;94A269;
    CLC                                                                  ;94A26C;
    ADC.B DP_Temp12                                                      ;94A26D;
    STA.W SamusProjectile_XSubPositions,X                                ;94A26F;
    STA.B DP_Temp16                                                      ;94A272;
    LDA.W SamusProjectile_XPositions,X                                   ;94A274;
    ADC.B DP_Temp14                                                      ;94A277;
    STA.W SamusProjectile_XPositions,X                                   ;94A279;
    STA.B DP_Temp18                                                      ;94A27C;
    BIT.B DP_Temp14                                                      ;94A27E;
    BMI .negative14                                                      ;94A280;
    CLC                                                                  ;94A282;
    ADC.W SamusProjectile_XRadii,X                                       ;94A283;
    DEC                                                                  ;94A286;
    BRA +                                                                ;94A287;

  .negative14:
    SEC                                                                  ;94A289;
    SBC.W SamusProjectile_XRadii,X                                       ;94A28A;

+   STA.B DP_Temp1C                                                      ;94A28D;
    LSR                                                                  ;94A28F;
    LSR                                                                  ;94A290;
    LSR                                                                  ;94A291;
    LSR                                                                  ;94A292;
    CLC                                                                  ;94A293;
    ADC.W $4216                                                          ;94A294;
    ASL                                                                  ;94A297;
    TAX                                                                  ;94A298;
    LDA.B DP_Temp26                                                      ;94A299;
    CMP.W #$0010                                                         ;94A29B;
    BPL .noCollision                                                     ;94A29E;
    LDA.B DP_Temp1D                                                      ;94A2A0;
    AND.W #$00FF                                                         ;94A2A2;
    CMP.W RoomWidthScrolls                                               ;94A2A5;
    BPL .noCollision                                                     ;94A2A8;

  .loop:
    JSR.W BlockShotReaction_Horizontal                                   ;94A2AA;
    TXA                                                                  ;94A2AD;
    CLC                                                                  ;94A2AE;
    ADC.W RoomWidthBlocks                                                ;94A2AF;
    ADC.W RoomWidthBlocks                                                ;94A2B2;
    TAX                                                                  ;94A2B5;
    DEC.B DP_Temp26                                                      ;94A2B6;
    BPL .loop                                                            ;94A2B8;
    LDA.B DP_Temp28                                                      ;94A2BA;
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


;;; $A2CA: Move beam vertically - no wave beam ;;;
MoveBeamVertically_NoWaveBeam:
;; Parameters:
;;     X: Projectile index
;; Returns:
;;     Carry: set if collided with block, clear otherwise
    PHB                                                                  ;94A2CA;
    PHX                                                                  ;94A2CB;
    PHK                                                                  ;94A2CC;
    PLB                                                                  ;94A2CD;
    STZ.B DP_Temp1E                                                      ;94A2CE;
    STZ.B DP_Temp12                                                      ;94A2D0;
    STZ.B DP_Temp14                                                      ;94A2D2;
    LDA.W SamusProjectile_YVelocities,X                                  ;94A2D4;
    BPL +                                                                ;94A2D7;
    DEC.B DP_Temp14                                                      ;94A2D9;

+   STA.B DP_Temp13                                                      ;94A2DB;
    JSR.W CalculateProjectileXBlockSpan                                  ;94A2DD;
    LDA.W SamusProjectile_YSubPositions,X                                ;94A2E0;
    CLC                                                                  ;94A2E3;
    ADC.B DP_Temp12                                                      ;94A2E4;
    STA.W SamusProjectile_YSubPositions,X                                ;94A2E6;
    STA.B DP_Temp16                                                      ;94A2E9;
    LDA.W SamusProjectile_YPositions,X                                   ;94A2EB;
    ADC.B DP_Temp14                                                      ;94A2EE;
    STA.W SamusProjectile_YPositions,X                                   ;94A2F0;
    STA.B DP_Temp18                                                      ;94A2F3;
    BIT.B DP_Temp14                                                      ;94A2F5;
    BMI .negative14                                                      ;94A2F7;
    CLC                                                                  ;94A2F9;
    ADC.W SamusProjectile_YRadii,X                                       ;94A2FA;
    DEC                                                                  ;94A2FD;
    BRA +                                                                ;94A2FE;

  .negative14:
    SEC                                                                  ;94A300;
    SBC.W SamusProjectile_YRadii,X                                       ;94A301;

+   STA.B DP_Temp1C                                                      ;94A304;
    LSR                                                                  ;94A306;
    LSR                                                                  ;94A307;
    LSR                                                                  ;94A308;
    LSR                                                                  ;94A309;
    SEP #$20                                                             ;94A30A;
    STA.W $4202                                                          ;94A30C;
    LDA.W RoomWidthBlocks                                                ;94A30F;
    STA.W $4203                                                          ;94A312;
    REP #$20                                                             ;94A315;
    LDA.W SamusProjectile_XPositions,X                                   ;94A317;
    SEC                                                                  ;94A31A;
    SBC.W SamusProjectile_XRadii,X                                       ;94A31B;
    LSR                                                                  ;94A31E;
    LSR                                                                  ;94A31F;
    LSR                                                                  ;94A320;
    LSR                                                                  ;94A321;
    CLC                                                                  ;94A322;
    ADC.W $4216                                                          ;94A323;
    ASL                                                                  ;94A326;
    TAX                                                                  ;94A327;
    LDA.B DP_Temp26                                                      ;94A328;
    CMP.W #$0010                                                         ;94A32A;
    BPL .noCollision                                                     ;94A32D;
    LDA.B DP_Temp1D                                                      ;94A32F;
    AND.W #$00FF                                                         ;94A331;
    CMP.W RoomHeightScrolls                                              ;94A334;
    BPL .noCollision                                                     ;94A337;

  .loop:
    JSR.W BlockShotReaction_Vertical                                     ;94A339;
    INX                                                                  ;94A33C;
    INX                                                                  ;94A33D;
    DEC.B DP_Temp26                                                      ;94A33E;
    BPL .loop                                                            ;94A340;
    LDA.B DP_Temp28                                                      ;94A342;
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


;;; $A352: Move beam horizontally - wave beam ;;;
MoveBeamHorizontally_WaveBeam:
;; Parameters:
;;     X: Projectile index
;; Returns:
;;     Carry: Clear. No collision
    PHB                                                                  ;94A352;
    PHX                                                                  ;94A353;
    PHK                                                                  ;94A354;
    PLB                                                                  ;94A355;
    STZ.B DP_Temp1E                                                      ;94A356;
    STZ.B DP_Temp12                                                      ;94A358;
    STZ.B DP_Temp14                                                      ;94A35A;
    LDA.W SamusProjectile_XVelocities,X                                  ;94A35C;
    BPL +                                                                ;94A35F;
    DEC.B DP_Temp14                                                      ;94A361;

+   STA.B DP_Temp13                                                      ;94A363;
    JSR.W CalculateProjectileYBlockSpan                                  ;94A365;
    LDA.W SamusProjectile_YPositions,X                                   ;94A368;
    SEC                                                                  ;94A36B;
    SBC.W SamusProjectile_YRadii,X                                       ;94A36C;
    LSR                                                                  ;94A36F;
    LSR                                                                  ;94A370;
    LSR                                                                  ;94A371;
    LSR                                                                  ;94A372;
    SEP #$20                                                             ;94A373;
    STA.W $4202                                                          ;94A375;
    LDA.W RoomWidthBlocks                                                ;94A378;
    STA.W $4203                                                          ;94A37B;
    REP #$20                                                             ;94A37E;
    LDA.W SamusProjectile_XSubPositions,X                                ;94A380;
    CLC                                                                  ;94A383;
    ADC.B DP_Temp12                                                      ;94A384;
    STA.W SamusProjectile_XSubPositions,X                                ;94A386;
    STA.B DP_Temp16                                                      ;94A389;
    LDA.W SamusProjectile_XPositions,X                                   ;94A38B;
    ADC.B DP_Temp14                                                      ;94A38E;
    STA.W SamusProjectile_XPositions,X                                   ;94A390;
    STA.B DP_Temp18                                                      ;94A393;
    BIT.B DP_Temp14                                                      ;94A395;
    BMI .leftBoundary                                                    ;94A397;
    CLC                                                                  ;94A399;
    ADC.W SamusProjectile_XRadii,X                                       ;94A39A;
    DEC                                                                  ;94A39D;
    BRA +                                                                ;94A39E;

  .leftBoundary:
    SEC                                                                  ;94A3A0;
    SBC.W SamusProjectile_XRadii,X                                       ;94A3A1;

+   STA.B DP_Temp1C                                                      ;94A3A4;
    LSR                                                                  ;94A3A6;
    LSR                                                                  ;94A3A7;
    LSR                                                                  ;94A3A8;
    LSR                                                                  ;94A3A9;
    CLC                                                                  ;94A3AA;
    ADC.W $4216                                                          ;94A3AB;
    ASL                                                                  ;94A3AE;
    TAY                                                                  ;94A3AF;
    LDA.B DP_Temp26                                                      ;94A3B0;
    CMP.W #$0010                                                         ;94A3B2;
    BPL .returnNoCollision                                               ;94A3B5;
    LDA.W SamusProjectile_YPositions,X                                   ;94A3B7;
    XBA                                                                  ;94A3BA;
    BMI .returnNoCollision                                               ;94A3BB;
    AND.W #$00FF                                                         ;94A3BD;
    CMP.W RoomHeightScrolls                                              ;94A3C0;
    BPL .returnNoCollision                                               ;94A3C3;
    LDA.B DP_Temp1D                                                      ;94A3C5;
    AND.W #$00FF                                                         ;94A3C7;
    CMP.W RoomWidthScrolls                                               ;94A3CA;
    BPL .returnNoCollision                                               ;94A3CD;
    TYX                                                                  ;94A3CF;

  .loop:
    JSR.W BlockShotReaction_Horizontal                                   ;94A3D0;
    TXA                                                                  ;94A3D3;
    CLC                                                                  ;94A3D4;
    ADC.W RoomWidthBlocks                                                ;94A3D5;
    ADC.W RoomWidthBlocks                                                ;94A3D8;
    TAX                                                                  ;94A3DB;
    DEC.B DP_Temp26                                                      ;94A3DC;
    BPL .loop                                                            ;94A3DE;

  .returnNoCollision:
    PLX                                                                  ;94A3E0;
    PLB                                                                  ;94A3E1;
    CLC                                                                  ;94A3E2;
    RTL                                                                  ;94A3E3;


;;; $A3E4: Move beam vertically - wave beam ;;;
MoveBeamVertically_WaveBeam:
;; Parameters:
;;     X: Projectile index
;; Returns:
;;     Carry: Clear. No collision
    PHB                                                                  ;94A3E4;
    PHX                                                                  ;94A3E5;
    PHK                                                                  ;94A3E6;
    PLB                                                                  ;94A3E7;
    STZ.B DP_Temp1E                                                      ;94A3E8;
    STZ.B DP_Temp12                                                      ;94A3EA;
    STZ.B DP_Temp14                                                      ;94A3EC;
    LDA.W SamusProjectile_YVelocities,X                                  ;94A3EE;
    BPL +                                                                ;94A3F1;
    DEC.B DP_Temp14                                                      ;94A3F3;

+   STA.B DP_Temp13                                                      ;94A3F5;
    JSR.W CalculateProjectileXBlockSpan                                  ;94A3F7;
    LDA.W SamusProjectile_YSubPositions,X                                ;94A3FA;
    CLC                                                                  ;94A3FD;
    ADC.B DP_Temp12                                                      ;94A3FE;
    STA.W SamusProjectile_YSubPositions,X                                ;94A400;
    STA.B DP_Temp16                                                      ;94A403;
    LDA.W SamusProjectile_YPositions,X                                   ;94A405;
    ADC.B DP_Temp14                                                      ;94A408;
    STA.W SamusProjectile_YPositions,X                                   ;94A40A;
    STA.B DP_Temp18                                                      ;94A40D;
    BIT.B DP_Temp14                                                      ;94A40F;
    BMI .negative14                                                      ;94A411;
    CLC                                                                  ;94A413;
    ADC.W SamusProjectile_YRadii,X                                       ;94A414;
    DEC                                                                  ;94A417;
    BRA +                                                                ;94A418;

  .negative14:
    SEC                                                                  ;94A41A;
    SBC.W SamusProjectile_YRadii,X                                       ;94A41B;

+   STA.B DP_Temp1C                                                      ;94A41E;
    LSR                                                                  ;94A420;
    LSR                                                                  ;94A421;
    LSR                                                                  ;94A422;
    LSR                                                                  ;94A423;
    SEP #$20                                                             ;94A424;
    STA.W $4202                                                          ;94A426;
    LDA.W RoomWidthBlocks                                                ;94A429;
    STA.W $4203                                                          ;94A42C;
    REP #$20                                                             ;94A42F;
    LDA.W SamusProjectile_XPositions,X                                   ;94A431;
    SEC                                                                  ;94A434;
    SBC.W SamusProjectile_XRadii,X                                       ;94A435;
    LSR                                                                  ;94A438;
    LSR                                                                  ;94A439;
    LSR                                                                  ;94A43A;
    LSR                                                                  ;94A43B;
    CLC                                                                  ;94A43C;
    ADC.W $4216                                                          ;94A43D;
    ASL                                                                  ;94A440;
    TAY                                                                  ;94A441;
    LDA.B DP_Temp26                                                      ;94A442;
    CMP.W #$0010                                                         ;94A444;
    BPL .returnNoCollision                                               ;94A447;
    LDA.W SamusProjectile_XPositions,X                                   ;94A449;
    XBA                                                                  ;94A44C;
    BMI .returnNoCollision                                               ;94A44D;
    AND.W #$00FF                                                         ;94A44F;
    CMP.W RoomWidthScrolls                                               ;94A452;
    BPL .returnNoCollision                                               ;94A455;
    LDA.B DP_Temp1D                                                      ;94A457;
    AND.W #$00FF                                                         ;94A459;
    CMP.W RoomHeightScrolls                                              ;94A45C;
    BPL .returnNoCollision                                               ;94A45F;
    TYX                                                                  ;94A461;

  .loop:
    JSR.W BlockShotReaction_Vertical                                     ;94A462;
    INX                                                                  ;94A465;
    INX                                                                  ;94A466;
    DEC.B DP_Temp26                                                      ;94A467;
    BPL .loop                                                            ;94A469;

  .returnNoCollision:
    PLX                                                                  ;94A46B;
    PLB                                                                  ;94A46C;
    CLC                                                                  ;94A46D;
    RTL                                                                  ;94A46E;


;;; $A46F: Move (super) missile horizontally ;;;
MoveMissileHorizontally:
;; Parameters:
;;     X: Projectile index
;; Returns:
;;     Carry: set if collided with block, clear otherwise
    PHB                                                                  ;94A46F;
    PHX                                                                  ;94A470;
    PHK                                                                  ;94A471;
    PLB                                                                  ;94A472;
    LDA.W #$0001                                                         ;94A473;
    STA.B DP_Temp1E                                                      ;94A476;
    STZ.B DP_Temp26                                                      ;94A478;
    STZ.B DP_Temp1A                                                      ;94A47A;
    STZ.B DP_Temp12                                                      ;94A47C;
    STZ.B DP_Temp14                                                      ;94A47E;
    LDA.W SamusProjectile_XVelocities,X                                  ;94A480;
    BPL +                                                                ;94A483;
    DEC.B DP_Temp14                                                      ;94A485;

+   STA.B DP_Temp13                                                      ;94A487;
    LDA.W SamusProjectile_YPositions,X                                   ;94A489;
    LSR                                                                  ;94A48C;
    LSR                                                                  ;94A48D;
    LSR                                                                  ;94A48E;
    LSR                                                                  ;94A48F;
    SEP #$20                                                             ;94A490;
    STA.W $4202                                                          ;94A492;
    LDA.W RoomWidthBlocks                                                ;94A495;
    STA.W $4203                                                          ;94A498;
    REP #$20                                                             ;94A49B;
    LDA.W SamusProjectile_XSubPositions,X                                ;94A49D;
    CLC                                                                  ;94A4A0;
    ADC.B DP_Temp12                                                      ;94A4A1;
    STA.W SamusProjectile_XSubPositions,X                                ;94A4A3;
    STA.B DP_Temp16                                                      ;94A4A6;
    LDA.W SamusProjectile_XPositions,X                                   ;94A4A8;
    ADC.B DP_Temp14                                                      ;94A4AB;
    STA.W SamusProjectile_XPositions,X                                   ;94A4AD;
    STA.B DP_Temp18                                                      ;94A4B0;
    STA.B DP_Temp1C                                                      ;94A4B2;
    LSR                                                                  ;94A4B4;
    LSR                                                                  ;94A4B5;
    LSR                                                                  ;94A4B6;
    LSR                                                                  ;94A4B7;
    CLC                                                                  ;94A4B8;
    ADC.W $4216                                                          ;94A4B9;
    ASL                                                                  ;94A4BC;
    TAX                                                                  ;94A4BD;
    LDA.B DP_Temp19                                                      ;94A4BE;
    AND.W #$00FF                                                         ;94A4C0;
    CMP.W RoomWidthScrolls                                               ;94A4C3;
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


;;; $A4D9: Move (super) missile vertically ;;;
MoveMissileVertically:
;; Parameters:
;;     X: Projectile index
;; Returns:
;;     Carry: set if collided with block, clear otherwise
    PHB                                                                  ;94A4D9;
    PHX                                                                  ;94A4DA;
    PHK                                                                  ;94A4DB;
    PLB                                                                  ;94A4DC;
    LDA.W #$0001                                                         ;94A4DD;
    STA.B DP_Temp1E                                                      ;94A4E0;
    STZ.B DP_Temp26                                                      ;94A4E2;
    STZ.B DP_Temp1A                                                      ;94A4E4;
    STZ.B DP_Temp12                                                      ;94A4E6;
    STZ.B DP_Temp14                                                      ;94A4E8;
    LDA.W SamusProjectile_YVelocities,X                                  ;94A4EA;
    BPL +                                                                ;94A4ED;
    DEC.B DP_Temp14                                                      ;94A4EF;

+   STA.B DP_Temp13                                                      ;94A4F1;
    LDA.W SamusProjectile_YSubPositions,X                                ;94A4F3;
    CLC                                                                  ;94A4F6;
    ADC.B DP_Temp12                                                      ;94A4F7;
    STA.W SamusProjectile_YSubPositions,X                                ;94A4F9;
    STA.B DP_Temp16                                                      ;94A4FC;
    LDA.W SamusProjectile_YPositions,X                                   ;94A4FE;
    ADC.B DP_Temp14                                                      ;94A501;
    STA.W SamusProjectile_YPositions,X                                   ;94A503;
    STA.B DP_Temp18                                                      ;94A506;
    STA.B DP_Temp1C                                                      ;94A508;
    LSR                                                                  ;94A50A;
    LSR                                                                  ;94A50B;
    LSR                                                                  ;94A50C;
    LSR                                                                  ;94A50D;
    SEP #$20                                                             ;94A50E;
    STA.W $4202                                                          ;94A510;
    LDA.W RoomWidthBlocks                                                ;94A513;
    STA.W $4203                                                          ;94A516;
    REP #$20                                                             ;94A519;
    LDA.W SamusProjectile_XPositions,X                                   ;94A51B;
    LSR                                                                  ;94A51E;
    LSR                                                                  ;94A51F;
    LSR                                                                  ;94A520;
    LSR                                                                  ;94A521;
    CLC                                                                  ;94A522;
    ADC.W $4216                                                          ;94A523;
    ASL                                                                  ;94A526;
    TAX                                                                  ;94A527;
    LDA.B DP_Temp19                                                      ;94A528;
    AND.W #$00FF                                                         ;94A52A;
    CMP.W RoomHeightScrolls                                              ;94A52D;
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


;;; $A543: Block shot reaction - horizontal - slope - non-square ;;;
BlockShotReaction_Horizontal_Slope_NonSquare:
;; Parameters:
;;     $26: Number of blocks left to check - 1
;;     $28: Target number of collisions - 1
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $26: Remaining number of blocks left to check - 1
;;     $28: Remaining target number of collisions - 1

; Used for spread bomb collision also
    REP #$20                                                             ;94A543;
    LDX.W CurrentBlockIndex                                              ;94A545;
    LDY.W ProjectileIndex                                                ;94A548;
    LDA.W CurrentBlockIndex                                              ;94A54B;
    STA.W $4204                                                          ;94A54E;
    SEP #$20                                                             ;94A551;
    LDA.W RoomWidthBlocks                                                ;94A553;
    STA.W $4206                                                          ;94A556;
    REP #$20                                                             ;94A559;
    LDA.W SamusProjectile_YPositions,Y                                   ;94A55B;
    LSR                                                                  ;94A55E;
    LSR                                                                  ;94A55F;
    LSR                                                                  ;94A560;
    LSR                                                                  ;94A561;
    CMP.W $4214                                                          ;94A562;
    BEQ BlockShotReaction_Slope_NonSquare                                ;94A565;
    CLC                                                                  ;94A567;
    RTS                                                                  ;94A568;


;;; $A569: Block shot reaction - vertical - slope - non-square ;;;
BlockShotReaction_Vertical_Slope_NonSquare:
;; Parameters:
;;     $26: Number of blocks left to check - 1
;;     $28: Target number of collisions - 1
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $26: Remaining number of blocks left to check - 1
;;     $28: Remaining target number of collisions - 1
    REP #$20                                                             ;94A569;
    LDX.W CurrentBlockIndex                                              ;94A56B;
    LDY.W ProjectileIndex                                                ;94A56E;
    LDA.W CurrentBlockIndex                                              ;94A571;
    STA.W $4204                                                          ;94A574;
    SEP #$20                                                             ;94A577;
    LDA.W RoomWidthBlocks                                                ;94A579;
    STA.W $4206                                                          ;94A57C;
    REP #$20                                                             ;94A57F;
    LDA.W SamusProjectile_XPositions,Y                                   ;94A581;
    LSR                                                                  ;94A584;
    LSR                                                                  ;94A585;
    LSR                                                                  ;94A586;
    LSR                                                                  ;94A587;
    CMP.W $4216                                                          ;94A588;
    BEQ BlockShotReaction_Slope_NonSquare                                ;94A58B;
    CLC                                                                  ;94A58D;
    RTS                                                                  ;94A58E;


;;; $A58F: Block shot reaction - slope - non-square ;;;
BlockShotReaction_Slope_NonSquare:
;; Parameters:
;;     X: Block index
;;     $26: Number of blocks left to check - 1
;;     $28: Target number of collisions - 1
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $26: Remaining number of blocks left to check - 1
;;     $28: Remaining target number of collisions - 1

; Used for spread bomb collision also ($26/$28 don't matter in that case)
    LDA.L BTS,X                                                          ;94A58F;
    AND.W #$001F                                                         ;94A593;
    ASL                                                                  ;94A596;
    ASL                                                                  ;94A597;
    ASL                                                                  ;94A598;
    ASL                                                                  ;94A599;
    STA.W SlopeCollisionDefinitionTableBaseIndex                         ;94A59A;
    LDA.L BTS-1,X                                                        ;94A59D;
    ASL                                                                  ;94A5A1;
    BMI .blockBTS40                                                      ;94A5A2;
    LDA.W SamusProjectile_XPositions,Y                                   ;94A5A4;
    BRA +                                                                ;94A5A7;

  .blockBTS40:
    LDA.W SamusProjectile_XPositions,Y                                   ;94A5A9;
    EOR.W #$000F                                                         ;94A5AC;

+   AND.W #$000F                                                         ;94A5AF;
    CLC                                                                  ;94A5B2;
    ADC.W SlopeCollisionDefinitionTableBaseIndex                         ;94A5B3;
    PHA                                                                  ;94A5B6;
    LDA.L BTS-1,X                                                        ;94A5B7;
    BMI .blockBTSMSB                                                     ;94A5BB;
    JMP.W .YFlip                                                         ;94A5BD;

  .blockBTSMSB:
    PLX                                                                  ;94A5C0;
    LDA.W SamusProjectile_YPositions,Y                                   ;94A5C1;
    AND.W #$000F                                                         ;94A5C4;
    EOR.W #$000F                                                         ;94A5C7;
    STA.W CollisionVariable                                              ;94A5CA;
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X                     ;94A5CD;
    AND.W #$001F                                                         ;94A5D0;
    CMP.W CollisionVariable                                              ;94A5D3;
    BMI .collision                                                       ;94A5D6;
    BEQ .collision                                                       ;94A5D8;
    CLC                                                                  ;94A5DA;
    RTS                                                                  ;94A5DB;

  .collision:
    STZ.B DP_Temp26                                                      ;94A5DC;
    STZ.B DP_Temp28                                                      ;94A5DE;
    SEC                                                                  ;94A5E0;
    RTS                                                                  ;94A5E1;

  .YFlip:
    PLX                                                                  ;94A5E2;
    LDA.W SamusProjectile_YPositions,Y                                   ;94A5E3;
    AND.W #$000F                                                         ;94A5E6;
    STA.W CollisionVariable                                              ;94A5E9;
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X                     ;94A5EC;
    AND.W #$001F                                                         ;94A5EF;
    CMP.W CollisionVariable                                              ;94A5F2;
    BMI ..collision                                                      ;94A5F5;
    BEQ ..collision                                                      ;94A5F7;
    CLC                                                                  ;94A5F9;
    RTS                                                                  ;94A5FA;

  ..collision:
    STZ.B DP_Temp26                                                      ;94A5FB;
    STZ.B DP_Temp28                                                      ;94A5FD;
    SEC                                                                  ;94A5FF;
    RTS                                                                  ;94A600;


;;; $A601: Spread bomb block reaction pointers ;;;
BombSpreadBlockReaction_Pointers:
    dw CLCRTS_949D59                                                     ;94A601;  0: Air
    dw BombSpreadBlockReaction_Slope                                     ;94A603; *1: Slope
    dw CLCRTS_949D59                                                     ;94A605;  2: Spike air
    dw CLCRTS_949D59                                                     ;94A607;  3: Special air
    dw SECRTS_949D5B                                                     ;94A609;  4: Shootable air
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ;94A60B; *5: Horizontal extension
    dw CLCRTS_949D59                                                     ;94A60D;  6: Unused air
    dw CLCRTS_949D59                                                     ;94A60F;  7: Bombable air
    dw SECRTS_949D5B                                                     ;94A611;  8: Solid block
    dw SECRTS_949D5B                                                     ;94A613;  9: Door block
    dw SECRTS_949D5B                                                     ;94A615;  Ah: Spike block
    dw SECRTS_949D5B                                                     ;94A617;  Bh: Special block
    dw SECRTS_949D5B                                                     ;94A619;  Ch: Shootable block
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ;94A61B; *Dh: Vertical extension
    dw SECRTS_949D5B                                                     ;94A61D;  Eh: Grapple block
    dw SECRTS_949D5B                                                     ;94A61F;  Fh: Bombable block


;;; $A621: Spread bomb block collision detection ;;;
BombSpreadBlockCollisionDetection:
;; Parameters:
;;     X: Projectile index
;; Returns:
;;     Carry: Set if collision detected, clear otherwise
    PHP                                                                  ;94A621;
    PHB                                                                  ;94A622;
    PHK                                                                  ;94A623;
    PLB                                                                  ;94A624;
    REP #$30                                                             ;94A625;
    LDA.W SamusProjectile_XPositions,X                                   ;94A627;
    STA.B DP_Temp1A                                                      ;94A62A;
    LDA.W SamusProjectile_YPositions,X                                   ;94A62C;
    STA.B DP_Temp1C                                                      ;94A62F;
    STZ.B DP_Temp1E                                                      ;94A631;
    STZ.B DP_Temp20                                                      ;94A633;
    STZ.W CurrentBlockIndex                                              ;94A635;
    PHX                                                                  ;94A638;
    JSR.W CalculateBlockAt_12_1E_1C_20                                   ;94A639;
    PLX                                                                  ;94A63C;
    LDA.W SamusProjectile_Variables,X                                    ;94A63D;
    BNE .nonZeroTimer                                                    ;94A640;
    JSR.W BombExplosionBlockCollisionHandling                            ;94A642;
    BRA .returnNoCollision                                               ;94A645;

  .nonZeroTimer:
    LDA.W CurrentBlockIndex                                              ;94A647;
    CMP.W #$FFFF                                                         ;94A64A;
    BEQ .returnCollision                                                 ;94A64D;
    ASL                                                                  ;94A64F;
    TAX                                                                  ;94A650;
    LDA.L LevelData,X                                                    ;94A651;
    AND.W #$F000                                                         ;94A655;
    XBA                                                                  ;94A658;
    LSR                                                                  ;94A659;
    LSR                                                                  ;94A65A;
    LSR                                                                  ;94A65B;
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


;;; $A66A: Block shot reaction - horizontal - slope - square ;;;
BlockShotReaction_Horizontal_Slope_Square:
;; Parameters:
;;     A: [Block BTS] & 1Fh
;;     X: Block index
;;     $1A: Projectile Y span - 1
;;     $1C: Target boundary (left/right depending on sign of projectile velocity)
;;     $1E: (Super) missile flag
;;     $26: Number of blocks left to check - 1
;; Returns:
;;     Carry: Set if collision, clear otherwise
    ASL                                                                  ;94A66A;
    ASL                                                                  ;94A66B;
    STA.W SolidSlopeDefinitionTableBaseIndex                             ;94A66C;
    LDA.L BTS-1,X                                                        ;94A66F;
    ROL                                                                  ;94A673;
    ROL                                                                  ;94A674;
    ROL                                                                  ;94A675;
    AND.W #$0003                                                         ;94A676;
    STA.W SlopeCollisionDefinitionTableBaseIndex                         ;94A679;
    LDA.B DP_Temp1C                                                      ;94A67C;
    AND.W #$0008                                                         ;94A67E;
    LSR                                                                  ;94A681;
    LSR                                                                  ;94A682;
    LSR                                                                  ;94A683;
    EOR.W SlopeCollisionDefinitionTableBaseIndex                         ;94A684;
    ADC.W SolidSlopeDefinitionTableBaseIndex                             ;94A687;
    TAX                                                                  ;94A68A;
    LDY.W ProjectileIndex                                                ;94A68B;
    LDA.B DP_Temp1E                                                      ;94A68E;
    BNE .missile                                                         ;94A690;
    LDA.B DP_Temp1A                                                      ;94A692;
    BNE .multiBlock                                                      ;94A694;
    LDA.W SamusProjectile_YPositions,Y                                   ;94A696;
    SEC                                                                  ;94A699;
    SBC.W SamusProjectile_YRadii,Y                                       ;94A69A;
    AND.W #$0008                                                         ;94A69D;
    BNE .bottomHalf                                                      ;94A6A0;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;94A6A2;
    BMI .gotoReturnCollision                                             ;94A6A5;

  .bottomHalf:
    TXA                                                                  ;94A6A7;
    EOR.W #$0002                                                         ;94A6A8;
    TAX                                                                  ;94A6AB;
    LDA.W SamusProjectile_YPositions,Y                                   ;94A6AC;
    CLC                                                                  ;94A6AF;
    ADC.W SamusProjectile_YRadii,Y                                       ;94A6B0;
    DEC                                                                  ;94A6B3;
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
    LDA.B DP_Temp26                                                      ;94A6C3;
    BNE .topBlockCheck                                                   ;94A6C5;
    LDA.W SamusProjectile_YPositions,Y                                   ;94A6C7;
    CLC                                                                  ;94A6CA;
    ADC.W SamusProjectile_YRadii,Y                                       ;94A6CB;
    DEC                                                                  ;94A6CE;
    AND.W #$0008                                                         ;94A6CF;
    BNE .checkBothHalves                                                 ;94A6D2;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;94A6D4;
    BMI .completeWaste                                                   ;94A6D7;
    BRA .returnNoCollisionDuplicate                                      ;94A6D9;

  .topBlockCheck:
    CMP.B DP_Temp1A                                                      ;94A6DB;
    BNE .checkBothHalves                                                 ;94A6DD;
    LDA.W SamusProjectile_YPositions,Y                                   ;94A6DF;
    SEC                                                                  ;94A6E2;
    SBC.W SamusProjectile_YRadii,Y                                       ;94A6E3;
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
    LDY.W ProjectileIndex                                                ;94A701;
    LDA.W SamusProjectile_YPositions,Y                                   ;94A704;
    AND.W #$0008                                                         ;94A707;
    BEQ +                                                                ;94A70A;
    TXA                                                                  ;94A70C;
    EOR.W #$0002                                                         ;94A70D;
    TAX                                                                  ;94A710;

+   LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;94A711;
    BMI .returnCollisionDuplicate                                        ;94A714;
    CLC                                                                  ;94A716;
    RTS                                                                  ;94A717;

  .returnCollisionDuplicate:
    SEC                                                                  ;94A718;
    RTS                                                                  ;94A719;


;;; $A71A: Block shot reaction - vertical - slope - square ;;;
BlockShotReaction_Vertical_Slope_Square:
;; Parameters:
;;     A: [Block BTS] & 1Fh
;;     X: Block index
;;     $1A: Projectile X span - 1
;;     $1C: Target boundary (top/bottom depending on sign of projectile velocity)
;;     $1E: (Super) missile flag
;;     $26: Number of blocks left to check - 1
;; Returns:
;;     Carry: Set if collision, clear otherwise
    ASL                                                                  ;94A71A;
    ASL                                                                  ;94A71B;
    STA.W SolidSlopeDefinitionTableBaseIndex                             ;94A71C;
    LDA.L BTS-1,X                                                        ;94A71F;
    ROL                                                                  ;94A723;
    ROL                                                                  ;94A724;
    ROL                                                                  ;94A725;
    AND.W #$0003                                                         ;94A726;
    STA.W SlopeCollisionDefinitionTableBaseIndex                         ;94A729;
    LDA.B DP_Temp1C                                                      ;94A72C;
    AND.W #$0008                                                         ;94A72E;
    LSR                                                                  ;94A731;
    LSR                                                                  ;94A732;
    EOR.W SlopeCollisionDefinitionTableBaseIndex                         ;94A733;
    ADC.W SolidSlopeDefinitionTableBaseIndex                             ;94A736;
    TAX                                                                  ;94A739;
    LDY.W ProjectileIndex                                                ;94A73A;
    LDA.B DP_Temp1E                                                      ;94A73D;
    BNE .missile                                                         ;94A73F;
    LDA.B DP_Temp1A                                                      ;94A741;
    BNE .multiBlock                                                      ;94A743;
    LDA.W SamusProjectile_XPositions,Y                                   ;94A745;
    SEC                                                                  ;94A748;
    SBC.W SamusProjectile_XRadii,Y                                       ;94A749;
    AND.W #$0008                                                         ;94A74C;
    BNE .right                                                           ;94A74F;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;94A751;
    BMI .gotoReturnCollision                                             ;94A754;

  .right:
    TXA                                                                  ;94A756;
    EOR.W #$0001                                                         ;94A757;
    TAX                                                                  ;94A75A;
    LDA.W SamusProjectile_XPositions,Y                                   ;94A75B;
    CLC                                                                  ;94A75E;
    ADC.W SamusProjectile_XRadii,Y                                       ;94A75F;
    DEC                                                                  ;94A762;
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
    LDA.B DP_Temp26                                                      ;94A772;
    BNE .leftmostBlockCheck                                              ;94A774;
    LDA.W SamusProjectile_XPositions,Y                                   ;94A776;
    CLC                                                                  ;94A779;
    ADC.W SamusProjectile_XRadii,Y                                       ;94A77A;
    DEC                                                                  ;94A77D;
    AND.W #$0008                                                         ;94A77E;
    BNE .checkBothHalves                                                 ;94A781;
    LDA.W SquareSlopeDefinitions_Bank94-1,X                              ;94A783;
    BMI .gotoNowhere                                                     ;94A786;
    BRA .returnNoCollisionDuplicate                                      ;94A788;

  .leftmostBlockCheck:
    CMP.B DP_Temp1A                                                      ;94A78A;
    BNE .checkBothHalves                                                 ;94A78C;
    LDA.W SamusProjectile_XPositions,Y                                   ;94A78E;
    SEC                                                                  ;94A791;
    SBC.W SamusProjectile_XRadii,Y                                       ;94A792;
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
    LDY.W ProjectileIndex                                                ;94A7B0;
    LDA.W SamusProjectile_XPositions,Y                                   ;94A7B3;
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


;;; $A7C9: Block grapple reaction - air / spike air / special air / unused air ;;;
BlockGrappleReaction_Air_SpikeAir_SpecialAir:
;; Returns:
;;     Carry: Clear. No collision
;;     Overflow: Clear (no effect)
    REP #$40                                                             ;94A7C9; reset overflow
    CLC                                                                  ;94A7CB; >.<
    RTS                                                                  ;94A7CC;


;;; $A7CD: Block grapple reaction - slope / solid block / door block / special block ;;;
BlockGrappleReaction_Slope_SolidBlock_DoorBlock_SpecialBlock:
;; Returns:
;;     Carry: Set. Unconditional collision
;;     Overflow: Clear. Cancel grapple beam
    REP #$40                                                             ;94A7CD; reset overflow
    SEC                                                                  ;94A7CF;
    RTS                                                                  ;94A7D0;


;;; $A7D1: Block grapple reaction - grapple block ;;;
BlockGrappleReaction_GrappleBlock:
;; Returns:
;;     Carry/overflow: Clear if BTS >= 80h, otherwise set according to PLM initialisation (always set)
    LDA.W #$8000                                                         ;94A7D1;
    TRB.W GrappleBeam_Flags                                              ;94A7D4;
    LDX.W CurrentBlockIndex                                              ;94A7D7;
    LDA.L BTS-1,X                                                        ;94A7DA;
    XBA                                                                  ;94A7DE;
    BMI +                                                                ;94A7DF;
    AND.W #$007F                                                         ;94A7E1;
    ASL                                                                  ;94A7E4;
    TAX                                                                  ;94A7E5;
    LDA.W .PLMs,X                                                        ;94A7E6;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;94A7E9;
    RTS                                                                  ;94A7ED;

+   AND.W #$007F                                                         ;94A7EE; >_<
    REP #$40                                                             ;94A7F1; reset overflow
    CLC                                                                  ;94A7F3; >.<
    RTS                                                                  ;94A7F4;

  .PLMs:
    dw PLMEntries_Grappled_GrappleBlock                                  ;94A7F5;
    dw PLMEntries_Grappled_RespawningBreakableGrappleBlock               ;94A7F7;
    dw PLMEntries_Grappled_BreakableGrappleBlock                         ;94A7F9;
    dw PLMEntries_Grappled_GrappleBlock                                  ;94A7FB;


;;; $A7FD: Block grapple reaction - spike block ;;;
BlockGrappleReaction_SpikeBlock:
;; Returns:
;;     Carry/overflow: Clear if BTS >= 80h, otherwise set according to PLM initialisation
;;         BTS 3h (Draygon's broken turret): Set carry and overflow
;;         Otherwise: Clear carry and overflow

; Spawn PLM for spike block
    LDX.W CurrentBlockIndex                                              ;94A7FD;
    LDA.L BTS-1,X                                                        ;94A800;
    XBA                                                                  ;94A804;
    BMI +                                                                ;94A805;
    AND.W #$007F                                                         ;94A807;
    ASL                                                                  ;94A80A;
    TAX                                                                  ;94A80B;
    LDA.W .PLMs,X                                                        ;94A80C;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;94A80F;
    RTS                                                                  ;94A813;

+   AND.W #$007F                                                         ;94A814; >_<
    REP #$40                                                             ;94A817; reset overflow
    CLC                                                                  ;94A819; >.<
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


;;; $A83B: Block grapple reaction pointers ;;;
BlockGrappleReaction_Pointers:
    dw BlockGrappleReaction_Air_SpikeAir_SpecialAir                      ;94A83B;  0: Air
    dw BlockGrappleReaction_Slope_SolidBlock_DoorBlock_SpecialBlock      ;94A83D;  1: Slope
    dw BlockGrappleReaction_Air_SpikeAir_SpecialAir                      ;94A83F;  2: Spike air
    dw BlockGrappleReaction_Air_SpikeAir_SpecialAir                      ;94A841;  3: Special air
    dw BlockBombShotGrappledReaction_ShootableAir                        ;94A843; *4: Shootable air
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ;94A845; *5: Horizontal extension
    dw BlockGrappleReaction_Air_SpikeAir_SpecialAir                      ;94A847;  6: Unused air
    dw BlockShotBombedGrappledReaction_BombableAir                       ;94A849; *7: Bombable air
    dw BlockGrappleReaction_Slope_SolidBlock_DoorBlock_SpecialBlock      ;94A84B;  8: Solid block
    dw BlockGrappleReaction_Slope_SolidBlock_DoorBlock_SpecialBlock      ;94A84D;  9: Door block
    dw BlockGrappleReaction_SpikeBlock                                   ;94A84F; *Ah: Spike block
    dw BlockGrappleReaction_Slope_SolidBlock_DoorBlock_SpecialBlock      ;94A851;  Bh: Special block
    dw BlockBombShotGrappledReaction_ShootableBlock                      ;94A853; *Ch: Shootable block
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ;94A855; *Dh: Vertical extension
    dw BlockGrappleReaction_GrappleBlock                                 ;94A857; *Eh: Grapple block
    dw BlockShotBombedGrappledReaction_BombableBlock                     ;94A859; *Fh: Bombable block


;;; $A85B: Grapple beam block collision detection ;;;
GrappleBeamBlockCollisionDetection:
;; Returns:
;;     Carry: Set if collision, otherwise clear
;;     Overflow: If carry set; set if connecting to block, clear if grapple beam cancelled

; Checks the four points given by quarter increments of grapple velocity for block collision
; Grapple is connected if *any* point results in a connection, otherwise grapple cancel is determined by the *last* point
    PHB                                                                  ;94A85B;
    PHK                                                                  ;94A85C;
    PLB                                                                  ;94A85D;
    LDA.W GrappleBeam_ExtensionXSubVelocity                              ;94A85E;
    STA.W GrappleCollision_EndAngleParam+1                               ;94A861;
    CLC                                                                  ;94A864;
    ROR.W GrappleCollision_XQuarterVelocity                              ;94A865;
    ROR.W GrappleCollision_EndAngleParam                                 ;94A868;
    ROR.W GrappleCollision_XQuarterVelocity                              ;94A86B;
    ROR.W GrappleCollision_EndAngleParam                                 ;94A86E;
    LDA.W GrappleBeam_ExtensionXSubVelocity                              ;94A871;
    BPL .YQuarterVelocity                                                ;94A874;
    LDA.W #$FFC0                                                         ;94A876;
    TSB.W GrappleCollision_XQuarterVelocity                              ;94A879;

  .YQuarterVelocity:
    LDA.W GrappleBeam_ExtensionYSubVelocity                              ;94A87C;
    STA.W GrappleCollision_YQuarterSubVelocity+1                         ;94A87F;
    CLC                                                                  ;94A882;
    ROR.W GrappleCollision_YQuarterVelocity                              ;94A883;
    ROR.W GrappleCollision_YQuarterSubVelocity                           ;94A886;
    ROR.W GrappleCollision_YQuarterVelocity                              ;94A889;
    ROR.W GrappleCollision_YQuarterSubVelocity                           ;94A88C;
    LDA.W GrappleBeam_ExtensionYSubVelocity                              ;94A88F;
    BPL .loopSetup                                                       ;94A892;
    LDA.W #$FFC0                                                         ;94A894;
    TSB.W GrappleCollision_YQuarterVelocity                              ;94A897;

  .loopSetup:
    LDA.W #$0004                                                         ;94A89A;
    STA.W GrappleCollision_LoopCounter                                   ;94A89D;

  .loop:
    LDA.W GrappleBeam_EndXSubOffset                                      ;94A8A0;
    CLC                                                                  ;94A8A3;
    ADC.W GrappleCollision_EndAngleParam                                 ;94A8A4;
    STA.W GrappleBeam_EndXSubOffset                                      ;94A8A7;
    LDA.W GrappleBeam_EndXOffset                                         ;94A8AA;
    ADC.W GrappleCollision_XQuarterVelocity                              ;94A8AD;
    STA.W GrappleBeam_EndXOffset                                         ;94A8B0;
    LDA.W GrappleBeam_EndYSubOffset                                      ;94A8B3;
    CLC                                                                  ;94A8B6;
    ADC.W GrappleCollision_YQuarterSubVelocity                           ;94A8B7;
    STA.W GrappleBeam_EndYSubOffset                                      ;94A8BA;
    LDA.W GrappleBeam_EndYOffset                                         ;94A8BD;
    ADC.W GrappleCollision_YQuarterVelocity                              ;94A8C0;
    STA.W GrappleBeam_EndYOffset                                         ;94A8C3;
    LDA.W SamusXSubPosition                                              ;94A8C6;
    CLC                                                                  ;94A8C9;
    ADC.W GrappleBeam_EndXSubOffset                                      ;94A8CA;
    STA.W GrappleBeam_EndXSubPosition                                    ;94A8CD;
    LDA.W SamusXPosition                                                 ;94A8D0;
    ADC.W GrappleBeam_EndXOffset                                         ;94A8D3;
    CLC                                                                  ;94A8D6;
    ADC.W GrappleBeam_OriginXOffset                                      ;94A8D7;
    STA.W GrappleBeam_EndXPosition                                       ;94A8DA;
    LDA.W SamusYSubPosition                                              ;94A8DD;
    CLC                                                                  ;94A8E0;
    ADC.W GrappleBeam_EndYSubOffset                                      ;94A8E1;
    STA.W GrappleBeam_EndYSubPosition                                    ;94A8E4;
    LDA.W SamusYPosition                                                 ;94A8E7;
    ADC.W GrappleBeam_EndYOffset                                         ;94A8EA;
    CLC                                                                  ;94A8ED;
    ADC.W GrappleBeam_OriginYOffset                                      ;94A8EE;
    STA.W GrappleBeam_EndYPosition                                       ;94A8F1;
    JSL.L BlockGrappleReaction                                           ;94A8F4;
    BVC .notConnected                                                    ;94A8F8;
    BCC .notConnected                                                    ;94A8FA;
    PHP                                                                  ;94A8FC;
    LDA.W GrappleBeam_EndXPosition                                       ;94A8FD;
    AND.W #$FFF0                                                         ;94A900;
    ORA.W #$0008                                                         ;94A903;
    STA.W GrappleBeam_EndXPosition                                       ;94A906;
    LDA.W GrappleBeam_EndYPosition                                       ;94A909;
    AND.W #$FFF0                                                         ;94A90C;
    ORA.W #$0008                                                         ;94A90F;
    STA.W GrappleBeam_EndYPosition                                       ;94A912;
    PLP                                                                  ;94A915;
    PLB                                                                  ;94A916;
    RTL                                                                  ;94A917;

  .notConnected:
    DEC.W GrappleCollision_LoopCounter                                   ;94A918;
    BNE .loop                                                            ;94A91B;
    PLB                                                                  ;94A91D;
    RTL                                                                  ;94A91E;


;;; $A91F: Block grapple reaction ;;;
BlockGrappleReaction:
;; Returns:
;;     Carry: Set if collision, otherwise clear
;;     Overflow: If carry set; set if connecting to block, clear if grapple beam cancelled
    PHB                                                                  ;94A91F;
    PHK                                                                  ;94A920;
    PLB                                                                  ;94A921;
    LDA.W GrappleBeam_EndYPosition                                       ;94A922;
    LSR                                                                  ;94A925;
    LSR                                                                  ;94A926;
    LSR                                                                  ;94A927;
    LSR                                                                  ;94A928;
    SEP #$20                                                             ;94A929;
    STA.W $4202                                                          ;94A92B;
    LDA.W RoomWidthBlocks                                                ;94A92E;
    STA.W $4203                                                          ;94A931;
    REP #$20                                                             ;94A934;
    LDA.W GrappleBeam_EndXPosition                                       ;94A936;
    LSR                                                                  ;94A939;
    LSR                                                                  ;94A93A;
    LSR                                                                  ;94A93B;
    LSR                                                                  ;94A93C;
    CLC                                                                  ;94A93D;
    ADC.W $4216                                                          ;94A93E;
    STA.W CurrentBlockIndex                                              ;94A941;
    ASL                                                                  ;94A944;
    TAX                                                                  ;94A945;
    LDA.L LevelData,X                                                    ;94A946;
    AND.W #$F000                                                         ;94A94A;
    XBA                                                                  ;94A94D;
    LSR                                                                  ;94A94E;
    LSR                                                                  ;94A94F;
    LSR                                                                  ;94A950;
    TAX                                                                  ;94A951;
    JSR.W (BlockGrappleReaction_Pointers,X)                              ;94A952;
    PLB                                                                  ;94A955;
    RTL                                                                  ;94A956;


;;; $A957: Calculate position from grapple beam end with distance and angle ;;;
CalculatePositionFromGrappleBeamEndWithDistanceAndAngle:
;; Parameters:
;;     GrappleCollision_EndAngleParam: Grapple beam end angle * 2
;;     GrappleCollision_XQuarterVelocity: Distance from grapple beam end
;; Returns:
;;     GrappleCollision_XPosition: X position
;;     GrappleCollision_YPosition: Y position
;;     GrappleCollision_XBlock: X block
;;     GrappleCollision_YBlock: Y block
    LDX.W GrappleCollision_EndAngleParam                                 ;94A957;
    LDA.W GrappleBeam_Flags                                              ;94A95A;
    BMI .grapplingEnemy                                                  ;94A95D;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;94A95F;
    BMI .angleLessThan80                                                 ;94A963;
    LDA.W GrappleBeam_EndXPosition                                       ;94A965;
    AND.W #$FFF0                                                         ;94A968;
    ORA.W #$0008                                                         ;94A96B;
    BRA +                                                                ;94A96E;

  .angleLessThan80:
    LDA.W GrappleBeam_EndXPosition                                       ;94A970;
    AND.W #$FFF0                                                         ;94A973;
    ORA.W #$0007                                                         ;94A976;

+   STA.W GrappleBeam_EndXPosition                                       ;94A979;
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X                 ;94A97C;
    BMI .notBetween40_C0                                                 ;94A980;
    LDA.W GrappleBeam_EndYPosition                                       ;94A982;
    AND.W #$FFF0                                                         ;94A985;
    ORA.W #$0008                                                         ;94A988;
    BRA .setEndPosition                                                  ;94A98B;

  .notBetween40_C0:
    LDA.W GrappleBeam_EndYPosition                                       ;94A98D;
    AND.W #$FFF0                                                         ;94A990;
    ORA.W #$0007                                                         ;94A993;

  .setEndPosition:
    STA.W GrappleBeam_EndYPosition                                       ;94A996;

  .grapplingEnemy:
    SEP #$20                                                             ;94A999;
    LDA.W GrappleCollision_XQuarterVelocity                              ;94A99B;
    STA.W $4202                                                          ;94A99E;
    REP #$20                                                             ;94A9A1;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;94A9A3;
    BMI .negative                                                        ;94A9A7;
    CMP.W #$0100                                                         ;94A9A9;
    BNE .not100                                                          ;94A9AC;
    LDA.W GrappleBeam_EndXPosition                                       ;94A9AE;
    CLC                                                                  ;94A9B1;
    ADC.W GrappleCollision_XQuarterVelocity                              ;94A9B2;
    BRA +                                                                ;94A9B5;

  .not100:
    SEP #$20                                                             ;94A9B7;
    STA.W $4203                                                          ;94A9B9;
    REP #$20                                                             ;94A9BC;
    NOP                                                                  ;94A9BE;
    NOP                                                                  ;94A9BF;
    LDA.W $4216                                                          ;94A9C0;
    AND.W #$FF00                                                         ;94A9C3;
    XBA                                                                  ;94A9C6;
    CLC                                                                  ;94A9C7;
    ADC.W GrappleBeam_EndXPosition                                       ;94A9C8;
    BRA +                                                                ;94A9CB;

  .negative:
    CMP.W #$FF00                                                         ;94A9CD;
    BNE .notFF00                                                         ;94A9D0;
    LDA.W GrappleBeam_EndXPosition                                       ;94A9D2;
    SEC                                                                  ;94A9D5;
    SBC.W GrappleCollision_XQuarterVelocity                              ;94A9D6;
    BRA +                                                                ;94A9D9;

  .notFF00:
    SEP #$20                                                             ;94A9DB;
    EOR.B #$FF                                                           ;94A9DD;
    INC                                                                  ;94A9DF;
    STA.W $4203                                                          ;94A9E0;
    REP #$20                                                             ;94A9E3;
    NOP                                                                  ;94A9E5;
    NOP                                                                  ;94A9E6;
    LDA.W $4216                                                          ;94A9E7;
    AND.W #$FF00                                                         ;94A9EA;
    XBA                                                                  ;94A9ED;
    EOR.W #$FFFF                                                         ;94A9EE;
    INC                                                                  ;94A9F1;
    CLC                                                                  ;94A9F2;
    ADC.W GrappleBeam_EndXPosition                                       ;94A9F3;

+   STA.W GrappleCollision_XPosition                                     ;94A9F6;
    LSR                                                                  ;94A9F9;
    LSR                                                                  ;94A9FA;
    LSR                                                                  ;94A9FB;
    LSR                                                                  ;94A9FC;
    AND.W #$00FF                                                         ;94A9FD;
    STA.W GrappleCollision_XBlock                                        ;94AA00;
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X                 ;94AA03;
    BMI .negativeAgain                                                   ;94AA07;
    CMP.W #$0100                                                         ;94AA09;
    BNE .not100again                                                     ;94AA0C;
    LDA.W GrappleBeam_EndYPosition                                       ;94AA0E;
    CLC                                                                  ;94AA11;
    ADC.W GrappleCollision_XQuarterVelocity                              ;94AA12;
    BRA +                                                                ;94AA15;

  .not100again:
    SEP #$20                                                             ;94AA17;
    STA.W $4203                                                          ;94AA19;
    REP #$20                                                             ;94AA1C;
    NOP                                                                  ;94AA1E;
    NOP                                                                  ;94AA1F;
    LDA.W $4216                                                          ;94AA20;
    AND.W #$FF00                                                         ;94AA23;
    XBA                                                                  ;94AA26;
    CLC                                                                  ;94AA27;
    ADC.W GrappleBeam_EndYPosition                                       ;94AA28;
    BRA +                                                                ;94AA2B;

  .negativeAgain:
    CMP.W #$FF00                                                         ;94AA2D;
    BNE .notFF00again                                                    ;94AA30;
    LDA.W GrappleBeam_EndYPosition                                       ;94AA32;
    SEC                                                                  ;94AA35;
    SBC.W GrappleCollision_XQuarterVelocity                              ;94AA36;
    BRA +                                                                ;94AA39;

  .notFF00again:
    SEP #$20                                                             ;94AA3B;
    EOR.B #$FF                                                           ;94AA3D;
    INC                                                                  ;94AA3F;
    STA.W $4203                                                          ;94AA40;
    REP #$20                                                             ;94AA43;
    NOP                                                                  ;94AA45;
    NOP                                                                  ;94AA46;
    LDA.W $4216                                                          ;94AA47;
    AND.W #$FF00                                                         ;94AA4A;
    XBA                                                                  ;94AA4D;
    EOR.W #$FFFF                                                         ;94AA4E;
    INC                                                                  ;94AA51;
    CLC                                                                  ;94AA52;
    ADC.W GrappleBeam_EndYPosition                                       ;94AA53;

+   STA.W GrappleCollision_YPosition                                     ;94AA56;
    LSR                                                                  ;94AA59;
    LSR                                                                  ;94AA5A;
    LSR                                                                  ;94AA5B;
    LSR                                                                  ;94AA5C;
    AND.W #$00FF                                                         ;94AA5D;
    STA.W GrappleCollision_YBlock                                        ;94AA60;
    RTS                                                                  ;94AA63;


;;; $AA64: Grapple swing collision reaction ;;;
GrappleSwingCollisionReaction:
;; Parameters:
;;     GrappleCollision_XBlock: X block
;;     GrappleCollision_YBlock: Y block
;; Returns:
;;     Carry: set if collision, clear otherwise
    SEP #$20                                                             ;94AA64;
    LDA.W GrappleCollision_YBlock                                        ;94AA66;
    STA.W $4202                                                          ;94AA69;
    LDA.W RoomWidthBlocks                                                ;94AA6C;
    STA.W $4203                                                          ;94AA6F;
    REP #$21                                                             ;94AA72;
    LDA.W GrappleCollision_XBlock                                        ;94AA74;
    ADC.W $4216                                                          ;94AA77;
    STA.W CurrentBlockIndex                                              ;94AA7A;
    ASL                                                                  ;94AA7D;
    TAX                                                                  ;94AA7E;
    LDA.L LevelData,X                                                    ;94AA7F;
    AND.W #$F000                                                         ;94AA83;
    PHA                                                                  ;94AA86;
    PHX                                                                  ;94AA87;
    XBA                                                                  ;94AA88;
    LSR                                                                  ;94AA89;
    LSR                                                                  ;94AA8A;
    LSR                                                                  ;94AA8B;
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


;;; $AA9A: Clear carry ;;;
CLCRTS_94AA9A:
    CLC                                                                  ;94AA9A;
    RTS                                                                  ;94AA9B;


;;; $AA9C: Set carry ;;;
SECRTS_94AA9C:
    SEC                                                                  ;94AA9C;
    RTS                                                                  ;94AA9D;


;;; $AA9E: Grapple swing collision reaction - spike air ;;;
GrappleSwingCollisionReaction_SpikeAir:
;; Returns:
;;     Carry: Clear. No collision

; There's really no reason to have this reaction, the spike air inside reaction does this damage anyway
; Although you can set grapple swing specific damage here if you want...
    LDA.W SamusInvincibilityTimer                                        ;94AA9E;
    BNE .return                                                          ;94AAA1;
    LDX.W CurrentBlockIndex                                              ;94AAA3;
    LDA.L BTS,X                                                          ;94AAA6;
    BMI .return                                                          ;94AAAA;
    ASL                                                                  ;94AAAC;
    TAX                                                                  ;94AAAD;
    LDA.W .zeroes0,X                                                     ;94AAAE;
    ORA.W .zeroes1,X                                                     ;94AAB1;
    BEQ .return                                                          ;94AAB4;
    LDA.W PeriodicSubDamage                                              ;94AAB6;
    CLC                                                                  ;94AAB9; >.<
    ADC.W .zeroes0,X                                                     ;94AABA; >.<
    STA.W PeriodicSubDamage                                              ;94AABD;
    LDA.W PeriodicDamage                                                 ;94AAC0;
    ADC.W .zeroes1,X                                                     ;94AAC3;
    STA.W PeriodicDamage                                                 ;94AAC6;
    LDA.W #$003C                                                         ;94AAC9;
    STA.W SamusInvincibilityTimer                                        ;94AACC;
    LDA.W #$000A                                                         ;94AACF;
    STA.W SamusKnockbackTimer                                            ;94AAD2;

  .return:
    CLC                                                                  ;94AAD5;
    RTS                                                                  ;94AAD6;

  .zeroes0:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;94AAD7;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;94AAE7;

  .zeroes1:
    dw $0000,$0000,$0010,$0000,$0000,$0000,$0000,$0000                   ;94AAF7;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;94AB07;


;;; $AB17: Grapple swing collision reaction - spike block ;;;
GrappleSwingCollisionReaction_SpikeBlock:
;; Returns:
;;     Carry: Set. Unconditional collision
    LDA.W SamusInvincibilityTimer                                        ;94AB17;
    BNE .return                                                          ;94AB1A;
    LDX.W CurrentBlockIndex                                              ;94AB1C;
    LDA.L BTS,X                                                          ;94AB1F;
    BMI .return                                                          ;94AB23;
    ASL                                                                  ;94AB25;
    TAX                                                                  ;94AB26;
    LDA.W .zeroes,X                                                      ;94AB27;
    ORA.W .damage,X                                                      ;94AB2A;
    BEQ .return                                                          ;94AB2D;
    LDA.W PeriodicSubDamage                                              ;94AB2F;
    CLC                                                                  ;94AB32; >.<
    ADC.W .zeroes,X                                                      ;94AB33; >.<
    STA.W PeriodicSubDamage                                              ;94AB36;
    LDA.W PeriodicDamage                                                 ;94AB39;
    ADC.W .damage,X                                                      ;94AB3C;
    STA.W PeriodicDamage                                                 ;94AB3F;
    LDA.W #$003C                                                         ;94AB42;
    STA.W SamusInvincibilityTimer                                        ;94AB45;
    LDA.W #$000A                                                         ;94AB48;
    STA.W SamusKnockbackTimer                                            ;94AB4B;

  .return:
    SEC                                                                  ;94AB4E;
    RTS                                                                  ;94AB4F;

  .zeroes:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;94AB50;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;94AB60;

  .damage:
    dw $003C,$0010,$0000,$0000,$0000,$0000,$0000,$0000                   ;94AB70;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;94AB80;


;;; $AB90: Grapple swing collision reaction pointers ;;;
GrappleSwingCollisionReaction_Pointers:
    dw CLCRTS_94AA9A                                                     ;94AB90;  0: Air
    dw SECRTS_94AA9C                                                     ;94AB92;  1: Slope
    dw GrappleSwingCollisionReaction_SpikeAir                            ;94AB94; *2: Spike air
    dw CLCRTS_94AA9A                                                     ;94AB96;  3: Special air
    dw CLCRTS_94AA9A                                                     ;94AB98;  4: Shootable air
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ;94AB9A; *5: Horizontal extension
    dw CLCRTS_94AA9A                                                     ;94AB9C;  6: Unused air
    dw CLCRTS_94AA9A                                                     ;94AB9E;  7: Bombable air
    dw SECRTS_94AA9C                                                     ;94ABA0;  8: Solid block
    dw SECRTS_94AA9C                                                     ;94ABA2;  9: Door block
    dw GrappleSwingCollisionReaction_SpikeBlock                          ;94ABA4; *Ah: Spike block
    dw SECRTS_94AA9C                                                     ;94ABA6;  Bh: Special block
    dw SECRTS_94AA9C                                                     ;94ABA8;  Ch: Shootable block
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ;94ABAA; *Dh: Vertical extension
    dw SECRTS_94AA9C                                                     ;94ABAC;  Eh: Grapple block
    dw SECRTS_94AA9C                                                     ;94ABAE;  Fh: Bombable block


;;; $ABB0: Grapple swing collision reaction ;;;
GrappleSwingCollisionReaction_duplicate:
; Clone of GrappleSwingCollisionReaction
    SEP #$20                                                             ;94ABB0;
    LDA.W GrappleCollision_YBlock                                        ;94ABB2;
    STA.W $4202                                                          ;94ABB5;
    LDA.W RoomWidthBlocks                                                ;94ABB8;
    STA.W $4203                                                          ;94ABBB;
    REP #$21                                                             ;94ABBE; clear carry
    LDA.W GrappleCollision_XBlock                                        ;94ABC0;
    ADC.W $4216                                                          ;94ABC3;
    STA.W CurrentBlockIndex                                              ;94ABC6;
    ASL                                                                  ;94ABC9;
    TAX                                                                  ;94ABCA;
    LDA.L LevelData,X                                                    ;94ABCB;
    AND.W #$F000                                                         ;94ABCF;
    PHA                                                                  ;94ABD2;
    PHX                                                                  ;94ABD3;
    XBA                                                                  ;94ABD4;
    LSR                                                                  ;94ABD5;
    LSR                                                                  ;94ABD6;
    LSR                                                                  ;94ABD7;
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


;;; $ABE6: Grapple swing collision detection due to swinging ;;;
GrappleSwingCollisionDetectionDueToSwinging:
;; Returns:
;;     Carry: set if collision, clear otherwise
;;     GrappleCollision_DistanceFromSamusFeet: Distance of grapple swing collision from Samus' feet. Unit 8px

; Checks 6(!) points along the 48px line projecting 8px beyond the grapple beam start position
    LDA.W #$0006                                                         ;94ABE6;
    STA.W GrappleCollision_DistanceFromSamusFeet                         ;94ABE9;
    LDA.W #$0008                                                         ;94ABEC;
    CLC                                                                  ;94ABEF;
    ADC.W GrappleBeam_Length                                             ;94ABF0;
    STA.W GrappleCollision_XQuarterVelocity                              ;94ABF3;

  .loop:
    JSR.W CalculatePositionFromGrappleBeamEndWithDistanceAndAngle        ;94ABF6;
    JSR.W GrappleSwingCollisionReaction_duplicate                        ;94ABF9;
    BCS .return                                                          ;94ABFC;
    LDA.W GrappleCollision_XQuarterVelocity                              ;94ABFE;
    CLC                                                                  ;94AC01;
    ADC.W #$0008                                                         ;94AC02;
    STA.W GrappleCollision_XQuarterVelocity                              ;94AC05;
    DEC.W GrappleCollision_DistanceFromSamusFeet                         ;94AC08;
    BNE .loop                                                            ;94AC0B;
    CLC                                                                  ;94AC0D;
    RTS                                                                  ;94AC0E;

  .return:
    NOP                                                                  ;94AC0F; >_<
    RTS                                                                  ;94AC10;


;;; $AC11: Update grapple beam start position during grapple swinging ;;;
UpdateGrappleBeamStartPositionDuringGrappleSwinging:
    LDA.W GrappleBeam_EndAngle+1                                         ;94AC11;
    AND.W #$00FF                                                         ;94AC14;
    ASL                                                                  ;94AC17;
    STA.W GrappleCollision_EndAngleParam                                 ;94AC18;
    LDA.W GrappleBeam_Length                                             ;94AC1B;
    STA.W GrappleCollision_XQuarterVelocity                              ;94AC1E;
    JSR.W CalculatePositionFromGrappleBeamEndWithDistanceAndAngle        ;94AC21;
    LDA.W GrappleCollision_XPosition                                     ;94AC24;
    STA.W GrappleBeam_StartXPosition                                     ;94AC27;
    LDA.W GrappleCollision_YPosition                                     ;94AC2A;
    STA.W GrappleBeam_StartYPosition                                     ;94AC2D;
    RTL                                                                  ;94AC30;


;;; $AC31: Handle grapple beam length change ;;;
HandleGrappleBeamLengthChange:
    PHB                                                                  ;94AC31;
    PHK                                                                  ;94AC32;
    PLB                                                                  ;94AC33;
    LDA.W GrappleBeam_LengthDelta                                        ;94AC34;
    BNE .nonZeroLengthDelta                                              ;94AC37;
    JMP.W .returnCarryClear                                              ;94AC39;

  .nonZeroLengthDelta:
    BMI .positiveGrappleBeamLengthDelta                                  ;94AC3C;
    JMP.W .increaseLength                                                ;94AC3E;

  .positiveGrappleBeamLengthDelta:
    LDA.W GrappleBeam_Length                                             ;94AC41;
    CLC                                                                  ;94AC44;
    ADC.W GrappleBeam_LengthDelta                                        ;94AC45;
    CMP.W #$0008                                                         ;94AC48;
    BCS .greaterThanEqualTo8                                             ;94AC4B;
    STZ.W GrappleBeam_LengthDelta                                        ;94AC4D;
    LDA.W #$0008                                                         ;94AC50;

  .greaterThanEqualTo8:
    STA.W GrappleCollision_TargetLength                                  ;94AC53;
    LDA.W #$0008                                                         ;94AC56;
    STA.W GrappleCollision_SamusFrontBoundaryOffset                      ;94AC59;
    LDA.W GrappleBeam_EndAngle+1                                         ;94AC5C;
    AND.W #$00FF                                                         ;94AC5F;
    ASL                                                                  ;94AC62;
    STA.W GrappleCollision_EndAngleParam                                 ;94AC63;
    LDA.W GrappleBeam_Length                                             ;94AC66;
    CMP.W GrappleCollision_TargetLength                                  ;94AC69;
    BEQ .decreasedToTargetLength                                         ;94AC6C;

  .decreaseLength:
    STA.W GrappleCollision_NewBeamLength                                 ;94AC6E;
    DEC                                                                  ;94AC71;
    CLC                                                                  ;94AC72;
    ADC.W GrappleCollision_SamusFrontBoundaryOffset                      ;94AC73;
    STA.W GrappleCollision_XQuarterVelocity                              ;94AC76;
    JSR.W CalculatePositionFromGrappleBeamEndWithDistanceAndAngle        ;94AC79;
    JSR.W GrappleSwingCollisionReaction                                  ;94AC7C;
    BCS .collision                                                       ;94AC7F;
    DEC.W GrappleCollision_NewBeamLength                                 ;94AC81;
    LDA.W GrappleCollision_NewBeamLength                                 ;94AC84;
    CMP.W GrappleCollision_TargetLength                                  ;94AC87;
    BNE .decreaseLength                                                  ;94AC8A;

  .decreasedToTargetLength:
    LDA.W GrappleCollision_TargetLength                                  ;94AC8C;
    STA.W GrappleBeam_Length                                             ;94AC8F;
    PLB                                                                  ;94AC92;
    CLC                                                                  ;94AC93;
    RTL                                                                  ;94AC94;

  .collision:
    LDA.W GrappleCollision_NewBeamLength                                 ;94AC95;
    STA.W GrappleBeam_Length                                             ;94AC98;
    PLB                                                                  ;94AC9B;
    SEC                                                                  ;94AC9C;
    RTL                                                                  ;94AC9D;

  .increaseLength:
    LDA.W GrappleBeam_Length                                             ;94AC9E;
    CLC                                                                  ;94ACA1;
    ADC.W GrappleBeam_LengthDelta                                        ;94ACA2;
    CMP.W #$003F                                                         ;94ACA5;
    BCC .lessThan3F                                                      ;94ACA8;
    STZ.W GrappleBeam_LengthDelta                                        ;94ACAA;
    LDA.W #$003F                                                         ;94ACAD;

  .lessThan3F:
    STA.W GrappleCollision_TargetLength                                  ;94ACB0;
    LDA.W #$0038                                                         ;94ACB3;
    STA.W GrappleCollision_SamusFrontBoundaryOffset                      ;94ACB6;
    LDA.W GrappleBeam_EndAngle+1                                         ;94ACB9;
    AND.W #$00FF                                                         ;94ACBC;
    ASL                                                                  ;94ACBF;
    STA.W GrappleCollision_EndAngleParam                                 ;94ACC0;
    LDA.W GrappleBeam_Length                                             ;94ACC3;
    CMP.W GrappleCollision_TargetLength                                  ;94ACC6;
    BEQ .increasedToTargetLength                                         ;94ACC9;

  .loopIncreaseLength:
    STA.W GrappleCollision_NewBeamLength                                 ;94ACCB;
    INC                                                                  ;94ACCE;
    CLC                                                                  ;94ACCF;
    ADC.W GrappleCollision_SamusFrontBoundaryOffset                      ;94ACD0;
    STA.W GrappleCollision_XQuarterVelocity                              ;94ACD3;
    JSR.W CalculatePositionFromGrappleBeamEndWithDistanceAndAngle        ;94ACD6;
    JSR.W GrappleSwingCollisionReaction                                  ;94ACD9;
    BCS .collision                                                       ;94ACDC;
    INC.W GrappleCollision_NewBeamLength                                 ;94ACDE;
    LDA.W GrappleCollision_NewBeamLength                                 ;94ACE1;
    CMP.W GrappleCollision_TargetLength                                  ;94ACE4;
    BNE .loopIncreaseLength                                              ;94ACE7;

  .increasedToTargetLength:
    LDA.W GrappleCollision_TargetLength                                  ;94ACE9;
    STA.W GrappleBeam_Length                                             ;94ACEC;
    PLB                                                                  ;94ACEF;
    CLC                                                                  ;94ACF0;
    RTL                                                                  ;94ACF1;

; Unused copy+paste of .collision
    LDA.W GrappleCollision_NewBeamLength                                 ;94ACF2; dead code
    STA.W GrappleBeam_Length                                             ;94ACF5;
    PLB                                                                  ;94ACF8;
    SEC                                                                  ;94ACF9;
    RTL                                                                  ;94ACFA;

  .returnCarryClear:
    PLB                                                                  ;94ACFB;
    CLC                                                                  ;94ACFC;
    RTL                                                                  ;94ACFD;


;;; $ACFE: Handle grapple beam swinging movement ;;;
HandleGrappleBeamSwingingMovement:
; The clockwise and anticlockwise branches are identical except for the INC/DEC in the loop >_>;
    PHB                                                                  ;94ACFE;
    PHK                                                                  ;94ACFF;
    PLB                                                                  ;94AD00;
    LDY.W #$0100                                                         ;94AD01;
    LDA.W GrappleBeam_Flags                                              ;94AD04;
    BIT.W #$0001                                                         ;94AD07;
    BEQ .nonLiquidPhysics                                                ;94AD0A;
    LDY.W #$00A0                                                         ;94AD0C;

  .nonLiquidPhysics:
    LDA.W GrappleBeam_SwingAngularVelocity                               ;94AD0F;
    CLC                                                                  ;94AD12;
    ADC.W GrappleBeam_ExtraSwingAngularVelocity                          ;94AD13;
    BPL .preClockwise                                                    ;94AD16;
    EOR.W #$FFFF                                                         ;94AD18;
    INC                                                                  ;94AD1B;
    JSL.L A_Y_16bit_UnsignedMultiplication                               ;94AD1C;
    LDA.W MultiplicationResult+1                                         ;94AD20;
    EOR.W #$FFFF                                                         ;94AD23;
    INC                                                                  ;94AD26;
    BEQ .gotoFailedMovement                                              ;94AD27;
    STA.W GrappleCollision_TotalSwingAngularVelocity                     ;94AD29;
    JMP.W .anticlockwise                                                 ;94AD2C;

  .preClockwise:
    JSL.L A_Y_16bit_UnsignedMultiplication                               ;94AD2F;
    LDA.W MultiplicationResult+1                                         ;94AD33;
    BEQ .gotoFailedMovement                                              ;94AD36;
    STA.W GrappleCollision_TotalSwingAngularVelocity                     ;94AD38;
    BRA .clockwise                                                       ;94AD3B;

  .gotoFailedMovement:
    JMP.W .failedMovement                                                ;94AD3D;

  .clockwise:
    CLC                                                                  ;94AD40;
    ADC.W GrappleBeam_EndAngle                                           ;94AD41;
    XBA                                                                  ;94AD44;
    AND.W #$00FF                                                         ;94AD45;
    ASL                                                                  ;94AD48;
    STA.W GrappleCollision_YQuarterVelocity                              ;94AD49;
    LDA.W GrappleBeam_Length                                             ;94AD4C;
    STA.W GrappleCollision_XQuarterVelocity                              ;94AD4F;
    LDA.W GrappleBeam_EndAngle+1                                         ;94AD52;
    AND.W #$00FF                                                         ;94AD55;
    ASL                                                                  ;94AD58;
    CMP.W GrappleCollision_YQuarterVelocity                              ;94AD59;
    BEQ ..reachedTarget                                                  ;94AD5C;

  ..loop:
    STA.W GrappleCollision_NewEndAngle                                   ;94AD5E;
    INC                                                                  ;94AD61;
    INC                                                                  ;94AD62;
    AND.W #$01FF                                                         ;94AD63;
    STA.W GrappleCollision_EndAngleParam                                 ;94AD66;
    JSR.W GrappleSwingCollisionDetectionDueToSwinging                    ;94AD69;
    BCS ..collision                                                      ;94AD6C;
    LDA.W GrappleCollision_NewEndAngle                                   ;94AD6E;
    INC                                                                  ;94AD71;
    INC                                                                  ;94AD72;
    AND.W #$01FF                                                         ;94AD73;
    CMP.W GrappleCollision_TargetEndAngle                                ;94AD76;
    BNE ..loop                                                           ;94AD79;

  ..reachedTarget:
    LDA.W GrappleBeam_EndAngle                                           ;94AD7B;
    CLC                                                                  ;94AD7E;
    ADC.W GrappleCollision_TotalSwingAngularVelocity                     ;94AD7F;
    STA.W GrappleBeam_EndAngle                                           ;94AD82;
    STA.W GrappleBeam_EndAngleMirror                                     ;94AD85;
    LDA.W #$8000                                                         ;94AD88;
    TRB.W GrappleBeam_SpecialAngleHandlingFlag                           ;94AD8B;
    DEC.W GrappleBeam_KickCooldownTimer                                  ;94AD8E;
    BPL +                                                                ;94AD91;
    STZ.W GrappleBeam_KickCooldownTimer                                  ;94AD93;

+   LDA.W GrappleBeam_ExtraSwingAngularVelocity                          ;94AD96;
    BPL +                                                                ;94AD99;
    CLC                                                                  ;94AD9B;
    ADC.W #$0006                                                         ;94AD9C;
    BPL ..zero                                                           ;94AD9F;
    BRA ..returnCarryClear                                               ;94ADA1;

+   SEC                                                                  ;94ADA3;
    SBC.W #$0006                                                         ;94ADA4;
    BMI ..zero                                                           ;94ADA7;
    BRA ..returnCarryClear                                               ;94ADA9;

  ..zero:
    LDA.W #$0000                                                         ;94ADAB;

  ..returnCarryClear:
    STA.W GrappleBeam_ExtraSwingAngularVelocity                          ;94ADAE;
    PLB                                                                  ;94ADB1;
    CLC                                                                  ;94ADB2;
    RTL                                                                  ;94ADB3;

  ..collision:
    LDA.W GrappleCollision_NewEndAngle                                   ;94ADB4;
    LSR                                                                  ;94ADB7;
    AND.W #$00FF                                                         ;94ADB8;
    XBA                                                                  ;94ADBB;
    ORA.W #$0080                                                         ;94ADBC;
    STA.W GrappleBeam_EndAngle                                           ;94ADBF;
    STA.W GrappleBeam_EndAngleMirror                                     ;94ADC2;
    LDA.W GrappleCollision_DistanceFromSamusFeet                         ;94ADC5;
    CMP.W #$0006                                                         ;94ADC8;
    BEQ ..noBounce                                                       ;94ADCB;
    CMP.W #$0005                                                         ;94ADCD;
    BNE ..bounce                                                         ;94ADD0;

  ..noBounce:
    LDA.W GrappleBeam_Length                                             ;94ADD2;
    CMP.W #$0008                                                         ;94ADD5;
    BNE ..bounce                                                         ;94ADD8;
    LDA.W #$8000                                                         ;94ADDA;
    TSB.W GrappleBeam_SpecialAngleHandlingFlag                           ;94ADDD;
    STZ.W GrappleBeam_SwingAngularVelocity                               ;94ADE0;
    STZ.W GrappleBeam_ExtraSwingAngularVelocity                          ;94ADE3;
    PLB                                                                  ;94ADE6;
    SEC                                                                  ;94ADE7;
    RTL                                                                  ;94ADE8;

  ..bounce:
    LDA.W #$0010                                                         ;94ADE9;
    STA.W GrappleBeam_KickCooldownTimer                                  ;94ADEC;
    LDA.W GrappleBeam_SwingAngularVelocity                               ;94ADEF;
    ASL                                                                  ;94ADF2;
    LDA.W GrappleBeam_SwingAngularVelocity                               ;94ADF3;
    ROR                                                                  ;94ADF6;
    EOR.W #$FFFF                                                         ;94ADF7;
    INC                                                                  ;94ADFA;
    STA.W GrappleBeam_SwingAngularVelocity                               ;94ADFB;
    LDA.W GrappleBeam_ExtraSwingAngularVelocity                          ;94ADFE;
    ASL                                                                  ;94AE01;
    LDA.W GrappleBeam_ExtraSwingAngularVelocity                          ;94AE02;
    ROR                                                                  ;94AE05;
    EOR.W #$FFFF                                                         ;94AE06;
    INC                                                                  ;94AE09;
    STA.W GrappleBeam_ExtraSwingAngularVelocity                          ;94AE0A;
    PLB                                                                  ;94AE0D;
    SEC                                                                  ;94AE0E;
    RTL                                                                  ;94AE0F;

  .anticlockwise:
    CLC                                                                  ;94AE10;
    ADC.W GrappleBeam_EndAngle                                           ;94AE11;
    XBA                                                                  ;94AE14;
    AND.W #$00FF                                                         ;94AE15;
    ASL                                                                  ;94AE18;
    STA.W GrappleCollision_YQuarterVelocity                              ;94AE19;
    LDA.W GrappleBeam_Length                                             ;94AE1C;
    STA.W GrappleCollision_XQuarterVelocity                              ;94AE1F;
    LDA.W GrappleBeam_EndAngle+1                                         ;94AE22;
    AND.W #$00FF                                                         ;94AE25;
    ASL                                                                  ;94AE28;
    CMP.W GrappleCollision_YQuarterVelocity                              ;94AE29;
    BEQ ..reachedTarget                                                  ;94AE2C;

  ..loop:
    STA.W GrappleCollision_NewEndAngle                                   ;94AE2E;
    DEC                                                                  ;94AE31;
    DEC                                                                  ;94AE32;
    AND.W #$01FF                                                         ;94AE33;
    STA.W GrappleCollision_EndAngleParam                                 ;94AE36;
    JSR.W GrappleSwingCollisionDetectionDueToSwinging                    ;94AE39;
    BCS ..collision                                                      ;94AE3C;
    LDA.W GrappleCollision_NewEndAngle                                   ;94AE3E;
    DEC                                                                  ;94AE41;
    DEC                                                                  ;94AE42;
    AND.W #$01FF                                                         ;94AE43;
    CMP.W GrappleCollision_YQuarterVelocity                              ;94AE46;
    BNE ..loop                                                           ;94AE49;

  ..reachedTarget:
    LDA.W GrappleBeam_EndAngle                                           ;94AE4B;
    CLC                                                                  ;94AE4E;
    ADC.W GrappleCollision_TotalSwingAngularVelocity                     ;94AE4F;
    STA.W GrappleBeam_EndAngle                                           ;94AE52;
    STA.W GrappleBeam_EndAngleMirror                                     ;94AE55;
    LDA.W #$8000                                                         ;94AE58;
    TRB.W GrappleBeam_SpecialAngleHandlingFlag                           ;94AE5B;
    DEC.W GrappleBeam_KickCooldownTimer                                  ;94AE5E;
    BPL +                                                                ;94AE61;
    STZ.W GrappleBeam_KickCooldownTimer                                  ;94AE63;

+   LDA.W GrappleBeam_ExtraSwingAngularVelocity                          ;94AE66;
    BPL +                                                                ;94AE69;
    CLC                                                                  ;94AE6B;
    ADC.W #$0006                                                         ;94AE6C;
    BPL ..zero                                                           ;94AE6F;
    BRA ..returnCarryClear                                               ;94AE71;

+   SEC                                                                  ;94AE73;
    SBC.W #$0006                                                         ;94AE74;
    BMI ..zero                                                           ;94AE77;
    BRA ..returnCarryClear                                               ;94AE79;

  ..zero:
    LDA.W #$0000                                                         ;94AE7B;

  ..returnCarryClear:
    STA.W GrappleBeam_ExtraSwingAngularVelocity                          ;94AE7E;
    PLB                                                                  ;94AE81;
    CLC                                                                  ;94AE82;
    RTL                                                                  ;94AE83;

  ..collision:
    LDA.W GrappleCollision_NewEndAngle                                   ;94AE84;
    LSR                                                                  ;94AE87;
    AND.W #$00FF                                                         ;94AE88;
    XBA                                                                  ;94AE8B;
    ORA.W #$0080                                                         ;94AE8C;
    STA.W GrappleBeam_EndAngle                                           ;94AE8F;
    STA.W GrappleBeam_EndAngleMirror                                     ;94AE92;
    LDA.W GrappleCollision_DistanceFromSamusFeet                         ;94AE95;
    CMP.W #$0006                                                         ;94AE98;
    BEQ +                                                                ;94AE9B;
    CMP.W #$0005                                                         ;94AE9D;
    BNE ..bounce                                                         ;94AEA0;

+   LDA.W GrappleBeam_Length                                             ;94AEA2;
    CMP.W #$0008                                                         ;94AEA5;
    BNE ..bounce                                                         ;94AEA8;
    LDA.W #$8000                                                         ;94AEAA;
    TSB.W GrappleBeam_SpecialAngleHandlingFlag                           ;94AEAD;
    STZ.W GrappleBeam_SwingAngularVelocity                               ;94AEB0;
    STZ.W GrappleBeam_ExtraSwingAngularVelocity                          ;94AEB3;
    PLB                                                                  ;94AEB6;
    SEC                                                                  ;94AEB7;
    RTL                                                                  ;94AEB8;

  ..bounce:
    LDA.W #$0010                                                         ;94AEB9;
    STA.W GrappleBeam_KickCooldownTimer                                  ;94AEBC;
    LDA.W GrappleBeam_SwingAngularVelocity                               ;94AEBF;
    ASL                                                                  ;94AEC2;
    LDA.W GrappleBeam_SwingAngularVelocity                               ;94AEC3;
    ROR                                                                  ;94AEC6;
    EOR.W #$FFFF                                                         ;94AEC7;
    INC                                                                  ;94AECA;
    STA.W GrappleBeam_SwingAngularVelocity                               ;94AECB;
    LDA.W GrappleBeam_ExtraSwingAngularVelocity                          ;94AECE;
    ASL                                                                  ;94AED1;
    LDA.W GrappleBeam_ExtraSwingAngularVelocity                          ;94AED2;
    ROR                                                                  ;94AED5;
    EOR.W #$FFFF                                                         ;94AED6;
    INC                                                                  ;94AED9;
    STA.W GrappleBeam_ExtraSwingAngularVelocity                          ;94AEDA;
    PLB                                                                  ;94AEDD;
    SEC                                                                  ;94AEDE;
    RTL                                                                  ;94AEDF;

  .failedMovement:
; Looks like RTL'd out code
    PLB                                                                  ;94AEE0;
    CLC                                                                  ;94AEE1;
    RTL                                                                  ;94AEE2;

; This code would make Samus drop if she failed too many failed movements in a row (such as holding right from rest)
    LDA.W GrappleBeam_EndAngle                                           ;94AEE3; dead code
    EOR.W GrappleBeam_SwingAngularVelocity                               ;94AEE6;
    BMI ..rising                                                         ;94AEE9;
    INC.W GrappleBeam_FailedSwingMovementCounter                         ;94AEEB;
    LDA.W GrappleBeam_FailedSwingMovementCounter                         ;94AEEE;
    CMP.W #$0020                                                         ;94AEF1;
    BNE ..lessThan20                                                     ;94AEF4;
    LDA.W #GrappleBeamFunction_Dropped                                   ;94AEF6;
    STA.W GrappleBeam_Function                                           ;94AEF9;

  ..lessThan20:
    STZ.W GrappleBeam_SwingAngularVelocity                               ;94AEFC;
    STZ.W GrappleBeam_ExtraSwingAngularVelocity                          ;94AEFF;
    PLB                                                                  ;94AF02;
    SEC                                                                  ;94AF03;
    RTL                                                                  ;94AF04;

  ..rising:
    STZ.W GrappleBeam_FailedSwingMovementCounter                         ;94AF05;
    PLB                                                                  ;94AF08;
    SEC                                                                  ;94AF09;
    RTL                                                                  ;94AF0A;


;;; $AF0B: Clear carry ;;;
CLCRTL_94AF0B:
; Looks like RTL'd out code
; Either required a parameter X and the loop fixed, or there was supposed to be code to set X in the loop
; Appears to (try to) check for block collisions of the entire grapple beam, and drop grapple beam if so
    CLC                                                                  ;94AF0B;
    RTL                                                                  ;94AF0C;

    PHB                                                                  ;94AF0D; dead code
    PHK                                                                  ;94AF0E;
    PLB                                                                  ;94AF0F;
    LDA.W GrappleBeam_EndXPosition                                       ;94AF10;
    LSR                                                                  ;94AF13;
    LSR                                                                  ;94AF14;
    LSR                                                                  ;94AF15;
    LSR                                                                  ;94AF16;
    AND.W #$00FF                                                         ;94AF17;
    XBA                                                                  ;94AF1A;
    STA.W GrappleCollision_XBlock                                        ;94AF1B;
    LDA.W GrappleBeam_EndYPosition                                       ;94AF1E;
    LSR                                                                  ;94AF21;
    LSR                                                                  ;94AF22;
    LSR                                                                  ;94AF23;
    LSR                                                                  ;94AF24;
    AND.W #$00FF                                                         ;94AF25;
    XBA                                                                  ;94AF28;
    STA.W GrappleCollision_YBlock                                        ;94AF29;
    LDA.W GrappleBeam_Length                                             ;94AF2C;
    LSR                                                                  ;94AF2F;
    LSR                                                                  ;94AF30;
    LSR                                                                  ;94AF31;
    LSR                                                                  ;94AF32;
    STA.W GrappleCollision_DistanceFromSamusFeet                         ;94AF33;

  .loop:
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X                 ;94AF36;
    CLC                                                                  ;94AF3A;
    ADC.W GrappleCollision_YBlock                                        ;94AF3B;
    STA.W GrappleCollision_YBlock                                        ;94AF3E;
    XBA                                                                  ;94AF41;
    SEP #$20                                                             ;94AF42;
    STA.W $4202                                                          ;94AF44;
    LDA.W RoomWidthBlocks                                                ;94AF47;
    STA.W $4203                                                          ;94AF4A;
    REP #$21                                                             ;94AF4D;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;94AF4F;
    ADC.W GrappleCollision_XBlock                                        ;94AF53;
    STA.W GrappleCollision_XBlock                                        ;94AF56;
    AND.W #$FF00                                                         ;94AF59;
    XBA                                                                  ;94AF5C;
    ADC.W $4216                                                          ;94AF5D;
    STA.W CurrentBlockIndex                                              ;94AF60;
    ASL                                                                  ;94AF63;
    TAX                                                                  ;94AF64;
    LDA.L LevelData,X                                                    ;94AF65;
    AND.W #$F000                                                         ;94AF69;
    XBA                                                                  ;94AF6C;
    LSR                                                                  ;94AF6D;
    LSR                                                                  ;94AF6E;
    LSR                                                                  ;94AF6F;
    TAX                                                                  ;94AF70;
    JSR.W (GrappleSwingCollisionReaction_Pointers,X)                     ;94AF71;
    BCS +                                                                ;94AF74;
    DEC.W GrappleCollision_DistanceFromSamusFeet                         ;94AF76;
    BPL .loop                                                            ;94AF79;
    PLB                                                                  ;94AF7B;
    CLC                                                                  ;94AF7C;
    RTL                                                                  ;94AF7D;

+   LDA.W #GrappleBeamFunction_Dropped                                   ;94AF7E;
    STA.W GrappleBeam_Function                                           ;94AF81;
    PLB                                                                  ;94AF84;
    SEC                                                                  ;94AF85;
    RTL                                                                  ;94AF86;


;;; $AF87: Initialise grapple segment animations ;;;
InitializeGrappleSegmentAnimations:
    LDX.W #$001E                                                         ;94AF87;

  .loop:
    LDA.W #InstList_DrawGrappleBeam_GrappleSegmentAnimations_3           ;94AF8A;
    STA.W GrappleBeam_SegmentAnimationInstructionListPointers,X          ;94AF8D;
    LDA.W #InstList_DrawGrappleBeam_GrappleSegmentAnimations_2           ;94AF90;
    STA.W GrappleBeam_SegmentAnimationInstructionListPointers-2,X        ;94AF93;
    LDA.W #InstList_DrawGrappleBeam_GrappleSegmentAnimations_1           ;94AF96;
    STA.W GrappleBeam_SegmentAnimationInstructionListPointers-4,X        ;94AF99;
    LDA.W #InstList_DrawGrappleBeam_GrappleSegmentAnimations_0           ;94AF9C;
    STA.W GrappleBeam_SegmentAnimationInstructionListPointers-6,X        ;94AF9F;
    LDA.W #$0001                                                         ;94AFA2;
    STA.W GrappleBeam_SegmentAnimationInstructionTimers,X                ;94AFA5;
    STA.W GrappleBeam_SegmentAnimationInstructionTimers-2,X              ;94AFA8;
    STA.W GrappleBeam_SegmentAnimationInstructionTimers-4,X              ;94AFAB;
    STA.W GrappleBeam_SegmentAnimationInstructionTimers-6,X              ;94AFAE;
    TXA                                                                  ;94AFB1;
    SEC                                                                  ;94AFB2;
    SBC.W #$0008                                                         ;94AFB3;
    TAX                                                                  ;94AFB6;
    BPL .loop                                                            ;94AFB7;
    RTL                                                                  ;94AFB9;


;;; $AFBA: Draw grapple beam ;;;
DrawGrappleBeam:
; Uses:
;     GrappleBeam_Length: Grapple beam length
;     GrappleBeam_EndXPosition: Grapple beam end X position
;     GrappleBeam_EndYPosition: Grapple beam end Y position
;     GrappleBeam_FlareXPosition: Grapple beam flare X position
;     GrappleBeam_FlareYPosition: Grapple beam flare Y position
;     GrappleBeam_SegmentAnimationInstructionTimers: Grapple segment animation instruction timers
;     GrappleBeam_SegmentAnimationInstructionListPointers: Grapple segment animation instruction list pointers

; Doesn't use [grapple beam end angle] except for unused calculation at $AFF7
    PHB                                                                  ;94AFBA;
    PHK                                                                  ;94AFBB;
    PLB                                                                  ;94AFBC;
    LDA.W GrappleBeam_EndXPosition                                       ;94AFBD;
    SEC                                                                  ;94AFC0;
    SBC.W GrappleBeam_FlareXPosition                                     ;94AFC1;
    STA.B DP_Temp12                                                      ;94AFC4;
    LDA.W GrappleBeam_EndYPosition                                       ;94AFC6;
    SEC                                                                  ;94AFC9;
    SBC.W GrappleBeam_FlareYPosition                                     ;94AFCA;
    STA.B DP_Temp14                                                      ;94AFCD;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;94AFCF;
    ASL                                                                  ;94AFD3;
    TAX                                                                  ;94AFD4;
    STZ.B DP_Temp1A                                                      ;94AFD5;
    STZ.B DP_Temp1C                                                      ;94AFD7;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;94AFD9;
    ASL                                                                  ;94AFDD;
    ASL                                                                  ;94AFDE;
    ASL                                                                  ;94AFDF;
    BPL +                                                                ;94AFE0;
    DEC.B DP_Temp1C                                                      ;94AFE2;

+   STA.B DP_Temp1B                                                      ;94AFE4;
    STZ.B DP_Temp1E                                                      ;94AFE6;
    STZ.B DP_Temp20                                                      ;94AFE8;
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X                 ;94AFEA;
    ASL                                                                  ;94AFEE;
    ASL                                                                  ;94AFEF;
    ASL                                                                  ;94AFF0;
    BPL +                                                                ;94AFF1;
    DEC.B DP_Temp20                                                      ;94AFF3;

+   STA.B DP_Temp1F                                                      ;94AFF5;
    LDA.W GrappleBeam_EndAngle                                           ;94AFF7;
    AND.W #$8000                                                         ;94AFFA;
    LSR                                                                  ;94AFFD;
    STA.B DP_Temp26                                                      ;94AFFE;
    EOR.W GrappleBeam_EndAngle                                           ;94B000;
    AND.W #$4000                                                         ;94B003;
    EOR.W #$4000                                                         ;94B006;
    ASL                                                                  ;94B009;
    ORA.B DP_Temp26                                                      ;94B00A;
    STA.B DP_Temp26                                                      ;94B00C;
    LDA.W GrappleBeam_FlareXPosition                                     ;94B00E;
    SEC                                                                  ;94B011;
    SBC.W Layer1XPosition                                                ;94B012;
    SEC                                                                  ;94B015;
    SBC.W #$0004                                                         ;94B016;
    STA.B DP_Temp14                                                      ;94B019;
    STZ.B DP_Temp12                                                      ;94B01B;
    LDA.W GrappleBeam_FlareYPosition                                     ;94B01D;
    SEC                                                                  ;94B020;
    SBC.W Layer1YPosition                                                ;94B021;
    SEC                                                                  ;94B024;
    SBC.W #$0004                                                         ;94B025;
    STA.B DP_Temp18                                                      ;94B028;
    STZ.B DP_Temp16                                                      ;94B02A;
    LDA.W GrappleBeam_Length                                             ;94B02C;
    BMI .return                                                          ;94B02F;
    STA.W $4204                                                          ;94B031;
    SEP #$20                                                             ;94B034;
    LDA.B #$08                                                           ;94B036;
    STA.W $4206                                                          ;94B038;
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
    STA.B DP_Temp28                                                      ;94B04F;
    LDX.W #$001E                                                         ;94B051;

  .loopAnimations:
    DEC.W GrappleBeam_SegmentAnimationInstructionTimers,X                ;94B054;
    BNE .processedInstructions                                           ;94B057;
    LDY.W GrappleBeam_SegmentAnimationInstructionListPointers,X          ;94B059;

  .loopInstructions:
    LDA.W $0000,Y                                                        ;94B05C;
    BPL .notInstruction                                                  ;94B05F;
    STA.B DP_Temp24                                                      ;94B061;
    PEA.W .loopInstructions-1                                            ;94B063;
    INY                                                                  ;94B066;
    INY                                                                  ;94B067;
    JMP.W (DP_Temp24)                                                    ;94B068;

  .notInstruction:
    STA.W GrappleBeam_SegmentAnimationInstructionTimers,X                ;94B06B;
    TYA                                                                  ;94B06E;
    CLC                                                                  ;94B06F;
    ADC.W #$0004                                                         ;94B070;
    STA.W GrappleBeam_SegmentAnimationInstructionListPointers,X          ;94B073;

  .processedInstructions:
    LDA.B DP_Temp14                                                      ;94B076;
    ORA.B DP_Temp18                                                      ;94B078;
    AND.W #$FF00                                                         ;94B07A;
    BNE +                                                                ;94B07D;
    PHX                                                                  ;94B07F;
    LDY.W GrappleBeam_SegmentAnimationInstructionListPointers,X          ;94B080;
    DEY                                                                  ;94B083;
    DEY                                                                  ;94B084;
    LDA.W $0000,Y                                                        ;94B085;
    TAY                                                                  ;94B088;
    JSR.W DrawGrappleSegment                                             ;94B089;
    PLX                                                                  ;94B08C;
    DEX                                                                  ;94B08D;
    DEX                                                                  ;94B08E;
    DEC.B DP_Temp28                                                      ;94B08F;
    BPL .loopAnimations                                                  ;94B091;

+   LDA.W Pose                                                           ;94B093;
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


;;; $B0AA: Draw grapple segment ;;;
DrawGrappleSegment:
;; Parameters:
;;     Y: Tile number and attributes
;;     $14.$12: X position
;;     $18.$16: Y position
;;     $1C.$1A: Width
;;     $20.$1E: Height

; The branch at $B0C3 seems like it was supposed to be BEQ to set the high X position bit if X position >= 100h,
; but it checks $14 after the width is added, so that would need to be fixed too to make the dead code useful
; The X position is checked to be < 100h by callers, so there is no point in doing this check anyway
; Tldr, $B0C0..D2 can be eliminated entirely
    LDX.W OAMStack                                                       ;94B0AA;
    CLC                                                                  ;94B0AD;
    LDA.B DP_Temp14                                                      ;94B0AE;
    STA.W OAMLow,X                                                       ;94B0B0;
    LDA.B DP_Temp12                                                      ;94B0B3;
    CLC                                                                  ;94B0B5;
    ADC.B DP_Temp1A                                                      ;94B0B6;
    STA.B DP_Temp12                                                      ;94B0B8;
    LDA.B DP_Temp14                                                      ;94B0BA;
    ADC.B DP_Temp1C                                                      ;94B0BC;
    STA.B DP_Temp14                                                      ;94B0BE;
    AND.W #$0100                                                         ;94B0C0;
    BRA +                                                                ;94B0C3;

; Nothing points to this
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;94B0C5; dead code
    STA.B DP_Temp22                                                      ;94B0C9;
    LDA.B (DP_Temp22)                                                    ;94B0CB;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;94B0CD;
    STA.B (DP_Temp22)                                                    ;94B0D1;

+   LDA.B DP_Temp18                                                      ;94B0D3;
    STA.W OAMLow+1,X                                                     ;94B0D5;
    LDA.B DP_Temp16                                                      ;94B0D8;
    CLC                                                                  ;94B0DA;
    ADC.B DP_Temp1E                                                      ;94B0DB;
    STA.B DP_Temp16                                                      ;94B0DD;
    LDA.B DP_Temp18                                                      ;94B0DF;
    ADC.B DP_Temp20                                                      ;94B0E1;
    STA.B DP_Temp18                                                      ;94B0E3;
    TYA                                                                  ;94B0E5;
    ORA.B DP_Temp26                                                      ;94B0E6;
    STA.W OAMLow+2,X                                                     ;94B0E8;
    TXA                                                                  ;94B0EB;
    CLC                                                                  ;94B0EC;
    ADC.W #$0004                                                         ;94B0ED;
    STA.W OAMStack                                                       ;94B0F0;
    RTS                                                                  ;94B0F3;


;;; $B0F4: Instruction - go to [[Y]] ;;;
Instruction_DrawGrappleBeam_GotoY:
    LDA.W $0000,Y                                                        ;94B0F4;
    TAY                                                                  ;94B0F7;
    RTS                                                                  ;94B0F8;


;;; $B0F9: Draw grapple beam end - not connected ;;;
DrawGrappleBeamEnd_NotConnected:
    LDA.W GrappleBeam_EndYPosition                                       ;94B0F9;
    SEC                                                                  ;94B0FC;
    SBC.W Layer1YPosition                                                ;94B0FD;
    BIT.W #$FF00                                                         ;94B100;
    BNE .return                                                          ;94B103;
    LDX.W OAMStack                                                       ;94B105;
    CLC                                                                  ;94B108;
    LDA.B DP_Temp14                                                      ;94B109;
    LDA.W GrappleBeam_EndXPosition                                       ;94B10B;
    SEC                                                                  ;94B10E;
    SBC.W Layer1XPosition                                                ;94B10F;
    SEC                                                                  ;94B112;
    SBC.W #$0004                                                         ;94B113;
    STA.W OAMLow,X                                                       ;94B116;
    AND.W #$0100                                                         ;94B119;
    BEQ +                                                                ;94B11C;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;94B11E;
    STA.B DP_Temp22                                                      ;94B122;
    LDA.B (DP_Temp22)                                                    ;94B124;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;94B126;
    STA.B (DP_Temp22)                                                    ;94B12A;

+   LDA.B DP_Temp18                                                      ;94B12C; >_<
    LDA.W GrappleBeam_EndYPosition                                       ;94B12E;
    SEC                                                                  ;94B131;
    SBC.W Layer1YPosition                                                ;94B132;
    SEC                                                                  ;94B135;
    SBC.W #$0004                                                         ;94B136;
    STA.W OAMLow+1,X                                                     ;94B139;
    LDA.W #$3A20                                                         ;94B13C;
    STA.W OAMLow+2,X                                                     ;94B13F;
    TXA                                                                  ;94B142;
    CLC                                                                  ;94B143;
    ADC.W #$0004                                                         ;94B144;
    STA.W OAMStack                                                       ;94B147;

  .return:
    RTS                                                                  ;94B14A;


;;; $B14B: Draw grapple beam end - connected ;;;
DrawGrappleBeamEnd_Connected:
; Equivalent to DrawGrappleBeamEnd_NotConnected
    LDX.W OAMStack                                                       ;94B14B;
    CLC                                                                  ;94B14E;
    LDA.W GrappleBeam_EndXPosition                                       ;94B14F;
    SEC                                                                  ;94B152;
    SBC.W Layer1XPosition                                                ;94B153;
    SBC.W #$0004                                                         ;94B156;
    STA.W OAMLow,X                                                       ;94B159;
    AND.W #$0100                                                         ;94B15C;
    BEQ +                                                                ;94B15F;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;94B161;
    STA.B DP_Temp22                                                      ;94B165;
    LDA.B (DP_Temp22)                                                    ;94B167;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;94B169;
    STA.B (DP_Temp22)                                                    ;94B16D;

+   LDA.W GrappleBeam_EndYPosition                                       ;94B16F;
    SEC                                                                  ;94B172;
    SBC.W Layer1YPosition                                                ;94B173;
    SBC.W #$0004                                                         ;94B176;
    STA.W OAMLow+1,X                                                     ;94B179;
    LDA.W #$3A20                                                         ;94B17C;
    STA.W OAMLow+2,X                                                     ;94B17F;
    TXA                                                                  ;94B182;
    CLC                                                                  ;94B183;
    ADC.W #$0004                                                         ;94B184;
    STA.W OAMStack                                                       ;94B187;
    RTS                                                                  ;94B18A;


;;; $B18B: Instruction lists - grapple segment animations ;;;
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


;;; $C800: Tiles - gunship liftoff dust clouds ;;;
Tiles_GunshipLiftoffDustClouds:
incbin "../data/Tiles_GunshipLiftoffDustClouds.bin" ; $1400 bytes


Freespace_Bank94_DC00:                                                   ;94DC00;
; $1400 bytes

warnpc $94E000
; see bank_94..99.asm
