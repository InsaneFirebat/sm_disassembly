Update_IO_Registers:
    LDX.B $84                                                            ;8091EE;
    STX.W $4200                                                          ;8091F0;
    LDX.B $51                                                            ;8091F3;
    STX.W $2100                                                          ;8091F5;
    LDX.B $52                                                            ;8091F8;
    STX.W $2101                                                          ;8091FA;
    LDX.B $55                                                            ;8091FD;
    STX.W $2105                                                          ;8091FF;
    LDX.B $57                                                            ;809202;
    STX.W $2106                                                          ;809204;
    LDX.B $58                                                            ;809207;
    STX.W $2107                                                          ;809209;
    LDX.B $59                                                            ;80920C;
    STX.W $2108                                                          ;80920E;
    LDX.B $5A                                                            ;809211;
    STX.W $2109                                                          ;809213;
    LDX.B $5C                                                            ;809216;
    STX.W $210A                                                          ;809218;
    LDX.B $5D                                                            ;80921B;
    STX.W $210B                                                          ;80921D;
    LDX.B $5E                                                            ;809220;
    STX.W $210C                                                          ;809222;
    LDX.B $5F                                                            ;809225;
    STX.W $211A                                                          ;809227;
    LDX.B $60                                                            ;80922A;
    STX.W $2123                                                          ;80922C;
    LDX.B $61                                                            ;80922F;
    STX.W $2124                                                          ;809231;
    LDX.B $62                                                            ;809234;
    STX.W $2125                                                          ;809236;
    LDX.B $63                                                            ;809239;
    STX.W $2126                                                          ;80923B;
    LDX.B $64                                                            ;80923E;
    STX.W $2127                                                          ;809240;
    LDX.B $65                                                            ;809243;
    STX.W $2128                                                          ;809245;
    LDX.B $66                                                            ;809248;
    STX.W $2129                                                          ;80924A;
    LDX.B $67                                                            ;80924D;
    STX.W $212A                                                          ;80924F;
    LDX.B $68                                                            ;809252;
    STX.W $212B                                                          ;809254;
    LDX.B $69                                                            ;809257;
    STX.B $6A                                                            ;809259;
    STX.W $212C                                                          ;80925B;
    LDX.B $6C                                                            ;80925E;
    STX.W $212E                                                          ;809260;
    LDX.B $6B                                                            ;809263;
    STX.W $212D                                                          ;809265;
    LDX.B $6D                                                            ;809268;
    STX.W $212F                                                          ;80926A;
    LDX.B $6F                                                            ;80926D;
    STX.W $2130                                                          ;80926F;
    LDX.B $72                                                            ;809272;
    STX.W $2131                                                          ;809274;
    LDX.B $6E                                                            ;809277;
    STX.B $70                                                            ;809279;
    LDX.B $71                                                            ;80927B;
    STX.B $73                                                            ;80927D;
    LDX.B $74                                                            ;80927F;
    STX.W $2132                                                          ;809281;
    LDX.B $75                                                            ;809284;
    STX.W $2132                                                          ;809286;
    LDX.B $76                                                            ;809289;
    STX.W $2132                                                          ;80928B;
    LDX.B $77                                                            ;80928E;
    STX.W $2133                                                          ;809290;
    LDX.B $B1                                                            ;809293;
    STX.W $210D                                                          ;809295;
    LDX.B $B2                                                            ;809298;
    STX.W $210D                                                          ;80929A;
    LDX.B $B3                                                            ;80929D;
    STX.W $210E                                                          ;80929F;
    LDX.B $B4                                                            ;8092A2;
    STX.W $210E                                                          ;8092A4;
    LDX.B $B5                                                            ;8092A7;
    STX.W $210F                                                          ;8092A9;
    LDX.B $B6                                                            ;8092AC;
    STX.W $210F                                                          ;8092AE;
    LDX.B $B7                                                            ;8092B1;
    STX.W $2110                                                          ;8092B3;
    LDX.B $B8                                                            ;8092B6;
    STX.W $2110                                                          ;8092B8;
    LDX.B $B9                                                            ;8092BB;
    STX.W $2111                                                          ;8092BD;
    LDX.B $BA                                                            ;8092C0;
    STX.W $2111                                                          ;8092C2;
    LDX.B $BB                                                            ;8092C5;
    STX.W $2112                                                          ;8092C7;
    LDX.B $BC                                                            ;8092CA;
    STX.W $2112                                                          ;8092CC;
    LDX.B $BD                                                            ;8092CF;
    STX.W $2113                                                          ;8092D1;
    LDX.B $BE                                                            ;8092D4;
    STX.W $2113                                                          ;8092D6;
    LDX.B $BF                                                            ;8092D9;
    STX.W $2114                                                          ;8092DB;
    LDX.B $C0                                                            ;8092DE;
    STX.W $2114                                                          ;8092E0;
    LDX.B $56                                                            ;8092E3;
    STX.W $07EC                                                          ;8092E5;
    LDA.B $55                                                            ;8092E8;
    AND.W #$0007                                                         ;8092EA;
    CMP.W #$0007                                                         ;8092ED;
    BEQ .mode7                                                           ;8092F0;
    LDA.B $56                                                            ;8092F2;
    AND.W #$0007                                                         ;8092F4;
    CMP.W #$0007                                                         ;8092F7;
    BEQ .mode7                                                           ;8092FA;
    RTS                                                                  ;8092FC;


.mode7:
    LDX.B $78                                                            ;8092FD;
    STX.W $211B                                                          ;8092FF;
    LDX.B $79                                                            ;809302;
    STX.W $211B                                                          ;809304;
    LDX.B $7A                                                            ;809307;
    STX.W $211C                                                          ;809309;
    LDX.B $7B                                                            ;80930C;
    STX.W $211C                                                          ;80930E;
    LDX.B $7C                                                            ;809311;
    STX.W $211D                                                          ;809313;
    LDX.B $7D                                                            ;809316;
    STX.W $211D                                                          ;809318;
    LDX.B $7E                                                            ;80931B;
    STX.W $211E                                                          ;80931D;
    LDX.B $7F                                                            ;809320;
    STX.W $211E                                                          ;809322;
    LDX.B $80                                                            ;809325;
    STX.W $211F                                                          ;809327;
    LDX.B $81                                                            ;80932A;
    STX.W $211F                                                          ;80932C;
    LDX.B $82                                                            ;80932F;
    STX.W $2120                                                          ;809331;
    LDX.B $83                                                            ;809334;
    STX.W $2120                                                          ;809336;
    RTS                                                                  ;809339;


UpdateOAM_CGRAM:
    LDA.W #$0400                                                         ;80933A;
    STA.W $4300                                                          ;80933D;
    LDA.W #$0370                                                         ;809340;
    STA.W $4302                                                          ;809343;
    LDX.B #$00                                                           ;809346;
    STX.W $4304                                                          ;809348;
    LDA.W #$0220                                                         ;80934B;
    STA.W $4305                                                          ;80934E;
    STZ.W $2102                                                          ;809351;
    LDA.W #$2200                                                         ;809354;
    STA.W $4310                                                          ;809357;
    LDA.W #$C000                                                         ;80935A; $7E
    STA.W $4312                                                          ;80935D;
    LDX.B #$7E                                                           ;809360;
    STX.W $4314                                                          ;809362;
    LDA.W #$0200                                                         ;809365;
    STA.W $4315                                                          ;809368;
    LDX.B #$00                                                           ;80936B;
    STX.W $2121                                                          ;80936D;
    LDX.B #$03                                                           ;809370;
    STX.W HW_MDMAEN                                                      ;809372;
    RTS                                                                  ;809375;


TransferSamusTilesToVRAM:
    PHB                                                                  ;809376;
    LDX.B #SamusTilesDefinitions>>16                                     ;809377;
    PHX                                                                  ;809379;
    PLB                                                                  ;80937A;
    LDX.B #$02                                                           ;80937B;
    LDY.B #$80                                                           ;80937D;
    STY.W $2115                                                          ;80937F;
    LDY.W $071D                                                          ;809382;
    BEQ .bottom                                                          ;809385;
    LDY.B #$02                                                           ;809387;
    LDA.W $071F                                                          ;809389;
    STA.B $3C                                                            ;80938C;
    LDA.W #$6000                                                         ;80938E;
    STA.W $2116                                                          ;809391;
    LDA.W #$1801                                                         ;809394;
    STA.W $4310                                                          ;809397;
    LDA.B ($3C)                                                          ;80939A;
    STA.W $4312                                                          ;80939C;
    STA.B $14                                                            ;80939F;
    LDA.B ($3C),Y                                                        ;8093A1;
    STA.W $4314                                                          ;8093A3;
    INY                                                                  ;8093A6;
    LDA.B ($3C),Y                                                        ;8093A7;
    STA.W $4315                                                          ;8093A9;
    CLC                                                                  ;8093AC;
    ADC.B $14                                                            ;8093AD;
    STA.B $14                                                            ;8093AF;
    INY                                                                  ;8093B1;
    INY                                                                  ;8093B2;
    STX.W HW_MDMAEN                                                      ;8093B3;
    LDA.W #$6100                                                         ;8093B6;
    STA.W $2116                                                          ;8093B9;
    LDA.B $14                                                            ;8093BC;
    STA.W $4312                                                          ;8093BE;
    LDA.B ($3C),Y                                                        ;8093C1;
    BEQ .bottom                                                          ;8093C3;
    STA.W $4315                                                          ;8093C5;
    STX.W HW_MDMAEN                                                      ;8093C8;

.bottom:
    LDY.W $071E                                                          ;8093CB;
    BEQ .return                                                          ;8093CE;
    LDY.B #$02                                                           ;8093D0;
    LDA.W $0721                                                          ;8093D2;
    STA.B $3C                                                            ;8093D5;
    LDA.W #$6080                                                         ;8093D7;
    STA.W $2116                                                          ;8093DA;
    LDA.W #$1801                                                         ;8093DD;
    STA.W $4310                                                          ;8093E0;
    LDA.B ($3C)                                                          ;8093E3;
    STA.W $4312                                                          ;8093E5;
    STA.B $14                                                            ;8093E8;
    LDA.B ($3C),Y                                                        ;8093EA;
    STA.W $4314                                                          ;8093EC;
    INY                                                                  ;8093EF;
    LDA.B ($3C),Y                                                        ;8093F0;
    STA.W $4315                                                          ;8093F2;
    CLC                                                                  ;8093F5;
    ADC.B $14                                                            ;8093F6;
    STA.B $14                                                            ;8093F8;
    INY                                                                  ;8093FA;
    INY                                                                  ;8093FB;
    STX.W HW_MDMAEN                                                      ;8093FC;
    LDA.W #$6180                                                         ;8093FF;
    STA.W $2116                                                          ;809402;
    LDA.B $14                                                            ;809405;
    STA.W $4312                                                          ;809407;
    LDA.B ($3C),Y                                                        ;80940A;
    BEQ .return                                                          ;80940C;
    STA.W $4315                                                          ;80940E;
    STX.W HW_MDMAEN                                                      ;809411;

.return:
    PLB                                                                  ;809414;
    RTS                                                                  ;809415;


ProcessAnimatedTilesObjectVRAMTransfers:
    PHB                                                                  ;809416;
    LDX.B #AnimatedTilesObjects>>16                                      ;809417;
    PHX                                                                  ;809419;
    PLB                                                                  ;80941A;
    LDA.W $1EF1                                                          ;80941B;
    BPL .return                                                          ;80941E;
    LDX.B #$0A                                                           ;809420;

.loop:
    LDA.W $1EF5,X                                                        ;809422;
    BEQ .next                                                            ;809425;
    LDA.W $1F25,X                                                        ;809427;
    BEQ .next                                                            ;80942A;
    STA.W $4302                                                          ;80942C;
    LDY.B #$87                                                           ;80942F;
    STY.W $4304                                                          ;809431;
    LDA.W #$1801                                                         ;809434;
    STA.W $4300                                                          ;809437;
    LDA.W $1F31,X                                                        ;80943A;
    STA.W $4305                                                          ;80943D;
    LDA.W $1F3D,X                                                        ;809440;
    STA.W $2116                                                          ;809443;
    LDY.B #$80                                                           ;809446;
    STY.W $2115                                                          ;809448;
    LDY.B #$01                                                           ;80944B;
    STY.W HW_MDMAEN                                                      ;80944D;
    STZ.W $1F25,X                                                        ;809450;

.next:
    DEX                                                                  ;809453;
    DEX                                                                  ;809454;
    BPL .loop                                                            ;809455;

.return:
    PLB                                                                  ;809457;
    RTS                                                                  ;809458;


ReadControllerInput:
    PHP                                                                  ;809459;
    SEP #$20                                                             ;80945A;

.wait:
    LDA.W $4212                                                          ;80945C;
    AND.B #$01                                                           ;80945F;
    BNE .wait                                                            ;809461;
    REP #$20                                                             ;809463;
    LDA.W $4218                                                          ;809465;
    STA.B $8B                                                            ;809468;
    EOR.B $97                                                            ;80946A;
    AND.B $8B                                                            ;80946C;
    STA.B $8F                                                            ;80946E;
    STA.B $93                                                            ;809470;
    LDA.B $8B                                                            ;809472;
    BEQ .unheld                                                          ;809474;
    CMP.B $97                                                            ;809476;
    BNE .unheld                                                          ;809478;
    DEC.B $A3                                                            ;80947A;
    BNE .heldEnd                                                         ;80947C;
    LDA.B $8B                                                            ;80947E;
    STA.B $93                                                            ;809480;
    LDA.B $89                                                            ;809482;
    STA.B $A3                                                            ;809484;
    BRA .heldEnd                                                         ;809486;


.unheld:
    LDA.B $87                                                            ;809488;
    STA.B $A3                                                            ;80948A;

.heldEnd:
    LDA.B $8B                                                            ;80948C;
    STA.B $97                                                            ;80948E;
    LDA.W $05D1                                                          ;809490;
    BNE .debug                                                           ;809493;
    PLP                                                                  ;809495;
    RTL                                                                  ;809496;


.debug:
    LDA.W $421A                                                          ;809497;
    STA.B $8D                                                            ;80949A;
    EOR.B $99                                                            ;80949C;
    AND.B $8D                                                            ;80949E;
    STA.B $91                                                            ;8094A0;
    STA.B $95                                                            ;8094A2;
    LDA.B $8D                                                            ;8094A4;
    BEQ .unheld2                                                         ;8094A6;
    CMP.B $99                                                            ;8094A8;
    BNE .unheld2                                                         ;8094AA;
    DEC.B $A5                                                            ;8094AC;
    BNE .held2End                                                        ;8094AE;
    LDA.B $8D                                                            ;8094B0;
    STA.B $95                                                            ;8094B2;
    LDA.B $89                                                            ;8094B4;
    STA.B $A5                                                            ;8094B6;
    BRA .held2End                                                        ;8094B8;


.unheld2:
    LDA.B $87                                                            ;8094BA;
    STA.B $A5                                                            ;8094BC;

.held2End:
    LDA.B $8D                                                            ;8094BE;
    STA.B $99                                                            ;8094C0;
    LDA.W $0617                                                          ;8094C2;
    BNE .checkDebug                                                      ;8094C5;
    LDA.B $8B                                                            ;8094C7;
    CMP.W #$3030                                                         ;8094C9;
    BNE .checkDebug                                                      ;8094CC;
    STZ.W $05F5                                                          ;8094CE;
    JMP.W SoftReset                                                      ;8094D1;


.checkDebug:
    LDA.W $05D1                                                          ;8094D4;
    BNE .debugEnabled                                                    ;8094D7;
    STZ.W $05C5                                                          ;8094D9;
    STZ.W $05C7                                                          ;8094DC;
    LDA.W #$FFEF                                                         ;8094DF;
    TRB.B $8D                                                            ;8094E2;
    TRB.B $91                                                            ;8094E4;
    PLP                                                                  ;8094E6;
    RTL                                                                  ;8094E7;


.debugEnabled:
    STZ.W $05C5                                                          ;8094E8;
    STZ.W $05C7                                                          ;8094EB;
    BIT.W $05CF                                                          ;8094EE;
    BVC .debugInputEnabled                                               ;8094F1;
    JMP.W .return                                                        ;8094F3;


.debugInputEnabled:
    LDA.B $8B                                                            ;8094F6;
    AND.W #$2020                                                         ;8094F8;
    CMP.W #$2020                                                         ;8094FB;
    BNE .checkSelectR                                                    ;8094FE;
    LDA.B $8F                                                            ;809500;
    STA.W $05C5                                                          ;809502;
    STZ.B $8B                                                            ;809505;
    STZ.B $8F                                                            ;809507;

.checkSelectR:
    LDA.B $8B                                                            ;809509;
    AND.W #$2010                                                         ;80950B;
    CMP.W #$2010                                                         ;80950E;
    BNE .checkToggleHUD                                                  ;809511;
    LDA.B $8F                                                            ;809513;
    STA.W $05C7                                                          ;809515;
    LDA.W #$E0F0                                                         ;809518; >_<
    STZ.B $8B                                                            ;80951B;
    STZ.B $8F                                                            ;80951D;

.checkToggleHUD:
    LDA.W $05C7                                                          ;80951F;
    BIT.W #$0080                                                         ;809522;
    BEQ .checkAmmoSwap                                                   ;809525;
    LDA.B $84                                                            ;809527;
    EOR.W #$0030                                                         ;809529;
    STA.B $84                                                            ;80952C;

.checkAmmoSwap:
    LDA.W $05C7                                                          ;80952E;
    BIT.W #$8000                                                         ;809531;
    BEQ .swapEnd                                                         ;809534;
    LDA.W $05CF                                                          ;809536;
    EOR.W #$8000                                                         ;809539;
    STA.W $05CF                                                          ;80953C;
    BPL .swapAmmo                                                        ;80953F;
    LDA.W $09C6                                                          ;809541;
    STA.W $05C9                                                          ;809544;
    LDA.W $09CA                                                          ;809547;
    STA.W $05CB                                                          ;80954A;
    LDA.W $09CE                                                          ;80954D;
    STA.W $05CD                                                          ;809550;
    STZ.W $09C6                                                          ;809553;
    STZ.W $09CA                                                          ;809556;
    STZ.W $09CE                                                          ;809559;
    BRA .swapEnd                                                         ;80955C;


.swapAmmo:
    LDA.W $05C9                                                          ;80955E;
    STA.W $09C6                                                          ;809561;
    LDA.W $05CB                                                          ;809564;
    STA.W $09CA                                                          ;809567;
    LDA.W $05CD                                                          ;80956A;
    STA.W $09CE                                                          ;80956D;

.swapEnd:
    LDA.W $05C7                                                          ;809570;
    BIT.W #$0040                                                         ;809573;
    BEQ .return                                                          ;809576;
    LDA.W $05CF                                                          ;809578;
    EOR.W #$2000                                                         ;80957B;
    STA.W $05CF                                                          ;80957E;

.return:
    PLP                                                                  ;809581;
    RTL                                                                  ;809582;


NMI:
    REP #$30                                                             ;809583;
    JML.L .bank80                                                        ;809585;


.bank80:
    PHB                                                                  ;809589;
    PHD                                                                  ;80958A;
    PHA                                                                  ;80958B;
    PHX                                                                  ;80958C;
    PHY                                                                  ;80958D;
    PHK                                                                  ;80958E;
    PLB                                                                  ;80958F;
    LDA.W #$0000                                                         ;809590;
    TCD                                                                  ;809593;
    SEP #$10                                                             ;809594;
    LDX.W $4210                                                          ;809596;
    LDX.W $05B4                                                          ;809599;
    BEQ .lag                                                             ;80959C;
    JSR.W UpdateOAM_CGRAM                                                ;80959E;
    JSR.W TransferSamusTilesToVRAM                                       ;8095A1;
    JSR.W ProcessAnimatedTilesObjectVRAMTransfers                        ;8095A4;
    JSR.W Update_IO_Registers                                            ;8095A7;
    LDX.B #$00                                                           ;8095AA;

.handleHDMAQueue:
    LDA.W $18B4,X                                                        ;8095AC;
    BEQ .next                                                            ;8095AF;
    LDY.W $18C0,X                                                        ;8095B1;
    LDA.W $18D8,X                                                        ;8095B4;
    STA.W $4302,Y                                                        ;8095B7;

.next:
    INX                                                                  ;8095BA;
    INX                                                                  ;8095BB;
    CPX.B #$0C                                                           ;8095BC;
    BNE .handleHDMAQueue                                                 ;8095BE;
    LDX.B $55                                                            ;8095C0;
    CPX.B #$07                                                           ;8095C2;
    BEQ .mode7Enabled                                                    ;8095C4;
    LDX.B $56                                                            ;8095C6;
    CPX.B #$07                                                           ;8095C8;
    BNE .mode7Disabled                                                   ;8095CA;

.mode7Enabled:
    JSL.L HandleMode7Transfers                                           ;8095CC;

.mode7Disabled:
    JSL.L HandleVRAMWriteTable_ScrollingDMAs                             ;8095D0;
    JSL.L HandleVRAMReadTable                                            ;8095D4;
    SEP #$10                                                             ;8095D8;
    REP #$20                                                             ;8095DA;
    LDX.B $85                                                            ;8095DC;
    STX.W HW_HDMAEN                                                      ;8095DE;
    JSL.L ReadControllerInput                                            ;8095E1;
    LDX.B #$00                                                           ;8095E5;
    STX.W $05B4                                                          ;8095E7;
    STX.W $05BA                                                          ;8095EA;
    LDX.W $05B5                                                          ;8095ED;
    INX                                                                  ;8095F0;
    STX.W $05B5                                                          ;8095F1;
    INC.W $05B6                                                          ;8095F4;

.return:
    REP #$30                                                             ;8095F7;
    INC.W $05B8                                                          ;8095F9;
    PLY                                                                  ;8095FC;
    PLX                                                                  ;8095FD;
    PLA                                                                  ;8095FE;
    PLD                                                                  ;8095FF;
    PLB                                                                  ;809600;
    RTI                                                                  ;809601;


.lag:
    LDX.W $05BA                                                          ;809602;
    INX                                                                  ;809605;
    STX.W $05BA                                                          ;809606;
    LDX.W $05BA                                                          ;809609;
    CPX.W $05BB                                                          ;80960C;
    BCC .return                                                          ;80960F;
    STX.W $05BB                                                          ;809611;
    BRA .return                                                          ;809614;
