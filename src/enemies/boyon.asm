BoyonPal:
    dw $3800,$4BBE,$06B9,$00EA,$0065,$173A,$0276,$01F2                   ;A28687;
    dw $014D,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A28697;

InstList_Boyon_Idle_0:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A286A7;
    dw RTL_A288C5                                                        ;A286A9;

InstList_Boyon_Idle_1:
    dw $000A                                                             ;A286AB;
    dw Spritemap_Boyon_Idle_0                                            ;A286AD;
    dw $000A                                                             ;A286AF;
    dw Spritemap_Boyon_Idle_1                                            ;A286B1;
    dw $000A                                                             ;A286B3;
    dw Spritemap_Boyon_Idle_2                                            ;A286B5;
    dw $000A                                                             ;A286B7;
    dw Spritemap_Boyon_Idle_1                                            ;A286B9;
    dw Instruction_CommonA2_GotoY                                        ;A286BB;
    dw InstList_Boyon_Idle_1                                             ;A286BD;

InstList_Boyon_Bouncing_0:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A286BF;
    dw Instruction_Boyon_StartBounce                                     ;A286C1;

InstList_Boyon_Bouncing_1:
    dw $0005                                                             ;A286C3;
    dw Spritemap_Boyon_Bouncing_0                                        ;A286C5;
    dw $0005                                                             ;A286C7;
    dw Spritemap_Boyon_Bouncing_1                                        ;A286C9;
    dw $0005                                                             ;A286CB;
    dw Spritemap_Boyon_Bouncing_2                                        ;A286CD;
    dw $0005                                                             ;A286CF;
    dw Spritemap_Boyon_Bouncing_3                                        ;A286D1;
    dw $0005                                                             ;A286D3;
    dw Spritemap_Boyon_Bouncing_2                                        ;A286D5;
    dw $0005                                                             ;A286D7;
    dw Spritemap_Boyon_Bouncing_1                                        ;A286D9;
    dw Instruction_Common_GotoY                                          ;A286DB;
    dw InstList_Boyon_Bouncing_1                                         ;A286DD;

BoyonData_speedMultipliers:
    dw $0001,$0002,$0004,$0008,$000A,$000D,$0010,$0014                   ;A286DF;

BoyonData_jumpHeights:
    dw $3000,$4000,$5000,$6000,$7000,$8000,$9000,$A000                   ;A286EF;
    dw $B000                                                             ;A286FF;

BoyonData_speedTable:
    db $00,$01,$03,$06,$0A,$0F,$15,$1C,$24,$2D,$37,$42,$4E,$5B,$69,$78   ;A28701;
    db $88,$99,$AB,$BE,$D2,$E7,$FD                                       ;A28711;

BoyonData_bounceFunctionPointers:
    dw BoyonFunctionFalling                                              ;A28718;
    dw BoyonFunctionJumping                                              ;A2871A;

BoyonInit:
    LDX.W $0E54                                                          ;A2871C;
    LDA.W #Spritemap_CommonA2_Nothing                                    ;A2871F;
    STA.W EnemyData.pSpritemap,X                                         ;A28722;
    JSR.W BoyonSetIdleInstList                                           ;A28725;
    LDA.W #$0001                                                         ;A28728;
    STA.L $7E7802,X                                                      ;A2872B;
    LDA.W EnemyData.initParam0,X                                         ;A2872F;
    AND.W #$00FF                                                         ;A28732;
    ASL A                                                                ;A28735;
    TAY                                                                  ;A28736;
    LDA.W BoyonData_speedMultipliers,Y                                   ;A28737;
    STA.W EnemyData.work0,X                                              ;A2873A;
    LDA.W EnemyData.initParam0+1,X                                       ;A2873D;
    AND.W #$00FF                                                         ;A28740;
    ASL A                                                                ;A28743;
    TAY                                                                  ;A28744;
    LDA.W BoyonData_jumpHeights,Y                                        ;A28745;
    STA.W EnemyData.work2,X                                              ;A28748;
    STZ.W EnemyData.work3,X                                              ;A2874B;
    STZ.W EnemyData.work4,X                                              ;A2874E;
    STZ.W EnemyData.work5,X                                              ;A28751;
    RTL                                                                  ;A28754;


BoyonCalculateInitialBounceSpeed:
    PHP                                                                  ;A28755;

.loop:
    LDY.W EnemyData.work4,X                                              ;A28756;
    SEP #$20                                                             ;A28759;
    LDA.W BoyonData_speedTable,Y                                         ;A2875B;
    CPY.W #$0017                                                         ;A2875E;
    BMI +                                                                ;A28761;
    LDA.B #$FF                                                           ;A28763;

  + STA.W HW_WRMPYA                                                      ;A28765;
    LDA.W EnemyData.work0,X                                              ;A28768;
    STA.W HW_WRMPYB                                                      ;A2876B;
    NOP                                                                  ;A2876E;
    NOP                                                                  ;A2876F;
    NOP                                                                  ;A28770;
    REP #$20                                                             ;A28771;
    LDA.W HW_RDMPY                                                       ;A28773;
    STA.W EnemyData.work1,X                                              ;A28776;
    CLC                                                                  ;A28779;
    ADC.W EnemyData.work3,X                                              ;A2877A;
    STA.W EnemyData.work3,X                                              ;A2877D;
    INC.W EnemyData.work4,X                                              ;A28780;
    CMP.W EnemyData.work2,X                                              ;A28783;
    BMI .loop                                                            ;A28786;
    LDA.W EnemyData.work4,X                                              ;A28788;
    STA.L $7E7800,X                                                      ;A2878B;
    LDA.W #$0001                                                         ;A2878F;
    STA.L $7E7804,X                                                      ;A28792;
    STA.L $7E7808,X                                                      ;A28796;
    PLP                                                                  ;A2879A;
    RTS                                                                  ;A2879B;


BoyonMain:
    LDX.W $0E54                                                          ;A2879C;
    LDA.L $7E780A,X                                                      ;A2879F;
    BNE .notJumping                                                      ;A287A3;
    JSR.W BoyonCalculateInitialBounceSpeed                               ;A287A5;
    LDA.W #$0001                                                         ;A287A8;
    STA.L $7E780A,X                                                      ;A287AB;
    RTL                                                                  ;A287AF;


.notJumping:
    LDA.W EnemyData.work0,X                                              ;A287B0;
    STA.L $7E7806,X                                                      ;A287B3;
    JSR.W BoyonCheckIfSamusIsInProximity                                 ;A287B7;
    BNE .SamusInProximity                                                ;A287BA;
    LDA.L $7E7804,X                                                      ;A287BC;
    BEQ .bouncing                                                        ;A287C0;
    LDA.L $7E7808,X                                                      ;A287C2;
    BNE .return                                                          ;A287C6;
    LDA.W #$0001                                                         ;A287C8;
    STA.L $7E7808,X                                                      ;A287CB;
    JSR.W BoyonSetIdleInstList                                           ;A287CF;
    BRA .return                                                          ;A287D2;


.SamusInProximity:
    LDA.W #$0000                                                         ;A287D4;
    STA.L $7E7804,X                                                      ;A287D7;
    STA.L $7E7808,X                                                      ;A287DB;
    LDA.W EnemyData.work5,X                                              ;A287DF;
    BNE .bouncing                                                        ;A287E2;
    LDA.W #$0001                                                         ;A287E4;
    STA.W EnemyData.work5,X                                              ;A287E7;
    JSR.W BoyonSetBouncingInstList                                       ;A287EA;

.bouncing:
    LDX.W $0E54                                                          ;A287ED;
    LDA.L $7E7806,X                                                      ;A287F0;
    STA.W EnemyData.work0,X                                              ;A287F4;
    LDA.L $7E7802,X                                                      ;A287F7;
    ASL A                                                                ;A287FB;
    TAX                                                                  ;A287FC;
    JSR.W (BoyonData_bounceFunctionPointers,X)                           ;A287FD;

.return:
    RTL                                                                  ;A28800;


BoyonFunctionFalling:
    LDX.W $0E54                                                          ;A28801;
    INC.W EnemyData.work4,X                                              ;A28804;
    LDY.W EnemyData.work4,X                                              ;A28807;
    SEP #$20                                                             ;A2880A;
    LDA.W BoyonData_speedTable,Y                                         ;A2880C;
    CPY.W #$0017                                                         ;A2880F;
    BMI .lessThan17                                                      ;A28812;
    LDA.B #$FF                                                           ;A28814;

.lessThan17:
    STA.W HW_WRMPYA                                                      ;A28816;
    LDA.W EnemyData.work0,X                                              ;A28819;
    STA.W HW_WRMPYB                                                      ;A2881C;
    NOP                                                                  ;A2881F;
    NOP                                                                  ;A28820;
    NOP                                                                  ;A28821;
    REP #$20                                                             ;A28822;
    LDA.W HW_RDMPY                                                       ;A28824;
    STA.W EnemyData.work1,X                                              ;A28827;
    XBA                                                                  ;A2882A;
    AND.W #$00FF                                                         ;A2882B;
    CLC                                                                  ;A2882E;
    ADC.W EnemyData.yPosition,X                                          ;A2882F;
    STA.W EnemyData.yPosition,X                                          ;A28832;
    LDA.W EnemyData.work4,X                                              ;A28835;
    CMP.L $7E7800,X                                                      ;A28838;
    BMI .return                                                          ;A2883C;
    LDA.W #$0001                                                         ;A2883E;
    STA.L $7E7802,X                                                      ;A28841;
    LDA.W #$0001                                                         ;A28845;
    STA.L $7E7804,X                                                      ;A28848;
    STZ.W EnemyData.work5,X                                              ;A2884C;

.return:
    RTS                                                                  ;A2884F;


BoyonFunctionJumping:
    LDX.W $0E54                                                          ;A28850;
    LDY.W EnemyData.work4,X                                              ;A28853;
    SEP #$20                                                             ;A28856;
    LDA.W BoyonData_speedTable,Y                                         ;A28858;
    CPY.W #$0017                                                         ;A2885B;
    BMI .lessThan17                                                      ;A2885E;
    LDA.B #$FF                                                           ;A28860;

.lessThan17:
    STA.W HW_WRMPYA                                                      ;A28862;
    LDA.W EnemyData.work0,X                                              ;A28865;
    STA.W HW_WRMPYB                                                      ;A28868;
    NOP                                                                  ;A2886B;
    NOP                                                                  ;A2886C;
    NOP                                                                  ;A2886D;
    REP #$20                                                             ;A2886E;
    LDA.W HW_RDMPY                                                       ;A28870;
    STA.W EnemyData.work1,X                                              ;A28873;
    XBA                                                                  ;A28876;
    AND.W #$00FF                                                         ;A28877;
    EOR.W #$FFFF                                                         ;A2887A;
    INC A                                                                ;A2887D;
    CLC                                                                  ;A2887E;
    ADC.W EnemyData.yPosition,X                                          ;A2887F;
    STA.W EnemyData.yPosition,X                                          ;A28882;
    DEC.W EnemyData.work4,X                                              ;A28885;
    BMI .doneJumping                                                     ;A28888;
    BRA .return                                                          ;A2888A;


.doneJumping:
    LDA.W #$0000                                                         ;A2888C;
    STA.L $7E7802,X                                                      ;A2888F;

.return:
    RTS                                                                  ;A28893;


BoyonCheckIfSamusIsInProximity:
    LDX.W $0E54                                                          ;A28894;
    LDA.W EnemyData.initParam1,X                                         ;A28897;
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A2889A;
    RTS                                                                  ;A2889E;


BoyonSetIdleInstList:
    LDX.W $0E54                                                          ;A2889F;
    LDA.W #InstList_Boyon_Idle_0                                         ;A288A2;
    STA.W EnemyData.pInstList,X                                          ;A288A5;
    LDA.W #$0001                                                         ;A288A8;
    STA.W EnemyData.instTimer,X                                          ;A288AB;
    STZ.W EnemyData.loopCounter,X                                        ;A288AE;
    RTS                                                                  ;A288B1;


BoyonSetBouncingInstList:
    LDX.W $0E54                                                          ;A288B2;
    LDA.W #InstList_Boyon_Bouncing_0                                     ;A288B5;
    STA.W EnemyData.pInstList,X                                          ;A288B8;
    LDA.W #$0001                                                         ;A288BB;
    STA.W EnemyData.instTimer,X                                          ;A288BE;
    STZ.W EnemyData.loopCounter,X                                        ;A288C1;
    RTS                                                                  ;A288C4;


RTL_A288C5:
    RTL                                                                  ;A288C5;


Instruction_Boyon_StartBounce:
    LDX.W $0E54                                                          ;A288C6;
    LDA.W #$0000                                                         ;A288C9;
    STA.L $7E7804,X                                                      ;A288CC;
    LDA.W #$000E                                                         ;A288D0;
    JSL.L QueueSound_Lib2_Max6                                           ;A288D3;
    RTL                                                                  ;A288D7;


RTL_A288D8:
    RTL                                                                  ;A288D8;


RTL_A288D9:
    RTL                                                                  ;A288D9;


Spritemap_Boyon_Idle_0:
    dw $0001                                                             ;A288DA;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Boyon_Idle_1:
    dw $0001                                                             ;A288E1;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $102)

Spritemap_Boyon_Idle_2:
    dw $0001                                                             ;A288E8;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $104)

Spritemap_Boyon_Bouncing_0:
    dw $0001                                                             ;A288EF;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $106)

Spritemap_Boyon_Bouncing_1:
    dw $0001                                                             ;A288F6;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $108)

Spritemap_Boyon_Bouncing_2:
    dw $0001                                                             ;A288FD;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $10A)

Spritemap_Boyon_Bouncing_3:
    dw $0001                                                             ;A28904;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $10C)

UNUSED_Spritemap_Boyon_A2890B:
    dw $0001                                                             ;A2890B;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $10E)
