Tilemap_HUD:
  .topRow
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F                   ;80988B;
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F                   ;80989B;
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F                   ;8098AB;
    dw $2C0F,$2C0F,$2C1D,$2C1D,$2C1D,$2C1D,$2C1D,$2C1C                   ;8098BB;

  .rows123
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F                   ;8098CB;
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F                   ;8098DB;
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F                   ;8098EB;
    dw $2C0F,$2C0F,$2C12,$2C12,$2C23,$2C12,$2C12,$2C1E                   ;8098FB;

    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F                   ;80990B;
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F                   ;80991B;
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F                   ;80992B;
    dw $2C0F,$2C0F,$2822,$2822,$2823,$2813,$2C14,$2C1E                   ;80993B;

    dw $2C0F,$2C0B,$2C0C,$2C0D,$2C32,$2C0F,$2C09,$2C0F                   ;80994B;
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F                   ;80995B;
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F                   ;80996B;
    dw $2C0F,$2C0F,$2C12,$2C12,$A824,$2815,$2C16,$2C1E                   ;80997B;

  .autoReserve
    dw $3C33,$3C46                                                       ;80998B;
    dw $3C47,$3C48                                                       ;80998F;
    dw $BC33,$BC46                                                       ;809993;

  .emptyAutoReserve
    dw $2C33,$2C46                                                       ;809997;
    dw $2C47,$2C48                                                       ;80999B;
    dw $AC33,$AC46                                                       ;80999F;

  .missiles
    dw $344B,$3449,$744B                                                 ;8099AD;
    dw $344C,$344A,$744C                                                 ;8099B3;

  .superMissiles
    dw $3434,$7434                                                       ;8099AF;
    dw $3435,$7435                                                       ;8099B3;

  .powerBombs
    dw $3436,$7436                                                       ;8099B7;
    dw $3437,$7437                                                       ;8099BB;

  .grapple
    dw $3438,$7438                                                       ;8099BF;
    dw $3439,$7439                                                       ;8099C3;

  .xray
    dw $343A,$743A                                                       ;8099C7;
    dw $343B,$743B                                                       ;8099CB;

AddMissilesToHUDTilemap:
    PHP                                                                  ;8099CF;
    PHB                                                                  ;8099D0;
    PHK                                                                  ;8099D1;
    PLB                                                                  ;8099D2;
    REP #$30                                                             ;8099D3;
    LDA.L $7EC61C                                                        ;8099D5;
    AND.W #$03FF                                                         ;8099D9;
    CMP.W #$000F                                                         ;8099DC;
    BNE .return                                                          ;8099DF;
    LDA.W Tilemap_HUD_missiles                                           ;8099E1;
    STA.L $7EC61C                                                        ;8099E4;
    LDA.W Tilemap_HUD_missiles+2                                         ;8099E8;
    STA.L $7EC61E                                                        ;8099EB;
    LDA.W Tilemap_HUD_missiles+4                                         ;8099EF;
    STA.L $7EC620                                                        ;8099F2;
    LDA.W Tilemap_HUD_missiles+6                                         ;8099F6;
    STA.L $7EC65C                                                        ;8099F9;
    LDA.W Tilemap_HUD_missiles+8                                         ;8099FD;
    STA.L $7EC65E                                                        ;809A00;
    LDA.W Tilemap_HUD_missiles+$A                                        ;809A04;
    STA.L $7EC660                                                        ;809A07;

.return:
    PLB                                                                  ;809A0B;
    PLP                                                                  ;809A0C;
    RTL                                                                  ;809A0D;


AddSuperMissilesToHUDTilemap:
    PHP                                                                  ;809A0E;
    PHX                                                                  ;809A0F;
    PHY                                                                  ;809A10;
    PHB                                                                  ;809A11;
    PHK                                                                  ;809A12;
    PLB                                                                  ;809A13;
    REP #$30                                                             ;809A14;
    LDY.W #Tilemap_HUD_superMissiles                                     ;809A16;
    LDX.W #$001C                                                         ;809A19;
    BRA Write2x2TileIconToHUDTilemap                                     ;809A1C;


AddPowerBombsToHUDTilemap:
    PHP                                                                  ;809A1E;
    PHX                                                                  ;809A1F;
    PHY                                                                  ;809A20;
    PHB                                                                  ;809A21;
    PHK                                                                  ;809A22;
    PLB                                                                  ;809A23;
    REP #$30                                                             ;809A24;
    LDY.W #Tilemap_HUD_powerBombs                                        ;809A26;
    LDX.W #$0022                                                         ;809A29;
    BRA Write2x2TileIconToHUDTilemap                                     ;809A2C;


AddGrappleToHUDTilemap:
    PHP                                                                  ;809A2E;
    PHX                                                                  ;809A2F;
    PHY                                                                  ;809A30;
    PHB                                                                  ;809A31;
    PHK                                                                  ;809A32;
    PLB                                                                  ;809A33;
    REP #$30                                                             ;809A34;
    LDY.W #Tilemap_HUD_grapple                                           ;809A36;
    LDX.W #$0028                                                         ;809A39;
    BRA Write2x2TileIconToHUDTilemap                                     ;809A3C;


AddXrayToHUDTilemap:
    PHP                                                                  ;809A3E;
    PHX                                                                  ;809A3F;
    PHY                                                                  ;809A40;
    PHB                                                                  ;809A41;
    PHK                                                                  ;809A42;
    PLB                                                                  ;809A43;
    REP #$30                                                             ;809A44;
    LDY.W #Tilemap_HUD_xray                                              ;809A46;
    LDX.W #$002E                                                         ;809A49;

Write2x2TileIconToHUDTilemap:
    LDA.L $7EC608,X                                                      ;809A4C;
    AND.W #$03FF                                                         ;809A50;
    CMP.W #$000F                                                         ;809A53;
    BNE .return                                                          ;809A56;
    LDA.W $0000,Y                                                        ;809A58;
    STA.L $7EC608,X                                                      ;809A5B;
    LDA.W $0002,Y                                                        ;809A5F;
    STA.L $7EC60A,X                                                      ;809A62;
    LDA.W $0004,Y                                                        ;809A66;
    STA.L $7EC648,X                                                      ;809A69;
    LDA.W $0006,Y                                                        ;809A6D;
    STA.L $7EC64A,X                                                      ;809A70;

.return:
    PLB                                                                  ;809A74;
    PLY                                                                  ;809A75;
    PLX                                                                  ;809A76;
    PLP                                                                  ;809A77;
    RTL                                                                  ;809A78;


InitialiseHUD_GameLoading:
    PHP                                                                  ;809A79;
    PHB                                                                  ;809A7A;
    PHK                                                                  ;809A7B;
    PLB                                                                  ;809A7C;
    REP #$30                                                             ;809A7D;
    LDA.W #$5800                                                         ;809A7F;
    STA.W $2116                                                          ;809A82;
    LDA.W #$0080                                                         ;809A85;
    STA.W $2115                                                          ;809A88;
    JSL.L SetupHDMATransfer                                              ;809A8B;
    db $01,$01,$18                                                       ;809A8F;
    dl Tilemap_HUD_topRow                                                ;809A92;
    dw $0040                                                             ;809A95;
    SEP #$20                                                             ;809A97;
    LDA.B #$02                                                           ;809A99;
    STA.W HW_MDMAEN                                                      ;809A9B;
    REP #$20                                                             ;809A9E;
    LDX.W #$0000                                                         ;809AA0;

.loopRows123:
    LDA.W Tilemap_HUD_rows123,X                                          ;809AA3;
    STA.L $7EC608,X                                                      ;809AA6;
    INX                                                                  ;809AAA;
    INX                                                                  ;809AAB;
    CPX.W #$00C0                                                         ;809AAC;
    BNE .loopRows123                                                     ;809AAF;
    LDA.W Equipment.equippedItems                                        ;809AB1;
    BIT.W #$8000                                                         ;809AB4;
    BEQ .grapple                                                         ;809AB7;
    JSL.L AddXrayToHUDTilemap                                            ;809AB9;

.grapple:
    LDA.W Equipment.equippedItems                                        ;809ABD;
    BIT.W #$4000                                                         ;809AC0;
    BEQ .missiles                                                        ;809AC3;
    JSL.L AddGrappleToHUDTilemap                                         ;809AC5;

.missiles:
    LDA.W Equipment.maxMissiles                                          ;809AC9;
    BEQ .superMissiles                                                   ;809ACC;
    JSL.L AddMissilesToHUDTilemap                                        ;809ACE;

.superMissiles:
    LDA.W Equipment.maxSuperMissiles                                     ;809AD2;
    BEQ .powerBombs                                                      ;809AD5;
    JSL.L AddSuperMissilesToHUDTilemap                                   ;809AD7;

.powerBombs:
    LDA.W Equipment.maxPowerBombs                                        ;809ADB;
    BEQ .previous                                                        ;809ADE;
    JSL.L AddPowerBombsToHUDTilemap                                      ;809AE0;

.previous:
    STZ.W $0A06                                                          ;809AE4;
    STZ.W $0A08                                                          ;809AE7;
    STZ.W $0A0A                                                          ;809AEA;
    STZ.W $0A0C                                                          ;809AED;
    STZ.W $0A0E                                                          ;809AF0;
    JSL.L Initialise_Minimap_broken                                      ;809AF3;
    LDA.W #Tilemap_HUDDigits_ammo                                        ;809AF7;
    STA.B $00                                                            ;809AFA;
    LDA.W #Tilemap_HUDDigits_ammo>>16                                    ;809AFC;
    STA.B $02                                                            ;809AFF;
    LDA.W Equipment.maxMissiles                                          ;809B01;
    BEQ .maxSuperMissiles                                                ;809B04;
    LDA.W Equipment.currentMissiles                                      ;809B06;
    LDX.W #$0094                                                         ;809B09;
    JSR.W DrawThreeHUDDigits                                             ;809B0C;

.maxSuperMissiles:
    LDA.W Equipment.maxSuperMissiles                                     ;809B0F;
    BEQ .maxPowerBombs                                                   ;809B12;
    LDX.W #$009C                                                         ;809B14;
    LDA.W Equipment.currentSuperMissiles                                 ;809B17;
    JSR.W DrawTwoHUDDigits                                               ;809B1A;

.maxPowerBombs:
    LDA.W Equipment.maxPowerBombs                                        ;809B1D;
    BEQ .highlight                                                       ;809B20;
    LDA.W Equipment.currentPowerBombs                                    ;809B22;
    LDX.W #$00A2                                                         ;809B25;
    JSR.W DrawTwoHUDDigits                                               ;809B28;

.highlight:
    LDA.W Equipment.selectedHudItem                                      ;809B2B;
    LDX.W #$1000                                                         ;809B2E;
    JSR.W ToggleHUDItemHighlight                                         ;809B31;
    LDA.W $0A0E                                                          ;809B34;
    LDX.W #$1400                                                         ;809B37;
    JSR.W ToggleHUDItemHighlight                                         ;809B3A;
    JSL.L HandleHUDTilemap_PausedAndRunning                              ;809B3D;
    PLB                                                                  ;809B41;
    PLP                                                                  ;809B42;
    RTL                                                                  ;809B43;


HandleHUDTilemap_PausedAndRunning:
    PHP                                                                  ;809B44;
    PHB                                                                  ;809B45;
    PHK                                                                  ;809B46;
    PLB                                                                  ;809B47;
    SEP #$20                                                             ;809B48;
    STZ.B $02                                                            ;809B4A;
    REP #$30                                                             ;809B4C;
    LDA.W Equipment.reserveTankMode                                      ;809B4E;
    CMP.W #$0001                                                         ;809B51;
    BNE .handleSamusHealth                                               ;809B54;
    LDY.W #Tilemap_HUD_autoReserve                                       ;809B56;
    LDA.W Equipment.currentReserveEnergy                                 ;809B59;
    BNE .drawAutoReserve                                                 ;809B5C;
    LDY.W #Tilemap_HUD_emptyAutoReserve                                  ;809B5E;

.drawAutoReserve:
    LDA.W $0000,Y                                                        ;809B61;
    STA.L $7EC618                                                        ;809B64;
    LDA.W $0002,Y                                                        ;809B68;
    STA.L $7EC61A                                                        ;809B6B;
    LDA.W $0004,Y                                                        ;809B6F;
    STA.L $7EC658                                                        ;809B72;
    LDA.W $0006,Y                                                        ;809B76;
    STA.L $7EC65A                                                        ;809B79;
    LDA.W $0008,Y                                                        ;809B7D;
    STA.L $7EC698                                                        ;809B80;
    LDA.W $000A,Y                                                        ;809B84;
    STA.L $7EC69A                                                        ;809B87;

.handleSamusHealth:
    LDA.W Equipment.currentEnergy                                        ;809B8B;
    CMP.W $0A06                                                          ;809B8E;
    BEQ .handleSamusMissiles                                             ;809B91;
    STA.W $0A06                                                          ;809B93;
    LDA.W Equipment.currentEnergy                                        ;809B96;
    STA.W HW_WRDIV                                                       ;809B99;
    SEP #$20                                                             ;809B9C;
    LDA.B #$64                                                           ;809B9E;
    STA.W HW_WRDIVB                                                      ;809BA0;
    PHA                                                                  ;809BA3;
    PLA                                                                  ;809BA4;
    PHA                                                                  ;809BA5;
    PLA                                                                  ;809BA6;
    REP #$20                                                             ;809BA7;
    LDA.W $4214                                                          ;809BA9;
    STA.B $14                                                            ;809BAC;
    LDA.W HW_RDMPY                                                       ;809BAE;
    STA.B $12                                                            ;809BB1;
    LDA.W Equipment.maxEnergy                                            ;809BB3;
    STA.W HW_WRDIV                                                       ;809BB6;
    SEP #$20                                                             ;809BB9;
    LDA.B #$64                                                           ;809BBB;
    STA.W HW_WRDIVB                                                      ;809BBD;
    PHA                                                                  ;809BC0;
    PLA                                                                  ;809BC1;
    PHA                                                                  ;809BC2;
    PLA                                                                  ;809BC3;
    REP #$30                                                             ;809BC4;
    LDY.W #$0000                                                         ;809BC6;
    LDA.W $4214                                                          ;809BC9;
    INC A                                                                ;809BCC;
    STA.B $16                                                            ;809BCD;

.loopEtanks:
    DEC.B $16                                                            ;809BCF;
    BEQ .drawEtanksDigits                                                ;809BD1;
    LDX.W #$3430                                                         ;809BD3;
    LDA.B $14                                                            ;809BD6;
    BEQ .drawEtanks                                                      ;809BD8;
    DEC.B $14                                                            ;809BDA;
    LDX.W #$2831                                                         ;809BDC;

.drawEtanks:
    TXA                                                                  ;809BDF;
    LDX.W .etankIconOffsets,Y                                            ;809BE0;
    STA.L $7EC608,X                                                      ;809BE3;
    INY                                                                  ;809BE7;
    INY                                                                  ;809BE8;
    CPY.W #$001C                                                         ;809BE9;
    BMI .loopEtanks                                                      ;809BEC;

.drawEtanksDigits:
    LDA.W #Tilemap_HUDDigits_health                                      ;809BEE;
    STA.B $00                                                            ;809BF1;
    LDX.W #$008C                                                         ;809BF3;
    LDA.B $12                                                            ;809BF6;
    JSR.W DrawTwoHUDDigits                                               ;809BF8;

.handleSamusMissiles:
    LDA.W #Tilemap_HUDDigits_ammo                                        ;809BFB;
    STA.B $00                                                            ;809BFE;
    LDA.W Equipment.maxMissiles                                          ;809C00;
    BEQ .handleSuperMissiles                                             ;809C03;
    LDA.W Equipment.currentMissiles                                      ;809C05;
    CMP.W $0A08                                                          ;809C08;
    BEQ .handleSuperMissiles                                             ;809C0B;
    STA.W $0A08                                                          ;809C0D;
    LDX.W #$0094                                                         ;809C10;
    JSR.W DrawThreeHUDDigits                                             ;809C13;

.handleSuperMissiles:
    LDA.W Equipment.maxSuperMissiles                                     ;809C16;
    BEQ .handlePowerBombs                                                ;809C19;
    LDA.W Equipment.currentSuperMissiles                                 ;809C1B;
    CMP.W $0A0A                                                          ;809C1E;
    BEQ .handlePowerBombs                                                ;809C21;
    STA.W $0A0A                                                          ;809C23;
    LDX.W #$009C                                                         ;809C26;
    LDA.W $05CF                                                          ;809C29;
    BIT.W #$1F40                                                         ;809C2C;
    BNE .debugSuperMissiles                                              ;809C2F;
    LDA.W $0A0A                                                          ;809C31;
    JSR.W DrawTwoHUDDigits                                               ;809C34;
    BRA .handlePowerBombs                                                ;809C37;


.debugSuperMissiles:
    LDA.W $0A0A                                                          ;809C39;
    JSR.W DrawThreeHUDDigits                                             ;809C3C;

.handlePowerBombs:
    LDA.W Equipment.maxPowerBombs                                        ;809C3F;
    BEQ .handleHighlighter                                               ;809C42;
    LDA.W Equipment.currentPowerBombs                                    ;809C44;
    CMP.W $0A0C                                                          ;809C47;
    BEQ .handleHighlighter                                               ;809C4A;
    STA.W $0A0C                                                          ;809C4C;
    LDX.W #$00A2                                                         ;809C4F;
    JSR.W DrawTwoHUDDigits                                               ;809C52;

.handleHighlighter:
    LDA.W Equipment.selectedHudItem                                      ;809C55;
    CMP.W $0A0E                                                          ;809C58;
    BEQ .handleAutoCancel                                                ;809C5B;
    LDX.W #$1000                                                         ;809C5D;
    JSR.W ToggleHUDItemHighlight                                         ;809C60;
    LDA.W $0A0E                                                          ;809C63;
    LDX.W #$1400                                                         ;809C66;
    JSR.W ToggleHUDItemHighlight                                         ;809C69;
    LDA.W Equipment.selectedHudItem                                      ;809C6C;
    STA.W $0A0E                                                          ;809C6F;
    LDA.W $0A1F                                                          ;809C72;
    AND.W #$00FF                                                         ;809C75;
    CMP.W #$0003                                                         ;809C78;
    BEQ .handleAutoCancel                                                ;809C7B;
    CMP.W #$0014                                                         ;809C7D;
    BEQ .handleAutoCancel                                                ;809C80;
    LDA.W $0D32                                                          ;809C82;
    CMP.W #GrappleBeamFunction_Inactive                                  ;809C85;
    BNE .handleAutoCancel                                                ;809C88;
    LDA.W $0A78                                                          ;809C8A;
    BNE .handleAutoCancel                                                ;809C8D;
    LDA.W #$0039                                                         ;809C8F;
    JSL.L QueueSound_Lib1_Max6                                           ;809C92;

.handleAutoCancel:
    LDX.W #$1400                                                         ;809C96;
    LDA.W $05B5                                                          ;809C99;
    BIT.W #$0010                                                         ;809C9C;
    BEQ .highlight                                                       ;809C9F;
    LDX.W #$1000                                                         ;809CA1;

.highlight:
    LDA.W $0A04                                                          ;809CA4;
    JSR.W ToggleHUDItemHighlight                                         ;809CA7;
    LDX.W $0330                                                          ;809CAA;
    LDA.W #$00C0                                                         ;809CAD;
    STA.B $D0,X                                                          ;809CB0;
    INX                                                                  ;809CB2;
    INX                                                                  ;809CB3;
    LDA.W #$C608                                                         ;809CB4; $7E
    STA.B $D0,X                                                          ;809CB7;
    INX                                                                  ;809CB9;
    INX                                                                  ;809CBA;
    LDA.W #$007E                                                         ;809CBB;
    STA.B $D0,X                                                          ;809CBE;
    INX                                                                  ;809CC0;
    LDA.W #$5820                                                         ;809CC1;
    STA.B $D0,X                                                          ;809CC4;
    INX                                                                  ;809CC6;
    INX                                                                  ;809CC7;
    STX.W $0330                                                          ;809CC8;
    PLB                                                                  ;809CCB;
    PLP                                                                  ;809CCC;
    RTL                                                                  ;809CCD;


.etankIconOffsets:
    dw $0042,$0044,$0046,$0048,$004A,$004C,$004E                         ;809CCE; bottom (first) row
    dw $0002,$0004,$0006,$0008,$000A,$000C,$000E                         ;809CDE; top (second) row

ToggleHUDItemHighlight:
    STX.W $077C                                                          ;809CEA;
    DEC A                                                                ;809CED;
    BMI .return                                                          ;809CEE;
    ASL A                                                                ;809CF0;
    TAY                                                                  ;809CF1;
    LDX.W .HUDItemOffsets,Y                                              ;809CF2;
    LDA.L $7EC608,X                                                      ;809CF5;
    CMP.W #$2C0F                                                         ;809CF9;
    BEQ .topRightMiddle                                                  ;809CFC;
    AND.W #$E3FF                                                         ;809CFE;
    ORA.W $077C                                                          ;809D01;
    STA.L $7EC608,X                                                      ;809D04;

.topRightMiddle:
    LDA.L $7EC60A,X                                                      ;809D08;
    CMP.W #$2C0F                                                         ;809D0C;
    BEQ .bottomLeft                                                      ;809D0F;
    AND.W #$E3FF                                                         ;809D11;
    ORA.W $077C                                                          ;809D14;
    STA.L $7EC60A,X                                                      ;809D17;

.bottomLeft:
    LDA.L $7EC648,X                                                      ;809D1B;
    CMP.W #$2C0F                                                         ;809D1F;
    BEQ .bottomRightMiddle                                               ;809D22;
    AND.W #$E3FF                                                         ;809D24;
    ORA.W $077C                                                          ;809D27;
    STA.L $7EC648,X                                                      ;809D2A;

.bottomRightMiddle:
    LDA.L $7EC64A,X                                                      ;809D2E;
    CMP.W #$2C0F                                                         ;809D32;
    BEQ .checkY                                                          ;809D35;
    AND.W #$E3FF                                                         ;809D37;
    ORA.W $077C                                                          ;809D3A;
    STA.L $7EC64A,X                                                      ;809D3D;

.checkY:
    CPY.W #$0000                                                         ;809D41;
    BEQ .topRight                                                        ;809D44;
    RTS                                                                  ;809D46;


.topRight:
    LDA.L $7EC60C,X                                                      ;809D47;
    CMP.W #$2C0F                                                         ;809D4B;
    BEQ .bottomRight                                                     ;809D4E;
    AND.W #$E3FF                                                         ;809D50;
    ORA.W $077C                                                          ;809D53;
    STA.L $7EC60C,X                                                      ;809D56;

.bottomRight:
    LDA.L $7EC64C,X                                                      ;809D5A;
    CMP.W #$2C0F                                                         ;809D5E;
    BEQ .return                                                          ;809D61;
    AND.W #$E3FF                                                         ;809D63;
    ORA.W $077C                                                          ;809D66;
    STA.L $7EC64C,X                                                      ;809D69;

.return:
    RTS                                                                  ;809D6D;

.HUDItemOffsets:
    dw $0014                                                             ;809D6E; Missiles
    dw $001C                                                             ;809D70; Super missiles
    dw $0022                                                             ;809D72; Power bombs
    dw $0028                                                             ;809D74; Grapple beam
    dw $002E                                                             ;809D76; X-ray

DrawThreeHUDDigits:
    STA.W HW_WRDIV                                                       ;809D78;
    SEP #$20                                                             ;809D7B;
    LDA.B #$64                                                           ;809D7D;
    STA.W HW_WRDIVB                                                      ;809D7F;
    PHA                                                                  ;809D82;
    PLA                                                                  ;809D83;
    PHA                                                                  ;809D84;
    PLA                                                                  ;809D85;
    REP #$20                                                             ;809D86;
    LDA.W $4214                                                          ;809D88;
    ASL A                                                                ;809D8B;
    TAY                                                                  ;809D8C;
    LDA.B [$00],Y                                                        ;809D8D;
    STA.L $7EC608,X                                                      ;809D8F;
    INX                                                                  ;809D93;
    INX                                                                  ;809D94;
    LDA.W HW_RDMPY                                                       ;809D95;

DrawTwoHUDDigits:
    STA.W HW_WRDIV                                                       ;809D98;
    SEP #$20                                                             ;809D9B;
    LDA.B #$0A                                                           ;809D9D;
    STA.W HW_WRDIVB                                                      ;809D9F;
    PHA                                                                  ;809DA2;
    PLA                                                                  ;809DA3;
    PHA                                                                  ;809DA4;
    PLA                                                                  ;809DA5;
    REP #$20                                                             ;809DA6;
    LDA.W $4214                                                          ;809DA8;
    ASL A                                                                ;809DAB;
    TAY                                                                  ;809DAC;
    LDA.B [$00],Y                                                        ;809DAD;
    STA.L $7EC608,X                                                      ;809DAF;
    LDA.W HW_RDMPY                                                       ;809DB3;
    ASL A                                                                ;809DB6;
    TAY                                                                  ;809DB7;
    LDA.B [$00],Y                                                        ;809DB8;
    STA.L $7EC60A,X                                                      ;809DBA;
    RTS                                                                  ;809DBE;


Tilemap_HUDDigits:
  .health
    dw $2C09,$2C00,$2C01,$2C02,$2C03,$2C04,$2C05,$2C06                   ;809DBF;
    dw $2C07,$2C08                                                       ;809DCF;

  .ammo
    dw $2C09,$2C00,$2C01,$2C02,$2C03,$2C04,$2C05,$2C06                   ;809DD3;
    dw $2C07,$2C08                                                       ;809DE3;
