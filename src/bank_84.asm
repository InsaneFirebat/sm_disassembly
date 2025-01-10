
org $848000


GoldenTorizo_HealthBasedPalette_Handling:
    PHX                                                                  ;848000;
    PHY                                                                  ;848001;
    PHB                                                                  ;848002;
    PHK                                                                  ;848003;
    PLB                                                                  ;848004;
    XBA                                                                  ;848005;
    AND.W #$0078                                                         ;848006;
    BIT.W #$0040                                                         ;848009;
    BEQ +                                                                ;84800C;
    LDA.W #$0038                                                         ;84800E;

  + ASL A                                                                ;848011;
    ASL A                                                                ;848012;
    ORA.W #$001E                                                         ;848013;
    TAY                                                                  ;848016;
    LDX.W #$001E                                                         ;848017;

.loop:
    LDA.W .palette2,Y                                                    ;84801A;
    STA.L $7EC140,X                                                      ;84801D;
    LDA.W .palette1,Y                                                    ;848021;
    STA.L $7EC120,X                                                      ;848024;
    DEY                                                                  ;848028;
    DEY                                                                  ;848029;
    DEX                                                                  ;84802A;
    DEX                                                                  ;84802B;
    BPL .loop                                                            ;84802C;
    PLB                                                                  ;84802E;
    PLY                                                                  ;84802F;
    PLX                                                                  ;848030;
    RTL                                                                  ;848031;


.palette1:                                                               ;848032;
    dw $1000,$56BA,$41B2,$1447,$0403,$4E15,$3570,$24CB,$1868,$6F7F,$51F8,$410E,$031F,$01DA,$00F5,$0C63 ; 0..7FFh
    dw $1000,$56DB,$39D3,$1047,$0403,$4636,$2D91,$20EC,$1489,$6F9B,$5215,$3D2C,$133B,$0DF6,$0CF2,$0C63 ; 800h..FFFh
    dw $1000,$52FB,$31F4,$1067,$0402,$3E76,$25B2,$192D,$10A9,$6F96,$5251,$396A,$2756,$1A13,$190F,$0863 ; 1000h..17FFh
    dw $1000,$531C,$2A15,$0C67,$0402,$3697,$1DD3,$154E,$0CCA,$6FB2,$526E,$3588,$3772,$262F,$250C,$0863 ; 1800h..1FFFh
    dw $1000,$4F5C,$1E56,$0888,$0001,$2EB8,$1A13,$116F,$0CEB,$73AD,$4EAA,$35A6,$4B8D,$364B,$3509,$0443 ; 2000h..27FFh
    dw $1000,$4F7D,$1677,$0488,$0001,$26D9,$1234,$0D90,$090C,$73C9,$4EC7,$31C4,$5BA9,$4267,$4106,$0443 ; 2800h..2FFFh
    dw $1000,$4B9D,$0E98,$04A8,$0000,$1F19,$0A55,$05D1,$052C,$73C4,$4F03,$2E02,$6FC4,$4E84,$4D23,$0043 ; 3000h..37FFh
    dw $0000,$4BBE,$06B9,$00A8,$0000,$173A,$0276,$01F2,$014D,$73E0,$4F20,$2A20,$7FE0,$5AA0,$5920,$0043 ; 3800h+

.palette2:                                                               ;848132;
    dw $1000,$4215,$2D0D,$0002,$0000,$3970,$20CB,$0C26,$0403,$463A,$28B3,$1809,$6F7F,$51FD,$4113,$0C63 ; 0..7FFh
    dw $1000,$4236,$252E,$0002,$0000,$3191,$1CEC,$0C47,$0424,$4656,$28D0,$1428,$6F7B,$51F9,$40F0,$0C63 ; 800h..FFFh
    dw $1000,$3E56,$214F,$0002,$0000,$29D1,$190D,$0888,$0424,$4693,$290E,$1046,$6F76,$4DF5,$40EE,$0842 ; 1000h..17FFh
    dw $1000,$3E77,$1970,$0002,$0000,$21F2,$152E,$08A9,$0445,$46AF,$292B,$0C65,$6F72,$4DF1,$40CB,$0842 ; 1800h..1FFFh
    dw $1000,$3AB7,$15B1,$0003,$0000,$1A13,$0D6E,$04CA,$0066,$4ACB,$2568,$0C84,$6B4D,$4A0C,$44C8,$0421 ; 2000h..27FFh
    dw $1000,$3AD8,$0DD2,$0003,$0000,$1234,$098F,$04EB,$0087,$4AE7,$2585,$08A3,$6B49,$4A08,$44A5,$0421 ; 2800h..2FFFh
    dw $1000,$36F8,$09F3,$0003,$0000,$0A74,$05B0,$012C,$0087,$4B24,$25C3,$04C1,$6B44,$4604,$44A3,$0000 ; 3000h..37FFh
    dw $1000,$3719,$0214,$0003,$0000,$0295,$01D1,$014D,$00A8,$4B40,$25E0,$00E0,$6B40,$4600,$4480,$0000 ; 3800h+

Load_Room_PLM_Graphics:
    PHP                                                                  ;848232;
    PHB                                                                  ;848233;
    REP #$30                                                             ;848234;
    PHK                                                                  ;848236;
    PLB                                                                  ;848237;
    STZ.W $1C2D                                                          ;848238;
    LDX.W #$0000                                                         ;84823B;

.loop:
    PHX                                                                  ;84823E;
    LDY.W $1C2F,X                                                        ;84823F;
    JSR.W Instruction_PLM_LoadItemPLMGFX                                 ;848242;
    PLX                                                                  ;848245;
    INX                                                                  ;848246;
    INX                                                                  ;848247;
    CPX.W #$0008                                                         ;848248;
    BNE .loop                                                            ;84824B;
    PLB                                                                  ;84824D;
    PLP                                                                  ;84824E;
    RTL                                                                  ;84824F;


Clear_Sounds_When_Going_Through_Door:
    LDA.W #$001D                                                         ;848250;
    JSL.L Run_Samus_Command                                              ;848253;
    RTL                                                                  ;848257;


UNUSED_Clear_SpinJumpSound_GoingThroughDoor_848258:
    LDA.W $0A1E                                                          ;848258;
    AND.W #$FF00                                                         ;84825B;
    CMP.W #$0300                                                         ;84825E;
    BEQ .playSound                                                       ;848261;
    CMP.W #$1400                                                         ;848263;
    BNE .return                                                          ;848266;

.playSound:
    LDA.W #$0032                                                         ;848268;
    JSL.L QueueSound                                                     ;84826B;

.return:
    RTL                                                                  ;84826F;


Play_SpinJumpSound_if_SpinJumping:
    LDA.W #$001C                                                         ;848270;
    JSL.L Run_Samus_Command                                              ;848273;
    RTL                                                                  ;848277;


UNUSED_Play_Resumed_SpinJumpSound_848278:
    LDA.W $0A1E                                                          ;848278;
    AND.W #$FF00                                                         ;84827B;
    CMP.W #$0300                                                         ;84827E;
    BEQ .playSound                                                       ;848281;
    CMP.W #$1400                                                         ;848283;
    BNE .return                                                          ;848286;

.playSound:
    LDA.W #$0030                                                         ;848288;
    JSL.L QueueSound                                                     ;84828B;

.return:
    RTL                                                                  ;84828F;


Calculate_PLM_Block_Coordinates:
    LDA.W $1C87,X                                                        ;848290;
    LSR A                                                                ;848293;
    STA.W HW_WRDIV                                                       ;848294;
    SEP #$20                                                             ;848297;
    LDA.W $07A5                                                          ;848299;
    STA.W HW_WRDIVB                                                      ;84829C;
    REP #$20                                                             ;84829F;
    NOP                                                                  ;8482A1;
    NOP                                                                  ;8482A2;
    NOP                                                                  ;8482A3;
    NOP                                                                  ;8482A4;
    NOP                                                                  ;8482A5;
    NOP                                                                  ;8482A6;
    LDA.W $4214                                                          ;8482A7;
    STA.W $1C2B                                                          ;8482AA;
    LDA.W HW_RDMPY                                                       ;8482AD;
    STA.W $1C29                                                          ;8482B0;
    RTL                                                                  ;8482B3;


Write_Level_Data_Block_Type_and_BTS:
    PHX                                                                  ;8482B4;
    STA.B $12                                                            ;8482B5;
    SEP #$20                                                             ;8482B7;
    LDA.L $7F0003,X                                                      ;8482B9;
    AND.B #$0F                                                           ;8482BD;
    ORA.B $13                                                            ;8482BF;
    STA.L $7F0003,X                                                      ;8482C1;
    REP #$20                                                             ;8482C5;
    TXA                                                                  ;8482C7;
    LSR A                                                                ;8482C8;
    TAX                                                                  ;8482C9;
    SEP #$20                                                             ;8482CA;
    LDA.B $12                                                            ;8482CC;
    STA.L $7F6402,X                                                      ;8482CE;
    REP #$20                                                             ;8482D2;
    PLX                                                                  ;8482D4;
    RTS                                                                  ;8482D5;


Write_Row_of_Level_Data_Block_and_BTS:
    PHX                                                                  ;8482D6;
    PHY                                                                  ;8482D7;
    LDY.W #$0001                                                         ;8482D8;
    LDA.B ($05,S),Y                                                      ;8482DB;
    STA.B $12                                                            ;8482DD;
    INY                                                                  ;8482DF;
    INY                                                                  ;8482E0;
    LDA.B ($05,S),Y                                                      ;8482E1;
    STA.B $14                                                            ;8482E3;
    INY                                                                  ;8482E5;
    INY                                                                  ;8482E6;
    LDA.B ($05,S),Y                                                      ;8482E7;
    STA.B $16                                                            ;8482E9;
    LDA.B $05,S                                                          ;8482EB;
    CLC                                                                  ;8482ED;
    ADC.W #$0006                                                         ;8482EE;
    STA.B $05,S                                                          ;8482F1;
    LDA.W $1C87,X                                                        ;8482F3;
    TAX                                                                  ;8482F6;
    LSR A                                                                ;8482F7;
    PHA                                                                  ;8482F8;
    LDA.B $12                                                            ;8482F9;
    LDY.B $16                                                            ;8482FB;

.loopLevelData:
    STA.L $7F0002,X                                                      ;8482FD;
    INX                                                                  ;848301;
    INX                                                                  ;848302;
    DEY                                                                  ;848303;
    BNE .loopLevelData                                                   ;848304;
    SEP #$20                                                             ;848306;
    PLX                                                                  ;848308;
    LDA.B $14                                                            ;848309;
    LDY.B $16                                                            ;84830B;

.loopBTS:
    STA.L $7F6402,X                                                      ;84830D;
    INX                                                                  ;848311;
    DEY                                                                  ;848312;
    BNE .loopBTS                                                         ;848313;
    REP #$20                                                             ;848315;
    PLY                                                                  ;848317;
    PLX                                                                  ;848318;
    RTS                                                                  ;848319;


Load_Item_and_Room_Special_Xray_Blocks:
    PHP                                                                  ;84831A;
    PHB                                                                  ;84831B;
    REP #$30                                                             ;84831C;
    PHX                                                                  ;84831E;
    PHY                                                                  ;84831F;
    PHK                                                                  ;848320;
    PLB                                                                  ;848321;
    LDX.W #$004E                                                         ;848322;

.loopPLM:
    LDA.W $1C37,X                                                        ;848325;
    CMP.W #PreInstruction_PLM_GotoLinkInstructionIfTriggered             ;848328;
    BCC .next                                                            ;84832B;
    PHX                                                                  ;84832D;
    LDA.W $1DC7,X                                                        ;84832E;
    BMI .next                                                            ;848331;
    JSL.L BitIndexToByteIndexAndBitmask                                  ;848333;
    LDA.L $7ED870,X                                                      ;848337;
    PLX                                                                  ;84833B;
    AND.W $05E7                                                          ;84833C;
    BNE .next                                                            ;84833F;
    PHX                                                                  ;848341;
    JSL.L Calculate_PLM_Block_Coordinates                                ;848342;
    LDA.L $7EDF0C,X                                                      ;848346;
    TAY                                                                  ;84834A;
    LDX.W .InstructionPointers,Y                                         ;84834B;
    LDA.W $0002,X                                                        ;84834E;
    AND.W #$0FFF                                                         ;848351;
    LDX.W $1C29                                                          ;848354;
    LDY.W $1C2B                                                          ;848357;
    JSL.L LoadBlockToXrayBG2Tilemap                                      ;84835A;
    PLX                                                                  ;84835E;

.next:
    DEX                                                                  ;84835F;
    DEX                                                                  ;848360;
    BPL .loopPLM                                                         ;848361;
    LDX.W $07BB                                                          ;848363;
    LDA.L $8F0010,X                                                      ;848366;
    BEQ .return                                                          ;84836A;
    TAX                                                                  ;84836C;

.loopRoomVar:
    LDA.L $8F0000,X                                                      ;84836D;
    BEQ .return                                                          ;848371;
    AND.W #$00FF                                                         ;848373;
    STA.B $12                                                            ;848376;
    LDA.L $8F0001,X                                                      ;848378;
    AND.W #$00FF                                                         ;84837C;
    STA.B $14                                                            ;84837F;
    PHX                                                                  ;848381;
    LDA.L $8F0002,X                                                      ;848382;
    LDX.B $12                                                            ;848386;
    LDY.B $14                                                            ;848388;
    JSL.L LoadBlockToXrayBG2Tilemap                                      ;84838A;
    PLX                                                                  ;84838E;
    TXA                                                                  ;84838F;
    CLC                                                                  ;848390;
    ADC.W #$0004                                                         ;848391;
    TAX                                                                  ;848394;
    JMP.W .loopRoomVar                                                   ;848395;


.return:
    PLY                                                                  ;848398;
    PLX                                                                  ;848399;
    PLB                                                                  ;84839A;
    PLP                                                                  ;84839B;
    RTL                                                                  ;84839C;


.InstructionPointers:
    dw DrawInst_DrawItemFrame0_0                                         ;84839D;
    dw DrawInst_DrawItemFrame0_1                                         ;84839F;
    dw DrawInst_DrawItemFrame0_2                                         ;8483A1;
    dw DrawInst_DrawItemFrame0_3                                         ;8483A3;
    dw DrawInst_EnergyTank_0                                             ;8483A5;
    dw DrawInst_MissileTank_1                                            ;8483A7;
    dw DrawInst_SuperMissileTank_1                                       ;8483A9;
    dw DrawInst_PowerBombTank_0                                          ;8483AB;

Enable_PLMs:
    PHP                                                                  ;8483AD;
    REP #$20                                                             ;8483AE;
    LDA.W #$8000                                                         ;8483B0;
    TSB.W $1C23                                                          ;8483B3;
    PLP                                                                  ;8483B6;
    RTL                                                                  ;8483B7;


Disable_PLMs:
    PHP                                                                  ;8483B8;
    REP #$20                                                             ;8483B9;
    LDA.W #$8000                                                         ;8483BB;
    TRB.W $1C23                                                          ;8483BE;
    PLP                                                                  ;8483C1;
    RTL                                                                  ;8483C2;


Clear_PLMs:
    PHP                                                                  ;8483C3;
    REP #$30                                                             ;8483C4;
    PHX                                                                  ;8483C6;
    LDX.W #$004E                                                         ;8483C7;

.loop:
    STZ.W $1C37,X                                                        ;8483CA;
    DEX                                                                  ;8483CD;
    DEX                                                                  ;8483CE;
    BPL .loop                                                            ;8483CF;
    STZ.W $1C2D                                                          ;8483D1;
    PLX                                                                  ;8483D4;
    PLP                                                                  ;8483D5;
    RTL                                                                  ;8483D6;


Spawn_Hardcoded_PLM:
    PHB                                                                  ;8483D7;
    PHY                                                                  ;8483D8;
    PHX                                                                  ;8483D9;
    PHK                                                                  ;8483DA;
    PLB                                                                  ;8483DB;
    LDY.W #$004E                                                         ;8483DC;

.loop:
    LDA.W $1C37,Y                                                        ;8483DF;
    BEQ .found                                                           ;8483E2;
    DEY                                                                  ;8483E4;
    DEY                                                                  ;8483E5;
    BPL .loop                                                            ;8483E6;
    LDA.B $06,S                                                          ;8483E8;
    CLC                                                                  ;8483EA;
    ADC.W #$0004                                                         ;8483EB;
    STA.B $06,S                                                          ;8483EE;
    PLX                                                                  ;8483F0;
    PLY                                                                  ;8483F1;
    PLB                                                                  ;8483F2;
    SEC                                                                  ;8483F3;
    RTL                                                                  ;8483F4;


.found:
    SEP #$20                                                             ;8483F5;
    LDA.B $08,S                                                          ;8483F7;
    PHA                                                                  ;8483F9;
    PLB                                                                  ;8483FA;
    TYX                                                                  ;8483FB;
    LDY.W #$0002                                                         ;8483FC;
    LDA.B ($06,S),Y                                                      ;8483FF;
    STA.W HW_WRMPYA                                                      ;848401;
    LDA.W $07A5                                                          ;848404;
    STA.W HW_WRMPYB                                                      ;848407;
    LDY.W #$0001                                                         ;84840A;
    LDA.B ($06,S),Y                                                      ;84840D;
    REP #$20                                                             ;84840F;
    AND.W #$00FF                                                         ;848411;
    CLC                                                                  ;848414;
    ADC.W HW_RDMPY                                                       ;848415;
    ASL A                                                                ;848418;
    STA.W $1C87,X                                                        ;848419;
    LDY.W #$0003                                                         ;84841C;
    LDA.B ($06,S),Y                                                      ;84841F;
    TXY                                                                  ;848421;
    TAX                                                                  ;848422;
    LDA.B $06,S                                                          ;848423;
    CLC                                                                  ;848425;
    ADC.W #$0004                                                         ;848426;
    STA.B $06,S                                                          ;848429;
    PHK                                                                  ;84842B;
    PLB                                                                  ;84842C;
    TXA                                                                  ;84842D;
    STA.W $1C37,Y                                                        ;84842E;
    TYX                                                                  ;848431;
    TAY                                                                  ;848432;
    LDA.W #$0000                                                         ;848433;
    STA.W $1DC7,X                                                        ;848436;
    STA.L $7EDF0C,X                                                      ;848439;
    LDA.W #RTS_848469                                                    ;84843D;
    STA.W $1CD7,X                                                        ;848440;
    LDA.W $0002,Y                                                        ;848443;
    STA.W $1D27,X                                                        ;848446;
    LDA.W #$0001                                                         ;848449;
    STA.L $7EDE1C,X                                                      ;84844C;
    LDA.W #InstList_PLM_DefaultPLMDrawInstruction                        ;848450;
    STA.L $7EDE6C,X                                                      ;848453;
    STZ.W $1D77,X                                                        ;848457;
    STX.W $1C27                                                          ;84845A;
    TYX                                                                  ;84845D;
    LDY.W $1C27                                                          ;84845E;
    JSR.W ($0000,X)                                                      ;848461;
    PLX                                                                  ;848464;
    PLY                                                                  ;848465;
    PLB                                                                  ;848466;
    CLC                                                                  ;848467;
    RTL                                                                  ;848468;


RTS_848469:
    RTS                                                                  ;848469;


Spawn_Room_PLM:
    PHP                                                                  ;84846A;
    PHB                                                                  ;84846B;
    PHY                                                                  ;84846C;
    PHX                                                                  ;84846D;
    PHK                                                                  ;84846E;
    PLB                                                                  ;84846F;
    LDY.W #$004E                                                         ;848470;

.loop:
    LDA.W $1C37,Y                                                        ;848473;
    BEQ .found                                                           ;848476;
    DEY                                                                  ;848478;
    DEY                                                                  ;848479;
    BPL .loop                                                            ;84847A;
    PLX                                                                  ;84847C;
    PLY                                                                  ;84847D;
    PLB                                                                  ;84847E;
    PLP                                                                  ;84847F;
    SEC                                                                  ;848480;
    RTL                                                                  ;848481;


.found:
    SEP #$20                                                             ;848482;
    LDA.L $8F0003,X                                                      ;848484;
    STA.W HW_WRMPYA                                                      ;848488;
    LDA.W $07A5                                                          ;84848B;
    STA.W HW_WRMPYB                                                      ;84848E;
    LDA.L $8F0002,X                                                      ;848491;
    REP #$20                                                             ;848495;
    AND.W #$00FF                                                         ;848497;
    CLC                                                                  ;84849A;
    ADC.W HW_RDMPY                                                       ;84849B;
    ASL A                                                                ;84849E;
    STA.W $1C87,Y                                                        ;84849F;
    LDA.L $8F0004,X                                                      ;8484A2;
    STA.W $1DC7,Y                                                        ;8484A6;
    LDA.L $8F0000,X                                                      ;8484A9;
    STA.W $1C37,Y                                                        ;8484AD;
    TYX                                                                  ;8484B0;
    TAY                                                                  ;8484B1;
    LDA.W #$0000                                                         ;8484B2;
    STA.L $7EDF0C,X                                                      ;8484B5;
    LDA.W #RTS_8484E6                                                    ;8484B9;
    STA.W $1CD7,X                                                        ;8484BC;
    LDA.W $0002,Y                                                        ;8484BF;
    STA.W $1D27,X                                                        ;8484C2;
    LDA.W #$0001                                                         ;8484C5;
    STA.L $7EDE1C,X                                                      ;8484C8;
    LDA.W #InstList_PLM_DefaultPLMDrawInstruction                        ;8484CC;
    STA.L $7EDE6C,X                                                      ;8484CF;
    STZ.W $1D77,X                                                        ;8484D3;
    STX.W $1C27                                                          ;8484D6;
    TYX                                                                  ;8484D9;
    LDY.W $1C27                                                          ;8484DA;
    JSR.W ($0000,X)                                                      ;8484DD;
    PLX                                                                  ;8484E0;
    PLY                                                                  ;8484E1;
    PLB                                                                  ;8484E2;
    PLP                                                                  ;8484E3;
    CLC                                                                  ;8484E4;
    RTL                                                                  ;8484E5;


RTS_8484E6:
    RTS                                                                  ;8484E6;


Spawn_PLM_to_CurrentBlockIndex:
    PHB                                                                  ;8484E7;
    PHY                                                                  ;8484E8;
    PHX                                                                  ;8484E9;
    PHK                                                                  ;8484EA;
    PLB                                                                  ;8484EB;
    TAY                                                                  ;8484EC;
    LDX.W #$004E                                                         ;8484ED;

.loop:
    LDA.W $1C37,X                                                        ;8484F0;
    BEQ .found                                                           ;8484F3;
    DEX                                                                  ;8484F5;
    DEX                                                                  ;8484F6;
    BPL .loop                                                            ;8484F7;
    PLX                                                                  ;8484F9;
    PLY                                                                  ;8484FA;
    PLB                                                                  ;8484FB;
    RTL                                                                  ;8484FC;


.found:
    LDA.W $0DC4                                                          ;8484FD;
    ASL A                                                                ;848500;
    STA.W $1C87,X                                                        ;848501;
    TYA                                                                  ;848504;
    STA.W $1C37,X                                                        ;848505;
    LDA.W #RTS_84853D                                                    ;848508;
    STA.W $1CD7,X                                                        ;84850B;
    LDA.W $0002,Y                                                        ;84850E;
    STA.W $1D27,X                                                        ;848511;
    LDA.W #$0001                                                         ;848514;
    STA.L $7EDE1C,X                                                      ;848517;
    LDA.W #InstList_PLM_DefaultPLMDrawInstruction                        ;84851B;
    STA.L $7EDE6C,X                                                      ;84851E;
    LDA.W #$0000                                                         ;848522;
    STA.W $1D77,X                                                        ;848525;
    STA.W $1DC7,X                                                        ;848528;
    STA.L $7EDF0C,X                                                      ;84852B;
    STX.W $1C27                                                          ;84852F;
    TYX                                                                  ;848532;
    LDY.W $1C27                                                          ;848533;
    JSR.W ($0000,X)                                                      ;848536;
    PLX                                                                  ;848539;
    PLY                                                                  ;84853A;
    PLB                                                                  ;84853B;
    RTL                                                                  ;84853C;


RTS_84853D:
    RTS                                                                  ;84853D;


UNUSED_Spawn_Enemy_PLM_84853E:
    PHB                                                                  ;84853E;
    PHY                                                                  ;84853F;
    PHX                                                                  ;848540;
    PHK                                                                  ;848541;
    PLB                                                                  ;848542;
    TXY                                                                  ;848543;
    PHA                                                                  ;848544;
    LDX.W #$004E                                                         ;848545;

.loop:
    LDA.W $1C37,X                                                        ;848548;
    BEQ .found                                                           ;84854B;
    DEX                                                                  ;84854D;
    DEX                                                                  ;84854E;
    BPL .loop                                                            ;84854F;
    PLA                                                                  ;848551;
    PLX                                                                  ;848552;
    PLY                                                                  ;848553;
    PLB                                                                  ;848554;
    RTL                                                                  ;848555;


.found:
    LDA.W EnemyData.yPosition,Y                                          ;848556;
    LSR A                                                                ;848559;
    LSR A                                                                ;84855A;
    LSR A                                                                ;84855B;
    LSR A                                                                ;84855C;
    SEP #$20                                                             ;84855D;
    STA.W HW_WRMPYA                                                      ;84855F;
    LDA.W $07A5                                                          ;848562;
    STA.W HW_WRMPYB                                                      ;848565;
    REP #$20                                                             ;848568;
    LDA.W EnemyData.xPosition,Y                                          ;84856A;
    LSR A                                                                ;84856D;
    LSR A                                                                ;84856E;
    LSR A                                                                ;84856F;
    LSR A                                                                ;848570;
    CLC                                                                  ;848571;
    ADC.W HW_RDMPY                                                       ;848572;
    ASL A                                                                ;848575;
    STA.W $1C87,X                                                        ;848576;
    PLA                                                                  ;848579;
    STA.W $1C37,X                                                        ;84857A;
    TAY                                                                  ;84857D;
    LDA.W #RTS_8485B3                                                    ;84857E;
    STA.W $1CD7,X                                                        ;848581;
    LDA.W $0002,Y                                                        ;848584;
    STA.W $1D27,X                                                        ;848587;
    LDA.W #$0001                                                         ;84858A;
    STA.L $7EDE1C,X                                                      ;84858D;
    LDA.W #InstList_PLM_DefaultPLMDrawInstruction                        ;848591;
    STA.L $7EDE6C,X                                                      ;848594;
    LDA.W #$0000                                                         ;848598;
    STA.W $1D77,X                                                        ;84859B;
    STA.W $1DC7,X                                                        ;84859E;
    STA.L $7EDF0C,X                                                      ;8485A1;
    STX.W $1C27                                                          ;8485A5;
    TYX                                                                  ;8485A8;
    LDY.W $1C27                                                          ;8485A9;
    JSR.W ($0000,X)                                                      ;8485AC;
    PLX                                                                  ;8485AF;
    PLY                                                                  ;8485B0;
    PLB                                                                  ;8485B1;
    RTL                                                                  ;8485B2;


RTS_8485B3:
    RTS                                                                  ;8485B3;


PLM_Handler:
    PHP                                                                  ;8485B4;
    PHB                                                                  ;8485B5;
    PHK                                                                  ;8485B6;
    PLB                                                                  ;8485B7;
    REP #$30                                                             ;8485B8;
    BIT.W $1C23                                                          ;8485BA;
    BPL .return                                                          ;8485BD;
    STZ.W $1C25                                                          ;8485BF;
    LDX.W #$004E                                                         ;8485C2;

.loop:
    STX.W $1C27                                                          ;8485C5;
    LDA.W $1C37,X                                                        ;8485C8;
    BEQ .next                                                            ;8485CB;
    JSR.W Process_PLM                                                    ;8485CD;
    LDX.W $1C27                                                          ;8485D0;

.next:
    DEX                                                                  ;8485D3;
    DEX                                                                  ;8485D4;
    BPL .loop                                                            ;8485D5;

.return:
    PLB                                                                  ;8485D7;
    PLP                                                                  ;8485D8;
    RTL                                                                  ;8485D9;


Process_PLM:
    JSR.W ($1CD7,X)                                                      ;8485DA;
    LDX.W $1C27                                                          ;8485DD;
    LDA.L $7EDE1C,X                                                      ;8485E0;
    DEC A                                                                ;8485E4;
    STA.L $7EDE1C,X                                                      ;8485E5;
    BNE .return                                                          ;8485E9;
    LDY.W $1D27,X                                                        ;8485EB;

.loop:
    LDA.W $0000,Y                                                        ;8485EE;
    BPL .nonZeroTimer                                                    ;8485F1;
    STA.B $12                                                            ;8485F3;
    INY                                                                  ;8485F5;
    INY                                                                  ;8485F6;
    PEA.W .loop-1                                                        ;8485F7;
    JMP.W ($0012)                                                        ;8485FA; Execute ASM Instruction


.nonZeroTimer:
    STA.L $7EDE1C,X                                                      ;8485FD;
    LDA.W $0002,Y                                                        ;848601;
    STA.L $7EDE6C,X                                                      ;848604;
    TYA                                                                  ;848608;
    CLC                                                                  ;848609;
    ADC.W #$0004                                                         ;84860A;
    STA.W $1D27,X                                                        ;84860D;
    JSR.W Process_PLM_Draw_Instruction                                   ;848610;
    LDX.W $1C27                                                          ;848613;
    JSL.L Calculate_PLM_Block_Coordinates                                ;848616;
    JSR.W DrawPLM_HardCoded                                              ;84861A;

.return:
    RTS                                                                  ;84861D;


Process_PLM_Draw_Instruction:
    LDA.L $7EDE6C,X                                                      ;84861E;
    TAY                                                                  ;848622;
    LDA.W $1C87,X                                                        ;848623;
    STA.B $12                                                            ;848626;
    TAX                                                                  ;848628;

.loopDrawEntry:
    LDA.W $0000,Y                                                        ;848629;
    BMI .column                                                          ;84862C;
    AND.W #$00FF                                                         ;84862E;
    STA.B $16                                                            ;848631;
    INY                                                                  ;848633;
    INY                                                                  ;848634;

.loopRow:
    LDA.W $0000,Y                                                        ;848635;
    STA.L $7F0002,X                                                      ;848638;
    INY                                                                  ;84863C;
    INY                                                                  ;84863D;
    INX                                                                  ;84863E;
    INX                                                                  ;84863F;
    DEC.B $16                                                            ;848640;
    BNE .loopRow                                                         ;848642;
    JMP.W .next                                                          ;848644;


.column:
    AND.W #$00FF                                                         ;848647;
    STA.B $16                                                            ;84864A;
    INY                                                                  ;84864C;
    INY                                                                  ;84864D;

.loopColumn:
    LDA.W $0000,Y                                                        ;84864E;
    STA.L $7F0002,X                                                      ;848651;
    INY                                                                  ;848655;
    INY                                                                  ;848656;
    TXA                                                                  ;848657;
    CLC                                                                  ;848658;
    ADC.W $07A5                                                          ;848659;
    ADC.W $07A5                                                          ;84865C;
    TAX                                                                  ;84865F;
    DEC.B $16                                                            ;848660;
    BNE .loopColumn                                                      ;848662;

.next:
    LDA.W $0000,Y                                                        ;848664;
    BNE +                                                                ;848667;
    RTS                                                                  ;848669;


  + DEY                                                                  ;84866A;
    LDA.W $0000,Y                                                        ;84866B;
    XBA                                                                  ;84866E;
    BPL .positive                                                        ;84866F;
    ORA.W #$FF00                                                         ;848671;
    BRA +                                                                ;848674;


.positive:
    AND.W #$00FF                                                         ;848676;

  + ASL A                                                                ;848679;
    CLC                                                                  ;84867A;
    ADC.B $12                                                            ;84867B;
    STA.B $14                                                            ;84867D;
    LDA.W $0001,Y                                                        ;84867F;
    XBA                                                                  ;848682;
    BPL +                                                                ;848683;
    ORA.W #$FF00                                                         ;848685;
    EOR.W #$FFFF                                                         ;848688;
    INC A                                                                ;84868B;
    TAX                                                                  ;84868C;
    LDA.W #$0000                                                         ;84868D;

  - SEC                                                                  ;848690;
    SBC.W $07A5                                                          ;848691;
    DEX                                                                  ;848694;
    BNE -                                                                ;848695;
    BRA .setX                                                            ;848697;


  + AND.W #$00FF                                                         ;848699;
    BEQ .setX                                                            ;84869C;
    TAX                                                                  ;84869E;
    LDA.W #$0000                                                         ;84869F;

  - CLC                                                                  ;8486A2;
    ADC.W $07A5                                                          ;8486A3;
    DEX                                                                  ;8486A6;
    BNE -                                                                ;8486A7;

.setX:
    ASL A                                                                ;8486A9;
    CLC                                                                  ;8486AA;
    ADC.B $14                                                            ;8486AB;
    TAX                                                                  ;8486AD;
    INY                                                                  ;8486AE;
    INY                                                                  ;8486AF;
    INY                                                                  ;8486B0;
    JMP.W .loopDrawEntry                                                 ;8486B1;


Instruction_PLM_Sleep:
    DEY                                                                  ;8486B4;
    DEY                                                                  ;8486B5;
    TYA                                                                  ;8486B6;
    STA.W $1D27,X                                                        ;8486B7;
    PLA                                                                  ;8486BA;
    RTS                                                                  ;8486BB;


Instruction_PLM_Delete:
    STZ.W $1C37,X                                                        ;8486BC;
    PLA                                                                  ;8486BF;
    RTS                                                                  ;8486C0;


Instruction_PLM_PreInstruction_inY:
    LDA.W $0000,Y                                                        ;8486C1;
    STA.W $1CD7,X                                                        ;8486C4;
    INY                                                                  ;8486C7;
    INY                                                                  ;8486C8;
    RTS                                                                  ;8486C9;


Instruction_PLM_ClearPreInstruction:
    LDA.W #RTS_8486D0                                                    ;8486CA;
    STA.W $1CD7,X                                                        ;8486CD;

RTS_8486D0:
    RTS                                                                  ;8486D0;


UNUSED_Instruction_PLM_CallFuctionInY_8486D1:
    LDA.W $0000,Y                                                        ;8486D1;
    STA.B $12                                                            ;8486D4;
    LDA.W $0001,Y                                                        ;8486D6;
    STA.B $13                                                            ;8486D9;
    PHY                                                                  ;8486DB;
    JSL.L UNUSED_Instruction_PLM_CallFuctionInY_withA_8486E8             ;8486DC;
    PLY                                                                  ;8486E0;
    LDX.W $1C27                                                          ;8486E1;
    INY                                                                  ;8486E4;
    INY                                                                  ;8486E5;
    INY                                                                  ;8486E6;
    RTS                                                                  ;8486E7;


UNUSED_Instruction_PLM_CallFuctionInY_withA_8486E8:
    JML.W [$0012]                                                        ;8486E8;

    LDA.W $0000,Y                                                        ;8486EB;
    STA.B $12                                                            ;8486EE;
    LDA.W $0001,Y                                                        ;8486F0;
    STA.B $13                                                            ;8486F3;
    LDA.W $0003,Y                                                        ;8486F5;
    PHY                                                                  ;8486F8;
    JSL.L .externalFunction                                              ;8486F9;
    PLY                                                                  ;8486FD;
    LDX.W $1C27                                                          ;8486FE;
    TYA                                                                  ;848701;
    CLC                                                                  ;848702;
    ADC.W #$0005                                                         ;848703;
    TAY                                                                  ;848706;
    RTS                                                                  ;848707;


.externalFunction:
    JML.W [$0012]                                                        ;848708;


Instruction_PLM_CallFunctionInY:
    LDA.W $0000,Y                                                        ;84870B;
    STA.B $12                                                            ;84870E;
    LDA.W $0001,Y                                                        ;848710;
    STA.B $13                                                            ;848713;
    PHX                                                                  ;848715;
    PHY                                                                  ;848716;
    JSL.L .externalFunction                                              ;848717;
    PLY                                                                  ;84871B;
    PLX                                                                  ;84871C;
    INY                                                                  ;84871D;
    INY                                                                  ;84871E;
    INY                                                                  ;84871F;
    RTS                                                                  ;848720;


.externalFunction:
    JML.W [$0012]                                                        ;848721;


Instruction_PLM_GotoY:
    LDA.W $0000,Y                                                        ;848724;
    TAY                                                                  ;848727;
    RTS                                                                  ;848728;


UNUSED_Instruction_PLM_GotoY_PlusMinusY_848729:
    STY.B $12                                                            ;848729;
    DEY                                                                  ;84872B;
    LDA.W $0000,Y                                                        ;84872C;
    XBA                                                                  ;84872F;
    BMI .negative                                                        ;848730;
    AND.W #$00FF                                                         ;848732;
    BRA +                                                                ;848735;


.negative:
    ORA.W #$FF00                                                         ;848737;

  + CLC                                                                  ;84873A;
    ADC.B $12                                                            ;84873B;
    TAY                                                                  ;84873D;
    RTS                                                                  ;84873E;


Instruction_PLM_DecrementTimer_GotoYIfNonZero:
    DEC.W $1D77,X                                                        ;84873F;
    BNE Instruction_PLM_GotoY                                            ;848742;
    INY                                                                  ;848744;
    INY                                                                  ;848745;
    RTS                                                                  ;848746;


UNUSED_Instruction_PLM_DecrementTimer_GotoYIfNonZero_848747:
    DEC.W $1D77,X                                                        ;848747;
    BNE UNUSED_Instruction_PLM_GotoY_PlusMinusY_848729                   ;84874A;
    INY                                                                  ;84874C;
    RTS                                                                  ;84874D;


Instruction_PLM_TimerEqualsY_8Bit:
    SEP #$20                                                             ;84874E;
    LDA.W $0000,Y                                                        ;848750;
    STA.W $1D77,X                                                        ;848753;
    REP #$20                                                             ;848756;
    INY                                                                  ;848758;
    RTS                                                                  ;848759;


UNUSED_Instruction_PLM_TimerEqualsY_16Bit_84875A:
    LDA.W $0000,Y                                                        ;84875A;
    STA.W $1D77,X                                                        ;84875D;
    INY                                                                  ;848760;
    INY                                                                  ;848761;
    RTS                                                                  ;848762;


RTS_848763:
    RTS                                                                  ;848763;


Instruction_PLM_LoadItemPLMGFX:
    LDA.W $1C2D                                                          ;848764;
    STA.L $7EDF0C,X                                                      ;848767;
    TAX                                                                  ;84876B;
    INC A                                                                ;84876C;
    INC A                                                                ;84876D;
    AND.W #$0006                                                         ;84876E;
    STA.W $1C2D                                                          ;848771;
    LDA.W .VRAMAddresses,X                                               ;848774;
    STA.B $12                                                            ;848777;
    LDA.W .tileTableIndices,X                                            ;848779;
    STA.B $14                                                            ;84877C;
    LDA.W .startingTileNumbers,X                                         ;84877E;
    STA.B $16                                                            ;848781;
    TYA                                                                  ;848783;
    STA.W $1C2F,X                                                        ;848784;
    LDX.W $0330                                                          ;848787;
    LDA.W #$0100                                                         ;84878A;
    STA.B $D0,X                                                          ;84878D;
    LDA.W $0000,Y                                                        ;84878F;
    STA.B $D2,X                                                          ;848792;
    LDA.W #$0089                                                         ;848794;
    STA.B $D4,X                                                          ;848797;
    LDA.B $12                                                            ;848799;
    STA.B $D5,X                                                          ;84879B;
    TXA                                                                  ;84879D;
    CLC                                                                  ;84879E;
    ADC.W #$0007                                                         ;84879F;
    STA.W $0330                                                          ;8487A2;
    INY                                                                  ;8487A5;
    INY                                                                  ;8487A6;
    LDX.B $14                                                            ;8487A7;
    TXA                                                                  ;8487A9;
    CLC                                                                  ;8487AA;
    ADC.W #$0010                                                         ;8487AB;
    STA.B $18                                                            ;8487AE;

.loop:
    LDA.W $0000,Y                                                        ;8487B0;
    AND.W #$00FF                                                         ;8487B3;
    XBA                                                                  ;8487B6;
    ASL A                                                                ;8487B7;
    ASL A                                                                ;8487B8;
    CLC                                                                  ;8487B9;
    ADC.B $16                                                            ;8487BA;
    STA.L $7EA000,X                                                      ;8487BC;
    INC.B $16                                                            ;8487C0;
    INY                                                                  ;8487C2;
    INX                                                                  ;8487C3;
    INX                                                                  ;8487C4;
    CPX.B $18                                                            ;8487C5;
    BNE .loop                                                            ;8487C7;
    LDX.W $1C27                                                          ;8487C9;
    RTS                                                                  ;8487CC;

.VRAMAddresses:
    dw $3E00,$3E80,$3F00,$3F80                                           ;8487CD;
.tileTableIndices:
    dw $0470,$0480,$0490,$04A0                                           ;8487D5;
.startingTileNumbers:
    dw $03E0,$03E8,$03F0,$03F8                                           ;8487DD;


Instruction_PLM_TransferBytesToVRAM:
    LDX.W $0330                                                          ;8487E5;
    LDA.W $0000,Y                                                        ;8487E8;
    STA.B $D0,X                                                          ;8487EB;
    LDA.W $0002,Y                                                        ;8487ED;
    STA.B $D2,X                                                          ;8487F0;
    LDA.W $0003,Y                                                        ;8487F2;
    STA.B $D3,X                                                          ;8487F5;
    LDA.W $0005,Y                                                        ;8487F7;
    STA.B $D5,X                                                          ;8487FA;
    TXA                                                                  ;8487FC;
    CLC                                                                  ;8487FD;
    ADC.W #$0007                                                         ;8487FE;
    STA.W $0330                                                          ;848801;
    TYA                                                                  ;848804;
    CLC                                                                  ;848805;
    ADC.W #$0007                                                         ;848806;
    TAY                                                                  ;848809;
    LDX.W $1C27                                                          ;84880A;
    RTS                                                                  ;84880D;


Instruction_PLM_GotoY_ifBossBitsSet:
    LDA.W $0000,Y                                                        ;84880E;
    INY                                                                  ;848811;
    AND.W #$00FF                                                         ;848812;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;848815;
    BCC +                                                                ;848819;
    JMP.W Instruction_PLM_GotoY                                          ;84881B;


  + INY                                                                  ;84881E;
    INY                                                                  ;84881F;
    RTS                                                                  ;848820;


UNUSED_Instruction_PLM_SetBossBits_848821:
    LDA.W $0000,Y                                                        ;848821;
    AND.W #$00FF                                                         ;848824;
    JSL.L SetBossBitsInAForCurrentArea                                   ;848827;
    INY                                                                  ;84882B;
    RTS                                                                  ;84882C;


Instruction_PLM_GotoY_ifEventIsSet:
    LDA.W $0000,Y                                                        ;84882D;
    INY                                                                  ;848830;
    INY                                                                  ;848831;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;848832;
    BCC .return                                                          ;848836;
    JMP.W Instruction_PLM_GotoY                                          ;848838;


.return:
    INY                                                                  ;84883B;
    INY                                                                  ;84883C;
    RTS                                                                  ;84883D;


Instruction_PLM_SetTheEvent:
    LDA.W $0000,Y                                                        ;84883E;
    JSL.L MarkEvent_inA                                                  ;848841;
    INY                                                                  ;848845;
    INY                                                                  ;848846;
    RTS                                                                  ;848847;


Instruction_PLM_GotoY_ifRoomArg_ChozoBlockDestroyed:
    PHX                                                                  ;848848;
    LDA.W $1DC7,X                                                        ;848849;
    BMI .pullX                                                           ;84884C;
    JSL.L BitIndexToByteIndexAndBitmask                                  ;84884E;
    LDA.L $7ED830,X                                                      ;848852;
    PLX                                                                  ;848856;
    AND.W $05E7                                                          ;848857;
    BEQ .return                                                          ;84885A;
    JMP.W Instruction_PLM_GotoY                                          ;84885C;


.return:
    INY                                                                  ;84885F;
    INY                                                                  ;848860;
    RTS                                                                  ;848861;


.pullX:
    PLX                                                                  ;848862;
    BRA .return                                                          ;848863;


Instruction_PLM_SetRoomArg_ChozoBlockDestroyed:
    PHX                                                                  ;848865;
    LDA.W $1DC7,X                                                        ;848866;
    BMI .return                                                          ;848869;
    JSL.L BitIndexToByteIndexAndBitmask                                  ;84886B;
    LDA.L $7ED830,X                                                      ;84886F;
    ORA.W $05E7                                                          ;848873;
    STA.L $7ED830,X                                                      ;848876;

.return:
    PLX                                                                  ;84887A;
    RTS                                                                  ;84887B;


Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected:
    PHX                                                                  ;84887C;
    LDA.W $1DC7,X                                                        ;84887D;
    BMI .pullX                                                           ;848880;
    JSL.L BitIndexToByteIndexAndBitmask                                  ;848882;
    LDA.L $7ED870,X                                                      ;848886;
    PLX                                                                  ;84888A;
    AND.W $05E7                                                          ;84888B;
    BEQ .return                                                          ;84888E;
    JMP.W Instruction_PLM_GotoY                                          ;848890;


.return:
    INY                                                                  ;848893;
    INY                                                                  ;848894;
    RTS                                                                  ;848895;


.pullX:
    PLX                                                                  ;848896;
    BRA .return                                                          ;848897;


Instruction_PLM_SetRoomArg_ItemCollected:
    PHX                                                                  ;848899;
    LDA.W $1DC7,X                                                        ;84889A;
    BMI .return                                                          ;84889D;
    JSL.L BitIndexToByteIndexAndBitmask                                  ;84889F;
    LDA.L $7ED870,X                                                      ;8488A3;
    ORA.W $05E7                                                          ;8488A7;
    STA.L $7ED870,X                                                      ;8488AA;

.return:
    PLX                                                                  ;8488AE;
    RTS                                                                  ;8488AF;


Instruction_PLM_PickUpBeam_DisplayMessageBox:
    LDA.W $0000,Y                                                        ;8488B0;
    ORA.W $09A8                                                          ;8488B3;
    STA.W $09A8                                                          ;8488B6;
    LDA.W $0000,Y                                                        ;8488B9;
    ORA.W $09A6                                                          ;8488BC;
    STA.W $09A6                                                          ;8488BF;
    LDA.W $0000,Y                                                        ;8488C2;
    ASL A                                                                ;8488C5;
    AND.W #$0008                                                         ;8488C6;
    TRB.W $09A6                                                          ;8488C9;
    LDA.W $0000,Y                                                        ;8488CC;
    LSR A                                                                ;8488CF;
    AND.W #$0004                                                         ;8488D0;
    TRB.W $09A6                                                          ;8488D3;
    PHX                                                                  ;8488D6;
    PHY                                                                  ;8488D7;
    JSL.L Update_Beam_Tiles_and_Palette                                  ;8488D8;
    PLY                                                                  ;8488DC;
    PLX                                                                  ;8488DD;
    LDA.W #$0168                                                         ;8488DE;
    JSL.L Play_Room_Music_Track_After_A_Frames                           ;8488E1;
    LDA.W $0002,Y                                                        ;8488E5;
    AND.W #$00FF                                                         ;8488E8;
    JSL.L MessageBox_Routine                                             ;8488EB;
    INY                                                                  ;8488EF;
    INY                                                                  ;8488F0;
    INY                                                                  ;8488F1;
    RTS                                                                  ;8488F2;


Instruction_PLM_PickUpEquipment_DisplayMessageBox:
    LDA.W $09A2                                                          ;8488F3;
    ORA.W $0000,Y                                                        ;8488F6;
    STA.W $09A2                                                          ;8488F9;
    LDA.W $09A4                                                          ;8488FC;
    ORA.W $0000,Y                                                        ;8488FF;
    STA.W $09A4                                                          ;848902;
    LDA.W #$0168                                                         ;848905;
    JSL.L Play_Room_Music_Track_After_A_Frames                           ;848908;
    LDA.W $0002,Y                                                        ;84890C;
    AND.W #$00FF                                                         ;84890F;
    JSL.L MessageBox_Routine                                             ;848912;
    INY                                                                  ;848916;
    INY                                                                  ;848917;
    INY                                                                  ;848918;
    RTS                                                                  ;848919;


Inst_PLM_PickUpEquipment_AddGrappleHUD_DisplayMessageBox:
    LDA.W $09A2                                                          ;84891A;
    ORA.W $0000,Y                                                        ;84891D;
    STA.W $09A2                                                          ;848920;
    LDA.W $09A4                                                          ;848923;
    ORA.W $0000,Y                                                        ;848926;
    STA.W $09A4                                                          ;848929;
    JSL.L AddGrappleToHUDTilemap                                         ;84892C;
    LDA.W #$0168                                                         ;848930;
    JSL.L Play_Room_Music_Track_After_A_Frames                           ;848933;
    LDA.W #$0005                                                         ;848937;
    JSL.L MessageBox_Routine                                             ;84893A;
    INY                                                                  ;84893E;
    INY                                                                  ;84893F;
    RTS                                                                  ;848940;


Inst_PLM_PickUpEquipment_AddXrayToHUD_DisplayMessageBox:
    LDA.W $09A2                                                          ;848941;
    ORA.W $0000,Y                                                        ;848944;
    STA.W $09A2                                                          ;848947;
    LDA.W $09A4                                                          ;84894A;
    ORA.W $0000,Y                                                        ;84894D;
    STA.W $09A4                                                          ;848950;
    JSL.L AddXrayToHUDTilemap                                            ;848953;
    LDA.W #$0168                                                         ;848957;
    JSL.L Play_Room_Music_Track_After_A_Frames                           ;84895A;
    LDA.W #$0006                                                         ;84895E;
    JSL.L MessageBox_Routine                                             ;848961;
    INY                                                                  ;848965;
    INY                                                                  ;848966;
    RTS                                                                  ;848967;


Instruction_PLM_CollectHealth_EnergyTank:
    LDA.W $09C4                                                          ;848968;
    CLC                                                                  ;84896B;
    ADC.W $0000,Y                                                        ;84896C;
    STA.W $09C4                                                          ;84896F;
    STA.W $09C2                                                          ;848972;
    LDA.W #$0168                                                         ;848975;
    JSL.L Play_Room_Music_Track_After_A_Frames                           ;848978;
    LDA.W #$0001                                                         ;84897C;
    JSL.L MessageBox_Routine                                             ;84897F;
    INY                                                                  ;848983;
    INY                                                                  ;848984;
    RTS                                                                  ;848985;


Instruction_PLM_CollectHealth_ReserveTank:
    LDA.W $09D4                                                          ;848986;
    CLC                                                                  ;848989;
    ADC.W $0000,Y                                                        ;84898A;
    STA.W $09D4                                                          ;84898D;
    LDA.W $09C0                                                          ;848990;
    BNE .playMusic                                                       ;848993;
    INC.W $09C0                                                          ;848995;

.playMusic:
    LDA.W #$0168                                                         ;848998;
    JSL.L Play_Room_Music_Track_After_A_Frames                           ;84899B;
    LDA.W #$0019                                                         ;84899F;
    JSL.L MessageBox_Routine                                             ;8489A2;
    INY                                                                  ;8489A6;
    INY                                                                  ;8489A7;
    RTS                                                                  ;8489A8;


Instruction_PLM_CollectAmmo_MissileTank:
    LDA.W $09C8                                                          ;8489A9;
    CLC                                                                  ;8489AC;
    ADC.W $0000,Y                                                        ;8489AD;
    STA.W $09C8                                                          ;8489B0;
    LDA.W $09C6                                                          ;8489B3;
    CLC                                                                  ;8489B6;
    ADC.W $0000,Y                                                        ;8489B7;
    STA.W $09C6                                                          ;8489BA;
    JSL.L AddMissilesToHUDTilemap                                        ;8489BD;
    LDA.W #$0168                                                         ;8489C1;
    JSL.L Play_Room_Music_Track_After_A_Frames                           ;8489C4;
    LDA.W #$0002                                                         ;8489C8;
    JSL.L MessageBox_Routine                                             ;8489CB;
    INY                                                                  ;8489CF;
    INY                                                                  ;8489D0;
    RTS                                                                  ;8489D1;


Instruction_PLM_CollectAmmo_SuperMissileTank:
    LDA.W $09CC                                                          ;8489D2;
    CLC                                                                  ;8489D5;
    ADC.W $0000,Y                                                        ;8489D6;
    STA.W $09CC                                                          ;8489D9;
    LDA.W $09CA                                                          ;8489DC;
    CLC                                                                  ;8489DF;
    ADC.W $0000,Y                                                        ;8489E0;
    STA.W $09CA                                                          ;8489E3;
    JSL.L AddSuperMissilesToHUDTilemap                                   ;8489E6;
    LDA.W #$0168                                                         ;8489EA;
    JSL.L Play_Room_Music_Track_After_A_Frames                           ;8489ED;
    LDA.W #$0003                                                         ;8489F1;
    JSL.L MessageBox_Routine                                             ;8489F4;
    INY                                                                  ;8489F8;
    INY                                                                  ;8489F9;
    RTS                                                                  ;8489FA;


Instruction_PLM_CollectAmmo_PowerBombTank:
    LDA.W $09D0                                                          ;8489FB;
    CLC                                                                  ;8489FE;
    ADC.W $0000,Y                                                        ;8489FF;
    STA.W $09D0                                                          ;848A02;
    LDA.W $09CE                                                          ;848A05;
    CLC                                                                  ;848A08;
    ADC.W $0000,Y                                                        ;848A09;
    STA.W $09CE                                                          ;848A0C;
    JSL.L AddPowerBombsToHUDTilemap                                      ;848A0F;
    LDA.W #$0168                                                         ;848A13;
    JSL.L Play_Room_Music_Track_After_A_Frames                           ;848A16;
    LDA.W #$0004                                                         ;848A1A;
    JSL.L MessageBox_Routine                                             ;848A1D;
    INY                                                                  ;848A21;
    INY                                                                  ;848A22;
    RTS                                                                  ;848A23;


Instruction_PLM_LinkInstruction_Y:
    LDA.W $0000,Y                                                        ;848A24;
    STA.L $7EDEBC,X                                                      ;848A27;
    INY                                                                  ;848A2B;
    INY                                                                  ;848A2C;
    RTS                                                                  ;848A2D;


Instruction_PLM_Call_Y:
    TYA                                                                  ;848A2E;
    INC A                                                                ;848A2F;
    INC A                                                                ;848A30;
    STA.L $7EDEBC,X                                                      ;848A31;
    LDA.W $0000,Y                                                        ;848A35;
    TAY                                                                  ;848A38;
    RTS                                                                  ;848A39;


Instruction_PLM_Return:
    LDA.L $7EDEBC,X                                                      ;848A3A;
    TAY                                                                  ;848A3E;
    RTS                                                                  ;848A3F;


UNUSED_Instruction_PLM_WaitUntil_Enemy0_IsDead_848A40:
    LDA.W $0F86                                                          ;848A40;
    AND.W #$0200                                                         ;848A43;
    BNE .return                                                          ;848A46;
    LDA.W $0F78                                                          ;848A48;
    CMP.W #EnemyHeaders_Respawn                                          ;848A4B;
    BEQ .return                                                          ;848A4E;
    PLA                                                                  ;848A50;
    LDA.W #$0001                                                         ;848A51;
    STA.L $7EDE1C,X                                                      ;848A54;

.return:
    RTS                                                                  ;848A58;


UNUSED_Instruction_PLM_WaitUntil_Enemy0_IsDead_848A59:
    LDA.W $0FC6                                                          ;848A59;
    AND.W #$0200                                                         ;848A5C;
    BNE .return                                                          ;848A5F;
    LDA.W $0FB8                                                          ;848A61;
    CMP.W #EnemyHeaders_Respawn                                          ;848A64;
    BEQ .return                                                          ;848A67;
    PLA                                                                  ;848A69;
    LDA.W #$0001                                                         ;848A6A;
    STA.L $7EDE1C,X                                                      ;848A6D;

.return:
    RTS                                                                  ;848A71;


Instruction_PLM_GotoY_ifRoomArg_DoorIsSet:
    PHX                                                                  ;848A72;
    LDA.W $1DC7,X                                                        ;848A73;
    BMI .pullX                                                           ;848A76;
    JSL.L BitIndexToByteIndexAndBitmask                                  ;848A78;
    LDA.L $7ED8B0,X                                                      ;848A7C;
    PLX                                                                  ;848A80;
    AND.W $05E7                                                          ;848A81;
    BEQ .return                                                          ;848A84;
    LDA.W $0000,Y                                                        ;848A86;
    TAY                                                                  ;848A89;
    RTS                                                                  ;848A8A;


.return:
    INY                                                                  ;848A8B;
    INY                                                                  ;848A8C;
    RTS                                                                  ;848A8D;


.pullX:
    PLX                                                                  ;848A8E;
    BRA .return                                                          ;848A8F;


Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY:
    LDA.L $7EDF0C,X                                                      ;848A91;
    INC A                                                                ;848A95;
    STA.L $7EDF0C,X                                                      ;848A96;
    SEP #$20                                                             ;848A9A;
    CMP.W $0000,Y                                                        ;848A9C;
    REP #$20                                                             ;848A9F;
    BCS .carrySet                                                        ;848AA1;
    INY                                                                  ;848AA3;
    INY                                                                  ;848AA4;
    INY                                                                  ;848AA5;

  .return:
    RTS                                                                  ;848AA6;

.carrySet:
    PHX                                                                  ;848AA7;
    LDA.W $1DC7,X                                                        ;848AA8;
    BMI .setMSB                                                          ;848AAB;
    JSL.L BitIndexToByteIndexAndBitmask                                  ;848AAD;
    LDA.L $7ED8B0,X                                                      ;848AB1;
    ORA.W $05E7                                                          ;848AB5;
    STA.L $7ED8B0,X                                                      ;848AB8;

.setMSB:
    PLX                                                                  ;848ABC;
    ORA.W #$8000                                                         ;848ABD;
    STA.W $1DC7,X                                                        ;848AC0;
    LDA.W #.return                                                       ;848AC3;
    STA.W $1CD7,X                                                        ;848AC6;
    INY                                                                  ;848AC9;
    JMP.W Instruction_PLM_GotoY                                          ;848ACA;


Instruction_PLM_IncRoomArg_RoomArgFFFF_GotoY:
    SEP #$20                                                             ;848ACD;
    LDA.W $1DC7,X                                                        ;848ACF;
    INC A                                                                ;848AD2;
    CMP.W $0000,Y                                                        ;848AD3;
    REP #$20                                                             ;848AD6;
    BCS .FFFF                                                            ;848AD8;
    STA.W $1DC7,X                                                        ;848ADA;
    INY                                                                  ;848ADD;
    INY                                                                  ;848ADE;
    INY                                                                  ;848ADF;

  .return
    RTS                                                                  ;848AE0;


.FFFF:
    LDA.W #$FFFF                                                         ;848AE1;
    STA.W $1DC7,X                                                        ;848AE4;
    LDA.W #.return                                                       ;848AE7;
    STA.W $1CD7,X                                                        ;848AEA;
    INY                                                                  ;848AED;
    JMP.W Instruction_PLM_GotoY                                          ;848AEE;


Instruction_PLM_PLMBTS_Y:
    PHX                                                                  ;848AF1;
    LDA.W $1C87,X                                                        ;848AF2;
    LSR A                                                                ;848AF5;
    TAX                                                                  ;848AF6;
    SEP #$20                                                             ;848AF7;
    LDA.W $0000,Y                                                        ;848AF9;
    STA.L $7F6402,X                                                      ;848AFC;
    REP #$20                                                             ;848B00;
    PLX                                                                  ;848B02;
    INY                                                                  ;848B03;
    RTS                                                                  ;848B04;


Instruction_PLM_DrawPLMBlock_Clone:
    REP #$20                                                             ;848B05;
    PHX                                                                  ;848B07;
    PHY                                                                  ;848B08;
    TXY                                                                  ;848B09;
    LDX.W $1C87,Y                                                        ;848B0A;
    LDA.W $1E17,Y                                                        ;848B0D;
    STA.L $7F0002,X                                                      ;848B10;
    JMP.W Instruction_PLM_DrawPLMBlock_draw                              ;848B14;


Instruction_PLM_DrawPLMBlock:
    REP #$20                                                             ;848B17;
    PHX                                                                  ;848B19;
    PHY                                                                  ;848B1A;
    TXY                                                                  ;848B1B;
    LDX.W $1C87,Y                                                        ;848B1C;
    LDA.W $1E17,Y                                                        ;848B1F;
    STA.L $7F0002,X                                                      ;848B22;

Instruction_PLM_DrawPLMBlock_draw:
    STA.W $1E69                                                          ;848B26;
    LDA.W #$0001                                                         ;848B29;
    STA.W $1E67                                                          ;848B2C;
    STZ.W $1E6B                                                          ;848B2F;
    PLY                                                                  ;848B32;
    PLX                                                                  ;848B33;
    LDA.W #$0001                                                         ;848B34;
    STA.L $7EDE1C,X                                                      ;848B37;
    LDA.W #$1E67                                                         ;848B3B;
    STA.L $7EDE6C,X                                                      ;848B3E;
    TYA                                                                  ;848B42;
    STA.W $1D27,X                                                        ;848B43;
    JSR.W Process_PLM_Draw_Instruction                                   ;848B46;
    LDX.W $1C27                                                          ;848B49;
    JSL.L Calculate_PLM_Block_Coordinates                                ;848B4C;
    JSR.W DrawPLM_HardCoded                                              ;848B50;
    PLA                                                                  ;848B53;
    RTS                                                                  ;848B54;


Instruction_PLM_ProcessAirScrollUpdate:
    PHB                                                                  ;848B55;
    PHX                                                                  ;848B56;
    PHY                                                                  ;848B57;
    STZ.W $1E17,X                                                        ;848B58;
    LDY.W $1DC7,X                                                        ;848B5B;
    PEA.W $8F00                                                          ;848B5E;
    PLB                                                                  ;848B61;
    PLB                                                                  ;848B62;
    LDA.W #$0000                                                         ;848B63;
    SEP #$20                                                             ;848B66;

.loop:
    LDA.W $0000,Y                                                        ;848B68;
    BMI .specialAir                                                      ;848B6B;
    TAX                                                                  ;848B6D;
    LDA.W $0001,Y                                                        ;848B6E;
    STA.L $7ECD20,X                                                      ;848B71;
    INY                                                                  ;848B75;
    INY                                                                  ;848B76;
    BRA .loop                                                            ;848B77;


.specialAir:
    REP #$20                                                             ;848B79;
    PLY                                                                  ;848B7B;
    PLX                                                                  ;848B7C;
    PLB                                                                  ;848B7D;
    PHX                                                                  ;848B7E;
    LDA.W $1C87,X                                                        ;848B7F;
    TAX                                                                  ;848B82;
    LDA.L $7F0002,X                                                      ;848B83;
    AND.W #$0FFF                                                         ;848B87;
    ORA.W #$3000                                                         ;848B8A;
    STA.L $7F0002,X                                                      ;848B8D;
    PLX                                                                  ;848B91;
    RTS                                                                  ;848B92;


Instruction_PLM_ProcessSolidScrollUpdate:
    PHB                                                                  ;848B93;
    PHX                                                                  ;848B94;
    PHY                                                                  ;848B95;
    STZ.W $1E17,X                                                        ;848B96;
    LDY.W $1DC7,X                                                        ;848B99;
    PEA.W $8F00                                                          ;848B9C;
    PLB                                                                  ;848B9F;
    PLB                                                                  ;848BA0;
    LDA.W #$0000                                                         ;848BA1;
    SEP #$20                                                             ;848BA4;

.loop:
    LDA.W $0000,Y                                                        ;848BA6;
    BMI .specialBlock                                                    ;848BA9;
    TAX                                                                  ;848BAB;
    LDA.W $0001,Y                                                        ;848BAC;
    STA.L $7ECD20,X                                                      ;848BAF;
    INY                                                                  ;848BB3;
    INY                                                                  ;848BB4;
    BRA .loop                                                            ;848BB5;


.specialBlock:
    REP #$20                                                             ;848BB7;
    PLY                                                                  ;848BB9;
    PLX                                                                  ;848BBA;
    PLB                                                                  ;848BBB;
    PHX                                                                  ;848BBC;
    LDA.W $1C87,X                                                        ;848BBD;
    TAX                                                                  ;848BC0;
    LDA.L $7F0002,X                                                      ;848BC1;
    AND.W #$0FFF                                                         ;848BC5;
    ORA.W #$B000                                                         ;848BC8;
    STA.L $7F0002,X                                                      ;848BCB;
    PLX                                                                  ;848BCF;
    RTS                                                                  ;848BD0;


UNUSED_Instruction_PLM_QueueMusicTrack_Y_848BD1:
    LDA.W $0000,Y                                                        ;848BD1;
    AND.W #$00FF                                                         ;848BD4;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;848BD7;
    INY                                                                  ;848BDB;
    RTS                                                                  ;848BDC;


Instruction_PLM_ClearMusicQueue_QueueMusicTrack:
    PHX                                                                  ;848BDD;
    LDX.W #$000E                                                         ;848BDE;

.loop:
    STZ.W $0619,X                                                        ;848BE1;
    STZ.W $0629,X                                                        ;848BE4;
    DEX                                                                  ;848BE7;
    DEX                                                                  ;848BE8;
    BPL .loop                                                            ;848BE9;
    PLX                                                                  ;848BEB;
    LDA.W $0639                                                          ;848BEC;
    STA.W $063B                                                          ;848BEF;
    LDA.W #$0000                                                         ;848BF2;
    STA.W $063F                                                          ;848BF5;
    STA.W $063D                                                          ;848BF8;
    LDA.W $0000,Y                                                        ;848BFB;
    AND.W #$00FF                                                         ;848BFE;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;848C01;
    INY                                                                  ;848C05;
    RTS                                                                  ;848C06;


Instruction_PLM_QueueSound_Y_Lib1_Max6:
    LDA.W $0000,Y                                                        ;848C07;
    JSL.L QueueSound_Lib1_Max6                                           ;848C0A;
    INY                                                                  ;848C0E;
    RTS                                                                  ;848C0F;


Instruction_PLM_QueueSound_Y_Lib2_Max6:
    LDA.W $0000,Y                                                        ;848C10;
    JSL.L QueueSound_Lib2_Max6                                           ;848C13;
    INY                                                                  ;848C17;
    RTS                                                                  ;848C18;


Instruction_PLM_QueueSound_Y_Lib3_Max6:
    LDA.W $0000,Y                                                        ;848C19;
    JSL.L QueueSound_Lib3_Max6                                           ;848C1C;
    INY                                                                  ;848C20;
    RTS                                                                  ;848C21;


UNUSED_Instruction_PLM_QueueSound_Y_Lib1_Max15_848C22:
    LDA.W $0000,Y                                                        ;848C22;
    JSL.L QueueSound                                                     ;848C25;
    INY                                                                  ;848C29;
    RTS                                                                  ;848C2A;


UNUSED_Instruction_PLM_QueueSound_Y_Lib2_Max15_848C2B:
    LDA.W $0000,Y                                                        ;848C2B;
    JSL.L QueueSound_Lib2_Max15                                          ;848C2E;
    INY                                                                  ;848C32;
    RTS                                                                  ;848C33;


UNUSED_Instruction_PLM_QueueSound_Y_Lib3_Max15_848C34:
    LDA.W $0000,Y                                                        ;848C34;
    JSL.L QueueSound_Lib3_Max15                                          ;848C37;
    INY                                                                  ;848C3B;
    RTS                                                                  ;848C3C;


UNUSED_Instruction_PLM_QueueSound_Y_Lib1_Max3_848C3D:
    LDA.W $0000,Y                                                        ;848C3D;
    JSL.L QueueSound_Lib1_Max3                                           ;848C40;
    INY                                                                  ;848C44;
    RTS                                                                  ;848C45;


Instruction_PLM_QueueSound_Y_Lib2_Max3:
    LDA.W $0000,Y                                                        ;848C46;
    JSL.L QueueSound_Lib2_Max3                                           ;848C49;
    INY                                                                  ;848C4D;
    RTS                                                                  ;848C4E;


UNUSED_Instruction_PLM_QueueSound_Y_Lib3_Max3_848C4F:
    LDA.W $0000,Y                                                        ;848C4F;
    JSL.L QueueSound_Lib3_Max3                                           ;848C52;
    INY                                                                  ;848C56;
    RTS                                                                  ;848C57;


UNUSED_Instruction_PLM_QueueSound_Y_Lib1_Max9_848C58:
    LDA.W $0000,Y                                                        ;848C58;
    JSL.L QueueSound_Lib1_Max9                                           ;848C5B;
    INY                                                                  ;848C5F;
    RTS                                                                  ;848C60;


UNUSED_Instruction_PLM_QueueSound_Y_Lib2_Max9_848C61:
    LDA.W $0000,Y                                                        ;848C61;
    JSL.L QueueSound_Lib2_Max9                                           ;848C64;
    INY                                                                  ;848C68;
    RTS                                                                  ;848C69;


UNUSED_Instruction_PLM_QueueSound_Y_Lib3_Max9_848C6A:
    LDA.W $0000,Y                                                        ;848C6A;
    JSL.L QueueSound_Lib3_Max9                                           ;848C6D;
    INY                                                                  ;848C71;
    RTS                                                                  ;848C72;


UNUSED_Instruction_PLM_QueueSound_Y_Lib1_Max1_848C73:
    LDA.W $0000,Y                                                        ;848C73;
    JSL.L QueueSound_Lib1_Max1                                           ;848C76;
    INY                                                                  ;848C7A;
    RTS                                                                  ;848C7B;


Instruction_PLM_QueueSound_Y_Lib2_Max1:
    LDA.W $0000,Y                                                        ;848C7C;
    JSL.L QueueSound_Lib2_Max1                                           ;848C7F;
    INY                                                                  ;848C83;
    RTS                                                                  ;848C84;


UNUSED_Instruction_PLM_QueueSound_Y_Lib3_Max1_848C85:
    LDA.W $0000,Y                                                        ;848C85;
    JSL.L QueueSound_Lib3_Max1                                           ;848C88;
    INY                                                                  ;848C8C;
    RTS                                                                  ;848C8D;


RTS_848C8E:
    RTS                                                                  ;848C8E;


Instruction_PLM_Activate_MapStation:
    PHX                                                                  ;848C8F;
    PHY                                                                  ;848C90;
    LDX.W $079F                                                          ;848C91;
    LDA.L $7ED908,X                                                      ;848C94;
    ORA.W #$00FF                                                         ;848C98;
    STA.L $7ED908,X                                                      ;848C9B;
    LDA.W #$0014                                                         ;848C9F;
    JSL.L MessageBox_Routine                                             ;848CA2;
    LDA.W #$0001                                                         ;848CA6;
    STA.W $0789                                                          ;848CA9;
    PLY                                                                  ;848CAC;
    PLX                                                                  ;848CAD;
    RTS                                                                  ;848CAE;


Instruction_PLM_Activate_EnergyStation:
    PHX                                                                  ;848CAF;
    PHY                                                                  ;848CB0;
    LDA.W $09C4                                                          ;848CB1;
    CMP.W $09C2                                                          ;848CB4;
    BEQ .unlockSamus                                                     ;848CB7;
    LDA.W #$0015                                                         ;848CB9;
    JSL.L MessageBox_Routine                                             ;848CBC;
    LDA.W $09C4                                                          ;848CC0;
    STA.W $09C2                                                          ;848CC3;

.unlockSamus:
    LDA.W #$0001                                                         ;848CC6;
    JSL.L Run_Samus_Command                                              ;848CC9;
    PLY                                                                  ;848CCD;
    PLX                                                                  ;848CCE;
    RTS                                                                  ;848CCF;


Instruction_PLM_Activate_MissileStation:
    PHX                                                                  ;848CD0;
    PHY                                                                  ;848CD1;
    LDA.W $09C8                                                          ;848CD2;
    CMP.W $09C6                                                          ;848CD5;
    BEQ .unlockSamus                                                     ;848CD8;
    LDA.W #$0016                                                         ;848CDA;
    JSL.L MessageBox_Routine                                             ;848CDD;
    LDA.W $09C8                                                          ;848CE1;
    STA.W $09C6                                                          ;848CE4;

.unlockSamus:
    LDA.W #$0001                                                         ;848CE7;
    JSL.L Run_Samus_Command                                              ;848CEA;
    PLY                                                                  ;848CEE;
    PLX                                                                  ;848CEF;
    RTS                                                                  ;848CF0;


Instruction_PLM_GotoY_or_ActivateSaveStation:
    PHX                                                                  ;848CF1;
    PHY                                                                  ;848CF2;
    LDA.W #$0017                                                         ;848CF3;
    JSL.L MessageBox_Routine                                             ;848CF6;
    CMP.W #$0002                                                         ;848CFA;
    BEQ .gotoY                                                           ;848CFD;
    LDX.W $1C27                                                          ;848CFF;
    LDY.W #EnemyProjectile_SaveStationElectricity                        ;848D02;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;848D05;
    LDA.W $1DC7,X                                                        ;848D09;
    AND.W #$0007                                                         ;848D0C;
    STA.W $078B                                                          ;848D0F;
    JSL.L BitIndexToByteIndexAndBitmask                                  ;848D12;
    LDA.W $079F                                                          ;848D16;
    ASL A                                                                ;848D19;
    TAX                                                                  ;848D1A;
    LDA.L $7ED8F8,X                                                      ;848D1B;
    ORA.W $05E7                                                          ;848D1F;
    STA.L $7ED8F8,X                                                      ;848D22;
    LDA.W $0952                                                          ;848D26;
    JSL.L SaveToSRAM                                                     ;848D29;
    PLY                                                                  ;848D2D;
    PLX                                                                  ;848D2E;
    INY                                                                  ;848D2F;
    INY                                                                  ;848D30;
    RTS                                                                  ;848D31;


.gotoY:
    PLY                                                                  ;848D32;
    PLX                                                                  ;848D33;
    LDA.W $0000,Y                                                        ;848D34;
    TAY                                                                  ;848D37;
    RTS                                                                  ;848D38;


UNUSED_Instruction_PLM_ResumeMusicIn6Seconds_848D39:
    LDA.W #$0168                                                         ;848D39;
    JSL.L Play_Room_Music_Track_After_A_Frames                           ;848D3C;
    RTS                                                                  ;848D40;


Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM:
    JSL.L Calculate_PLM_Block_Coordinates                                ;848D41;
    LDA.W $0AF6                                                          ;848D45;
    LSR A                                                                ;848D48;
    LSR A                                                                ;848D49;
    LSR A                                                                ;848D4A;
    LSR A                                                                ;848D4B;
    SEC                                                                  ;848D4C;
    SBC.W $1C29                                                          ;848D4D;
    BPL +                                                                ;848D50;
    EOR.W #$FFFF                                                         ;848D52;
    INC A                                                                ;848D55;

  + SEP #$20                                                             ;848D56;
    CMP.W $0000,Y                                                        ;848D58;
    REP #$20                                                             ;848D5B;
    BEQ +                                                                ;848D5D;
    BCS .tooFar                                                          ;848D5F;

  + LDA.W $0AFA                                                          ;848D61;
    LSR A                                                                ;848D64;
    LSR A                                                                ;848D65;
    LSR A                                                                ;848D66;
    LSR A                                                                ;848D67;
    SEC                                                                  ;848D68;
    SBC.W $1C2B                                                          ;848D69;
    BPL +                                                                ;848D6C;
    EOR.W #$FFFF                                                         ;848D6E;
    INC A                                                                ;848D71;

  + SEP #$20                                                             ;848D72;
    CMP.W $0001,Y                                                        ;848D74;
    REP #$20                                                             ;848D77;
    BEQ .gotoY                                                           ;848D79;
    BCS .tooFar                                                          ;848D7B;

.gotoY:
    LDA.W $0002,Y                                                        ;848D7D;
    TAY                                                                  ;848D80;
    RTS                                                                  ;848D81;


.tooFar:
    TYA                                                                  ;848D82;
    CLC                                                                  ;848D83;
    ADC.W #$0004                                                         ;848D84;
    TAY                                                                  ;848D87;
    RTS                                                                  ;848D88;


UNUSED_Instruction_PLM_MovePLMDown1Block_848D89:
    LDA.W $1C87,X                                                        ;848D89;
    CLC                                                                  ;848D8C;
    ADC.W $07A5                                                          ;848D8D;
    ADC.W $07A5                                                          ;848D90;
    STA.W $1C87,X                                                        ;848D93;
    RTS                                                                  ;848D96;


RTS_848D97:
    RTS                                                                  ;848D97;


UNUSED_InstList_PLM_DefaultPLM_848D98:
    dw $1000,InstList_PLM_DefaultPLMDrawInstruction                      ;848D98;
    dw Instruction_PLM_GotoY                                             ;848D9C;
    dw UNUSED_InstList_PLM_DefaultPLM_848D98                             ;848D9E;

InstList_PLM_DefaultPLMDrawInstruction:
; Note that this is an invalid draw instruction
; Used by instruction list $8D98: Unused. Default PLM instruction list
    dw $0180,$0000,$0000                                                 ;848DA0;

UNUSED_DrawPLM_Custom_DrawInstPointer_TilemapBaseAddr_848DA6:
    JSR.W DrawPLM                                                        ;848DA6;
    RTL                                                                  ;848DA9;


DrawPLM_HardCoded:
    REP #$30                                                             ;848DAA;
    LDA.W #$5000                                                         ;848DAC;
    STA.B $09                                                            ;848DAF;
    LDA.W #$53E0                                                         ;848DB1;
    STA.B $0C                                                            ;848DB4;
    LDA.L $7EDE6C,X                                                      ;848DB6;
    TAY                                                                  ;848DBA;

DrawPLM:
    LDA.W $1C29                                                          ;848DBB;
    STA.B $1E                                                            ;848DBE;
    LDA.W $1C2B                                                          ;848DC0;
    STA.B $20                                                            ;848DC3;

.loopDrawEntry:
    LDA.W $0915                                                          ;848DC5;
    LSR A                                                                ;848DC8;
    LSR A                                                                ;848DC9;
    LSR A                                                                ;848DCA;
    LSR A                                                                ;848DCB;
    STA.B $1A                                                            ;848DCC;
    CLC                                                                  ;848DCE;
    ADC.W #$000F                                                         ;848DCF;
    CMP.B $20                                                            ;848DD2;
    BPL +                                                                ;848DD4;
    RTS                                                                  ;848DD6;


  + LDA.W $0000,Y                                                        ;848DD7;
    BPL .horizontal                                                      ;848DDA;
    JMP.W .vertical                                                      ;848DDC;


.horizontal:
    AND.W #$7FFF                                                         ;848DDF;
    STA.B $14                                                            ;848DE2;
    STZ.B $1C                                                            ;848DE4;
    LDA.B $20                                                            ;848DE6;
    CMP.B $1A                                                            ;848DE8;
    BMI .return8E2F                                                      ;848DEA;
    STA.B $1A                                                            ;848DEC;
    STZ.B $12                                                            ;848DEE;
    LDA.B $1E                                                            ;848DF0;
    STA.B $18                                                            ;848DF2;
    LDA.W $0911                                                          ;848DF4;
    CLC                                                                  ;848DF7;
    ADC.W #$000F                                                         ;848DF8;
    LSR A                                                                ;848DFB;
    LSR A                                                                ;848DFC;
    LSR A                                                                ;848DFD;
    LSR A                                                                ;848DFE;
    DEC A                                                                ;848DFF;
    STA.B $16                                                            ;848E00;
    SEC                                                                  ;848E02;
    SBC.B $1E                                                            ;848E03;
    BMI +                                                                ;848E05;
    BEQ +                                                                ;848E07;
    STA.B $12                                                            ;848E09;
    LDA.B $14                                                            ;848E0B;
    CLC                                                                  ;848E0D;
    ADC.B $1E                                                            ;848E0E;
    CMP.B $16                                                            ;848E10;
    BEQ .return8E2F                                                      ;848E12;
    BMI .return8E2F                                                      ;848E14;
    LDA.B $14                                                            ;848E16;
    LDA.B $14                                                            ;848E18; >_<
    SEC                                                                  ;848E1A;
    SBC.B $12                                                            ;848E1B;
    STA.B $14                                                            ;848E1D;
    LDA.B $16                                                            ;848E1F;
    STA.B $18                                                            ;848E21;

  + LDA.B $16                                                            ;848E23;
    CLC                                                                  ;848E25;
    ADC.W #$0011                                                         ;848E26;
    STA.B $16                                                            ;848E29;
    CMP.B $1E                                                            ;848E2B;
    BPL +                                                                ;848E2D;

.return8E2F:
    RTS                                                                  ;848E2F;


  + LDA.B $18                                                            ;848E30;
    CLC                                                                  ;848E32;
    ADC.B $14                                                            ;848E33;
    DEC A                                                                ;848E35;
    SEC                                                                  ;848E36;
    SBC.B $16                                                            ;848E37;
    STA.B $16                                                            ;848E39;
    BMI +                                                                ;848E3B;
    LDA.B $14                                                            ;848E3D;
    SEC                                                                  ;848E3F;
    SBC.B $16                                                            ;848E40;
    STA.B $14                                                            ;848E42;
    BEQ .return8E2F                                                      ;848E44;

  + PHX                                                                  ;848E46;
    LDX.W $0330                                                          ;848E47;
    CPX.W #$01E0                                                         ;848E4A;
    BMI +                                                                ;848E4D;

.pullXreturn:
    PLX                                                                  ;848E4F;

.return8E50:
    RTS                                                                  ;848E50;


  + LDA.W #$0200                                                         ;848E51;
    SEC                                                                  ;848E54;
    SBC.W $1C25                                                          ;848E55;
    LSR A                                                                ;848E58;
    LSR A                                                                ;848E59;
    LSR A                                                                ;848E5A;
    CMP.B $14                                                            ;848E5B;
    BMI .pullXreturn                                                     ;848E5D;
    LDA.B $1A                                                            ;848E5F;
    AND.W #$000F                                                         ;848E61;
    ORA.W #$4000                                                         ;848E64;
    STA.W HW_WRMPYA                                                      ;848E67;
    LDA.B $18                                                            ;848E6A;
    AND.W #$001F                                                         ;848E6C;
    CMP.W #$0010                                                         ;848E6F;
    BCS .greaterThan10h                                                  ;848E72;
    ASL A                                                                ;848E74;
    CLC                                                                  ;848E75;
    ADC.B $09                                                            ;848E76;
    ADC.W HW_RDMPY                                                       ;848E78;
    PHA                                                                  ;848E7B;
    LDA.W $091D                                                          ;848E7C;
    AND.W #$0100                                                         ;848E7F;
    BEQ +                                                                ;848E82;
    PLA                                                                  ;848E84;
    CLC                                                                  ;848E85;
    ADC.W #$0400                                                         ;848E86;
    PHA                                                                  ;848E89;
    BRA +                                                                ;848E8A;


.greaterThan10h:
    ASL A                                                                ;848E8C;
    CLC                                                                  ;848E8D;
    ADC.B $0C                                                            ;848E8E;
    ADC.W HW_RDMPY                                                       ;848E90;
    PHA                                                                  ;848E93;
    LDA.W $091D                                                          ;848E94;
    AND.W #$0100                                                         ;848E97;
    BEQ +                                                                ;848E9A;
    PLA                                                                  ;848E9C;
    SEC                                                                  ;848E9D;
    SBC.W #$0400                                                         ;848E9E;
    PHA                                                                  ;848EA1;

  + LDA.B $14                                                            ;848EA2;
    ASL A                                                                ;848EA4;
    STA.B $1E                                                            ;848EA5;
    PLA                                                                  ;848EA7;
    PHA                                                                  ;848EA8;
    AND.W #$001F                                                         ;848EA9;
    STA.B $22                                                            ;848EAC;
    CLC                                                                  ;848EAE;
    ADC.B $1E                                                            ;848EAF;
    DEC A                                                                ;848EB1;
    AND.W #$FFE0                                                         ;848EB2;
    BNE +                                                                ;848EB5;
    JMP.W .horizOneScreen                                                ;848EB7;


  + CPX.W #$00E4                                                         ;848EBA;
    BPL .return8F2C                                                      ;848EBD;
    LDA.W #$0020                                                         ;848EBF;
    SEC                                                                  ;848EC2;
    SBC.B $22                                                            ;848EC3;
    BMI .return8F2C                                                      ;848EC5;
    ASL A                                                                ;848EC7;
    STA.B $D0,X                                                          ;848EC8;
    STA.B $DE,X                                                          ;848ECA;
    PLA                                                                  ;848ECC;
    STA.B $D5,X                                                          ;848ECD;
    AND.W #$FFE0                                                         ;848ECF;
    EOR.W #$0400                                                         ;848ED2;
    STA.B $DC,X                                                          ;848ED5;
    LDA.B $DC,X                                                          ;848ED7;
    CLC                                                                  ;848ED9;
    ADC.W #$0020                                                         ;848EDA;
    STA.B $EA,X                                                          ;848EDD;
    LDA.B $D5,X                                                          ;848EDF;
    CLC                                                                  ;848EE1;
    ADC.W #$0020                                                         ;848EE2;
    STA.B $E3,X                                                          ;848EE5;
    LDA.B $14                                                            ;848EE7;
    ASL A                                                                ;848EE9;
    ASL A                                                                ;848EEA;
    STA.B $1E                                                            ;848EEB;
    SEC                                                                  ;848EED;
    SBC.B $D0,X                                                          ;848EEE;
    STA.B $D7,X                                                          ;848EF0;
    STA.B $E5,X                                                          ;848EF2;
    LDA.W #$C6C8                                                         ;848EF4; $7E
    CLC                                                                  ;848EF7;
    ADC.W $1C25                                                          ;848EF8;
    STA.B $D2,X                                                          ;848EFB;
    STA.B $00                                                            ;848EFD;
    CLC                                                                  ;848EFF;
    ADC.B $D0,X                                                          ;848F00;
    STA.B $D9,X                                                          ;848F02;
    CLC                                                                  ;848F04;
    ADC.B $D7,X                                                          ;848F05;
    STA.B $E0,X                                                          ;848F07;
    STA.B $06                                                            ;848F09;
    CLC                                                                  ;848F0B;
    ADC.B $DE,X                                                          ;848F0C;
    STA.B $E7,X                                                          ;848F0E;
    SEP #$20                                                             ;848F10;
    LDA.B #$7E                                                           ;848F12;
    STA.B $D4,X                                                          ;848F14;
    STA.B $02                                                            ;848F16;
    STA.B $DB,X                                                          ;848F18;
    STA.B $08                                                            ;848F1A;
    STA.B $E2,X                                                          ;848F1C;
    STA.B $E9,X                                                          ;848F1E;
    REP #$20                                                             ;848F20;
    TXA                                                                  ;848F22;
    CLC                                                                  ;848F23;
    ADC.W #$001C                                                         ;848F24;
    STA.W $0330                                                          ;848F27;
    BRA .horizAddToVRAMWriteTableEnd                                     ;848F2A;


.return8F2C:
    PLA                                                                  ;848F2C;
    PLX                                                                  ;848F2D;
    RTS                                                                  ;848F2E;


.horizOneScreen:
    PLA                                                                  ;848F2F;
    JSR.W PartiallySetupVRAMWriteTableEntries_SingleScrnPLMDrawTilemap   ;848F30;
    LDA.B $D5,X                                                          ;848F33;
    CLC                                                                  ;848F35;
    ADC.W #$0020                                                         ;848F36;
    STA.B $DC,X                                                          ;848F39;
    TXA                                                                  ;848F3B;
    CLC                                                                  ;848F3C;
    ADC.W #$000E                                                         ;848F3D;
    STA.W $0330                                                          ;848F40;

.horizAddToVRAMWriteTableEnd:
    LDA.B $12                                                            ;848F43;
    ASL A                                                                ;848F45;
    STA.B $12                                                            ;848F46;
    INY                                                                  ;848F48;
    INY                                                                  ;848F49;
    TYA                                                                  ;848F4A;
    CLC                                                                  ;848F4B;
    ADC.B $12                                                            ;848F4C;
    STA.B $03                                                            ;848F4E;
    LDY.W #$0000                                                         ;848F50;

.loopHorizBlock:
    LDA.B ($03)                                                          ;848F53;
    STA.B $1E                                                            ;848F55;
    AND.W #$03FF                                                         ;848F57;
    ASL A                                                                ;848F5A;
    ASL A                                                                ;848F5B;
    ASL A                                                                ;848F5C;
    TAX                                                                  ;848F5D;
    LDA.B $1E                                                            ;848F5E;
    AND.W #$0C00                                                         ;848F60;
    BNE .horizCopyBlockWithFlip                                          ;848F63;
    LDA.L $7EA000,X                                                      ;848F65;
    STA.B [$00],Y                                                        ;848F69;
    LDA.L $7EA004,X                                                      ;848F6B;
    STA.B [$06],Y                                                        ;848F6F;
    INY                                                                  ;848F71;
    INY                                                                  ;848F72;
    LDA.L $7EA002,X                                                      ;848F73;
    STA.B [$00],Y                                                        ;848F77;
    LDA.L $7EA006,X                                                      ;848F79;
    STA.B [$06],Y                                                        ;848F7D;
    BRA .horizNextBlock                                                  ;848F7F;


.horizCopyBlockWithFlip:
    CMP.W #$0400                                                         ;848F81;
    BNE .horizCopyBlockWithVertFlip                                      ;848F84;
    LDA.L $7EA002,X                                                      ;848F86;
    EOR.W #$4000                                                         ;848F8A;
    STA.B [$00],Y                                                        ;848F8D;
    LDA.L $7EA006,X                                                      ;848F8F;
    EOR.W #$4000                                                         ;848F93;
    STA.B [$06],Y                                                        ;848F96;
    INY                                                                  ;848F98;
    INY                                                                  ;848F99;
    LDA.L $7EA000,X                                                      ;848F9A;
    EOR.W #$4000                                                         ;848F9E;
    STA.B [$00],Y                                                        ;848FA1;
    LDA.L $7EA004,X                                                      ;848FA3;
    EOR.W #$4000                                                         ;848FA7;
    STA.B [$06],Y                                                        ;848FAA;

.horizNextBlock:
    INY                                                                  ;848FAC;
    INY                                                                  ;848FAD;
    INC.B $03                                                            ;848FAE;
    INC.B $03                                                            ;848FB0;
    LDA.W $1C25                                                          ;848FB2;
    CLC                                                                  ;848FB5;
    ADC.W #$0008                                                         ;848FB6;
    STA.W $1C25                                                          ;848FB9;
    CMP.W #$0200                                                         ;848FBC;
    BPL .return8FC8                                                      ;848FBF;
    DEC.B $14                                                            ;848FC1;
    BNE .loopHorizBlock                                                  ;848FC3;
    JMP.W .nextDrawEntry                                                 ;848FC5;


.return8FC8:
    PLX                                                                  ;848FC8;
    RTS                                                                  ;848FC9;


.horizCopyBlockWithVertFlip:
    CMP.W #$0800                                                         ;848FCA;
    BNE .horizCopyBlockWithBothFlips                                     ;848FCD;
    LDA.L $7EA004,X                                                      ;848FCF;
    EOR.W #$8000                                                         ;848FD3;
    STA.B [$00],Y                                                        ;848FD6;
    LDA.L $7EA000,X                                                      ;848FD8;
    EOR.W #$8000                                                         ;848FDC;
    STA.B [$06],Y                                                        ;848FDF;
    INY                                                                  ;848FE1;
    INY                                                                  ;848FE2;
    LDA.L $7EA006,X                                                      ;848FE3;
    EOR.W #$8000                                                         ;848FE7;
    STA.B [$00],Y                                                        ;848FEA;
    LDA.L $7EA002,X                                                      ;848FEC;
    EOR.W #$8000                                                         ;848FF0;
    STA.B [$06],Y                                                        ;848FF3;
    BRA .horizNextBlock                                                  ;848FF5;


.horizCopyBlockWithBothFlips:
    LDA.L $7EA006,X                                                      ;848FF7;
    EOR.W #$C000                                                         ;848FFB;
    STA.B [$00],Y                                                        ;848FFE;
    LDA.L $7EA002,X                                                      ;849000;
    EOR.W #$C000                                                         ;849004;
    STA.B [$06],Y                                                        ;849007;
    INY                                                                  ;849009;
    INY                                                                  ;84900A;
    LDA.L $7EA004,X                                                      ;84900B;
    EOR.W #$C000                                                         ;84900F;
    STA.B [$00],Y                                                        ;849012;
    LDA.L $7EA000,X                                                      ;849014;
    EOR.W #$C000                                                         ;849018;
    STA.B [$06],Y                                                        ;84901B;
    BRA .horizNextBlock                                                  ;84901D;


.vertical:
    AND.W #$7FFF                                                         ;84901F;
    STA.B $14                                                            ;849022;
    LDA.W $0911                                                          ;849024;
    LSR A                                                                ;849027;
    LSR A                                                                ;849028;
    LSR A                                                                ;849029;
    LSR A                                                                ;84902A;
    CMP.B $1E                                                            ;84902B;
    BEQ +                                                                ;84902D;
    BPL .return903B                                                      ;84902F;

  + CLC                                                                  ;849031;
    ADC.W #$0011                                                         ;849032;
    CMP.B $1E                                                            ;849035;
    BEQ .return903B                                                      ;849037;
    BPL +                                                                ;849039;

.return903B:
    RTS                                                                  ;84903B;


  + LDA.B $1E                                                            ;84903C;
    STA.B $18                                                            ;84903E;
    STZ.B $12                                                            ;849040;
    LDA.B $1A                                                            ;849042;
    CLC                                                                  ;849044;
    ADC.W #$0010                                                         ;849045;
    STA.B $16                                                            ;849048;
    LDA.B $1A                                                            ;84904A;
    SEC                                                                  ;84904C;
    SBC.B $20                                                            ;84904D;
    BMI .drawBlockGreaterThanScreenBlock                                 ;84904F;
    STA.B $12                                                            ;849051;
    LDA.B $14                                                            ;849053;
    CLC                                                                  ;849055;
    ADC.B $20                                                            ;849056;
    CMP.B $1A                                                            ;849058;
    BMI .return903B                                                      ;84905A;
    LDA.B $14                                                            ;84905C;
    SEC                                                                  ;84905E;
    SBC.B $12                                                            ;84905F;
    STA.B $14                                                            ;849061;

.crash:
    BMI .crash                                                           ;849063;
    BNE +                                                                ;849065;
    RTS                                                                  ;849067;


.drawBlockGreaterThanScreenBlock:
    LDA.B $20                                                            ;849068;
    STA.B $1A                                                            ;84906A;

  + LDA.B $1A                                                            ;84906C;
    CLC                                                                  ;84906E;
    ADC.B $14                                                            ;84906F;
    SEC                                                                  ;849071;
    SBC.B $16                                                            ;849072;
    STA.B $16                                                            ;849074;
    BMI +                                                                ;849076;
    LDA.B $14                                                            ;849078;
    SEC                                                                  ;84907A;
    SBC.B $16                                                            ;84907B;
    STA.B $14                                                            ;84907D;
    BEQ .return903B                                                      ;84907F;
    BMI .return908C                                                      ;849081;

  + PHX                                                                  ;849083;
    LDX.W $0330                                                          ;849084;
    CPX.W #$00F0                                                         ;849087;
    BMI +                                                                ;84908A;

.return908C:
    PLX                                                                  ;84908C;
    RTS                                                                  ;84908D;


  + LDA.W #$0200                                                         ;84908E;
    SEC                                                                  ;849091;
    SBC.W $1C25                                                          ;849092;
    LSR A                                                                ;849095;
    LSR A                                                                ;849096;
    LSR A                                                                ;849097;
    CMP.B $14                                                            ;849098;
    BMI .return908C                                                      ;84909A;
    LDA.W #$8000                                                         ;84909C;
    STA.B $1C                                                            ;84909F;
    JSR.W Calculate_PLMDrawTilemap_VRAMDestination                       ;8490A1;
    LDA.B $D5,X                                                          ;8490A4;
    INC A                                                                ;8490A6;
    STA.B $DC,X                                                          ;8490A7;
    TXA                                                                  ;8490A9;
    CLC                                                                  ;8490AA;
    ADC.W #$000E                                                         ;8490AB;
    STA.W $0330                                                          ;8490AE;
    LDA.B $12                                                            ;8490B1;
    ASL A                                                                ;8490B3;
    STA.B $12                                                            ;8490B4;
    INY                                                                  ;8490B6;
    INY                                                                  ;8490B7;
    TYA                                                                  ;8490B8;
    CLC                                                                  ;8490B9;
    ADC.B $12                                                            ;8490BA;
    STA.B $03                                                            ;8490BC;
    LDY.W #$0000                                                         ;8490BE;

.loopVertBlock:
    LDA.B ($03)                                                          ;8490C1;
    STA.B $1E                                                            ;8490C3;
    AND.W #$03FF                                                         ;8490C5;
    ASL A                                                                ;8490C8;
    ASL A                                                                ;8490C9;
    ASL A                                                                ;8490CA;
    TAX                                                                  ;8490CB;
    LDA.B $1E                                                            ;8490CC;
    AND.W #$0C00                                                         ;8490CE;
    BNE .vertCopyBlockWithFlip                                           ;8490D1;
    LDA.L $7EA000,X                                                      ;8490D3;
    STA.B [$00],Y                                                        ;8490D7;
    LDA.L $7EA002,X                                                      ;8490D9;
    STA.B [$06],Y                                                        ;8490DD;
    INY                                                                  ;8490DF;
    INY                                                                  ;8490E0;
    LDA.L $7EA004,X                                                      ;8490E1;
    STA.B [$00],Y                                                        ;8490E5;
    LDA.L $7EA006,X                                                      ;8490E7;
    STA.B [$06],Y                                                        ;8490EB;
    JMP.W .vertNextBlock                                                 ;8490ED;


.vertCopyBlockWithFlip:
    CMP.W #$0400                                                         ;8490F0;
    BNE .vertCopyBlockWithVertFlip                                       ;8490F3;
    LDA.L $7EA002,X                                                      ;8490F5;
    EOR.W #$4000                                                         ;8490F9;
    STA.B [$00],Y                                                        ;8490FC;
    LDA.L $7EA000,X                                                      ;8490FE;
    EOR.W #$4000                                                         ;849102;
    STA.B [$06],Y                                                        ;849105;
    INY                                                                  ;849107;
    INY                                                                  ;849108;
    LDA.L $7EA006,X                                                      ;849109;
    EOR.W #$4000                                                         ;84910D;
    STA.B [$00],Y                                                        ;849110;
    LDA.L $7EA004,X                                                      ;849112;
    EOR.W #$4000                                                         ;849116;
    STA.B [$06],Y                                                        ;849119;
    BRA .vertNextBlock                                                   ;84911B;


.vertCopyBlockWithVertFlip:
    CMP.W #$0800                                                         ;84911D;
    BNE .vertCopyBlockWithBothFlips                                      ;849120;
    LDA.L $7EA004,X                                                      ;849122;
    EOR.W #$8000                                                         ;849126;
    STA.B [$00],Y                                                        ;849129;
    LDA.L $7EA006,X                                                      ;84912B;
    EOR.W #$8000                                                         ;84912F;
    STA.B [$06],Y                                                        ;849132;
    INY                                                                  ;849134;
    INY                                                                  ;849135;
    LDA.L $7EA000,X                                                      ;849136;
    EOR.W #$8000                                                         ;84913A;
    STA.B [$00],Y                                                        ;84913D;
    LDA.L $7EA002,X                                                      ;84913F;
    EOR.W #$8000                                                         ;849143;
    STA.B [$06],Y                                                        ;849146;
    BRA .vertNextBlock                                                   ;849148;


.vertCopyBlockWithBothFlips:
    LDA.L $7EA006,X                                                      ;84914A;
    EOR.W #$C000                                                         ;84914E;
    STA.B [$00],Y                                                        ;849151;
    LDA.L $7EA004,X                                                      ;849153;
    EOR.W #$C000                                                         ;849157;
    STA.B [$06],Y                                                        ;84915A;
    INY                                                                  ;84915C;
    INY                                                                  ;84915D;
    LDA.L $7EA002,X                                                      ;84915E;
    EOR.W #$C000                                                         ;849162;
    STA.B [$00],Y                                                        ;849165;
    LDA.L $7EA000,X                                                      ;849167;
    EOR.W #$C000                                                         ;84916B;
    STA.B [$06],Y                                                        ;84916E;

.vertNextBlock:
    INY                                                                  ;849170;
    INY                                                                  ;849171;
    INC.B $03                                                            ;849172;
    INC.B $03                                                            ;849174;
    LDA.W $1C25                                                          ;849176;
    CLC                                                                  ;849179;
    ADC.W #$0008                                                         ;84917A;
    STA.W $1C25                                                          ;84917D;
    CMP.W #$0200                                                         ;849180;
    BPL .return918C                                                      ;849183;
    DEC.B $14                                                            ;849185;
    BEQ .nextDrawEntry                                                   ;849187;
    JMP.W .loopVertBlock                                                 ;849189;


.return918C:
    PLX                                                                  ;84918C;
    RTS                                                                  ;84918D;


.nextDrawEntry:
    PLX                                                                  ;84918E;
    LDY.B $03                                                            ;84918F;
    LDA.B $16                                                            ;849191;
    BMI +                                                                ;849193;
    ASL A                                                                ;849195;
    CLC                                                                  ;849196;
    ADC.B $03                                                            ;849197;
    TAY                                                                  ;849199;

  + LDA.W $0000,Y                                                        ;84919A;
    BNE +                                                                ;84919D;
    RTS                                                                  ;84919F;


  + AND.W #$00FF                                                         ;8491A0;
    BIT.W #$0080                                                         ;8491A3;
    BNE +                                                                ;8491A6;
    CLC                                                                  ;8491A8;
    ADC.W $1C29                                                          ;8491A9;
    STA.B $1E                                                            ;8491AC;
    BRA .incY                                                            ;8491AE;


  + ORA.W #$FF00                                                         ;8491B0;
    CLC                                                                  ;8491B3;
    ADC.W $1C29                                                          ;8491B4;
    STA.B $1E                                                            ;8491B7;

.incY:
    INY                                                                  ;8491B9;
    LDA.W $0000,Y                                                        ;8491BA;
    AND.W #$00FF                                                         ;8491BD;
    BIT.W #$0080                                                         ;8491C0;
    BNE .setHighByte                                                     ;8491C3;
    CLC                                                                  ;8491C5;
    ADC.W $1C2B                                                          ;8491C6;
    STA.B $20                                                            ;8491C9;
    INY                                                                  ;8491CB;
    JMP.W .loopDrawEntry                                                 ;8491CC;


.setHighByte:
    ORA.W #$FF00                                                         ;8491CF;
    CLC                                                                  ;8491D2;
    ADC.W $1C2B                                                          ;8491D3;
    STA.B $20                                                            ;8491D6;
    INY                                                                  ;8491D8;
    JMP.W .loopDrawEntry                                                 ;8491D9;


Calculate_PLMDrawTilemap_VRAMDestination:
    LDA.B $1A                                                            ;8491DC;
    AND.W #$000F                                                         ;8491DE;
    ORA.W #$4000                                                         ;8491E1;
    STA.W HW_WRMPYA                                                      ;8491E4;
    LDA.B $18                                                            ;8491E7;
    AND.W #$001F                                                         ;8491E9;
    CMP.W #$0010                                                         ;8491EC;
    BCS .greaterThanF                                                    ;8491EF;
    ASL A                                                                ;8491F1;
    CLC                                                                  ;8491F2;
    ADC.B $09                                                            ;8491F3;
    ADC.W HW_RDMPY                                                       ;8491F5;
    PHA                                                                  ;8491F8;
    LDA.W $091D                                                          ;8491F9;
    AND.W #$0100                                                         ;8491FC;
    BEQ .fallthrough                                                     ;8491FF;
    PLA                                                                  ;849201;
    CLC                                                                  ;849202;
    ADC.W #$0400                                                         ;849203;
    PHA                                                                  ;849206;
    BRA .fallthrough                                                     ;849207;


.greaterThanF:
    ASL A                                                                ;849209;
    CLC                                                                  ;84920A;
    ADC.B $0C                                                            ;84920B;
    ADC.W HW_RDMPY                                                       ;84920D;
    PHA                                                                  ;849210;
    LDA.W $091D                                                          ;849211;
    AND.W #$0100                                                         ;849214;
    BEQ .fallthrough                                                     ;849217;
    PLA                                                                  ;849219;
    SEC                                                                  ;84921A;
    SBC.W #$0400                                                         ;84921B;
    PHA                                                                  ;84921E;

.fallthrough:
    PLA                                                                  ;84921F;

PartiallySetupVRAMWriteTableEntries_SingleScrnPLMDrawTilemap:
    ORA.B $1C                                                            ;849220;
    STA.B $D5,X                                                          ;849222;
    LDA.B $14                                                            ;849224;
    ASL A                                                                ;849226;
    ASL A                                                                ;849227;
    STA.B $D0,X                                                          ;849228;
    STA.B $D7,X                                                          ;84922A;
    LDA.W #$C6C8                                                         ;84922C; $7E
    CLC                                                                  ;84922F;
    ADC.W $1C25                                                          ;849230;
    STA.B $D2,X                                                          ;849233;
    STA.B $00                                                            ;849235;
    CLC                                                                  ;849237;
    ADC.B $D0,X                                                          ;849238;
    STA.B $D9,X                                                          ;84923A;
    STA.B $06                                                            ;84923C;
    SEP #$20                                                             ;84923E;
    LDA.B #$7E                                                           ;849240;
    STA.B $D4,X                                                          ;849242;
    STA.B $DB,X                                                          ;849244;
    STA.B $02                                                            ;849246;
    STA.B $08                                                            ;849248;
    REP #$20                                                             ;84924A;
    RTS                                                                  ;84924C;


DrawInst_UnusedBlueBrinstarFaceBlock:
    dw $0001,$817E                                                       ;84924D;
    dw $0000

DrawInst_CrateriaMainStreetEscape:
    dw $0002,$00FF,$00FF                                                 ;849253;
    dw $0000

DrawInst_CrittersEscapeBlock_0:
    dw $8003,$8053,$8053,$8053                                           ;84925B;
    dw $0000

DrawInst_CrittersEscapeBlock_1:
    dw $8003,$8054,$8054,$8054                                           ;849265;
    dw $0000

DrawInst_CrittersEscapeBlock_2:
    dw $8003,$8055,$8055,$8055                                           ;84926F;
    dw $0000

DrawInst_CrittersEscapeBlock_3:
    dw $8003,$80FF,$80FF,$80FF                                           ;849279;
    dw $0000

DrawInst_OldTourianEscapeShaftBlocks:
    dw $8003,$00FF,$00FF,$00FF                                           ;849283;
    db $01,$00                                                           ;84928B;
    dw $8003,$00FF,$00FF,$00FF                                           ;84928D;
    dw $0000

DrawInst_CrumbleAccessToTourianElevator_0:
    dw $0004,$00FF,$00FF,$00FF,$00FF                                     ;849297;
    dw $0000

DrawInst_CrumbleAccessToTourianElevator_1:
    dw $0004,$0053,$0053,$0053,$0053                                     ;8492A3;
    dw $0000

DrawInst_CrumbleAccessToTourianElevator_2:
    dw $0004,$0054,$0054,$0054,$0054                                     ;8492AF;
    dw $0000

DrawInst_CrumbleAccessToTourianElevator_3:
    dw $0004,$0055,$0055,$0055,$0055                                     ;8492BB;
    dw $0000

DrawInst_ClearAccessToTourianElevator:
    dw $0004,$00FF,$00FF,$00FF,$00FF                                     ;8492C7;
    db $00,$01                                                           ;8492D1;
    dw $0004,$00FF,$00FF,$00FF,$00FF                                     ;8492D3;
    db $00,$02                                                           ;8492DD;
    dw $0004,$00FF,$00FF,$00FF,$00FF                                     ;8492DF;
    db $00,$03                                                           ;8492E9;
    dw $0004,$00FF,$00FF,$00FF,$00FF                                     ;8492EB;
    db $00,$04                                                           ;8492F5;
    dw $0004,$00FF,$00FF,$00FF,$00FF                                     ;8492F7;
    db $00,$05                                                           ;849301;
    dw $0004,$00FF,$00FF,$00FF,$00FF                                     ;849303;
    dw $0000

DrawInst_ClearBotwoonWall:
    dw $8009,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF                   ;84930F;
    dw $00FF,$00FF
    dw $0000                                                 ;84931F;

UNUSED_DrawInst_849325:
    dw $8009,$8053,$8053,$8053,$8053,$8053,$8053,$8053                   ;849325;
    dw $8053,$8053
    dw $0000                                                 ;849335;

UNUSED_DrawInst_84933B:
    dw $8009,$8054,$8054,$8054,$8054,$8054,$8054,$8054                   ;84933B;
    dw $8054,$8054
    dw $0000                                                 ;84934B;

UNUSED_DrawInst_849351:
    dw $8009,$0055,$0055,$0055,$0055,$0055,$0055,$0055                   ;849351;
    dw $0055,$0055
    dw $0000                                                 ;849361;

DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_Elevatube:
    dw $0001,$8180
    dw $0000                                                 ;849367;

DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_0:
    dw $0001,$8181
    dw $0000                                                 ;84936D;

DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_1:
    dw $0001,$0182
    dw $0000                                                 ;849373;

UNUSED_DrawInst_SetKraidCeilingBlockToBackground1_849379:
    dw $0001,$013C
    dw $0000                                                 ;849379;

DrawInst_SetKraidCeilingBlockToBackground2:
    dw $0001,$0131
    dw $0000                                                 ;84937F;

DrawInst_SetKraidCeilingBlockToBackground3:
    dw $0001,$0130
    dw $0000                                                 ;849385;

UNUSED_DrawInst_84938B:
    dw $0001,$011C
    dw $0000                                                 ;84938B;

DrawInst_CrumbleKraidSpikeBlocks_0:
    dw $0001,$0111
    dw $0000                                                 ;849391;

DrawInst_CrumbleKraidSpikeBlocks_1:
    dw $0001,$0110
    dw $0000                                                 ;849397;

DrawInst_ClearKraidCeiling:
    dw $000F,$013C,$0131,$0130,$0131,$0130,$0131,$0130                   ;84939D;
    dw $0131,$0130,$0131,$0130,$0131,$0130,$0131,$0130                   ;8493AD;
    dw $0000                                                             ;8493BD;

DrawInst_ClearKraidSpikeBlocks:
    dw $0016,$0111,$0110,$0111,$0110,$0111,$0110,$0111                   ;8493BF;
    dw $0110,$0111,$0110,$0111,$0110,$0111,$0110,$0111                   ;8493CF;
    dw $0110,$0111,$0110,$0111,$0110,$0111,$0110                         ;8493DF;
    dw $0000

DrawInst_DrawPhantoonsDoorDuringBossFight:
    dw $8004,$95C1,$95E1,$9DE1,$9DC1                                     ;8493EF;
    db $01,$00                                                           ;8493F9;
    dw $8004,$C5C0,$D5E0,$DDE0,$DDC0                                     ;8493FB;
    dw $0000

DrawInst_RestorePhantoonsDoorDuringBossFight:
    dw $8004,$9440,$9460,$9C60,$9C40                                     ;849407;
    dw $0000

DrawInst_ClearSporeSpawnCeiling:
    dw $0002,$00FF,$00FF                                                 ;849413;
    db $00,$01                                                           ;849419;
    dw $0002,$00FF,$00FF                                                 ;84941B;
    dw $0000

DrawInst_CrumbleSporeSpawnCeiling_0:
    dw $0002,$0053,$0053                                                 ;849423;
    db $00,$01                                                           ;849429;
    dw $0002,$0053,$0053                                                 ;84942B;
    dw $0000

DrawInst_CrumbleSporeSpawnCeiling_1:
    dw $0002,$0054,$0054                                                 ;849433;
    db $00,$01                                                           ;849439;
    dw $0002,$0054,$0054                                                 ;84943B;
    dw $0000

DrawInst_CrumbleSporeSpawnCeiling_2:
    dw $0002,$0055,$0055                                                 ;849443;
    db $00,$01                                                           ;849449;
    dw $0002,$0055,$0055                                                 ;84944B;
    dw $0000

UNUSED_DrawInst_849453:
    dw $8002,$00FF,$12FB                                                 ;849453;
    db $00,$FE                                                           ;849459;
    dw $8002,$1AFB,$00FF                                                 ;84945B;
    dw $0000

UNUSED_DrawInst_849463:
    dw $8002,$80FF,$82FB                                                 ;849463;
    db $00,$FE                                                           ;849469;
    dw $8002,$8AFB,$80FF                                                 ;84946B;
    dw $0000

DrawInst_EscapeRoom1Gate_0:
    dw $8004,$80FF,$80FF,$80FF,$80FF                                     ;849473;
    dw $0000

DrawInst_EscapeRoom1Gate_1:
    dw $8004,$830F,$80FF,$80FF,$830F                                     ;84947F;
    dw $0000

DrawInst_EscapeRoom1Gate_2:
    dw $8004,$830F,$8AE8,$82E8,$830F                                     ;84948B;
    dw $0000

UNUSED_DrawInst_849497:
    dw $0001,$00FF                                                       ;849497;
    dw $0000

UNUSED_DrawInst_84949D:
    dw $0001,$80FF                                                       ;84949D;
    dw $0000

DrawInst_FillMotherBrainsWall:
    dw $8002,$8340,$830F                                                 ;8494A3;
    db $00,$FF                                                           ;8494A9;
    dw $8001,$8B0F                                                       ;8494AB;
    dw $0000

DrawInst_MotherBrainsRoomEscapeDoor:
    dw $8004,$9222,$D1AF,$D1D0,$D220                                     ;8494B1;
    db $01,$00                                                           ;8494BB;
    dw $8004,$0223,$01EB,$01D0,$0221                                     ;8494BD;
    dw $0000

UNUSED_DrawInst_8494C9:
    dw $000D,$8044,$8044,$8044,$8044,$8044,$8044,$8044                   ;8494C9;
    dw $8044,$8044,$8044,$8044,$8044,$8044                               ;8494D9;
    dw $0000

UNUSED_DrawInst_8494E7:
    dw $000D,$8044,$8044,$8044,$8044,$8044,$8044,$8044                   ;8494E7;
    dw $8044,$8044,$8044,$8044,$8044,$8044                               ;8494F7;
    dw $0000

DrawInst_MotherBrainsBackgroundRow2:
    dw $000D,$1241,$1242,$12FC,$12FC,$12FC,$1243,$1244                   ;849505;
    dw $12FC,$1245,$1642,$1241,$1241,$1246                               ;849515;
    dw $0000

DrawInst_MotherBrainsBackgroundRow3:
    dw $000D,$09EF,$01B2,$01E5,$01E5,$01E6,$01E5,$01E5                   ;849523;
    dw $01E5,$01E5,$05B2,$09EF,$09EF,$01B2                               ;849533;
    dw $0000

DrawInst_MotherBrainsBackgroundRow4:
    dw $000D,$01B1,$01D2,$01C6,$01C7,$00FF,$0206,$0207                   ;849541;
    dw $00FF,$01A6,$09CA,$060C,$05B1,$0A09                               ;849551;
    dw $0000

DrawInst_MotherBrainsBackgroundRow5:
    dw $000D,$01D1,$01F2,$01A4,$01E7,$01A4,$0226,$0227                   ;84955F;
    dw $01A5,$01A4,$020D,$0E09,$01B1,$01AB                               ;84956F;
    dw $0000

DrawInst_MotherBrainsBackgroundRow6:
    dw $000D,$01B1,$0212,$01C4,$01C9,$01C4,$0206,$0207                   ;84957D;
    dw $01C5,$01C4,$0628,$01AC,$01EC,$01EC                               ;84958D;
    dw $0000

DrawInst_MotherBrainsBackgroundRow7:
    dw $000D,$01B1,$0A0C,$05CA,$0DC7,$01AA,$01A8,$01A8                   ;84959B;
    dw $01A8,$01A8,$0628,$01AB,$01CD,$01CD                               ;8495AB;
    dw $0000

DrawInst_MotherBrainsBackgroundRow8:
    dw $000D,$01D1,$01D0,$05EA,$00FF,$00FF,$0206,$0207                   ;8495B9;
    dw $00FF,$01A7,$0A0D,$0609,$01EB,$01D0                               ;8495C9;
    dw $0000

DrawInst_MotherBrainsBackgroundRow9:
    dw $000D,$01EB,$01EB,$05EA,$00FF,$00FF,$0206,$0207                   ;8495D7;
    dw $00FF,$01A6,$00FF,$0A2C,$0609,$01AE                               ;8495E7;
    dw $0000

DrawInst_MotherBrainsBackgroundRowA:
    dw $000D,$01EC,$01AF,$05EA,$05C7,$05C6,$0206,$0207                   ;8495F5;
    dw $01A8,$01A6,$01A8,$01A8,$05D2,$01AE                               ;849605;
    dw $0000

DrawInst_MotherBrainsBackgroundRowB:
    dw $000D,$01AC,$01AF,$01B2,$05E7,$01E5,$0226,$0227                   ;849613;
    dw $01E5,$01A6,$01E6,$01E5,$05B2,$01CD                               ;849623;
    dw $0000

DrawInst_MotherBrainsBackgroundRowC:
    dw $000D,$060C,$01EF,$01B2,$01E5,$01E6,$01E5,$01E5                   ;849631;
    dw $01E6,$01E5,$01E5,$01E5,$05B2,$01EF                               ;849641;
    dw $0000

DrawInst_MotherBrainsBackgroundRowD:
    dw $000D,$1248,$1249,$124A,$124B,$1339,$124C,$124D                   ;84964F;
    dw $1339,$124E,$1339,$1339,$124F,$1249                               ;84965F;
    dw $0000

UNUSED_DrawInst_94966D:
    dw $000D,$8319,$8319,$8319,$8319,$8319,$8319,$8319                   ;84966D;
    dw $8319,$8319,$8319,$8319,$8319,$8319                               ;84967D;
    dw $0000

UNUSED_DrawInst_94968B:
    dw $000D,$8044,$8044,$8044,$8044,$8044,$8044,$8044                   ;84968B;
    dw $8044,$8044,$8044,$8044,$8044,$8044                               ;84969B;
    dw $0000

DrawInst_ClearCeilingBlockInMotherBrainsRoom:
    dw $8002,$12FC,$00FF                                                 ;8496A9;
    dw $0000

DrawInst_ClearCeilingTubeInMotherBrainsRoom:
    dw $8005,$12FC,$00FF,$00FF,$00FF,$00FF                               ;8496B1;
    dw $0000

DrawInst_ClearMotherBrainsBottomMiddleSideTube:
    dw $8004,$00FF,$00FF,$00FF,$1339                                     ;8496BF;
    dw $0000

DrawInst_ClearMotherBrainsBottomMiddleTubes:
    dw $8007,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF,$1339                   ;8496CB;
    db $01,$00                                                           ;8496DB;
    dw $8007,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF,$1339                   ;8496DD;
    dw $0000                                                             ;8496ED;

DrawInst_ClearMotherBrainsBottomLeftTube:
    dw $8005,$00FF,$00FF,$00FF,$00FF,$1339                               ;8496EF;
    db $01,$00                                                           ;8496FB;
    dw $0001,$00FF                                                       ;8496FD;
    dw $0000

DrawInst_ClearMotherBrainsBottomRightTube:
    dw $8005,$00FF,$00FF,$00FF,$00FF,$1339                               ;849703;
    db $FF,$00                                                           ;84970F;
    dw $0001,$00FF                                                       ;849711;
    dw $0000

DrawInst_MotherBrainsGlass_0:
    dw $0001,$C6C0                                                       ;849717;
    dw $0000

DrawInst_MotherBrainsGlass_1:
    dw $8004,$C2C7,$D2C9,$DAC9,$5AC7                                     ;84971D;
    db $FF,$01                                                           ;849727;
    dw $8002,$D2C8,$DAC8                                                 ;849729;
    dw $0000

DrawInst_MotherBrainsGlass_2:
    dw $8004,$C2C7,$D2CB,$DACB,$5AC7                                     ;849731;
    db $FF,$01                                                           ;84973B;
    dw $8002,$D2CA,$DACA                                                 ;84973D;
    dw $0000

DrawInst_MotherBrainsGlass_3:
    dw $8003,$C2C7,$02CC,$0ACC                                           ;849745;
    dw $0000

DrawInst_MotherBrainsGlass_4:
    dw $0001,$C2C7                                                       ;84974F;
    db $FD,$00                                                           ;849753;
    dw $8004,$82CD,$86C9,$8EC9,$8ACD                                     ;849755;
    db $FE,$01                                                           ;84975F;
    dw $8002,$86C8,$8EC8                                                 ;849761;
    dw $0000

DrawInst_MotherBrainsGlass_5:
    dw $0001,$C2C7                                                       ;849769;
    db $FD,$01                                                           ;84976D;
    dw $8003,$86CB,$8ECB,$8ACD                                           ;84976F;
    db $FE,$01                                                           ;849777;
    dw $8002,$86CA,$8ECA                                                 ;849779;
    dw $0000

DrawInst_MotherBrainsGlass_6:
    dw $0001,$C2C7                                                       ;849781;
    db $FD,$01                                                           ;849785;
    dw $8002,$06CC,$0ECC                                                 ;849787;
    dw $0000

DrawInst_MotherBrainsGlass_7:
    dw $8004,$C2CE,$02CF,$0ACF,$5ACE                                     ;84978F;
    db $FD,$00                                                           ;849799;
    dw $8004,$86CE,$06CF,$0ECF,$8ECE                                     ;84979B;
    db $FE,$01                                                           ;8497A5;
    dw $8002,$D6D0,$DED0                                                 ;8497A7;
    db $FF,$01                                                           ;8497AD;
    dw $8002,$D2D0,$DAD0                                                 ;8497AF;
    dw $0000

DrawInst_MotherBrainsGlass_8:
    dw $8004,$C2CE,$00FF,$00FF,$5ACE                                     ;8497B7;
    db $FD,$00                                                           ;8497C1;
    dw $8004,$86CE,$00FF,$00FF,$8ECE                                     ;8497C3;
    db $FE,$00                                                           ;8497CD;
    dw $8004,$52C2,$D2C3,$DAC3,$D2C4                                     ;8497CF;
    db $FF,$00                                                           ;8497D9;
    dw $8004,$56C2,$D6C3,$DEC3,$D6C4                                     ;8497DB;
    dw $0000

DrawInst_MotherBrainsGlass_9:
    dw $8004,$00FF,$00FF,$00FF,$00FF                                     ;8497E7;
    db $FD,$00                                                           ;8497F1;
    dw $8004,$00FF,$00FF,$00FF,$00FF                                     ;8497F3;
    db $FE,$00                                                           ;8497FD;
    dw $8004,$02D2,$02D3,$0AD3,$02D4                                     ;8497FF;
    db $FF,$00                                                           ;849809;
    dw $8004,$06D2,$06D3,$0ED3,$06D4                                     ;84980B;
    dw $0000

UNUSED_DrawInst_849817:
    dw $8004,$00FF,$00FF,$00FF,$00FF,$00FD,$8004,$00FF                   ;849817;
    dw $00FF,$00FF,$00FF,$00FE,$8004,$00FF,$00FF,$00FF                   ;849827;
    dw $00FF,$00FF,$8004,$00FF,$00FF,$00FF,$00FF                         ;849837;
    dw $0000

UNUSED_DrawInst_849847:
    dw $8004,$00FF,$00FF,$00FF,$00FF,$00FF,$8004,$0172                   ;849847;
    dw $0173,$0173,$0172,$00FE,$8004,$0172,$0173,$0173                   ;849857;
    dw $0172,$00FD,$8004,$00FF,$00FF,$00FF,$00FF                         ;849867;
    dw $0000

DrawInst_BombTorizosCrumblingChozo_0:
    dw $0002,$8065,$8066                                                 ;849877;
    db $FF,$00                                                           ;84987D;
    dw $0001,$8064                                                       ;84987F;
    db $00,$FF                                                           ;849883;
    dw $0002,$8045,$8046                                                 ;849885;
    db $FF,$01                                                           ;84988B;
    dw $0003,$8047,$8048,$8049                                           ;84988D;
    dw $0000

UNUSED_DrawInst_849897:
    dw $0001,$0001,$0000                                                 ;849897;

DrawInst_BombTorizosCrumblingChozo_1:
    dw $0002,$00FF,$00FF,$00FE,$0002,$00FF,$00FF,$01FE                   ;84989D;
    dw $0004,$00FF,$00FF,$00FF,$00FF,$FEFE,$0004,$00FF                   ;8498AD;
    dw $00FF,$00FF,$00FF,$FFFE,$0004,$00FF,$00FF,$00FF                   ;8498BD;
    dw $00FF                                                             ;8498CD;
    dw $0000

DrawInst_NoobTube_0:
    dw $0001,$C540                                                       ;8498D1;
    dw $0000

DrawInst_NoobTube_1:
    dw $0001,$8540                                                       ;8498D7;
    dw $0000

DrawInst_NoobTube_2:
    dw $0001,$8141                                                       ;8498DD;
    dw $0000

DrawInst_NoobTube_3:
    dw $000C,$8141,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF                   ;8498E3;
    dw $00FF,$00FF,$00FF,$00FF,$8541                                     ;8498F3;
    db $00,$01                                                           ;8498FD;
    dw $000C,$0322,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF                   ;8498FF;
    dw $00FF,$00FF,$00FF,$00FF,$0722                                     ;84990F;
    db $00,$02                                                           ;849919;
    dw $000C,$0323,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF                   ;84991B;
    dw $00FF,$00FF,$00FF,$00FF,$0723                                     ;84992B;
    db $00,$03                                                           ;849935;
    dw $000C,$0B23,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF                   ;849937;
    dw $00FF,$00FF,$00FF,$00FF,$0F23                                     ;849947;
    dw $0000

DrawInst_NoobTube_4:
    dw $0001,$0141                                                       ;849953;
    db $00,$04                                                           ;849957;
    dw $000C,$0B22,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF                   ;849959;
    dw $00FF,$00FF,$00FF,$00FF,$0F22                                     ;849969;
    db $00,$05                                                           ;849973;
    dw $000C,$814E,$814F,$00FF,$00FF,$00FF,$00FF,$00FF                   ;849975;
    dw $00FF,$00FF,$00FF,$854F,$854E                                     ;849985;
    dw $0000

DrawInst_NoobTube_5:
    dw $000C,$8141,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF                   ;849991;
    dw $00FF,$00FF,$00FF,$00FF,$8541                                     ;8499A1;
    db $00,$01                                                           ;8499AB;
    dw $000C,$0322,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF                   ;8499AD;
    dw $00FF,$00FF,$00FF,$00FF,$0722                                     ;8499BD;
    db $00,$02                                                           ;8499C7;
    dw $000C,$0323,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF                   ;8499C9;
    dw $00FF,$00FF,$00FF,$00FF,$0723                                     ;8499D9;
    dw $0000

DrawInst_NoobTube_6:
    dw $0001,$0141                                                       ;8499E5;
    db $00,$03                                                           ;8499E9;
    dw $000C,$0B23,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF                   ;8499EB;
    dw $00FF,$00FF,$00FF,$00FF,$0F23                                     ;8499FB;
    db $00,$04                                                           ;849A05;
    dw $000C,$0B22,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF                   ;849A07;
    dw $00FF,$00FF,$00FF,$00FF,$0F22                                     ;849A17;
    db $00,$05                                                           ;849A21;
    dw $000C,$814E,$814F,$00FF,$00FF,$00FF,$00FF,$00FF                   ;849A23;
    dw $00FF,$00FF,$00FF,$854F,$854E                                     ;849A33;
    dw $0000

DrawInst_SaveStation_0:
    dw $0002,$B859,$8C59                                                 ;849A3F;
    db $00,$FF                                                           ;849A45;
    dw $0002,$005B,$045B                                                 ;849A47;
    db $00,$FE                                                           ;849A4D;
    dw $0002,$005B,$045B                                                 ;849A4F;
    db $00,$FD                                                           ;849A55;
    dw $0002,$005B,$045B                                                 ;849A57;
    db $00,$FC                                                           ;849A5D;
    dw $0002,$005B,$045B                                                 ;849A5F;
    db $00,$FB                                                           ;849A65;
    dw $0002,$8059,$8459                                                 ;849A67;
    dw $0000

DrawInst_SaveStation_1:
    dw $0002,$8859,$8C59                                                 ;849A6F;
    db $00,$FF                                                           ;849A75;
    dw $0002,$005B,$045B                                                 ;849A77;
    db $00,$FE                                                           ;849A7D;
    dw $0002,$005B,$045B                                                 ;849A7F;
    db $00,$FD                                                           ;849A85;
    dw $0002,$005B,$045B                                                 ;849A87;
    db $00,$FC                                                           ;849A8D;
    dw $0002,$005B,$045B                                                 ;849A8F;
    db $00,$FB                                                           ;849A95;
    dw $0002,$8059,$8459                                                 ;849A97;
    dw $0000

DrawInst_SaveStation_2:
    dw $0002,$885A,$8C5A                                                 ;849A9F;
    db $00,$FF                                                           ;849AA5;
    dw $0002,$005C,$045C                                                 ;849AA7;
    db $00,$FE                                                           ;849AAD;
    dw $0002,$005C,$045C                                                 ;849AAF;
    db $00,$FD                                                           ;849AB5;
    dw $0002,$005C,$045C                                                 ;849AB7;
    db $00,$FC                                                           ;849ABD;
    dw $0002,$005C,$045C                                                 ;849ABF;
    db $00,$FB                                                           ;849AC5;
    dw $0002,$805A,$845A                                                 ;849AC7;
    dw $0000

UNUSED_DrawInst_Draw13BlankAirTiles_849ACF:
    dw $000D,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF                   ;849ACF;
    dw $00FF,$00FF,$00FF,$00FF,$00FF,$00FF                               ;849ADF;
    dw $0000

UNUSED_DrawInst_Draw13BlankSolidTiles_849AED:
    dw $000D,$80FF,$80FF,$80FF,$80FF,$80FF,$80FF,$80FF                   ;849AED;
    dw $80FF,$80FF,$80FF,$80FF,$80FF,$80FF                               ;849AFD;
    dw $0000

UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B0B:
    dw $0002,$C64A,$524A                                                 ;849B0B;
    db $00,$01                                                           ;849B11;
    dw $0002,$D66A,$D26A                                                 ;849B13;
    dw $0000

UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B1B:
    dw $0002,$8053,$8053                                                 ;849B1B;
    db $00,$01                                                           ;849B21;
    dw $0002,$8053,$8053                                                 ;849B23;
    dw $0000

UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B2B:
    dw $0002,$8054,$8054                                                 ;849B2B;
    db $00,$01                                                           ;849B31;
    dw $0002,$8054,$8054                                                 ;849B33;
    dw $0000

UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B3B:
    dw $0002,$0055,$0055                                                 ;849B3B;
    db $00,$01                                                           ;849B41;
    dw $0002,$0055,$0055                                                 ;849B43;
    dw $0000

UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B4B:
    dw $0002,$00FF,$00FF                                                 ;849B4B;
    db $00,$01                                                           ;849B51;
    dw $0002,$00FF,$00FF                                                 ;849B53;
    dw $0000

DrawInst_ClearCrocomiresBridge:
    dw $000A,$0080,$0080,$0080,$0080,$0080,$0080,$0080                   ;849B5B;
    dw $0080,$0080,$0080                                                 ;849B6B;
    dw $0000

DrawInst_CrumbleABlockOfCrocomiresBridge:
    dw $0001,$810B                                                       ;849B73;
    dw $0000

DrawInst_ClearABlockOfCrocomiresBridge:
    dw $0001,$0080                                                       ;849B79;
    dw $0000

DrawInst_ClearCrocomireInvisibleWall_0:
    dw $8008,$0080,$0107,$0127,$0107,$0127,$0147,$0080                   ;849B7F;
    dw $0080                                                             ;849B8F;
    db $01,$00                                                           ;849B91;
    dw $8008,$0080,$0108,$0128,$0108,$0128,$0148,$0080                   ;849B93;
    dw $0080                                                             ;849BA3;
    db $02,$00                                                           ;849BA5;
    dw $8008,$0080,$0109,$0129,$0109,$0129,$0149,$0080                   ;849BA7;
    dw $0080                                                             ;849BB7;
    dw $0000

DrawInst_ClearCrocomireInvisibleWall_1:
    dw $8008,$8080,$8107,$8127,$8107,$8127,$8147,$8080                   ;849BBB;
    dw $8080                                                             ;849BCB;
    db $01,$00                                                           ;849BCD;
    dw $8008,$8080,$8108,$8128,$8108,$8128,$8148,$8080                   ;849BCF;
    dw $8080                                                             ;849BDF;
    db $02,$00                                                           ;849BE1;
    dw $8008,$8080,$8109,$8129,$8109,$8129,$8149,$8080                   ;849BE3;
    dw $8080                                                             ;849BF3;
    dw $0000

DrawInst_EyeDoorEyeFacingLeft_0:
    dw $8004,$84AA,$84CC,$8CCC,$8CAA                                     ;849BF7;
    dw $0000

DrawInst_EyeDoorEyeFacingLeft_1:
    dw $8002,$84CC,$8CCC                                                 ;849C03;
    dw $0000

DrawInst_EyeDoorEyeFacingLeft_2:
    dw $8002,$84CB,$8CCB                                                 ;849C0B;
    dw $0000

DrawInst_EyeDoorEyeFacingLeft_3:
    dw $8002,$C4CA,$DCCA                                                 ;849C13;
    dw $0000

DrawInst_EyeDoorEyeFacingLeft_4:
    dw $8002,$84CD,$8CCD                                                 ;849C1B;
    dw $0000

DrawInst_EyeDoorEyeFacingLeft_5:
    dw $8002,$84CA,$8CCA                                                 ;849C23;
    dw $0000

DrawInst_EyeDoorFacingLeft_0:
    dw $0001,$A4AA                                                       ;849C2B;
    dw $0000

DrawInst_EyeDoorFacingLeft_1:
    dw $0001,$A4AB                                                       ;849C31;
    dw $0000

DrawInst_EyeDoorFacingLeft_2:
    dw $0001,$A4AC                                                       ;849C37;
    dw $0000

DrawInst_EyeDoorBottomFacingLeft_0:
    dw $0001,$ACAA                                                       ;849C3D;
    dw $0000

DrawInst_EyeDoorBottomFacingLeft_1:
    dw $0001,$ACAB                                                       ;849C43;
    dw $0000

DrawInst_EyeDoorBottomFacingLeft_2:
    dw $0001,$ACAC                                                       ;849C49;
    dw $0000

DrawInst_EyeDoorEyeFacingRight_0:
    dw $8004,$80AA,$80CC,$88CC,$88AA                                     ;849C4F;
    dw $0000

DrawInst_EyeDoorEyeFacingRight_1:
    dw $8002,$80CC,$88CC                                                 ;849C5B;
    dw $0000

DrawInst_EyeDoorEyeFacingRight_2:
    dw $8002,$80CB,$88CB                                                 ;849C63;
    dw $0000

DrawInst_EyeDoorEyeFacingRight_3:
    dw $8002,$C0CA,$D8CA                                                 ;849C6B;
    dw $0000

DrawInst_EyeDoorEyeFacingRight_4:
    dw $8002,$80CD,$88CD                                                 ;849C73;
    dw $0000

DrawInst_EyeDoorEyeFacingRight_5:
    dw $8002,$80CA,$88CA                                                 ;849C7B;
    dw $0000

DrawInst_EyeDoorFacingRight_0:
    dw $0001,$A0AA                                                       ;849C83;
    dw $0000

DrawInst_EyeDoorFacingRight_1:
    dw $0001,$A0AB                                                       ;849C89;
    dw $0000

DrawInst_EyeDoorFacingRight_2:
    dw $0001,$A0AC                                                       ;849C8F;
    dw $0000

DrawInst_EyeDoorBottomFacingRight_0:
    dw $0001,$A8AA                                                       ;849C95;
    dw $0000

DrawInst_EyeDoorBottomFacingRight_1:
    dw $0001,$A8AB                                                       ;849C9B;
    dw $0000

DrawInst_EyeDoorBottomFacingRight_2:
    dw $0001,$A8AC                                                       ;849CA1;
    dw $0000

UNUSED_DrawInst_AlternateLowerNorfairChozoHand_849CA7:
    dw $0001,$C0FF                                                       ;849CA7;
    dw $0000

UNUSED_DrawInst_849CAD:
    dw $0001,$8053                                                       ;849CAD;
    dw $0000

UNUSED_DrawInst_849CB3:
    dw $0001,$8054                                                       ;849CB3;
    dw $0000

UNUSED_DrawInst_849CB9:
    dw $0001,$0055                                                       ;849CB9;
    dw $0000

UNUSED_DrawInst_AlternateLowerNorfairChozoHand_849CBF:
    dw $0001,$00FF                                                       ;849CBF;
    dw $0000

DrawInst_ClearSlopeAccessForWreckedShipChozo:
    dw $000E,$012B,$012B,$012B,$012B,$012B,$012B,$012B                   ;849CC5;
    dw $012B,$012B,$012B,$012B,$012B,$012B,$112B                         ;849CD5;
    db $00,$05                                                           ;849CE3;
    dw $0009,$0111,$0111,$0111,$0111,$0111,$019B,$0129                   ;849CE5;
    dw $0129,$1129                                                       ;849CF5;
    db $05,$06                                                           ;849CF9;
    dw $0002,$01BB,$0129                                                 ;849CFB;
    db $05,$07                                                           ;849D01;
    dw $0001,$01BB                                                       ;849D03;
    db $05,$08                                                           ;849D07;
    dw $0001,$11BB                                                       ;849D09;
    dw $0000

DrawInst_BlockSlopeAccessForWreckedShipChozo:
    dw $000E,$A12B,$A12B,$A12B,$A12B,$A12B,$A12B,$A12B                   ;849D0F;
    dw $A12B,$A12B,$A12B,$A12B,$A12B,$A12B,$812B                         ;849D1F;
    db $00,$05                                                           ;849D2D;
    dw $0009,$8111,$8111,$8111,$8111,$8111,$819B,$8129                   ;849D2F;
    dw $8129,$8129                                                       ;849D3F;
    db $05,$06                                                           ;849D43;
    dw $0002,$81BB,$8129                                                 ;849D45;
    db $05,$07                                                           ;849D4B;
    dw $0001,$81BB                                                       ;849D4D;
    db $05,$08                                                           ;849D51;
    dw $0001,$81BB                                                       ;849D53;
    dw $0000

UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_0_849D59:
    dw $8004,$C171,$D171,$D171,$D171                                     ;849D59;
    db $FF,$00                                                           ;849D63;
    dw $8004,$8102,$8102,$8102,$8102                                     ;849D65;
    db $FE,$00                                                           ;849D6F;
    dw $8004,$8560,$8560,$8560,$8560                                     ;849D71;
    dw $0000

UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_1_849D7D:
    dw $8004,$8053,$8053,$8053,$8053                                     ;849D7D;
    db $FF,$00                                                           ;849D87;
    dw $8004,$8053,$8053,$8053,$8053                                     ;849D89;
    db $FE,$00                                                           ;849D93;
    dw $8004,$8053,$8053,$8053,$8053                                     ;849D95;
    dw $0000

UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_2_849DA1:
    dw $8004,$0054,$0054,$0054,$0054                                     ;849DA1;
    db $FF,$00                                                           ;849DAB;
    dw $8004,$0054,$0054,$0054,$0054                                     ;849DAD;
    db $FE,$00                                                           ;849DB7;
    dw $8004,$0054,$0054,$0054,$0054                                     ;849DB9;
    dw $0000

UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_3_849DC5:
    dw $8004,$8055,$8055,$8055,$8055                                     ;849DC5;
    db $FF,$00                                                           ;849DCF;
    dw $8004,$8055,$8055,$8055,$8055                                     ;849DD1;
    db $FE,$00                                                           ;849DDB;
    dw $8004,$8055,$8055,$8055,$8055                                     ;849DDD;
    dw $0000

UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_4_849DE9:
    dw $8004,$00FF,$00FF,$00FF,$00FF                                     ;849DE9;
    db $FF,$00                                                           ;849DF3;
    dw $8004,$D0FF,$D0FF,$D0FF,$30FF                                     ;849DF5;
    db $FE,$00                                                           ;849DFF;
    dw $8004,$D0FF,$D0FF,$D0FF,$30FF                                     ;849E01;
    dw $0000

DrawInst_BrinstarFloorPlant_0:
    dw $0002,$35A1,$85A0                                                 ;849E0D;
    db $FE,$00                                                           ;849E13;
    dw $0002,$81A0,$51A1                                                 ;849E15;
    db $FE,$FF                                                           ;849E1B;
    dw $0004,$2180,$2181,$2581,$2580                                     ;849E1D;
    dw $0000

UNUSED_DrawInst_849E29:
    dw $0002,$05A1,$85A0                                                 ;849E29;
    db $FE,$00                                                           ;849E2F;
    dw $0002,$81A0,$01A1                                                 ;849E31;
    db $FE,$FF                                                           ;849E37;
    dw $0004,$2180,$2181,$2581,$2580                                     ;849E39;
    dw $0000

DrawInst_BrinstarFloorPlant_1:
    dw $0002,$05A3,$85A2                                                 ;849E45;
    db $FE,$00                                                           ;849E4B;
    dw $0002,$81A2,$01A3                                                 ;849E4D;
    db $FE,$FF                                                           ;849E53;
    dw $0004,$2182,$2183,$2583,$2582                                     ;849E55;
    dw $0000

DrawInst_BrinstarFloorPlant_2:
    dw $0002,$05A5,$85A4                                                 ;849E61;
    db $FE,$00                                                           ;849E67;
    dw $0002,$81A4,$01A5                                                 ;849E69;
    db $FE,$FF                                                           ;849E6F;
    dw $0004,$2184,$2185,$2585,$2584                                     ;849E71;
    dw $0000

DrawInst_BrinstarFloorPlant_3:
    dw $0002,$05A7,$85A6                                                 ;849E7D;
    db $FE,$00                                                           ;849E83;
    dw $0002,$81A6,$01A7                                                 ;849E85;
    db $FE,$FF                                                           ;849E8B;
    dw $0004,$2186,$2187,$2587,$2586                                     ;849E8D;
    dw $0000

DrawInst_BrinstarCeilingPlant_0:
    dw $0002,$3DA1,$8DA0                                                 ;849E99;
    db $FE,$00                                                           ;849E9F;
    dw $0002,$89A0,$59A1                                                 ;849EA1;
    db $FE,$01                                                           ;849EA7;
    dw $0004,$2980,$2981,$2D81,$2D80                                     ;849EA9;
    dw $0000

UNUSED_DrawInst_849EB5:
    dw $0002,$0DA1,$8DA0                                                 ;849EB5;
    db $FE,$00                                                           ;849EBB;
    dw $0002,$89A0,$09A1                                                 ;849EBD;
    db $FE,$01                                                           ;849EC3;
    dw $0004,$2980,$2981,$2D81,$2D80                                     ;849EC5;
    dw $0000

DrawInst_BrinstarCeilingPlant_1:
    dw $0002,$0DA3,$8DA2                                                 ;849ED1;
    db $FE,$00                                                           ;849ED7;
    dw $0002,$89A2,$09A3                                                 ;849ED9;
    db $FE,$01                                                           ;849EDF;
    dw $0004,$2982,$2983,$2D83,$2D82                                     ;849EE1;
    dw $0000

DrawInst_BrinstarCeilingPlant_2:
    dw $0002,$0DA5,$8DA4                                                 ;849EED;
    db $FE,$00                                                           ;849EF3;
    dw $0002,$89A4,$09A5                                                 ;849EF5;
    db $FE,$01                                                           ;849EFB;
    dw $0004,$2984,$2985,$2D85,$2D84                                     ;849EFD;
    dw $0000

DrawInst_BrinstarCeilingPlant_3:
    dw $0002,$0DA7,$8DA6                                                 ;849F09;
    db $FE,$00                                                           ;849F0F;
    dw $0002,$89A6,$09A7                                                 ;849F11;
    db $FE,$01                                                           ;849F17;
    dw $0004,$2986,$2987,$2D87,$2D86                                     ;849F19;
    dw $0000

DrawInst_MapStation_0:
    dw $0001,$810C                                                       ;849F25;
    db $FF,$00                                                           ;849F29;
    dw $0001,$810B                                                       ;849F2B;
    dw $0000

DrawInst_MapStation_1:
    dw $0001,$812C                                                       ;849F31;
    db $FF,$00                                                           ;849F35;
    dw $0001,$812B                                                       ;849F37;
    dw $0000

DrawInst_MapStation_2:
    dw $0001,$814C                                                       ;849F3D;
    db $FF,$00                                                           ;849F41;
    dw $0001,$814B                                                       ;849F43;
    dw $0000

DrawInst_MapStationRightAccess_0:
    dw $0001,$8128                                                       ;849F49;
    db $FD,$00                                                           ;849F4D;
    dw $0001,$8528                                                       ;849F4F;
    dw $0000

DrawInst_MapStationRightAccess_1:
    dw $0001,$8129                                                       ;849F55;
    dw $0000

DrawInst_MapStationLeftAccess_0:
    dw $0001,$8528                                                       ;849F5B;
    db $03,$00                                                           ;849F5F;
    dw $0001,$8128                                                       ;849F61;
    dw $0000

DrawInst_MapStationLeftAccess_1:
    dw $0001,$8529                                                       ;849F67;
    dw $0000

DrawInst_EnergyStation_0:
    dw $0001,$80C4                                                       ;849F6D;
    db $00,$FF                                                           ;849F71;
    dw $0001,$10A4                                                       ;849F73;
    dw $0000

DrawInst_EnergyStation_1:
    dw $0001,$80C5                                                       ;849F79;
    db $00,$FF                                                           ;849F7D;
    dw $0001,$10A5                                                       ;849F7F;
    dw $0000

DrawInst_EnergyStation_2:
    dw $0001,$80C6                                                       ;849F85;
    db $00,$FF                                                           ;849F89;
    dw $0001,$10A6                                                       ;849F8B;
    dw $0000

DrawInst_MissileStation_0:
    dw $0001,$80C7                                                       ;849F91;
    db $00,$FF                                                           ;849F95;
    dw $0001,$10A7                                                       ;849F97;
    dw $0000

DrawInst_MissileStation_1:
    dw $0001,$80C8                                                       ;849F9D;
    db $00,$FF                                                           ;849FA1;
    dw $0001,$10A8                                                       ;849FA3;
    dw $0000

DrawInst_MissileStation_2:
    dw $0001,$80C9                                                       ;849FA9;
    db $00,$FF                                                           ;849FAD;
    dw $0001,$10A9                                                       ;849FAF;
    dw $0000

DrawInst_EnergyMissileStationRightAccess_0:
    dw $0001,$B4C3                                                       ;849FB5;
    dw $0000

DrawInst_EnergyMissileStationRightAccess_1:
    dw $0001,$84C1                                                       ;849FBB;
    dw $0000

DrawInst_EnergyMissileStationLeftAccess_0:
    dw $0001,$B0C3                                                       ;849FC1;
    dw $0000

DrawInst_EnergyMissileStationLeftAccess_1:
    dw $0001,$80C1                                                       ;849FC7;
    dw $0000

DrawInst_DraygonCannonShieldRight_0:
    dw $0002,$C514,$0513                                                 ;849FCD;
    db $00,$01                                                           ;849FD3;
    dw $0002,$D534,$0533                                                 ;849FD5;
    dw $0000

DrawInst_DraygonCannonShieldRight_1:
    dw $0002,$C516,$0515                                                 ;849FDD;
    db $00,$01                                                           ;849FE3;
    dw $0002,$D536,$0535                                                 ;849FE5;
    dw $0000

UNUSED_DrawInst_DraygonCannonShieldDownRight_0_849FED:
    dw $0002,$C510,$550F                                                 ;849FED;
    db $00,$01                                                           ;849FF3;
    dw $0002,$D530,$D52F                                                 ;849FF5;
    dw $0000

UNUSED_DrawInst_DraygonCannonShieldDownRight_1_849FFD:
    dw $0002,$C512,$5511                                                 ;849FFD;
    db $00,$01                                                           ;84A003;
    dw $0002,$D532,$D531                                                 ;84A005;
    dw $0000

UNUSED_DrawInst_DraygonCannonShieldUpRight_0_84A00D:
    dw $0002,$CD30,$5D2F                                                 ;84A00D;
    db $00,$01                                                           ;84A013;
    dw $0002,$DD10,$DD0F                                                 ;84A015;
    dw $0000

UNUSED_DrawInst_DraygonCannonShieldUpRight_1_84A01D:
    dw $0002,$CD32,$5D31                                                 ;84A01D;
    db $00,$01                                                           ;84A023;
    dw $0002,$DD12,$DD11                                                 ;84A025;
    dw $0000

DrawInst_DraygonCannonRight_0:
    dw $0002,$A580,$00FF                                                 ;84A02D;
    db $00,$01                                                           ;84A033;
    dw $0002,$A5A0,$00FF                                                 ;84A035;
    dw $0000

DrawInst_DraygonCannonRight_1:
    dw $0002,$A581,$00FF                                                 ;84A03D;
    db $00,$01                                                           ;84A043;
    dw $0002,$A5A1,$00FF                                                 ;84A045;
    dw $0000

DrawInst_DraygonCannonRight_2:
    dw $0002,$A582,$00FF                                                 ;84A04D;
    db $00,$01                                                           ;84A053;
    dw $0002,$A5A2,$00FF                                                 ;84A055;
    dw $0000

DrawInst_DraygonCannonRight_3:
    dw $0002,$A583,$00FF                                                 ;84A05D;
    db $00,$01                                                           ;84A063;
    dw $0002,$A5A3,$00FF                                                 ;84A065;
    dw $0000

UNUSED_DrawInst_DraygonCannonDownRight_0_84A06D:
    dw $0002,$A5A5,$A5A4                                                 ;84A06D;
    db $00,$01                                                           ;84A073;
    dw $0002,$A5C5,$05C4                                                 ;84A075;
    dw $0000

UNUSED_DrawInst_DraygonCannonDownRight_1_84A07D:
    dw $0002,$A5A7,$A5A6                                                 ;84A07D;
    db $00,$01                                                           ;84A083;
    dw $0002,$A5C7,$05C6                                                 ;84A085;
    dw $0000

UNUSED_DrawInst_DraygonCannonDownRight_2_84A08D:
    dw $0002,$A5A9,$A5A8                                                 ;84A08D;
    db $00,$01                                                           ;84A093;
    dw $0002,$A5C9,$05C8                                                 ;84A095;
    dw $0000

UNUSED_DrawInst_DraygonCannonDownRight_3_84A09D:
    dw $0002,$A5AB,$A5AA                                                 ;84A09D;
    db $00,$01                                                           ;84A0A3;
    dw $0002,$A5CB,$05CA                                                 ;84A0A5;
    dw $0000

UNUSED_DrawInst_DraygonCannonUpRight_0_84A0AD:
    dw $0002,$ADC5,$0DC4                                                 ;84A0AD;
    db $00,$01                                                           ;84A0B3;
    dw $0002,$ADA5,$ADA4                                                 ;84A0B5;
    dw $0000

UNUSED_DrawInst_DraygonCannonUpRight_1_84A0BD:
    dw $0002,$ADC7,$0DC6                                                 ;84A0BD;
    db $00,$01                                                           ;84A0C3;
    dw $0002,$ADA7,$ADA6                                                 ;84A0C5;
    dw $0000

UNUSED_DrawInst_DraygonCannonUpRight_2_84A0CD:
    dw $0002,$ADC9,$0DC8                                                 ;84A0CD;
    db $00,$01                                                           ;84A0D3;
    dw $0002,$ADA9,$ADA8                                                 ;84A0D5;
    dw $0000

UNUSED_DrawInst_DraygonCannonUpRight_3_84A0DD:
    dw $0002,$ADCB,$0DCA                                                 ;84A0DD;
    db $00,$01                                                           ;84A0E3;
    dw $0002,$ADAB,$ADAA                                                 ;84A0E5;
    dw $0000

DrawInst_DraygonCannonShieldLeft_0:
    dw $0001,$C114                                                       ;84A0ED;
    db $FF,$00                                                           ;84A0F1;
    dw $0001,$0113                                                       ;84A0F3;
    db $FF,$01                                                           ;84A0F7;
    dw $0002,$0133,$D134                                                 ;84A0F9;
    dw $0000

DrawInst_DraygonCannonShieldLeft_1:
    dw $0001,$C116                                                       ;84A101;
    db $FF,$00                                                           ;84A105;
    dw $0001,$0115                                                       ;84A107;
    db $FF,$01                                                           ;84A10B;
    dw $0002,$0135,$D136                                                 ;84A10D;
    dw $0000

UNUSED_DrawInst_DraygonCannonShieldDownLeft_0_84A115:
    dw $0001,$C110                                                       ;84A115;
    db $FF,$00                                                           ;84A119;
    dw $0001,$510F                                                       ;84A11B;
    db $FF,$01                                                           ;84A11F;
    dw $0002,$D12F,$D130                                                 ;84A121;
    dw $0000

UNUSED_DrawInst_DraygonCannonShieldDownLeft_1_84A129:
    dw $0001,$C112                                                       ;84A129;
    db $FF,$00                                                           ;84A12D;
    dw $0001,$5111                                                       ;84A12F;
    db $FF,$01                                                           ;84A133;
    dw $0002,$D131,$D132                                                 ;84A135;
    dw $0000

UNUSED_DrawInst_DraygonCannonShieldUpLeft_0_84A13D:
    dw $0001,$C930                                                       ;84A13D;
    db $FF,$00                                                           ;84A141;
    dw $0001,$592F                                                       ;84A143;
    db $FF,$01                                                           ;84A147;
    dw $0002,$D90F,$D910                                                 ;84A149;
    dw $0000

UNUSED_DrawInst_DraygonCannonShieldUpLeft_1_84A151:
    dw $0001,$C932                                                       ;84A151;
    db $FF,$00                                                           ;84A155;
    dw $0001,$5931                                                       ;84A157;
    db $FF,$01                                                           ;84A15B;
    dw $0002,$D911,$D912                                                 ;84A15D;
    dw $0000

DrawInst_DraygonCannonLeft_0:
    dw $0001,$A180                                                       ;84A165;
    db $FF,$00                                                           ;84A169;
    dw $0001,$00FF                                                       ;84A16B;
    db $FF,$01                                                           ;84A16F;
    dw $0002,$00FF,$A1A0                                                 ;84A171;
    dw $0000

DrawInst_DraygonCannonLeft_1:
    dw $0001,$A181                                                       ;84A179;
    db $FF,$00                                                           ;84A17D;
    dw $0001,$00FF                                                       ;84A17F;
    db $FF,$01                                                           ;84A183;
    dw $0002,$00FF,$A1A1                                                 ;84A185;
    dw $0000

DrawInst_DraygonCannonLeft_2:
    dw $0001,$A182                                                       ;84A18D;
    db $FF,$00                                                           ;84A191;
    dw $0001,$00FF                                                       ;84A193;
    db $FF,$01                                                           ;84A197;
    dw $0002,$00FF,$A1A2                                                 ;84A199;
    dw $0000

DrawInst_DraygonCannonLeft_3:
    dw $0001,$A183                                                       ;84A1A1;
    db $FF,$00                                                           ;84A1A5;
    dw $0001,$00FF                                                       ;84A1A7;
    db $FF,$01                                                           ;84A1AB;
    dw $0002,$00FF,$A1A3                                                 ;84A1AD;
    dw $0000

UNUSED_DrawInst_DraygonCannonDownLeft_0_84A1B5:
    dw $0001,$A1A5                                                       ;84A1B5;
    db $FF,$00                                                           ;84A1B9;
    dw $0001,$A1A4                                                       ;84A1BB;
    db $FF,$01                                                           ;84A1BF;
    dw $0002,$01C4,$A1C5                                                 ;84A1C1;
    dw $0000

UNUSED_DrawInst_DraygonCannonDownLeft_1_84A1C9:
    dw $0001,$A1A7                                                       ;84A1C9;
    db $FF,$00                                                           ;84A1CD;
    dw $0001,$A1A6                                                       ;84A1CF;
    db $FF,$01                                                           ;84A1D3;
    dw $0002,$01C6,$A1C7                                                 ;84A1D5;
    dw $0000

UNUSED_DrawInst_DraygonCannonDownLeft_2_84A1DD:
    dw $0001,$A1A9                                                       ;84A1DD;
    db $FF,$00                                                           ;84A1E1;
    dw $0001,$A1A8                                                       ;84A1E3;
    db $FF,$01                                                           ;84A1E7;
    dw $0002,$01C8,$A1C9                                                 ;84A1E9;
    dw $0000

UNUSED_DrawInst_DraygonCannonDownLeft_3_84A1F1:
    dw $0001,$A1AB                                                       ;84A1F1;
    db $FF,$00                                                           ;84A1F5;
    dw $0001,$A1AA                                                       ;84A1F7;
    db $FF,$01                                                           ;84A1FB;
    dw $0002,$01CA,$A1CB                                                 ;84A1FD;
    dw $0000

UNUSED_DrawInst_DraygonCannonUpLeft_0_84A205:
    dw $0001,$A9C5                                                       ;84A205;
    db $FF,$00                                                           ;84A209;
    dw $0001,$09C4                                                       ;84A20B;
    db $FF,$01                                                           ;84A20F;
    dw $0002,$A9A4,$A9A5                                                 ;84A211;
    dw $0000

UNUSED_DrawInst_DraygonCannonUpLeft_1_84A219:
    dw $0001,$A9C7                                                       ;84A219;
    db $FF,$00                                                           ;84A21D;
    dw $0001,$09C6                                                       ;84A21F;
    db $FF,$01                                                           ;84A223;
    dw $0002,$A9A6,$A9A7                                                 ;84A225;
    dw $0000

UNUSED_DrawInst_DraygonCannonUpLeft_2_84A22D:
    dw $0001,$A9C9                                                       ;84A22D;
    db $FF,$00                                                           ;84A231;
    dw $0001,$09C8                                                       ;84A233;
    db $FF,$01                                                           ;84A237;
    dw $0002,$A9A8,$A9A9                                                 ;84A239;
    dw $0000

UNUSED_DrawInst_DraygonCannonUpLeft_3_84A241:
    dw $0001,$A9CB                                                       ;84A241;
    db $FF,$00                                                           ;84A245;
    dw $0001,$09CA                                                       ;84A247;
    db $FF,$01                                                           ;84A24B;
    dw $0002,$A9AA,$A9AB                                                 ;84A24D;
    dw $0000

UNUSED_DrawInst_84A255:
    dw $8002,$2330,$2350                                                 ;84A255;
    dw $0000

UNUSED_DrawInst_84A25D:
    dw $8002,$2331,$2351                                                 ;84A25D;
    dw $0000

UNUSED_DrawInst_84A265:
    dw $8002,$2332,$2352                                                 ;84A265;
    dw $0000

UNUSED_DrawInst_84A26D:
    dw $8002,$2333,$2353                                                 ;84A26D;
    dw $0000

UNUSED_DrawInst_84A275:
    dw $8002,$2330,$2350                                                 ;84A275;
    db $FF,$00                                                           ;84A27B;
    dw $8002,$2330,$2350                                                 ;84A27D;
    dw $0000

UNUSED_DrawInst_84A285:
    dw $8002,$2331,$2351                                                 ;84A285;
    db $FF,$00                                                           ;84A28B;
    dw $8002,$2331,$2351                                                 ;84A28D;
    dw $0000

UNUSED_DrawInst_84A295:
    dw $8002,$2332,$2352                                                 ;84A295;
    db $FF,$00                                                           ;84A29B;
    dw $8002,$2332,$2352                                                 ;84A29D;
    dw $0000

UNUSED_DrawInst_84A2A5:
    dw $8002,$2333,$2353                                                 ;84A2A5;
    db $FF,$00                                                           ;84A2AB;
    dw $8002,$2333,$2353                                                 ;84A2AD;
    dw $0000

DrawInst_ItemChozoOrb:
    dw $0001,$00FF                                                       ;84A2B5;
    dw $0000

UNUSED_DrawInst_84A2BB:
    dw $0001,$805D                                                       ;84A2BB;
    dw $0000

UNUSED_DrawInst_84A2C1:
    dw $0001,$805E                                                       ;84A2C1;
    dw $0000

DrawInst_ItemOrb_0:
    dw $0001,$C072                                                       ;84A2C7;
    dw $0000

DrawInst_ItemOrb_1:
    dw $0001,$C073                                                       ;84A2CD;
    dw $0000

DrawInst_ItemOrb_2:
    dw $0001,$C074                                                       ;84A2D3;
    dw $0000

DrawInst_ItemOrbBurst:
    dw $0001,$8075                                                       ;84A2D9;
    dw $0000

DrawInst_EnergyTank_0:
    dw $0001,$B04A                                                       ;84A2DF;
    dw $0000

DrawInst_EnergyTank_1:
    dw $0001,$B04B                                                       ;84A2E5;
    dw $0000

DrawInst_MissileTank_0:
    dw $0001,$B04C                                                       ;84A2EB;
    dw $0000

DrawInst_MissileTank_1:
    dw $0001,$B04D                                                       ;84A2F1;
    dw $0000

DrawInst_SuperMissileTank_0:
    dw $0001,$B04E                                                       ;84A2F7;
    dw $0000

DrawInst_SuperMissileTank_1:
    dw $0001,$B04F                                                       ;84A2FD;
    dw $0000

DrawInst_PowerBombTank_0:
    dw $0001,$B050                                                       ;84A303;
    dw $0000

DrawInst_PowerBombTank_1:
    dw $0001,$B051                                                       ;84A309;
    dw $0000

DrawInst_DrawItemFrame0_0:
    dw $0001,$B08E                                                       ;84A30F;
    dw $0000

DrawInst_DrawItemFrame1_0:
    dw $0001,$B08F                                                       ;84A315;
    dw $0000

DrawInst_DrawItemFrame0_1:
    dw $0001,$B090                                                       ;84A31B;
    dw $0000

DrawInst_DrawItemFrame1_1:
    dw $0001,$B091                                                       ;84A321;
    dw $0000

DrawInst_DrawItemFrame0_2:
    dw $0001,$B092                                                       ;84A327;
    dw $0000

DrawInst_DrawItemFrame1_2:
    dw $0001,$B093                                                       ;84A32D;
    dw $0000

DrawInst_DrawItemFrame0_3:
    dw $0001,$B094                                                       ;84A333;
    dw $0000

DrawInst_DrawItemFrame1_3:
    dw $0001,$B095                                                       ;84A339;
    dw $0000

DrawInst_84A33F:
    dw $0001,$8052                                                       ;84A33F;
    dw $0000

DrawInst_Respawn1x1_0:
    dw $0001,$0053                                                       ;84A345;
    dw $0000

DrawInst_Respawn1x1_1:
    dw $0001,$0054                                                       ;84A34B;
    dw $0000

DrawInst_Respawn1x1_2:
    dw $0001,$0055                                                       ;84A351;
    dw $0000

DrawInst_Respawn1x1_3:
    dw $0001,$00FF                                                       ;84A357;
    dw $0000

DrawInst_Respawn2x1_0:
    dw $0002,$0053,$0053                                                 ;84A35D;
    dw $0000

DrawInst_Respawn2x1_1:
    dw $0002,$0054,$0054                                                 ;84A365;
    dw $0000

DrawInst_Respawn2x1_2:
    dw $0002,$0055,$0055                                                 ;84A36D;
    dw $0000

DrawInst_Respawn2x1_3:
    dw $0002,$00FF,$00FF                                                 ;84A375;
    dw $0000

DrawInst_Respawn1x2_0:
    dw $8002,$0053,$0053                                                 ;84A37D;
    dw $0000

DrawInst_Respawn1x2_1:
    dw $8002,$0054,$0054                                                 ;84A385;
    dw $0000

DrawInst_Respawn1x2_2:
    dw $8002,$0055,$0055                                                 ;84A38D;
    dw $0000

DrawInst_Respawn1x2_3:
    dw $8002,$00FF,$00FF                                                 ;84A395;
    dw $0000

DrawInst_Respawn2x2_0:
    dw $0002,$0053,$0053                                                 ;84A39D;
    db $00,$01                                                           ;84A3A3;
    dw $0002,$0053,$0053                                                 ;84A3A5;
    dw $0000

DrawInst_Respawn2x2_1:
    dw $0002,$0054,$0054                                                 ;84A3AD;
    db $00,$01                                                           ;84A3B3;
    dw $0002,$0054,$0054                                                 ;84A3B5;
    dw $0000

DrawInst_Respawn2x2_2:
    dw $0002,$0055,$0055                                                 ;84A3BD;
    db $00,$01                                                           ;84A3C3;
    dw $0002,$0055,$0055                                                 ;84A3C5;
    dw $0000

DrawInst_Respawn2x2_3:
    dw $0002,$00FF,$00FF                                                 ;84A3CD;
    db $00,$01                                                           ;84A3D3;
    dw $0002,$00FF,$00FF                                                 ;84A3D5;
    dw $0000

DrawInst_ItemShotBlock_0:
    dw $0001,$8053                                                       ;84A3DD;
    dw $0000

DrawInst_ItemShotBlock_1:
    dw $0001,$8054                                                       ;84A3E3;
    dw $0000

DrawInst_ItemShotBlock_2:
    dw $0001,$8055                                                       ;84A3E9;
    dw $0000

UNUSED_DrawInst_84A3EF:
    dw $0001,$80FF                                                       ;84A3EF;
    dw $0000

UNUSED_DrawInst_84A3F5:
    dw $0002,$8053,$8053                                                 ;84A3F5;
    dw $0000

UNUSED_DrawInst_84A3FD:
    dw $0002,$8054,$8054                                                 ;84A3FD;
    dw $0000

UNUSED_DrawInst_84A405:
    dw $0002,$8055,$8055                                                 ;84A405;
    dw $0000

UNUSED_DrawInst_84A40D:
    dw $0002,$80FF,$80FF                                                 ;84A40D;
    dw $0000

UNUSED_DrawInst_84A415:
    dw $8002,$8053,$8053                                                 ;84A415;
    dw $0000

UNUSED_DrawInst_84A41D:
    dw $8002,$8054,$8054                                                 ;84A41D;
    dw $0000

UNUSED_DrawInst_84A425:
    dw $8002,$8055,$8055                                                 ;84A425;
    dw $0000

UNUSED_DrawInst_84A42D:
    dw $8002,$80FF,$80FF                                                 ;84A42D;
    dw $0000

UNUSED_DrawInst_84A435:
    dw $0002,$8053,$8053                                                 ;84A435;
    db $00,$01                                                           ;84A43B;
    dw $0002,$8053,$8053                                                 ;84A43D;
    dw $0000

UNUSED_DrawInst_84A445:
    dw $0002,$8054,$8054                                                 ;84A445;
    db $00,$01                                                           ;84A44B;
    dw $0002,$8054,$8054                                                 ;84A44D;
    dw $0000

UNUSED_DrawInst_84A455:
    dw $0002,$8055,$8055                                                 ;84A455;
    db $00,$01                                                           ;84A45B;
    dw $0002,$8055,$8055                                                 ;84A45D;
    dw $0000

UNUSED_DrawInst_84A465:
    dw $0002,$80FF,$80FF                                                 ;84A465;
    db $00,$01                                                           ;84A46B;
    dw $0002,$80FF,$80FF                                                 ;84A46D;
    dw $0000

UNUSED_DrawInst_1x1ShotBlock_84A475:
    dw $0001,$C052                                                       ;84A475;
    dw $0000

DrawInst_2x1RespawningShotBlock:
    dw $0002,$C096,$5097                                                 ;84A47B;
    dw $0000

DrawInst_1x2RespawningShotBlock:
    dw $8002,$C098,$D0B8                                                 ;84A483;
    dw $0000

DrawInst_2x2RespawningShotBlock:
    dw $0002,$C099,$509A                                                 ;84A48B;
    db $00,$01                                                           ;84A491;
    dw $0002,$D0B9,$D0BA                                                 ;84A493;
    dw $0000

DrawInst_1x1RespawningCrumbleBlock:
    dw $0001,$B0BC                                                       ;84A49B;
    dw $0000

DrawInst_2x1RespawningCrumbleBlock:
    dw $0002,$B0BC,$50BC                                                 ;84A4A1;
    dw $0000

DrawInst_1x2RespawningCrumbleBlock:
    dw $8002,$B0BC,$D0BC                                                 ;84A4A9;
    dw $0000

DrawInst_2x2RespawningCrumbleBlock:
    dw $0002,$B0BC,$50BC                                                 ;84A4B1;
    db $00,$01                                                           ;84A4B7;
    dw $0002,$D0BC,$D0BC                                                 ;84A4B9;
    dw $0000

UNUSED_DrawInst_84A4C1:
    dw $0001,$F058                                                       ;84A4C1;
    dw $0000

DrawInst_2x1RespawningBombBlock:
    dw $0002,$F058,$5058                                                 ;84A4C7;
    dw $0000

DrawInst_1x2RespawningBombBlock:
    dw $8002,$F058,$D058                                                 ;84A4CF;
    dw $0000

DrawInst_2x2RespawningBombBlock:
    dw $0002,$F058,$5058                                                 ;84A4D7;
    db $00,$01                                                           ;84A4DD;
    dw $0002,$D058,$D058                                                 ;84A4DF;
    dw $0000

UNUSED_DrawInst_PowerBombBlockBombed_84A4E7:
    dw $0001,$C057                                                       ;84A4E7;
    dw $0000

UNUSED_DrawInst_SuperMissileBlockBombed_84A4ED:
    dw $0001,$C09F                                                       ;84A4ED;
    dw $0000

DrawInst_BombReactionSpeedBlock:
    dw $0001,$B0B6                                                       ;84A4F3;
    dw $0000

DrawInst_BreakableGrappleBlock_0:
    dw $0001,$E0B7                                                       ;84A4F9;
    dw $0000

DrawInst_BreakableGrappleBlock_1:
    dw $0001,$0053                                                       ;84A4FF;
    dw $0000

DrawInst_BreakableGrappleBlock_2:
    dw $0001,$0054                                                       ;84A505;
    dw $0000

DrawInst_BreakableGrappleBlock_3:
    dw $0001,$0055                                                       ;84A50B;
    dw $0000

DrawInst_BreakableGrappleBlock_4:
    dw $0001,$00FF                                                       ;84A511;
    dw $0000

DrawInst_DownwardsGateOpen:
    dw $8005,$C0D6,$00FF,$00FF,$00FF,$00FF                               ;84A517;
    dw $0000

DrawInst_DownwardsGateOpenClosed_0:
    dw $8005,$C0D7,$C0FF,$00FF,$00FF,$00FF                               ;84A525;
    dw $0000

DrawInst_DownwardsGateOpenClosed_1:
    dw $8005,$C0D7,$C0FF,$C0FF,$00FF,$00FF                               ;84A533;
    dw $0000

DrawInst_DownwardsGateOpenClosed_2:
    dw $8005,$C0D7,$C0FF,$C0FF,$C0FF,$00FF                               ;84A541;
    dw $0000

DrawInst_DownwardsGateOpenClosed_3:
    dw $8005,$C0D7,$C0FF,$C0FF,$C0FF,$C0FF                               ;84A54F;
    dw $0000

DrawInst_DownwardsGateClosed:
    dw $8005,$C0D6,$C0FF,$C0FF,$C0FF,$C0FF                               ;84A55D;
    dw $0000

DrawInst_UpwardsGateOpen:
    dw $8001,$C0D6,$FC00,$8004,$00FF,$00FF,$00FF,$00FF                   ;84A56B;
    dw $0000                                                             ;84A57B;

DrawInst_UpwardsGateOpenClosed_0:
    dw $8001,$C0D7                                                       ;84A57D;
    db $00,$FC                                                           ;84A581;
    dw $8004,$00FF,$00FF,$00FF,$80FF                                     ;84A583;
    dw $0000

DrawInst_UpwardsGateOpenClosed_1:
    dw $8001,$C0D7                                                       ;84A58F;
    db $00,$FC                                                           ;84A593;
    dw $8004,$00FF,$00FF,$C0FF,$C0FF                                     ;84A595;
    dw $0000

DrawInst_UpwardsGateOpenClosed_2:
    dw $8001,$C0D7                                                       ;84A5A1;
    db $00,$FC                                                           ;84A5A5;
    dw $8004,$00FF,$C0FF,$C0FF,$C0FF                                     ;84A5A7;
    dw $0000

DrawInst_UpwardsGateOpenClosed_3:
    dw $8001,$C0D7                                                       ;84A5B3;
    db $00,$FC                                                           ;84A5B7;
    dw $8004,$C0FF,$C0FF,$C0FF,$C0FF                                     ;84A5B9;
    dw $0000

DrawInst_UpwardsGateClosed:
    dw $8001,$C0D6                                                       ;84A5C5;
    db $00,$FC                                                           ;84A5C9;
    dw $8004,$C0FF,$C0FF,$C0FF,$C0FF                                     ;84A5CB;
    dw $0000

DrawInst_GateShotblockDownwardsBlueLeft:
    dw $0001,$80D6                                                       ;84A5D7;
    db $FF,$00                                                           ;84A5DB;
    dw $0001,$C0DB                                                       ;84A5DD;
    dw $0000

DrawInst_GateShotblockDownwardsBlueRight:
    dw $0002,$80D6,$C4DB                                                 ;84A5E3;
    dw $0000

DrawInst_GateShotblockDownwardsRedLeft:
    dw $0001,$80D6                                                       ;84A5EB;
    db $FF,$00                                                           ;84A5EF;
    dw $0001,$C0DA                                                       ;84A5F1;
    dw $0000

DrawInst_GateShotblockDownwardsRedRight:
    dw $0002,$80D6,$C4DA                                                 ;84A5F7;
    dw $0000

DrawInst_GateShotblockDownwardsGreenLeft:
    dw $0001,$80D6                                                       ;84A5FF;
    db $FF,$00                                                           ;84A603;
    dw $0001,$C0D9                                                       ;84A605;
    dw $0000

DrawInst_GateShotblockDownwardsGreenRight:
    dw $0002,$80D6,$C4D9                                                 ;84A60B;
    dw $0000

DrawInst_GateShotblockDownwardsYellowLeft:
    dw $0001,$80D6                                                       ;84A613;
    db $FF,$00                                                           ;84A617;
    dw $0001,$C0D8                                                       ;84A619;
    dw $0000

DrawInst_GateShotblockDownwardsYellowRight:
    dw $0002,$80D6,$C4D8                                                 ;84A61F;
    dw $0000

DrawInst_GateShotblockUpwardsBlueLeft:
    dw $0001,$88D6                                                       ;84A627;
    db $FF,$00                                                           ;84A62B;
    dw $0001,$C8DB                                                       ;84A62D;
    dw $0000

DrawInst_GateShotblockUpwardsBlueRight:
    dw $0002,$88D6,$CCDB                                                 ;84A633;
    dw $0000

DrawInst_GateShotblockUpwardsRedLeft:
    dw $0001,$88D6                                                       ;84A63B;
    db $FF,$00                                                           ;84A63F;
    dw $0001,$C8DA                                                       ;84A641;
    dw $0000

DrawInst_GateShotblockUpwardsRedRight:
    dw $0002,$88D6,$CCDA                                                 ;84A647;
    dw $0000

DrawInst_GateShotblockUpwardsGreenLeft:
    dw $0001,$88D6                                                       ;84A64F;
    db $FF,$00                                                           ;84A653;
    dw $0001,$C8D9                                                       ;84A655;
    dw $0000

DrawInst_GateShotblockUpwardsGreenRight:
    dw $0002,$88D6,$CCD9                                                 ;84A65B;
    dw $0000

DrawInst_GateShotblockUpwardsYellowLeft:
    dw $0001,$88D6                                                       ;84A663;
    db $FF,$00                                                           ;84A667;
    dw $0001,$C8D8                                                       ;84A669;
    dw $0000

DrawInst_GateShotblockUpwardsYellowRight:
    dw $0002,$88D6,$CCD8                                                 ;84A66F;
    dw $0000

DrawInst_DoorFacingLeft_A677:
    dw $8004,$0082,$00A2,$08A2,$0882                                     ;84A677;
    dw $0000

DrawInst_DoorFacingRight_A683:
    dw $8004,$0482,$04A2,$0CA2,$0C82                                     ;84A683;
    dw $0000

DrawInst_DoorFacingUp_A68F:
    dw $0004,$0484,$0483,$0083,$0084                                     ;84A68F;
    dw $0000

DrawInst_DoorFacingDown_A69B:
    dw $0004,$0C84,$0C83,$0883,$0884                                     ;84A69B;
    dw $0000

DrawInst_GreyDoorFacingLeft_0:
    dw $8004,$C0AE,$D0CE,$D8CE,$D8AE                                     ;84A6A7;
    dw $0000

DrawInst_GreyDoorFacingLeft_1:
    dw $8004,$80AF,$80CF,$88CF,$88AF                                     ;84A6B3;
    dw $0000

DrawInst_GreyDoorFacingLeft_2:
    dw $8004,$80B0,$80D0,$88D0,$88B0                                     ;84A6BF;
    dw $0000

DrawInst_GreyDoorFacingLeft_3:
    dw $8004,$80B1,$00D1,$08D1,$88B1                                     ;84A6CB;
    dw $0000

DrawInst_GreyDoorFacingRight_0:
    dw $8004,$C4AE,$D4CE,$DCCE,$DCAE                                     ;84A6D7;
    dw $0000

DrawInst_GreyDoorFacingRight_1:
    dw $8004,$84AF,$84CF,$8CCF,$8CAF                                     ;84A6E3;
    dw $0000

DrawInst_GreyDoorFacingRight_2:
    dw $8004,$84B0,$84D0,$8CD0,$8CB0                                     ;84A6EF;
    dw $0000

DrawInst_GreyDoorFacingRight_3:
    dw $8004,$84B1,$84D1,$8CD1,$8CB1                                     ;84A6FB;
    dw $0000

DrawInst_GreyDoorFacingUp_0:
    dw $0004,$C4B3,$54B2,$50B2,$50B3                                     ;84A707;
    dw $0000

DrawInst_GreyDoorFacingUp_1:
    dw $0004,$84D3,$84D2,$80D2,$80D3                                     ;84A713;
    dw $0000

DrawInst_GreyDoorFacingUp_2:
    dw $0004,$84B5,$84B4,$80B4,$80B5                                     ;84A71F;
    dw $0000

DrawInst_GreyDoorFacingUp_3:
    dw $0004,$84D5,$84D4,$80D4,$80D5                                     ;84A72B;
    dw $0000

DrawInst_GreyDoorFacingDown_0:
    dw $0004,$CCB3,$5CB2,$58B2,$58B3                                     ;84A737;
    dw $0000

DrawInst_GreyDoorFacingDown_1:
    dw $0004,$8CD3,$8CD2,$88D2,$88D3                                     ;84A743;
    dw $0000

DrawInst_GreyDoorFacingDown_2:
    dw $0004,$8CB5,$8CB4,$88B4,$88B5                                     ;84A74F;
    dw $0000

DrawInst_GreyDoorFacingDown_3:
    dw $0004,$8CD5,$0CD4,$08D4,$88D5                                     ;84A75B;
    dw $0000

DrawInst_YellowDoorFacingLeft_0:
    dw $8004,$C000,$D020,$D820,$D800                                     ;84A767;
    dw $0000

DrawInst_YellowDoorFacingLeft_1:
    dw $8004,$8001,$8021,$8821,$8801                                     ;84A773;
    dw $0000

DrawInst_YellowDoorFacingLeft_2:
    dw $8004,$8002,$8022,$8822,$8802                                     ;84A77F;
    dw $0000

DrawInst_YellowDoorFacingLeft_3:
    dw $8004,$8003,$0023,$0823,$8803                                     ;84A78B;
    dw $0000

DrawInst_YellowDoorFacingRight_0:
    dw $8004,$C400,$D420,$DC20,$DC00                                     ;84A797;
    dw $0000

DrawInst_YellowDoorFacingRight_1:
    dw $8004,$8401,$8421,$8C21,$8C01                                     ;84A7A3;
    dw $0000

DrawInst_YellowDoorFacingRight_2:
    dw $8004,$8402,$8422,$8C22,$8C02                                     ;84A7AF;
    dw $0000

DrawInst_YellowDoorFacingRight_3:
    dw $8004,$8403,$8423,$8C23,$8C03                                     ;84A7BB;
    dw $0000

DrawInst_YellowDoorFacingUp_0:
    dw $0004,$C411,$5410,$5010,$5011                                     ;84A7C7;
    dw $0000

DrawInst_YellowDoorFacingUp_1:
    dw $0004,$8431,$8430,$8030,$8031                                     ;84A7D3;
    dw $0000

DrawInst_YellowDoorFacingUp_2:
    dw $0004,$8413,$8412,$8012,$8013                                     ;84A7DF;
    dw $0000

DrawInst_YellowDoorFacingUp_3:
    dw $0004,$8433,$8432,$8032,$8033                                     ;84A7EB;
    dw $0000

DrawInst_YellowDoorFacingDown_0:
    dw $0004,$CC11,$5C10,$5810,$5811                                     ;84A7F7;
    dw $0000

DrawInst_YellowDoorFacingDown_1:
    dw $0004,$8C31,$8C30,$8830,$8831                                     ;84A803;
    dw $0000

DrawInst_YellowDoorFacingDown_2:
    dw $0004,$8C13,$8C12,$8812,$8813                                     ;84A80F;
    dw $0000

DrawInst_YellowDoorFacingDown_3:
    dw $0004,$8C33,$0C32,$0832,$8833                                     ;84A81B;
    dw $0000

DrawInst_GreenDoorFacingLeft_0:
    dw $8004,$C004,$D024,$D824,$D804                                     ;84A827;
    dw $0000

DrawInst_GreenDoorFacingLeft_1:
    dw $8004,$8005,$8025,$8825,$8805                                     ;84A833;
    dw $0000

DrawInst_GreenDoorFacingLeft_2:
    dw $8004,$8006,$8026,$8826,$8806                                     ;84A83F;
    dw $0000

DrawInst_GreenDoorFacingLeft_3:
    dw $8004,$8007,$0027,$0827,$8807                                     ;84A84B;
    dw $0000

DrawInst_GreenDoorFacingRight_0:
    dw $8004,$C404,$D424,$DC24,$DC04                                     ;84A857;
    dw $0000

DrawInst_GreenDoorFacingRight_1:
    dw $8004,$8405,$8425,$8C25,$8C05                                     ;84A863;
    dw $0000

DrawInst_GreenDoorFacingRight_2:
    dw $8004,$8406,$8426,$8C26,$8C06                                     ;84A86F;
    dw $0000

DrawInst_GreenDoorFacingRight_3:
    dw $8004,$8407,$0427,$0C27,$8C07                                     ;84A87B;
    dw $0000

DrawInst_GreenDoorFacingUp_0:
    dw $0004,$C415,$5414,$5014,$5015                                     ;84A887;
    dw $0000

DrawInst_GreenDoorFacingUp_1:
    dw $0004,$8435,$8434,$8034,$8035                                     ;84A893;
    dw $0000

DrawInst_GreenDoorFacingUp_2:
    dw $0004,$8417,$8416,$8016,$8017                                     ;84A89F;
    dw $0000

DrawInst_GreenDoorFacingUp_3:
    dw $0004,$8437,$8436,$8036,$8037                                     ;84A8AB;
    dw $0000

DrawInst_GreenDoorFacingDown_0:
    dw $0004,$CC15,$5C14,$5814,$5815                                     ;84A8B7;
    dw $0000

DrawInst_GreenDoorFacingDown_1:
    dw $0004,$8C35,$8C34,$8834,$8835                                     ;84A8C3;
    dw $0000

DrawInst_GreenDoorFacingDown_2:
    dw $0004,$8C17,$8C16,$8816,$8817                                     ;84A8CF;
    dw $0000

DrawInst_GreenDoorFacingDown_3:
    dw $0004,$8C37,$8C36,$8836,$8837                                     ;84A8DB;
    dw $0000

DrawInst_RedDoorFacingLeft_0:
    dw $8004,$C008,$D028,$D828,$D808                                     ;84A8E7;
    dw $0000

DrawInst_RedDoorFacingLeft_1:
    dw $8004,$8009,$8029,$8829,$8809                                     ;84A8F3;
    dw $0000

DrawInst_RedDoorFacingLeft_2:
    dw $8004,$800A,$802A,$882A,$880A                                     ;84A8FF;
    dw $0000

DrawInst_RedDoorFacingLeft_3:
    dw $8004,$800B,$002B,$082B,$880B                                     ;84A90B;
    dw $0000

DrawInst_RedDoorFacingRight_0:
    dw $8004,$C408,$D428,$DC28,$DC08                                     ;84A917;
    dw $0000

DrawInst_RedDoorFacingRight_1:
    dw $8004,$8409,$8429,$8C29,$8C09                                     ;84A923;
    dw $0000

DrawInst_RedDoorFacingRight_2:
    dw $8004,$840A,$842A,$8C2A,$8C0A                                     ;84A92F;
    dw $0000

DrawInst_RedDoorFacingRight_3:
    dw $8004,$840B,$042B,$0C2B,$8C0B                                     ;84A93B;
    dw $0000

DrawInst_RedDoorFacingUp_0:
    dw $0004,$C419,$5418,$5018,$5019                                     ;84A947;
    dw $0000

DrawInst_RedDoorFacingUp_1:
    dw $0004,$8439,$8438,$8038,$8039                                     ;84A953;
    dw $0000

DrawInst_RedDoorFacingUp_2:
    dw $0004,$841B,$841A,$801A,$801B                                     ;84A95F;
    dw $0000

DrawInst_RedDoorFacingUp_3:
    dw $0004,$843B,$843A,$803A,$803B                                     ;84A96B;
    dw $0000

DrawInst_RedDoorFacingDown_0:
    dw $0004,$CC19,$5C18,$5818,$5819                                     ;84A977;
    dw $0000

DrawInst_RedDoorFacingDown_1:
    dw $0004,$8C39,$8C38,$8838,$8839                                     ;84A983;
    dw $0000

DrawInst_RedDoorFacingDown_2:
    dw $0004,$8C1B,$8C1A,$881A,$881B                                     ;84A98F;
    dw $0000

DrawInst_RedDoorFacingDown_3:
    dw $0004,$8C3B,$8C3A,$883A,$883B                                     ;84A99B;
    dw $0000

DrawInst_EyeDoorEyeFacingLeft:
    dw $8004,$800C,$D02C,$D82C,$D80C                                     ;84A9A7;
    dw $0000

DrawInst_DoorFacingLeft_A9B3:
    dw $8004,$C00C,$D02C,$D82C,$D80C                                     ;84A9B3;
    dw $0000

DrawInst_BlueDoorFacingLeft_0:
    dw $8004,$800D,$802D,$882D,$880D                                     ;84A9BF;
    dw $0000

DrawInst_BlueDoorFacingLeft_1:
    dw $8004,$800E,$802E,$882E,$880E                                     ;84A9CB;
    dw $0000

DrawInst_BlueDoorFacingLeft_2:
    dw $8004,$800F,$002F,$082F,$880F                                     ;84A9D7;
    dw $0000

DrawInst_EyeDoorEyeFacingRight:
    dw $8004,$840C,$D42C,$DC2C,$DC0C                                     ;84A9E3;
    dw $0000

DrawInst_DoorFacingRight_A9EF:
    dw $8004,$C40C,$D42C,$DC2C,$DC0C                                     ;84A9EF;
    dw $0000

DrawInst_BlueDoorFacingRight_0:
    dw $8004,$840D,$842D,$8C2D,$8C0D                                     ;84A9FB;
    dw $0000

DrawInst_BlueDoorFacingRight_1:
    dw $8004,$840E,$842E,$8C2E,$8C0E                                     ;84AA07;
    dw $0000

DrawInst_BlueDoorFacingRight_2:
    dw $8004,$840F,$042F,$0C2F,$8C0F                                     ;84AA13;
    dw $0000

UNUSED_DrawInst_84AA1F:
    dw $0004,$841D,$541C,$501C,$501D                                     ;84AA1F;
    dw $0000

DrawInst_DoorFacingUp_AA2B:
    dw $0004,$C41D,$541C,$501C,$501D                                     ;84AA2B;
    dw $0000

DrawInst_BlueDoorFacingUp_0:
    dw $0004,$843D,$843C,$803C,$803D                                     ;84AA37;
    dw $0000

DrawInst_BlueDoorFacingUp_1:
    dw $0004,$841F,$841E,$801E,$801F                                     ;84AA43;
    dw $0000

DrawInst_BlueDoorFacingUp_2:
    dw $0004,$843F,$843E,$803E,$803F                                     ;84AA4F;
    dw $0000

UNUSED_DrawInst_84AA5B:
    dw $0004,$8C1D,$5C1C,$581C,$581D                                     ;84AA5B;
    dw $0000

DrawInst_DoorFacingDown_AA67:
    dw $0004,$CC1D,$5C1C,$581C,$581D                                     ;84AA67;
    dw $0000

DrawInst_BlueDoorFacingDown_0:
    dw $0004,$8C3D,$8C3C,$883C,$883D                                     ;84AA73;
    dw $0000

DrawInst_BlueDoorFacingDown_1:
    dw $0004,$8C1F,$8C1E,$881E,$881F                                     ;84AA7F;
    dw $0000

DrawInst_BlueDoorFacingDown_2:
    dw $0004,$8C3F,$8C3E,$883E,$883F                                     ;84AA8B;
    dw $0000

DrawInst_ElevatorPlatform_0:
    dw $0001,$8085                                                       ;84AA97;
    db $03,$00                                                           ;84AA9B;
    dw $0001,$8485                                                       ;84AA9D;
    db $00,$01                                                           ;84AAA1;
    dw $0004,$8088,$8089,$8489,$8488                                     ;84AAA3;
    dw $0000

DrawInst_ElevatorPlatform_1:
    dw $0001,$8086                                                       ;84AAAF;
    db $03,$00                                                           ;84AAB3;
    dw $0001,$8486                                                       ;84AAB5;
    db $00,$01                                                           ;84AAB9;
    dw $0004,$808A,$808B,$848B,$848A                                     ;84AABB;
    dw $0000

DrawInst_ElevatorPlatform_2:
    dw $0001,$8087                                                       ;84AAC7;
    db $03,$00                                                           ;84AACB;
    dw $0001,$8487                                                       ;84AACD;
    db $00,$01                                                           ;84AAD1;
    dw $0004,$808C,$808D,$848D,$848C                                     ;84AAD3;
    dw $0000


UNUSED_InstList_PLM_DrawEmptyTile_84AADF:
    dw $0001,DrawInst_ItemChozoOrb                                       ;84AADF;

InstList_PLM_Delete:
    dw Instruction_PLM_Delete                                            ;84AAE3;

InstList_PLM_CrumbleAccessToTourianElevator_0:
    dw Instruction_PLM_TimerEqualsY_8Bit : db $06                        ;84AAE5;

InstList_PLM_CrumbleAccessToTourianElevator_1:
    dw $0004,DrawInst_CrumbleAccessToTourianElevator_1                   ;84AAE8;
    dw $0004,DrawInst_CrumbleAccessToTourianElevator_2                   ;84AAEC;
    dw $0004,DrawInst_CrumbleAccessToTourianElevator_3                   ;84AAF0;
    dw $0004,DrawInst_CrumbleAccessToTourianElevator_0                   ;84AAF4;
    dw Instruction_PLM_MovePLMDown1Block_84AB00                          ;84AAF8;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84AAFA;
    dw InstList_PLM_CrumbleAccessToTourianElevator_1                     ;84AAFC;
    dw Instruction_PLM_Delete                                            ;84AAFE;

Instruction_PLM_MovePLMDown1Block_84AB00:
    LDA.W $07A5                                                          ;84AB00;
    ASL A                                                                ;84AB03;
    CLC                                                                  ;84AB04;
    ADC.W $1C87,X                                                        ;84AB05;
    STA.W $1C87,X                                                        ;84AB08;
    RTS                                                                  ;84AB0B;


InstList_PLM_ClearAccessToTourianElevator:
    dw $0001,DrawInst_ClearAccessToTourianElevator                       ;84AB0C;
    dw Instruction_PLM_Delete                                            ;84AB10;

InstList_PLM_CrumbleSporeSpawnCeiling:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $0A                   ;84AB12;
    dw $0004,DrawInst_CrumbleSporeSpawnCeiling_0                         ;84AB15;
    dw $0004,DrawInst_CrumbleSporeSpawnCeiling_1                         ;84AB19;
    dw $0004,DrawInst_CrumbleSporeSpawnCeiling_2                         ;84AB1D;

InstList_PLM_ClearSporeSpawnCeiling:
    dw $0004,DrawInst_ClearSporeSpawnCeiling                             ;84AB21;
    dw Instruction_PLM_Delete                                            ;84AB25;


RTS_84AB27:
    RTS                                                                  ;84AB27;

Setup_CrumbleBotwoonWall_Wait40Frames:
    TYX                                                                  ;84AB28;
    LDA.W #$0040                                                         ;84AB29;
    STA.L $7EDE1C,X                                                      ;84AB2C;
    RTS                                                                  ;84AB30;


InstList_PLM_CrumbleBotwoonWall_0:
    dw Instruction_PLM_TimerEqualsY_8Bit : db $09                        ;84AB31;
    dw Instruction_PLM_Scroll_0_1_Blue                                   ;84AB34;

InstList_PLM_CrumbleBotwoonWall_1:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $0A                   ;84AB36;
    dw $0004,DrawInst_Respawn1x1_0                                       ;84AB39;
    dw $0004,DrawInst_Respawn1x1_1                                       ;84AB3D;
    dw $0004,DrawInst_Respawn1x1_2                                       ;84AB41;
    dw $0004,DrawInst_Respawn1x1_3                                       ;84AB45;
    dw Instruction_PLM_MovePLMDown1Block                                 ;84AB49;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84AB4B;
    dw InstList_PLM_CrumbleBotwoonWall_1                                 ;84AB4D;
    dw Instruction_PLM_Delete                                            ;84AB4F;


Instruction_PLM_Scroll_0_1_Blue:
    LDA.W #$0101                                                         ;84AB51;
    STA.L $7ECD20                                                        ;84AB54;
    RTS                                                                  ;84AB58;

Instruction_PLM_MovePLMDown1Block:
    LDA.W $1C87,X                                                        ;84AB59;
    CLC                                                                  ;84AB5C;
    ADC.W $07A5                                                          ;84AB5D;
    ADC.W $07A5                                                          ;84AB60;
    STA.W $1C87,X                                                        ;84AB63;
    RTS                                                                  ;84AB66;


InstList_PLM_ClearBotwoonWall:
    dw $0001,DrawInst_ClearBotwoonWall                                   ;84AB67;
    dw Instruction_PLM_Delete                                            ;84AB6B;

InstList_PLM_CrumbleKraidCeilingBlockIntoBackground1:
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_Elevatube   ;84AB6D;
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_0           ;84AB71;
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_1           ;84AB75;

InstList_PLM_SetKraidCeilingBlockToBackground1:
    dw $0003,UNUSED_DrawInst_SetKraidCeilingBlockToBackground1_849379    ;84AB79;
    dw Instruction_PLM_Delete                                            ;84AB7D;

InstList_PLM_CrumbleKraidCeilingBlockIntoBackground2:
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_Elevatube   ;84AB7F;
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_0           ;84AB83;
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_1           ;84AB87;

InstList_PLM_SetKraidCeilingBlockToBackground2:
    dw $0003,DrawInst_SetKraidCeilingBlockToBackground2                  ;84AB8B;
    dw Instruction_PLM_Delete                                            ;84AB8F;

InstList_PLM_CrumbleKraidCeilingBlockIntoBackground3:
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_Elevatube   ;84AB91;
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_0           ;84AB95;
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_1           ;84AB99;

InstList_PLM_SetKraidCeilingBlockToBackground3:
    dw $0003,DrawInst_SetKraidCeilingBlockToBackground3                  ;84AB9D;
    dw Instruction_PLM_Delete                                            ;84ABA1;

InstList_PLM_ClearKraidCeiling:
    dw $0001,DrawInst_ClearKraidCeiling                                  ;84ABA3;
    dw Instruction_PLM_Delete                                            ;84ABA7;

InstList_PLM_CrumbleKraidSpikeBlocks_0:
    dw Instruction_PLM_TimerEqualsY_8Bit : db $0B                        ;84ABA9;

InstList_PLM_CrumbleKraidSpikeBlocks_1:
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_Elevatube   ;84ABAC;
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_0           ;84ABB0;
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_1           ;84ABB4;
    dw $0003,DrawInst_CrumbleKraidSpikeBlocks_0                          ;84ABB8;
    dw Instruction_PLM_MovePLMRight1Block                                ;84ABBC;
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_Elevatube   ;84ABBE;
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_0           ;84ABC2;
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_1           ;84ABC6;
    dw $0003,DrawInst_CrumbleKraidSpikeBlocks_1                          ;84ABCA;
    dw Instruction_PLM_MovePLMRight1Block                                ;84ABCE;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84ABD0;
    dw InstList_PLM_CrumbleKraidSpikeBlocks_1                            ;84ABD2;
    dw Instruction_PLM_Delete                                            ;84ABD4;


Instruction_PLM_MovePLMRight1Block:
    INC.W $1C87,X                                                        ;84ABD6;
    INC.W $1C87,X                                                        ;84ABD9;
    RTS                                                                  ;84ABDC;


InstList_PLM_ClearKraidSpikeBlocks:
    dw $0001,DrawInst_ClearKraidSpikeBlocks                              ;84ABDD;
    dw Instruction_PLM_Delete                                            ;84ABE1;

UNUSED_InstList_PLM_84ABE3:
    dw $0001,UNUSED_DrawInst_849453                                      ;84ABE3;
    dw Instruction_PLM_Delete                                            ;84ABE7;

UNUSED_InstList_PLM_84ABE9:
    dw $0001,UNUSED_DrawInst_849463                                      ;84ABE9;
    dw Instruction_PLM_Delete                                            ;84ABED;

UNUSED_InstList_PLM_84ABEF_0:
    dw $0018,DrawInst_EscapeRoom1Gate_0                                  ;84ABEF;

UNUSED_InstList_PLM_84ABF3_1:
    dw $0001,DrawInst_EscapeRoom1Gate_2                                  ;84ABF3;
    dw Instruction_PLM_Delete                                            ;84ABF7;

UNUSED_InstList_PLM_84ABF9:
    dw $0001,UNUSED_DrawInst_849497                                      ;84ABF9;
    dw Instruction_PLM_Delete                                            ;84ABFD;

UNUSED_PLM_InstList_84ABFF:
    dw $0001,UNUSED_DrawInst_84949D                                      ;84ABFF;
    dw Instruction_PLM_Delete                                            ;84AC03;

InstList_PLM_FillMotherBrainsWall:
    dw $0001,DrawInst_FillMotherBrainsWall                               ;84AC05;
    dw Instruction_PLM_Delete                                            ;84AC09;

InstList_PLM_MotherBrainsRoomEscapeDoor:
    dw $0001,DrawInst_MotherBrainsRoomEscapeDoor                         ;84AC0B;
    dw Instruction_PLM_Delete                                            ;84AC0F;

InstList_PLM_MotherBrainsBackgroundRow2:
    dw $0001,DrawInst_MotherBrainsBackgroundRow2                         ;84AC11;
    dw Instruction_PLM_Delete                                            ;84AC15;

InstList_PLM_MotherBrainsBackgroundRow3:
    dw $0001,DrawInst_MotherBrainsBackgroundRow3                         ;84AC17;
    dw Instruction_PLM_Delete                                            ;84AC1B;

InstList_PLM_MotherBrainsBackgroundRow4:
    dw $0001,DrawInst_MotherBrainsBackgroundRow4                         ;84AC1D;
    dw Instruction_PLM_Delete                                            ;84AC21;

InstList_PLM_MotherBrainsBackgroundRow5:
    dw $0001,DrawInst_MotherBrainsBackgroundRow5                         ;84AC23;
    dw Instruction_PLM_Delete                                            ;84AC27;

InstList_PLM_MotherBrainsBackgroundRow6:
    dw $0001,DrawInst_MotherBrainsBackgroundRow6                         ;84AC29;
    dw Instruction_PLM_Delete                                            ;84AC2D;

InstList_PLM_MotherBrainsBackgroundRow7:
    dw $0001,DrawInst_MotherBrainsBackgroundRow7                         ;84AC2F;
    dw Instruction_PLM_Delete                                            ;84AC33;

InstList_PLM_MotherBrainsBackgroundRow8:
    dw $0001,DrawInst_MotherBrainsBackgroundRow8                         ;84AC35;
    dw Instruction_PLM_Delete                                            ;84AC39;

InstList_PLM_MotherBrainsBackgroundRow9:
    dw $0001,DrawInst_MotherBrainsBackgroundRow9                         ;84AC3B;
    dw Instruction_PLM_Delete                                            ;84AC3F;

InstList_PLM_MotherBrainsBackgroundRowA:
    dw $0001,DrawInst_MotherBrainsBackgroundRowA                         ;84AC41;
    dw Instruction_PLM_Delete                                            ;84AC45;

InstList_PLM_MotherBrainsBackgroundRowB:
    dw $0001,DrawInst_MotherBrainsBackgroundRowB                         ;84AC47;
    dw Instruction_PLM_Delete                                            ;84AC4B;

InstList_PLM_MotherBrainsBackgroundRowC:
    dw $0001,DrawInst_MotherBrainsBackgroundRowC                         ;84AC4D;
    dw Instruction_PLM_Delete                                            ;84AC51;

InstList_PLM_MotherBrainsBackgroundRowD:
    dw $0001,DrawInst_MotherBrainsBackgroundRowD                         ;84AC53;
    dw Instruction_PLM_Delete                                            ;84AC57;

UNUSED_InstList_PLM_84AC59:
    dw $0001,UNUSED_DrawInst_94966D                                      ;84AC59;
    dw Instruction_PLM_Delete                                            ;84AC5D;

UNUSED_InstList_PLM_84AC5F:
    dw $0001,UNUSED_DrawInst_94968B                                      ;84AC5F;
    dw Instruction_PLM_Delete                                            ;84AC63;

InstList_PLM_ClearCeilingBlockInMotherBrainsRoom:
    dw $0001,DrawInst_ClearCeilingBlockInMotherBrainsRoom                ;84AC65;
    dw Instruction_PLM_Delete                                            ;84AC69;

InstList_PLM_ClearCeilingTubeInMotherBrainsRoom:
    dw $0001,DrawInst_ClearCeilingTubeInMotherBrainsRoom                 ;84AC6B;
    dw Instruction_PLM_Delete                                            ;84AC6F;

InstList_PLM_ClearMotherBrainsBottomMiddleSideTube:
    dw $0001,DrawInst_ClearMotherBrainsBottomMiddleSideTube              ;84AC71;
    dw Instruction_PLM_Delete                                            ;84AC75;

InstList_PLM_ClearMotherBrainsBottomMiddleTubes:
    dw $0001,DrawInst_ClearMotherBrainsBottomMiddleTubes                 ;84AC77;
    dw Instruction_PLM_Delete                                            ;84AC7B;

InstList_PLM_ClearMotherBrainsBottomLeftTube:
    dw $0001,DrawInst_ClearMotherBrainsBottomLeftTube                    ;84AC7D;
    dw Instruction_PLM_Delete                                            ;84AC81;

InstList_PLM_ClearMotherBrainsBottomRightTube:
    dw $0001,DrawInst_ClearMotherBrainsBottomRightTube                   ;84AC83;
    dw Instruction_PLM_Delete                                            ;84AC87;

PreInst_PLM_PositionSamus_GiveAtLeast10FramesOfInvincibility:
    LDA.W $1E17,X                                                        ;84AC89;
    STA.W $0AF6                                                          ;84AC8C;
    LDA.L $7EDF0C,X                                                      ;84AC8F;
    STA.W $0AFA                                                          ;84AC93;
    LDA.W #$0010                                                         ;84AC96;
    TSB.W $18A8                                                          ;84AC99;
    RTS                                                                  ;84AC9C;


Instruction_PLM_Deal2DamageToSamus:
    LDA.W $0A4E                                                          ;84AC9D;
    CLC                                                                  ;84ACA0;
    ADC.W #$0000                                                         ;84ACA1;
    STA.W $0A4E                                                          ;84ACA4;
    LDA.W $0A50                                                          ;84ACA7;
    ADC.W #$0002                                                         ;84ACAA;
    STA.W $0A50                                                          ;84ACAD;
    RTS                                                                  ;84ACB0;


Instruction_PLM_GiveSamus30FramesOfInvincibility:
    LDA.W #$0030                                                         ;84ACB1;
    STA.W $18A8                                                          ;84ACB4;
    RTS                                                                  ;84ACB7;


InstList_PLM_BrinstarFloorPlant_0:
    dw Instruction_PLM_PreInstruction_inY                                ;84ACB8;
    dw PreInst_PLM_PositionSamus_GiveAtLeast10FramesOfInvincibility      ;84ACBA;
    dw Instruction_PLM_TimerEqualsY_8Bit : db $04                        ;84ACBC;

InstList_PLM_BrinstarFloorPlant_1:
    dw $0005,DrawInst_BrinstarFloorPlant_2                               ;84ACBF;
    dw $0005,DrawInst_BrinstarFloorPlant_1                               ;84ACC3;
    dw $0005,DrawInst_BrinstarFloorPlant_2                               ;84ACC7;
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $31                   ;84ACCB;
    dw Instruction_PLM_Deal2DamageToSamus                                ;84ACCE;
    dw $0005,DrawInst_BrinstarFloorPlant_3                               ;84ACD0;
    dw $0005,DrawInst_BrinstarFloorPlant_2                               ;84ACD4;
    dw $0005,DrawInst_BrinstarFloorPlant_1                               ;84ACD8;
    dw $0005,DrawInst_BrinstarFloorPlant_2                               ;84ACDC;
    dw Instruction_PLM_Deal2DamageToSamus                                ;84ACE0;
    dw $0005,DrawInst_BrinstarFloorPlant_3                               ;84ACE2;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84ACE6;
    dw InstList_PLM_BrinstarFloorPlant_1                                 ;84ACE8;
    dw Instruction_PLM_GiveSamus30FramesOfInvincibility                  ;84ACEA;
    dw Instruction_PLM_ClearPreInstruction                               ;84ACEC;
    dw $0060,DrawInst_BrinstarFloorPlant_3                               ;84ACEE;
    dw $0001,DrawInst_BrinstarFloorPlant_0                               ;84ACF2;
    dw Instruction_PLM_Delete                                            ;84ACF6;

InstList_PLM_BrinstarCeilingPlant_0:
    dw Instruction_PLM_PreInstruction_inY                                ;84ACF8;
    dw PreInst_PLM_PositionSamus_GiveAtLeast10FramesOfInvincibility      ;84ACFA;
    dw Instruction_PLM_TimerEqualsY_8Bit : db $08                        ;84ACFC;

InstList_PLM_BrinstarCeilingPlant_1:
    dw $0005,DrawInst_BrinstarCeilingPlant_2                             ;84ACFF;
    dw $0005,DrawInst_BrinstarCeilingPlant_1                             ;84AD03;
    dw $0005,DrawInst_BrinstarCeilingPlant_2                             ;84AD07;
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $31                   ;84AD0B;
    dw Instruction_PLM_Deal2DamageToSamus                                ;84AD0E;
    dw $0005,DrawInst_BrinstarCeilingPlant_3                             ;84AD10;
    dw $0005,DrawInst_BrinstarCeilingPlant_2                             ;84AD14;
    dw $0005,DrawInst_BrinstarCeilingPlant_1                             ;84AD18;
    dw $0005,DrawInst_BrinstarCeilingPlant_2                             ;84AD1C;
    dw Instruction_PLM_Deal2DamageToSamus                                ;84AD20;
    dw $0005,DrawInst_BrinstarCeilingPlant_3                             ;84AD22;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84AD26;
    dw InstList_PLM_BrinstarCeilingPlant_1                               ;84AD28;
    dw Instruction_PLM_GiveSamus30FramesOfInvincibility                  ;84AD2A;
    dw Instruction_PLM_ClearPreInstruction                               ;84AD2C;
    dw $0060,DrawInst_BrinstarCeilingPlant_3                             ;84AD2E;
    dw $0001,DrawInst_BrinstarCeilingPlant_0                             ;84AD32;
    dw Instruction_PLM_Delete                                            ;84AD36;

InstList_PLM_WreckedShipEntranceTreadmillFromWest_0:
    dw Instruction_PLM_GotoY_ifBossBitsSet : db $01                      ;84AD38;
    dw InstList_PLM_WreckedShipEntranceTreadmillFromWest_1               ;84AD3B;
    dw Instruction_PLM_Delete                                            ;84AD3D;

InstList_PLM_WreckedShipEntranceTreadmillFromWest_1:
    dw Instruction_PLM_Draw38TilesOfBlankRightwardsTreadmill             ;84AD3F;
    dw Instruction_PLM_Delete                                            ;84AD41;

Instruction_PLM_Draw38TilesOfBlankRightwardsTreadmill:
    JSR.W Write_Row_of_Level_Data_Block_and_BTS                          ;84AD43;
    dw $30FF,$0008,$0038                                                 ;84AD46;
    RTS                                                                  ;84AD4C;


InstList_PLM_WreckedShipEntranceTreadmillFromEast_0:
    dw Instruction_PLM_GotoY_ifBossBitsSet : db $01                      ;84AD4D;
    dw InstList_PLM_WreckedShipEntranceTreadmillFromEast_1               ;84AD50;
    dw Instruction_PLM_Delete                                            ;84AD52;

InstList_PLM_WreckedShipEntranceTreadmillFromEast_1:
    dw Instruction_PLM_Draw38TilesOfBlankLeftwardsTreadmill              ;84AD54;
    dw Instruction_PLM_Delete                                            ;84AD56;

Instruction_PLM_Draw38TilesOfBlankLeftwardsTreadmill:
    JSR.W Write_Row_of_Level_Data_Block_and_BTS                          ;84AD58;
    dw $30FF,$0009,$0038                                                 ;84AD5B;
    RTS                                                                  ;84AD61;


InstList_PLM_MapStation_0:
    dw Instruction_PLM_LinkInstruction_Y                                 ;84AD62;
    dw InstList_PLM_MapStation_2                                         ;84AD64;

InstList_PLM_MapStation_1:
    dw $0006,DrawInst_MapStation_0                                       ;84AD66;
    dw $0006,DrawInst_MapStation_1                                       ;84AD6A;
    dw $0006,DrawInst_MapStation_2                                       ;84AD6E;
    dw Instruction_PLM_GotoY                                             ;84AD72;
    dw InstList_PLM_MapStation_1                                         ;84AD74;

InstList_PLM_MapStation_2:
    dw $0002,DrawInst_MapStation_0                                       ;84AD76;
    dw $0002,DrawInst_MapStation_1                                       ;84AD7A;
    dw $0002,DrawInst_MapStation_2                                       ;84AD7E;
    dw Instruction_PLM_GotoY                                             ;84AD82;
    dw InstList_PLM_MapStation_2                                         ;84AD84;

InstList_PLM_MapStationRightAccess:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $37                   ;84AD86;
    dw $0006,DrawInst_MapStationRightAccess_0                            ;84AD89;
    dw $0060,DrawInst_MapStationRightAccess_1                            ;84AD8D;
    dw Instruction_PLM_Activate_MapStation                               ;84AD91;
    dw $0006,DrawInst_MapStationRightAccess_1                            ;84AD93;
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $38                   ;84AD97;
    dw $0006,DrawInst_MapStationRightAccess_1                            ;84AD9A;
    dw $0006,DrawInst_MapStationRightAccess_0                            ;84AD9E;
    dw Instruction_PLM_Delete                                            ;84ADA2;

InstList_PLM_MapStationLeftAccess:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $37                   ;84ADA4;
    dw $0006,DrawInst_MapStationLeftAccess_0                             ;84ADA7;
    dw $0060,DrawInst_MapStationLeftAccess_1                             ;84ADAB;
    dw Instruction_PLM_Activate_MapStation                               ;84ADAF;
    dw $0006,DrawInst_MapStationLeftAccess_1                             ;84ADB1;
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $38                   ;84ADB5;
    dw $0006,DrawInst_MapStationLeftAccess_1                             ;84ADB8;
    dw $0006,DrawInst_MapStationLeftAccess_0                             ;84ADBC;
    dw Instruction_PLM_Delete                                            ;84ADC0;

InstList_PLM_EnergyStation_0:
    dw Instruction_PLM_LinkInstruction_Y                                 ;84ADC2;
    dw InstList_PLM_EnergyStation_2                                      ;84ADC4;

InstList_PLM_EnergyStation_1:
    dw $0006,DrawInst_EnergyStation_0                                    ;84ADC6;
    dw $0006,DrawInst_EnergyStation_1                                    ;84ADCA;
    dw $0006,DrawInst_EnergyStation_2                                    ;84ADCE;
    dw Instruction_PLM_GotoY                                             ;84ADD2;
    dw InstList_PLM_EnergyStation_1                                      ;84ADD4;

InstList_PLM_EnergyStation_2:
    dw Instruction_PLM_GotoY_EnableMovementIfSamusEnergyIsFull           ;84ADD6;
    dw InstList_PLM_EnergyStation_4                                      ;84ADD8;
    dw Instruction_PLM_TimerEqualsY_8Bit : db $10                        ;84ADDA;

InstList_PLM_EnergyStation_3:
    dw $0002,DrawInst_EnergyStation_0                                    ;84ADDD;
    dw $0002,DrawInst_EnergyStation_1                                    ;84ADE1;
    dw $0002,DrawInst_EnergyStation_2                                    ;84ADE5;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84ADE9;
    dw InstList_PLM_EnergyStation_3                                      ;84ADEB;

InstList_PLM_EnergyStation_4:
    dw Instruction_PLM_GotoY                                             ;84ADED;
    dw InstList_PLM_EnergyStation_0                                      ;84ADEF;

InstList_PLM_EnergyStationRightAccess_0:
    dw Instruction_PLM_GotoY_EnableMovementIfSamusEnergyIsFull           ;84ADF1;
    dw InstList_PLM_EnergyStationRightAccess_1                           ;84ADF3;
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $37                   ;84ADF5;
    dw $0006,DrawInst_EnergyMissileStationRightAccess_0                  ;84ADF8;
    dw $0060,DrawInst_EnergyMissileStationRightAccess_1                  ;84ADFC;
    dw Instruction_PLM_Activate_EnergyStation                            ;84AE00;
    dw $0006,DrawInst_EnergyMissileStationRightAccess_1                  ;84AE02;
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $38                   ;84AE06;
    dw $0006,DrawInst_EnergyMissileStationRightAccess_1                  ;84AE09;
    dw $0006,DrawInst_EnergyMissileStationRightAccess_0                  ;84AE0D;

InstList_PLM_EnergyStationRightAccess_1:
    dw Instruction_PLM_Delete                                            ;84AE11;

InstList_PLM_EnergyStationLeftAccess_0:
    dw Instruction_PLM_GotoY_EnableMovementIfSamusEnergyIsFull           ;84AE13;
    dw InstList_PLM_EnergyStationLeftAccess_1                            ;84AE15;
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $37                   ;84AE17;
    dw $0006,DrawInst_EnergyMissileStationLeftAccess_0                   ;84AE1A;
    dw $0060,DrawInst_EnergyMissileStationLeftAccess_1                   ;84AE1E;
    dw Instruction_PLM_Activate_EnergyStation                            ;84AE22;
    dw $0006,DrawInst_EnergyMissileStationLeftAccess_1                   ;84AE24;
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $38                   ;84AE28;
    dw $0006,DrawInst_EnergyMissileStationLeftAccess_1                   ;84AE2B;
    dw $0006,DrawInst_EnergyMissileStationLeftAccess_0                   ;84AE2F;

InstList_PLM_EnergyStationLeftAccess_1:
    dw Instruction_PLM_Delete                                            ;84AE33;

Instruction_PLM_GotoY_EnableMovementIfSamusEnergyIsFull:
    LDA.W $09C4                                                          ;84AE35;
    CMP.W $09C2                                                          ;84AE38;
    BEQ .fullEnergy                                                      ;84AE3B;
    INY                                                                  ;84AE3D;
    INY                                                                  ;84AE3E;
    RTS                                                                  ;84AE3F;


.fullEnergy:
    LDA.W #$0001                                                         ;84AE40;
    JSL.L Run_Samus_Command                                              ;84AE43;
    LDA.W $0000,Y                                                        ;84AE47;
    TAY                                                                  ;84AE4A;
    RTS                                                                  ;84AE4B;


InstList_PLM_MissileStation_0:
    dw Instruction_PLM_LinkInstruction_Y                                 ;84AE4C;
    dw InstList_PLM_MissileStation_2                                     ;84AE4E;

InstList_PLM_MissileStation_1:
    dw $0006,DrawInst_MissileStation_0                                   ;84AE50;
    dw $0006,DrawInst_MissileStation_1                                   ;84AE54;
    dw $0006,DrawInst_MissileStation_2                                   ;84AE58;
    dw Instruction_PLM_GotoY                                             ;84AE5C;
    dw InstList_PLM_MissileStation_1                                     ;84AE5E;

InstList_PLM_MissileStation_2:
    dw Instruction_PLM_GotoY_EnableMovementIfSamusMissilesAreFull        ;84AE60;
    dw InstList_PLM_MissileStation_4                                     ;84AE62;
    dw Instruction_PLM_TimerEqualsY_8Bit : db $10                        ;84AE64;

InstList_PLM_MissileStation_3:
    dw $0003,DrawInst_MissileStation_0                                   ;84AE67;
    dw $0003,DrawInst_MissileStation_1                                   ;84AE6B;
    dw $0003,DrawInst_MissileStation_2                                   ;84AE6F;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84AE73;
    dw InstList_PLM_MissileStation_3                                     ;84AE75;

InstList_PLM_MissileStation_4:
    dw Instruction_PLM_GotoY                                             ;84AE77;
    dw InstList_PLM_MissileStation_0                                     ;84AE79;

InstList_PLM_MissileStationRightAccess_0:
    dw Instruction_PLM_GotoY_EnableMovementIfSamusMissilesAreFull        ;84AE7B;
    dw InstList_PLM_MissileStationRightAccess_1                          ;84AE7D;
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $37                   ;84AE7F;
    dw $0006,DrawInst_EnergyMissileStationRightAccess_0                  ;84AE82;
    dw $0060,DrawInst_EnergyMissileStationRightAccess_1                  ;84AE86;
    dw Instruction_PLM_Activate_MissileStation                           ;84AE8A;
    dw $0006,DrawInst_EnergyMissileStationRightAccess_1                  ;84AE8C;
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $38                   ;84AE90;
    dw $0006,DrawInst_EnergyMissileStationRightAccess_1                  ;84AE93;
    dw $0006,DrawInst_EnergyMissileStationRightAccess_0                  ;84AE97;

InstList_PLM_MissileStationRightAccess_1:
    dw Instruction_PLM_Delete                                            ;84AE9B;

InstList_PLM_MissileStationLeftAccess_0:
    dw Instruction_PLM_GotoY_EnableMovementIfSamusMissilesAreFull        ;84AE9D;
    dw InstList_PLM_MissileStationLeftAccess_1                           ;84AE9F;
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $37                   ;84AEA1;
    dw $0006,DrawInst_EnergyMissileStationLeftAccess_0                   ;84AEA4;
    dw $0060,DrawInst_EnergyMissileStationLeftAccess_1                   ;84AEA8;
    dw Instruction_PLM_Activate_MissileStation                           ;84AEAC;
    dw $0006,DrawInst_EnergyMissileStationLeftAccess_1                   ;84AEAE;
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $38                   ;84AEB2;
    dw $0006,DrawInst_EnergyMissileStationLeftAccess_1                   ;84AEB5;
    dw $0006,DrawInst_EnergyMissileStationLeftAccess_0                   ;84AEB9;

InstList_PLM_MissileStationLeftAccess_1:
    dw Instruction_PLM_Delete                                            ;84AEBD;

Instruction_PLM_GotoY_EnableMovementIfSamusMissilesAreFull:
    LDA.W $09C8                                                          ;84AEBF;
    CMP.W $09C6                                                          ;84AEC2;
    BEQ .missilesFull                                                    ;84AEC5;
    INY                                                                  ;84AEC7;
    INY                                                                  ;84AEC8;
    RTS                                                                  ;84AEC9;


.missilesFull:
    LDA.W #$0001                                                         ;84AECA;
    JSL.L Run_Samus_Command                                              ;84AECD;
    LDA.W $0000,Y                                                        ;84AED1;
    TAY                                                                  ;84AED4;
    RTS                                                                  ;84AED5;


InstList_PLM_Nothing_84AED6:
    dw Instruction_PLM_Delete                                            ;84AED6;

InstList_PLM_Nothing_84AED8:
    dw $0010,UNUSED_DrawInst_84A255                                      ;84AED8;
    dw $0010,UNUSED_DrawInst_84A25D                                      ;84AEDC;
    dw $0010,UNUSED_DrawInst_84A265                                      ;84AEE0;
    dw $0010,UNUSED_DrawInst_84A26D                                      ;84AEE4;
    dw $0012,UNUSED_DrawInst_84A255                                      ;84AEE8;
    dw $0012,UNUSED_DrawInst_84A25D                                      ;84AEEC;
    dw $0012,UNUSED_DrawInst_84A265                                      ;84AEF0;
    dw $0012,UNUSED_DrawInst_84A26D                                      ;84AEF4;
    dw $0014,UNUSED_DrawInst_84A255                                      ;84AEF8;
    dw $0014,UNUSED_DrawInst_84A25D                                      ;84AEFC;
    dw $0014,UNUSED_DrawInst_84A265                                      ;84AF00;
    dw $0014,UNUSED_DrawInst_84A26D                                      ;84AF04;
    dw $0012,UNUSED_DrawInst_84A255                                      ;84AF08;
    dw $0012,UNUSED_DrawInst_84A25D                                      ;84AF0C;
    dw $0012,UNUSED_DrawInst_84A265                                      ;84AF10;
    dw $0012,UNUSED_DrawInst_84A26D                                      ;84AF14;
    dw Instruction_PLM_GotoY                                             ;84AF18;
    dw InstList_PLM_Nothing_84AED8                                       ;84AF1A;

InstList_PLM_Nothing_84AF1C:
    dw Instruction_PLM_Delete                                            ;84AF1C;

InstList_PLM_Nothing_84AF1E:
    dw $0010,UNUSED_DrawInst_84A275                                      ;84AF1E;
    dw $0010,UNUSED_DrawInst_84A285                                      ;84AF22;
    dw $0010,UNUSED_DrawInst_84A295                                      ;84AF26;
    dw $0010,UNUSED_DrawInst_84A2A5                                      ;84AF2A;
    dw $0012,UNUSED_DrawInst_84A275                                      ;84AF2E;
    dw $0012,UNUSED_DrawInst_84A285                                      ;84AF32;
    dw $0012,UNUSED_DrawInst_84A295                                      ;84AF36;
    dw $0012,UNUSED_DrawInst_84A2A5                                      ;84AF3A;
    dw $0014,UNUSED_DrawInst_84A275                                      ;84AF3E;
    dw $0014,UNUSED_DrawInst_84A285                                      ;84AF42;
    dw $0014,UNUSED_DrawInst_84A295                                      ;84AF46;
    dw $0014,UNUSED_DrawInst_84A2A5                                      ;84AF4A;
    dw $0012,UNUSED_DrawInst_84A275                                      ;84AF4E;
    dw $0012,UNUSED_DrawInst_84A285                                      ;84AF52;
    dw $0012,UNUSED_DrawInst_84A295                                      ;84AF56;
    dw $0012,UNUSED_DrawInst_84A2A5                                      ;84AF5A;
    dw Instruction_PLM_GotoY                                             ;84AF5E;
    dw InstList_PLM_Nothing_84AF1E                                       ;84AF60;

DrawInst_Debug_ScrollPLM:
    dw $0001,$3074                                                       ;84AF62;
    dw $0000

UNUSED_DrawInst_Debug_SolidScrollPLM_84AF68:
    dw $0001,$B074                                                       ;84AF68;
    dw $0000

DrawInst_Debug_LeftwardsExtension:
    dw $0001,$5011                                                       ;84AF6E;
    dw $0000

DrawInst_Debug_RightwardsExtension:
    dw $0001,$5411                                                       ;84AF74;
    dw $0000

DrawInst_Debug_UpwardsExtension:
    dw $0001,$D800                                                       ;84AF7A;
    dw $0000

DrawInst_Debug_DownwardsExtension:
    dw $0001,$D000                                                       ;84AF80;
    dw $0000

InstList_PLM_ScrollPLM_0:
    dw $0001,DrawInst_Debug_ScrollPLM                                    ;84AF86;

InstList_PLM_ScrollPLM_1:
    dw Instruction_PLM_Sleep                                             ;84AF8A;
    dw Instruction_PLM_ProcessAirScrollUpdate                            ;84AF8C;
    dw Instruction_PLM_GotoY                                             ;84AF8E;
    dw InstList_PLM_ScrollPLM_1                                          ;84AF90;

InstList_PLM_SolidScrollPLM_0:
    dw $0001,UNUSED_DrawInst_Debug_SolidScrollPLM_84AF68                 ;84AF92;

InstList_PLM_SolidScrollPLM_1:
    dw Instruction_PLM_Sleep                                             ;84AF96;
    dw Instruction_PLM_ProcessSolidScrollUpdate                          ;84AF98;
    dw Instruction_PLM_GotoY                                             ;84AF9A;
    dw InstList_PLM_SolidScrollPLM_1                                     ;84AF9C;

InstList_PLM_Debug_LeftwardsExtension:
    dw $0001,DrawInst_Debug_LeftwardsExtension                           ;84AF9E;
    dw Instruction_PLM_Delete                                            ;84AFA2;

InstList_PLM_Debug_RightwardsExtension:
    dw $0001,DrawInst_Debug_RightwardsExtension                          ;84AFA4;
    dw Instruction_PLM_Delete                                            ;84AFA8;

InstList_PLM_Debug_UpwardsExtension:
    dw $0001,DrawInst_Debug_UpwardsExtension                             ;84AFAA;
    dw Instruction_PLM_Delete                                            ;84AFAE;

InstList_PLM_Debug_DownwardsExtension:
    dw $0001,DrawInst_Debug_DownwardsExtension                           ;84AFB0;
    dw Instruction_PLM_Delete                                            ;84AFB4;

InstList_PLM_ElevatorPlatform:
    dw $0004,DrawInst_ElevatorPlatform_0                                 ;84AFB6;
    dw $0004,DrawInst_ElevatorPlatform_1                                 ;84AFBA;
    dw $0004,DrawInst_ElevatorPlatform_2                                 ;84AFBE;
    dw $0004,DrawInst_ElevatorPlatform_1                                 ;84AFC2;
    dw Instruction_PLM_GotoY                                             ;84AFC6;
    dw InstList_PLM_ElevatorPlatform                                     ;84AFC8;

InstList_PLM_ClearCrocomiresBridge:
    dw $0001,DrawInst_ClearCrocomiresBridge                              ;84AFCA;
    dw Instruction_PLM_Delete                                            ;84AFCE;

InstList_PLM_CrumbleABlockOfCrocomiresBridge:
    dw $0001,DrawInst_CrumbleABlockOfCrocomiresBridge                    ;84AFD0;
    dw Instruction_PLM_Delete                                            ;84AFD4;

InstList_PLM_ClearABlockOfCrocomiresBridge:
    dw $0001,DrawInst_ClearABlockOfCrocomiresBridge                      ;84AFD6;
    dw Instruction_PLM_Delete                                            ;84AFDA;

InstList_PLM_ClearCrocomiresInvisibleWall:
    dw $0001,DrawInst_ClearCrocomireInvisibleWall_0                      ;84AFDC;
    dw Instruction_PLM_Delete                                            ;84AFE0;

InstList_PLM_CreateCrocomiresInvisibleWall:
    dw $0001,DrawInst_ClearCrocomireInvisibleWall_1                      ;84AFE2;
    dw Instruction_PLM_Delete                                            ;84AFE6;

InstList_PLM_SaveStation_0:
    dw $0001,DrawInst_SaveStation_0                                      ;84AFE8;
    dw Instruction_PLM_Sleep                                             ;84AFEC;
    dw Instruction_PLM_GotoY_or_ActivateSaveStation                      ;84AFEE;
    dw InstList_PLM_SaveStation_2                                        ;84AFF0;
    dw Instruction_PLM_PlaceSamusOnSaveStation                           ;84AFF2;
    dw Instruction_PLM_QueueSound_Y_Lib1_Max6 : db $2E                   ;84AFF4;
    dw Instruction_PLM_TimerEqualsY_8Bit : db $15                        ;84AFF7;

InstList_PLM_SaveStation_1:
    dw $0004,DrawInst_SaveStation_2                                      ;84AFFA;
    dw $0004,DrawInst_SaveStation_1                                      ;84AFFE;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84B002;
    dw InstList_PLM_SaveStation_1                                        ;84B004;
    dw Instruction_PLM_DisplayGameSavedMessageBox                        ;84B006;

InstList_PLM_SaveStation_2:
    dw Instruction_PLM_EnableMovement_SetSaveStationUsed                 ;84B008;
    dw Instruction_PLM_GotoY                                             ;84B00A;
    dw InstList_PLM_SaveStation_0                                        ;84B00C;

Instruction_PLM_PlaceSamusOnSaveStation:
    LDA.W $0AF6                                                          ;84B00E;
    CLC                                                                  ;84B011;
    ADC.W #$0008                                                         ;84B012;
    AND.W #$FFF0                                                         ;84B015;
    STA.W $0AF6                                                          ;84B018;
    PHX                                                                  ;84B01B;
    PHY                                                                  ;84B01C;
    JSL.L MakeSamusFaceForward                                           ;84B01D;
    PLY                                                                  ;84B021;
    PLX                                                                  ;84B022;
    RTS                                                                  ;84B023;


Instruction_PLM_DisplayGameSavedMessageBox:
    PHX                                                                  ;84B024;
    PHY                                                                  ;84B025;
    LDA.W #$0018                                                         ;84B026;
    JSL.L MessageBox_Routine                                             ;84B029;
    PLY                                                                  ;84B02D;
    PLX                                                                  ;84B02E;
    RTS                                                                  ;84B02F;


Instruction_PLM_EnableMovement_SetSaveStationUsed:
    LDA.W #$0001                                                         ;84B030;
    JSL.L Run_Samus_Command                                              ;84B033;
    LDA.W #$0001                                                         ;84B037;
    STA.W $1E75                                                          ;84B03A;
    RTS                                                                  ;84B03D;


UNUSED_InstList_PLM_Draw13BlankAirTiles_84B03E:
    dw $0001,UNUSED_DrawInst_Draw13BlankAirTiles_849ACF                  ;84B03E;
    dw Instruction_PLM_Delete                                            ;84B042;

UNUSED_InstList_PLM_Draw13BlankSolidTiles_84B044:
    dw $0001,UNUSED_DrawInst_Draw13BlankSolidTiles_849AED                ;84B044;
    dw Instruction_PLM_Delete                                            ;84B048;

Setup_WreckedShipEntranceTreadmill:
    LDX.W $1C87,Y                                                        ;84B04A;
    LDA.W #$00FF                                                         ;84B04D;
    LDY.W #$0038                                                         ;84B050;

.loop:
    STA.L $7F0002,X                                                      ;84B053;
    INX                                                                  ;84B057;
    INX                                                                  ;84B058;
    DEY                                                                  ;84B059;
    BNE .loop                                                            ;84B05A;
    RTS                                                                  ;84B05C;


UNUSED_LoadFXEntry_CompletelyBroken_84B05D:
    PHB                                                                  ;84B05D;
    PHA                                                                  ;84B05E;
    PEA.W $8F00                                                          ;84B05F;
    PLB                                                                  ;84B062;
    PLB                                                                  ;84B063;
    ASL A                                                                ;84B064;
    ASL A                                                                ;84B065;
    ASL A                                                                ;84B066;
    ASL A                                                                ;84B067;
    TAX                                                                  ;84B068;
    CMP.W $1968                                                          ;84B069;
    BEQ .return                                                          ;84B06C;
    LDA.W $197C                                                          ;84B06E;
    BEQ .loadFXEntry                                                     ;84B071;
    LDA.W $1978                                                          ;84B073;
    BMI .loadFXEntry                                                     ;84B076;
    TYA                                                                  ;84B078;
    CLC                                                                  ;84B079;
    ADC.W $07CD                                                          ;84B07A;
    TAX                                                                  ;84B07D;
    CMP.W $0002,X                                                        ;84B07E;
    PLA                                                                  ;84B081;
    PLB                                                                  ;84B082;
    BCC .return                                                          ;84B083;

.loadFXEntry:
    JSL.L Load_FX_Entry                                                  ;84B085;

.return:
    CLC                                                                  ;84B089;
    RTS                                                                  ;84B08A;


UNUSED_LoadFXEntry0IfPLMIsInLeftmostScreenColumn_84B08B:
    LDX.W $1C27                                                          ;84B08B;
    JSL.L Calculate_PLM_Block_Coordinates                                ;84B08E;
    LDA.W $0AF6                                                          ;84B092;
    LSR A                                                                ;84B095;
    LSR A                                                                ;84B096;
    LSR A                                                                ;84B097;
    LSR A                                                                ;84B098;
    CMP.W $1C29                                                          ;84B099;
    BNE .return                                                          ;84B09C;
    LDA.W #$0000                                                         ;84B09E;
    JMP.W UNUSED_LoadFXEntry_CompletelyBroken_84B05D                     ;84B0A1;


.return:
    CLC                                                                  ;84B0A4;
    RTS                                                                  ;84B0A5;


UNUSED_LoadFXEntry1IfPLMIsInLeftmostScreenColumn_84B0A6:
    LDX.W $1C27                                                          ;84B0A6;
    JSL.L Calculate_PLM_Block_Coordinates                                ;84B0A9;
    LDA.W $0AF6                                                          ;84B0AD;
    LSR A                                                                ;84B0B0;
    LSR A                                                                ;84B0B1;
    LSR A                                                                ;84B0B2;
    LSR A                                                                ;84B0B3;
    CMP.W $1C29                                                          ;84B0B4;
    BNE .return                                                          ;84B0B7;
    LDA.W #$0001                                                         ;84B0B9;
    JMP.W UNUSED_LoadFXEntry_CompletelyBroken_84B05D                     ;84B0BC;


.return:
    CLC                                                                  ;84B0BF;
    RTS                                                                  ;84B0C0;


UNUSED_LoadFXEntry2IfPLMIsInLeftmostScreenColumn_84B0C1:
    LDX.W $1C27                                                          ;84B0C1;
    JSL.L Calculate_PLM_Block_Coordinates                                ;84B0C4;
    LDA.W $0AF6                                                          ;84B0C8;
    LSR A                                                                ;84B0CB;
    LSR A                                                                ;84B0CC;
    LSR A                                                                ;84B0CD;
    LSR A                                                                ;84B0CE;
    CMP.W $1C29                                                          ;84B0CF;
    BNE .return                                                          ;84B0D2;
    LDA.W #$0002                                                         ;84B0D4;
    JMP.W UNUSED_LoadFXEntry_CompletelyBroken_84B05D                     ;84B0D7;


.return:
    CLC                                                                  ;84B0DA;
    RTS                                                                  ;84B0DB;


Setup_BrinstarFloorPlant:
    LDA.W $0AFA                                                          ;84B0DC;
    CLC                                                                  ;84B0DF;
    ADC.W $0B00                                                          ;84B0E0;
    DEC A                                                                ;84B0E3;
    AND.W #$000F                                                         ;84B0E4;
    CMP.W #$000F                                                         ;84B0E7;
    BEQ .deactivate                                                      ;84B0EA;
    LDA.W #$0000                                                         ;84B0EC;
    STA.W $1C37,Y                                                        ;84B0EF;
    CLC                                                                  ;84B0F2;
    RTS                                                                  ;84B0F3;


.deactivate:
    LDX.W $1C87,Y                                                        ;84B0F4;
    LDA.L $7F0002,X                                                      ;84B0F7;
    AND.W #$8FFF                                                         ;84B0FB;
    STA.L $7F0002,X                                                      ;84B0FE;
    TYX                                                                  ;84B102;
    LDA.W $0AF6                                                          ;84B103;
    STA.W $1E17,X                                                        ;84B106;
    LDA.W $0AFA                                                          ;84B109;
    DEC A                                                                ;84B10C;
    STA.L $7EDF0C,X                                                      ;84B10D;
    CLC                                                                  ;84B111;
    RTS                                                                  ;84B112;


Setup_BrinstarCeilingPlant:
    LDA.W $0AFA                                                          ;84B113;
    SEC                                                                  ;84B116;
    SBC.W $0B00                                                          ;84B117;
    AND.W #$000F                                                         ;84B11A;
    BEQ .deactivate                                                      ;84B11D;
    LDA.W #$0000                                                         ;84B11F;
    STA.W $1C37,Y                                                        ;84B122;
    CLC                                                                  ;84B125;
    RTS                                                                  ;84B126;


.deactivate:
    LDX.W $1C87,Y                                                        ;84B127;
    LDA.L $7F0002,X                                                      ;84B12A;
    AND.W #$8FFF                                                         ;84B12E;
    STA.L $7F0002,X                                                      ;84B131;
    TYX                                                                  ;84B135;
    LDA.W $0AF6                                                          ;84B136;
    STA.W $1E17,X                                                        ;84B139;
    LDA.W $0AFA                                                          ;84B13C;
    INC A                                                                ;84B13F;
    STA.L $7EDF0C,X                                                      ;84B140;
    CLC                                                                  ;84B144;
    RTS                                                                  ;84B145;


ActivateStationIfSamusArmCannonLinedUp:
    LDX.W #$004E                                                         ;84B146;

.loop:
    CMP.W $1C87,X                                                        ;84B149;
    BEQ .found                                                           ;84B14C;
    DEX                                                                  ;84B14E;
    DEX                                                                  ;84B14F;
    BPL .loop                                                            ;84B150;
    BRA .delete                                                          ;84B152;


.found:
    PHX                                                                  ;84B154;
    LDX.W $1C27                                                          ;84B155;
    JSL.L Calculate_PLM_Block_Coordinates                                ;84B158;
    PLX                                                                  ;84B15C;
    LDA.W $1C2B                                                          ;84B15D;
    ASL A                                                                ;84B160;
    ASL A                                                                ;84B161;
    ASL A                                                                ;84B162;
    ASL A                                                                ;84B163;
    ORA.W #$000B                                                         ;84B164;
    CMP.W $0AFA                                                          ;84B167;
    BNE .delete                                                          ;84B16A;
    LDA.L $7EDEBC,X                                                      ;84B16C;
    STA.W $1D27,X                                                        ;84B170;
    LDA.W #$0001                                                         ;84B173;
    STA.L $7EDE1C,X                                                      ;84B176;
    LDA.W #$0006                                                         ;84B17A;
    JSL.L Run_Samus_Command                                              ;84B17D;
    SEC                                                                  ;84B181;
    RTS                                                                  ;84B182;


.delete:
    LDA.W #$0000                                                         ;84B183;
    STA.W $1C37,Y                                                        ;84B186;
    SEC                                                                  ;84B189;
    RTS                                                                  ;84B18A;


Setup_MapStation:
    LDX.W $1C87,Y                                                        ;84B18B;
    LDA.L $7F0002,X                                                      ;84B18E;
    AND.W #$0FFF                                                         ;84B192;
    ORA.W #$8000                                                         ;84B195;
    STA.L $7F0002,X                                                      ;84B198;
    LDX.W $079F                                                          ;84B19C;
    LDA.L $7ED908,X                                                      ;84B19F;
    AND.W #$00FF                                                         ;84B1A3;
    BNE .setInstruction                                                  ;84B1A6;
    LDX.W $1C87,Y                                                        ;84B1A8;
    INX                                                                  ;84B1AB;
    INX                                                                  ;84B1AC;
    LDA.W #$B047                                                         ;84B1AD;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84B1B0;
    LDX.W $1C87,Y                                                        ;84B1B3;
    DEX                                                                  ;84B1B6;
    DEX                                                                  ;84B1B7;
    DEX                                                                  ;84B1B8;
    DEX                                                                  ;84B1B9;
    LDA.W #$B048                                                         ;84B1BA;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84B1BD;
    RTS                                                                  ;84B1C0;


.setInstruction:
    LDA.W #InstList_PLM_MapStation_2                                     ;84B1C1;
    STA.W $1D27,Y                                                        ;84B1C4;
    RTS                                                                  ;84B1C7;


Setup_MapStationRightAccess:
    LDA.W $0B02                                                          ;84B1C8;
    AND.W #$000F                                                         ;84B1CB;
    BNE .connected                                                       ;84B1CE;
    LDA.W $0A1C                                                          ;84B1D0;
    CMP.W #$008A                                                         ;84B1D3;
    BNE .connected                                                       ;84B1D6;
    LDA.W $0A1E                                                          ;84B1D8;
    AND.W #$0004                                                         ;84B1DB;
    BEQ .connected                                                       ;84B1DE;
    LDA.W $1C87,Y                                                        ;84B1E0;
    DEC A                                                                ;84B1E3;
    DEC A                                                                ;84B1E4;
    JMP.W ActivateStationIfSamusArmCannonLinedUp                         ;84B1E5;


.connected:
    LDA.W #$0000                                                         ;84B1E8;
    STA.W $1C37,Y                                                        ;84B1EB;
    SEC                                                                  ;84B1EE;
    RTS                                                                  ;84B1EF;


Setup_MapStationLeftAccess:
    LDA.W $0B02                                                          ;84B1F0;
    AND.W #$000F                                                         ;84B1F3;
    CMP.W #$0001                                                         ;84B1F6;
    BNE .connected                                                       ;84B1F9;
    LDA.W $0A1C                                                          ;84B1FB;
    CMP.W #$0089                                                         ;84B1FE;
    BNE .connected                                                       ;84B201;
    LDA.W $0A1E                                                          ;84B203;
    AND.W #$0008                                                         ;84B206;
    BEQ .connected                                                       ;84B209;
    LDA.W $1C87,Y                                                        ;84B20B;
    INC A                                                                ;84B20E;
    INC A                                                                ;84B20F;
    INC A                                                                ;84B210;
    INC A                                                                ;84B211;
    JMP.W ActivateStationIfSamusArmCannonLinedUp                         ;84B212;


.connected:
    LDA.W #$0000                                                         ;84B215;
    STA.W $1C37,Y                                                        ;84B218;
    SEC                                                                  ;84B21B;
    RTS                                                                  ;84B21C;


Setup_EnergyStation:
    LDX.W $1C87,Y                                                        ;84B21D;
    LDA.L $7F0002,X                                                      ;84B220;
    AND.W #$0FFF                                                         ;84B224;
    ORA.W #$8000                                                         ;84B227;
    STA.L $7F0002,X                                                      ;84B22A;
    LDX.W $1C87,Y                                                        ;84B22E;
    INX                                                                  ;84B231;
    INX                                                                  ;84B232;
    LDA.W #$B049                                                         ;84B233;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84B236;
    LDX.W $1C87,Y                                                        ;84B239;
    DEX                                                                  ;84B23C;
    DEX                                                                  ;84B23D;
    LDA.W #$B04A                                                         ;84B23E;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84B241;
    RTS                                                                  ;84B244;


Setup_MissileStation:
    LDX.W $1C87,Y                                                        ;84B245;
    LDA.L $7F0002,X                                                      ;84B248;
    AND.W #$0FFF                                                         ;84B24C;
    ORA.W #$8000                                                         ;84B24F;
    STA.L $7F0002,X                                                      ;84B252;
    LDX.W $1C87,Y                                                        ;84B256;
    INX                                                                  ;84B259;
    INX                                                                  ;84B25A;
    LDA.W #$B04B                                                         ;84B25B;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84B25E;
    LDX.W $1C87,Y                                                        ;84B261;
    DEX                                                                  ;84B264;
    DEX                                                                  ;84B265;
    LDA.W #$B04C                                                         ;84B266;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84B269;
    RTS                                                                  ;84B26C;


Setup_EnergyStationRightAccess:
    LDA.W $0B02                                                          ;84B26D;
    AND.W #$000F                                                         ;84B270;
    BNE .connected                                                       ;84B273;
    LDA.W $0A1C                                                          ;84B275;
    CMP.W #$008A                                                         ;84B278;
    BNE .connected                                                       ;84B27B;
    LDA.W $0A1E                                                          ;84B27D;
    AND.W #$0004                                                         ;84B280;
    BEQ .connected                                                       ;84B283;
    LDA.W $09C2                                                          ;84B285;
    CMP.W $09C4                                                          ;84B288;
    BEQ .connected                                                       ;84B28B;
    LDA.W $1C87,Y                                                        ;84B28D;
    DEC A                                                                ;84B290;
    DEC A                                                                ;84B291;
    JMP.W ActivateStationIfSamusArmCannonLinedUp                         ;84B292;


.connected:
    LDA.W #$0000                                                         ;84B295;
    STA.W $1C37,Y                                                        ;84B298;
    SEC                                                                  ;84B29B;
    RTS                                                                  ;84B29C;


Setup_EnergyStationLeftAccess:
    LDA.W $0B02                                                          ;84B29D;
    AND.W #$000F                                                         ;84B2A0;
    CMP.W #$0001                                                         ;84B2A3;
    BNE .connected                                                       ;84B2A6;
    LDA.W $0A1C                                                          ;84B2A8;
    CMP.W #$0089                                                         ;84B2AB;
    BNE .connected                                                       ;84B2AE;
    LDA.W $0A1E                                                          ;84B2B0;
    AND.W #$0008                                                         ;84B2B3;
    BEQ .connected                                                       ;84B2B6;
    LDA.W $09C2                                                          ;84B2B8;
    CMP.W $09C4                                                          ;84B2BB;
    BEQ .connected                                                       ;84B2BE;
    LDA.W $1C87,Y                                                        ;84B2C0;
    INC A                                                                ;84B2C3;
    INC A                                                                ;84B2C4;
    JMP.W ActivateStationIfSamusArmCannonLinedUp                         ;84B2C5;


.connected:
    LDA.W #$0000                                                         ;84B2C8;
    STA.W $1C37,Y                                                        ;84B2CB;
    SEC                                                                  ;84B2CE;
    RTS                                                                  ;84B2CF;


Setup_MissileStationRightAccess:
    LDA.W $0B02                                                          ;84B2D0;
    AND.W #$000F                                                         ;84B2D3;
    BNE .connected                                                       ;84B2D6;
    LDA.W $0A1C                                                          ;84B2D8;
    CMP.W #$008A                                                         ;84B2DB;
    BNE .connected                                                       ;84B2DE;
    LDA.W $0A1E                                                          ;84B2E0;
    AND.W #$0004                                                         ;84B2E3;
    BEQ .connected                                                       ;84B2E6;
    LDA.W $09C6                                                          ;84B2E8;
    CMP.W $09C8                                                          ;84B2EB;
    BEQ .connected                                                       ;84B2EE;
    LDA.W $1C87,Y                                                        ;84B2F0;
    DEC A                                                                ;84B2F3;
    DEC A                                                                ;84B2F4;
    JMP.W ActivateStationIfSamusArmCannonLinedUp                         ;84B2F5;


.connected:
    LDA.W #$0000                                                         ;84B2F8;
    STA.W $1C37,Y                                                        ;84B2FB;
    SEC                                                                  ;84B2FE;
    RTS                                                                  ;84B2FF;


Setup_MissileStationLeftAccess:
    LDA.W $0B02                                                          ;84B300;
    AND.W #$000F                                                         ;84B303;
    CMP.W #$0001                                                         ;84B306;
    BNE .connected                                                       ;84B309;
    LDA.W $0A1C                                                          ;84B30B;
    CMP.W #$0089                                                         ;84B30E;
    BNE .connected                                                       ;84B311;
    LDA.W $0A1E                                                          ;84B313;
    AND.W #$0008                                                         ;84B316;
    BEQ .connected                                                       ;84B319;
    LDA.W $09C6                                                          ;84B31B;
    CMP.W $09C8                                                          ;84B31E;
    BEQ .connected                                                       ;84B321;
    LDA.W $1C87,Y                                                        ;84B323;
    INC A                                                                ;84B326;
    INC A                                                                ;84B327;
    JMP.W ActivateStationIfSamusArmCannonLinedUp                         ;84B328;


.connected:
    LDA.W #$0000                                                         ;84B32B;
    STA.W $1C37,Y                                                        ;84B32E;
    SEC                                                                  ;84B331;
    RTS                                                                  ;84B332;


DeletePLM:
    LDA.W #$0000                                                         ;84B333;
    STA.W $1C37,Y                                                        ;84B336;
    RTS                                                                  ;84B339;


Setup_RightwardsExtension:
    LDX.W $1C87,Y                                                        ;84B33A;
    LDA.W #$50FF                                                         ;84B33D;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84B340;
    BRA DeletePLM                                                        ;84B343;


Setup_LeftwardsExtension:
    LDX.W $1C87,Y                                                        ;84B345;
    LDA.W #$5001                                                         ;84B348;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84B34B;
    BRA DeletePLM                                                        ;84B34E;


Setup_DownwardsExtension:
    LDX.W $1C87,Y                                                        ;84B350;
    LDA.W #$D0FF                                                         ;84B353;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84B356;
    BRA DeletePLM                                                        ;84B359;


Setup_UpwardsExtension:
    LDX.W $1C87,Y                                                        ;84B35B;
    LDA.W #$D001                                                         ;84B35E;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84B361;
    BRA DeletePLM                                                        ;84B364;


Skip_Debug_DrawInstruction_for_ScrollPLM:
    LDA.W $1D27,Y                                                        ;84B366;
    CLC                                                                  ;84B369;
    ADC.W #$0004                                                         ;84B36A;
    STA.W $1D27,Y                                                        ;84B36D;
    RTS                                                                  ;84B370;


Setup_ScrollPLM:
    LDX.W $1C87,Y                                                        ;84B371;
    LDA.W #$3046                                                         ;84B374;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84B377;
    LDA.W #$0000                                                         ;84B37A;
    STA.W $1E17,Y                                                        ;84B37D;
    BRA Skip_Debug_DrawInstruction_for_ScrollPLM                         ;84B380;


Setup_SolidScrollPLM:
    LDX.W $1C87,Y                                                        ;84B382;
    LDA.W #$B046                                                         ;84B385;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84B388;
    LDA.W #$0000                                                         ;84B38B;
    STA.W $1E17,Y                                                        ;84B38E;
    BRA Skip_Debug_DrawInstruction_for_ScrollPLM                         ;84B391;


Setup_ScrollBlockTouchPLM:
    TYX                                                                  ;84B393;
    LDA.W $1C87,X                                                        ;84B394;
    STZ.W $1C87,X                                                        ;84B397;
    LDX.W #$004E                                                         ;84B39A;

.loop:
    CMP.W $1C87,X                                                        ;84B39D;
    BEQ .found                                                           ;84B3A0;
    DEX                                                                  ;84B3A2;
    DEX                                                                  ;84B3A3;
    BPL .loop                                                            ;84B3A4;

.crash:
    BRA .crash                                                           ;84B3A6;


.found:
    LDA.W $1E17,X                                                        ;84B3A8;
    BMI .return                                                          ;84B3AB;
    LDA.W #$8000                                                         ;84B3AD;
    STA.W $1E17,X                                                        ;84B3B0;
    INC.W $1D27,X                                                        ;84B3B3;
    INC.W $1D27,X                                                        ;84B3B6;
    LDA.W #$0001                                                         ;84B3B9;
    STA.L $7EDE1C,X                                                      ;84B3BC;

.return:
    RTS                                                                  ;84B3C0;


Setup_DeactivatePLM:
    LDX.W $1C87,Y                                                        ;84B3C1;
    LDA.L $7F0002,X                                                      ;84B3C4;
    AND.W #$8FFF                                                         ;84B3C8;
    STA.L $7F0002,X                                                      ;84B3CB; fallthrough to RTS_84B3CF

RTS_84B3CF:
    RTS                                                                  ;84B3CF;


Setup_ClearCarry:
    CLC                                                                  ;84B3D0;
    RTS                                                                  ;84B3D1;


Setup_SetCarry:
    SEC                                                                  ;84B3D2;
    RTS                                                                  ;84B3D3;


Setup_EnemyBreakableBlock:
    LDX.W $1C87,Y                                                        ;84B3D4;
    LDA.L $7F0002,X                                                      ;84B3D7;
    AND.W #$0FFF                                                         ;84B3DB;
    STA.L $7F0002,X                                                      ;84B3DE;
    RTS                                                                  ;84B3E2;


UNUSED_Setup_TorizoDrool_84B3E3:
    LDY.W #UNUSED_EnemyProjectile_BombTorizo_86A977                      ;84B3E3;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84B3E6;
    RTS                                                                  ;84B3EA;


Setup_IcePhysics:
    LDA.W $0AFA                                                          ;84B3EB;
    CLC                                                                  ;84B3EE;
    ADC.W $0B00                                                          ;84B3EF;
    DEC A                                                                ;84B3F2;
    AND.W #$000F                                                         ;84B3F3;
    CMP.W #$0007                                                         ;84B3F6;
    BEQ .decel                                                           ;84B3F9;
    CMP.W #$000F                                                         ;84B3FB;
    BNE .return                                                          ;84B3FE;

.decel:
    LDA.W #$0010                                                         ;84B400;
    STA.W $0B4C                                                          ;84B403;

.return:
    CLC                                                                  ;84B406;
    RTS                                                                  ;84B407;


Setup_QuicksandSurface:
    STZ.W $0B3C                                                          ;84B408;
    STZ.W $0B3E                                                          ;84B40B;
    STZ.W $0B40                                                          ;84B40E;
    STZ.W $0B44                                                          ;84B411;
    STZ.W $0B42                                                          ;84B414;
    LDA.W #$8000                                                         ;84B417;
    TRB.W $0B48                                                          ;84B41A;
    STZ.W $0B46                                                          ;84B41D;
    LDY.W #$0000                                                         ;84B420;
    LDA.W $09A2                                                          ;84B423;
    BIT.W #$0020                                                         ;84B426;
    BEQ +                                                                ;84B429;
    LDY.W #$0002                                                         ;84B42B;

  + LDA.W $1E73                                                          ;84B42E;
    BNE InsideReaction_QuicksandSurface_SamusIsGrounded_return           ;84B431;
    LDA.W $0B36                                                          ;84B433;
    AND.W #$0003                                                         ;84B436;
    ASL A                                                                ;84B439;
    TAX                                                                  ;84B43A;
    JSR.W (.pointers,X)                                                  ;84B43B;
    RTS                                                                  ;84B43E;


.pointers:
    dw InsideReaction_QuicksandSurface_SamusIsGrounded                   ;84B43F;
    dw InsideReaction_QuicksandSurface_SamusIsMovingUp                   ;84B441;
    dw InsideReaction_QuicksandSurface_SamusIsMovingDown                 ;84B443;
    dw InsideReaction_QuicksandSurface_SamusIsGrounded                   ;84B445;

InsideReaction_QuicksandSurface_SamusIsGrounded:
    STZ.W $0B2C                                                          ;84B447;
    STZ.W $0B2E                                                          ;84B44A;
    STZ.W $0B5A                                                          ;84B44D;
    STZ.W $0B5C                                                          ;84B450;
    LDA.W QuicksandSurface_InsideReaction_distanceOnGround,Y             ;84B453;
    STA.W $0B5B                                                          ;84B456;

  .return
    RTS                                                                  ;84B459;


InsideReaction_QuicksandSurface_SamusIsMovingUp:
    LDA.W QuicksandSurface_InsideReaction_maxVelocity,Y                  ;84B45A;
    CMP.W $0B2D                                                          ;84B45D;
    BCS +                                                                ;84B460;
    STZ.W $0B2C                                                          ;84B462;
    STZ.W $0B2E                                                          ;84B465;
    LDA.W QuicksandSurface_InsideReaction_maxVelocity,Y                  ;84B468;
    STA.W $0B2D                                                          ;84B46B;

  + STZ.W $0B5A                                                          ;84B46E;
    STZ.W $0B5C                                                          ;84B471;
    LDA.W QuicksandSurface_InsideReaction_distanceInAir,Y                ;84B474;
    STA.W $0B5B                                                          ;84B477;
    RTS                                                                  ;84B47A;


InsideReaction_QuicksandSurface_SamusIsMovingDown:
    STZ.W $0B5A                                                          ;84B47B;
    STZ.W $0B5C                                                          ;84B47E;
    LDA.W QuicksandSurface_InsideReaction_distanceInAir,Y                ;84B481;
    STA.W $0B5B                                                          ;84B484;
    STZ.W $0AF4                                                          ;84B487;
    RTS                                                                  ;84B48A;


QuicksandSurface_InsideReaction:
;        _________ Without gravity suit
;       |      ___ With gravity suit
;       |     |
  .distanceInAir:
    dw $0200,$0200                                                       ;84B48B;
  .distanceOnGround:
    dw $0120,$0100                                                       ;84B48F;
  .maxVelocity:
    dw $0280,$0380                                                       ;84B493;


Setup_Inside_SubmergingQuicksand:
    STZ.W $0AF4                                                          ;84B497;
    LDA.W #$2000                                                         ;84B49A;
    STA.W $0B5A                                                          ;84B49D;
    LDA.W #$0001                                                         ;84B4A0;
    STA.W $0B5C                                                          ;84B4A3;
    CLC                                                                  ;84B4A6;
    RTS                                                                  ;84B4A7;


Setup_SandfallsSlow:
    LDA.W #$4000                                                         ;84B4A8;
    STA.W $0B5A                                                          ;84B4AB;
    LDA.W #$0001                                                         ;84B4AE;
    STA.W $0B5C                                                          ;84B4B1;
    CLC                                                                  ;84B4B4;
    RTS                                                                  ;84B4B5;


Setup_SandfallsFast:
    LDA.W #$C000                                                         ;84B4B6;
    STA.W $0B5A                                                          ;84B4B9;
    LDA.W #$0001                                                         ;84B4BC;
    STA.W $0B5C                                                          ;84B4BF;
    CLC                                                                  ;84B4C2;
    RTS                                                                  ;84B4C3;


Setup_QuicksandSurface_BTS85:
    LDA.W $0B02                                                          ;84B4C4;
    AND.W #$0002                                                         ;84B4C7;
    BNE .vertical                                                        ;84B4CA;
    CLC                                                                  ;84B4CC;
    RTS                                                                  ;84B4CD;


.vertical:
    LDY.W #$0000                                                         ;84B4CE;
    LDA.W $09A2                                                          ;84B4D1;
    BIT.W #$0020                                                         ;84B4D4;
    BEQ +                                                                ;84B4D7;
    LDY.W #$0002                                                         ;84B4D9;

  + LDX.B $12                                                            ;84B4DC;
    LDA.B $14                                                            ;84B4DE;
    STA.B $12                                                            ;84B4E0;
    STX.B $14                                                            ;84B4E2;
    LDA.W $0B36                                                          ;84B4E4;
    AND.W #$0003                                                         ;84B4E7;
    ASL A                                                                ;84B4EA;
    TAX                                                                  ;84B4EB;
    JSR.W (.pointers,X)                                                  ;84B4EC;
    LDX.B $12                                                            ;84B4EF;
    LDA.B $14                                                            ;84B4F1;
    STA.B $12                                                            ;84B4F3;
    STX.B $14                                                            ;84B4F5;
    RTS                                                                  ;84B4F7;


.pointers:
    dw CollisionReaction_QuicksandSurface_SamusIsGrounded                ;84B4F8;
    dw ClearCarry_84B528                                                 ;84B4FA;
    dw CollisionReaction_QuicksandSurface_SamusIsMovingDown              ;84B4FC;
    dw CollisionReaction_QuicksandSurface_SamusIsGrounded                ;84B4FE;

CollisionReaction_QuicksandSurface_SamusIsGrounded:
    LDA.W $0B02                                                          ;84B500;
    AND.W #$000F                                                         ;84B503;
    CMP.W #$0002                                                         ;84B506;
    BEQ .noCollision                                                     ;84B509;
    CMP.W #$0003                                                         ;84B50B;
    BEQ .up                                                              ;84B50E;
    BRA .noCollision                                                     ;84B510;


.up:
    LDA.W $0A6E                                                          ;84B512;
    CMP.W #$0001                                                         ;84B515;
    BEQ CollisionReaction_QuicksandSurface_QuicksandSpeedBoosting        ;84B518;
    LDA.W QuicksandSurface_MaxSinkingSpeed,Y                             ;84B51A;
    CMP.B $13                                                            ;84B51D;
    BCS +                                                                ;84B51F;
    STA.B $13                                                            ;84B521;

  + INC.W $1E71                                                          ;84B523;

.noCollision:
    CLC                                                                  ;84B526;
    RTS                                                                  ;84B527;


ClearCarry_84B528:
    CLC                                                                  ;84B528;
    RTS                                                                  ;84B529;


CollisionReaction_QuicksandSurface_SamusIsMovingDown:
    LDA.W $0A6E                                                          ;84B52A;
    CMP.W #$0001                                                         ;84B52D;
    BEQ CollisionReaction_QuicksandSurface_QuicksandSpeedBoosting        ;84B530;
    INC.W $1E71                                                          ;84B532;
    CLC                                                                  ;84B535;
    RTS                                                                  ;84B536;


CollisionReaction_QuicksandSurface_QuicksandSpeedBoosting:
    STZ.B $12                                                            ;84B537;
    STZ.B $14                                                            ;84B539;
    SEC                                                                  ;84B53B;
    RTS                                                                  ;84B53C;


QuicksandSurface_MaxSinkingSpeed:
;        _________ Without gravity suit
;       |      ___ With gravity suit
;       |     |
    dw $0030,$0030                                                       ;84B53D;

Setup_Collision_SubmergingQuicksand:
    STZ.W $0B2C                                                          ;84B541;
    STZ.W $0B2E                                                          ;84B544;
    STZ.W $0B32                                                          ;84B547;
    STZ.W $0B34                                                          ;84B54A;
    CLC                                                                  ;84B54D;
    RTS                                                                  ;84B54E;


Setup_CollisionReaction_SandFalls:
    CLC                                                                  ;84B54F;
    RTS                                                                  ;84B550;


Setup_ClearBabyMetroidInvisibleWall:
    LDX.W $1C87,Y                                                        ;84B551;
    LDY.W #$000A                                                         ;84B554;

.loop:
    LDA.L $7F0002,X                                                      ;84B557;
    AND.W #$0FFF                                                         ;84B55B;
    STA.L $7F0002,X                                                      ;84B55E;
    TXA                                                                  ;84B562;
    CLC                                                                  ;84B563;
    ADC.W $07A5                                                          ;84B564;
    ADC.W $07A5                                                          ;84B567;
    TAX                                                                  ;84B56A;
    DEY                                                                  ;84B56B;
    BNE .loop                                                            ;84B56C;
    RTS                                                                  ;84B56E;


CreateBabyMetroidInvisibleWall:
    LDX.W $1C87,Y                                                        ;84B56F;
    LDY.W #$000A                                                         ;84B572;

.loop:
    LDA.L $7F0002,X                                                      ;84B575;
    AND.W #$0FFF                                                         ;84B579;
    ORA.W #$8000                                                         ;84B57C;
    STA.L $7F0002,X                                                      ;84B57F;
    TXA                                                                  ;84B583;
    CLC                                                                  ;84B584;
    ADC.W $07A5                                                          ;84B585;
    ADC.W $07A5                                                          ;84B588;
    TAX                                                                  ;84B58B;
    DEY                                                                  ;84B58C;
    BNE .loop                                                            ;84B58D;
    RTS                                                                  ;84B58F;


Setup_CollisionReaction_SaveStationTrigger:
    LDA.W $0592                                                          ;84B590;
    BNE .collisionReturn                                                 ;84B593;
    LDA.W $0A1C                                                          ;84B595;
    CMP.W #$0001                                                         ;84B598;
    BEQ .standing                                                        ;84B59B;
    CMP.W #$0002                                                         ;84B59D;
    BNE .collisionReturn                                                 ;84B5A0;

.standing:
    LDA.W $1E75                                                          ;84B5A2;
    BNE .collisionReturn                                                 ;84B5A5;
    LDA.W $0B02                                                          ;84B5A7;
    AND.W #$000F                                                         ;84B5AA;
    CMP.W #$0003                                                         ;84B5AD;
    BNE .collisionReturn                                                 ;84B5B0;
    TYX                                                                  ;84B5B2;
    JSL.L Calculate_PLM_Block_Coordinates                                ;84B5B3;
    LDA.W $0AF6                                                          ;84B5B7;
    SEC                                                                  ;84B5BA;
    SBC.W #$0008                                                         ;84B5BB;
    LSR A                                                                ;84B5BE;
    LSR A                                                                ;84B5BF;
    LSR A                                                                ;84B5C0;
    LSR A                                                                ;84B5C1;
    CMP.W $1C29                                                          ;84B5C2;
    BNE .collisionReturn                                                 ;84B5C5;
    TYX                                                                  ;84B5C7;
    LDA.W $1C87,X                                                        ;84B5C8;
    STZ.W $1C87,X                                                        ;84B5CB;
    STZ.W $1C37,X                                                        ;84B5CE;
    LDX.W #$004E                                                         ;84B5D1;

.loop:
    CMP.W $1C87,X                                                        ;84B5D4;
    BEQ .found                                                           ;84B5D7;
    DEX                                                                  ;84B5D9;
    DEX                                                                  ;84B5DA;
    BPL .loop                                                            ;84B5DB;
    SEC                                                                  ;84B5DD;
    RTS                                                                  ;84B5DE;


.found:
    INC.W $1D27,X                                                        ;84B5DF;
    INC.W $1D27,X                                                        ;84B5E2;
    LDA.W #$0001                                                         ;84B5E5;
    STA.L $7EDE1C,X                                                      ;84B5E8;

.collisionReturn:
    SEC                                                                  ;84B5EC;
    RTS                                                                  ;84B5ED;


Setup_SaveStation:
    LDX.W $1C87,Y                                                        ;84B5EE;
    LDA.W #$B04D                                                         ;84B5F1;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84B5F4;
    RTS                                                                  ;84B5F7;


Setup_MotherBrainsRoomEscapeDoor:
    LDX.W $1C87,Y                                                        ;84B5F8;
    LDA.W #$9001                                                         ;84B5FB;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84B5FE;
    TXA                                                                  ;84B601;
    CLC                                                                  ;84B602;
    ADC.W $07A5                                                          ;84B603;
    ADC.W $07A5                                                          ;84B606;
    TAX                                                                  ;84B609;
    LDA.W #$D0FF                                                         ;84B60A;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84B60D;
    TXA                                                                  ;84B610;
    CLC                                                                  ;84B611;
    ADC.W $07A5                                                          ;84B612;
    ADC.W $07A5                                                          ;84B615;
    TAX                                                                  ;84B618;
    LDA.W #$D0FF                                                         ;84B619;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84B61C;
    TXA                                                                  ;84B61F;
    CLC                                                                  ;84B620;
    ADC.W $07A5                                                          ;84B621;
    ADC.W $07A5                                                          ;84B624;
    TAX                                                                  ;84B627;
    LDA.W #$D0FF                                                         ;84B628;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84B62B;
    RTS                                                                  ;84B62E;


PLMEntries_nothing:
    dw RTS_84B3CF                                                        ;84B62F;
    dw InstList_PLM_Delete                                               ;84B631;

PLMEntries_collisionReactionClearCarry:
    dw Setup_ClearCarry                                                  ;84B633;
    dw InstList_PLM_Delete                                               ;84B635;

UNUSED_PLMEntries_84B637:
    dw Setup_SetCarry                                                    ;84B637;
    dw InstList_PLM_Delete                                               ;84B639;

PLMEntries_rightwardsExtension:
    dw Setup_RightwardsExtension                                         ;84B63B;
    dw InstList_PLM_Debug_RightwardsExtension                            ;84B63D;

PLMEntries_leftwardsExtension:
    dw Setup_LeftwardsExtension                                          ;84B63F;
    dw InstList_PLM_Debug_LeftwardsExtension                             ;84B641;

PLMEntries_downwardsExtension:
    dw Setup_DownwardsExtension                                          ;84B643;
    dw InstList_PLM_Debug_DownwardsExtension                             ;84B645;

PLMEntries_upwardsExtension:
    dw Setup_UpwardsExtension                                            ;84B647;
    dw InstList_PLM_Debug_UpwardsExtension                               ;84B649;

PLMEntries_wreckedShipEntranceTreadmillFromWest:
    dw Setup_WreckedShipEntranceTreadmill                                ;84B64B;
    dw InstList_PLM_WreckedShipEntranceTreadmillFromWest_0               ;84B64D;

PLMEntries_wreckedShipEntranceTreadmillFromEast:
    dw Setup_WreckedShipEntranceTreadmill                                ;84B64F;
    dw InstList_PLM_WreckedShipEntranceTreadmillFromEast_0               ;84B651;

PLMEntries_insideReactionNothing_B653:
    dw RTS_84B3CF                                                        ;84B653;
    dw InstList_PLM_Delete                                               ;84B655;

PLMEntries_insideReactionNothing_B657:
    dw RTS_84B3CF                                                        ;84B657;
    dw InstList_PLM_Delete                                               ;84B659;

PLMEntries_insideReactionNothing_B65B:
    dw RTS_84B3CF                                                        ;84B65B;
    dw InstList_PLM_Delete                                               ;84B65D;

UNUSED_PLMEntries_84B65F:
    dw Setup_DeactivatePLM                                               ;84B65F;
    dw UNUSED_InstList_PLM_84ABE3                                        ;84B661;

UNUSED_PLMEntries_84B663:
    dw Setup_DeactivatePLM                                               ;84B663;
    dw UNUSED_InstList_PLM_84ABE9                                        ;84B665;

UNUSED_PLMEntries_84B667:
    dw Setup_DeactivatePLM                                               ;84B667;
    dw UNUSED_InstList_PLM_84ABEF_0                                      ;84B669;

UNUSED_PLMEntries_84B66B:
    dw Setup_DeactivatePLM                                               ;84B66B;
    dw UNUSED_InstList_PLM_84ABF9                                        ;84B66D;

UNUSED_PLMEntries_84B66F:
    dw Setup_DeactivatePLM                                               ;84B66F;
    dw UNUSED_PLM_InstList_84ABFF                                        ;84B671;

PLMEntries_fillMotherBrainsWall:
    dw Setup_DeactivatePLM                                               ;84B673;
    dw InstList_PLM_FillMotherBrainsWall                                 ;84B675;

PLMEntries_motherBrainsRoomEscapeDoor:
    dw Setup_MotherBrainsRoomEscapeDoor                                  ;84B677;
    dw InstList_PLM_MotherBrainsRoomEscapeDoor                           ;84B679;

PLMEntries_motherBrainsBackgroundRow2:
    dw Setup_DeactivatePLM                                               ;84B67B;
    dw InstList_PLM_MotherBrainsBackgroundRow2                           ;84B67D;

PLMEntries_motherBrainsBackgroundRow3:
    dw Setup_DeactivatePLM                                               ;84B67F;
    dw InstList_PLM_MotherBrainsBackgroundRow3                           ;84B681;

PLMEntries_motherBrainsBackgroundRow4:
    dw Setup_DeactivatePLM                                               ;84B683;
    dw InstList_PLM_MotherBrainsBackgroundRow4                           ;84B685;

PLMEntries_motherBrainsBackgroundRow5:
    dw Setup_DeactivatePLM                                               ;84B687;
    dw InstList_PLM_MotherBrainsBackgroundRow5                           ;84B689;

PLMEntries_motherBrainsBackgroundRow6:
    dw Setup_DeactivatePLM                                               ;84B68B;
    dw InstList_PLM_MotherBrainsBackgroundRow6                           ;84B68D;

PLMEntries_motherBrainsBackgroundRow7:
    dw Setup_DeactivatePLM                                               ;84B68F;
    dw InstList_PLM_MotherBrainsBackgroundRow7                           ;84B691;

PLMEntries_motherBrainsBackgroundRow8:
    dw Setup_DeactivatePLM                                               ;84B693;
    dw InstList_PLM_MotherBrainsBackgroundRow8                           ;84B695;

PLMEntries_motherBrainsBackgroundRow9:
    dw Setup_DeactivatePLM                                               ;84B697;
    dw InstList_PLM_MotherBrainsBackgroundRow9                           ;84B699;

PLMEntries_motherBrainsBackgroundRowA:
    dw Setup_DeactivatePLM                                               ;84B69B;
    dw InstList_PLM_MotherBrainsBackgroundRowA                           ;84B69D;

PLMEntries_motherBrainsBackgroundRowB:
    dw Setup_DeactivatePLM                                               ;84B69F;
    dw InstList_PLM_MotherBrainsBackgroundRowB                           ;84B6A1;

PLMEntries_motherBrainsBackgroundRowC:
    dw Setup_DeactivatePLM                                               ;84B6A3;
    dw InstList_PLM_MotherBrainsBackgroundRowC                           ;84B6A5;

PLMEntries_motherBrainsBackgroundRowD:
    dw Setup_DeactivatePLM                                               ;84B6A7;
    dw InstList_PLM_MotherBrainsBackgroundRowD                           ;84B6A9;

UNUSED_PLMEntries_84B6AB:
    dw Setup_DeactivatePLM                                               ;84B6AB;
    dw UNUSED_InstList_PLM_84AC59                                        ;84B6AD;

UNUSED_PLMEntries_84B6AF:
    dw Setup_DeactivatePLM                                               ;84B6AF;
    dw UNUSED_InstList_PLM_84AC5F                                        ;84B6B1;

PLMEntries_clearCeilingBlockInMotherBrainsRoom:
    dw Setup_DeactivatePLM                                               ;84B6B3;
    dw InstList_PLM_ClearCeilingBlockInMotherBrainsRoom                  ;84B6B5;

PLMEntries_clearCeilingTubeInMotherBrainsRoom:
    dw Setup_DeactivatePLM                                               ;84B6B7;
    dw InstList_PLM_ClearCeilingTubeInMotherBrainsRoom                   ;84B6B9;

PLMEntries_clearMotherBrainsBottomMiddleSideTube:
    dw Setup_DeactivatePLM                                               ;84B6BB;
    dw InstList_PLM_ClearMotherBrainsBottomMiddleSideTube                ;84B6BD;

PLMEntries_clearMotherBrainsBottomMiddleTubes:
    dw Setup_DeactivatePLM                                               ;84B6BF;
    dw InstList_PLM_ClearMotherBrainsBottomMiddleTubes                   ;84B6C1;

PLMEntries_clearMotherBrainsBottomLeftTube:
    dw Setup_DeactivatePLM                                               ;84B6C3;
    dw InstList_PLM_ClearMotherBrainsBottomLeftTube                      ;84B6C5;

PLMEntries_clearMotherBrainsBottomRightTube:
    dw Setup_DeactivatePLM                                               ;84B6C7;
    dw InstList_PLM_ClearMotherBrainsBottomRightTube                     ;84B6C9;

PLMEntries_insideReactionBrinstarFloorPlant:
    dw Setup_BrinstarFloorPlant                                          ;84B6CB;
    dw InstList_PLM_BrinstarFloorPlant_0                                 ;84B6CD;

PLMEntries_insideReactionBrinstarCeilingPlant:
    dw Setup_BrinstarCeilingPlant                                        ;84B6CF;
    dw InstList_PLM_BrinstarCeilingPlant_0                               ;84B6D1;

PLMEntries_mapStation:
    dw Setup_MapStation                                                  ;84B6D3;
    dw InstList_PLM_MapStation_0                                         ;84B6D5;

PLMEntries_mapStationRightAccess:
    dw Setup_MapStationRightAccess                                       ;84B6D7;
    dw InstList_PLM_MapStationRightAccess                                ;84B6D9;

PLMEntries_mapStationLeftAccess:
    dw Setup_MapStationLeftAccess                                        ;84B6DB;
    dw InstList_PLM_MapStationLeftAccess                                 ;84B6DD;

PLMEntries_energyStation:
    dw Setup_EnergyStation                                               ;84B6DF;
    dw InstList_PLM_EnergyStation_0                                      ;84B6E1;

PLMEntries_energyStationRightAccess:
    dw Setup_EnergyStationRightAccess                                    ;84B6E3;
    dw InstList_PLM_EnergyStationRightAccess_0                           ;84B6E5;

PLMEntries_energyStationLeftAccess:
    dw Setup_EnergyStationLeftAccess                                     ;84B6E7;
    dw InstList_PLM_EnergyStationLeftAccess_0                            ;84B6E9;

PLMEntries_missileStation:
    dw Setup_MissileStation                                              ;84B6EB;
    dw InstList_PLM_MissileStation_0                                     ;84B6ED;

PLMEntries_missileStationRightAccess:
    dw Setup_MissileStationRightAccess                                   ;84B6EF;
    dw InstList_PLM_MissileStationRightAccess_0                          ;84B6F1;

PLMEntries_missileStationLeftAccess:
    dw Setup_MissileStationLeftAccess                                    ;84B6F3;
    dw InstList_PLM_MissileStationLeftAccess_0                           ;84B6F5;

PLMEntries_nothing_84B6F7:
    dw Setup_DeactivatePLM                                               ;84B6F7;
    dw InstList_PLM_Nothing_84AED6                                       ;84B6F9;

PLMEntries_nothing_84B6FB:
    dw Setup_DeactivatePLM                                               ;84B6FB;
    dw InstList_PLM_Nothing_84AF1C                                       ;84B6FD;

PLMEntries_scrollPLMTrigger:
    dw Setup_ScrollBlockTouchPLM                                         ;84B6FF;
    dw InstList_PLM_Delete                                               ;84B701;

PLMEntries_ScrollPLM:
    dw Setup_ScrollPLM                                                   ;84B703;
    dw InstList_PLM_ScrollPLM_0                                          ;84B705;

PLMEntries_unusedSolidScrollPLM:
    dw Setup_SolidScrollPLM                                              ;84B707;
    dw InstList_PLM_SolidScrollPLM_0                                     ;84B709;

PLMEntries_elevatorPlatform:
    dw Setup_DeactivatePLM                                               ;84B70B;
    dw InstList_PLM_ElevatorPlatform                                     ;84B70D;

PLMEntries_insideReactionCrateria80:
    dw Setup_IcePhysics                                                  ;84B70F;
    dw InstList_PLM_Delete                                               ;84B711;

PLMEntries_insideReactionQuicksandSurface:
    dw Setup_QuicksandSurface                                            ;84B713;
    dw InstList_PLM_Delete                                               ;84B715;

UNUSED_PLMEntries_84B717:
    dw Setup_QuicksandSurface                                            ;84B717;
    dw InstList_PLM_Delete                                               ;84B719;

UNUSED_PLMEntries_84B71B:
    dw Setup_QuicksandSurface                                            ;84B71B;
    dw InstList_PLM_Delete                                               ;84B71D;

PLMEntries_insideReactionSubmergingQuicksand:
    dw Setup_Inside_SubmergingQuicksand                                  ;84B71F;
    dw InstList_PLM_Delete                                               ;84B721;

PLMEntries_insideReactionSandFallsSlow:
    dw Setup_SandfallsSlow                                               ;84B723;
    dw InstList_PLM_Delete                                               ;84B725;

PLMEntries_insideReactionSandFallsFast:
    dw Setup_SandfallsFast                                               ;84B727;
    dw InstList_PLM_Delete                                               ;84B729;

PLMEntries_collisionReactionQuicksandSurface:
    dw Setup_QuicksandSurface_BTS85                                      ;84B72B;
    dw InstList_PLM_Delete                                               ;84B72D;

UNUSED_PLMEntries_84B72F:
    dw Setup_QuicksandSurface_BTS85                                      ;84B72F;
    dw InstList_PLM_Delete                                               ;84B731;

UNUSED_PLMEntries_84B733:
    dw Setup_QuicksandSurface_BTS85                                      ;84B733;
    dw InstList_PLM_Delete                                               ;84B735;

PLMEntries_collisionReactionSubmergingQuicksand:
    dw Setup_Collision_SubmergingQuicksand                               ;84B737;
    dw InstList_PLM_Delete                                               ;84B739;

PLMEntries_collisionReactionSandFallsSlow:
    dw Setup_CollisionReaction_SandFalls                                 ;84B73B;
    dw InstList_PLM_Delete                                               ;84B73D;

PLMEntries_collisionReactionSandFallsFast:
    dw Setup_CollisionReaction_SandFalls                                 ;84B73F;
    dw InstList_PLM_Delete                                               ;84B741;

UNUSED_PLMEntries_unusedTorizoDrool_84B743:
    dw UNUSED_Setup_TorizoDrool_84B3E3                                   ;84B743;
    dw InstList_PLM_Delete                                               ;84B745;

PLMEntries_clearCrocomiresBridge:
    dw Setup_DeactivatePLM                                               ;84B747;
    dw InstList_PLM_ClearCrocomiresBridge                                ;84B749;

PLMEntries_crumbleABlockOfCrocomiresBridge:
    dw Setup_DeactivatePLM                                               ;84B74B;
    dw InstList_PLM_CrumbleABlockOfCrocomiresBridge                      ;84B74D;

PLMEntries_clearABlockOfCrocomiresBridge:
    dw Setup_DeactivatePLM                                               ;84B74F;
    dw InstList_PLM_ClearABlockOfCrocomiresBridge                        ;84B751;

PLMEntries_clearCrocomireInvisibleWall:
    dw Setup_DeactivatePLM                                               ;84B753;
    dw InstList_PLM_ClearCrocomiresInvisibleWall                         ;84B755;

PLMEntries_createCrocomireInvisibleWall:
    dw Setup_DeactivatePLM                                               ;84B757;
    dw InstList_PLM_CreateCrocomiresInvisibleWall                        ;84B759;

PLMEntries_unusedDraw13BlankAirTiles:
    dw RTS_84B3CF                                                        ;84B75B;
    dw UNUSED_InstList_PLM_Draw13BlankAirTiles_84B03E                    ;84B75D;

PLMEntries_unusedDraw13BlankSolidTiles:
    dw RTS_84B3CF                                                        ;84B75F;
    dw UNUSED_InstList_PLM_Draw13BlankSolidTiles_84B044                  ;84B761;

PLMEntries_clearBabyMetroidInvisibleWall:
    dw Setup_ClearBabyMetroidInvisibleWall                               ;84B763;
    dw InstList_PLM_Delete                                               ;84B765;

PLMEntries_createBabyMetroidInvisibleWall:
    dw CreateBabyMetroidInvisibleWall                                    ;84B767;
    dw InstList_PLM_Delete                                               ;84B769;

PLMEntries_saveStationTrigger:
    dw Setup_CollisionReaction_SaveStationTrigger                        ;84B76B;
    dw InstList_PLM_Delete                                               ;84B76D;

PLMEntries_saveStation:
    dw Setup_SaveStation                                                 ;84B76F;
    dw InstList_PLM_SaveStation_0                                        ;84B771;

PLMEntries_crumbleAccessToTourianElevator:
    dw Setup_DeactivatePLM                                               ;84B773;
    dw InstList_PLM_CrumbleAccessToTourianElevator_0                     ;84B775;

PLMEntries_clearAccessToTourianElevator:
    dw Setup_DeactivatePLM                                               ;84B777;
    dw InstList_PLM_ClearAccessToTourianElevator                         ;84B779;

InstList_drawPhantoonsDoorDuringBossFight:
    dw $0001,DrawInst_DrawPhantoonsDoorDuringBossFight                   ;84B77B;
    dw Instruction_PLM_Delete                                            ;84B77F;

PLMEntries_drawPhantoonsDoorDuringBossFight:
    dw Setup_DeactivatePLM                                               ;84B781;
    dw InstList_drawPhantoonsDoorDuringBossFight                         ;84B783;

InstList_restorePhantoonsDoorDuringBossFight:
    dw $0001,DrawInst_RestorePhantoonsDoorDuringBossFight                ;84B785;
    dw Instruction_PLM_Delete                                            ;84B789;

PLMEntries_restorePhantoonsDoorDuringBossFight:
    dw Setup_DeactivatePLM                                               ;84B78B;
    dw InstList_restorePhantoonsDoorDuringBossFight                      ;84B78D;

PLMEntries_crumbleSporeSpawnCeiling:
    dw Setup_DeactivatePLM                                               ;84B78F;
    dw InstList_PLM_CrumbleSporeSpawnCeiling                             ;84B791;

PLMEntries_clearSporeSpawnCeiling:
    dw Setup_DeactivatePLM                                               ;84B793;
    dw InstList_PLM_ClearSporeSpawnCeiling                               ;84B795;

PLMEntries_clearBotwoonWall:
    dw RTS_84AB27                                                        ;84B797;
    dw InstList_PLM_ClearBotwoonWall                                     ;84B799;

PLMEntries_crumbleBotwoonWall:
    dw Setup_CrumbleBotwoonWall_Wait40Frames                             ;84B79B;
    dw InstList_PLM_CrumbleBotwoonWall_0                                 ;84B79D;

PLMEntries_unusedSetKraidCeilingBlockToBackground1:
    dw Setup_DeactivatePLM                                               ;84B79F;
    dw InstList_PLM_SetKraidCeilingBlockToBackground1                    ;84B7A1;

PLMEntries_crumbleKraidCeilingBlockIntoBackground1:
    dw Setup_DeactivatePLM                                               ;84B7A3;
    dw InstList_PLM_CrumbleKraidCeilingBlockIntoBackground1              ;84B7A5;

PLMEntries_setKraidCeilingBlockToBackground2:
    dw Setup_DeactivatePLM                                               ;84B7A7;
    dw InstList_PLM_SetKraidCeilingBlockToBackground2                    ;84B7A9;

PLMEntries_crumbleKraidCeilingBlockIntoBackground2:
    dw Setup_DeactivatePLM                                               ;84B7AB;
    dw InstList_PLM_CrumbleKraidCeilingBlockIntoBackground2              ;84B7AD;

PLMEntries_SetKraidCeilingBlockToBackground3:
    dw Setup_DeactivatePLM                                               ;84B7AF;
    dw InstList_PLM_SetKraidCeilingBlockToBackground3                    ;84B7B1;

PLMEntries_crumbleKraidCeilingBlockIntoBackground3:
    dw Setup_DeactivatePLM                                               ;84B7B3;
    dw InstList_PLM_CrumbleKraidCeilingBlockIntoBackground3              ;84B7B5;

PLMEntries_clearKraidCeilingBlocks:
    dw Setup_DeactivatePLM                                               ;84B7B7;
    dw InstList_PLM_ClearKraidCeiling                                    ;84B7B9;

PLMEntries_clearKraidSpikeBlocks:
    dw Setup_DeactivatePLM                                               ;84B7BB;
    dw InstList_PLM_ClearKraidSpikeBlocks                                ;84B7BD;

PLMEntries_crumbleKraidSpikeBlocks:
    dw Setup_DeactivatePLM                                               ;84B7BF;
    dw InstList_PLM_CrumbleKraidSpikeBlocks_0                            ;84B7C1;

Setup_EnableSoundsIn20Frames_F0FramesIfCeres:
    LDA.W $079F                                                          ;84B7C3;
    CMP.W #$0006                                                         ;84B7C6;
    BNE .ceres                                                           ;84B7C9;
    LDA.W #$0020                                                         ;84B7CB;
    BRA +                                                                ;84B7CE;


.ceres:
    LDA.W #$00F0                                                         ;84B7D0;

  + STA.W $1D77,Y                                                        ;84B7D3;
    LDA.W #PreInstruction_PLM_DecTimer_EnableSounds_DeletePLMIfZero      ;84B7D6;
    STA.W $1CD7,Y                                                        ;84B7D9;
    RTS                                                                  ;84B7DC;


PreInstruction_PLM_DecTimer_EnableSounds_DeletePLMIfZero:
    DEC.W $1D77,X                                                        ;84B7DD;
    BNE .return                                                          ;84B7E0;
    STZ.W $05F5                                                          ;84B7E2;
    STZ.W $1C37,X                                                        ;84B7E5;

.return:
    RTS                                                                  ;84B7E8;


InstList_PLM_EnableSoundsIn20Frames_F0FramesIfCeres:
    dw Instruction_PLM_Sleep                                             ;84B7E9;

PLMEntries_enableSoundsIn20Frames_F0FramesIfCeres:
    dw Setup_EnableSoundsIn20Frames_F0FramesIfCeres                      ;84B7EB;
    dw InstList_PLM_EnableSoundsIn20Frames_F0FramesIfCeres               ;84B7ED;

PreInst_PLM_WakePLM_StartLavaquakeIfSpeedBoosterCollected:
    LDA.W $09A4                                                          ;84B7EF;
    AND.W #$2000                                                         ;84B7F2;
    BNE .collectedSpeedBooster                                           ;84B7F5;
    LDA.W #$FFFF                                                         ;84B7F7;
    STA.W $197A                                                          ;84B7FA;
    STZ.W $197C                                                          ;84B7FD;
    STZ.W $1980                                                          ;84B800;
    STZ.W $1840                                                          ;84B803;
    STZ.W $1C37,X                                                        ;84B806;
    RTS                                                                  ;84B809;


.collectedSpeedBooster:
    LDA.W $197A                                                          ;84B80A;
    BMI .deletePLM                                                       ;84B80D;
    LDA.W #$FF80                                                         ;84B80F;
    STA.W $197C                                                          ;84B812;
    LDA.W #$0001                                                         ;84B815;
    STA.L $7EDE1C,X                                                      ;84B818;
    INC.W $1D27,X                                                        ;84B81C;
    INC.W $1D27,X                                                        ;84B81F;
    STZ.W $1D77,X                                                        ;84B822;
    RTS                                                                  ;84B825;


.deletePLM:
    STZ.W $1C37,X                                                        ;84B826;
    RTS                                                                  ;84B829;


PreInst_PLM_WakePLM_StartFXMotionIfSamusIsFarEnoughLeft:
    LDA.W #$0AE0                                                         ;84B82A;
    CMP.W $0AF6                                                          ;84B82D;
    BCC .return                                                          ;84B830;
    LDA.W #$0001                                                         ;84B832;
    STA.W $1980                                                          ;84B835;
    STA.L $7EDE1C,X                                                      ;84B838;
    INC.W $1D27,X                                                        ;84B83C;
    INC.W $1D27,X                                                        ;84B83F;
    STZ.W $1D77,X                                                        ;84B842;

.return:
    RTS                                                                  ;84B845;


PreInst_PLM_AdvanceLavaAsSamusMovesLeft_SetLavaquakeEvent:
    LDA.W $1D77,X                                                        ;84B846;
    TAY                                                                  ;84B849;
    LDA.W .targetSamusXpos,Y                                             ;84B84A;
    BMI .setLavaquake                                                    ;84B84D;
    CMP.W $0AF6                                                          ;84B84F;
    BCC .return                                                          ;84B852;
    LDA.W .maxFXYpos,Y                                                   ;84B854;
    CMP.W $1978                                                          ;84B857;
    BCS +                                                                ;84B85A;
    STA.W $1978                                                          ;84B85C;

  + LDA.W .FXYVelocity,Y                                                 ;84B85F;
    STA.W $197C                                                          ;84B862;
    TYA                                                                  ;84B865;
    CLC                                                                  ;84B866;
    ADC.W #$0006                                                         ;84B867;
    STA.W $1D77,X                                                        ;84B86A;

.return:
    RTS                                                                  ;84B86D;


.setLavaquake:
    LDA.W #$0015                                                         ;84B86E;
    JSL.L MarkEvent_inA                                                  ;84B871;
    RTS                                                                  ;84B875;

;        _______________ Target Samus X position
;       |      _________ Maximum FX Y position
;       |     |      ___ FX Y velocity
;       |     |     |
  .targetSamusXpos
    dw $072B                                                             ;84B876;
  .maxFXYpos
    dw       $01BF                                                       ;84B878;
  .FXYVelocity
    dw             $FF50                                                 ;84B87A;
    dw $050A,$0167,$FF20
    dw $0244,$0100,$FF20
    dw $8000

InstList_PLM_SpeedBoosterEscape:
    dw Instruction_PLM_PreInstruction_inY                                ;84B88A;
    dw PreInst_PLM_WakePLM_StartLavaquakeIfSpeedBoosterCollected         ;84B88C;
    dw Instruction_PLM_Sleep                                             ;84B88E;
    dw Instruction_PLM_PreInstruction_inY                                ;84B890;
    dw PreInst_PLM_WakePLM_StartFXMotionIfSamusIsFarEnoughLeft           ;84B892;
    dw Instruction_PLM_Sleep                                             ;84B894;
    dw Instruction_PLM_PreInstruction_inY                                ;84B896;
    dw PreInst_PLM_AdvanceLavaAsSamusMovesLeft_SetLavaquakeEvent         ;84B898;
    dw Instruction_PLM_Sleep                                             ;84B89A;

Setup_SpeedBoosterEscape:
    LDA.W #$0015                                                         ;84B89C;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;84B89F;
    BCC .return                                                          ;84B8A3;
    LDA.W #$0000                                                         ;84B8A5;
    STA.W $1C37,Y                                                        ;84B8A8;

.return:
    RTS                                                                  ;84B8AB;


PLMEntries_SpeedBoosterEscape:
    dw Setup_SpeedBoosterEscape                                          ;84B8AC;
    dw InstList_PLM_SpeedBoosterEscape                                   ;84B8AE;

PreInstruction_PLM_ShaktoolsRoom:
    LDA.W $0592                                                          ;84B8B0;
    BEQ .powerBombNotActive                                              ;84B8B3;
    LDA.W #$0101                                                         ;84B8B5;
    STA.L $7ECD20                                                        ;84B8B8;
    LDA.W #$0101                                                         ;84B8BC;
    STA.L $7ECD22                                                        ;84B8BF;

.powerBombNotActive:
    LDA.W #$0348                                                         ;84B8C3;
    CMP.W $0AF6                                                          ;84B8C6;
    BCS .return                                                          ;84B8C9;
    LDA.W #$000D                                                         ;84B8CB;
    JSL.L MarkEvent_inA                                                  ;84B8CE;
    STZ.W $1C37,X                                                        ;84B8D2;

.return:
    RTS                                                                  ;84B8D5;


InstList_PLM_ShaktoolsRoom:
    dw Instruction_PLM_PreInstruction_inY                                ;84B8D6;
    dw PreInstruction_PLM_ShaktoolsRoom                                  ;84B8D8;
    dw Instruction_PLM_Sleep                                             ;84B8DA;

Setup_ShaktoolsRoom:
    LDA.W #$0001                                                         ;84B8DC;
    STA.L $7ECD20                                                        ;84B8DF;
    LDA.W #$0000                                                         ;84B8E3;
    STA.L $7ECD22                                                        ;84B8E6;
    RTS                                                                  ;84B8EA;


PLMEntries_shaktoolsRoom:
    dw Setup_ShaktoolsRoom                                               ;84B8EB;
    dw InstList_PLM_ShaktoolsRoom                                        ;84B8ED;

Setup_MaridiaElevatube:
    RTS                                                                  ;84B8EF;


InstList_PLM_MaridiaElevatube:
    dw $0010                                                             ;84B8F0;
    dw DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_Elevatube         ;84B8F2;
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6                            ;84B8F4;
    db $15                                                               ;84B8F6;
    dw Instruction_PLM_Delete                                            ;84B8F7;

PLMEntries_maridiaElevatube:
    dw Setup_MaridiaElevatube                                            ;84B8F9;
    dw InstList_PLM_MaridiaElevatube                                     ;84B8FB;

WakePLMIfSamusIsBelowRightOfTarget:
    LDA.B $12                                                            ;84B8FD;
    CMP.W $0AF6                                                          ;84B8FF;
    BCS .return                                                          ;84B902;
    LDA.B $14                                                            ;84B904;
    CMP.W $0AFA                                                          ;84B906;
    BCS .return                                                          ;84B909;
    INC.W $1D27,X                                                        ;84B90B;
    INC.W $1D27,X                                                        ;84B90E;
    LDA.W #$0001                                                         ;84B911;
    STA.L $7EDE1C,X                                                      ;84B914;

.return:
    RTS                                                                  ;84B918;


InstList_PLM_MakeOldTourianEscapeShaftFakeWallExplode:
    dw Instruction_PLM_PreInstruction_inY                                ;84B919;
    dw PreInstruction_PLM_MakeOldTourianEscapeShaftFakeWallExplode       ;84B91B;
    dw Instruction_PLM_Sleep                                             ;84B91D;
    dw Instruction_PLM_ClearPreInstruction                               ;84B91F;
    dw $0001                                                             ;84B921;
    dw DrawInst_OldTourianEscapeShaftBlocks                              ;84B923;
    dw Instruction_PLM_Delete                                            ;84B925;

PreInstruction_PLM_MakeOldTourianEscapeShaftFakeWallExplode:
    LDA.W #$00F0                                                         ;84B927;
    STA.B $12                                                            ;84B92A;
    LDA.W #$0820                                                         ;84B92C;
    STA.B $14                                                            ;84B92F;
    JSR.W WakePLMIfSamusIsBelowRightOfTarget                             ;84B931;
    BCS .return                                                          ;84B934;
    PHY                                                                  ;84B936;
    LDY.W #EnemyProjectile_OldTourianEscapeShaftFakeWallExplosion        ;84B937;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84B93A;
    PLY                                                                  ;84B93E;

.return:
    RTS                                                                  ;84B93F;


InstList_PLM_RaiseAcidInEscapeBeforeOldTourianEscapeShaft:
    dw Instruction_PLM_PreInstruction_inY                                ;84B940;
    dw PreInst_PLM_RaiseAcidInEscapeRoomBeforeOldTourianEscapeShaft      ;84B942;
    dw Instruction_PLM_Sleep                                             ;84B944;
    dw Instruction_PLM_Delete                                            ;84B946;

PreInst_PLM_RaiseAcidInEscapeRoomBeforeOldTourianEscapeShaft:
    LDA.W #$00F0                                                         ;84B948;
    STA.B $12                                                            ;84B94B;
    LDA.W #$0540                                                         ;84B94D;
    STA.B $14                                                            ;84B950;
    JSR.W WakePLMIfSamusIsBelowRightOfTarget                             ;84B952;
    BCS .return                                                          ;84B955;
    LDA.W #$FF98                                                         ;84B957;
    STA.W $197C                                                          ;84B95A;
    LDA.W #$0010                                                         ;84B95D;
    STA.W $1980                                                          ;84B960;

.return:
    RTS                                                                  ;84B963;


PLMEntries_MakeOldTourianEscapeShaftFakeWallExplode:
    dw Setup_DeactivatePLM                                               ;84B964;
    dw InstList_PLM_MakeOldTourianEscapeShaftFakeWallExplode             ;84B966;

PLMEntries_RaiseAcidInEscapeRoomBeforeOldTourianEscapeShaft:
    dw Setup_DeactivatePLM                                               ;84B968;
    dw InstList_PLM_RaiseAcidInEscapeBeforeOldTourianEscapeShaft         ;84B96A;

Setup_GateBlock:
    STZ.B $26                                                            ;84B96C;
    LDA.W #$FFFF                                                         ;84B96E;
    STA.B $28                                                            ;84B971;
    RTS                                                                  ;84B973;


PLMEntries_gateBlock:
    dw Setup_GateBlock                                                   ;84B974;
    dw InstList_PLM_Delete                                               ;84B976;

Setup_Reaction_CrittersEscapeBlock:
    LDX.W $0DDE                                                          ;84B978;
    LDA.W $0C18,X                                                        ;84B97B;
    BNE .projectile                                                      ;84B97E;
    AND.W #$0F00                                                         ;84B980;
    LDA.W #$0000                                                         ;84B983;
    STA.W $1C37,Y                                                        ;84B986;
    RTS                                                                  ;84B989;


.projectile:
    LDX.W $1C87,Y                                                        ;84B98A;
    LDA.L $7F0002,X                                                      ;84B98D;
    AND.W #$F000                                                         ;84B991;
    ORA.W #$009F                                                         ;84B994;
    STA.W $1E17,Y                                                        ;84B997;
    AND.W #$8FFF                                                         ;84B99A;
    STA.L $7F0002,X                                                      ;84B99D;
    RTS                                                                  ;84B9A1;


InstList_PLM_CrittersEscapeBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6                            ;84B9A2;
    db $0A                                                               ;84B9A4;
    dw $0004                                                             ;84B9A5;
    dw DrawInst_CrittersEscapeBlock_0                                    ;84B9A7;
    dw $0004                                                             ;84B9A9;
    dw DrawInst_CrittersEscapeBlock_1                                    ;84B9AB;
    dw $0004                                                             ;84B9AD;
    dw DrawInst_CrittersEscapeBlock_2                                    ;84B9AF;
    dw $0001                                                             ;84B9B1;
    dw DrawInst_CrittersEscapeBlock_3                                    ;84B9B3;
    dw Instruction_PLM_SetCrittersEscapedEvent                           ;84B9B5;
    dw Instruction_PLM_Delete                                            ;84B9B7;

Instruction_PLM_SetCrittersEscapedEvent:
    LDA.W #$000F                                                         ;84B9B9;
    JSL.L MarkEvent_inA                                                  ;84B9BC;
    RTS                                                                  ;84B9C0;


PLMEntries_Reaction_CrittersEscapeBlock:
    dw Setup_Reaction_CrittersEscapeBlock                                ;84B9C1;
    dw InstList_PLM_CrittersEscapeBlock                                  ;84B9C3;

Setup_CrittersEscapeBlock:
    LDX.W $1C87,Y                                                        ;84B9C5;
    LDA.W #$C04F                                                         ;84B9C8;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84B9CB;
    TXA                                                                  ;84B9CE;
    CLC                                                                  ;84B9CF;
    ADC.W $07A5                                                          ;84B9D0;
    ADC.W $07A5                                                          ;84B9D3;
    TAX                                                                  ;84B9D6;
    LDA.W #$D0FF                                                         ;84B9D7;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84B9DA;
    TXA                                                                  ;84B9DD;
    CLC                                                                  ;84B9DE;
    ADC.W $07A5                                                          ;84B9DF;
    ADC.W $07A5                                                          ;84B9E2;
    TAX                                                                  ;84B9E5;
    LDA.W #$D0FF                                                         ;84B9E6;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84B9E9;
    RTS                                                                  ;84B9EC;


PLMEntries_CrittersEscapeBlock:
    dw Setup_CrittersEscapeBlock                                         ;84B9ED;
    dw InstList_PLM_Delete                                               ;84B9EF;

Setup_TurnCeresElevatorDoorToSolidBlocksDuringEscape:
    LDX.W $1C87,Y                                                        ;84B9F1;
    LDA.L $7F0002,X                                                      ;84B9F4;
    AND.W #$0FFF                                                         ;84B9F8;
    ORA.W #$8000                                                         ;84B9FB;
    STA.L $7F0002,X                                                      ;84B9FE;
    TXA                                                                  ;84BA02;
    CLC                                                                  ;84BA03;
    ADC.W $07A5                                                          ;84BA04;
    ADC.W $07A5                                                          ;84BA07;
    TAX                                                                  ;84BA0A;
    LDA.L $7F0002,X                                                      ;84BA0B;
    AND.W #$0FFF                                                         ;84BA0F;
    ORA.W #$8000                                                         ;84BA12;
    STA.L $7F0002,X                                                      ;84BA15;
    TXA                                                                  ;84BA19;
    CLC                                                                  ;84BA1A;
    ADC.W $07A5                                                          ;84BA1B;
    ADC.W $07A5                                                          ;84BA1E;
    TAX                                                                  ;84BA21;
    LDA.L $7F0002,X                                                      ;84BA22;
    AND.W #$0FFF                                                         ;84BA26;
    ORA.W #$8000                                                         ;84BA29;
    STA.L $7F0002,X                                                      ;84BA2C;
    TXA                                                                  ;84BA30;
    CLC                                                                  ;84BA31;
    ADC.W $07A5                                                          ;84BA32;
    ADC.W $07A5                                                          ;84BA35;
    TAX                                                                  ;84BA38;
    LDA.L $7F0002,X                                                      ;84BA39;
    AND.W #$0FFF                                                         ;84BA3D;
    ORA.W #$8000                                                         ;84BA40;
    STA.L $7F0002,X                                                      ;84BA43;
    RTS                                                                  ;84BA47;


PLMEntries_turnCeresElevatorDoorToSolidBlocksDuringEscape:
    dw Setup_TurnCeresElevatorDoorToSolidBlocksDuringEscape              ;84BA48;
    dw InstList_PLM_Delete                                               ;84BA4A;

InstList_PLM_BombTorizoGreyDoor:
    dw $0002                                                             ;84BA4C;
    dw DrawInst_DoorFacingRight_A683                                     ;84BA4E;
    dw Instruction_PLM_GotoYIfSamusDoesntHaveBombs                       ;84BA50;
    dw InstList_PLM_BombTorizoGreyDoor                                   ;84BA52;
    dw $0028                                                             ;84BA54;
    dw DrawInst_DoorFacingRight_A683                                     ;84BA56;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84BA58;
    db $08                                                               ;84BA5A;
    dw $0002                                                             ;84BA5B;
    dw DrawInst_GreyDoorFacingRight_3                                    ;84BA5D;
    dw $0002                                                             ;84BA5F;
    dw DrawInst_GreyDoorFacingRight_2                                    ;84BA61;
    dw $0002                                                             ;84BA63;
    dw DrawInst_GreyDoorFacingRight_1                                    ;84BA65;
    dw $0001                                                             ;84BA67;
    dw DrawInst_GreyDoorFacingRight_0                                    ;84BA69;
    dw Instruction_PLM_GotoY                                             ;84BA6B;
    dw InstList_PLM_BombTorizoGreyDoor_0                                 ;84BA6D;

Instruction_PLM_GotoYIfSamusDoesntHaveBombs:
    LDA.W $09A4                                                          ;84BA6F;
    BIT.W #$1000                                                         ;84BA72;
    BEQ .noBombs                                                         ;84BA75;
    INY                                                                  ;84BA77;
    INY                                                                  ;84BA78;
    RTS                                                                  ;84BA79;


.noBombs:
    LDA.W $0000,Y                                                        ;84BA7A;
    TAY                                                                  ;84BA7D;
    RTS                                                                  ;84BA7E;


InstList_PLM_BombTorizoGreyDoor_0:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84BA7F;
    dw InstList_PLM_ClosedBlueDoorFacingLeft_41                          ;84BA81;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84BA83;
    dw InstList_PLM_BombTorizoGreyDoor_2                                 ;84BA85;
    dw Instruction_PLM_SetGreyDoorPreInstruction                         ;84BA87;
    dw $0001                                                             ;84BA89;
    dw DrawInst_GreyDoorFacingRight_0                                    ;84BA8B;

InstList_PLM_BombTorizoGreyDoor_1:
    dw Instruction_PLM_Sleep                                             ;84BA8D;
    dw Instruction_PLM_GotoY                                             ;84BA8F;
    dw InstList_PLM_BombTorizoGreyDoor_1                                 ;84BA91;

InstList_PLM_BombTorizoGreyDoor_2:
    dw Instruction_PLM_LinkInstruction_Y                                 ;84BA93;
    dw InstList_PLM_BombTorizoGreyDoor_4                                 ;84BA95;
    dw Instruction_PLM_PreInstruction_inY                                ;84BA97;
    dw PreInstruction_PLM_GotoLinkInstructionIfShot                      ;84BA99;

InstList_PLM_BombTorizoGreyDoor_3:
    dw $0003                                                             ;84BA9B;
    dw DrawInst_DoorFacingRight_A9EF                                     ;84BA9D;
    dw $0004                                                             ;84BA9F;
    dw DrawInst_GreyDoorFacingRight_0                                    ;84BAA1;
    dw $0003                                                             ;84BAA3;
    dw DrawInst_DoorFacingRight_A9EF                                     ;84BAA5;
    dw $0004                                                             ;84BAA7;
    dw DrawInst_GreyDoorFacingRight_0                                    ;84BAA9;
    dw $0003                                                             ;84BAAB;
    dw DrawInst_DoorFacingRight_A9EF                                     ;84BAAD;
    dw $0004                                                             ;84BAAF;
    dw DrawInst_GreyDoorFacingRight_0                                    ;84BAB1;
    dw Instruction_PLM_GotoY                                             ;84BAB3;
    dw InstList_PLM_BombTorizoGreyDoor_3                                 ;84BAB5;

InstList_PLM_BombTorizoGreyDoor_4:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY                   ;84BAB7;
    db $01                                                               ;84BAB9;
    dw InstList_PLM_BombTorizoGreyDoor_5                                 ;84BABA;

InstList_PLM_BombTorizoGreyDoor_5:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84BABC;
    db $07                                                               ;84BABE;
    dw $0004                                                             ;84BABF;
    dw DrawInst_GreyDoorFacingRight_1                                    ;84BAC1;
    dw $0004                                                             ;84BAC3;
    dw DrawInst_GreyDoorFacingRight_2                                    ;84BAC5;
    dw $0004                                                             ;84BAC7;
    dw DrawInst_GreyDoorFacingRight_3                                    ;84BAC9;
    dw $0001                                                             ;84BACB;
    dw DrawInst_DoorFacingRight_A683                                     ;84BACD;
    dw Instruction_PLM_Delete                                            ;84BACF;

UNUSED_Setup_84BAD1:
    LDA.W $1DC8,Y                                                        ;84BAD1;
    AND.W #$007C                                                         ;84BAD4;
    LSR A                                                                ;84BAD7;
    LDA.W #$0004                                                         ;84BAD8;
    STA.W $1E17,Y                                                        ;84BADB;
    LDA.W $1DC7,Y                                                        ;84BADE;
    AND.W #$83FF                                                         ;84BAE1;
    ORA.W #$8000                                                         ;84BAE4;
    STA.W $1DC7,Y                                                        ;84BAE7;
    LDX.W $1C87,Y                                                        ;84BAEA;
    LDA.W #$C044                                                         ;84BAED;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84BAF0;
    RTS                                                                  ;84BAF3;


PLMEntries_bombTorizoGreyDoor:
    dw Setup_GreyDoor                                                    ;84BAF4;
    dw InstList_PLM_BombTorizoGreyDoor_0                                 ;84BAF6;
    dw InstList_PLM_BombTorizoGreyDoor                                   ;84BAF8;

Setup_WreckedShipAttic:
    SEP #$20                                                             ;84BAFA;
    REP #$20                                                             ;84BAFC;
    RTS                                                                  ;84BAFE;


InstList_PLM_WreckedShipAttic:
    dw Instruction_PLM_PreInstruction_inY                                ;84BAFF;
    dw Setup_WreckedShipAttic                                            ;84BB01;
    dw Instruction_PLM_Sleep                                             ;84BB03;

PLMEntries_wreckedShipAttic:
    dw Setup_WreckedShipAttic                                            ;84BB05;
    dw InstList_PLM_WreckedShipAttic                                     ;84BB07;

Setup_ClearCrateriaMainstreetEscapePassageIfCrittersEscaped:
    LDA.W #$000F                                                         ;84BB09;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;84BB0C;
    BCS .return                                                          ;84BB10;
    LDA.W #$0000                                                         ;84BB12;
    STA.W $1C37,Y                                                        ;84BB15;

.return:
    RTS                                                                  ;84BB18;


InstList_PLM_ClearCrateriaMainstreetEscPassageIfCrittersEsc:
    dw $0001                                                             ;84BB19;
    dw DrawInst_CrateriaMainStreetEscape                                 ;84BB1B;
    dw Instruction_PLM_MovePLMRight4Blocks                               ;84BB1D;
    dw $0001                                                             ;84BB1F;
    dw DrawInst_CrateriaMainStreetEscape                                 ;84BB21;
    dw Instruction_PLM_Delete                                            ;84BB23;

Instruction_PLM_MovePLMRight4Blocks:
    LDA.W $1C87,X                                                        ;84BB25;
    CLC                                                                  ;84BB28;
    ADC.W #$0008                                                         ;84BB29;
    STA.W $1C87,X                                                        ;84BB2C;
    RTS                                                                  ;84BB2F;


PLMEntries_ClearCrateriaMainstreetEscapePassageIfCrittersEsc:
    dw Setup_ClearCrateriaMainstreetEscapePassageIfCrittersEscaped       ;84BB30;
    dw InstList_PLM_ClearCrateriaMainstreetEscPassageIfCrittersEsc       ;84BB32;

InstList_PLM_GateThatClosesDuringEscapeAfterMotherBrain_0:
    dw $0006                                                             ;84BB34;
    dw DrawInst_EscapeRoom1Gate_2                                        ;84BB36;
    dw Instruction_PLM_Delete                                            ;84BB38;

UNUSED_InstList_84BB34:
    dw $0006                                                             ;84BB3A;
    dw DrawInst_EscapeRoom1Gate_1                                        ;84BB3C;
    dw $005E                                                             ;84BB3E;
    dw DrawInst_EscapeRoom1Gate_0                                        ;84BB40;
    dw Instruction_PLM_Delete                                            ;84BB42;

InstList_PLM_GateThatClosesDuringEscapeAfterMotherBrain_1:
    dw $0002                                                             ;84BB44;
    dw DrawInst_EscapeRoom1Gate_0                                        ;84BB46;
    dw $0002                                                             ;84BB48;
    dw DrawInst_EscapeRoom1Gate_1                                        ;84BB4A;
    dw $0002                                                             ;84BB4C;
    dw DrawInst_EscapeRoom1Gate_2                                        ;84BB4E;
    dw Instruction_PLM_Delete                                            ;84BB50;

PreInstruction_PLM_WakePLMIfTriggered:
    LDA.W $1D77,X                                                        ;84BB52;
    BEQ .return                                                          ;84BB55;
    INC.W $1D27,X                                                        ;84BB57;
    INC.W $1D27,X                                                        ;84BB5A;
    LDA.W #$0001                                                         ;84BB5D;
    STA.L $7EDE1C,X                                                      ;84BB60;
    LDA.W #.return                                                       ;84BB64;
    STA.W $1CD7,X                                                        ;84BB67;

.return:
    RTS                                                                  ;84BB6A;


PreInst_PLM_WakePLMIfTriggeredOrSamusWithin4BlockColumnBelow:
    JSL.L Calculate_PLM_Block_Coordinates                                ;84BB6B;
    LDA.W $0AF6                                                          ;84BB6F;
    LSR A                                                                ;84BB72;
    LSR A                                                                ;84BB73;
    LSR A                                                                ;84BB74;
    LSR A                                                                ;84BB75;
    CMP.W $1C29                                                          ;84BB76;
    BNE +                                                                ;84BB79;
    LDA.W $0AFA                                                          ;84BB7B;
    LSR A                                                                ;84BB7E;
    LSR A                                                                ;84BB7F;
    LSR A                                                                ;84BB80;
    LSR A                                                                ;84BB81;
    SEC                                                                  ;84BB82;
    SBC.W $1C2B                                                          ;84BB83;
    CMP.W #$0005                                                         ;84BB86;
    BCC .triggered                                                       ;84BB89;

  + LDA.W $1D77,X                                                        ;84BB8B;
    BEQ .return                                                          ;84BB8E;

.triggered:
    INC.W $1D27,X                                                        ;84BB90;
    INC.W $1D27,X                                                        ;84BB93;
    LDA.W #$0001                                                         ;84BB96;
    STA.L $7EDE1C,X                                                      ;84BB99;
    LDA.W #.return                                                       ;84BB9D;
    STA.W $1CD7,X                                                        ;84BBA0;

.return:
    RTS                                                                  ;84BBA3;


PreInst_PLM_WakePLMIfTriggeredOrSamusWithin4BlockColumnAbove:
    JSL.L Calculate_PLM_Block_Coordinates                                ;84BBA4;
    LDA.W $0AF6                                                          ;84BBA8;
    LSR A                                                                ;84BBAB;
    LSR A                                                                ;84BBAC;
    LSR A                                                                ;84BBAD;
    LSR A                                                                ;84BBAE;
    CMP.W $1C29                                                          ;84BBAF;
    BNE +                                                                ;84BBB2;
    LDA.W $0AFA                                                          ;84BBB4;
    LSR A                                                                ;84BBB7;
    LSR A                                                                ;84BBB8;
    LSR A                                                                ;84BBB9;
    LSR A                                                                ;84BBBA;
    SEC                                                                  ;84BBBB;
    SBC.W $1C2B                                                          ;84BBBC;
    CMP.W #$FFFC                                                         ;84BBBF;
    BCS .triggered                                                       ;84BBC2;

  + LDA.W $1D77,X                                                        ;84BBC4;
    BEQ .return                                                          ;84BBC7;

.triggered:
    INC.W $1D27,X                                                        ;84BBC9;
    INC.W $1D27,X                                                        ;84BBCC;
    LDA.W #$0001                                                         ;84BBCF;
    STA.L $7EDE1C,X                                                      ;84BBD2;
    LDA.W #.return                                                       ;84BBD6;
    STA.W $1CD7,X                                                        ;84BBD9;

.return:
    RTS                                                                  ;84BBDC;


Instruction_PLM_ClearTrigger:
    STZ.W $1D77,X                                                        ;84BBDD;
    RTS                                                                  ;84BBE0;


Instruction_PLM_SpawnEnemyProjectileY:
    PHX                                                                  ;84BBE1;
    PHY                                                                  ;84BBE2;
    LDA.W $0000,Y                                                        ;84BBE3;
    TAY                                                                  ;84BBE6;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84BBE7;
    PLY                                                                  ;84BBEB;
    PLX                                                                  ;84BBEC;
    INY                                                                  ;84BBED;
    INY                                                                  ;84BBEE;
    RTS                                                                  ;84BBEF;


Instruction_PLM_WakeEnemyProjectileAtPLMsPosition:
    PHX                                                                  ;84BBF0;
    PHY                                                                  ;84BBF1;
    LDA.W $1C87,X                                                        ;84BBF2;
    LDX.W #$0022                                                         ;84BBF5;

.loop:
    CMP.W $1AFF,X                                                        ;84BBF8;
    BEQ .found                                                           ;84BBFB;
    DEX                                                                  ;84BBFD;
    DEX                                                                  ;84BBFE;
    BPL .loop                                                            ;84BBFF;
    db $00                                                               ;84BC01; BRK with no operand

.found:
    LDA.W #$0001                                                         ;84BC02;
    STA.W $1B8F,X                                                        ;84BC05;
    INC.W $1B47,X                                                        ;84BC08;
    INC.W $1B47,X                                                        ;84BC0B;
    PLY                                                                  ;84BC0E;
    PLX                                                                  ;84BC0F;
    INY                                                                  ;84BC10;
    INY                                                                  ;84BC11;
    RTS                                                                  ;84BC12;


InstList_PLM_DownwardsOpenGate:
    dw $0001                                                             ;84BC13;
    dw DrawInst_DownwardsGateOpen                                        ;84BC15;
    dw Instruction_PLM_ClearTrigger                                      ;84BC17;
    dw Instruction_PLM_PreInstruction_inY                                ;84BC19;
    dw PreInstruction_PLM_WakePLMIfTriggered                             ;84BC1B;
    dw Instruction_PLM_Sleep                                             ;84BC1D;
    dw $0010                                                             ;84BC1F;
    dw DrawInst_DownwardsGateOpen                                        ;84BC21;
    dw Instruction_PLM_SpawnEnemyProjectileY                             ;84BC23;
    dw EnemyProjectile_SpawnedDownwardsShotGate                          ;84BC25;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84BC27;
    db $0E                                                               ;84BC29;
    dw $0010                                                             ;84BC2A;
    dw DrawInst_DownwardsGateOpenClosed_0                                ;84BC2C;
    dw $0010                                                             ;84BC2E;
    dw DrawInst_DownwardsGateOpenClosed_1                                ;84BC30;
    dw $0010                                                             ;84BC32;
    dw DrawInst_DownwardsGateOpenClosed_2                                ;84BC34;
    dw $0018                                                             ;84BC36;
    dw DrawInst_DownwardsGateOpenClosed_3                                ;84BC38;

InstList_PLM_DownwardsClosedGate:
    dw $0001                                                             ;84BC3A;
    dw DrawInst_DownwardsGateClosed                                      ;84BC3C;
    dw Instruction_PLM_ClearTrigger                                      ;84BC3E;
    dw Instruction_PLM_PreInstruction_inY                                ;84BC40;
    dw PreInst_PLM_WakePLMIfTriggeredOrSamusWithin4BlockColumnBelow      ;84BC42;
    dw Instruction_PLM_Sleep                                             ;84BC44;
    dw Instruction_PLM_WakeEnemyProjectileAtPLMsPosition                 ;84BC46;
    dw $E566                                                             ;84BC48;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84BC4A;
    db $0E                                                               ;84BC4C;
    dw $0010                                                             ;84BC4D;
    dw DrawInst_DownwardsGateOpenClosed_3                                ;84BC4F;
    dw $0010                                                             ;84BC51;
    dw DrawInst_DownwardsGateOpenClosed_2                                ;84BC53;
    dw $0010                                                             ;84BC55;
    dw DrawInst_DownwardsGateOpenClosed_1                                ;84BC57;
    dw $0018                                                             ;84BC59;
    dw DrawInst_DownwardsGateOpenClosed_0                                ;84BC5B;
    dw Instruction_PLM_GotoY                                             ;84BC5D;
    dw InstList_PLM_DownwardsOpenGate                                    ;84BC5F;

InstList_PLM_UpwardsOpenGate:
    dw $0008                                                             ;84BC61;
    dw DrawInst_UpwardsGateOpen                                          ;84BC63;
    dw Instruction_PLM_ClearTrigger                                      ;84BC65;
    dw Instruction_PLM_PreInstruction_inY                                ;84BC67;
    dw PreInstruction_PLM_WakePLMIfTriggered                             ;84BC69;
    dw Instruction_PLM_Sleep                                             ;84BC6B;
    dw $0010                                                             ;84BC6D;
    dw DrawInst_UpwardsGateOpen                                          ;84BC6F;
    dw Instruction_PLM_SpawnEnemyProjectileY                             ;84BC71;
    dw EnemyProjectile_SpawnedUpwardsShotGate                            ;84BC73;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84BC75;
    db $0E                                                               ;84BC77;
    dw $0010                                                             ;84BC78;
    dw DrawInst_UpwardsGateOpenClosed_0                                  ;84BC7A;
    dw $0010                                                             ;84BC7C;
    dw DrawInst_UpwardsGateOpenClosed_1                                  ;84BC7E;
    dw $0010                                                             ;84BC80;
    dw DrawInst_UpwardsGateOpenClosed_2                                  ;84BC82;
    dw $0010                                                             ;84BC84;
    dw DrawInst_UpwardsGateOpenClosed_3                                  ;84BC86;

InstList_PLM_UpwardsClosedGate:
    dw $0008                                                             ;84BC88;
    dw DrawInst_UpwardsGateClosed                                        ;84BC8A;
    dw Instruction_PLM_ClearTrigger                                      ;84BC8C;
    dw Instruction_PLM_PreInstruction_inY                                ;84BC8E;
    dw PreInst_PLM_WakePLMIfTriggeredOrSamusWithin4BlockColumnAbove      ;84BC90;

InstList_PLM_UpwardsClosedGate_sleep:
    dw Instruction_PLM_Sleep                                             ;84BC92;
    dw Instruction_PLM_WakeEnemyProjectileAtPLMsPosition                 ;84BC94;
    dw $E5B0                                                             ;84BC96;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84BC98;
    db $0E                                                               ;84BC9A;
    dw $0010                                                             ;84BC9B;
    dw DrawInst_UpwardsGateOpenClosed_3                                  ;84BC9D;
    dw $0010                                                             ;84BC9F;
    dw DrawInst_UpwardsGateOpenClosed_2                                  ;84BCA1;
    dw $0010                                                             ;84BCA3;
    dw DrawInst_UpwardsGateOpenClosed_1                                  ;84BCA5;
    dw $0010                                                             ;84BCA7;
    dw DrawInst_UpwardsGateOpenClosed_0                                  ;84BCA9;
    dw Instruction_PLM_GotoY                                             ;84BCAB;
    dw InstList_PLM_UpwardsOpenGate                                      ;84BCAD;

InstList_PLM_DownwardsGateShotblock_BlueLeft:
    dw $0001                                                             ;84BCAF;
    dw DrawInst_GateShotblockDownwardsBlueLeft                           ;84BCB1;
    dw Instruction_PLM_Delete                                            ;84BCB3;

InstList_PLM_DownwardsGateShotblock_BlueRight:
    dw $0001                                                             ;84BCB5;
    dw DrawInst_GateShotblockDownwardsBlueRight                          ;84BCB7;
    dw Instruction_PLM_Delete                                            ;84BCB9;

InstList_PLM_DownwardsGateShotblock_RedLeft:
    dw $0001                                                             ;84BCBB;
    dw DrawInst_GateShotblockDownwardsRedLeft                            ;84BCBD;
    dw Instruction_PLM_Delete                                            ;84BCBF;

InstList_PLM_DownwardsGateShotblock_RedRight:
    dw $0001                                                             ;84BCC1;
    dw DrawInst_GateShotblockDownwardsRedRight                           ;84BCC3;
    dw Instruction_PLM_Delete                                            ;84BCC5;

InstList_PLM_DownwardsGateShotblock_GreenLeft:
    dw $0001                                                             ;84BCC7;
    dw DrawInst_GateShotblockDownwardsGreenLeft                          ;84BCC9;
    dw Instruction_PLM_Delete                                            ;84BCCB;

InstList_PLM_DownwardsGateShotblock_GreenRight:
    dw $0001                                                             ;84BCCD;
    dw DrawInst_GateShotblockDownwardsGreenRight                         ;84BCCF;
    dw Instruction_PLM_Delete                                            ;84BCD1;

InstList_PLM_DownwardsGateShotblock_YellowLeft:
    dw $0001                                                             ;84BCD3;
    dw DrawInst_GateShotblockDownwardsYellowLeft                         ;84BCD5;
    dw Instruction_PLM_Delete                                            ;84BCD7;

InstList_PLM_DownwardsGateShotblock_YellowRight:
    dw $0001                                                             ;84BCD9;
    dw DrawInst_GateShotblockDownwardsYellowRight                        ;84BCDB;
    dw Instruction_PLM_Delete                                            ;84BCDD;

InstList_PLM_UpwardsGateShotblock_BlueLeft:
    dw $0001                                                             ;84BCDF;
    dw DrawInst_GateShotblockUpwardsBlueLeft                             ;84BCE1;
    dw Instruction_PLM_Delete                                            ;84BCE3;

InstList_PLM_UpwardsGateShotblock_BlueRight:
    dw $0001                                                             ;84BCE5;
    dw DrawInst_GateShotblockUpwardsBlueRight                            ;84BCE7;
    dw Instruction_PLM_Delete                                            ;84BCE9;

InstList_PLM_UpwardsGateShotblock_RedLeft:
    dw $0001                                                             ;84BCEB;
    dw DrawInst_GateShotblockUpwardsRedLeft                              ;84BCED;
    dw Instruction_PLM_Delete                                            ;84BCEF;

InstList_PLM_UpwardsGateShotblock_RedRight:
    dw $0001                                                             ;84BCF1;
    dw DrawInst_GateShotblockUpwardsRedRight                             ;84BCF3;
    dw Instruction_PLM_Delete                                            ;84BCF5;

InstList_PLM_UpwardsGateShotblock_GreenLeft:
    dw $0001                                                             ;84BCF7;
    dw DrawInst_GateShotblockUpwardsGreenLeft                            ;84BCF9;
    dw Instruction_PLM_Delete                                            ;84BCFB;

InstList_PLM_UpwardsGateShotblock_GreenRight:
    dw $0001                                                             ;84BCFD;
    dw DrawInst_GateShotblockUpwardsGreenRight                           ;84BCFF;
    dw Instruction_PLM_Delete                                            ;84BD01;

InstList_PLM_UpwardsGateShotblock_YellowLeft:
    dw $0001                                                             ;84BD03;
    dw DrawInst_GateShotblockUpwardsYellowLeft                           ;84BD05;
    dw Instruction_PLM_Delete                                            ;84BD07;

InstList_PLM_UpwardsGateShotblock_YellowRight:
    dw $0001                                                             ;84BD09;
    dw DrawInst_GateShotblockUpwardsYellowRight                          ;84BD0B;
    dw Instruction_PLM_Delete                                            ;84BD0D;

PreInstruction_PLM_GotoLinkInstructionIfShot:
    LDA.W $1D77,X                                                        ;84BD0F;
    BEQ .return                                                          ;84BD12;
    STZ.W $1D77,X                                                        ;84BD14;
    LDA.L $7EDEBC,X                                                      ;84BD17;
    STA.W $1D27,X                                                        ;84BD1B;
    LDA.W #$0001                                                         ;84BD1E;
    STA.L $7EDE1C,X                                                      ;84BD21;

.return:
    RTS                                                                  ;84BD25;


PreInstruction_PLM_GotoLinkInstructionIfHitWithPowerBomb:
    LDA.W $1D77,X                                                        ;84BD26;
    BEQ .clearPLMShotStatus                                              ;84BD29;
    AND.W #$0F00                                                         ;84BD2B;
    CMP.W #$0300                                                         ;84BD2E;
    BNE .playSFX                                                         ;84BD31;
    STZ.W $1D77,X                                                        ;84BD33;
    LDA.L $7EDEBC,X                                                      ;84BD36;
    STA.W $1D27,X                                                        ;84BD3A;
    LDA.W #$0001                                                         ;84BD3D;
    STA.L $7EDE1C,X                                                      ;84BD40;
    RTS                                                                  ;84BD44;


.playSFX:
    LDA.W #$0057                                                         ;84BD45;
    JSL.L QueueSound_Lib2_Max6                                           ;84BD48;

.clearPLMShotStatus:
    STZ.W $1D77,X                                                        ;84BD4C;
    RTS                                                                  ;84BD4F;


PreInstruction_PLM_GotoLinkInstructionIfShotWithAMissile:
    LDA.W $1D77,X                                                        ;84BD50;
    BEQ .clearPLMShotStatus                                              ;84BD53;
    AND.W #$0F00                                                         ;84BD55;
    CMP.W #$0200                                                         ;84BD58;
    BEQ .super                                                           ;84BD5B;
    CMP.W #$0100                                                         ;84BD5D;
    BNE .dud                                                             ;84BD60;

.missile:
    STZ.W $1D77,X                                                        ;84BD62;
    LDA.L $7EDEBC,X                                                      ;84BD65;
    STA.W $1D27,X                                                        ;84BD69;
    LDA.W #$0001                                                         ;84BD6C;
    STA.L $7EDE1C,X                                                      ;84BD6F;
    RTS                                                                  ;84BD73;


.dud:
    LDA.W #$0057                                                         ;84BD74;
    JSL.L QueueSound_Lib2_Max6                                           ;84BD77;

.clearPLMShotStatus:
    STZ.W $1D77,X                                                        ;84BD7B;
    RTS                                                                  ;84BD7E;


.super:
    LDA.W #$0077                                                         ;84BD7F;
    STA.L $7EDF0C,X                                                      ;84BD82;
    BRA .missile                                                         ;84BD86;


PreInstruction_PLM_GotoLinkInstIfShotWithASuperMissile:
    LDA.W $1D77,X                                                        ;84BD88;
    BEQ .clearPLMShotStatus                                              ;84BD8B;
    AND.W #$0F00                                                         ;84BD8D;
    CMP.W #$0200                                                         ;84BD90;
    BNE .playSFX                                                         ;84BD93;
    STZ.W $1D77,X                                                        ;84BD95;
    LDA.L $7EDEBC,X                                                      ;84BD98;
    STA.W $1D27,X                                                        ;84BD9C;
    LDA.W #$0001                                                         ;84BD9F;
    STA.L $7EDE1C,X                                                      ;84BDA2;
    RTS                                                                  ;84BDA6;


.playSFX:
    LDA.W #$0057                                                         ;84BDA7;
    JSL.L QueueSound_Lib2_Max6                                           ;84BDAA;

.clearPLMShotStatus:
    STZ.W $1D77,X                                                        ;84BDAE;
    RTS                                                                  ;84BDB1;


Goto_Link_Instruction:
    STZ.W $1D77,X                                                        ;84BDB2;
    LDA.L $7EDEBC,X                                                      ;84BDB5;
    STA.W $1D27,X                                                        ;84BDB9;
    LDA.W #$0001                                                         ;84BDBC;
    STA.L $7EDE1C,X                                                      ;84BDBF;
    RTS                                                                  ;84BDC3;


Play_Dud_Sound:
    LDA.W $1D77,X                                                        ;84BDC4;
    BEQ .clearPLMShotStatus                                              ;84BDC7;
    LDA.W #$0057                                                         ;84BDC9;
    JSL.L QueueSound_Lib2_Max6                                           ;84BDCC;

.clearPLMShotStatus:
    STZ.W $1D77,X                                                        ;84BDD0;
    RTS                                                                  ;84BDD3;


PreInstruction_PLM_GotoLinkInstructionIfAreaBossDead:
    LDA.W #$0001                                                         ;84BDD4;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;84BDD7;
    BCC .playSFX                                                         ;84BDDB;
    JMP.W Goto_Link_Instruction                                          ;84BDDD;


.playSFX:
    JMP.W Play_Dud_Sound                                                 ;84BDE0;


PreInstruction_PLM_GotoLinkInstructionIfAreaMiniBossIsDead:
    LDA.W #$0002                                                         ;84BDE3;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;84BDE6;
    BCC .playSFX                                                         ;84BDEA;
    JMP.W Goto_Link_Instruction                                          ;84BDEC;


.playSFX:
    JMP.W Play_Dud_Sound                                                 ;84BDEF;


PreInstruction_PLM_GotoLinkInstructionIfAreaTorizoIsDead:
    LDA.W #$0004                                                         ;84BDF2;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;84BDF5;
    BCC .playSFX                                                         ;84BDF9;
    JMP.W Goto_Link_Instruction                                          ;84BDFB;


.playSFX:
    JMP.W Play_Dud_Sound                                                 ;84BDFE;


PreInst_PLM_GotoLinkInst_SetZebesAwakeEventIfEnemiesDead:
    PHY                                                                  ;84BE01;
    PHX                                                                  ;84BE02;
    LDA.W $0E50                                                          ;84BE03;
    CMP.W $0E52                                                          ;84BE06;
    BCC .playSFX                                                         ;84BE09;
    LDA.W #$0000                                                         ;84BE0B;
    JSL.L MarkEvent_inA                                                  ;84BE0E;
    PLX                                                                  ;84BE12;
    PLY                                                                  ;84BE13;
    JMP.W Goto_Link_Instruction                                          ;84BE14;


.playSFX:
    PLX                                                                  ;84BE17;
    PLY                                                                  ;84BE18;
    JMP.W Play_Dud_Sound                                                 ;84BE19;


PreInstruction_PLM_PlayDudSound:
    JMP.W Play_Dud_Sound                                                 ;84BE1C;


PreInst_PLM_GotoLinkInstIfTourianStatueFinishedProcessing:
    PHY                                                                  ;84BE1F;
    PHX                                                                  ;84BE20;
    LDA.W $1E6D                                                          ;84BE21;
    BPL .playSFX                                                         ;84BE24;
    PLX                                                                  ;84BE26;
    PLY                                                                  ;84BE27;
    JMP.W Goto_Link_Instruction                                          ;84BE28;


.playSFX:
    PLX                                                                  ;84BE2B;
    PLY                                                                  ;84BE2C;
    JMP.W Play_Dud_Sound                                                 ;84BE2D;


PreInstruction_PLM_GotoLinkInstructionIfCrittersEscaped:
    LDA.W #$000F                                                         ;84BE30;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;84BE33;
    BCC .playSFX                                                         ;84BE37;
    JMP.W Goto_Link_Instruction                                          ;84BE39;


.playSFX:
    JMP.W Play_Dud_Sound                                                 ;84BE3C;


Instruction_PLM_SetGreyDoorPreInstruction:
    PHY                                                                  ;84BE3F;
    LDY.W $1E17,X                                                        ;84BE40;
    LDA.W .pointers,Y                                                    ;84BE43;
    STA.W $1CD7,X                                                        ;84BE46;
    PLY                                                                  ;84BE49;
    RTS                                                                  ;84BE4A;


.pointers:
    dw PreInstruction_PLM_GotoLinkInstructionIfAreaBossDead              ;84BE4B;
    dw PreInstruction_PLM_GotoLinkInstructionIfAreaMiniBossIsDead        ;84BE4D;
    dw PreInstruction_PLM_GotoLinkInstructionIfAreaTorizoIsDead          ;84BE4F;
    dw PreInst_PLM_GotoLinkInst_SetZebesAwakeEventIfEnemiesDead          ;84BE51;
    dw PreInstruction_PLM_PlayDudSound                                   ;84BE53;
    dw PreInst_PLM_GotoLinkInstIfTourianStatueFinishedProcessing         ;84BE55;
    dw PreInstruction_PLM_GotoLinkInstructionIfCrittersEscaped           ;84BE57;

InstList_PLM_GreyDoorFacingLeft_0:
    dw $0002                                                             ;84BE59;
    dw DrawInst_DoorFacingLeft_A677                                      ;84BE5B;
    dw $0002                                                             ;84BE5D;
    dw DrawInst_GreyDoorFacingLeft_3                                     ;84BE5F;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84BE61;
    db $08                                                               ;84BE63;
    dw $0002                                                             ;84BE64;
    dw DrawInst_GreyDoorFacingLeft_2                                     ;84BE66;
    dw $0002                                                             ;84BE68;
    dw DrawInst_GreyDoorFacingLeft_1                                     ;84BE6A;
    dw $0001                                                             ;84BE6C;
    dw DrawInst_GreyDoorFacingLeft_0                                     ;84BE6E;

InstList_PLM_GreyDoorFacingLeft_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84BE70;
    dw InstList_PLM_ClosedBlueDoorFacingLeft_40                          ;84BE72;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84BE74;
    dw InstList_PLM_GreyDoorFacingLeft_3                                 ;84BE76;
    dw Instruction_PLM_SetGreyDoorPreInstruction                         ;84BE78;
    dw $0001                                                             ;84BE7A;
    dw DrawInst_GreyDoorFacingLeft_0                                     ;84BE7C;

InstList_PLM_GreyDoorFacingLeft_2:
    dw Instruction_PLM_Sleep                                             ;84BE7E;
    dw Instruction_PLM_GotoY                                             ;84BE80;
    dw InstList_PLM_GreyDoorFacingLeft_2                                 ;84BE82;

InstList_PLM_GreyDoorFacingLeft_3:
    dw Instruction_PLM_LinkInstruction_Y                                 ;84BE84;
    dw InstList_PLM_GreyDoorFacingLeft_5                                 ;84BE86;
    dw Instruction_PLM_PreInstruction_inY                                ;84BE88;
    dw PreInstruction_PLM_GotoLinkInstructionIfShot                      ;84BE8A;

InstList_PLM_GreyDoorFacingLeft_4:
    dw $0003                                                             ;84BE8C;
    dw DrawInst_DoorFacingLeft_A9B3                                      ;84BE8E;
    dw $0004                                                             ;84BE90;
    dw DrawInst_GreyDoorFacingLeft_0                                     ;84BE92;
    dw $0003                                                             ;84BE94;
    dw DrawInst_DoorFacingLeft_A9B3                                      ;84BE96;
    dw $0004                                                             ;84BE98;
    dw DrawInst_GreyDoorFacingLeft_0                                     ;84BE9A;
    dw $0003                                                             ;84BE9C;
    dw DrawInst_DoorFacingLeft_A9B3                                      ;84BE9E;
    dw $0004                                                             ;84BEA0;
    dw DrawInst_GreyDoorFacingLeft_0                                     ;84BEA2;
    dw Instruction_PLM_GotoY                                             ;84BEA4;
    dw InstList_PLM_GreyDoorFacingLeft_4                                 ;84BEA6;

InstList_PLM_GreyDoorFacingLeft_5:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY                   ;84BEA8;
    db $01                                                               ;84BEAA;
    dw InstList_PLM_GreyDoorFacingLeft_6                                 ;84BEAB;

InstList_PLM_GreyDoorFacingLeft_6:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84BEAD;
    db $07                                                               ;84BEAF;
    dw $0004                                                             ;84BEB0;
    dw DrawInst_GreyDoorFacingLeft_1                                     ;84BEB2;
    dw $0004                                                             ;84BEB4;
    dw DrawInst_GreyDoorFacingLeft_2                                     ;84BEB6;
    dw $0004                                                             ;84BEB8;
    dw DrawInst_GreyDoorFacingLeft_3                                     ;84BEBA;
    dw $0001                                                             ;84BEBC;
    dw DrawInst_DoorFacingLeft_A677                                      ;84BEBE;
    dw Instruction_PLM_Delete                                            ;84BEC0;

InstList_PLM_GreyDoorFacingRight_0:
    dw $0002                                                             ;84BEC2;
    dw DrawInst_DoorFacingRight_A683                                     ;84BEC4;
    dw $0002                                                             ;84BEC6;
    dw DrawInst_GreyDoorFacingRight_3                                    ;84BEC8;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84BECA;
    db $08                                                               ;84BECC;
    dw $0002                                                             ;84BECD;
    dw DrawInst_GreyDoorFacingRight_2                                    ;84BECF;
    dw $0002                                                             ;84BED1;
    dw DrawInst_GreyDoorFacingRight_1                                    ;84BED3;
    dw $0001                                                             ;84BED5;
    dw DrawInst_GreyDoorFacingRight_0                                    ;84BED7;

InstList_PLM_GreyDoorFacingRight_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84BED9;
    dw InstList_PLM_ClosedBlueDoorFacingLeft_41                          ;84BEDB;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84BEDD;
    dw InstList_PLM_GreyDoorFacingRight_3                                ;84BEDF;
    dw Instruction_PLM_SetGreyDoorPreInstruction                         ;84BEE1;
    dw $0001                                                             ;84BEE3;
    dw DrawInst_GreyDoorFacingRight_0                                    ;84BEE5;

InstList_PLM_GreyDoorFacingRight_2:
    dw Instruction_PLM_Sleep                                             ;84BEE7;
    dw Instruction_PLM_GotoY                                             ;84BEE9;
    dw InstList_PLM_GreyDoorFacingRight_2                                ;84BEEB;

InstList_PLM_GreyDoorFacingRight_3:
    dw Instruction_PLM_LinkInstruction_Y                                 ;84BEED;
    dw InstList_PLM_GreyDoorFacingRight_5                                ;84BEEF;
    dw Instruction_PLM_PreInstruction_inY                                ;84BEF1;
    dw PreInstruction_PLM_GotoLinkInstructionIfShot                      ;84BEF3;

InstList_PLM_GreyDoorFacingRight_4:
    dw $0003                                                             ;84BEF5;
    dw DrawInst_DoorFacingRight_A9EF                                     ;84BEF7;
    dw $0004                                                             ;84BEF9;
    dw DrawInst_GreyDoorFacingRight_0                                    ;84BEFB;
    dw $0003                                                             ;84BEFD;
    dw DrawInst_DoorFacingRight_A9EF                                     ;84BEFF;
    dw $0004                                                             ;84BF01;
    dw DrawInst_GreyDoorFacingRight_0                                    ;84BF03;
    dw $0003                                                             ;84BF05;
    dw DrawInst_DoorFacingRight_A9EF                                     ;84BF07;
    dw $0004                                                             ;84BF09;
    dw DrawInst_GreyDoorFacingRight_0                                    ;84BF0B;
    dw Instruction_PLM_GotoY                                             ;84BF0D;
    dw InstList_PLM_GreyDoorFacingRight_4                                ;84BF0F;

InstList_PLM_GreyDoorFacingRight_5:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY                   ;84BF11;
    db $01                                                               ;84BF13;
    dw InstList_PLM_GreyDoorFacingRight_6                                ;84BF14;

InstList_PLM_GreyDoorFacingRight_6:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84BF16;
    db $07                                                               ;84BF18;
    dw $0004                                                             ;84BF19;
    dw DrawInst_GreyDoorFacingRight_1                                    ;84BF1B;
    dw $0004                                                             ;84BF1D;
    dw DrawInst_GreyDoorFacingRight_2                                    ;84BF1F;
    dw $0004                                                             ;84BF21;
    dw DrawInst_GreyDoorFacingRight_3                                    ;84BF23;
    dw $0001                                                             ;84BF25;
    dw DrawInst_DoorFacingRight_A683                                     ;84BF27;
    dw Instruction_PLM_Delete                                            ;84BF29;

InstList_PLM_GreyDoorFacingUp_0:
    dw $0002                                                             ;84BF2B;
    dw DrawInst_DoorFacingUp_A68F                                        ;84BF2D;
    dw $0002                                                             ;84BF2F;
    dw DrawInst_GreyDoorFacingUp_3                                       ;84BF31;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84BF33;
    db $08                                                               ;84BF35;
    dw $0002                                                             ;84BF36;
    dw DrawInst_GreyDoorFacingUp_2                                       ;84BF38;
    dw $0002                                                             ;84BF3A;
    dw DrawInst_GreyDoorFacingUp_1                                       ;84BF3C;
    dw $0001                                                             ;84BF3E;
    dw DrawInst_GreyDoorFacingUp_0                                       ;84BF40;

InstList_PLM_GreyDoorFacingUp_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84BF42;
    dw InstList_PLM_ClosedBlueDoorFacingUp_42                            ;84BF44;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84BF46;
    dw InstList_PLM_GreyDoorFacingUp_3                                   ;84BF48;
    dw Instruction_PLM_SetGreyDoorPreInstruction                         ;84BF4A;
    dw $0001                                                             ;84BF4C;
    dw DrawInst_GreyDoorFacingUp_0                                       ;84BF4E;

InstList_PLM_GreyDoorFacingUp_2:
    dw Instruction_PLM_Sleep                                             ;84BF50;
    dw Instruction_PLM_GotoY                                             ;84BF52;
    dw InstList_PLM_GreyDoorFacingUp_2                                   ;84BF54;

InstList_PLM_GreyDoorFacingUp_3:
    dw Instruction_PLM_LinkInstruction_Y                                 ;84BF56;
    dw InstList_PLM_GreyDoorFacingUp_5                                   ;84BF58;
    dw Instruction_PLM_PreInstruction_inY                                ;84BF5A;
    dw PreInstruction_PLM_GotoLinkInstructionIfShot                      ;84BF5C;

InstList_PLM_GreyDoorFacingUp_4:
    dw $0003                                                             ;84BF5E;
    dw DrawInst_DoorFacingUp_AA2B                                        ;84BF60;
    dw $0004                                                             ;84BF62;
    dw DrawInst_GreyDoorFacingUp_0                                       ;84BF64;
    dw $0003                                                             ;84BF66;
    dw DrawInst_DoorFacingUp_AA2B                                        ;84BF68;
    dw $0004                                                             ;84BF6A;
    dw DrawInst_GreyDoorFacingUp_0                                       ;84BF6C;
    dw $0003                                                             ;84BF6E;
    dw DrawInst_DoorFacingUp_AA2B                                        ;84BF70;
    dw $0004                                                             ;84BF72;
    dw DrawInst_GreyDoorFacingUp_0                                       ;84BF74;
    dw Instruction_PLM_GotoY                                             ;84BF76;
    dw InstList_PLM_GreyDoorFacingUp_4                                   ;84BF78;

InstList_PLM_GreyDoorFacingUp_5:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY                   ;84BF7A;
    db $01                                                               ;84BF7C;
    dw InstList_PLM_GreyDoorFacingUp_6                                   ;84BF7D;

InstList_PLM_GreyDoorFacingUp_6:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84BF7F;
    db $07                                                               ;84BF81;
    dw $0004                                                             ;84BF82;
    dw DrawInst_GreyDoorFacingUp_1                                       ;84BF84;
    dw $0004                                                             ;84BF86;
    dw DrawInst_GreyDoorFacingUp_2                                       ;84BF88;
    dw $0004                                                             ;84BF8A;
    dw DrawInst_GreyDoorFacingUp_3                                       ;84BF8C;
    dw $0001                                                             ;84BF8E;
    dw DrawInst_DoorFacingUp_A68F                                        ;84BF90;
    dw Instruction_PLM_Delete                                            ;84BF92;

InstList_PLM_GreyDoorFacingDown_0:
    dw $0002                                                             ;84BF94;
    dw DrawInst_DoorFacingDown_A69B                                      ;84BF96;
    dw $0002                                                             ;84BF98;
    dw DrawInst_GreyDoorFacingDown_3                                     ;84BF9A;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84BF9C;
    db $08                                                               ;84BF9E;
    dw $0002                                                             ;84BF9F;
    dw DrawInst_GreyDoorFacingDown_2                                     ;84BFA1;
    dw $0002                                                             ;84BFA3;
    dw DrawInst_GreyDoorFacingDown_1                                     ;84BFA5;
    dw $0001                                                             ;84BFA7;
    dw DrawInst_GreyDoorFacingDown_0                                     ;84BFA9;

InstList_PLM_GreyDoorFacingDown_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84BFAB;
    dw InstList_PLM_ClosedBlueDoorFacingUp_43                            ;84BFAD;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84BFAF;
    dw InstList_PLM_GreyDoorFacingDown_3                                 ;84BFB1;
    dw Instruction_PLM_SetGreyDoorPreInstruction                         ;84BFB3;
    dw $0001                                                             ;84BFB5;
    dw DrawInst_GreyDoorFacingDown_0                                     ;84BFB7;

InstList_PLM_GreyDoorFacingDown_2:
    dw Instruction_PLM_Sleep                                             ;84BFB9;
    dw Instruction_PLM_GotoY                                             ;84BFBB;
    dw InstList_PLM_GreyDoorFacingDown_2                                 ;84BFBD;

InstList_PLM_GreyDoorFacingDown_3:
    dw Instruction_PLM_LinkInstruction_Y                                 ;84BFBF;
    dw InstList_PLM_GreyDoorFacingDown_5                                 ;84BFC1;
    dw Instruction_PLM_PreInstruction_inY                                ;84BFC3;
    dw PreInstruction_PLM_GotoLinkInstructionIfShot                      ;84BFC5;

InstList_PLM_GreyDoorFacingDown_4:
    dw $0003                                                             ;84BFC7;
    dw DrawInst_DoorFacingDown_AA67                                      ;84BFC9;
    dw $0004                                                             ;84BFCB;
    dw DrawInst_GreyDoorFacingDown_0                                     ;84BFCD;
    dw $0003                                                             ;84BFCF;
    dw DrawInst_DoorFacingDown_AA67                                      ;84BFD1;
    dw $0004                                                             ;84BFD3;
    dw DrawInst_GreyDoorFacingDown_0                                     ;84BFD5;
    dw $0003                                                             ;84BFD7;
    dw DrawInst_DoorFacingDown_AA67                                      ;84BFD9;
    dw $0004                                                             ;84BFDB;
    dw DrawInst_GreyDoorFacingDown_0                                     ;84BFDD;
    dw Instruction_PLM_GotoY                                             ;84BFDF;
    dw InstList_PLM_GreyDoorFacingDown_4                                 ;84BFE1;

InstList_PLM_GreyDoorFacingDown_5:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY                   ;84BFE3;
    db $01                                                               ;84BFE5;
    dw InstList_PLM_GreyDoorFacingDown_6                                 ;84BFE6;

InstList_PLM_GreyDoorFacingDown_6:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84BFE8;
    db $07                                                               ;84BFEA;
    dw $0004                                                             ;84BFEB;
    dw DrawInst_GreyDoorFacingDown_1                                     ;84BFED;
    dw $0004                                                             ;84BFEF;
    dw DrawInst_GreyDoorFacingDown_2                                     ;84BFF1;
    dw $0004                                                             ;84BFF3;
    dw DrawInst_GreyDoorFacingDown_3                                     ;84BFF5;
    dw $0001                                                             ;84BFF7;
    dw DrawInst_DoorFacingDown_A69B                                      ;84BFF9;
    dw Instruction_PLM_Delete                                            ;84BFFB;

InstList_PLM_YellowDoorFacingLeft_0:
    dw $0002                                                             ;84BFFD;
    dw DrawInst_DoorFacingLeft_A677                                      ;84BFFF;
    dw $0002                                                             ;84C001;
    dw DrawInst_YellowDoorFacingLeft_3                                   ;84C003;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C005;
    db $08                                                               ;84C007;
    dw $0002                                                             ;84C008;
    dw DrawInst_YellowDoorFacingLeft_2                                   ;84C00A;
    dw $0002                                                             ;84C00C;
    dw DrawInst_YellowDoorFacingLeft_1                                   ;84C00E;
    dw $0001                                                             ;84C010;
    dw DrawInst_YellowDoorFacingLeft_0                                   ;84C012;

InstList_PLM_YellowDoorFacingLeft_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84C014;
    dw InstList_PLM_ClosedBlueDoorFacingLeft_40                          ;84C016;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84C018;
    dw InstList_PLM_YellowDoorFacingLeft_3                               ;84C01A;
    dw Instruction_PLM_PreInstruction_inY                                ;84C01C;
    dw PreInstruction_PLM_GotoLinkInstructionIfHitWithPowerBomb          ;84C01E;
    dw $0001                                                             ;84C020;
    dw DrawInst_YellowDoorFacingLeft_0                                   ;84C022;

InstList_PLM_YellowDoorFacingLeft_2:
    dw Instruction_PLM_Sleep                                             ;84C024;
    dw Instruction_PLM_GotoY                                             ;84C026;
    dw InstList_PLM_YellowDoorFacingLeft_2                               ;84C028;

InstList_PLM_YellowDoorFacingLeft_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY                   ;84C02A;
    db $01                                                               ;84C02C;
    dw InstList_PLM_YellowDoorFacingLeft_4                               ;84C02D;
    dw $0003                                                             ;84C02F;
    dw DrawInst_DoorFacingLeft_A9B3                                      ;84C031;
    dw $0004                                                             ;84C033;
    dw DrawInst_YellowDoorFacingLeft_0                                   ;84C035;
    dw $0003                                                             ;84C037;
    dw DrawInst_DoorFacingLeft_A9B3                                      ;84C039;
    dw $0004                                                             ;84C03B;
    dw DrawInst_YellowDoorFacingLeft_0                                   ;84C03D;
    dw $0003                                                             ;84C03F;
    dw DrawInst_DoorFacingLeft_A9B3                                      ;84C041;
    dw $0004                                                             ;84C043;
    dw DrawInst_YellowDoorFacingLeft_0                                   ;84C045;
    dw Instruction_PLM_GotoY                                             ;84C047;
    dw InstList_PLM_YellowDoorFacingLeft_2                               ;84C049;

InstList_PLM_YellowDoorFacingLeft_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C04B;
    db $07                                                               ;84C04D;
    dw $0004                                                             ;84C04E;
    dw DrawInst_YellowDoorFacingLeft_1                                   ;84C050;
    dw $0004                                                             ;84C052;
    dw DrawInst_YellowDoorFacingLeft_2                                   ;84C054;
    dw $0004                                                             ;84C056;
    dw DrawInst_YellowDoorFacingLeft_3                                   ;84C058;
    dw $005C                                                             ;84C05A;
    dw DrawInst_DoorFacingLeft_A677                                      ;84C05C;
    dw Instruction_PLM_Delete                                            ;84C05E;

InstList_PLM_YellowDoorFacingRight_0:
    dw $0002                                                             ;84C060;
    dw DrawInst_DoorFacingRight_A683                                     ;84C062;
    dw $0002                                                             ;84C064;
    dw DrawInst_YellowDoorFacingRight_3                                  ;84C066;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C068;
    db $08                                                               ;84C06A;
    dw $0002                                                             ;84C06B;
    dw DrawInst_YellowDoorFacingRight_2                                  ;84C06D;
    dw $0002                                                             ;84C06F;
    dw DrawInst_YellowDoorFacingRight_1                                  ;84C071;
    dw $0001                                                             ;84C073;
    dw DrawInst_YellowDoorFacingRight_0                                  ;84C075;

InstList_PLM_YellowDoorFacingRight_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84C077;
    dw InstList_PLM_ClosedBlueDoorFacingLeft_41                          ;84C079;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84C07B;
    dw InstList_PLM_YellowDoorFacingRight_3                              ;84C07D;
    dw Instruction_PLM_PreInstruction_inY                                ;84C07F;
    dw PreInstruction_PLM_GotoLinkInstructionIfHitWithPowerBomb          ;84C081;
    dw $0001                                                             ;84C083;
    dw DrawInst_YellowDoorFacingRight_0                                  ;84C085;

InstList_PLM_YellowDoorFacingRight_2:
    dw Instruction_PLM_Sleep                                             ;84C087;
    dw Instruction_PLM_GotoY                                             ;84C089;
    dw InstList_PLM_YellowDoorFacingRight_2                              ;84C08B;

InstList_PLM_YellowDoorFacingRight_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY                   ;84C08D;
    db $01                                                               ;84C08F;
    dw InstList_PLM_YellowDoorFacingRight_4                              ;84C090;
    dw $0003                                                             ;84C092;
    dw DrawInst_DoorFacingRight_A9EF                                     ;84C094;
    dw $0004                                                             ;84C096;
    dw DrawInst_YellowDoorFacingRight_0                                  ;84C098;
    dw $0003                                                             ;84C09A;
    dw DrawInst_DoorFacingRight_A9EF                                     ;84C09C;
    dw $0004                                                             ;84C09E;
    dw DrawInst_YellowDoorFacingRight_0                                  ;84C0A0;
    dw $0003                                                             ;84C0A2;
    dw DrawInst_DoorFacingRight_A9EF                                     ;84C0A4;
    dw $0004                                                             ;84C0A6;
    dw DrawInst_YellowDoorFacingRight_0                                  ;84C0A8;
    dw Instruction_PLM_GotoY                                             ;84C0AA;
    dw InstList_PLM_YellowDoorFacingRight_2                              ;84C0AC;

InstList_PLM_YellowDoorFacingRight_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C0AE;
    db $07                                                               ;84C0B0;
    dw $0006                                                             ;84C0B1;
    dw DrawInst_YellowDoorFacingRight_1                                  ;84C0B3;
    dw $0006                                                             ;84C0B5;
    dw DrawInst_YellowDoorFacingRight_2                                  ;84C0B7;
    dw $0006                                                             ;84C0B9;
    dw DrawInst_YellowDoorFacingRight_3                                  ;84C0BB;
    dw $0001                                                             ;84C0BD;
    dw DrawInst_DoorFacingRight_A683                                     ;84C0BF;
    dw Instruction_PLM_Delete                                            ;84C0C1;

InstList_PLM_YellowDoorFacingUp_0:
    dw $0002                                                             ;84C0C3;
    dw DrawInst_DoorFacingUp_A68F                                        ;84C0C5;
    dw $0002                                                             ;84C0C7;
    dw DrawInst_YellowDoorFacingUp_3                                     ;84C0C9;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C0CB;
    db $08                                                               ;84C0CD;
    dw $0002                                                             ;84C0CE;
    dw DrawInst_YellowDoorFacingUp_2                                     ;84C0D0;
    dw $0002                                                             ;84C0D2;
    dw DrawInst_YellowDoorFacingUp_1                                     ;84C0D4;
    dw $0001                                                             ;84C0D6;
    dw DrawInst_YellowDoorFacingUp_0                                     ;84C0D8;

InstList_PLM_YellowDoorFacingUp_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84C0DA;
    dw InstList_PLM_ClosedBlueDoorFacingUp_42                            ;84C0DC;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84C0DE;
    dw InstList_PLM_YellowDoorFacingUp_3                                 ;84C0E0;
    dw Instruction_PLM_PreInstruction_inY                                ;84C0E2;
    dw PreInstruction_PLM_GotoLinkInstructionIfHitWithPowerBomb          ;84C0E4;
    dw $0001                                                             ;84C0E6;
    dw DrawInst_YellowDoorFacingUp_0                                     ;84C0E8;

InstList_PLM_YellowDoorFacingUp_2:
    dw Instruction_PLM_Sleep                                             ;84C0EA;

InstList_PLM_YellowDoorFacingUp_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY                   ;84C0EC;
    db $01                                                               ;84C0EE;
    dw InstList_PLM_YellowDoorFacingUp_4                                 ;84C0EF;
    dw $0003                                                             ;84C0F1;
    dw DrawInst_DoorFacingUp_AA2B                                        ;84C0F3;
    dw $0004                                                             ;84C0F5;
    dw DrawInst_YellowDoorFacingUp_0                                     ;84C0F7;
    dw $0003                                                             ;84C0F9;
    dw DrawInst_DoorFacingUp_AA2B                                        ;84C0FB;
    dw $0004                                                             ;84C0FD;
    dw DrawInst_YellowDoorFacingUp_0                                     ;84C0FF;
    dw $0003                                                             ;84C101;
    dw DrawInst_DoorFacingUp_AA2B                                        ;84C103;
    dw $0004                                                             ;84C105;
    dw DrawInst_YellowDoorFacingUp_0                                     ;84C107;
    dw Instruction_PLM_GotoY                                             ;84C109;
    dw InstList_PLM_YellowDoorFacingUp_2                                 ;84C10B;

InstList_PLM_YellowDoorFacingUp_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C10D;
    db $07                                                               ;84C10F;
    dw $0006                                                             ;84C110;
    dw DrawInst_YellowDoorFacingUp_1                                     ;84C112;
    dw $0006                                                             ;84C114;
    dw DrawInst_YellowDoorFacingUp_2                                     ;84C116;
    dw $0006                                                             ;84C118;
    dw DrawInst_YellowDoorFacingUp_3                                     ;84C11A;
    dw $0001                                                             ;84C11C;
    dw DrawInst_DoorFacingUp_A68F                                        ;84C11E;
    dw Instruction_PLM_Delete                                            ;84C120;

InstList_PLM_YellowDoorFacingDown_0:
    dw $0002                                                             ;84C122;
    dw DrawInst_DoorFacingDown_A69B                                      ;84C124;
    dw $0002                                                             ;84C126;
    dw DrawInst_YellowDoorFacingDown_3                                   ;84C128;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C12A;
    db $08                                                               ;84C12C;
    dw $0002                                                             ;84C12D;
    dw DrawInst_YellowDoorFacingDown_2                                   ;84C12F;
    dw $0002                                                             ;84C131;
    dw DrawInst_YellowDoorFacingDown_1                                   ;84C133;
    dw $0001                                                             ;84C135;
    dw DrawInst_YellowDoorFacingDown_0                                   ;84C137;

InstList_PLM_YellowDoorFacingDown_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84C139;
    dw InstList_PLM_ClosedBlueDoorFacingUp_43                            ;84C13B;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84C13D;
    dw InstList_PLM_YellowDoorFacingDown_3                               ;84C13F;
    dw Instruction_PLM_PreInstruction_inY                                ;84C141;
    dw PreInstruction_PLM_GotoLinkInstructionIfHitWithPowerBomb          ;84C143;
    dw $0002                                                             ;84C145;
    dw DrawInst_YellowDoorFacingDown_0                                   ;84C147;
    dw $0001                                                             ;84C149;
    dw DrawInst_YellowDoorFacingDown_0                                   ;84C14B;

InstList_PLM_YellowDoorFacingDown_2:
    dw Instruction_PLM_Sleep                                             ;84C14D;

InstList_PLM_YellowDoorFacingDown_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY                   ;84C14F;
    db $01                                                               ;84C151;
    dw InstList_PLM_YellowDoorFacingDown_4                               ;84C152;
    dw $0003                                                             ;84C154;
    dw DrawInst_DoorFacingDown_AA67                                      ;84C156;
    dw $0004                                                             ;84C158;
    dw DrawInst_YellowDoorFacingDown_0                                   ;84C15A;
    dw $0003                                                             ;84C15C;
    dw DrawInst_DoorFacingDown_AA67                                      ;84C15E;
    dw $0004                                                             ;84C160;
    dw DrawInst_YellowDoorFacingDown_0                                   ;84C162;
    dw $0003                                                             ;84C164;
    dw DrawInst_DoorFacingDown_AA67                                      ;84C166;
    dw $0004                                                             ;84C168;
    dw DrawInst_YellowDoorFacingDown_0                                   ;84C16A;
    dw Instruction_PLM_GotoY                                             ;84C16C;
    dw InstList_PLM_YellowDoorFacingDown_2                               ;84C16E;

InstList_PLM_YellowDoorFacingDown_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C170;
    db $07                                                               ;84C172;
    dw $0006                                                             ;84C173;
    dw DrawInst_YellowDoorFacingDown_1                                   ;84C175;
    dw $0006                                                             ;84C177;
    dw DrawInst_YellowDoorFacingDown_2                                   ;84C179;
    dw $0006                                                             ;84C17B;
    dw DrawInst_YellowDoorFacingDown_3                                   ;84C17D;
    dw $0001                                                             ;84C17F;
    dw DrawInst_DoorFacingDown_A69B                                      ;84C181;
    dw Instruction_PLM_Delete                                            ;84C183;

InstList_PLM_GreenDoorFacingLeft_0:
    dw $0002                                                             ;84C185;
    dw DrawInst_DoorFacingLeft_A677                                      ;84C187;
    dw $0002                                                             ;84C189;
    dw DrawInst_GreenDoorFacingLeft_3                                    ;84C18B;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C18D;
    db $08                                                               ;84C18F;
    dw $0002                                                             ;84C190;
    dw DrawInst_GreenDoorFacingLeft_2                                    ;84C192;
    dw $0002                                                             ;84C194;
    dw DrawInst_GreenDoorFacingLeft_1                                    ;84C196;
    dw $0001                                                             ;84C198;
    dw DrawInst_GreenDoorFacingLeft_0                                    ;84C19A;

InstList_PLM_GreenDoorFacingLeft_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84C19C;
    dw InstList_PLM_ClosedBlueDoorFacingLeft_40                          ;84C19E;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84C1A0;
    dw InstList_PLM_GreenDoorFacingLeft_3                                ;84C1A2;
    dw Instruction_PLM_PreInstruction_inY                                ;84C1A4;
    dw PreInstruction_PLM_GotoLinkInstIfShotWithASuperMissile            ;84C1A6;
    dw $0001                                                             ;84C1A8;
    dw DrawInst_GreenDoorFacingLeft_0                                    ;84C1AA;

InstList_PLM_GreenDoorFacingLeft_2:
    dw Instruction_PLM_Sleep                                             ;84C1AC;

InstList_PLM_GreenDoorFacingLeft_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY                   ;84C1AE;
    db $01                                                               ;84C1B0;
    dw InstList_PLM_GreenDoorFacingLeft_4                                ;84C1B1;
    dw $0003                                                             ;84C1B3;
    dw DrawInst_DoorFacingLeft_A9B3                                      ;84C1B5;
    dw $0004                                                             ;84C1B7;
    dw DrawInst_GreenDoorFacingLeft_0                                    ;84C1B9;
    dw $0003                                                             ;84C1BB;
    dw DrawInst_DoorFacingLeft_A9B3                                      ;84C1BD;
    dw $0004                                                             ;84C1BF;
    dw DrawInst_GreenDoorFacingLeft_0                                    ;84C1C1;
    dw $0003                                                             ;84C1C3;
    dw DrawInst_DoorFacingLeft_A9B3                                      ;84C1C5;
    dw $0004                                                             ;84C1C7;
    dw DrawInst_GreenDoorFacingLeft_0                                    ;84C1C9;
    dw Instruction_PLM_GotoY                                             ;84C1CB;
    dw InstList_PLM_GreenDoorFacingLeft_2                                ;84C1CD;

InstList_PLM_GreenDoorFacingLeft_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C1CF;
    db $07                                                               ;84C1D1;
    dw $0006                                                             ;84C1D2;
    dw DrawInst_GreenDoorFacingLeft_1                                    ;84C1D4;
    dw $0006                                                             ;84C1D6;
    dw DrawInst_GreenDoorFacingLeft_2                                    ;84C1D8;
    dw $0006                                                             ;84C1DA;
    dw DrawInst_GreenDoorFacingLeft_3                                    ;84C1DC;
    dw $0001                                                             ;84C1DE;
    dw DrawInst_DoorFacingLeft_A677                                      ;84C1E0;
    dw Instruction_PLM_Delete                                            ;84C1E2;

InstList_PLM_GreenDoorFacingRight_0:
    dw $0002                                                             ;84C1E4;
    dw DrawInst_DoorFacingRight_A683                                     ;84C1E6;
    dw $0002                                                             ;84C1E8;
    dw DrawInst_GreenDoorFacingRight_3                                   ;84C1EA;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C1EC;
    db $08                                                               ;84C1EE;
    dw $0002                                                             ;84C1EF;
    dw DrawInst_GreenDoorFacingRight_2                                   ;84C1F1;
    dw $0002                                                             ;84C1F3;
    dw DrawInst_GreenDoorFacingRight_1                                   ;84C1F5;
    dw $0001                                                             ;84C1F7;
    dw DrawInst_GreenDoorFacingRight_0                                   ;84C1F9;

InstList_PLM_GreenDoorFacingRight_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84C1FB;
    dw InstList_PLM_ClosedBlueDoorFacingLeft_41                          ;84C1FD;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84C1FF;
    dw InstList_PLM_GreenDoorFacingRight_3                               ;84C201;
    dw Instruction_PLM_PreInstruction_inY                                ;84C203;
    dw PreInstruction_PLM_GotoLinkInstIfShotWithASuperMissile            ;84C205;
    dw $0001                                                             ;84C207;
    dw DrawInst_GreenDoorFacingRight_0                                   ;84C209;

InstList_PLM_GreenDoorFacingRight_2:
    dw Instruction_PLM_Sleep                                             ;84C20B;

InstList_PLM_GreenDoorFacingRight_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY                   ;84C20D;
    db $01                                                               ;84C20F;
    dw InstList_PLM_GreenDoorFacingRight_4                               ;84C210;
    dw $0003                                                             ;84C212;
    dw DrawInst_DoorFacingRight_A9EF                                     ;84C214;
    dw $0004                                                             ;84C216;
    dw DrawInst_GreenDoorFacingRight_0                                   ;84C218;
    dw $0003                                                             ;84C21A;
    dw DrawInst_DoorFacingRight_A9EF                                     ;84C21C;
    dw $0004                                                             ;84C21E;
    dw DrawInst_GreenDoorFacingRight_0                                   ;84C220;
    dw $0003                                                             ;84C222;
    dw DrawInst_DoorFacingRight_A9EF                                     ;84C224;
    dw $0004                                                             ;84C226;
    dw DrawInst_GreenDoorFacingRight_0                                   ;84C228;
    dw Instruction_PLM_GotoY                                             ;84C22A;
    dw InstList_PLM_GreenDoorFacingRight_2                               ;84C22C;

InstList_PLM_GreenDoorFacingRight_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C22E;
    db $07                                                               ;84C230;
    dw $0006                                                             ;84C231;
    dw DrawInst_GreenDoorFacingRight_1                                   ;84C233;
    dw $0006                                                             ;84C235;
    dw DrawInst_GreenDoorFacingRight_2                                   ;84C237;
    dw $0006                                                             ;84C239;
    dw DrawInst_GreenDoorFacingRight_3                                   ;84C23B;
    dw $0001                                                             ;84C23D;
    dw DrawInst_DoorFacingRight_A683                                     ;84C23F;
    dw Instruction_PLM_Delete                                            ;84C241;

InstList_PLM_GreenDoorFacingUp_0:
    dw $0002                                                             ;84C243;
    dw DrawInst_DoorFacingUp_A68F                                        ;84C245;
    dw $0002                                                             ;84C247;
    dw DrawInst_GreenDoorFacingUp_3                                      ;84C249;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C24B;
    db $08                                                               ;84C24D;
    dw $0002                                                             ;84C24E;
    dw DrawInst_GreenDoorFacingUp_2                                      ;84C250;
    dw $0002                                                             ;84C252;
    dw DrawInst_GreenDoorFacingUp_1                                      ;84C254;
    dw $0001                                                             ;84C256;
    dw DrawInst_GreenDoorFacingUp_0                                      ;84C258;

InstList_PLM_GreenDoorFacingUp_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84C25A;
    dw InstList_PLM_ClosedBlueDoorFacingUp_42                            ;84C25C;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84C25E;
    dw InstList_PLM_GreenDoorFacingUp_3                                  ;84C260;
    dw Instruction_PLM_PreInstruction_inY                                ;84C262;
    dw PreInstruction_PLM_GotoLinkInstIfShotWithASuperMissile            ;84C264;
    dw $0001                                                             ;84C266;
    dw DrawInst_GreenDoorFacingUp_0                                      ;84C268;

InstList_PLM_GreenDoorFacingUp_2:
    dw Instruction_PLM_Sleep                                             ;84C26A;

InstList_PLM_GreenDoorFacingUp_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY                   ;84C26C;
    db $01                                                               ;84C26E;
    dw InstList_PLM_GreenDoorFacingUp_4                                  ;84C26F;
    dw $0003                                                             ;84C271;
    dw DrawInst_DoorFacingUp_AA2B                                        ;84C273;
    dw $0004                                                             ;84C275;
    dw DrawInst_GreenDoorFacingUp_0                                      ;84C277;
    dw $0003                                                             ;84C279;
    dw DrawInst_DoorFacingUp_AA2B                                        ;84C27B;
    dw $0004                                                             ;84C27D;
    dw DrawInst_GreenDoorFacingUp_0                                      ;84C27F;
    dw $0003                                                             ;84C281;
    dw DrawInst_DoorFacingUp_AA2B                                        ;84C283;
    dw $0004                                                             ;84C285;
    dw DrawInst_GreenDoorFacingUp_0                                      ;84C287;
    dw Instruction_PLM_GotoY                                             ;84C289;
    dw InstList_PLM_GreenDoorFacingUp_2                                  ;84C28B;

InstList_PLM_GreenDoorFacingUp_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C28D;
    db $07                                                               ;84C28F;
    dw $0006                                                             ;84C290;
    dw DrawInst_GreenDoorFacingUp_1                                      ;84C292;
    dw $0006                                                             ;84C294;
    dw DrawInst_GreenDoorFacingUp_2                                      ;84C296;
    dw $0006                                                             ;84C298;
    dw DrawInst_GreenDoorFacingUp_3                                      ;84C29A;
    dw $0001                                                             ;84C29C;
    dw DrawInst_DoorFacingUp_A68F                                        ;84C29E;
    dw Instruction_PLM_Delete                                            ;84C2A0;

InstList_PLM_GreenDoorFacingDown_0:
    dw $0002                                                             ;84C2A2;
    dw DrawInst_DoorFacingDown_A69B                                      ;84C2A4;
    dw $0002                                                             ;84C2A6;
    dw DrawInst_GreenDoorFacingDown_3                                    ;84C2A8;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C2AA;
    db $08                                                               ;84C2AC;
    dw $0002                                                             ;84C2AD;
    dw DrawInst_GreenDoorFacingDown_2                                    ;84C2AF;
    dw $0002                                                             ;84C2B1;
    dw DrawInst_GreenDoorFacingDown_1                                    ;84C2B3;
    dw $0001                                                             ;84C2B5;
    dw DrawInst_GreenDoorFacingDown_0                                    ;84C2B7;

InstList_PLM_GreenDoorFacingDown_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84C2B9;
    dw InstList_PLM_ClosedBlueDoorFacingUp_43                            ;84C2BB;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84C2BD;
    dw InstList_PLM_GreenDoorFacingDown_3                                ;84C2BF;
    dw Instruction_PLM_PreInstruction_inY                                ;84C2C1;
    dw PreInstruction_PLM_GotoLinkInstIfShotWithASuperMissile            ;84C2C3;
    dw $0001                                                             ;84C2C5;
    dw DrawInst_GreenDoorFacingDown_0                                    ;84C2C7;

InstList_PLM_GreenDoorFacingDown_2:
    dw Instruction_PLM_Sleep                                             ;84C2C9;

InstList_PLM_GreenDoorFacingDown_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY                   ;84C2CB;
    db $01                                                               ;84C2CD;
    dw InstList_PLM_GreenDoorFacingDown_4                                ;84C2CE;
    dw $0003                                                             ;84C2D0;
    dw DrawInst_DoorFacingDown_AA67                                      ;84C2D2;
    dw $0004                                                             ;84C2D4;
    dw DrawInst_GreenDoorFacingDown_0                                    ;84C2D6;
    dw $0003                                                             ;84C2D8;
    dw DrawInst_DoorFacingDown_AA67                                      ;84C2DA;
    dw $0004                                                             ;84C2DC;
    dw DrawInst_GreenDoorFacingDown_0                                    ;84C2DE;
    dw $0003                                                             ;84C2E0;
    dw DrawInst_DoorFacingDown_AA67                                      ;84C2E2;
    dw $0004                                                             ;84C2E4;
    dw DrawInst_GreenDoorFacingDown_0                                    ;84C2E6;
    dw Instruction_PLM_GotoY                                             ;84C2E8;
    dw InstList_PLM_GreenDoorFacingDown_2                                ;84C2EA;

InstList_PLM_GreenDoorFacingDown_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C2EC;
    db $07                                                               ;84C2EE;
    dw $0006                                                             ;84C2EF;
    dw DrawInst_GreenDoorFacingDown_1                                    ;84C2F1;
    dw $0006                                                             ;84C2F3;
    dw DrawInst_GreenDoorFacingDown_2                                    ;84C2F5;
    dw $0006                                                             ;84C2F7;
    dw DrawInst_GreenDoorFacingDown_3                                    ;84C2F9;
    dw $0001                                                             ;84C2FB;
    dw DrawInst_DoorFacingDown_A69B                                      ;84C2FD;
    dw Instruction_PLM_Delete                                            ;84C2FF;

InstList_PLM_RedDoorFacingLeft_0:
    dw $0002                                                             ;84C301;
    dw DrawInst_DoorFacingLeft_A677                                      ;84C303;
    dw $0002                                                             ;84C305;
    dw DrawInst_RedDoorFacingLeft_3                                      ;84C307;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C309;
    db $08                                                               ;84C30B;
    dw $0002                                                             ;84C30C;
    dw DrawInst_RedDoorFacingLeft_2                                      ;84C30E;
    dw $0002                                                             ;84C310;
    dw DrawInst_RedDoorFacingLeft_1                                      ;84C312;
    dw $0001                                                             ;84C314;
    dw DrawInst_RedDoorFacingLeft_0                                      ;84C316;

InstList_PLM_RedDoorFacingLeft_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84C318;
    dw InstList_PLM_ClosedBlueDoorFacingLeft_40                          ;84C31A;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84C31C;
    dw InstList_PLM_RedDoorFacingLeft_3                                  ;84C31E;
    dw Instruction_PLM_PreInstruction_inY                                ;84C320;
    dw PreInstruction_PLM_GotoLinkInstructionIfShotWithAMissile          ;84C322;
    dw $0001                                                             ;84C324;
    dw DrawInst_RedDoorFacingLeft_0                                      ;84C326;

InstList_PLM_RedDoorFacingLeft_2:
    dw Instruction_PLM_Sleep                                             ;84C328;

InstList_PLM_RedDoorFacingLeft_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY                   ;84C32A;
    db $05                                                               ;84C32C;
    dw InstList_PLM_RedDoorFacingLeft_4                                  ;84C32D;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C32F;
    db $09                                                               ;84C331;
    dw $0003                                                             ;84C332;
    dw DrawInst_DoorFacingLeft_A9B3                                      ;84C334;
    dw $0004                                                             ;84C336;
    dw DrawInst_RedDoorFacingLeft_0                                      ;84C338;
    dw $0003                                                             ;84C33A;
    dw DrawInst_DoorFacingLeft_A9B3                                      ;84C33C;
    dw $0004                                                             ;84C33E;
    dw DrawInst_RedDoorFacingLeft_0                                      ;84C340;
    dw $0003                                                             ;84C342;
    dw DrawInst_DoorFacingLeft_A9B3                                      ;84C344;
    dw $0004                                                             ;84C346;
    dw DrawInst_RedDoorFacingLeft_0                                      ;84C348;
    dw Instruction_PLM_GotoY                                             ;84C34A;
    dw InstList_PLM_RedDoorFacingLeft_2                                  ;84C34C;

InstList_PLM_RedDoorFacingLeft_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C34E;
    db $07                                                               ;84C350;
    dw $0006                                                             ;84C351;
    dw DrawInst_RedDoorFacingLeft_1                                      ;84C353;
    dw $0006                                                             ;84C355;
    dw DrawInst_RedDoorFacingLeft_2                                      ;84C357;
    dw $0006                                                             ;84C359;
    dw DrawInst_RedDoorFacingLeft_3                                      ;84C35B;
    dw $0001                                                             ;84C35D;
    dw DrawInst_DoorFacingLeft_A677                                      ;84C35F;
    dw Instruction_PLM_Delete                                            ;84C361;

InstList_PLM_RedDoorFacingRight_0:
    dw $0002                                                             ;84C363;
    dw DrawInst_DoorFacingRight_A683                                     ;84C365;
    dw $0002                                                             ;84C367;
    dw DrawInst_RedDoorFacingRight_3                                     ;84C369;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C36B;
    db $08                                                               ;84C36D;
    dw $0002                                                             ;84C36E;
    dw DrawInst_RedDoorFacingRight_2                                     ;84C370;
    dw $0002                                                             ;84C372;
    dw DrawInst_RedDoorFacingRight_1                                     ;84C374;
    dw $0001                                                             ;84C376;
    dw DrawInst_RedDoorFacingRight_0                                     ;84C378;

InstList_PLM_RedDoorFacingRight_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84C37A;
    dw InstList_PLM_ClosedBlueDoorFacingLeft_41                          ;84C37C;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84C37E;
    dw InstList_PLM_RedDoorFacingRight_3                                 ;84C380;
    dw Instruction_PLM_PreInstruction_inY                                ;84C382;
    dw PreInstruction_PLM_GotoLinkInstructionIfShotWithAMissile          ;84C384;
    dw $0001                                                             ;84C386;
    dw DrawInst_RedDoorFacingRight_0                                     ;84C388;

InstList_PLM_RedDoorFacingRight_2:
    dw Instruction_PLM_Sleep                                             ;84C38A;

InstList_PLM_RedDoorFacingRight_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY                   ;84C38C;
    db $05                                                               ;84C38E;
    dw InstList_PLM_RedDoorFacingRight_4                                 ;84C38F;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C391;
    db $09                                                               ;84C393;
    dw $0003                                                             ;84C394;
    dw DrawInst_DoorFacingRight_A9EF                                     ;84C396;
    dw $0004                                                             ;84C398;
    dw DrawInst_RedDoorFacingRight_0                                     ;84C39A;
    dw $0003                                                             ;84C39C;
    dw DrawInst_DoorFacingRight_A9EF                                     ;84C39E;
    dw $0004                                                             ;84C3A0;
    dw DrawInst_RedDoorFacingRight_0                                     ;84C3A2;
    dw $0003                                                             ;84C3A4;
    dw DrawInst_DoorFacingRight_A9EF                                     ;84C3A6;
    dw $0004                                                             ;84C3A8;
    dw DrawInst_RedDoorFacingRight_0                                     ;84C3AA;
    dw Instruction_PLM_GotoY                                             ;84C3AC;
    dw InstList_PLM_RedDoorFacingRight_2                                 ;84C3AE;

InstList_PLM_RedDoorFacingRight_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C3B0;
    db $07                                                               ;84C3B2;
    dw $0006                                                             ;84C3B3;
    dw DrawInst_RedDoorFacingRight_1                                     ;84C3B5;
    dw $0006                                                             ;84C3B7;
    dw DrawInst_RedDoorFacingRight_2                                     ;84C3B9;
    dw $0006                                                             ;84C3BB;
    dw DrawInst_RedDoorFacingRight_3                                     ;84C3BD;
    dw $0001                                                             ;84C3BF;
    dw DrawInst_DoorFacingRight_A683                                     ;84C3C1;
    dw Instruction_PLM_Delete                                            ;84C3C3;

InstList_PLM_RedDoorFacingUp_0:
    dw $0002                                                             ;84C3C5;
    dw DrawInst_DoorFacingUp_A68F                                        ;84C3C7;
    dw $0002                                                             ;84C3C9;
    dw DrawInst_RedDoorFacingUp_3                                        ;84C3CB;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C3CD;
    db $08                                                               ;84C3CF;
    dw $0002                                                             ;84C3D0;
    dw DrawInst_RedDoorFacingUp_2                                        ;84C3D2;
    dw $0002                                                             ;84C3D4;
    dw DrawInst_RedDoorFacingUp_1                                        ;84C3D6;
    dw $0001                                                             ;84C3D8;
    dw DrawInst_RedDoorFacingUp_0                                        ;84C3DA;

InstList_PLM_RedDoorFacingUp_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84C3DC;
    dw InstList_PLM_ClosedBlueDoorFacingUp_42                            ;84C3DE;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84C3E0;
    dw InstList_PLM_RedDoorFacingUp_3                                    ;84C3E2;
    dw Instruction_PLM_PreInstruction_inY                                ;84C3E4;
    dw PreInstruction_PLM_GotoLinkInstructionIfShotWithAMissile          ;84C3E6;
    dw $0001                                                             ;84C3E8;
    dw DrawInst_RedDoorFacingUp_0                                        ;84C3EA;

InstList_PLM_RedDoorFacingUp_2:
    dw Instruction_PLM_Sleep                                             ;84C3EC;

InstList_PLM_RedDoorFacingUp_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY                   ;84C3EE;
    db $05                                                               ;84C3F0;
    dw InstList_PLM_RedDoorFacingUp_4                                    ;84C3F1;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C3F3;
    db $09                                                               ;84C3F5;
    dw $0003                                                             ;84C3F6;
    dw DrawInst_DoorFacingUp_AA2B                                        ;84C3F8;
    dw $0004                                                             ;84C3FA;
    dw DrawInst_RedDoorFacingUp_0                                        ;84C3FC;
    dw $0003                                                             ;84C3FE;
    dw DrawInst_DoorFacingUp_AA2B                                        ;84C400;
    dw $0004                                                             ;84C402;
    dw DrawInst_RedDoorFacingUp_0                                        ;84C404;
    dw $0003                                                             ;84C406;
    dw DrawInst_DoorFacingUp_AA2B                                        ;84C408;
    dw $0004                                                             ;84C40A;
    dw DrawInst_RedDoorFacingUp_0                                        ;84C40C;
    dw Instruction_PLM_GotoY                                             ;84C40E;
    dw InstList_PLM_RedDoorFacingUp_2                                    ;84C410;

InstList_PLM_RedDoorFacingUp_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C412;
    db $07                                                               ;84C414;
    dw $0006                                                             ;84C415;
    dw DrawInst_RedDoorFacingUp_1                                        ;84C417;
    dw $0006                                                             ;84C419;
    dw DrawInst_RedDoorFacingUp_2                                        ;84C41B;
    dw $0006                                                             ;84C41D;
    dw DrawInst_RedDoorFacingUp_3                                        ;84C41F;
    dw $0001                                                             ;84C421;
    dw DrawInst_DoorFacingUp_A68F                                        ;84C423;
    dw Instruction_PLM_Delete                                            ;84C425;

InstList_PLM_RedDoorFacingDown_0:
    dw $0002                                                             ;84C427;
    dw DrawInst_DoorFacingDown_A69B                                      ;84C429;
    dw $0002                                                             ;84C42B;
    dw DrawInst_RedDoorFacingDown_3                                      ;84C42D;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C42F;
    db $08                                                               ;84C431;
    dw $0002                                                             ;84C432;
    dw DrawInst_RedDoorFacingDown_2                                      ;84C434;
    dw $0002                                                             ;84C436;
    dw DrawInst_RedDoorFacingDown_1                                      ;84C438;
    dw $0001                                                             ;84C43A;
    dw DrawInst_RedDoorFacingDown_0                                      ;84C43C;

InstList_PLM_RedDoorFacingDown_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84C43E;
    dw InstList_PLM_ClosedBlueDoorFacingUp_43                            ;84C440;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84C442;
    dw InstList_PLM_RedDoorFacingDown_3                                  ;84C444;
    dw Instruction_PLM_PreInstruction_inY                                ;84C446;
    dw PreInstruction_PLM_GotoLinkInstructionIfShotWithAMissile          ;84C448;
    dw $0001                                                             ;84C44A;
    dw DrawInst_RedDoorFacingDown_0                                      ;84C44C;

InstList_PLM_RedDoorFacingDown_2:
    dw Instruction_PLM_Sleep                                             ;84C44E;

InstList_PLM_RedDoorFacingDown_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY                   ;84C450;
    db $05                                                               ;84C452;
    dw InstList_PLM_RedDoorFacingDown_4                                  ;84C453;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C455;
    db $09                                                               ;84C457;
    dw $0003                                                             ;84C458;
    dw DrawInst_DoorFacingDown_AA67                                      ;84C45A;
    dw $0004                                                             ;84C45C;
    dw DrawInst_RedDoorFacingDown_0                                      ;84C45E;
    dw $0003                                                             ;84C460;
    dw DrawInst_DoorFacingDown_AA67                                      ;84C462;
    dw $0004                                                             ;84C464;
    dw DrawInst_RedDoorFacingDown_0                                      ;84C466;
    dw $0003                                                             ;84C468;
    dw DrawInst_DoorFacingDown_AA67                                      ;84C46A;
    dw $0004                                                             ;84C46C;
    dw DrawInst_RedDoorFacingDown_0                                      ;84C46E;
    dw Instruction_PLM_GotoY                                             ;84C470;
    dw InstList_PLM_RedDoorFacingDown_2                                  ;84C472;

InstList_PLM_RedDoorFacingDown_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C474;
    db $07                                                               ;84C476;
    dw $0006                                                             ;84C477;
    dw DrawInst_RedDoorFacingDown_1                                      ;84C479;
    dw $0006                                                             ;84C47B;
    dw DrawInst_RedDoorFacingDown_2                                      ;84C47D;
    dw $0006                                                             ;84C47F;
    dw DrawInst_RedDoorFacingDown_3                                      ;84C481;
    dw $0001                                                             ;84C483;
    dw DrawInst_DoorFacingDown_A69B                                      ;84C485;
    dw Instruction_PLM_Delete                                            ;84C487;

InstList_PLM_BlueDoorFacingLeftOpened_40:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C489;
    db $07                                                               ;84C48B;
    dw $0006                                                             ;84C48C;
    dw DrawInst_BlueDoorFacingLeft_0                                     ;84C48E;
    dw $0006                                                             ;84C490;
    dw DrawInst_BlueDoorFacingLeft_1                                     ;84C492;
    dw $0006                                                             ;84C494;
    dw DrawInst_BlueDoorFacingLeft_2                                     ;84C496;
    dw $005E                                                             ;84C498;
    dw DrawInst_DoorFacingLeft_A677                                      ;84C49A;
    dw Instruction_PLM_Delete                                            ;84C49C;

InstList_PLM_BlueDoorFacingLeftClosed:
    dw $0002                                                             ;84C49E;
    dw DrawInst_DoorFacingLeft_A677                                      ;84C4A0;
    dw $0002                                                             ;84C4A2;
    dw DrawInst_BlueDoorFacingLeft_2                                     ;84C4A4;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C4A6;
    db $08                                                               ;84C4A8;
    dw $0002                                                             ;84C4A9;
    dw DrawInst_BlueDoorFacingLeft_1                                     ;84C4AB;
    dw $0002                                                             ;84C4AD;
    dw DrawInst_BlueDoorFacingLeft_0                                     ;84C4AF;

InstList_PLM_ClosedBlueDoorFacingLeft_40:
    dw Instruction_PLM_PLMBTS_Y                                          ;84C4B1;
    db $40                                                               ;84C4B3;
    dw $0001                                                             ;84C4B4;
    dw DrawInst_DoorFacingLeft_A9B3                                      ;84C4B6;
    dw Instruction_PLM_Delete                                            ;84C4B8;

InstList_PLM_BlueDoorFacingLeftOpened_41:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C4BA;
    db $07                                                               ;84C4BC;
    dw $0006                                                             ;84C4BD;
    dw DrawInst_BlueDoorFacingRight_0                                    ;84C4BF;
    dw $0006                                                             ;84C4C1;
    dw DrawInst_BlueDoorFacingRight_1                                    ;84C4C3;
    dw $0006                                                             ;84C4C5;
    dw DrawInst_BlueDoorFacingRight_2                                    ;84C4C7;
    dw $005E                                                             ;84C4C9;
    dw DrawInst_DoorFacingRight_A683                                     ;84C4CB;
    dw Instruction_PLM_Delete                                            ;84C4CD;

InstList_PLM_BlueDoorFacingRightClosed:
    dw $0002                                                             ;84C4CF;
    dw DrawInst_DoorFacingRight_A683                                     ;84C4D1;
    dw $0002                                                             ;84C4D3;
    dw DrawInst_BlueDoorFacingRight_2                                    ;84C4D5;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C4D7;
    db $08                                                               ;84C4D9;
    dw $0002                                                             ;84C4DA;
    dw DrawInst_BlueDoorFacingRight_1                                    ;84C4DC;
    dw $0002                                                             ;84C4DE;
    dw DrawInst_BlueDoorFacingRight_0                                    ;84C4E0;

InstList_PLM_ClosedBlueDoorFacingLeft_41:
    dw Instruction_PLM_PLMBTS_Y                                          ;84C4E2;
    db $41                                                               ;84C4E4;
    dw $0001                                                             ;84C4E5;
    dw DrawInst_DoorFacingRight_A9EF                                     ;84C4E7;
    dw Instruction_PLM_Delete                                            ;84C4E9;

InstList_PLM_BlueDoorFacingUpOpened_42:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C4EB;
    db $07                                                               ;84C4ED;
    dw $0006                                                             ;84C4EE;
    dw DrawInst_BlueDoorFacingUp_0                                       ;84C4F0;
    dw $0006                                                             ;84C4F2;
    dw DrawInst_BlueDoorFacingUp_1                                       ;84C4F4;
    dw $0006                                                             ;84C4F6;
    dw DrawInst_BlueDoorFacingUp_2                                       ;84C4F8;
    dw $005E                                                             ;84C4FA;
    dw DrawInst_DoorFacingUp_A68F                                        ;84C4FC;
    dw Instruction_PLM_Delete                                            ;84C4FE;

InstList_PLM_BlueDoorFacingUpClosed_42:
    dw $0002                                                             ;84C500;
    dw DrawInst_DoorFacingUp_A68F                                        ;84C502;
    dw $0002                                                             ;84C504;
    dw DrawInst_BlueDoorFacingUp_2                                       ;84C506;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C508;
    db $08                                                               ;84C50A;
    dw $0002                                                             ;84C50B;
    dw DrawInst_BlueDoorFacingUp_1                                       ;84C50D;
    dw $0002                                                             ;84C50F;
    dw DrawInst_BlueDoorFacingUp_0                                       ;84C511;

InstList_PLM_ClosedBlueDoorFacingUp_42:
    dw Instruction_PLM_PLMBTS_Y                                          ;84C513;
    db $42                                                               ;84C515;
    dw $0001                                                             ;84C516;
    dw DrawInst_DoorFacingUp_AA2B                                        ;84C518;
    dw Instruction_PLM_Delete                                            ;84C51A;

InstList_PLM_BlueDoorFacingUpOpened_43:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C51C;
    db $07                                                               ;84C51E;
    dw $0006                                                             ;84C51F;
    dw DrawInst_BlueDoorFacingDown_0                                     ;84C521;
    dw $0006                                                             ;84C523;
    dw DrawInst_BlueDoorFacingDown_1                                     ;84C525;
    dw $0006                                                             ;84C527;
    dw DrawInst_BlueDoorFacingDown_2                                     ;84C529;
    dw $005E                                                             ;84C52B;
    dw DrawInst_DoorFacingDown_A69B                                      ;84C52D;
    dw Instruction_PLM_Delete                                            ;84C52F;

InstList_PLM_BlueDoorFacingUpClosed_43:
    dw $0002                                                             ;84C531;
    dw DrawInst_DoorFacingDown_A69B                                      ;84C533;
    dw $0002                                                             ;84C535;
    dw DrawInst_BlueDoorFacingDown_2                                     ;84C537;
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6                            ;84C539;
    db $08                                                               ;84C53B;
    dw $0002                                                             ;84C53C;
    dw DrawInst_BlueDoorFacingDown_1                                     ;84C53E;
    dw $0002                                                             ;84C540;
    dw DrawInst_BlueDoorFacingDown_0                                     ;84C542;

InstList_PLM_ClosedBlueDoorFacingUp_43:
    dw Instruction_PLM_PLMBTS_Y                                          ;84C544;
    db $43                                                               ;84C546;
    dw $0001                                                             ;84C547;
    dw DrawInst_DoorFacingDown_AA67                                      ;84C549;
    dw Instruction_PLM_Delete                                            ;84C54B;

Setup_LeftGreenGateTrigger:
    LDX.W $0DDE                                                          ;84C54D;
    LDA.W $0C18,X                                                        ;84C550;
    AND.W #$0FFF                                                         ;84C553;
    CMP.W #$0200                                                         ;84C556;
    BNE .playSFX                                                         ;84C559;
    JMP.W TriggerPLMOfBlockToTheRight                                    ;84C55B;


.playSFX:
    LDA.W #$0057                                                         ;84C55E;
    JSL.L QueueSound_Lib2_Max6                                           ;84C561;
    LDA.W #$0000                                                         ;84C565;
    STA.W $1C37,Y                                                        ;84C568;
    RTS                                                                  ;84C56B;


Setup_RightGreenGateTrigger:
    LDX.W $0DDE                                                          ;84C56C;
    LDA.W $0C18,X                                                        ;84C56F;
    AND.W #$0FFF                                                         ;84C572;
    CMP.W #$0200                                                         ;84C575;
    BNE .playSFX                                                         ;84C578;
    JMP.W TriggerPLMOfBlockToTheLeft                                     ;84C57A;


.playSFX:
    LDA.W #$0057                                                         ;84C57D;
    JSL.L QueueSound_Lib2_Max6                                           ;84C580;
    LDA.W #$0000                                                         ;84C584;
    STA.W $1C37,Y                                                        ;84C587;
    RTS                                                                  ;84C58A;


Setup_LeftRedGateTrigger:
    LDX.W $0DDE                                                          ;84C58B;
    LDA.W $0C18,X                                                        ;84C58E;
    AND.W #$0FFF                                                         ;84C591;
    CMP.W #$0100                                                         ;84C594;
    BEQ .triggerPLM                                                      ;84C597;
    CMP.W #$0200                                                         ;84C599;
    BNE .playSFX                                                         ;84C59C;

.triggerPLM:
    JMP.W TriggerPLMOfBlockToTheRight                                    ;84C59E;


.playSFX:
    LDA.W #$0057                                                         ;84C5A1;
    JSL.L QueueSound_Lib2_Max6                                           ;84C5A4;
    LDA.W #$0000                                                         ;84C5A8;
    STA.W $1C37,Y                                                        ;84C5AB;
    RTS                                                                  ;84C5AE;


Setup_RightRedGateTrigger:
    LDX.W $0DDE                                                          ;84C5AF;
    LDA.W $0C18,X                                                        ;84C5B2;
    AND.W #$0FFF                                                         ;84C5B5;
    CMP.W #$0100                                                         ;84C5B8;
    BEQ .triggerPLM                                                      ;84C5BB;
    CMP.W #$0200                                                         ;84C5BD;
    BNE .playSFX                                                         ;84C5C0;

.triggerPLM:
    JMP.W TriggerPLMOfBlockToTheLeft                                     ;84C5C2;


.playSFX:
    LDA.W #$0057                                                         ;84C5C5;
    JSL.L QueueSound_Lib2_Max6                                           ;84C5C8;
    LDA.W #$0000                                                         ;84C5CC;
    STA.W $1C37,Y                                                        ;84C5CF;
    RTS                                                                  ;84C5D2;


Setup_LeftYellowGateTrigger:
    LDX.W $0DDE                                                          ;84C5D3;
    LDA.W $0C18,X                                                        ;84C5D6;
    AND.W #$0FFF                                                         ;84C5D9;
    CMP.W #$0300                                                         ;84C5DC;
    BNE .playSFX                                                         ;84C5DF;
    JMP.W TriggerPLMOfBlockToTheRight                                    ;84C5E1;


.playSFX:
    LDA.W #$0057                                                         ;84C5E4;
    JSL.L QueueSound_Lib2_Max6                                           ;84C5E7;
    LDA.W #$0000                                                         ;84C5EB;
    STA.W $1C37,Y                                                        ;84C5EE;

RightYellowGateTrigger:
    LDX.W $0DDE                                                          ;84C5F1;
    LDA.W $0C18,X                                                        ;84C5F4;
    AND.W #$0FFF                                                         ;84C5F7;
    CMP.W #$0300                                                         ;84C5FA;
    BNE .playSFX                                                         ;84C5FD;
    JMP.W TriggerPLMOfBlockToTheLeft                                     ;84C5FF;


.playSFX:
    LDA.W #$0057                                                         ;84C602;
    JSL.L QueueSound_Lib2_Max6                                           ;84C605;
    LDA.W #$0000                                                         ;84C609;
    STA.W $1C37,Y                                                        ;84C60C;
    RTS                                                                  ;84C60F;


Setup_LeftBlueGateTrigger:
    LDX.W $0DDE                                                          ;84C610;
    LDA.W $0C18,X                                                        ;84C613;
    AND.W #$0FFF                                                         ;84C616;
    CMP.W #$0300                                                         ;84C619;
    BEQ .deletePLM                                                       ;84C61C;
    JMP.W TriggerPLMOfBlockToTheRight                                    ;84C61E;


.deletePLM:
    LDA.W #$0000                                                         ;84C621;
    STA.W $1C37,Y                                                        ;84C624;

Setup_RightBlueGateTrigger:
    LDX.W $0DDE                                                          ;84C627;
    LDA.W $0C18,X                                                        ;84C62A;
    AND.W #$0FFF                                                         ;84C62D;
    CMP.W #$0300                                                         ;84C630;
    BEQ .deletePLM                                                       ;84C633;
    JMP.W TriggerPLMOfBlockToTheLeft                                     ;84C635;


.deletePLM:
    LDA.W #$0000                                                         ;84C638;
    STA.W $1C37,Y                                                        ;84C63B;
    RTS                                                                  ;84C63E;


TriggerPLMOfBlockToTheRight:
    LDA.W $1C87,Y                                                        ;84C63F;
    INC A                                                                ;84C642;
    INC A                                                                ;84C643;
    JMP.W TriggerPLMAtBlockIndex_A                                       ;84C644;


TriggerPLMOfBlockToTheLeft:
    LDA.W $1C87,Y                                                        ;84C647;
    DEC A                                                                ;84C64A;
    DEC A                                                                ;84C64B;

TriggerPLMAtBlockIndex_A:
    LDX.W #$004E                                                         ;84C64C;

.loop:
    CMP.W $1C87,X                                                        ;84C64F;
    BEQ .found                                                           ;84C652;
    DEX                                                                  ;84C654;
    DEX                                                                  ;84C655;
    BPL .loop                                                            ;84C656;
    BRA .return                                                          ;84C658;


.found:
    LDA.W $1D77,X                                                        ;84C65A;
    BNE .return                                                          ;84C65D;
    INC.W $1D77,X                                                        ;84C65F;

.return:
    LDA.W #$0000                                                         ;84C662;
    STA.W $1C37,Y                                                        ;84C665;
    SEC                                                                  ;84C668;
    RTS                                                                  ;84C669;


Give5BlockColumnBelowPLM_BTS10:
    LDA.W $1C87,Y                                                        ;84C66A;
    LSR A                                                                ;84C66D;
    TAX                                                                  ;84C66E;
    JSR.W PLM_BTS10_MovePLMDownARow                                      ;84C66F;
    JSR.W PLM_BTS10_MovePLMDownARow                                      ;84C672;
    JSR.W PLM_BTS10_MovePLMDownARow                                      ;84C675;
    JSR.W PLM_BTS10_MovePLMDownARow                                      ;84C678;
    JSR.W PLM_BTS10_MovePLMDownARow                                      ;84C67B;
    RTS                                                                  ;84C67E;


PLM_BTS10_MovePLMDownARow:
    LDA.L $7F6402,X                                                      ;84C67F;
    AND.W #$FF00                                                         ;84C683;
    ORA.W #$0010                                                         ;84C686;
    STA.L $7F6402,X                                                      ;84C689;
    TXA                                                                  ;84C68D;
    CLC                                                                  ;84C68E;
    ADC.W $07A5                                                          ;84C68F;
    TAX                                                                  ;84C692;
    RTS                                                                  ;84C693;


Give5BlockColumnAbovePLM_BTS10:
    LDA.W $1C87,Y                                                        ;84C694;
    LSR A                                                                ;84C697;
    TAX                                                                  ;84C698;
    JSR.W PLM_BTS10_MovePLMUpARow                                        ;84C699;
    JSR.W PLM_BTS10_MovePLMUpARow                                        ;84C69C;
    JSR.W PLM_BTS10_MovePLMUpARow                                        ;84C69F;
    JSR.W PLM_BTS10_MovePLMUpARow                                        ;84C6A2;
    JSR.W PLM_BTS10_MovePLMUpARow                                        ;84C6A5;
    RTS                                                                  ;84C6A8;


PLM_BTS10_MovePLMUpARow:
    LDA.L $7F6402,X                                                      ;84C6A9;
    AND.W #$FF00                                                         ;84C6AD;
    ORA.W #$0010                                                         ;84C6B0;
    STA.L $7F6402,X                                                      ;84C6B3;
    TXA                                                                  ;84C6B7;
    SEC                                                                  ;84C6B8;
    SBC.W $07A5                                                          ;84C6B9;
    TAX                                                                  ;84C6BC;
    RTS                                                                  ;84C6BD;


Setup_DownwardsClosedGate:
    PHY                                                                  ;84C6BE;
    LDY.W #EnemyProjectile_DownwardsShotGateInitiallyClosed              ;84C6BF;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84C6C2;
    PLY                                                                  ;84C6C6;
    JSR.W Give5BlockColumnBelowPLM_BTS10                                 ;84C6C7;
    RTS                                                                  ;84C6CA;


Setup_UpwardsClosedGate:
    PHY                                                                  ;84C6CB;
    LDY.W #EnemyProjectile_UpwardsShotGateInitiallyClosed                ;84C6CC;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84C6CF;
    PLY                                                                  ;84C6D3;
    JSR.W Give5BlockColumnAbovePLM_BTS10                                 ;84C6D4;
    RTS                                                                  ;84C6D7;


Setup_DownwardsOpenGate:
    JSR.W Give5BlockColumnBelowPLM_BTS10                                 ;84C6D8;
    RTS                                                                  ;84C6DB;


Setup_UpwardsOpenGate:
    JSR.W Give5BlockColumnAbovePLM_BTS10                                 ;84C6DC;
    RTS                                                                  ;84C6DF;


Setup_DownwardsGateShotblock:
    LDX.W $1DC7,Y                                                        ;84C6E0;
    LDA.W .instListPointers,X                                            ;84C6E3;
    STA.W $1D27,Y                                                        ;84C6E6;
    LDX.W $1DC7,Y                                                        ;84C6E9;
    LDA.W .leftBlock,X                                                   ;84C6EC;
    BEQ .noRoomArg                                                       ;84C6EF;
    LDX.W $1C87,Y                                                        ;84C6F1;
    DEX                                                                  ;84C6F4;
    DEX                                                                  ;84C6F5;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84C6F6;

.noRoomArg:
    LDX.W $1DC7,Y                                                        ;84C6F9;
    LDA.W .rightBlock,X                                                  ;84C6FC;
    BEQ .return                                                          ;84C6FF;
    LDX.W $1C87,Y                                                        ;84C701;
    INX                                                                  ;84C704;
    INX                                                                  ;84C705;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84C706;

.return:
    RTS                                                                  ;84C709;


.instListPointers:
    dw InstList_PLM_DownwardsGateShotblock_BlueLeft                      ;84C70A;
    dw InstList_PLM_DownwardsGateShotblock_BlueRight                     ;84C70C;
    dw InstList_PLM_DownwardsGateShotblock_RedLeft                       ;84C70E;
    dw InstList_PLM_DownwardsGateShotblock_RedRight                      ;84C710;
    dw InstList_PLM_DownwardsGateShotblock_GreenLeft                     ;84C712;
    dw InstList_PLM_DownwardsGateShotblock_GreenRight                    ;84C714;
    dw InstList_PLM_DownwardsGateShotblock_YellowLeft                    ;84C716;
    dw InstList_PLM_DownwardsGateShotblock_YellowRight                   ;84C718;

.leftBlock:
    dw $C046,$0000,$C048,$0000,$C04A,$0000,$C04C,$0000                   ;84C71A;

.rightBlock:
    dw $0000,$C047,$0000,$C049,$0000,$C04B,$0000,$C04D                   ;84C72A;

Setup_UpwardsGateShotblock:
    LDX.W $1DC7,Y                                                        ;84C73A;
    LDA.W .instListPointers,X                                            ;84C73D;
    STA.W $1D27,Y                                                        ;84C740;
    LDX.W $1DC7,Y                                                        ;84C743;
    LDA.W .leftBlock,X                                                   ;84C746;
    BEQ .noRoomArg                                                       ;84C749;
    LDX.W $1C87,Y                                                        ;84C74B;
    DEX                                                                  ;84C74E;
    DEX                                                                  ;84C74F;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84C750;

.noRoomArg:
    LDX.W $1DC7,Y                                                        ;84C753;
    LDA.W .rightBlock,X                                                  ;84C756;
    BEQ .return                                                          ;84C759;
    LDX.W $1C87,Y                                                        ;84C75B;
    INX                                                                  ;84C75E;
    INX                                                                  ;84C75F;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84C760;

.return:
    RTS                                                                  ;84C763;


.instListPointers:
    dw InstList_PLM_UpwardsGateShotblock_BlueLeft                        ;84C764;
    dw InstList_PLM_UpwardsGateShotblock_BlueRight                       ;84C766;
    dw InstList_PLM_UpwardsGateShotblock_RedLeft                         ;84C768;
    dw InstList_PLM_UpwardsGateShotblock_RedRight                        ;84C76A;
    dw InstList_PLM_UpwardsGateShotblock_GreenLeft                       ;84C76C;
    dw InstList_PLM_UpwardsGateShotblock_GreenRight                      ;84C76E;
    dw InstList_PLM_UpwardsGateShotblock_YellowLeft                      ;84C770;
    dw InstList_PLM_UpwardsGateShotblock_YellowRight                     ;84C772;

.leftBlock:
    dw $C046,$0000,$C048,$0000,$C04A,$0000,$C04C,$0000                   ;84C774;

.rightBlock:
    dw $0000,$C047,$0000,$C049,$0000,$C04B,$0000,$C04D                   ;84C784;

Setup_GreyDoor:
    LDA.W $1DC8,Y                                                        ;84C794;
    AND.W #$007C                                                         ;84C797;
    LSR A                                                                ;84C79A;
    STA.W $1E17,Y                                                        ;84C79B;
    LDA.W $1DC7,Y                                                        ;84C79E;
    AND.W #$83FF                                                         ;84C7A1;
    STA.W $1DC7,Y                                                        ;84C7A4;
    LDX.W $1C87,Y                                                        ;84C7A7;
    LDA.W #$C044                                                         ;84C7AA;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84C7AD;
    RTS                                                                  ;84C7B0;


Setup_ColoredDoor:
    LDX.W $1C87,Y                                                        ;84C7B1;
    LDA.W #$C044                                                         ;84C7B4;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84C7B7;
    RTS                                                                  ;84C7BA;


Setup_BlueDoor:
    LDX.W $0DDE                                                          ;84C7BB;
    LDA.W $0C18,X                                                        ;84C7BE;
    AND.W #$0F00                                                         ;84C7C1;
    CMP.W #$0300                                                         ;84C7C4;
    BNE .notPowerBomb                                                    ;84C7C7;
    LDA.W #$0000                                                         ;84C7C9;
    STA.W $1C37,Y                                                        ;84C7CC;
    RTS                                                                  ;84C7CF;


.notPowerBomb:
    LDX.W $1C87,Y                                                        ;84C7D0;
    LDA.L $7F0002,X                                                      ;84C7D3;
    AND.W #$0FFF                                                         ;84C7D7;
    ORA.W #$8000                                                         ;84C7DA;
    STA.L $7F0002,X                                                      ;84C7DD;
    RTS                                                                  ;84C7E1;


Setup_GenericShotTriggerForAPLM:
    TYX                                                                  ;84C7E2;
    LDA.W $1C87,X                                                        ;84C7E3;
    STZ.W $1C87,X                                                        ;84C7E6;
    LDX.W #$004E                                                         ;84C7E9;

.loop:
    CMP.W $1C87,X                                                        ;84C7EC;
    BEQ .found                                                           ;84C7EF;
    DEX                                                                  ;84C7F1;
    DEX                                                                  ;84C7F2;
    BPL .loop                                                            ;84C7F3;
    RTS                                                                  ;84C7F5;


.found:
    LDY.W $0DDE                                                          ;84C7F6;
    LDA.W $0C18,Y                                                        ;84C7F9;
    AND.W #$1FFF                                                         ;84C7FC;
    ORA.W #$8000                                                         ;84C7FF;
    STA.W $1D77,X                                                        ;84C802;
    RTS                                                                  ;84C805;


PLMEntries_leftGreenGateTrigger:
    dw Setup_LeftGreenGateTrigger                                        ;84C806;
    dw InstList_PLM_Delete                                               ;84C808;

PLMEntries_rightGreenGateTrigger:
    dw Setup_RightGreenGateTrigger                                       ;84C80A;
    dw InstList_PLM_Delete                                               ;84C80C;

PLMEntries_leftRedGateTrigger:
    dw Setup_LeftRedGateTrigger                                          ;84C80E;
    dw InstList_PLM_Delete                                               ;84C810;

PLMEntries_rightRedGateTrigger:
    dw Setup_RightRedGateTrigger                                         ;84C812;
    dw InstList_PLM_Delete                                               ;84C814;

PLMEntries_leftBlueGateTrigger:
    dw Setup_LeftBlueGateTrigger                                         ;84C816;
    dw InstList_PLM_Delete                                               ;84C818;

PLMEntries_rightBlueGateTrigger:
    dw Setup_RightBlueGateTrigger                                        ;84C81A;
    dw InstList_PLM_Delete                                               ;84C81C;

PLMEntries_leftYellowGateTrigger:
    dw Setup_LeftYellowGateTrigger                                       ;84C81E;
    dw InstList_PLM_Delete                                               ;84C820;

PLMEntries_rightYellowGateTrigger:
    dw RightYellowGateTrigger                                            ;84C822;
    dw InstList_PLM_Delete                                               ;84C824;

PLMEntries_downwardsOpenGate:
    dw Setup_DownwardsOpenGate                                           ;84C826;
    dw InstList_PLM_DownwardsOpenGate                                    ;84C828;

PLMEntries_downwardsClosedGate:
    dw Setup_DownwardsClosedGate                                         ;84C82A;
    dw InstList_PLM_DownwardsClosedGate                                  ;84C82C;

PLMEntries_upwardsOpenGate:
    dw Setup_UpwardsOpenGate                                             ;84C82E;
    dw InstList_PLM_UpwardsOpenGate                                      ;84C830;

PLMEntries_upwardsClosedGate:
    dw Setup_UpwardsClosedGate                                           ;84C832;
    dw InstList_PLM_UpwardsClosedGate                                    ;84C834;

PLMEntries_downwardsGateShotblock:
    dw Setup_DownwardsGateShotblock                                      ;84C836;
    dw InstList_PLM_DownwardsGateShotblock_BlueLeft                      ;84C838;

PLMEntries_upwardsGateShotblock:
    dw Setup_UpwardsGateShotblock                                        ;84C83A;
    dw InstList_PLM_UpwardsGateShotblock_BlueLeft                        ;84C83C;

PLMEntries_genericShotTriggerForAPLM:
    dw Setup_GenericShotTriggerForAPLM                                   ;84C83E;
    dw InstList_PLM_Delete                                               ;84C840;

PLMEntries_greyDoorFacingLeft:
    dw Setup_GreyDoor                                                    ;84C842;
    dw InstList_PLM_GreyDoorFacingLeft_1                                 ;84C844;
    dw InstList_PLM_GreyDoorFacingLeft_0                                 ;84C846;

PLMEntries_greyDoorFacingRight:
    dw Setup_GreyDoor                                                    ;84C848;
    dw InstList_PLM_GreyDoorFacingRight_1                                ;84C84A;
    dw InstList_PLM_GreyDoorFacingRight_0                                ;84C84C;

PLMEntries_greyDoorFacingUp:
    dw Setup_GreyDoor                                                    ;84C84E;
    dw InstList_PLM_GreyDoorFacingUp_1                                   ;84C850;
    dw InstList_PLM_GreyDoorFacingUp_0                                   ;84C852;

PLMEntries_greyDoorFacingDown:
    dw Setup_GreyDoor                                                    ;84C854;
    dw InstList_PLM_GreyDoorFacingDown_1                                 ;84C856;
    dw InstList_PLM_GreyDoorFacingDown_0                                 ;84C858;

PLMEntries_yellowDoorFacingLeft:
    dw Setup_ColoredDoor                                                 ;84C85A;
    dw InstList_PLM_YellowDoorFacingLeft_1                               ;84C85C;
    dw InstList_PLM_YellowDoorFacingLeft_0                               ;84C85E;

PLMEntries_yellowDoorFacingRIght:
    dw Setup_ColoredDoor                                                 ;84C860;
    dw InstList_PLM_YellowDoorFacingRight_1                              ;84C862;
    dw InstList_PLM_YellowDoorFacingRight_0                              ;84C864;

PLMEntries_yellowDoorFacingUp:
    dw Setup_ColoredDoor                                                 ;84C866;
    dw InstList_PLM_YellowDoorFacingUp_1                                 ;84C868;
    dw InstList_PLM_YellowDoorFacingUp_0                                 ;84C86A;

PLMEntries_yellowDoorFacingDown:
    dw Setup_ColoredDoor                                                 ;84C86C;
    dw InstList_PLM_YellowDoorFacingDown_1                               ;84C86E;
    dw InstList_PLM_YellowDoorFacingDown_0                               ;84C870;

PLMEntries_greenDoorFacingLeft:
    dw Setup_ColoredDoor                                                 ;84C872;
    dw InstList_PLM_GreenDoorFacingLeft_1                                ;84C874;
    dw InstList_PLM_GreenDoorFacingLeft_0                                ;84C876;

PLMEntries_greenDoorFacingRight:
    dw Setup_ColoredDoor                                                 ;84C878;
    dw InstList_PLM_GreenDoorFacingRight_1                               ;84C87A;
    dw InstList_PLM_GreenDoorFacingRight_0                               ;84C87C;

PLMEntries_greenDoorFacingUp:
    dw Setup_ColoredDoor                                                 ;84C87E;
    dw InstList_PLM_GreenDoorFacingUp_1                                  ;84C880;
    dw InstList_PLM_GreenDoorFacingUp_0                                  ;84C882;

PLMEntries_greenDoorFacingDown:
    dw Setup_ColoredDoor                                                 ;84C884;
    dw InstList_PLM_GreenDoorFacingDown_1                                ;84C886;
    dw InstList_PLM_GreenDoorFacingDown_0                                ;84C888;

PLMEntries_redDoorFacingLeft:
    dw Setup_ColoredDoor                                                 ;84C88A;
    dw InstList_PLM_RedDoorFacingLeft_1                                  ;84C88C;
    dw InstList_PLM_RedDoorFacingLeft_0                                  ;84C88E;

PLMEntries_redDoorFacingRight:
    dw Setup_ColoredDoor                                                 ;84C890;
    dw InstList_PLM_RedDoorFacingRight_1                                 ;84C892;
    dw InstList_PLM_RedDoorFacingRight_0                                 ;84C894;

PLMEntries_redDoorFacingUp:
    dw Setup_ColoredDoor                                                 ;84C896;
    dw InstList_PLM_RedDoorFacingUp_1                                    ;84C898;
    dw InstList_PLM_RedDoorFacingUp_0                                    ;84C89A;

PLMEntries_redDoorFacingDown:
    dw Setup_ColoredDoor                                                 ;84C89C;
    dw InstList_PLM_RedDoorFacingDown_1                                  ;84C89E;
    dw InstList_PLM_RedDoorFacingDown_0                                  ;84C8A0;

PLMEntries_blueDoorFacingLeft:
    dw Setup_BlueDoor                                                    ;84C8A2;
    dw InstList_PLM_BlueDoorFacingLeftOpened_40                          ;84C8A4;
    dw InstList_PLM_BlueDoorFacingLeftClosed                             ;84C8A6;

PLMEntries_blueDoorFacingRight:
    dw Setup_BlueDoor                                                    ;84C8A8;
    dw InstList_PLM_BlueDoorFacingLeftOpened_41                          ;84C8AA;
    dw InstList_PLM_BlueDoorFacingRightClosed                            ;84C8AC;

PLMEntries_blueDoorFacingUp:
    dw Setup_BlueDoor                                                    ;84C8AE;
    dw InstList_PLM_BlueDoorFacingUpOpened_42                            ;84C8B0;
    dw InstList_PLM_BlueDoorFacingUpClosed_42                            ;84C8B2;

PLMEntries_blueDoorFacingDown:
    dw Setup_BlueDoor                                                    ;84C8B4;
    dw InstList_PLM_BlueDoorFacingUpOpened_43                            ;84C8B6;
    dw InstList_PLM_BlueDoorFacingUpClosed_43                            ;84C8B8;

PLMEntries_blueDoorClosingFacingLeft:
    dw Setup_DeactivatePLM                                               ;84C8BA;
    dw InstList_PLM_BlueDoorFacingLeftClosed                             ;84C8BC;

PLMEntries_blueDoorClosingFacingRight:
    dw Setup_DeactivatePLM                                               ;84C8BE;
    dw InstList_PLM_BlueDoorFacingRightClosed                            ;84C8C0;

PLMEntries_blueDoorClosingFacingUp:
    dw Setup_DeactivatePLM                                               ;84C8C2;
    dw InstList_PLM_BlueDoorFacingUpClosed_42                            ;84C8C4;

PLMEntries_blueDoorClosingFacingDown:
    dw Setup_DeactivatePLM                                               ;84C8C6;
    dw InstList_PLM_BlueDoorFacingUpClosed_43                            ;84C8C8;

PLMEntries_gateThatClosesInEscapeRoom1:
    dw Setup_DeactivatePLM                                               ;84C8CA;
    dw InstList_PLM_GateThatClosesDuringEscapeAfterMotherBrain_0         ;84C8CC;
    dw InstList_PLM_GateThatClosesDuringEscapeAfterMotherBrain_1         ;84C8CE;

PLMEntries_gateThatClosesInEscapeRoom1_PLM:
    dw Setup_DeactivatePLM                                               ;84C8D0;
    dw InstList_PLM_GateThatClosesDuringEscapeAfterMotherBrain_1         ;84C8D2;

UNUSED_InstList_PLM_Draws1x1ShotBlock_84C8D4:
    dw $0001                                                             ;84C8D4;
    dw UNUSED_DrawInst_1x1ShotBlock_84A475                               ;84C8D6;
    dw Instruction_PLM_Delete                                            ;84C8D8;

UNUSED_InstList_PLM_Draws1x2ShotBlock_84C8DA:
    dw $0001                                                             ;84C8DA;
    dw DrawInst_2x1RespawningShotBlock                                   ;84C8DC;
    dw Instruction_PLM_Delete                                            ;84C8DE;

UNUSED_InstList_PLM_Draws2x1ShotBlock_84C8E0:
    dw $0001                                                             ;84C8E0;
    dw DrawInst_1x2RespawningShotBlock                                   ;84C8E2;
    dw Instruction_PLM_Delete                                            ;84C8E4;

UNUSED_InstList_PLM_Draws2x2ShotBlock_84C8E6:
    dw $0001                                                             ;84C8E6;
    dw DrawInst_2x2RespawningShotBlock                                   ;84C8E8;
    dw Instruction_PLM_Delete                                            ;84C8EA;

InstList_BombReaction_PLM_1x1RespawningCrumbleBlock:
    dw $0001                                                             ;84C8EC;
    dw DrawInst_1x1RespawningCrumbleBlock                                ;84C8EE;
    dw Instruction_PLM_Delete                                            ;84C8F0;

InstList_BombReaction_PLM_2x1RespawningCrumbleBlock:
    dw $0001                                                             ;84C8F2;
    dw DrawInst_2x1RespawningCrumbleBlock                                ;84C8F4;
    dw Instruction_PLM_Delete                                            ;84C8F6;

InstList_BombReaction_PLM_1x2RespawningCrumbleBlock:
    dw $0001                                                             ;84C8F8;
    dw DrawInst_1x2RespawningCrumbleBlock                                ;84C8FA;
    dw Instruction_PLM_Delete                                            ;84C8FC;

InstList_BombReaction_PLM_2x2RespawningCrumbleBlock:
    dw $0001                                                             ;84C8FE;
    dw DrawInst_2x2RespawningCrumbleBlock                                ;84C900;
    dw Instruction_PLM_Delete                                            ;84C902;

UNUSED_InstList_PLM_84C904:
    dw $0001                                                             ;84C904;
    dw UNUSED_DrawInst_84A4C1                                            ;84C906;
    dw Instruction_PLM_Delete                                            ;84C908;

UNUSED_InstList_PLM_84C90A:
    dw $0001                                                             ;84C90A;
    dw DrawInst_2x1RespawningBombBlock                                   ;84C90C;
    dw Instruction_PLM_Delete                                            ;84C90E;

UNUSED_InstList_PLM_84C910:
    dw $0001                                                             ;84C910;
    dw DrawInst_1x2RespawningBombBlock                                   ;84C912;
    dw Instruction_PLM_Delete                                            ;84C914;

UNUSED_InstList_PLM_84C916:
    dw $0001                                                             ;84C916;
    dw DrawInst_2x2RespawningBombBlock                                   ;84C918;
    dw Instruction_PLM_Delete                                            ;84C91A;

UNUSED_InstList_PLM_PowerBombBlockBombed_84C91C:
    dw $0001                                                             ;84C91C;
    dw UNUSED_DrawInst_PowerBombBlockBombed_84A4E7                       ;84C91E;
    dw Instruction_PLM_Delete                                            ;84C920;

UNUSED_InstList_PLM_SuperMissileBlockBombed_84C922:
    dw $0001                                                             ;84C922;
    dw UNUSED_DrawInst_SuperMissileBlockBombed_84A4ED                    ;84C924;
    dw Instruction_PLM_Delete                                            ;84C926;

InstList_PLM_BombReaction_SpeedBlock:
    dw $0001                                                             ;84C928;
    dw DrawInst_BombReactionSpeedBlock                                   ;84C92A;
    dw Instruction_PLM_Delete                                            ;84C92C;

UNUSED_InstList_PLM_84C92E:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6                            ;84C92E;
    db $06                                                               ;84C930;
    dw $0004                                                             ;84C931;
    dw DrawInst_Respawn1x1_0                                             ;84C933;
    dw $0004                                                             ;84C935;
    dw DrawInst_Respawn1x1_1                                             ;84C937;
    dw $0004                                                             ;84C939;
    dw DrawInst_Respawn1x1_2                                             ;84C93B;
    dw $0180                                                             ;84C93D;
    dw DrawInst_Respawn1x1_3                                             ;84C93F;
    dw $0004                                                             ;84C941;
    dw DrawInst_Respawn1x1_2                                             ;84C943;
    dw $0004                                                             ;84C945;
    dw DrawInst_Respawn1x1_1                                             ;84C947;
    dw $0004                                                             ;84C949;
    dw DrawInst_Respawn1x1_0                                             ;84C94B;
    dw Instruction_PLM_DrawPLMBlock                                      ;84C94D;
    dw Instruction_PLM_Delete                                            ;84C94F;

InstList_PLM_RespawningSpeedBlock_SlowerCrumbleAnimation:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84C951;
    db $06                                                               ;84C953;
    dw $0002                                                             ;84C954;
    dw DrawInst_Respawn1x1_0                                             ;84C956;
    dw $0002                                                             ;84C958;
    dw DrawInst_Respawn1x1_1                                             ;84C95A;
    dw $0002                                                             ;84C95C;
    dw DrawInst_Respawn1x1_2                                             ;84C95E;
    dw $0030                                                             ;84C960;
    dw DrawInst_Respawn1x1_3                                             ;84C962;
    dw $0004                                                             ;84C964;
    dw DrawInst_Respawn1x1_2                                             ;84C966;
    dw $0004                                                             ;84C968;
    dw DrawInst_Respawn1x1_1                                             ;84C96A;
    dw $0004                                                             ;84C96C;
    dw DrawInst_Respawn1x1_0                                             ;84C96E;
    dw Instruction_PLM_DrawPLMBlock                                      ;84C970;
    dw Instruction_PLM_Delete                                            ;84C972;

InstList_PLM_RespawningSpeedBoostBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84C974;
    db $06                                                               ;84C976;
    dw $0001                                                             ;84C977;
    dw DrawInst_Respawn1x1_0                                             ;84C979;
    dw $0001                                                             ;84C97B;
    dw DrawInst_Respawn1x1_1                                             ;84C97D;
    dw $0001                                                             ;84C97F;
    dw DrawInst_Respawn1x1_2                                             ;84C981;
    dw $0030                                                             ;84C983;
    dw DrawInst_Respawn1x1_3                                             ;84C985;
    dw $0004                                                             ;84C987;
    dw DrawInst_Respawn1x1_2                                             ;84C989;
    dw $0004                                                             ;84C98B;
    dw DrawInst_Respawn1x1_1                                             ;84C98D;
    dw $0004                                                             ;84C98F;
    dw DrawInst_Respawn1x1_0                                             ;84C991;
    dw Instruction_PLM_DrawPLMBlock                                      ;84C993;
    dw Instruction_PLM_Delete                                            ;84C995;

InstList_PLM_RespawningSpeedBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84C997;
    db $06                                                               ;84C999;
    dw $0001                                                             ;84C99A;
    dw DrawInst_Respawn1x1_0                                             ;84C99C;
    dw $0001                                                             ;84C99E;
    dw DrawInst_Respawn1x1_1                                             ;84C9A0;
    dw $0001                                                             ;84C9A2;
    dw DrawInst_Respawn1x1_2                                             ;84C9A4;
    dw $0030                                                             ;84C9A6;
    dw DrawInst_Respawn1x1_3                                             ;84C9A8;
    dw $0004                                                             ;84C9AA;
    dw DrawInst_Respawn1x1_2                                             ;84C9AC;
    dw $0004                                                             ;84C9AE;
    dw DrawInst_Respawn1x1_1                                             ;84C9B0;
    dw $0004                                                             ;84C9B2;
    dw DrawInst_Respawn1x1_0                                             ;84C9B4;
    dw Instruction_PLM_DrawPLMBlock_Clone                                ;84C9B6;
    dw Instruction_PLM_Delete                                            ;84C9B8;

UNUSED_InstList_PLM_84C9BA:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6                            ;84C9BA;
    db $06                                                               ;84C9BC;
    dw $0004                                                             ;84C9BD;
    dw DrawInst_Respawn1x1_0                                             ;84C9BF;
    dw $0004                                                             ;84C9C1;
    dw DrawInst_Respawn1x1_1                                             ;84C9C3;
    dw $0004                                                             ;84C9C5;
    dw DrawInst_Respawn1x1_2                                             ;84C9C7;
    dw $0001                                                             ;84C9C9;
    dw DrawInst_Respawn1x1_3                                             ;84C9CB;
    dw Instruction_PLM_Delete                                            ;84C9CD;

InstList_PLM_SpeedBlockSlowerCrumbleAnimation:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84C9CF;
    db $06                                                               ;84C9D1;
    dw $0002                                                             ;84C9D2;
    dw DrawInst_Respawn1x1_0                                             ;84C9D4;
    dw $0002                                                             ;84C9D6;
    dw DrawInst_Respawn1x1_1                                             ;84C9D8;
    dw $0002                                                             ;84C9DA;
    dw DrawInst_Respawn1x1_2                                             ;84C9DC;
    dw $0001                                                             ;84C9DE;
    dw DrawInst_Respawn1x1_3                                             ;84C9E0;
    dw Instruction_PLM_Delete                                            ;84C9E2;

InstList_PLM_SpeedBoostBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84C9E4;
    db $06                                                               ;84C9E6;
    dw $0001                                                             ;84C9E7;
    dw DrawInst_Respawn1x1_0                                             ;84C9E9;
    dw $0001                                                             ;84C9EB;
    dw DrawInst_Respawn1x1_1                                             ;84C9ED;
    dw $0001                                                             ;84C9EF;
    dw DrawInst_Respawn1x1_2                                             ;84C9F1;
    dw $0001                                                             ;84C9F3;
    dw DrawInst_Respawn1x1_3                                             ;84C9F5;
    dw Instruction_PLM_Delete                                            ;84C9F7;

InstList_PLM_1x1RespawningCrumbleBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84C9F9;
    db $0A                                                               ;84C9FB;
    dw $0008                                                             ;84C9FC;
    dw DrawInst_Respawn1x1_0                                             ;84C9FE;
    dw $0006                                                             ;84CA00;
    dw DrawInst_Respawn1x1_1                                             ;84CA02;
    dw $0004                                                             ;84CA04;
    dw DrawInst_Respawn1x1_2                                             ;84CA06;
    dw $0010                                                             ;84CA08;
    dw DrawInst_Respawn1x1_3                                             ;84CA0A;
    dw $0004                                                             ;84CA0C;
    dw DrawInst_Respawn1x1_2                                             ;84CA0E;
    dw $0004                                                             ;84CA10;
    dw DrawInst_Respawn1x1_1                                             ;84CA12;
    dw $0004                                                             ;84CA14;
    dw DrawInst_Respawn1x1_0                                             ;84CA16;
    dw Instruction_PLM_DrawPLMBlock                                      ;84CA18;
    dw Instruction_PLM_Delete                                            ;84CA1A;

InstList_PLM_2x1RespawningCrumbleBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84CA1C;
    db $0A                                                               ;84CA1E;
    dw $0004                                                             ;84CA1F;
    dw DrawInst_Respawn2x1_0                                             ;84CA21;
    dw $0004                                                             ;84CA23;
    dw DrawInst_Respawn2x1_1                                             ;84CA25;
    dw $0004                                                             ;84CA27;
    dw DrawInst_Respawn2x1_2                                             ;84CA29;
    dw $0010                                                             ;84CA2B;
    dw DrawInst_Respawn2x1_3                                             ;84CA2D;
    dw $0004                                                             ;84CA2F;
    dw DrawInst_Respawn2x1_2                                             ;84CA31;
    dw $0004                                                             ;84CA33;
    dw DrawInst_Respawn2x1_1                                             ;84CA35;
    dw $0004                                                             ;84CA37;
    dw DrawInst_Respawn2x1_0                                             ;84CA39;
    dw $0001                                                             ;84CA3B;
    dw DrawInst_2x1RespawningCrumbleBlock                                ;84CA3D;
    dw Instruction_PLM_Delete                                            ;84CA3F;

InstList_PLM_1x2RespawningCrumbleBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84CA41;
    db $0A                                                               ;84CA43;
    dw $0004                                                             ;84CA44;
    dw DrawInst_Respawn1x2_0                                             ;84CA46;
    dw $0004                                                             ;84CA48;
    dw DrawInst_Respawn1x2_1                                             ;84CA4A;
    dw $0004                                                             ;84CA4C;
    dw DrawInst_Respawn1x2_2                                             ;84CA4E;
    dw $0020                                                             ;84CA50;
    dw DrawInst_Respawn1x2_3                                             ;84CA52;
    dw $0004                                                             ;84CA54;
    dw DrawInst_Respawn1x2_2                                             ;84CA56;
    dw $0004                                                             ;84CA58;
    dw DrawInst_Respawn1x2_1                                             ;84CA5A;
    dw $0004                                                             ;84CA5C;
    dw DrawInst_Respawn1x2_0                                             ;84CA5E;
    dw $0001                                                             ;84CA60;
    dw DrawInst_1x2RespawningCrumbleBlock                                ;84CA62;
    dw Instruction_PLM_Delete                                            ;84CA64;

InstList_PLM_2x2RespawningCrumbleBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84CA66;
    db $0A                                                               ;84CA68;
    dw $0004                                                             ;84CA69;
    dw DrawInst_Respawn2x2_0                                             ;84CA6B;
    dw $0004                                                             ;84CA6D;
    dw DrawInst_Respawn2x2_1                                             ;84CA6F;
    dw $0004                                                             ;84CA71;
    dw DrawInst_Respawn2x2_2                                             ;84CA73;
    dw $0020                                                             ;84CA75;
    dw DrawInst_Respawn2x2_3                                             ;84CA77;
    dw $0004                                                             ;84CA79;
    dw DrawInst_Respawn2x2_2                                             ;84CA7B;
    dw $0004                                                             ;84CA7D;
    dw DrawInst_Respawn2x2_1                                             ;84CA7F;
    dw $0004                                                             ;84CA81;
    dw DrawInst_Respawn2x2_0                                             ;84CA83;
    dw $0001                                                             ;84CA85;
    dw DrawInst_2x2RespawningCrumbleBlock                                ;84CA87;
    dw Instruction_PLM_Delete                                            ;84CA89;

InstList_PLM_1x1CrumbleBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84CA8B;
    db $0A                                                               ;84CA8D;
    dw $0004                                                             ;84CA8E;
    dw DrawInst_Respawn1x1_0                                             ;84CA90;
    dw $0004                                                             ;84CA92;
    dw DrawInst_Respawn1x1_1                                             ;84CA94;
    dw $0004                                                             ;84CA96;
    dw DrawInst_Respawn1x1_2                                             ;84CA98;
    dw $0001                                                             ;84CA9A;
    dw DrawInst_Respawn1x1_3                                             ;84CA9C;
    dw Instruction_PLM_Delete                                            ;84CA9E;

InstList_PLM_2x1CrumbleBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84CAA0;
    db $0A                                                               ;84CAA2;
    dw $0004                                                             ;84CAA3;
    dw DrawInst_Respawn2x1_0                                             ;84CAA5;
    dw $0004                                                             ;84CAA7;
    dw DrawInst_Respawn2x1_1                                             ;84CAA9;
    dw $0004                                                             ;84CAAB;
    dw DrawInst_Respawn2x1_2                                             ;84CAAD;
    dw $0001                                                             ;84CAAF;
    dw DrawInst_Respawn2x1_3                                             ;84CAB1;
    dw Instruction_PLM_Delete                                            ;84CAB3;

InstList_PLM_1x2CrumbleBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84CAB5;
    db $0A                                                               ;84CAB7;
    dw $0004                                                             ;84CAB8;
    dw DrawInst_Respawn1x2_0                                             ;84CABA;
    dw $0004                                                             ;84CABC;
    dw DrawInst_Respawn1x2_1                                             ;84CABE;
    dw $0004                                                             ;84CAC0;
    dw DrawInst_Respawn1x2_2                                             ;84CAC2;
    dw $0001                                                             ;84CAC4;
    dw DrawInst_Respawn1x2_3                                             ;84CAC6;
    dw Instruction_PLM_Delete                                            ;84CAC8;

InstList_PLM_2x2CrumbleBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84CACA;
    db $0A                                                               ;84CACC;
    dw $0004                                                             ;84CACD;
    dw DrawInst_Respawn2x2_0                                             ;84CACF;
    dw $0004                                                             ;84CAD1;
    dw DrawInst_Respawn2x2_1                                             ;84CAD3;
    dw $0004                                                             ;84CAD5;
    dw DrawInst_Respawn2x2_2                                             ;84CAD7;
    dw $0001                                                             ;84CAD9;
    dw DrawInst_Respawn2x2_3                                             ;84CADB;
    dw Instruction_PLM_Delete                                            ;84CADD;

InstList_PLM_1x1RespawningShotBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84CADF;
    db $0A                                                               ;84CAE1;
    dw $0004                                                             ;84CAE2;
    dw DrawInst_Respawn1x1_0                                             ;84CAE4;
    dw $0004                                                             ;84CAE6;
    dw DrawInst_Respawn1x1_1                                             ;84CAE8;
    dw $0004                                                             ;84CAEA;
    dw DrawInst_Respawn1x1_2                                             ;84CAEC;
    dw $0180                                                             ;84CAEE;
    dw DrawInst_Respawn1x1_3                                             ;84CAF0;
    dw $0004                                                             ;84CAF2;
    dw DrawInst_Respawn1x1_2                                             ;84CAF4;
    dw $0004                                                             ;84CAF6;
    dw DrawInst_Respawn1x1_1                                             ;84CAF8;
    dw $0004                                                             ;84CAFA;
    dw DrawInst_Respawn1x1_0                                             ;84CAFC;
    dw Instruction_PLM_DrawPLMBlock                                      ;84CAFE;
    dw Instruction_PLM_Delete                                            ;84CB00;

InstList_PLM_2x1RespawningShotBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84CB02;
    db $0A                                                               ;84CB04;
    dw $0004                                                             ;84CB05;
    dw DrawInst_Respawn2x1_0                                             ;84CB07;
    dw $0004                                                             ;84CB09;
    dw DrawInst_Respawn2x1_1                                             ;84CB0B;
    dw $0004                                                             ;84CB0D;
    dw DrawInst_Respawn2x1_2                                             ;84CB0F;
    dw $0180                                                             ;84CB11;
    dw DrawInst_Respawn2x1_3                                             ;84CB13;
    dw $0004                                                             ;84CB15;
    dw DrawInst_Respawn2x1_2                                             ;84CB17;
    dw $0004                                                             ;84CB19;
    dw DrawInst_Respawn2x1_1                                             ;84CB1B;
    dw $0004                                                             ;84CB1D;
    dw DrawInst_Respawn2x1_0                                             ;84CB1F;
    dw $0001                                                             ;84CB21;
    dw DrawInst_2x1RespawningShotBlock                                   ;84CB23;
    dw Instruction_PLM_Delete                                            ;84CB25;

InstList_PLM_1x2RespawningShotBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84CB27;
    db $0A                                                               ;84CB29;
    dw $0004                                                             ;84CB2A;
    dw DrawInst_Respawn1x2_0                                             ;84CB2C;
    dw $0004                                                             ;84CB2E;
    dw DrawInst_Respawn1x2_1                                             ;84CB30;
    dw $0004                                                             ;84CB32;
    dw DrawInst_Respawn1x2_2                                             ;84CB34;
    dw $0180                                                             ;84CB36;
    dw DrawInst_Respawn1x2_3                                             ;84CB38;
    dw $0004                                                             ;84CB3A;
    dw DrawInst_Respawn1x2_2                                             ;84CB3C;
    dw $0004                                                             ;84CB3E;
    dw DrawInst_Respawn1x2_1                                             ;84CB40;
    dw $0004                                                             ;84CB42;
    dw DrawInst_Respawn1x2_0                                             ;84CB44;
    dw $0001                                                             ;84CB46;
    dw DrawInst_1x2RespawningShotBlock                                   ;84CB48;
    dw Instruction_PLM_Delete                                            ;84CB4A;

InstList_PLM_2x2RespawningShotBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84CB4C;
    db $0A                                                               ;84CB4E;
    dw $0004                                                             ;84CB4F;
    dw DrawInst_Respawn2x2_0                                             ;84CB51;
    dw $0004                                                             ;84CB53;
    dw DrawInst_Respawn2x2_1                                             ;84CB55;
    dw $0004                                                             ;84CB57;
    dw DrawInst_Respawn2x2_2                                             ;84CB59;
    dw $0180                                                             ;84CB5B;
    dw DrawInst_Respawn2x2_3                                             ;84CB5D;
    dw $0004                                                             ;84CB5F;
    dw DrawInst_Respawn2x2_2                                             ;84CB61;
    dw $0004                                                             ;84CB63;
    dw DrawInst_Respawn2x2_1                                             ;84CB65;
    dw $0004                                                             ;84CB67;
    dw DrawInst_Respawn2x2_0                                             ;84CB69;
    dw $0001                                                             ;84CB6B;
    dw DrawInst_2x2RespawningShotBlock                                   ;84CB6D;
    dw Instruction_PLM_Delete                                            ;84CB6F;

InstList_PLM_RespawningSuperMissileBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6                            ;84CB71;
    db $0A                                                               ;84CB73;
    dw $0004                                                             ;84CB74;
    dw DrawInst_Respawn1x1_0                                             ;84CB76;
    dw $0004                                                             ;84CB78;
    dw DrawInst_Respawn1x1_1                                             ;84CB7A;
    dw $0004                                                             ;84CB7C;
    dw DrawInst_Respawn1x1_2                                             ;84CB7E;
    dw $0180                                                             ;84CB80;
    dw DrawInst_Respawn1x1_3                                             ;84CB82;
    dw $0004                                                             ;84CB84;
    dw DrawInst_Respawn1x1_2                                             ;84CB86;
    dw $0004                                                             ;84CB88;
    dw DrawInst_Respawn1x1_1                                             ;84CB8A;
    dw $0004                                                             ;84CB8C;
    dw DrawInst_Respawn1x1_0                                             ;84CB8E;
    dw Instruction_PLM_DrawPLMBlock                                      ;84CB90;
    dw Instruction_PLM_Delete                                            ;84CB92;

InstList_PLM_RespawningPowerBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84CB94;
    db $0A                                                               ;84CB96;
    dw $0004                                                             ;84CB97;
    dw DrawInst_Respawn1x1_0                                             ;84CB99;
    dw $0004                                                             ;84CB9B;
    dw DrawInst_Respawn1x1_1                                             ;84CB9D;
    dw $0004                                                             ;84CB9F;
    dw DrawInst_Respawn1x1_2                                             ;84CBA1;
    dw $0180                                                             ;84CBA3;
    dw DrawInst_Respawn1x1_3                                             ;84CBA5;
    dw $0004                                                             ;84CBA7;
    dw DrawInst_Respawn1x1_2                                             ;84CBA9;
    dw $0004                                                             ;84CBAB;
    dw DrawInst_Respawn1x1_1                                             ;84CBAD;
    dw $0004                                                             ;84CBAF;
    dw DrawInst_Respawn1x1_0                                             ;84CBB1;
    dw Instruction_PLM_DrawPLMBlock                                      ;84CBB3;
    dw Instruction_PLM_Delete                                            ;84CBB5;

InstList_PLM_1x1ShotBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84CBB7;
    db $0A                                                               ;84CBB9;
    dw $0004                                                             ;84CBBA;
    dw DrawInst_Respawn1x1_0                                             ;84CBBC;
    dw $0004                                                             ;84CBBE;
    dw DrawInst_Respawn1x1_1                                             ;84CBC0;
    dw $0004                                                             ;84CBC2;
    dw DrawInst_Respawn1x1_2                                             ;84CBC4;
    dw $0001                                                             ;84CBC6;
    dw DrawInst_Respawn1x1_3                                             ;84CBC8;
    dw Instruction_PLM_Delete                                            ;84CBCA;

InstList_PLM_2x1ShotBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84CBCC;
    db $0A                                                               ;84CBCE;
    dw $0004                                                             ;84CBCF;
    dw DrawInst_Respawn2x1_0                                             ;84CBD1;
    dw $0004                                                             ;84CBD3;
    dw DrawInst_Respawn2x1_1                                             ;84CBD5;
    dw $0004                                                             ;84CBD7;
    dw DrawInst_Respawn2x1_2                                             ;84CBD9;
    dw $0001                                                             ;84CBDB;
    dw DrawInst_Respawn2x1_3                                             ;84CBDD;
    dw Instruction_PLM_Delete                                            ;84CBDF;

InstList_PLM_1x2ShotBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84CBE1;
    db $0A                                                               ;84CBE3;
    dw $0004                                                             ;84CBE4;
    dw DrawInst_Respawn1x2_0                                             ;84CBE6;
    dw $0004                                                             ;84CBE8;
    dw DrawInst_Respawn1x2_1                                             ;84CBEA;
    dw $0004                                                             ;84CBEC;
    dw DrawInst_Respawn1x2_2                                             ;84CBEE;
    dw $0001                                                             ;84CBF0;
    dw DrawInst_Respawn1x2_3                                             ;84CBF2;
    dw Instruction_PLM_Delete                                            ;84CBF4;

InstList_PLM_2x2ShotBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84CBF6;
    db $0A                                                               ;84CBF8;
    dw $0004                                                             ;84CBF9;
    dw DrawInst_Respawn2x2_0                                             ;84CBFB;
    dw $0004                                                             ;84CBFD;
    dw DrawInst_Respawn2x2_1                                             ;84CBFF;
    dw $0004                                                             ;84CC01;
    dw DrawInst_Respawn2x2_2                                             ;84CC03;
    dw $0001                                                             ;84CC05;
    dw DrawInst_Respawn2x2_3                                             ;84CC07;
    dw Instruction_PLM_Delete                                            ;84CC09;

InstList_PLM_SuperMissileBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6                            ;84CC0B;
    db $0A                                                               ;84CC0D;
    dw $0004                                                             ;84CC0E;
    dw DrawInst_Respawn1x1_0                                             ;84CC10;
    dw $0004                                                             ;84CC12;
    dw DrawInst_Respawn1x1_1                                             ;84CC14;
    dw $0004                                                             ;84CC16;
    dw DrawInst_Respawn1x1_2                                             ;84CC18;
    dw $0001                                                             ;84CC1A;
    dw DrawInst_Respawn1x1_3                                             ;84CC1C;
    dw Instruction_PLM_Delete                                            ;84CC1E;

InstList_PLM_PowerBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1                            ;84CC20;
    db $0A                                                               ;84CC22;
    dw $0003                                                             ;84CC23;
    dw DrawInst_Respawn1x1_0                                             ;84CC25;
    dw $0002                                                             ;84CC27;
    dw DrawInst_Respawn1x1_1                                             ;84CC29;
    dw $0001                                                             ;84CC2B;
    dw DrawInst_Respawn1x1_2                                             ;84CC2D;
    dw $0001                                                             ;84CC2F;
    dw DrawInst_Respawn1x1_3                                             ;84CC31;
    dw Instruction_PLM_Delete                                            ;84CC33;

InstList_PLM_CollisionReaction_1x1RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3                            ;84CC35;
    db $06                                                               ;84CC37;
    dw Instruction_PLM_GotoY                                             ;84CC38;
    dw InstList_PLM_1x1RespawningBombBlock                               ;84CC3A;

InstList_PLM_Reaction_1x1RespawningBombBlock_0:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3                            ;84CC3C;
    db $0A                                                               ;84CC3E;

InstList_PLM_1x1RespawningBombBlock:
    dw $0004                                                             ;84CC3F;
    dw DrawInst_Respawn1x1_0                                             ;84CC41;
    dw $0004                                                             ;84CC43;
    dw DrawInst_Respawn1x1_1                                             ;84CC45;
    dw $0004                                                             ;84CC47;
    dw DrawInst_Respawn1x1_2                                             ;84CC49;
    dw $0180                                                             ;84CC4B;
    dw DrawInst_Respawn1x1_3                                             ;84CC4D;
    dw $0004                                                             ;84CC4F;
    dw DrawInst_Respawn1x1_2                                             ;84CC51;
    dw $0004                                                             ;84CC53;
    dw DrawInst_Respawn1x1_1                                             ;84CC55;
    dw $0004                                                             ;84CC57;
    dw DrawInst_Respawn1x1_0                                             ;84CC59;
    dw Instruction_PLM_DrawPLMBlock                                      ;84CC5B;
    dw Instruction_PLM_Delete                                            ;84CC5D;

InstList_PLM_Collision_2x1RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3                            ;84CC5F;
    db $06                                                               ;84CC61;
    dw Instruction_PLM_GotoY                                             ;84CC62;
    dw InstList_PLM_2x1RespawningBombBlock                               ;84CC64;

InstList_PLM_Reaction_2x1RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3                            ;84CC66;
    db $0A                                                               ;84CC68;

InstList_PLM_2x1RespawningBombBlock:
    dw $0004                                                             ;84CC69;
    dw DrawInst_Respawn2x1_0                                             ;84CC6B;
    dw $0004                                                             ;84CC6D;
    dw DrawInst_Respawn2x1_1                                             ;84CC6F;
    dw $0004                                                             ;84CC71;
    dw DrawInst_Respawn2x1_2                                             ;84CC73;
    dw $0180                                                             ;84CC75;
    dw DrawInst_Respawn2x1_3                                             ;84CC77;
    dw $0004                                                             ;84CC79;
    dw DrawInst_Respawn2x1_2                                             ;84CC7B;
    dw $0004                                                             ;84CC7D;
    dw DrawInst_Respawn2x1_1                                             ;84CC7F;
    dw $0004                                                             ;84CC81;
    dw DrawInst_Respawn2x1_0                                             ;84CC83;
    dw $0001                                                             ;84CC85;
    dw DrawInst_2x1RespawningBombBlock                                   ;84CC87;
    dw Instruction_PLM_Delete                                            ;84CC89;

InstList_PLM_Collision_1x2RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3                            ;84CC8B;
    db $06                                                               ;84CC8D;
    dw Instruction_PLM_GotoY                                             ;84CC8E;
    dw InstList_PLM_1x2RespawningBombBlock                               ;84CC90;

InstList_PLM_Reaction_1x2RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3                            ;84CC92;
    db $0A                                                               ;84CC94;

InstList_PLM_1x2RespawningBombBlock:
    dw $0004                                                             ;84CC95;
    dw DrawInst_Respawn1x2_0                                             ;84CC97;
    dw $0004                                                             ;84CC99;
    dw DrawInst_Respawn1x2_1                                             ;84CC9B;
    dw $0004                                                             ;84CC9D;
    dw DrawInst_Respawn1x2_2                                             ;84CC9F;
    dw $0180                                                             ;84CCA1;
    dw DrawInst_Respawn1x2_3                                             ;84CCA3;
    dw $0004                                                             ;84CCA5;
    dw DrawInst_Respawn1x2_2                                             ;84CCA7;
    dw $0004                                                             ;84CCA9;
    dw DrawInst_Respawn1x2_1                                             ;84CCAB;
    dw $0004                                                             ;84CCAD;
    dw DrawInst_Respawn1x2_0                                             ;84CCAF;
    dw $0001                                                             ;84CCB1;
    dw DrawInst_1x2RespawningBombBlock                                   ;84CCB3;
    dw Instruction_PLM_Delete                                            ;84CCB5;

InstList_PLM_Collision_2x2RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3                            ;84CCB7;
    db $06                                                               ;84CCB9;
    dw Instruction_PLM_GotoY                                             ;84CCBA;
    dw InstList_PLM_2x2RespawningBombBlock                               ;84CCBC;

InstList_PLM_Reaction_2x2RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3                            ;84CCBE;
    db $0A                                                               ;84CCC0;

InstList_PLM_2x2RespawningBombBlock:
    dw $0004                                                             ;84CCC1;
    dw DrawInst_Respawn2x2_0                                             ;84CCC3;
    dw $0004                                                             ;84CCC5;
    dw DrawInst_Respawn2x2_1                                             ;84CCC7;
    dw $0004                                                             ;84CCC9;
    dw DrawInst_Respawn2x2_2                                             ;84CCCB;
    dw $0180                                                             ;84CCCD;
    dw DrawInst_Respawn2x2_3                                             ;84CCCF;
    dw $0004                                                             ;84CCD1;
    dw DrawInst_Respawn2x2_2                                             ;84CCD3;
    dw $0004                                                             ;84CCD5;
    dw DrawInst_Respawn2x2_1                                             ;84CCD7;
    dw $0004                                                             ;84CCD9;
    dw DrawInst_Respawn2x2_0                                             ;84CCDB;
    dw $0001                                                             ;84CCDD;
    dw DrawInst_2x2RespawningBombBlock                                   ;84CCDF;
    dw Instruction_PLM_Delete                                            ;84CCE1;

InstList_PLM_Collision_1x1RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3                            ;84CCE3;
    db $06                                                               ;84CCE5;
    dw Instruction_PLM_GotoY                                             ;84CCE6;
    dw InstList_PLM_1x1BombBlock                                         ;84CCE8;

InstList_PLM_Reaction_1x1RespawningBombBlock_4:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3                            ;84CCEA;
    db $0A                                                               ;84CCEC;

InstList_PLM_1x1BombBlock:
    dw $0004                                                             ;84CCED;
    dw DrawInst_Respawn1x1_0                                             ;84CCEF;
    dw $0004                                                             ;84CCF1;
    dw DrawInst_Respawn1x1_1                                             ;84CCF3;
    dw $0004                                                             ;84CCF5;
    dw DrawInst_Respawn1x1_2                                             ;84CCF7;
    dw $0001                                                             ;84CCF9;
    dw DrawInst_Respawn1x1_3                                             ;84CCFB;
    dw Instruction_PLM_Delete                                            ;84CCFD;

InstList_PLM_Collision_2x1BombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3                            ;84CCFF;
    db $06                                                               ;84CD01;
    dw Instruction_PLM_GotoY                                             ;84CD02;
    dw InstList_PLM_2x1BombBlock                                         ;84CD04;

InstList_PLM_Reaction_2x1BombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3                            ;84CD06;
    db $0A                                                               ;84CD08;

InstList_PLM_2x1BombBlock:
    dw $0004                                                             ;84CD09;
    dw DrawInst_Respawn2x1_0                                             ;84CD0B;
    dw $0004                                                             ;84CD0D;
    dw DrawInst_Respawn2x1_1                                             ;84CD0F;
    dw $0004                                                             ;84CD11;
    dw DrawInst_Respawn2x1_2                                             ;84CD13;
    dw $0001                                                             ;84CD15;
    dw DrawInst_Respawn2x1_3                                             ;84CD17;
    dw Instruction_PLM_Delete                                            ;84CD19;

InstList_PLM_Collision_1x2BombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3                            ;84CD1B;
    db $06                                                               ;84CD1D;
    dw Instruction_PLM_GotoY                                             ;84CD1E;
    dw InstList_PLM_1x2BombBlock                                         ;84CD20;

InstList_PLM_Reaction_1x2BombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3                            ;84CD22;
    db $0A                                                               ;84CD24;

InstList_PLM_1x2BombBlock:
    dw $0004                                                             ;84CD25;
    dw DrawInst_Respawn1x2_0                                             ;84CD27;
    dw $0004                                                             ;84CD29;
    dw DrawInst_Respawn1x2_1                                             ;84CD2B;
    dw $0004                                                             ;84CD2D;
    dw DrawInst_Respawn1x2_2                                             ;84CD2F;
    dw $0001                                                             ;84CD31;
    dw DrawInst_Respawn1x2_3                                             ;84CD33;
    dw Instruction_PLM_Delete                                            ;84CD35;

InstList_PLM_Collision_2x2BombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3                            ;84CD37;
    db $06                                                               ;84CD39;
    dw Instruction_PLM_GotoY                                             ;84CD3A;
    dw InstList_PLM_2x2BombBlock                                         ;84CD3C;

InstList_PLM_Reaction_2x2BombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3                            ;84CD3E;
    db $0A                                                               ;84CD40;

InstList_PLM_2x2BombBlock:
    dw $0004                                                             ;84CD41;
    dw DrawInst_Respawn2x2_0                                             ;84CD43;
    dw $0004                                                             ;84CD45;
    dw DrawInst_Respawn2x2_1                                             ;84CD47;
    dw $0004                                                             ;84CD49;
    dw DrawInst_Respawn2x2_2                                             ;84CD4B;
    dw $0001                                                             ;84CD4D;
    dw DrawInst_Respawn2x2_3                                             ;84CD4F;
    dw Instruction_PLM_Delete                                            ;84CD51;

InstList_PLM_EnemyBreakableBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3                            ;84CD53;
    db $0A                                                               ;84CD55;
    dw $0004                                                             ;84CD56;
    dw DrawInst_Respawn1x1_0                                             ;84CD58;
    dw $0004                                                             ;84CD5A;
    dw DrawInst_Respawn1x1_1                                             ;84CD5C;
    dw $0004                                                             ;84CD5E;
    dw DrawInst_Respawn1x1_2                                             ;84CD60;
    dw $0001                                                             ;84CD62;
    dw DrawInst_Respawn1x1_3                                             ;84CD64;
    dw Instruction_PLM_Delete                                            ;84CD66;

InstList_PLM_GrappleBlock:
    dw Instruction_PLM_Delete                                            ;84CD68;

InstList_PLM_RespawningBreakableGrappleBlock:
    dw $00F0                                                             ;84CD6A;
    dw DrawInst_BreakableGrappleBlock_0                                  ;84CD6C;
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6                            ;84CD6E;
    db $0A                                                               ;84CD70;
    dw $0004                                                             ;84CD71;
    dw DrawInst_BreakableGrappleBlock_1                                  ;84CD73;
    dw $0004                                                             ;84CD75;
    dw DrawInst_BreakableGrappleBlock_2                                  ;84CD77;
    dw $0004                                                             ;84CD79;
    dw DrawInst_BreakableGrappleBlock_3                                  ;84CD7B;
    dw $0006                                                             ;84CD7D;
    dw DrawInst_BreakableGrappleBlock_4                                  ;84CD7F;
    dw $0004                                                             ;84CD81;
    dw DrawInst_BreakableGrappleBlock_3                                  ;84CD83;
    dw $0004                                                             ;84CD85;
    dw DrawInst_BreakableGrappleBlock_2                                  ;84CD87;
    dw $0004                                                             ;84CD89;
    dw DrawInst_BreakableGrappleBlock_1                                  ;84CD8B;
    dw SetPLMBTSTo1                                                      ;84CD8D;
    dw Instruction_PLM_DrawPLMBlock                                      ;84CD8F;
    dw Instruction_PLM_Delete                                            ;84CD91;

SetPLMBTSTo1:
    PHX                                                                  ;84CD93;
    LDA.W $1C87,X                                                        ;84CD94;
    LSR A                                                                ;84CD97;
    TAX                                                                  ;84CD98;
    LDA.L $7F6402,X                                                      ;84CD99;
    AND.W #$FF00                                                         ;84CD9D;
    ORA.W #$0001                                                         ;84CDA0;
    STA.L $7F6402,X                                                      ;84CDA3;
    PLX                                                                  ;84CDA7;
    RTS                                                                  ;84CDA8;


InstList_PLM_BreakableGrappleBlock:
    dw $0078                                                             ;84CDA9;
    dw DrawInst_BreakableGrappleBlock_0                                  ;84CDAB;
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6                            ;84CDAD;
    db $0A                                                               ;84CDAF;
    dw $0004                                                             ;84CDB0;
    dw DrawInst_BreakableGrappleBlock_1                                  ;84CDB2;
    dw $0004                                                             ;84CDB4;
    dw DrawInst_BreakableGrappleBlock_2                                  ;84CDB6;
    dw $0004                                                             ;84CDB8;
    dw DrawInst_BreakableGrappleBlock_3                                  ;84CDBA;
    dw $0001                                                             ;84CDBC;
    dw DrawInst_BreakableGrappleBlock_4                                  ;84CDBE;
    dw Instruction_PLM_Delete                                            ;84CDC0;

UNUSED_Setup_84CDC2:
    LDA.W $0A1C                                                          ;84CDC2;
    CMP.W #$0081                                                         ;84CDC5;
    BEQ .screwAttacking                                                  ;84CDC8;
    CMP.W #$0082                                                         ;84CDCA;
    BNE .deletePLM                                                       ;84CDCD;

.screwAttacking:
    LDX.W $1C87,Y                                                        ;84CDCF;
    LDA.L $7F0002,X                                                      ;84CDD2;
    STA.W $1E17,Y                                                        ;84CDD6;
    AND.W #$0FFF                                                         ;84CDD9;
    STA.L $7F0002,X                                                      ;84CDDC;
    CLC                                                                  ;84CDE0;
    RTS                                                                  ;84CDE1;


.deletePLM:
    LDA.W #$0000                                                         ;84CDE2;
    STA.W $1C37,Y                                                        ;84CDE5;
    SEC                                                                  ;84CDE8;
    RTS                                                                  ;84CDE9;


Setup_Collision_RespawningSpeedBoostBlock:
    LDA.W $0B3E                                                          ;84CDEA;
    AND.W #$0F00                                                         ;84CDED;
    CMP.W #$0400                                                         ;84CDF0;
    BEQ .speed                                                           ;84CDF3;
    LDA.W $0A1C                                                          ;84CDF5;
    CMP.W #$00C9                                                         ;84CDF8;
    BEQ .speed                                                           ;84CDFB;
    CMP.W #$00CA                                                         ;84CDFD;
    BEQ .speed                                                           ;84CE00;
    CMP.W #$00CB                                                         ;84CE02;
    BEQ .speed                                                           ;84CE05;
    CMP.W #$00CC                                                         ;84CE07;
    BEQ .speed                                                           ;84CE0A;
    CMP.W #$00CD                                                         ;84CE0C;
    BEQ .speed                                                           ;84CE0F;
    CMP.W #$00CE                                                         ;84CE11;
    BEQ .speed                                                           ;84CE14;
    LDA.W #$0000                                                         ;84CE16;
    STA.W $1C37,Y                                                        ;84CE19;
    SEC                                                                  ;84CE1C;
    RTS                                                                  ;84CE1D;


.speed:
    LDX.W $1C87,Y                                                        ;84CE1E;
    LDA.L $7F0002,X                                                      ;84CE21;
    AND.W #$F000                                                         ;84CE25;
    ORA.W #$00B6                                                         ;84CE28;
    STA.W $1E17,Y                                                        ;84CE2B;
    AND.W #$0FFF                                                         ;84CE2E;
    STA.L $7F0002,X                                                      ;84CE31;
    CLC                                                                  ;84CE35;
    RTS                                                                  ;84CE36;


Setup_Collision_RespawningCrumbleBlock:
    LDA.W $0B02                                                          ;84CE37;
    AND.W #$000F                                                         ;84CE3A;
    CMP.W #$0003                                                         ;84CE3D;
    BNE .deletePLM                                                       ;84CE40;
    LDX.W $1C87,Y                                                        ;84CE42;
    LDA.L $7F0002,X                                                      ;84CE45;
    AND.W #$F000                                                         ;84CE49;
    ORA.W #$00BC                                                         ;84CE4C;
    STA.W $1E17,Y                                                        ;84CE4F;
    AND.W #$8FFF                                                         ;84CE52;
    STA.L $7F0002,X                                                      ;84CE55;
    TYX                                                                  ;84CE59;
    LDA.W #$0004                                                         ;84CE5A;
    STA.L $7EDE1C,X                                                      ;84CE5D;
    SEC                                                                  ;84CE61;
    RTS                                                                  ;84CE62;


.deletePLM:
    LDA.W #$0000                                                         ;84CE63;
    STA.W $1C37,Y                                                        ;84CE66;
    SEC                                                                  ;84CE69;
    RTS                                                                  ;84CE6A;


Setup_Reaction_RespawningShotBlock:
    LDX.W $1C87,Y                                                        ;84CE6B;
    LDA.L $7F0002,X                                                      ;84CE6E;
    AND.W #$F000                                                         ;84CE72;
    ORA.W #$0052                                                         ;84CE75;
    STA.W $1E17,Y                                                        ;84CE78;
    AND.W #$8FFF                                                         ;84CE7B;
    STA.L $7F0002,X                                                      ;84CE7E;
    RTS                                                                  ;84CE82;


Setup_Collision_RespawningBombBlock:
    LDA.W $0B3E                                                          ;84CE83;
    AND.W #$0F00                                                         ;84CE86;
    CMP.W #$0400                                                         ;84CE89;
    BEQ .screwOrSpeed                                                    ;84CE8C;
    LDA.W $0A1C                                                          ;84CE8E;
    CMP.W #$0081                                                         ;84CE91;
    BEQ .screwOrSpeed                                                    ;84CE94;
    CMP.W #$0082                                                         ;84CE96;
    BEQ .screwOrSpeed                                                    ;84CE99;
    CMP.W #$00C9                                                         ;84CE9B;
    BEQ .screwOrSpeed                                                    ;84CE9E;
    CMP.W #$00CA                                                         ;84CEA0;
    BEQ .screwOrSpeed                                                    ;84CEA3;
    CMP.W #$00CB                                                         ;84CEA5;
    BEQ .screwOrSpeed                                                    ;84CEA8;
    CMP.W #$00CC                                                         ;84CEAA;
    BEQ .screwOrSpeed                                                    ;84CEAD;
    CMP.W #$00CD                                                         ;84CEAF;
    BEQ .screwOrSpeed                                                    ;84CEB2;
    CMP.W #$00CE                                                         ;84CEB4;
    BEQ .screwOrSpeed                                                    ;84CEB7;
    LDA.W #$0000                                                         ;84CEB9;
    STA.W $1C37,Y                                                        ;84CEBC;
    SEC                                                                  ;84CEBF;
    RTS                                                                  ;84CEC0;


.screwOrSpeed:
    LDX.W $1C87,Y                                                        ;84CEC1;
    LDA.L $7F0002,X                                                      ;84CEC4;
    AND.W #$F000                                                         ;84CEC8;
    ORA.W #$0058                                                         ;84CECB;
    STA.W $1E17,Y                                                        ;84CECE;
    AND.W #$0FFF                                                         ;84CED1;
    STA.L $7F0002,X                                                      ;84CED4;
    CLC                                                                  ;84CED8;
    RTS                                                                  ;84CED9;


Setup_Reaction_RespawningBombBlock:
    LDX.W $0DDE                                                          ;84CEDA;
    LDA.W $0C18,X                                                        ;84CEDD;
    AND.W #$0F00                                                         ;84CEE0;
    CMP.W #$0500                                                         ;84CEE3;
    BEQ .bomb                                                            ;84CEE6;
    CMP.W #$0300                                                         ;84CEE8;
    BEQ .powerBomb                                                       ;84CEEB;
    LDA.W #$0000                                                         ;84CEED;
    STA.W $1C37,Y                                                        ;84CEF0;
    RTS                                                                  ;84CEF3;


.powerBomb:
    LDX.W $1C87,Y                                                        ;84CEF4;
    LDA.L $7F0002,X                                                      ;84CEF7;
    AND.W #$F000                                                         ;84CEFB;
    ORA.W #$0058                                                         ;84CEFE;
    STA.W $1E17,Y                                                        ;84CF01;
    AND.W #$8FFF                                                         ;84CF04;
    STA.L $7F0002,X                                                      ;84CF07;
    RTS                                                                  ;84CF0B;


.bomb:
    LDA.W $1D27,Y                                                        ;84CF0C;
    CLC                                                                  ;84CF0F;
    ADC.W #$0003                                                         ;84CF10;
    STA.W $1D27,Y                                                        ;84CF13;
    LDX.W $1C87,Y                                                        ;84CF16;
    LDA.L $7F0002,X                                                      ;84CF19;
    AND.W #$F000                                                         ;84CF1D;
    ORA.W #$0058                                                         ;84CF20;
    STA.W $1E17,Y                                                        ;84CF23;
    AND.W #$8FFF                                                         ;84CF26;
    STA.L $7F0002,X                                                      ;84CF29;
    RTS                                                                  ;84CF2D;


Setup_Reaction_RespawningPowerBombBlock:
    LDX.W $0DDE                                                          ;84CF2E;
    LDA.W $0C18,X                                                        ;84CF31;
    AND.W #$0F00                                                         ;84CF34;
    CMP.W #$0500                                                         ;84CF37;
    BEQ .bomb                                                            ;84CF3A;
    CMP.W #$0300                                                         ;84CF3C;
    BEQ .powerBomb                                                       ;84CF3F;
    LDA.W #$0000                                                         ;84CF41;
    STA.W $1C37,Y                                                        ;84CF44;
    RTS                                                                  ;84CF47;


.powerBomb:
    LDX.W $1C87,Y                                                        ;84CF48;
    LDA.L $7F0002,X                                                      ;84CF4B;
    AND.W #$F000                                                         ;84CF4F;
    ORA.W #$0057                                                         ;84CF52;
    STA.W $1E17,Y                                                        ;84CF55;
    AND.W #$8FFF                                                         ;84CF58;
    STA.L $7F0002,X                                                      ;84CF5B;
    RTS                                                                  ;84CF5F;


.bomb:
    LDA.W #UNUSED_InstList_PLM_PowerBombBlockBombed_84C91C               ;84CF60;
    STA.W $1D27,Y                                                        ;84CF63;
    RTS                                                                  ;84CF66;


Setup_Reaction_SuperMissileBlock:
    LDX.W $0DDE                                                          ;84CF67;
    LDA.W $0C18,X                                                        ;84CF6A;
    AND.W #$0F00                                                         ;84CF6D;
    CMP.W #$0500                                                         ;84CF70;
    BEQ .bomb                                                            ;84CF73;
    CMP.W #$0200                                                         ;84CF75;
    BEQ .superMissile                                                    ;84CF78;
    LDA.W #$0000                                                         ;84CF7A;
    STA.W $1C37,Y                                                        ;84CF7D;
    RTS                                                                  ;84CF80;


.superMissile:
    LDX.W $1C87,Y                                                        ;84CF81;
    LDA.L $7F0002,X                                                      ;84CF84;
    AND.W #$F000                                                         ;84CF88;
    ORA.W #$009F                                                         ;84CF8B;
    STA.W $1E17,Y                                                        ;84CF8E;
    AND.W #$8FFF                                                         ;84CF91;
    STA.L $7F0002,X                                                      ;84CF94;
    RTS                                                                  ;84CF98;


.bomb:
    LDA.W #UNUSED_InstList_PLM_SuperMissileBlockBombed_84C922            ;84CF99;
    STA.W $1D27,Y                                                        ;84CF9C;
    RTS                                                                  ;84CF9F;


Setup_Reaction_SpeedCrumbleBlock:
    LDX.W $0DDE                                                          ;84CFA0;
    LDA.W $0C18,X                                                        ;84CFA3;
    AND.W #$0F00                                                         ;84CFA6;
    CMP.W #$0500                                                         ;84CFA9;
    BEQ .return                                                          ;84CFAC;
    LDA.W #$0000                                                         ;84CFAE;
    STA.W $1C37,Y                                                        ;84CFB1;

.return:
    RTS                                                                  ;84CFB4;


Setup_RespawningBreakableGrappleBlock:
    LDX.W $1C87,Y                                                        ;84CFB5;
    LDA.L $7F0002,X                                                      ;84CFB8;
    STA.W $1E17,Y                                                        ;84CFBC;
    TXA                                                                  ;84CFBF;
    LSR A                                                                ;84CFC0;
    TAX                                                                  ;84CFC1;
    LDA.L $7F6402,X                                                      ;84CFC2;
    AND.W #$FF00                                                         ;84CFC6;
    STA.L $7F6402,X                                                      ;84CFC9;

Setup_GenericGrappleBlock_SetOverflow:
    SEP #$40                                                             ;84CFCD;
    SEC                                                                  ;84CFCF;
    RTS                                                                  ;84CFD0;


Setup_GenericGrappleBlock_ResetOverflow:
    REP #$40                                                             ;84CFD1;
    SEC                                                                  ;84CFD3;
    RTS                                                                  ;84CFD4;


Setup_DraygonsBrokenTurret:
    LDA.W $0A4E                                                          ;84CFD5;
    CLC                                                                  ;84CFD8;
    ADC.W #$0000                                                         ;84CFD9;
    STA.W $0A4E                                                          ;84CFDC;
    LDA.W $0A50                                                          ;84CFDF;
    ADC.W #$0001                                                         ;84CFE2;
    STA.W $0A50                                                          ;84CFE5;
    SEP #$40                                                             ;84CFE8;
    SEC                                                                  ;84CFEA;
    RTS                                                                  ;84CFEB;


UNUSED_PLMEntries_Draws1x1ShotBlock_84CFEC:
    dw Setup_Reaction_SpeedCrumbleBlock                                  ;84CFEC;
    dw UNUSED_InstList_PLM_Draws1x1ShotBlock_84C8D4                      ;84CFEE;

UNUSED_PLMEntries_Draws1x2ShotBlock_84CFF0:
    dw Setup_Reaction_SpeedCrumbleBlock                                  ;84CFF0;
    dw UNUSED_InstList_PLM_Draws1x2ShotBlock_84C8DA                      ;84CFF2;

UNUSED_PLMEntries_Draws2x1ShotBlock_84CFF4:
    dw Setup_Reaction_SpeedCrumbleBlock                                  ;84CFF4;
    dw UNUSED_InstList_PLM_Draws2x1ShotBlock_84C8E0                      ;84CFF6;

UNUSED_PLMEntries_Draws2x2ShotBlock_84CFF8:
    dw Setup_Reaction_SpeedCrumbleBlock                                  ;84CFF8;
    dw UNUSED_InstList_PLM_Draws2x2ShotBlock_84C8E6                      ;84CFFA;

PLMEntries_1x1RespawningCrumbleBlock:
    dw Setup_Reaction_SpeedCrumbleBlock                                  ;84CFFC;
    dw InstList_BombReaction_PLM_1x1RespawningCrumbleBlock               ;84CFFE;

PLMEntries_2x1RespawningCrumbleBlock:
    dw Setup_Reaction_SpeedCrumbleBlock                                  ;84D000;
    dw InstList_BombReaction_PLM_2x1RespawningCrumbleBlock               ;84D002;

PLMEntries_1x2RespawningCrumbleBlock:
    dw Setup_Reaction_SpeedCrumbleBlock                                  ;84D004;
    dw InstList_BombReaction_PLM_1x2RespawningCrumbleBlock               ;84D006;

PLMEntries_2x2RespawningCrumbleBlock:
    dw Setup_Reaction_SpeedCrumbleBlock                                  ;84D008;
    dw InstList_BombReaction_PLM_2x2RespawningCrumbleBlock               ;84D00A;

UNUSED_PLMEntries_84D00C:
    dw Setup_Reaction_SpeedCrumbleBlock                                  ;84D00C;
    dw UNUSED_InstList_PLM_84C904                                        ;84D00E;

UNUSED_PLMEntries_84D010:
    dw Setup_Reaction_SpeedCrumbleBlock                                  ;84D010;
    dw UNUSED_InstList_PLM_84C90A                                        ;84D012;

UNUSED_PLMEntries_84D014:
    dw Setup_Reaction_SpeedCrumbleBlock                                  ;84D014;
    dw UNUSED_InstList_PLM_84C910                                        ;84D016;

UNUSED_PLMEntries_84D018:
    dw Setup_Reaction_SpeedCrumbleBlock                                  ;84D018;
    dw UNUSED_InstList_PLM_84C916                                        ;84D01A;

UNUSED_PLMEntries_84D01C:
    dw Setup_Reaction_SpeedCrumbleBlock                                  ;84D01C;
    dw UNUSED_InstList_PLM_PowerBombBlockBombed_84C91C                   ;84D01E;

UNUSED_PLMEntries_84D020:
    dw Setup_Reaction_SpeedCrumbleBlock                                  ;84D020;
    dw UNUSED_InstList_PLM_SuperMissileBlockBombed_84C922                ;84D022;

PLMEntries_BombReaction_SpeedBoostBlock:
    dw Setup_Reaction_SpeedCrumbleBlock                                  ;84D024;
    dw InstList_PLM_BombReaction_SpeedBlock                              ;84D026;

UNUSED_PLMEntries_84D028:
    dw UNUSED_Setup_84CDC2                                               ;84D028;
    dw UNUSED_InstList_PLM_84C92E                                        ;84D02A;

UNUSED_PLMEntries_84D02C:
    dw UNUSED_Setup_84CDC2                                               ;84D02C;
    dw UNUSED_InstList_PLM_84C9BA                                        ;84D02E;

PLMEntries_Collision_BTS82:
    dw Setup_Collision_RespawningSpeedBoostBlock                         ;84D030;
    dw InstList_PLM_RespawningSpeedBlock_SlowerCrumbleAnimation          ;84D032;

PLMEntries_Collision_BTS83:
    dw Setup_Collision_RespawningSpeedBoostBlock                         ;84D034;
    dw InstList_PLM_SpeedBlockSlowerCrumbleAnimation                     ;84D036;

PLMEntries_Collision_RespawningSpeedBoostBlock:
    dw Setup_Collision_RespawningSpeedBoostBlock                         ;84D038;
    dw InstList_PLM_RespawningSpeedBoostBlock                            ;84D03A;

PLMEntries_Collision_DachoraRespawningSpeedBoostBlock:
    dw Setup_Collision_RespawningSpeedBoostBlock                         ;84D03C;
    dw InstList_PLM_RespawningSpeedBlock                                 ;84D03E;

PLMEntries_Collision_SpeedBoostBlock:
    dw Setup_Collision_RespawningSpeedBoostBlock                         ;84D040;
    dw InstList_PLM_SpeedBoostBlock                                      ;84D042;

PLMEntries_Collision_1x1RespawningCrumbleBlock:
    dw Setup_Collision_RespawningCrumbleBlock                            ;84D044;
    dw InstList_PLM_1x1RespawningCrumbleBlock                            ;84D046;

PLMEntries_Collision_2x1RespawningCrumbleBlock:
    dw Setup_Collision_RespawningCrumbleBlock                            ;84D048;
    dw InstList_PLM_2x1RespawningCrumbleBlock                            ;84D04A;

PLMEntries_Collision_1x2RespawningCrumbleBlock:
    dw Setup_Collision_RespawningCrumbleBlock                            ;84D04C;
    dw InstList_PLM_1x2RespawningCrumbleBlock                            ;84D04E;

PLMEntries_Collision_2x2RespawningCrumbleBlock:
    dw Setup_Collision_RespawningCrumbleBlock                            ;84D050;
    dw InstList_PLM_2x2RespawningCrumbleBlock                            ;84D052;

PLMEntries_Collision_1x1CrumbleBlock:
    dw Setup_Collision_RespawningCrumbleBlock                            ;84D054;
    dw InstList_PLM_1x1CrumbleBlock                                      ;84D056;

PLMEntries_Collision_2x1CrumbleBlock:
    dw Setup_Collision_RespawningCrumbleBlock                            ;84D058;
    dw InstList_PLM_2x1CrumbleBlock                                      ;84D05A;

PLMEntries_Collision_1x2CrumbleBlock:
    dw Setup_Collision_RespawningCrumbleBlock                            ;84D05C;
    dw InstList_PLM_1x2CrumbleBlock                                      ;84D05E;

PLMEntries_Collision_2x2CrumbleBlock:
    dw Setup_Collision_RespawningCrumbleBlock                            ;84D060;
    dw InstList_PLM_2x2CrumbleBlock                                      ;84D062;

PLMEntries_Reaction_1x1RespawningShotBlock:
    dw Setup_Reaction_RespawningShotBlock                                ;84D064;
    dw InstList_PLM_1x1RespawningShotBlock                               ;84D066;

PLMEntries_Reaction_2x1RespawningShotBlock:
    dw Setup_Reaction_RespawningShotBlock                                ;84D068;
    dw InstList_PLM_2x1RespawningShotBlock                               ;84D06A;

PLMEntries_Reaction_1x2RespawningShotBlock:
    dw Setup_Reaction_RespawningShotBlock                                ;84D06C;
    dw InstList_PLM_1x2RespawningShotBlock                               ;84D06E;

PLMEntries_Reaction_2x2RespawningShotBlock:
    dw Setup_Reaction_RespawningShotBlock                                ;84D070;
    dw InstList_PLM_2x2RespawningShotBlock                               ;84D072;

PLMEntries_Reaction_1x1ShotBlock:
    dw Setup_DeactivatePLM                                               ;84D074;
    dw InstList_PLM_1x1ShotBlock                                         ;84D076;

PLMEntries_Reaction_2x1ShotBlock:
    dw Setup_DeactivatePLM                                               ;84D078;
    dw InstList_PLM_2x1ShotBlock                                         ;84D07A;

PLMEntries_Reaction_1x2ShotBlock:
    dw Setup_DeactivatePLM                                               ;84D07C;
    dw InstList_PLM_1x2ShotBlock                                         ;84D07E;

PLMEntries_Reaction_2x2ShotBlock:
    dw Setup_DeactivatePLM                                               ;84D080;
    dw InstList_PLM_2x2ShotBlock                                         ;84D082;

PLMEntries_Reaction_RespawningPowerBombBlock:
    dw Setup_Reaction_RespawningPowerBombBlock                           ;84D084;
    dw InstList_PLM_RespawningPowerBombBlock                             ;84D086;

PLMEntries_Reaction_PowerBombBlock:
    dw Setup_Reaction_RespawningPowerBombBlock                           ;84D088;
    dw InstList_PLM_PowerBombBlock                                       ;84D08A;

PLMEntries_Reaction_RespawningSuperMissileBlock:
    dw Setup_Reaction_SuperMissileBlock                                  ;84D08C;
    dw InstList_PLM_RespawningSuperMissileBlock                          ;84D08E;

PLMEntries_Reaction_SuperMissileBlock:
    dw Setup_Reaction_SuperMissileBlock                                  ;84D090;
    dw InstList_PLM_SuperMissileBlock                                    ;84D092;

PLMEntries_EnemyBreakableBlock:
    dw Setup_EnemyBreakableBlock                                         ;84D094;
    dw InstList_PLM_EnemyBreakableBlock                                  ;84D096;

PLMEntries_Collision_1x1RespawningBombBlock:
    dw Setup_Collision_RespawningBombBlock                               ;84D098;
    dw InstList_PLM_CollisionReaction_1x1RespawningBombBlock             ;84D09A;

PLMEntries_Collision_2x1RespawningBombBlock:
    dw Setup_Collision_RespawningBombBlock                               ;84D09C;
    dw InstList_PLM_Collision_2x1RespawningBombBlock                     ;84D09E;

PLMEntries_Collision_1x2RespawningBombBlock:
    dw Setup_Collision_RespawningBombBlock                               ;84D0A0;
    dw InstList_PLM_Collision_1x2RespawningBombBlock                     ;84D0A2;

PLMEntries_Collision_2x2RespawningBombBlock:
    dw Setup_Collision_RespawningBombBlock                               ;84D0A4;
    dw InstList_PLM_Collision_2x2RespawningBombBlock                     ;84D0A6;

PLMEntries_Collision_1x1BombBlock:
    dw Setup_Collision_RespawningBombBlock                               ;84D0A8;
    dw InstList_PLM_Collision_1x1RespawningBombBlock                     ;84D0AA;

PLMEntries_Collision_2x1BombBlock:
    dw Setup_Collision_RespawningBombBlock                               ;84D0AC;
    dw InstList_PLM_Collision_2x1BombBlock                               ;84D0AE;

PLMEntries_Collision_1x2BombBlock:
    dw Setup_Collision_RespawningBombBlock                               ;84D0B0;
    dw InstList_PLM_Collision_1x2BombBlock                               ;84D0B2;

PLMEntries_Collision_2x2BombBlock:
    dw Setup_Collision_RespawningBombBlock                               ;84D0B4;
    dw InstList_PLM_Collision_2x2BombBlock                               ;84D0B6;

PLMEntries_Reaction_1x1RespawningBombBlock:
    dw Setup_Reaction_RespawningBombBlock                                ;84D0B8;
    dw InstList_PLM_Reaction_1x1RespawningBombBlock_0                    ;84D0BA;

PLMEntries_Reaction_2x1RespawningBombBlock:
    dw Setup_Reaction_RespawningBombBlock                                ;84D0BC;
    dw InstList_PLM_Reaction_2x1RespawningBombBlock                      ;84D0BE;

PLMEntries_Reaction_1x2RespawningBombBlock:
    dw Setup_Reaction_RespawningBombBlock                                ;84D0C0;
    dw InstList_PLM_Reaction_1x2RespawningBombBlock                      ;84D0C2;

PLMEntries_Reaction_2x2RespawningBombBlock:
    dw Setup_Reaction_RespawningBombBlock                                ;84D0C4;
    dw InstList_PLM_Reaction_2x2RespawningBombBlock                      ;84D0C6;

PLMEntries_Reaction_1x1BombBlock:
    dw Setup_Reaction_RespawningBombBlock                                ;84D0C8;
    dw InstList_PLM_Reaction_1x1RespawningBombBlock_4                    ;84D0CA;

PLMEntries_Reaction_2x1BombBlock:
    dw Setup_Reaction_RespawningBombBlock                                ;84D0CC;
    dw InstList_PLM_Reaction_2x1BombBlock                                ;84D0CE;

PLMEntries_Reaction_1x2BombBlock:
    dw Setup_Reaction_RespawningBombBlock                                ;84D0D0;
    dw InstList_PLM_Reaction_1x2BombBlock                                ;84D0D2;

PLMEntries_Reaction_2x2BombBlock:
    dw Setup_Reaction_RespawningBombBlock                                ;84D0D4;
    dw InstList_PLM_Reaction_2x2BombBlock                                ;84D0D6;

PLMEntries_Grappled_GrappleBlock:
    dw Setup_GenericGrappleBlock_SetOverflow                             ;84D0D8;
    dw InstList_PLM_GrappleBlock                                         ;84D0DA;

PLMEntries_Grappled_RespawningBreakableGrappleBlock:
    dw Setup_RespawningBreakableGrappleBlock                             ;84D0DC;
    dw InstList_PLM_RespawningBreakableGrappleBlock                      ;84D0DE;

PLMEntries_Grappled_BreakableGrappleBlock:
    dw Setup_RespawningBreakableGrappleBlock                             ;84D0E0;
    dw InstList_PLM_BreakableGrappleBlock                                ;84D0E2;

PLMEntries_Grappled_GenericSpikeBlock:
    dw Setup_GenericGrappleBlock_ResetOverflow                           ;84D0E4;
    dw InstList_PLM_GrappleBlock                                         ;84D0E6;

PLMEntries_Grappled_DraygonsBrokenTurret:
    dw Setup_DraygonsBrokenTurret                                        ;84D0E8;
    dw InstList_PLM_GrappleBlock                                         ;84D0EA;

InstList_PLM_UnusedBlueBrinstarFaceBlock:
    dw $0001                                                             ;84D0EC;
    dw DrawInst_UnusedBlueBrinstarFaceBlock                              ;84D0EE;
    dw Instruction_PLM_Delete                                            ;84D0F0;

PLMEntries_UnusedBlueBrinstarFaceBlock:
    dw Setup_DeactivatePLM                                               ;84D0F2;
    dw InstList_PLM_UnusedBlueBrinstarFaceBlock                          ;84D0F4;

InstList_PLM_CrumbleLowerNorfairChozoRoomPlug:
    dw $0004                                                             ;84D0F6;
    dw DrawInst_Respawn1x1_0                                             ;84D0F8;
    dw $0004                                                             ;84D0FA;
    dw DrawInst_Respawn1x1_1                                             ;84D0FC;
    dw $0004                                                             ;84D0FE;
    dw DrawInst_Respawn1x1_2                                             ;84D100;
    dw $0001                                                             ;84D102;
    dw DrawInst_Respawn1x1_3                                             ;84D104;
    dw Instruction_PLM_Delete                                            ;84D106;

Setup_CrumbleLowerNorfairChozoRoomPlug:
    LDX.W $1C87,Y                                                        ;84D108;
    AND.W #$0FFF                                                         ;84D10B;
    STA.L $7F0002,X                                                      ;84D10E;
    RTS                                                                  ;84D112;


PLMEntries_CrumbleLowerNorfairChozoRoomPlug:
    dw Setup_CrumbleLowerNorfairChozoRoomPlug                            ;84D113;
    dw InstList_PLM_CrumbleLowerNorfairChozoRoomPlug                     ;84D115;

Setup_UnusedShotBlock:
    LDX.W $1C87,Y                                                        ;84D117;
    LDA.W #$C000                                                         ;84D11A;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84D11D;
    RTS                                                                  ;84D120;


InstList_PLM_UnusedShotBlock:
    dw $0004                                                             ;84D121;
    dw DrawInst_84A33F                                                   ;84D123;
    dw Instruction_PLM_Delete                                            ;84D125;

PLMEntries_UnusedShotBlock:
    dw Setup_UnusedShotBlock                                             ;84D127;
    dw InstList_PLM_UnusedShotBlock                                      ;84D129;

Setup_UnusedGrappleBlock:
    LDX.W $1C87,Y                                                        ;84D12B;
    LDA.W #$E000                                                         ;84D12E;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84D131;
    RTS                                                                  ;84D134;


InstList_PLM_UnusedGrappleBlock:
    dw $0001                                                             ;84D135;
    dw DrawInst_BreakableGrappleBlock_0                                  ;84D137;
    dw Instruction_PLM_Delete                                            ;84D139;

PLMEntries_UnusedGrappleBlock:
    dw Setup_UnusedGrappleBlock                                          ;84D13B;
    dw InstList_PLM_UnusedGrappleBlock                                   ;84D13D;

InstList_PLM_LowerNorfairChozoHand_0:
    dw Instruction_PLM_GotoY_ifEventIsSet                                ;84D13F;
    dw $000C                                                             ;84D141;
    dw InstList_PLM_LowerNorfairChozoHand_1                              ;84D143;
    dw Instruction_PLM_PreInstruction_inY                                ;84D145;
    dw PreInstruction_DeletePLM_SpawnTriggerBlockIf_4_8_IsBlankAir       ;84D147;
    dw Instruction_PLM_Sleep                                             ;84D149;
    dw Instruction_PLM_Delete                                            ;84D14B;

InstList_PLM_LowerNorfairChozoHand_1:
    dw Instruction_PLM_FXBaseYPosition_2D2                               ;84D14D;
    dw $0001                                                             ;84D14F;
    dw DrawInst_ItemChozoOrb                                             ;84D151;
    dw Instruction_PLM_Delete                                            ;84D153;

Instruction_PLM_FXBaseYPosition_2D2:
    LDA.W #$02D2                                                         ;84D155;
    STA.W $1978                                                          ;84D158;
    RTS                                                                  ;84D15B;


PreInstruction_DeletePLM_SpawnTriggerBlockIf_4_8_IsBlankAir:
    PHX                                                                  ;84D15C;
    SEP #$20                                                             ;84D15D;
    LDA.B #$08                                                           ;84D15F;
    STA.W HW_WRMPYA                                                      ;84D161;
    LDA.W $07A5                                                          ;84D164;
    STA.W HW_WRMPYB                                                      ;84D167;
    LDA.B #$04                                                           ;84D16A;
    REP #$20                                                             ;84D16C;
    AND.W #$00FF                                                         ;84D16E;
    CLC                                                                  ;84D171;
    ADC.W HW_RDMPY                                                       ;84D172;
    ASL A                                                                ;84D175;
    TAX                                                                  ;84D176;
    LDA.L $7F0002,X                                                      ;84D177;
    CMP.W #$00FF                                                         ;84D17B;
    BNE .return                                                          ;84D17E;
    LDA.W #$B083                                                         ;84D180;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84D183;
    LDX.W $1C27                                                          ;84D186;
    STZ.W $1C37,X                                                        ;84D189;

.return:
    PLX                                                                  ;84D18C;
    RTS                                                                  ;84D18D;


RTS_84D18E:
    RTS                                                                  ;84D18E;


Setup_Reaction_LowerNorfairChozoHandTrigger:
    LDA.W $09A4                                                          ;84D18F;
    AND.W #$0200                                                         ;84D192;
    BEQ .return                                                          ;84D195;
    LDA.W $0B02                                                          ;84D197;
    AND.W #$000F                                                         ;84D19A;
    CMP.W #$0003                                                         ;84D19D;
    BNE .return                                                          ;84D1A0;
    LDA.W $0A1C                                                          ;84D1A2;
    CMP.W #$001D                                                         ;84D1A5;
    BEQ .react                                                           ;84D1A8;
    CMP.W #$0079                                                         ;84D1AA;
    BEQ .react                                                           ;84D1AD;
    CMP.W #$007A                                                         ;84D1AF;
    BNE .return                                                          ;84D1B2;

.react:
    LDA.W #$000C                                                         ;84D1B4;
    JSL.L MarkEvent_inA                                                  ;84D1B7;
    LDA.W #$0001                                                         ;84D1BB;
    STA.W $0FB4                                                          ;84D1BE;
    LDX.W $1C87,Y                                                        ;84D1C1;
    LDA.L $7F0002,X                                                      ;84D1C4;
    AND.W #$0FFF                                                         ;84D1C8;
    STA.L $7F0002,X                                                      ;84D1CB;
    LDA.W #$0000                                                         ;84D1CF;
    JSL.L Run_Samus_Command                                              ;84D1D2;
    JSL.L Spawn_Hardcoded_PLM                                            ;84D1D6;
    db $0C,$1D                                                           ;84D1DA;
    dw PLMEntries_CrumbleLowerNorfairChozoRoomPlug                       ;84D1DC;

.return:
    LDA.W #$0000                                                         ;84D1DE;
    STA.W $1C37,Y                                                        ;84D1E1;
    SEC                                                                  ;84D1E4;
    RTS                                                                  ;84D1E5;


PreInstruction_PLM_IncrementPLMRoomArgIfShotByMissile:
    LDA.W $1D77,X                                                        ;84D1E6;
    BEQ .return                                                          ;84D1E9;
    AND.W #$0F00                                                         ;84D1EB;
    CMP.W #$0200                                                         ;84D1EE;
    BEQ .incRoomArg                                                      ;84D1F1;
    CMP.W #$0100                                                         ;84D1F3;
    BNE .return                                                          ;84D1F6;

.incRoomArg:
    STZ.W $1D77,X                                                        ;84D1F8;
    INC.W $1DC7,X                                                        ;84D1FB;

.return:
    STZ.W $1D77,X                                                        ;84D1FE;
    RTS                                                                  ;84D201;


InstList_PLM_MotherBrainsGlass_0:
    dw Instruction_PLM_GotoY_ifBossBitsSet                               ;84D202;
    db $01                                                               ;84D204;
    dw InstList_PLM_UnusedMotherBrainsGlass_AreaBossDead                 ;84D205;
    dw Instruction_PLM_GotoY_ifEventIsSet                                ;84D207;
    dw $0002                                                             ;84D209;
    dw InstList_PLM_UnusedMotherBrainsGlass_NoGlassState                 ;84D20B;
    dw Instruction_PLM_PreInstruction_inY                                ;84D20D;
    dw PreInstruction_PLM_IncrementPLMRoomArgIfShotByMissile             ;84D20F;

InstList_PLM_MotherBrainsGlass_1:
    dw $0001                                                             ;84D211;
    dw DrawInst_MotherBrainsGlass_0                                      ;84D213;
    dw Instruction_PLM_GotoY_IfRoomArgGreaterThanY                       ;84D215;
    dw $0002                                                             ;84D217;
    dw InstList_PLM_MotherBrainsGlass_1                                  ;84D219;

InstList_PLM_MotherBrainsGlass_2:
    dw $0001                                                             ;84D21B;
    dw DrawInst_MotherBrainsGlass_1                                      ;84D21D;
    dw Instruction_PLM_GotoY_IfRoomArgGreaterThanY                       ;84D21F;
    dw $0004                                                             ;84D221;
    dw InstList_PLM_MotherBrainsGlass_2                                  ;84D223;

InstList_PLM_MotherBrainsGlass_3:
    dw $0001                                                             ;84D225;
    dw DrawInst_MotherBrainsGlass_2                                      ;84D227;
    dw Instruction_PLM_GotoY_IfRoomArgGreaterThanY                       ;84D229;
    dw $0006                                                             ;84D22B;
    dw InstList_PLM_MotherBrainsGlass_3                                  ;84D22D;
    dw Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs          ;84D22F;
    dw $0000,$0000,$0000,$0000,$0004                                     ;84D231;
    dw DrawInst_MotherBrainsGlass_3                                      ;84D23B;
    dw Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs          ;84D23D;
    dw $0000,$0000,$0000,$0000                                           ;84D23F;

InstList_PLM_MotherBrainsGlass_4:
    dw $0001                                                             ;84D247;
    dw DrawInst_MotherBrainsGlass_3                                      ;84D249;
    dw Instruction_PLM_GotoY_IfRoomArgGreaterThanY                       ;84D24B;
    dw $0008                                                             ;84D24D;
    dw InstList_PLM_MotherBrainsGlass_4                                  ;84D24F;

InstList_PLM_MotherBrainsGlass_5:
    dw $0001                                                             ;84D251;
    dw DrawInst_MotherBrainsGlass_4                                      ;84D253;
    dw Instruction_PLM_GotoY_IfRoomArgGreaterThanY                       ;84D255;
    dw $000A                                                             ;84D257;
    dw InstList_PLM_MotherBrainsGlass_5                                  ;84D259;

InstList_PLM_MotherBrainsGlass_6:
    dw $0001                                                             ;84D25B;
    dw DrawInst_MotherBrainsGlass_5                                      ;84D25D;
    dw Instruction_PLM_GotoY_IfRoomArgGreaterThanY                       ;84D25F;
    dw $000C                                                             ;84D261;
    dw InstList_PLM_MotherBrainsGlass_6                                  ;84D263;
    dw Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs          ;84D265;
    dw $0002,$0002,$0002,$0002,$0004                                     ;84D267;
    dw DrawInst_MotherBrainsGlass_6                                      ;84D271;
    dw Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs          ;84D273;
    dw $0002,$0002,$0002,$0002                                           ;84D275;

InstList_PLM_MotherBrainsGlass_7:
    dw $0001                                                             ;84D27D;
    dw DrawInst_MotherBrainsGlass_6                                      ;84D27F;
    dw Instruction_PLM_GotoY_IfRoomArgGreaterThanY                       ;84D281;
    dw $000E                                                             ;84D283;
    dw InstList_PLM_MotherBrainsGlass_7                                  ;84D285;
    dw Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs          ;84D287;
    dw $0000,$0000,$0002,$0002,$0004                                     ;84D289;
    dw DrawInst_MotherBrainsGlass_7                                      ;84D293;
    dw Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs          ;84D295;
    dw $0004,$0004,$0004,$0004                                           ;84D297;

InstList_PLM_MotherBrainsGlass_8:
    dw $0001                                                             ;84D29F;
    dw DrawInst_MotherBrainsGlass_7                                      ;84D2A1;
    dw Instruction_PLM_GotoY_IfRoomArgGreaterThanY                       ;84D2A3;
    dw $0010                                                             ;84D2A5;
    dw InstList_PLM_MotherBrainsGlass_8                                  ;84D2A7;
    dw Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs          ;84D2A9;
    dw $0002,$0002,$0004,$0004,$0004                                     ;84D2AB;
    dw DrawInst_MotherBrainsGlass_8                                      ;84D2B5;
    dw Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs          ;84D2B7;
    dw $0002,$0002,$0004,$0004                                           ;84D2B9;

InstList_PLM_MotherBrainsGlass_9:
    dw $0001                                                             ;84D2C1;
    dw DrawInst_MotherBrainsGlass_8                                      ;84D2C3;
    dw Instruction_PLM_GotoY_IfRoomArgGreaterThanY                       ;84D2C5;
    dw $0012                                                             ;84D2C7;
    dw InstList_PLM_MotherBrainsGlass_9                                  ;84D2C9;
    dw Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs          ;84D2CB;
    dw $0002,$0002,$0004,$0004,$0004                                     ;84D2CD;
    dw DrawInst_MotherBrainsGlass_9                                      ;84D2D7;
    dw Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs          ;84D2D9;
    dw $0002,$0002,$0004,$0004,$0030                                     ;84D2DB;
    dw DrawInst_MotherBrainsGlass_9                                      ;84D2E5;
    dw Instruction_PLM_SetTheEvent                                       ;84D2E7;
    dw $0002                                                             ;84D2E9;
    dw Instruction_PLM_Delete                                            ;84D2EB;

InstList_PLM_UnusedMotherBrainsGlass_AreaBossDead:
    dw $0001                                                             ;84D2ED;
    dw UNUSED_DrawInst_849817                                            ;84D2EF;
    dw Instruction_PLM_Delete                                            ;84D2F1;

InstList_PLM_UnusedMotherBrainsGlass_NoGlassState:
    dw $0001                                                             ;84D2F3;
    dw DrawInst_MotherBrainsGlass_9                                      ;84D2F5;
    dw Instruction_PLM_Delete                                            ;84D2F7;

Instruction_PLM_GotoY_IfRoomArgGreaterThanY:
    LDA.W $1DC7,X                                                        ;84D2F9;
    CMP.W $0000,Y                                                        ;84D2FC;
    BCS .next                                                            ;84D2FF;
    LDA.W $0002,Y                                                        ;84D301;
    TAY                                                                  ;84D304;
    RTS                                                                  ;84D305;


.next:
    INY                                                                  ;84D306;
    INY                                                                  ;84D307;
    INY                                                                  ;84D308;
    INY                                                                  ;84D309;
    RTS                                                                  ;84D30A;


Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs:
    LDA.W #$002E                                                         ;84D30B;
    JSL.L QueueSound_Lib3_Max15                                          ;84D30E;
    LDA.W $0000,Y                                                        ;84D312;
    JSR.W Spawn4MotherBrainsGlassShatteringShardsWithArgA                ;84D315;
    LDA.W $0002,Y                                                        ;84D318;
    JSR.W Spawn4MotherBrainsGlassShatteringShardsWithArgA                ;84D31B;
    LDA.W $0004,Y                                                        ;84D31E;
    JSR.W Spawn4MotherBrainsGlassShatteringShardsWithArgA                ;84D321;
    LDA.W $0006,Y                                                        ;84D324;
    JSR.W Spawn4MotherBrainsGlassShatteringShardsWithArgA                ;84D327;
    TYA                                                                  ;84D32A;
    CLC                                                                  ;84D32B;
    ADC.W #$0008                                                         ;84D32C;
    TAY                                                                  ;84D32F;
    RTS                                                                  ;84D330;


Spawn4MotherBrainsGlassShatteringShardsWithArgA:
    PHY                                                                  ;84D331;
    LDY.W #EnemyProjectile_MotherBrainGlassShattering_Shard              ;84D332;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D335;
    PLY                                                                  ;84D339;
    RTS                                                                  ;84D33A;


PreInstruction_PLM_WakePLMIfSamusHasBombs:
    LDA.W $09A4                                                          ;84D33B;
    AND.W #$1000                                                         ;84D33E;
    BEQ .return                                                          ;84D341;
    LDA.W #$0001                                                         ;84D343;
    STA.L $7EDE1C,X                                                      ;84D346;
    INC.W $1D27,X                                                        ;84D34A;
    INC.W $1D27,X                                                        ;84D34D;
    LDA.W #.return                                                       ;84D350;
    STA.W $1CD7,X                                                        ;84D353;

.return:
    RTS                                                                  ;84D356;


Instruction_PLM_SpawnBombTorizoStatueBreakingWIthArgY:
    PHX                                                                  ;84D357;
    PHY                                                                  ;84D358;
    LDA.W $0000,Y                                                        ;84D359;
    LDY.W #EnemyProjectile_BombTorizoStatueBreaking                      ;84D35C;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D35F;
    PLY                                                                  ;84D363;
    PLX                                                                  ;84D364;
    INY                                                                  ;84D365;
    INY                                                                  ;84D366;
    RTS                                                                  ;84D367;


InstList_PLM_BombTorizosCrumblingChozo:
    dw $0001                                                             ;84D368;
    dw DrawInst_BombTorizosCrumblingChozo_0                              ;84D36A;
    dw Instruction_PLM_PreInstruction_inY                                ;84D36C;
    dw PreInstruction_PLM_WakePLMIfSamusHasBombs                         ;84D36E;
    dw Instruction_PLM_Sleep                                             ;84D370;
    dw $0078                                                             ;84D372;
    dw DrawInst_BombTorizosCrumblingChozo_0                              ;84D374;
    dw Instruction_PLM_TransferBytesToVRAM                               ;84D376;
    dw $0400                                                             ;84D378;
    dl Tiles_BombTorizosCrumblingChozo                                   ;84D37A;
    dw $6E00,$0060                                                       ;84D37D;
    dw DrawInst_BombTorizosCrumblingChozo_0                              ;84D381;
    dw Instruction_PLM_SpawnBombTorizoStatueBreakingWIthArgY             ;84D383;
    dw $0000,$0030                                                       ;84D385;
    dw DrawInst_BombTorizosCrumblingChozo_0                              ;84D389;
    dw Instruction_PLM_SpawnBombTorizoStatueBreakingWIthArgY             ;84D38B;
    dw $0002,$000F                                                       ;84D38D;
    dw DrawInst_BombTorizosCrumblingChozo_0                              ;84D391;
    dw Instruction_PLM_SpawnBombTorizoStatueBreakingWIthArgY             ;84D393;
    dw $0004,$000E                                                       ;84D395;
    dw DrawInst_BombTorizosCrumblingChozo_0                              ;84D399;
    dw Instruction_PLM_SpawnBombTorizoStatueBreakingWIthArgY             ;84D39B;
    dw $0006,$000D                                                       ;84D39D;
    dw DrawInst_BombTorizosCrumblingChozo_0                              ;84D3A1;
    dw Instruction_PLM_SpawnBombTorizoStatueBreakingWIthArgY             ;84D3A3;
    dw $0008,$000C                                                       ;84D3A5;
    dw DrawInst_BombTorizosCrumblingChozo_0                              ;84D3A9;
    dw Instruction_PLM_SpawnBombTorizoStatueBreakingWIthArgY             ;84D3AB;
    dw $000A,$000B                                                       ;84D3AD;
    dw DrawInst_BombTorizosCrumblingChozo_0                              ;84D3B1;
    dw Instruction_PLM_SpawnBombTorizoStatueBreakingWIthArgY             ;84D3B3;
    dw $000C,$000A                                                       ;84D3B5;
    dw DrawInst_BombTorizosCrumblingChozo_0                              ;84D3B9;
    dw Instruction_PLM_SpawnBombTorizoStatueBreakingWIthArgY             ;84D3BB;
    dw $000E,$0001                                                       ;84D3BD;
    dw DrawInst_BombTorizosCrumblingChozo_1                              ;84D3C1;
    dw Instruction_PLM_QueueSong1MusicTrack                              ;84D3C3;
    dw Instruction_PLM_Delete                                            ;84D3C5;

Instruction_PLM_QueueSong1MusicTrack:
    LDA.W #$0006                                                         ;84D3C7;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;84D3CA;
    RTS                                                                  ;84D3CE;


InstList_PLM_ClearSlopeAccessForWreckedShipChozo:
    dw $0001                                                             ;84D3CF;
    dw DrawInst_ClearSlopeAccessForWreckedShipChozo                      ;84D3D1;
    dw Instruction_PLM_TransformWreckedShipChozosSpikesIntoSlopes        ;84D3D3;
    dw Instruction_PLM_Delete                                            ;84D3D5;

Instruction_PLM_TransformWreckedShipChozosSpikesIntoSlopes:
    PHX                                                                  ;84D3D7;
    LDX.W #$1608                                                         ;84D3D8;
    LDA.W #$1012                                                         ;84D3DB;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84D3DE;
    LDX.W #$160A                                                         ;84D3E1;
    LDA.W #$1013                                                         ;84D3E4;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84D3E7;
    PLX                                                                  ;84D3EA;
    RTS                                                                  ;84D3EB;


InstList_PLM_BlockSlopeAccessForWreckedShipChozo:
    dw $0001                                                             ;84D3EC;
    dw DrawInst_BlockSlopeAccessForWreckedShipChozo                      ;84D3EE;
    dw Instruction_PLM_RevertWreckedShipChozosSlopesIntoSpikes           ;84D3F0;
    dw Instruction_PLM_Delete                                            ;84D3F2;

Instruction_PLM_RevertWreckedShipChozosSlopesIntoSpikes:
    PHX                                                                  ;84D3F4;
    LDX.W #$1608                                                         ;84D3F5;
    LDA.W #$A000                                                         ;84D3F8;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84D3FB;
    LDX.W #$160A                                                         ;84D3FE;
    LDA.W #$A000                                                         ;84D401;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84D404;
    PLX                                                                  ;84D407;
    RTS                                                                  ;84D408;


UNUSED_PreInst_PLM_GotoToLinkInstructionIfBombed_84D409:
    LDA.W $1D77,X                                                        ;84D409;
    AND.W #$0F00                                                         ;84D40C;
    CMP.W #$0500                                                         ;84D40F;
    BNE .clearShotStatus                                                 ;84D412;
    LDA.L $7EDEBC,X                                                      ;84D414;
    STA.W $1D27,X                                                        ;84D418;
    LDA.W #$0001                                                         ;84D41B;
    STA.L $7EDE1C,X                                                      ;84D41E;

.clearShotStatus:
    STZ.W $1D77,X                                                        ;84D422;
    RTS                                                                  ;84D425;


UNUSED_InstList_PLM_WreckedShip3x4ChozoBombBlock_84D426:
    dw Instruction_PLM_GotoY_ifRoomArg_ChozoBlockDestroyed               ;84D426;
    dw UNUSED_InstList_PLM_WreckedShip3x4ChozoBombBlock_84D448           ;84D428;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84D42A;
    dw UNUSED_InstList_PLM_WreckedShip3x4ChozoBombBlock_84D43A           ;84D42C;
    dw Instruction_PLM_PreInstruction_inY                                ;84D42E;
    dw UNUSED_PreInst_PLM_GotoToLinkInstructionIfBombed_84D409           ;84D430;

UNUSED_InstList_PLM_WreckedShip3x4ChozoBombBlock_84D432:
    dw $0077                                                             ;84D432;
    dw UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_0_849D59             ;84D434;
    dw Instruction_PLM_GotoY                                             ;84D436;
    dw UNUSED_InstList_PLM_WreckedShip3x4ChozoBombBlock_84D432           ;84D438;

UNUSED_InstList_PLM_WreckedShip3x4ChozoBombBlock_84D43A:
    dw Instruction_PLM_SetRoomArg_ChozoBlockDestroyed                    ;84D43A;
    dw $0004                                                             ;84D43C;
    dw UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_1_849D7D             ;84D43E;
    dw $0004                                                             ;84D440;
    dw UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_2_849DA1             ;84D442;
    dw $0004                                                             ;84D444;
    dw UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_3_849DC5             ;84D446;

UNUSED_InstList_PLM_WreckedShip3x4ChozoBombBlock_84D448:
    dw $0004                                                             ;84D448;
    dw UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_4_849DE9             ;84D44A;
    dw Instruction_PLM_Delete                                            ;84D44C;

UNUSED_InstList_PLM_AlternateLowerNorfairChozoHand_84D44E:
    dw Instruction_PLM_GotoY_ifEventIsSet                                ;84D44E;
    dw $000C                                                             ;84D450;
    dw UNUSED_InstList_PLM_AlternateLowerNorfairChozoHand_84D46E         ;84D452;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84D454;
    dw UNUSED_InstList_PLM_AlternateLowerNorfairChozoHand_84D462         ;84D456;
    dw Instruction_PLM_PreInstruction_inY                                ;84D458;
    dw PreInstruction_PLM_GotoLinkInstructionIfHitWithPowerBomb          ;84D45A;
    dw $0001                                                             ;84D45C;
    dw UNUSED_DrawInst_AlternateLowerNorfairChozoHand_849CA7             ;84D45E;
    dw Instruction_PLM_Sleep                                             ;84D460;

UNUSED_InstList_PLM_AlternateLowerNorfairChozoHand_84D462:
    dw $0001                                                             ;84D462;
    dw UNUSED_DrawInst_AlternateLowerNorfairChozoHand_849CBF             ;84D464;
    dw UNUSED_Instruction_PLM_DrainAcidLake_84D476                       ;84D466;
    dw Instruction_PLM_SetTheEvent                                       ;84D468;
    dw $000C                                                             ;84D46A;
    dw Instruction_PLM_Delete                                            ;84D46C;

UNUSED_InstList_PLM_AlternateLowerNorfairChozoHand_84D46E:
    dw UNUSED_Instruction_PLM_FXBaseYPosition_2D2_84D489                 ;84D46E;
    dw $0001                                                             ;84D470;
    dw UNUSED_DrawInst_AlternateLowerNorfairChozoHand_849CBF             ;84D472;
    dw Instruction_PLM_Delete                                            ;84D474;

UNUSED_Instruction_PLM_DrainAcidLake_84D476:
    LDA.W #$02D2                                                         ;84D476;
    STA.W $197A                                                          ;84D479;
    LDA.W #$0070                                                         ;84D47C;
    STA.W $197C                                                          ;84D47F;
    LDA.W #$0020                                                         ;84D482;
    STA.W $1980                                                          ;84D485;
    RTS                                                                  ;84D488;


UNUSED_Instruction_PLM_FXBaseYPosition_2D2_84D489:
    LDA.W #$02D2                                                         ;84D489;
    STA.W $1978                                                          ;84D48C;
    RTS                                                                  ;84D48F;


InstList_PLM_UnusedLowerNorfair2x2ChozoShotBlock_84D490:
    dw Instruction_PLM_GotoY_ifRoomArg_ChozoBlockDestroyed               ;84D490;
    dw InstList_PLM_UnusedLowerNorfair2x2ChozoShotBlock_84D4B8           ;84D492;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84D494;
    dw InstList_PLM_UnusedLowerNorfair2x2ChozoShotBlock_84D4A2           ;84D496;
    dw Instruction_PLM_PreInstruction_inY                                ;84D498;
    dw PreInstruction_PLM_GotoLinkInstructionIfShot                      ;84D49A;
    dw $0001                                                             ;84D49C;
    dw UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B0B              ;84D49E;
    dw Instruction_PLM_Sleep                                             ;84D4A0;

InstList_PLM_UnusedLowerNorfair2x2ChozoShotBlock_84D4A2:
    dw $0004                                                             ;84D4A2;
    dw UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B1B              ;84D4A4;
    dw $0004                                                             ;84D4A6;
    dw UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B2B              ;84D4A8;
    dw $0004                                                             ;84D4AA;
    dw UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B3B              ;84D4AC;
    dw $0001                                                             ;84D4AE;
    dw UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B4B              ;84D4B0;
    dw Instruction_PLM_SetRoomArg_ChozoBlockDestroyed                    ;84D4B2;
    dw RTS_84D4BE                                                        ;84D4B4;
    dw Instruction_PLM_Delete                                            ;84D4B6;

InstList_PLM_UnusedLowerNorfair2x2ChozoShotBlock_84D4B8:
    dw $0001                                                             ;84D4B8;
    dw UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B4B              ;84D4BA;
    dw Instruction_PLM_Delete                                            ;84D4BC;

RTS_84D4BE:
    RTS                                                                  ;84D4BE;


PreInstruction_PLM_WakePLMIf_A_B_X_Y_Left_Right:
    LDA.B $8F                                                            ;84D4BF;
    AND.W #$C3C0                                                         ;84D4C1;
    BEQ .return                                                          ;84D4C4;
    LDA.W #$0001                                                         ;84D4C6;
    STA.L $7EDE1C,X                                                      ;84D4C9;
    INC.W $1D27,X                                                        ;84D4CD;
    INC.W $1D27,X                                                        ;84D4D0;

.return:
    RTS                                                                  ;84D4D3;


InstList_PLM_NoobTube_0:
    dw Instruction_PLM_GotoY_ifEventIsSet                                ;84D4D4;
    dw $000B                                                             ;84D4D6;
    dw InstList_PLM_NoobTube_4                                           ;84D4D8;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84D4DA;
    dw InstList_PLM_NoobTube_1                                           ;84D4DC;
    dw Instruction_PLM_PreInstruction_inY                                ;84D4DE;
    dw PreInstruction_PLM_GotoLinkInstructionIfHitWithPowerBomb          ;84D4E0;
    dw $0001                                                             ;84D4E2;
    dw DrawInst_NoobTube_0                                               ;84D4E4;
    dw Instruction_PLM_Sleep                                             ;84D4E6;

InstList_PLM_NoobTube_1:
    dw Instruction_PLM_LinkInstruction_Y                                 ;84D4E8;
    dw InstList_PLM_NoobTube_2                                           ;84D4EA;
    dw Instruction_PLM_PreInstruction_inY                                ;84D4EC;
    dw PreInstruction_PLM_WakePLMIf_A_B_X_Y_Left_Right                   ;84D4EE;
    dw Instruction_PLM_Sleep                                             ;84D4F0;

InstList_PLM_NoobTube_2:
    dw Instruction_PLM_ClearPreInstruction                               ;84D4F2;
    dw Instruction_PLM_LockSamus                                         ;84D4F4;
    dw Instruction_PLM_SpawnNoobTubeCrackEnemyProjectile                 ;84D4F6;
    dw $0030                                                             ;84D4F8;
    dw DrawInst_NoobTube_1                                               ;84D4FA;
    dw $0001                                                             ;84D4FC;
    dw DrawInst_NoobTube_5                                               ;84D4FE;
    dw $0001                                                             ;84D500;
    dw DrawInst_NoobTube_6                                               ;84D502;
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6                            ;84D504;
    db $1A                                                               ;84D506;
    dw Inst_PLM_SpawnANoobTubeShards_6NoobTubeReleasedAirBubbles         ;84D507;
    dw Instruction_PLM_TriggerNoobTubeEarthquake                         ;84D509;
    dw $0060                                                             ;84D50B;
    dw DrawInst_NoobTube_2                                               ;84D50D;
    dw Instruction_PLM_SetTheEvent                                       ;84D50F;
    dw $000B                                                             ;84D511;
    dw Instruction_PLM_EnableWaterPhysics                                ;84D513;
    dw Instruction_PLM_UnlockSamus                                       ;84D515;
    dw Instruction_PLM_Delete                                            ;84D517;

InstList_PLM_NoobTube_3:
    dw $0001                                                             ;84D519;
    dw DrawInst_NoobTube_3                                               ;84D51B;
    dw $0001                                                             ;84D51D;
    dw DrawInst_NoobTube_4                                               ;84D51F;

InstList_PLM_NoobTube_4:
    dw Instruction_PLM_EnableWaterPhysics                                ;84D521;
    dw Instruction_PLM_Delete                                            ;84D523;

Instruction_PLM_EnableWaterPhysics:
    LDA.W #$0004                                                         ;84D525;
    TRB.W $197E                                                          ;84D528;
    RTS                                                                  ;84D52B;


Instruction_PLM_SpawnNoobTubeCrackEnemyProjectile:
    PHY                                                                  ;84D52C;
    LDY.W #EnemyProjectile_NoobTubeCrack                                 ;84D52D;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D530;
    PLY                                                                  ;84D534;
    RTS                                                                  ;84D535;


Instruction_PLM_TriggerNoobTubeEarthquake:
    LDA.W #$000B                                                         ;84D536;
    STA.W $183E                                                          ;84D539;
    LDA.W #$0040                                                         ;84D53C;
    STA.W $1840                                                          ;84D53F;
    RTS                                                                  ;84D542;


Inst_PLM_SpawnANoobTubeShards_6NoobTubeReleasedAirBubbles:
    PHY                                                                  ;84D543;
    LDA.W #$0000                                                         ;84D544;
    LDY.W #EnemyProjectile_NoobTubeShard                                 ;84D547;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D54A;
    LDA.W #$0002                                                         ;84D54E;
    LDY.W #EnemyProjectile_NoobTubeShard                                 ;84D551;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D554;
    LDA.W #$0004                                                         ;84D558;
    LDY.W #EnemyProjectile_NoobTubeShard                                 ;84D55B;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D55E;
    LDA.W #$0006                                                         ;84D562;
    LDY.W #EnemyProjectile_NoobTubeShard                                 ;84D565;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D568;
    LDA.W #$0008                                                         ;84D56C;
    LDY.W #EnemyProjectile_NoobTubeShard                                 ;84D56F;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D572;
    LDA.W #$000A                                                         ;84D576;
    LDY.W #EnemyProjectile_NoobTubeShard                                 ;84D579;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D57C;
    LDA.W #$000C                                                         ;84D580;
    LDY.W #EnemyProjectile_NoobTubeShard                                 ;84D583;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D586;
    LDA.W #$000E                                                         ;84D58A;
    LDY.W #EnemyProjectile_NoobTubeShard                                 ;84D58D;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D590;
    LDA.W #$0010                                                         ;84D594;
    LDY.W #EnemyProjectile_NoobTubeShard                                 ;84D597;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D59A;
    LDA.W #$0012                                                         ;84D59E;
    LDY.W #EnemyProjectile_NoobTubeShard                                 ;84D5A1;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D5A4;
    LDA.W #$0000                                                         ;84D5A8;
    LDY.W #EnemyProjectile_NoobTubeAirBubbles                            ;84D5AB;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D5AE;
    LDA.W #$0002                                                         ;84D5B2;
    LDY.W #EnemyProjectile_NoobTubeAirBubbles                            ;84D5B5;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D5B8;
    LDA.W #$0004                                                         ;84D5BC;
    LDY.W #EnemyProjectile_NoobTubeAirBubbles                            ;84D5BF;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D5C2;
    LDA.W #$0006                                                         ;84D5C6;
    LDY.W #EnemyProjectile_NoobTubeAirBubbles                            ;84D5C9;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D5CC;
    LDA.W #$0008                                                         ;84D5D0;
    LDY.W #EnemyProjectile_NoobTubeAirBubbles                            ;84D5D3;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D5D6;
    LDA.W #$000A                                                         ;84D5DA;
    LDY.W #EnemyProjectile_NoobTubeAirBubbles                            ;84D5DD;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D5E0;
    PLY                                                                  ;84D5E4;
    RTS                                                                  ;84D5E5;


Instruction_PLM_LockSamus:
    LDA.W #$0000                                                         ;84D5E6;
    JSL.L Run_Samus_Command                                              ;84D5E9;
    RTS                                                                  ;84D5ED;


Instruction_PLM_UnlockSamus:
    LDA.W #$0001                                                         ;84D5EE;
    JSL.L Run_Samus_Command                                              ;84D5F1;
    RTS                                                                  ;84D5F5;


Setup_MotherBrainsGlass:
; A draw instruction changes the PLM block type to shot block, making this a generic shot trigger
    LDA.W #$0000                                                         ;84D5F6;\
    STA.W $1DC7,Y                                                        ;84D5F9;} Clear PLM room argument (used as hit counter)
    LDX.W $1C87,Y                                                        ;84D5FC;\
    LDA.W #$8044                                                         ;84D5FF;} Make PLM solid block with BTS 44h
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84D602;/
    RTS                                                                  ;84D605;


Setup_BombTorizosCrumblingChozo:
    LDA.W #$0004                                                         ;84D606;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;84D609;
    BCC .return                                                          ;84D60D;
    LDA.W #$0000                                                         ;84D60F;
    STA.W $1C37,Y                                                        ;84D612;

.return:
    RTS                                                                  ;84D615;


Setup_WreckedShipChozoHand:
    LDX.W $1C87,Y                                                        ;84D616;
    LDA.W #$B080                                                         ;84D619;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84D61C;
    RTS                                                                  ;84D61F;


Setup_Collision_WreckedShipChozoHandTrigger:
    LDA.W #$0001                                                         ;84D620;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;84D623;
    BCC .return                                                          ;84D627;
    LDA.W $0B02                                                          ;84D629;
    AND.W #$000F                                                         ;84D62C;
    CMP.W #$0003                                                         ;84D62F;
    BNE .return                                                          ;84D632;
    LDA.W $0A1C                                                          ;84D634;
    CMP.W #$001D                                                         ;84D637;
    BEQ .trigger                                                         ;84D63A;
    CMP.W #$0079                                                         ;84D63C;
    BEQ .trigger                                                         ;84D63F;
    CMP.W #$007A                                                         ;84D641;
    BNE .return                                                          ;84D644;

.trigger:
    LDA.W #$0001                                                         ;84D646;
    STA.W $0FB4                                                          ;84D649;
    LDA.W #$0202                                                         ;84D64C;
    STA.L $7ECD27                                                        ;84D64F;
    LDA.W #$0101                                                         ;84D653;
    STA.L $7ECD2D                                                        ;84D656;
    LDX.W $1C87,Y                                                        ;84D65A;
    LDA.L $7F0002,X                                                      ;84D65D;
    AND.W #$0FFF                                                         ;84D661;
    STA.L $7F0002,X                                                      ;84D664;
    LDA.W #$0000                                                         ;84D668;
    JSL.L Run_Samus_Command                                              ;84D66B;
    JSL.L Spawn_Hardcoded_PLM                                            ;84D66F;
    db $17,$1D                                                           ;84D673;
    dw PLMEntries_ClearSlopeAccessForWreckedShipChozo                    ;84D675;

.return:
    LDA.W #$0000                                                         ;84D677;
    STA.W $1C37,Y                                                        ;84D67A;
    SEC                                                                  ;84D67D;
    RTS                                                                  ;84D67E;


Setup_UnusedWreckedShip3x4ChozoBombBlock:
    LDX.W $1C87,Y                                                        ;84D67F;
    LDA.W #$0044                                                         ;84D682;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84D685;
    RTS                                                                  ;84D688;


Setup_UnusedAlternateLowerNorfairChozoHand:
    LDX.W $1C87,Y                                                        ;84D689;
    LDA.W #$8044                                                         ;84D68C;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84D68F;
    RTS                                                                  ;84D692;


Setup_UnusedLowerNorfair2x2ChozoShotBlock:
    LDX.W $1C87,Y                                                        ;84D693;
    LDA.W #$8044                                                         ;84D696;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84D699;
    LDX.W $1C87,Y                                                        ;84D69C;
    INX                                                                  ;84D69F;
    INX                                                                  ;84D6A0;
    LDA.W #$50FF                                                         ;84D6A1;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84D6A4;
    LDA.W $1C87,Y                                                        ;84D6A7;
    CLC                                                                  ;84D6AA;
    ADC.W $07A5                                                          ;84D6AB;
    ADC.W $07A5                                                          ;84D6AE;
    TAX                                                                  ;84D6B1;
    LDA.W #$D0FF                                                         ;84D6B2;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84D6B5;
    LDA.W $1C87,Y                                                        ;84D6B8;
    CLC                                                                  ;84D6BB;
    ADC.W $07A5                                                          ;84D6BC;
    ADC.W $07A5                                                          ;84D6BF;
    TAX                                                                  ;84D6C2;
    INX                                                                  ;84D6C3;
    INX                                                                  ;84D6C4;
    LDA.W #$D0FF                                                         ;84D6C5;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84D6C8;
    RTS                                                                  ;84D6CB;


Setup_NoobTube:
    LDX.W $1C87,Y                                                        ;84D6CC;
    LDA.W #$8044                                                         ;84D6CF;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84D6D2;
    RTS                                                                  ;84D6D5;


PLMEntries_LowerNorfairChozoHand:
    dw RTS_84D18E                                                        ;84D6D6;
    dw InstList_PLM_LowerNorfairChozoHand_0                              ;84D6D8;

PLMEntries_Collision_LowerNorfairChozoHandCheck:
    dw Setup_Reaction_LowerNorfairChozoHandTrigger                       ;84D6DA;
    dw InstList_PLM_Delete                                               ;84D6DC;

PLMEntries_MotherBrainsGlass:
    dw Setup_MotherBrainsGlass                                           ;84D6DE;
    dw InstList_PLM_MotherBrainsGlass_0                                  ;84D6E0;

UNUSED_PLMEntries_MotherBrainsGlass_AreaBossDead_84D6E2:
    dw Setup_DeactivatePLM                                               ;84D6E2;
    dw InstList_PLM_UnusedMotherBrainsGlass_AreaBossDead                 ;84D6E4;

UNUSED_PLMEntries_MotherBrainsGlass_NoGlassState_84D6E6:
    dw Setup_DeactivatePLM                                               ;84D6E6;
    dw InstList_PLM_UnusedMotherBrainsGlass_NoGlassState                 ;84D6E8;

PLMEntries_BombTorizosCrumblingChozo:
    dw Setup_BombTorizosCrumblingChozo                                   ;84D6EA;
    dw InstList_PLM_BombTorizosCrumblingChozo                            ;84D6EC;

PLMEntries_WreckedShipChozoHand:
    dw Setup_WreckedShipChozoHand                                        ;84D6EE;
    dw InstList_PLM_Delete                                               ;84D6F0;

PLMEntries_Collision_WreckedShipChozoHandCheck:
    dw Setup_Collision_WreckedShipChozoHandTrigger                       ;84D6F2;
    dw InstList_PLM_Delete                                               ;84D6F4;

RTS_84D6F6:
    RTS                                                                  ;84D6F6;


RTS_84D6F7:
    RTS                                                                  ;84D6F7;


PLMEntries_ClearSlopeAccessForWreckedShipChozo:
    dw RTS_84D6F6                                                        ;84D6F8;
    dw InstList_PLM_ClearSlopeAccessForWreckedShipChozo                  ;84D6FA;

PLMEntries_BlockSlopeAccessForWreckedShipChozo:
    dw RTS_84D6F7                                                        ;84D6FC;
    dw InstList_PLM_BlockSlopeAccessForWreckedShipChozo                  ;84D6FE;

UNUSED_PLMEntries_WreckedShip3x4ChozoShotBlock_84D700:
    dw Setup_UnusedWreckedShip3x4ChozoBombBlock                          ;84D700;
    dw UNUSED_InstList_PLM_WreckedShip3x4ChozoBombBlock_84D426           ;84D702;

UNUSED_PLMEntries_AltLowerNorfairChozoHand_84D704:
    dw Setup_UnusedAlternateLowerNorfairChozoHand                        ;84D704;
    dw UNUSED_InstList_PLM_AlternateLowerNorfairChozoHand_84D44E         ;84D706;

UNUSED_PLMEntries_LowerNorfair2x2ChozoShotBlock_84D708:
    dw Setup_UnusedLowerNorfair2x2ChozoShotBlock                         ;84D708;
    dw InstList_PLM_UnusedLowerNorfair2x2ChozoShotBlock_84D490           ;84D70A;

PLMEntries_NoobTube:
    dw Setup_NoobTube                                                    ;84D70C;
    dw InstList_PLM_NoobTube_0                                           ;84D70E;

UNUSED_PreInst_PLM_WakePLMIfSamusIsWithin4Blocks_84D710:
    JSL.L Calculate_PLM_Block_Coordinates                                ;84D710;
    LDA.W $0AF6                                                          ;84D714;
    LSR A                                                                ;84D717;
    LSR A                                                                ;84D718;
    LSR A                                                                ;84D719;
    LSR A                                                                ;84D71A;
    SEC                                                                  ;84D71B;
    SBC.W $1C29                                                          ;84D71C;
    BPL +                                                                ;84D71F;
    EOR.W #$FFFF                                                         ;84D721;
    INC A                                                                ;84D724;

  + CMP.W #$0004                                                         ;84D725;
    BEQ +                                                                ;84D728;
    BCS .return                                                          ;84D72A;

  + LDA.W $0AFA                                                          ;84D72C;
    LSR A                                                                ;84D72F;
    LSR A                                                                ;84D730;
    LSR A                                                                ;84D731;
    LSR A                                                                ;84D732;
    SEC                                                                  ;84D733;
    SBC.W $1C2B                                                          ;84D734;
    BPL +                                                                ;84D737;
    EOR.W #$FFFF                                                         ;84D739;
    INC A                                                                ;84D73C;

  + CMP.W #$0004                                                         ;84D73D;
    BEQ +                                                                ;84D740;
    BCS .return                                                          ;84D742;

  + LDA.L $7EDEBC,X                                                      ;84D744;
    STA.W $1D27,X                                                        ;84D748;
    LDA.W #$0001                                                         ;84D74B;
    STA.L $7EDE1C,X                                                      ;84D74E;

.return:
    RTS                                                                  ;84D752;


PreInstruction_PLM_WakePLMIfRoomArgDoorIsSet:
    TXY                                                                  ;84D753;
    LDA.W $1DC7,X                                                        ;84D754;
    JSL.L BitIndexToByteIndexAndBitmask                                  ;84D757;
    LDA.L $7ED8B0,X                                                      ;84D75B;
    AND.W $05E7                                                          ;84D75F;
    BEQ .return                                                          ;84D762;
    TYX                                                                  ;84D764;
    LDA.W #.return                                                       ;84D765;
    STA.W $1CD7,X                                                        ;84D768;
    LDA.L $7EDEBC,X                                                      ;84D76B;
    STA.W $1D27,X                                                        ;84D76F;
    LDA.W #$0001                                                         ;84D772;
    STA.L $7EDE1C,X                                                      ;84D775;

.return:
    RTS                                                                  ;84D779;


Instruction_PLM_ShootEyeDoorProjectileWithEnemyProjArgY:
    LDA.W $0000,Y                                                        ;84D77A;
    PHY                                                                  ;84D77D;
    LDY.W #EnemyProjectile_EyeDoorProjectile                             ;84D77E;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D781;
    LDA.W #$004C                                                         ;84D785;
    JSL.L QueueSound_Lib2_Max6                                           ;84D788;
    PLY                                                                  ;84D78C;
    INY                                                                  ;84D78D;
    INY                                                                  ;84D78E;
    RTS                                                                  ;84D78F;


Instruction_PLM_SpawnEyeDoorSweatEnemyProjectileWithArgY:
    LDA.W $0000,Y                                                        ;84D790;
    PHY                                                                  ;84D793;
    LDY.W #EnemyProjectile_EyeDoorSweat                                  ;84D794;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D797;
    PLY                                                                  ;84D79B;
    INY                                                                  ;84D79C;
    INY                                                                  ;84D79D;
    RTS                                                                  ;84D79E;


Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles:
    PHY                                                                  ;84D79F;
    LDA.W #$030A                                                         ;84D7A0;
    LDY.W #EnemyProjectile_MiscDustPLM                                   ;84D7A3;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D7A6;
    LDA.W #$030A                                                         ;84D7AA;
    LDY.W #EnemyProjectile_MiscDustPLM                                   ;84D7AD;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D7B0;
    PLY                                                                  ;84D7B4;
    RTS                                                                  ;84D7B5;


Instruction_PLM_SpawnEyeDoorSweatDropProjectile:
    PHY                                                                  ;84D7B6;
    LDA.W #$000B                                                         ;84D7B7;
    LDY.W #EnemyProjectile_MiscDustPLM                                   ;84D7BA;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;84D7BD;
    PLY                                                                  ;84D7C1;
    RTS                                                                  ;84D7C2;


Instruction_PLM_MovePLMUp1Row_MakeABlueDoorFacingRight:
    PHX                                                                  ;84D7C3;
    LDA.W $1C87,X                                                        ;84D7C4;
    SEC                                                                  ;84D7C7;
    SBC.W $07A5                                                          ;84D7C8;
    SBC.W $07A5                                                          ;84D7CB;
    STA.W $1C87,X                                                        ;84D7CE;
    TAX                                                                  ;84D7D1;
    LDA.W #$C041                                                         ;84D7D2;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84D7D5;
    BRA Create3BlockVerticalExtension                                    ;84D7D8;


Instruction_PLM_MovePLMUp1Row_MakeABlueDoorFacingLeft:
    PHX                                                                  ;84D7DA;
    LDA.W $1C87,X                                                        ;84D7DB;
    SEC                                                                  ;84D7DE;
    SBC.W $07A5                                                          ;84D7DF;
    SBC.W $07A5                                                          ;84D7E2;
    STA.W $1C87,X                                                        ;84D7E5;
    TAX                                                                  ;84D7E8;
    LDA.W #$C040                                                         ;84D7E9;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84D7EC;

Create3BlockVerticalExtension:
    TXA                                                                  ;84D7EF;
    CLC                                                                  ;84D7F0;
    ADC.W $07A5                                                          ;84D7F1;
    ADC.W $07A5                                                          ;84D7F4;
    TAX                                                                  ;84D7F7;
    LDA.W #$D0FF                                                         ;84D7F8;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84D7FB;
    TXA                                                                  ;84D7FE;
    CLC                                                                  ;84D7FF;
    ADC.W $07A5                                                          ;84D800;
    ADC.W $07A5                                                          ;84D803;
    TAX                                                                  ;84D806;
    LDA.W #$D0FE                                                         ;84D807;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84D80A;
    TXA                                                                  ;84D80D;
    CLC                                                                  ;84D80E;
    ADC.W $07A5                                                          ;84D80F;
    ADC.W $07A5                                                          ;84D812;
    TAX                                                                  ;84D815;
    LDA.W #$D0FD                                                         ;84D816;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84D819;
    PLX                                                                  ;84D81C;
    RTS                                                                  ;84D81D;


InstList_PLM_EyeDoorEyeFacingLeft_0:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84D81E;
    dw InstList_PLM_EyeDoorEyeFacingLeft_8                               ;84D820;

InstList_PLM_EyeDoorEyeFacingLeft_1:
    dw $0004                                                             ;84D822;
    dw DrawInst_EyeDoorEyeFacingLeft_1                                   ;84D824;
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM           ;84D826;
    db $06,$04                                                           ;84D828;
    dw InstList_PLM_EyeDoorEyeFacingLeft_2                               ;84D82A;
    dw Instruction_PLM_GotoY                                             ;84D82C;
    dw InstList_PLM_EyeDoorEyeFacingLeft_1                               ;84D82E;

InstList_PLM_EyeDoorEyeFacingLeft_2:
    dw Instruction_PLM_LinkInstruction_Y                                 ;84D830;
    dw InstList_PLM_EyeDoorEyeFacingLeft_5                               ;84D832;
    dw Instruction_PLM_PreInstruction_inY                                ;84D834;
    dw PreInstruction_PLM_GotoLinkInstructionIfShotWithAMissile          ;84D836;
    dw $0008                                                             ;84D838;
    dw DrawInst_EyeDoorEyeFacingLeft_2                                   ;84D83A;

InstList_PLM_EyeDoorEyeFacingLeft_3:
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM           ;84D83C;
    db $01,$04                                                           ;84D83E;
    dw InstList_PLM_EyeDoorEyeFacingLeft_4                               ;84D840;
    dw $0040                                                             ;84D842;
    dw DrawInst_EyeDoorEyeFacingLeft_3                                   ;84D844;
    dw Instruction_PLM_ShootEyeDoorProjectileWithEnemyProjArgY           ;84D846;
    dw $0000,$0020                                                       ;84D848;
    dw DrawInst_EyeDoorEyeFacingLeft_3                                   ;84D84C;
    dw Instruction_PLM_ShootEyeDoorProjectileWithEnemyProjArgY           ;84D84E;
    dw $0000,$0020                                                       ;84D850;
    dw DrawInst_EyeDoorEyeFacingLeft_3                                   ;84D854;
    dw Instruction_PLM_ShootEyeDoorProjectileWithEnemyProjArgY           ;84D856;
    dw $0000,$0040                                                       ;84D858;
    dw DrawInst_EyeDoorEyeFacingLeft_3                                   ;84D85C;
    dw $0006                                                             ;84D85E;
    dw DrawInst_EyeDoorEyeFacingLeft_2                                   ;84D860;
    dw $0030                                                             ;84D862;
    dw DrawInst_EyeDoorEyeFacingLeft_1                                   ;84D864;
    dw $0030                                                             ;84D866;
    dw DrawInst_EyeDoorEyeFacingLeft_1                                   ;84D868;
    dw $0006                                                             ;84D86A;
    dw DrawInst_EyeDoorEyeFacingLeft_2                                   ;84D86C;
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM           ;84D86E;
    db $06,$04                                                           ;84D870;
    dw InstList_PLM_EyeDoorEyeFacingLeft_3                               ;84D872;
    dw Instruction_PLM_GotoY                                             ;84D874;
    dw InstList_PLM_EyeDoorEyeFacingLeft_1                               ;84D876;

InstList_PLM_EyeDoorEyeFacingLeft_4:
    dw $0004                                                             ;84D878;
    dw DrawInst_EyeDoorEyeFacingLeft_1                                   ;84D87A;
    dw Instruction_PLM_GotoY                                             ;84D87C;
    dw InstList_PLM_EyeDoorEyeFacingLeft_3                               ;84D87E;

InstList_PLM_EyeDoorEyeFacingLeft_5:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6                            ;84D880;
    db $09                                                               ;84D882;
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles                ;84D883;
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles                ;84D885;
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY                   ;84D887;
    db $03                                                               ;84D889;
    dw InstList_PLM_EyeDoorEyeFacingLeft_6                               ;84D88A;
    dw $0002                                                             ;84D88C;
    dw DrawInst_EyeDoorEyeFacingLeft_4                                   ;84D88E;
    dw $0002                                                             ;84D890;
    dw DrawInst_EyeDoorEyeFacingLeft_5                                   ;84D892;
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles                ;84D894;
    dw $0002                                                             ;84D896;
    dw DrawInst_EyeDoorEyeFacingLeft_4                                   ;84D898;
    dw $0002                                                             ;84D89A;
    dw DrawInst_EyeDoorEyeFacingLeft_5                                   ;84D89C;
    dw $0002                                                             ;84D89E;
    dw DrawInst_EyeDoorEyeFacingLeft_4                                   ;84D8A0;
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles                ;84D8A2;
    dw $0002                                                             ;84D8A4;
    dw DrawInst_EyeDoorEyeFacingLeft_5                                   ;84D8A6;
    dw $0004                                                             ;84D8A8;
    dw DrawInst_EyeDoorEyeFacingLeft_2                                   ;84D8AA;
    dw $0008                                                             ;84D8AC;
    dw DrawInst_EyeDoorEyeFacingLeft_1                                   ;84D8AE;
    dw Instruction_PLM_SpawnEyeDoorSweatEnemyProjectileWithArgY          ;84D8B0;
    dw $0000,$0038                                                       ;84D8B2;
    dw DrawInst_EyeDoorEyeFacingLeft_1                                   ;84D8B6;
    dw $0004                                                             ;84D8B8;
    dw DrawInst_EyeDoorEyeFacingLeft_2                                   ;84D8BA;
    dw $0004                                                             ;84D8BC;
    dw DrawInst_EyeDoorEyeFacingLeft_5                                   ;84D8BE;
    dw Instruction_PLM_GotoY                                             ;84D8C0;
    dw InstList_PLM_EyeDoorEyeFacingLeft_3                               ;84D8C2;

InstList_PLM_EyeDoorEyeFacingLeft_6:
    dw Instruction_PLM_ClearPreInstruction                               ;84D8C4;
    dw Instruction_PLM_SpawnEyeDoorSweatDropProjectile                   ;84D8C6;
    dw Instruction_PLM_SpawnEyeDoorSweatDropProjectile                   ;84D8C8;
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles                ;84D8CA;
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles                ;84D8CC;
    dw Instruction_PLM_MovePLMUp1Row_MakeABlueDoorFacingLeft             ;84D8CE;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84D8D0;
    db $0A                                                               ;84D8D2;

InstList_PLM_EyeDoorEyeFacingLeft_7:
    dw $0003                                                             ;84D8D3;
    dw DrawInst_EyeDoorEyeFacingLeft_0                                   ;84D8D5;
    dw $0004                                                             ;84D8D7;
    dw DrawInst_EyeDoorEyeFacingLeft                                     ;84D8D9;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84D8DB;
    dw InstList_PLM_EyeDoorEyeFacingLeft_7                               ;84D8DD;
    dw Instruction_PLM_GotoY                                             ;84D8DF;
    dw InstList_PLM_ClosedBlueDoorFacingLeft_40                          ;84D8E1;

InstList_PLM_EyeDoorEyeFacingLeft_8:
    dw Instruction_PLM_MovePLMUp1Row_MakeABlueDoorFacingLeft             ;84D8E3;
    dw Instruction_PLM_GotoY                                             ;84D8E5;
    dw InstList_PLM_ClosedBlueDoorFacingLeft_40                          ;84D8E7;

InstList_PLM_EyeDoorFacingLeft_0:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84D8E9;
    dw InstList_PLM_EyeDoorFacingLeft_4                                  ;84D8EB;

InstList_PLM_EyeDoorFacingLeft_1:
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM           ;84D8ED;
    db $06,$10                                                           ;84D8EF;
    dw InstList_PLM_EyeDoorFacingLeft_2                                  ;84D8F1;
    dw $0008                                                             ;84D8F3;
    dw DrawInst_EyeDoorFacingLeft_0                                      ;84D8F5;
    dw Instruction_PLM_GotoY                                             ;84D8F7;
    dw InstList_PLM_EyeDoorFacingLeft_1                                  ;84D8F9;

InstList_PLM_EyeDoorFacingLeft_2:
    dw Instruction_PLM_LinkInstruction_Y                                 ;84D8FB;
    dw InstList_PLM_EyeDoorFacingLeft_4                                  ;84D8FD;
    dw Instruction_PLM_PreInstruction_inY                                ;84D8FF;
    dw PreInstruction_PLM_WakePLMIfRoomArgDoorIsSet                      ;84D901;

InstList_PLM_EyeDoorFacingLeft_3:
    dw $0008                                                             ;84D903;
    dw DrawInst_EyeDoorFacingLeft_0                                      ;84D905;
    dw $0008                                                             ;84D907;
    dw DrawInst_EyeDoorFacingLeft_1                                      ;84D909;
    dw $0008                                                             ;84D90B;
    dw DrawInst_EyeDoorFacingLeft_2                                      ;84D90D;
    dw $0008                                                             ;84D90F;
    dw DrawInst_EyeDoorFacingLeft_1                                      ;84D911;
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM           ;84D913;
    db $06,$10                                                           ;84D915;
    dw InstList_PLM_EyeDoorFacingLeft_3                                  ;84D917;
    dw Instruction_PLM_GotoY                                             ;84D919;
    dw InstList_PLM_EyeDoorFacingLeft_1                                  ;84D91B;

InstList_PLM_EyeDoorFacingLeft_4:
    dw Instruction_PLM_Delete                                            ;84D91D;

InstList_PLM_EyeDoorBottomFacingLeft_0:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84D91F;
    dw InstList_PLM_EyeDoorBottomFacingLeft_4                            ;84D921;

InstList_PLM_EyeDoorBottomFacingLeft_1:
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM           ;84D923;
    db $06,$10                                                           ;84D925;
    dw InstList_PLM_EyeDoorBottomFacingLeft_2                            ;84D927;
    dw $0008                                                             ;84D929;
    dw DrawInst_EyeDoorBottomFacingLeft_0                                ;84D92B;
    dw Instruction_PLM_GotoY                                             ;84D92D;
    dw InstList_PLM_EyeDoorBottomFacingLeft_1                            ;84D92F;

InstList_PLM_EyeDoorBottomFacingLeft_2:
    dw Instruction_PLM_LinkInstruction_Y                                 ;84D931;
    dw InstList_PLM_EyeDoorBottomFacingLeft_4                            ;84D933;
    dw Instruction_PLM_PreInstruction_inY                                ;84D935;
    dw PreInstruction_PLM_WakePLMIfRoomArgDoorIsSet                      ;84D937;

InstList_PLM_EyeDoorBottomFacingLeft_3:
    dw $0008                                                             ;84D939;
    dw DrawInst_EyeDoorBottomFacingLeft_0                                ;84D93B;
    dw $0008                                                             ;84D93D;
    dw DrawInst_EyeDoorBottomFacingLeft_1                                ;84D93F;
    dw $0008                                                             ;84D941;
    dw DrawInst_EyeDoorBottomFacingLeft_2                                ;84D943;
    dw $0008                                                             ;84D945;
    dw DrawInst_EyeDoorBottomFacingLeft_1                                ;84D947;
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM           ;84D949;
    dw $1006                                                             ;84D94B;
    dw InstList_PLM_EyeDoorBottomFacingLeft_3                            ;84D94D;
    dw Instruction_PLM_GotoY                                             ;84D94F;
    dw InstList_PLM_EyeDoorBottomFacingLeft_1                            ;84D951;

InstList_PLM_EyeDoorBottomFacingLeft_4:
    dw Instruction_PLM_Delete                                            ;84D953;

InstList_PLM_EyeDoorEyeFacingRight_0:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84D955;
    dw InstList_PLM_EyeDoorEyeFacingRight_8                              ;84D957;

InstList_PLM_EyeDoorEyeFacingRight_1:
    dw $0004                                                             ;84D959;
    dw DrawInst_EyeDoorEyeFacingRight_1                                  ;84D95B;
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM           ;84D95D;
    db $06,$04                                                           ;84D95F;
    dw InstList_PLM_EyeDoorEyeFacingRight_2                              ;84D961;
    dw Instruction_PLM_GotoY                                             ;84D963;
    dw InstList_PLM_EyeDoorEyeFacingRight_1                              ;84D965;

InstList_PLM_EyeDoorEyeFacingRight_2:
    dw Instruction_PLM_LinkInstruction_Y                                 ;84D967;
    dw InstList_PLM_EyeDoorEyeFacingRight_5                              ;84D969;
    dw Instruction_PLM_PreInstruction_inY                                ;84D96B;
    dw PreInstruction_PLM_GotoLinkInstructionIfShotWithAMissile          ;84D96D;
    dw $0008                                                             ;84D96F;
    dw DrawInst_EyeDoorEyeFacingRight_2                                  ;84D971;

InstList_PLM_EyeDoorEyeFacingRight_3:
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM           ;84D973;
    db $01,$04                                                           ;84D975;
    dw InstList_PLM_EyeDoorEyeFacingRight_4                              ;84D977;
    dw $0040                                                             ;84D979;
    dw DrawInst_EyeDoorEyeFacingRight_3                                  ;84D97B;
    dw Instruction_PLM_ShootEyeDoorProjectileWithEnemyProjArgY           ;84D97D;
    dw $0014,$0020                                                       ;84D97F;
    dw DrawInst_EyeDoorEyeFacingRight_3                                  ;84D983;
    dw Instruction_PLM_ShootEyeDoorProjectileWithEnemyProjArgY           ;84D985;
    dw $0014,$0020                                                       ;84D987;
    dw DrawInst_EyeDoorEyeFacingRight_3                                  ;84D98B;
    dw Instruction_PLM_ShootEyeDoorProjectileWithEnemyProjArgY           ;84D98D;
    dw $0014,$0040                                                       ;84D98F;
    dw DrawInst_EyeDoorEyeFacingRight_3                                  ;84D993;
    dw $0006                                                             ;84D995;
    dw DrawInst_EyeDoorEyeFacingRight_2                                  ;84D997;
    dw $0030                                                             ;84D999;
    dw DrawInst_EyeDoorEyeFacingRight_1                                  ;84D99B;
    dw $0030                                                             ;84D99D;
    dw DrawInst_EyeDoorEyeFacingRight_1                                  ;84D99F;
    dw $0006                                                             ;84D9A1;
    dw DrawInst_EyeDoorEyeFacingRight_2                                  ;84D9A3;
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM           ;84D9A5;
    db $06,$04                                                           ;84D9A7;
    dw InstList_PLM_EyeDoorEyeFacingRight_3                              ;84D9A9;
    dw Instruction_PLM_GotoY                                             ;84D9AB;
    dw InstList_PLM_EyeDoorEyeFacingRight_1                              ;84D9AD;

InstList_PLM_EyeDoorEyeFacingRight_4:
    dw $0004                                                             ;84D9AF;
    dw DrawInst_EyeDoorEyeFacingRight_1                                  ;84D9B1;
    dw Instruction_PLM_GotoY                                             ;84D9B3;
    dw InstList_PLM_EyeDoorEyeFacingRight_3                              ;84D9B5;

InstList_PLM_EyeDoorEyeFacingRight_5:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6                            ;84D9B7;
    db $09                                                               ;84D9B9;
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles                ;84D9BA;
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles                ;84D9BC;
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY                   ;84D9BE;
    db $03                                                               ;84D9C0;
    dw InstList_PLM_EyeDoorEyeFacingRight_6                              ;84D9C1;
    dw $0002                                                             ;84D9C3;
    dw DrawInst_EyeDoorEyeFacingRight_4                                  ;84D9C5;
    dw $0002                                                             ;84D9C7;
    dw DrawInst_EyeDoorEyeFacingRight_5                                  ;84D9C9;
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles                ;84D9CB;
    dw $0002                                                             ;84D9CD;
    dw DrawInst_EyeDoorEyeFacingRight_4                                  ;84D9CF;
    dw $0002                                                             ;84D9D1;
    dw DrawInst_EyeDoorEyeFacingRight_5                                  ;84D9D3;
    dw $0002                                                             ;84D9D5;
    dw DrawInst_EyeDoorEyeFacingRight_4                                  ;84D9D7;
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles                ;84D9D9;
    dw $0002                                                             ;84D9DB;
    dw DrawInst_EyeDoorEyeFacingRight_5                                  ;84D9DD;
    dw $0004                                                             ;84D9DF;
    dw DrawInst_EyeDoorEyeFacingRight_2                                  ;84D9E1;
    dw $0008                                                             ;84D9E3;
    dw DrawInst_EyeDoorEyeFacingRight_1                                  ;84D9E5;
    dw Instruction_PLM_SpawnEyeDoorSweatEnemyProjectileWithArgY          ;84D9E7;
    dw $0004,$0038                                                       ;84D9E9;
    dw DrawInst_EyeDoorEyeFacingRight_1                                  ;84D9ED;
    dw $0004                                                             ;84D9EF;
    dw DrawInst_EyeDoorEyeFacingRight_2                                  ;84D9F1;
    dw $0004                                                             ;84D9F3;
    dw DrawInst_EyeDoorEyeFacingRight_5                                  ;84D9F5;
    dw Instruction_PLM_GotoY                                             ;84D9F7;
    dw InstList_PLM_EyeDoorEyeFacingRight_3                              ;84D9F9;

InstList_PLM_EyeDoorEyeFacingRight_6:
    dw Instruction_PLM_ClearPreInstruction                               ;84D9FB;
    dw Instruction_PLM_SpawnEyeDoorSweatDropProjectile                   ;84D9FD;
    dw Instruction_PLM_SpawnEyeDoorSweatDropProjectile                   ;84D9FF;
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles                ;84DA01;
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles                ;84DA03;
    dw Instruction_PLM_MovePLMUp1Row_MakeABlueDoorFacingRight            ;84DA05;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84DA07;
    db $0A                                                               ;84DA09;

InstList_PLM_EyeDoorEyeFacingRight_7:
    dw $0003                                                             ;84DA0A;
    dw DrawInst_EyeDoorEyeFacingRight_0                                  ;84DA0C;
    dw $0004                                                             ;84DA0E;
    dw DrawInst_EyeDoorEyeFacingRight                                    ;84DA10;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84DA12;
    dw InstList_PLM_EyeDoorEyeFacingRight_7                              ;84DA14;
    dw Instruction_PLM_GotoY                                             ;84DA16;
    dw InstList_PLM_ClosedBlueDoorFacingLeft_41                          ;84DA18;

InstList_PLM_EyeDoorEyeFacingRight_8:
    dw Instruction_PLM_MovePLMUp1Row_MakeABlueDoorFacingRight            ;84DA1A;
    dw Instruction_PLM_GotoY                                             ;84DA1C;
    dw InstList_PLM_ClosedBlueDoorFacingLeft_41                          ;84DA1E;

InstList_PLM_EyeDoorFacingRight_0:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84DA20;
    dw InstList_PLM_EyeDoorFacingRight_4                                 ;84DA22;

InstList_PLM_EyeDoorFacingRight_1:
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM           ;84DA24;
    db $06,$10                                                           ;84DA26;
    dw InstList_PLM_EyeDoorFacingRight_2                                 ;84DA28;
    dw $0008                                                             ;84DA2A;
    dw DrawInst_EyeDoorFacingRight_0                                     ;84DA2C;
    dw Instruction_PLM_GotoY                                             ;84DA2E;
    dw InstList_PLM_EyeDoorFacingRight_1                                 ;84DA30;

InstList_PLM_EyeDoorFacingRight_2:
    dw Instruction_PLM_LinkInstruction_Y                                 ;84DA32;
    dw InstList_PLM_EyeDoorFacingRight_4                                 ;84DA34;
    dw Instruction_PLM_PreInstruction_inY                                ;84DA36;
    dw PreInstruction_PLM_WakePLMIfRoomArgDoorIsSet                      ;84DA38;

InstList_PLM_EyeDoorFacingRight_3:
    dw $0006                                                             ;84DA3A;
    dw DrawInst_EyeDoorFacingRight_0                                     ;84DA3C;
    dw $0006                                                             ;84DA3E;
    dw DrawInst_EyeDoorFacingRight_1                                     ;84DA40;
    dw $0006                                                             ;84DA42;
    dw DrawInst_EyeDoorFacingRight_2                                     ;84DA44;
    dw $0006                                                             ;84DA46;
    dw DrawInst_EyeDoorFacingRight_1                                     ;84DA48;
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM           ;84DA4A;
    db $06,$10                                                           ;84DA4C;
    dw InstList_PLM_EyeDoorFacingRight_3                                 ;84DA4E;
    dw Instruction_PLM_GotoY                                             ;84DA50;
    dw InstList_PLM_EyeDoorFacingRight_1                                 ;84DA52;

InstList_PLM_EyeDoorFacingRight_4:
    dw Instruction_PLM_Delete                                            ;84DA54;

InstList_PLM_EyeDoorBottomFacingRight_0:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet                         ;84DA56;
    dw InstList_PLM_EyeDoorBottomFacingRight_4                           ;84DA58;

InstList_PLM_EyeDoorBottomFacingRight_1:
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM           ;84DA5A;
    db $06,$10                                                           ;84DA5C;
    dw InstList_PLM_EyeDoorBottomFacingRight_2                           ;84DA5E;
    dw $0008                                                             ;84DA60;
    dw DrawInst_EyeDoorBottomFacingRight_0                               ;84DA62;
    dw Instruction_PLM_GotoY                                             ;84DA64;
    dw InstList_PLM_EyeDoorBottomFacingRight_1                           ;84DA66;

InstList_PLM_EyeDoorBottomFacingRight_2:
    dw Instruction_PLM_LinkInstruction_Y                                 ;84DA68;
    dw InstList_PLM_EyeDoorBottomFacingRight_4                           ;84DA6A;
    dw Instruction_PLM_PreInstruction_inY                                ;84DA6C;
    dw PreInstruction_PLM_WakePLMIfRoomArgDoorIsSet                      ;84DA6E;

InstList_PLM_EyeDoorBottomFacingRight_3:
    dw $0006                                                             ;84DA70;
    dw DrawInst_EyeDoorBottomFacingRight_0                               ;84DA72;
    dw $0006                                                             ;84DA74;
    dw DrawInst_EyeDoorBottomFacingRight_1                               ;84DA76;
    dw $0006                                                             ;84DA78;
    dw DrawInst_EyeDoorBottomFacingRight_2                               ;84DA7A;
    dw $0006                                                             ;84DA7C;
    dw DrawInst_EyeDoorBottomFacingRight_1                               ;84DA7E;
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM           ;84DA80;
    db $06,$10                                                           ;84DA82;
    dw InstList_PLM_EyeDoorBottomFacingRight_3                           ;84DA84;
    dw Instruction_PLM_GotoY                                             ;84DA86;
    dw InstList_PLM_EyeDoorBottomFacingRight_1                           ;84DA88;

InstList_PLM_EyeDoorBottomFacingRight_4:
    dw Instruction_PLM_Delete                                            ;84DA8A;

Setup_EyeDoorEye:
    PHY                                                                  ;84DA8C;
    LDA.W $1DC7,Y                                                        ;84DA8D;
    JSL.L BitIndexToByteIndexAndBitmask                                  ;84DA90;
    LDA.L $7ED8B0,X                                                      ;84DA94;
    PLY                                                                  ;84DA98;
    AND.W $05E7                                                          ;84DA99;
    BNE .return                                                          ;84DA9C;
    LDX.W $1C87,Y                                                        ;84DA9E;
    LDA.W #$C044                                                         ;84DAA1;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DAA4;
    LDA.W $1C87,Y                                                        ;84DAA7;
    CLC                                                                  ;84DAAA;
    ADC.W $07A5                                                          ;84DAAB;
    ADC.W $07A5                                                          ;84DAAE;
    TAX                                                                  ;84DAB1;
    LDA.W #$D0FF                                                         ;84DAB2;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DAB5;

.return:
    RTS                                                                  ;84DAB8;


Setup_EyeDoor:
    PHY                                                                  ;84DAB9;
    LDA.W $1DC7,Y                                                        ;84DABA;
    JSL.L BitIndexToByteIndexAndBitmask                                  ;84DABD;
    LDA.L $7ED8B0,X                                                      ;84DAC1;
    PLY                                                                  ;84DAC5;
    AND.W $05E7                                                          ;84DAC6;
    BNE .return                                                          ;84DAC9;
    LDX.W $1C87,Y                                                        ;84DACB;
    LDA.W #$A000                                                         ;84DACE;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DAD1;

.return:
    RTS                                                                  ;84DAD4;


RTS_84DAD5:
    RTS                                                                  ;84DAD5;


RTS_84DAD6:
    RTS                                                                  ;84DAD6;


RTS_84DAD7:
    RTS                                                                  ;84DAD7;


RTS_84DAD8:
    RTS                                                                  ;84DAD8;


RTS_84DAD9:
    RTS                                                                  ;84DAD9;


RTS_84DADA:
    RTS                                                                  ;84DADA;


RTS_84DADB:
    RTS                                                                  ;84DADB;


RTS_84DADC:
    RTS                                                                  ;84DADC;


RTS_84DADD:
    RTS                                                                  ;84DADD;


PreInst_PLM_SetMetroidsClearedStateWhenRequired_RoomArg12:
    LDA.W $0E50                                                          ;84DADE;
    CMP.W $0E52                                                          ;84DAE1;
    BCC .return                                                          ;84DAE4;
    LDA.W #$0010                                                         ;84DAE6;
    JSL.L MarkEvent_inA                                                  ;84DAE9;

.return:
    RTS                                                                  ;84DAED;


PreInst_PLM_SetMetroidsClearedStateWhenRequired_RoomArg14:
    LDA.W $0E50                                                          ;84DAEE;
    CMP.W $0E52                                                          ;84DAF1;
    BCC .return                                                          ;84DAF4;
    LDA.W #$0011                                                         ;84DAF6;
    JSL.L MarkEvent_inA                                                  ;84DAF9;

.return:
    RTS                                                                  ;84DAFD;


PreInst_PLM_SetMetroidsClearedStateWhenRequired_RoomArg16:
    LDA.W $0E50                                                          ;84DAFE;
    CMP.W $0E52                                                          ;84DB01;
    BCC .return                                                          ;84DB04;
    LDA.W #$0012                                                         ;84DB06;
    JSL.L MarkEvent_inA                                                  ;84DB09;

.return:
    RTS                                                                  ;84DB0D;


PreInst_PLM_SetMetroidsClearedStateWhenRequired_RoomArg18:
    LDA.W $0E50                                                          ;84DB0E;
    CMP.W $0E52                                                          ;84DB11;
    BCC .return                                                          ;84DB14;
    LDA.W #$0013                                                         ;84DB16;
    JSL.L MarkEvent_inA                                                  ;84DB19;

.return:
    RTS                                                                  ;84DB1D;


PreInstruction_PLM_SetsMetroidsClearedStatesWhenRequired:
    LDX.W $1DC7,Y                                                        ;84DB1E;
    LDA.W .pointers,X                                                    ;84DB21;
    STA.W $1CD7,Y                                                        ;84DB24;
    RTS                                                                  ;84DB27;


.pointers:
    dw RTS_84DAD5                                                        ;84DB28;
    dw RTS_84DAD6                                                        ;84DB2A;
    dw RTS_84DAD7                                                        ;84DB2C;
    dw RTS_84DAD8                                                        ;84DB2E;
    dw RTS_84DAD9                                                        ;84DB30;
    dw RTS_84DADA                                                        ;84DB32;
    dw RTS_84DADB                                                        ;84DB34;
    dw RTS_84DADC                                                        ;84DB36;
    dw RTS_84DADD                                                        ;84DB38;
    dw PreInst_PLM_SetMetroidsClearedStateWhenRequired_RoomArg12         ;84DB3A;
    dw PreInst_PLM_SetMetroidsClearedStateWhenRequired_RoomArg14         ;84DB3C;
    dw PreInst_PLM_SetMetroidsClearedStateWhenRequired_RoomArg16         ;84DB3E;
    dw PreInst_PLM_SetMetroidsClearedStateWhenRequired_RoomArg18         ;84DB40;

InstList_PLM_SetsMetroidsClearedStatesWhenRequired:
    dw Instruction_PLM_Sleep                                             ;84DB42;

PLMEntries_SetsMetroidsClearedStatesWhenRequired:
    dw PreInstruction_PLM_SetsMetroidsClearedStatesWhenRequired          ;84DB44;
    dw InstList_PLM_SetsMetroidsClearedStatesWhenRequired                ;84DB46;

PLMEntries_EyeDoorEyeFacingRight:
    dw Setup_EyeDoorEye                                                  ;84DB48;
    dw InstList_PLM_EyeDoorEyeFacingRight_0                              ;84DB4A;

PLMEntries_EyeDoorFacingRIght:
    dw Setup_EyeDoor                                                     ;84DB4C;
    dw InstList_PLM_EyeDoorFacingRight_0                                 ;84DB4E;
    dw InstList_PLM_Delete                                               ;84DB50;

PLMEntries_EyeDoorBottomFacingRight:
    dw Setup_EyeDoor                                                     ;84DB52;
    dw InstList_PLM_EyeDoorBottomFacingRight_0                           ;84DB54;

PLMEntries_EyeDoorEyeFacingLeft:
    dw Setup_EyeDoorEye                                                  ;84DB56;
    dw InstList_PLM_EyeDoorEyeFacingLeft_0                               ;84DB58;

PLMEntries_EyeDoorFacingLeft:
    dw Setup_EyeDoor                                                     ;84DB5A;
    dw InstList_PLM_EyeDoorFacingLeft_0                                  ;84DB5C;
    dw InstList_PLM_Delete                                               ;84DB5E;

PLMEntries_EyeDoorBottomFacingLeft:
    dw Setup_EyeDoor                                                     ;84DB60;
    dw InstList_PLM_EyeDoorBottomFacingLeft_0                            ;84DB62;

PreInst_PLM_GotoLinkInstructionIfShotWithAMissile_Draygon:
    LDA.W $1D77,X                                                        ;84DB64;
    AND.W #$0F00                                                         ;84DB67;
    CMP.W #$0200                                                         ;84DB6A;
    BEQ .super                                                           ;84DB6D;
    CMP.W #$0100                                                         ;84DB6F;
    BNE .return                                                          ;84DB72;

.missile:
    STZ.W $1D77,X                                                        ;84DB74;
    LDA.L $7EDEBC,X                                                      ;84DB77;
    STA.W $1D27,X                                                        ;84DB7B;
    LDA.W #$0001                                                         ;84DB7E;
    STA.L $7EDE1C,X                                                      ;84DB81;

.return:
    RTS                                                                  ;84DB85;


.super:
    LDA.W #$0077                                                         ;84DB86;
    STA.W $1DC7,X                                                        ;84DB89;
    BRA .missile                                                         ;84DB8C;


Instruction_PLM_DamageDraygonTurret:
    PHX                                                                  ;84DB8E;
    LDA.W $1E17,X                                                        ;84DB8F;
    TAX                                                                  ;84DB92;
    LDA.W #$0001                                                         ;84DB93;
    STA.L $7E0000,X                                                      ;84DB96;
    PLX                                                                  ;84DB9A;
    LDA.W $1C87,X                                                        ;84DB9B;
    TAX                                                                  ;84DB9E;
    LDA.W #$A003                                                         ;84DB9F;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DBA2;
    TXA                                                                  ;84DBA5;
    CLC                                                                  ;84DBA6;
    ADC.W $07A5                                                          ;84DBA7;
    ADC.W $07A5                                                          ;84DBAA;
    TAX                                                                  ;84DBAD;
    LDA.W #$A003                                                         ;84DBAE;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DBB1;
    LDX.W $1C27                                                          ;84DBB4;
    RTS                                                                  ;84DBB7;


Instruction_PLM_DamageDraygonTurretFacingDownRight:
    PHX                                                                  ;84DBB8;
    LDA.W $1E17,X                                                        ;84DBB9;
    TAX                                                                  ;84DBBC;
    LDA.W #$0001                                                         ;84DBBD;
    STA.L $7E0000,X                                                      ;84DBC0;
    PLX                                                                  ;84DBC4;
    LDA.W $1C87,X                                                        ;84DBC5;
    TAX                                                                  ;84DBC8;
    LDA.W #$A003                                                         ;84DBC9;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DBCC;
    INX                                                                  ;84DBCF;
    INX                                                                  ;84DBD0;
    LDA.W #$A003                                                         ;84DBD1;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DBD4;
    LDX.W $1C27                                                          ;84DBD7;
    LDA.W $1C87,X                                                        ;84DBDA;
    CLC                                                                  ;84DBDD;
    ADC.W $07A5                                                          ;84DBDE;
    ADC.W $07A5                                                          ;84DBE1;
    TAX                                                                  ;84DBE4;
    LDA.W #$A003                                                         ;84DBE5;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DBE8;
    INX                                                                  ;84DBEB;
    INX                                                                  ;84DBEC;
    LDA.W #$0000                                                         ;84DBED;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DBF0;
    LDX.W $1C27                                                          ;84DBF3;
    RTS                                                                  ;84DBF6;


Instruction_PLM_DamageDraygonTurretFacingUpRight:
    PHX                                                                  ;84DBF7;
    LDA.W $1E17,X                                                        ;84DBF8;
    TAX                                                                  ;84DBFB;
    LDA.W #$0001                                                         ;84DBFC;
    STA.L $7E0000,X                                                      ;84DBFF;
    PLX                                                                  ;84DC03;
    LDA.W $1C87,X                                                        ;84DC04;
    TAX                                                                  ;84DC07;
    LDA.W #$A003                                                         ;84DC08;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DC0B;
    INX                                                                  ;84DC0E;
    INX                                                                  ;84DC0F;
    LDA.W #$0000                                                         ;84DC10;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DC13;
    LDX.W $1C27                                                          ;84DC16;
    LDA.W $1C87,X                                                        ;84DC19;
    CLC                                                                  ;84DC1C;
    ADC.W $07A5                                                          ;84DC1D;
    ADC.W $07A5                                                          ;84DC20;
    TAX                                                                  ;84DC23;
    LDA.W #$A003                                                         ;84DC24;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DC27;
    INX                                                                  ;84DC2A;
    INX                                                                  ;84DC2B;
    LDA.W #$A003                                                         ;84DC2C;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DC2F;
    LDX.W $1C27                                                          ;84DC32;
    RTS                                                                  ;84DC35;


Instruction_PLM_DamageDraygonTurret_duplicate:
    PHX                                                                  ;84DC36;
    LDA.W $1E17,X                                                        ;84DC37;
    TAX                                                                  ;84DC3A;
    LDA.W #$0001                                                         ;84DC3B;
    STA.L $7E0000,X                                                      ;84DC3E;
    PLX                                                                  ;84DC42;
    LDA.W $1C87,X                                                        ;84DC43;
    TAX                                                                  ;84DC46;
    LDA.W #$A003                                                         ;84DC47;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DC4A;
    TXA                                                                  ;84DC4D;
    CLC                                                                  ;84DC4E;
    ADC.W $07A5                                                          ;84DC4F;
    ADC.W $07A5                                                          ;84DC52;
    TAX                                                                  ;84DC55;
    LDA.W #$A003                                                         ;84DC56;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DC59;
    LDX.W $1C27                                                          ;84DC5C;
    RTS                                                                  ;84DC5F;


Instruction_PLM_DamageDraygonTurretFacingDownLeft:
    PHX                                                                  ;84DC60;
    LDA.W $1E17,X                                                        ;84DC61;
    TAX                                                                  ;84DC64;
    LDA.W #$0001                                                         ;84DC65;
    STA.L $7E0000,X                                                      ;84DC68;
    PLX                                                                  ;84DC6C;
    LDA.W $1C87,X                                                        ;84DC6D;
    TAX                                                                  ;84DC70;
    LDA.W #$A003                                                         ;84DC71;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DC74;
    DEX                                                                  ;84DC77;
    DEX                                                                  ;84DC78;
    LDA.W #$A003                                                         ;84DC79;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DC7C;
    LDX.W $1C27                                                          ;84DC7F;
    LDA.W $1C87,X                                                        ;84DC82;
    CLC                                                                  ;84DC85;
    ADC.W $07A5                                                          ;84DC86;
    ADC.W $07A5                                                          ;84DC89;
    TAX                                                                  ;84DC8C;
    LDA.W #$A003                                                         ;84DC8D;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DC90;
    DEX                                                                  ;84DC93;
    DEX                                                                  ;84DC94;
    LDA.W #$0000                                                         ;84DC95;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DC98;
    LDX.W $1C27                                                          ;84DC9B;
    RTS                                                                  ;84DC9E;


Instruction_PLM_DamageDraygonTurretFacingUpLeft:
    PHX                                                                  ;84DC9F;
    LDA.W $1E17,X                                                        ;84DCA0;
    TAX                                                                  ;84DCA3;
    LDA.W #$0001                                                         ;84DCA4;
    STA.L $7E0000,X                                                      ;84DCA7;
    PLX                                                                  ;84DCAB;
    LDA.W $1C87,X                                                        ;84DCAC;
    TAX                                                                  ;84DCAF;
    LDA.W #$A003                                                         ;84DCB0;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DCB3;
    DEX                                                                  ;84DCB6;
    DEX                                                                  ;84DCB7;
    LDA.W #$0000                                                         ;84DCB8;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DCBB;
    LDX.W $1C27                                                          ;84DCBE;
    LDA.W $1C87,X                                                        ;84DCC1;
    CLC                                                                  ;84DCC4;
    ADC.W $07A5                                                          ;84DCC5;
    ADC.W $07A5                                                          ;84DCC8;
    TAX                                                                  ;84DCCB;
    LDA.W #$A003                                                         ;84DCCC;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DCCF;
    DEX                                                                  ;84DCD2;
    DEX                                                                  ;84DCD3;
    LDA.W #$A003                                                         ;84DCD4;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DCD7;
    LDX.W $1C27                                                          ;84DCDA;
    RTS                                                                  ;84DCDD;


InstList_PLM_DraygonCannonWithShieldFacingRight_0:
    dw Instruction_PLM_LinkInstruction_Y                                 ;84DCDE;
    dw InstList_PLM_DraygonCannonWithShieldFacingRight_2                 ;84DCE0;
    dw Instruction_PLM_PreInstruction_inY                                ;84DCE2;
    dw PreInst_PLM_GotoLinkInstructionIfShotWithAMissile_Draygon         ;84DCE4;

InstList_PLM_DraygonCannonWithShieldFacingRight_1:
    dw $0008                                                             ;84DCE6;
    dw DrawInst_DraygonCannonShieldRight_0                               ;84DCE8;
    dw Instruction_PLM_Sleep                                             ;84DCEA;
    dw Instruction_PLM_GotoY                                             ;84DCEC;
    dw InstList_PLM_DraygonCannonWithShieldFacingRight_1                 ;84DCEE;

InstList_PLM_DraygonCannonWithShieldFacingRight_2:
    dw Instruction_PLM_IncRoomArg_RoomArgFFFF_GotoY                      ;84DCF0;
    db $03                                                               ;84DCF2;
    dw InstList_PLM_DraygonCannonFacingRight_0                           ;84DCF3;
    dw $0003                                                             ;84DCF5;
    dw DrawInst_DraygonCannonShieldRight_0                               ;84DCF7;
    dw $0004                                                             ;84DCF9;
    dw DrawInst_DraygonCannonShieldRight_1                               ;84DCFB;
    dw $0003                                                             ;84DCFD;
    dw DrawInst_DraygonCannonShieldRight_0                               ;84DCFF;
    dw $0004                                                             ;84DD01;
    dw DrawInst_DraygonCannonShieldRight_1                               ;84DD03;
    dw $0003                                                             ;84DD05;
    dw DrawInst_DraygonCannonShieldRight_0                               ;84DD07;
    dw $0004                                                             ;84DD09;
    dw DrawInst_DraygonCannonShieldRight_1                               ;84DD0B;
    dw Instruction_PLM_GotoY                                             ;84DD0D;
    dw InstList_PLM_DraygonCannonWithShieldFacingRight_1                 ;84DD0F;

InstList_PLM_DraygonCannonFacingRight_0:
    dw Instruction_PLM_DamageDraygonTurret                               ;84DD11;

InstList_PLM_DraygonCannonFacingRight_1:
    dw $0006                                                             ;84DD13;
    dw DrawInst_DraygonCannonRight_0                                     ;84DD15;
    dw $0006                                                             ;84DD17;
    dw DrawInst_DraygonCannonRight_1                                     ;84DD19;
    dw $0006                                                             ;84DD1B;
    dw DrawInst_DraygonCannonRight_2                                     ;84DD1D;
    dw $0006                                                             ;84DD1F;
    dw DrawInst_DraygonCannonRight_3                                     ;84DD21;
    dw Instruction_PLM_GotoY                                             ;84DD23;
    dw InstList_PLM_DraygonCannonFacingRight_1                           ;84DD25;

InstList_PLM_DraygonCannonWithShieldFacingDownRight_0:
    dw Instruction_PLM_LinkInstruction_Y                                 ;84DD27;
    dw InstList_PLM_DraygonCannonWithShieldFacingDownRight_2             ;84DD29;
    dw Instruction_PLM_PreInstruction_inY                                ;84DD2B;
    dw PreInst_PLM_GotoLinkInstructionIfShotWithAMissile_Draygon         ;84DD2D;

InstList_PLM_DraygonCannonWithShieldFacingDownRight_1:
    dw $0008                                                             ;84DD2F;
    dw UNUSED_DrawInst_DraygonCannonShieldDownRight_0_849FED             ;84DD31;
    dw Instruction_PLM_Sleep                                             ;84DD33;
    dw Instruction_PLM_GotoY                                             ;84DD35;
    dw InstList_PLM_DraygonCannonWithShieldFacingDownRight_1             ;84DD37;

InstList_PLM_DraygonCannonWithShieldFacingDownRight_2:
    dw Instruction_PLM_IncRoomArg_RoomArgFFFF_GotoY                      ;84DD39;
    db $03                                                               ;84DD3B;
    dw UNUSED_InstList_PLM_DraygonCannonFacingDownRight_0                ;84DD3C;
    dw $0003                                                             ;84DD3E;
    dw UNUSED_DrawInst_DraygonCannonShieldDownRight_0_849FED             ;84DD40;
    dw $0004                                                             ;84DD42;
    dw UNUSED_DrawInst_DraygonCannonShieldDownRight_1_849FFD             ;84DD44;
    dw $0003                                                             ;84DD46;
    dw UNUSED_DrawInst_DraygonCannonShieldDownRight_0_849FED             ;84DD48;
    dw $0004                                                             ;84DD4A;
    dw UNUSED_DrawInst_DraygonCannonShieldDownRight_1_849FFD             ;84DD4C;
    dw $0003                                                             ;84DD4E;
    dw UNUSED_DrawInst_DraygonCannonShieldDownRight_0_849FED             ;84DD50;
    dw $0004                                                             ;84DD52;
    dw UNUSED_DrawInst_DraygonCannonShieldDownRight_1_849FFD             ;84DD54;
    dw Instruction_PLM_GotoY                                             ;84DD56;
    dw InstList_PLM_DraygonCannonWithShieldFacingDownRight_1             ;84DD58;

UNUSED_InstList_PLM_DraygonCannonFacingDownRight_0:
    dw Instruction_PLM_DamageDraygonTurretFacingDownRight                ;84DD5A;

UNUSED_InstList_PLM_DraygonCannonFacingDownRight_1:
    dw $0006                                                             ;84DD5C;
    dw UNUSED_DrawInst_DraygonCannonDownRight_0_84A06D                   ;84DD5E;
    dw $0006                                                             ;84DD60;
    dw UNUSED_DrawInst_DraygonCannonDownRight_1_84A07D                   ;84DD62;
    dw $0006                                                             ;84DD64;
    dw UNUSED_DrawInst_DraygonCannonDownRight_2_84A08D                   ;84DD66;
    dw $0006                                                             ;84DD68;
    dw UNUSED_DrawInst_DraygonCannonDownRight_3_84A09D                   ;84DD6A;
    dw Instruction_PLM_GotoY                                             ;84DD6C;
    dw UNUSED_InstList_PLM_DraygonCannonFacingDownRight_1                ;84DD6E;

UNUSED_InstList_DraygonCannonWithShieldFacingUpRight_84DD70:
    dw Instruction_PLM_LinkInstruction_Y                                 ;84DD70;
    dw UNUSED_InstList_DraygonCannonWithShieldFacingUpRight_84DD82       ;84DD72;
    dw Instruction_PLM_PreInstruction_inY                                ;84DD74;
    dw PreInst_PLM_GotoLinkInstructionIfShotWithAMissile_Draygon         ;84DD76;

UNUSED_InstList_DraygonCannonWithShieldFacingUpRight_84DD78:
    dw $0008                                                             ;84DD78;
    dw UNUSED_DrawInst_DraygonCannonShieldUpRight_0_84A00D               ;84DD7A;
    dw Instruction_PLM_Sleep                                             ;84DD7C;
    dw Instruction_PLM_GotoY                                             ;84DD7E;
    dw UNUSED_InstList_DraygonCannonWithShieldFacingUpRight_84DD78       ;84DD80;

UNUSED_InstList_DraygonCannonWithShieldFacingUpRight_84DD82:
    dw Instruction_PLM_IncRoomArg_RoomArgFFFF_GotoY                      ;84DD82;
    db $03                                                               ;84DD84;
    dw UNUSED_InstList_PLM_DraygonCannonFacingUpRight_84DDA3             ;84DD85;
    dw $0003                                                             ;84DD87;
    dw UNUSED_DrawInst_DraygonCannonShieldUpRight_0_84A00D               ;84DD89;
    dw $0004                                                             ;84DD8B;
    dw UNUSED_DrawInst_DraygonCannonShieldUpRight_1_84A01D               ;84DD8D;
    dw $0003                                                             ;84DD8F;
    dw UNUSED_DrawInst_DraygonCannonShieldUpRight_0_84A00D               ;84DD91;
    dw $0004                                                             ;84DD93;
    dw UNUSED_DrawInst_DraygonCannonShieldUpRight_1_84A01D               ;84DD95;
    dw $0003                                                             ;84DD97;
    dw UNUSED_DrawInst_DraygonCannonShieldUpRight_0_84A00D               ;84DD99;
    dw $0004                                                             ;84DD9B;
    dw UNUSED_DrawInst_DraygonCannonShieldUpRight_1_84A01D               ;84DD9D;
    dw Instruction_PLM_GotoY                                             ;84DD9F;
    dw UNUSED_InstList_DraygonCannonWithShieldFacingUpRight_84DD78       ;84DDA1;

UNUSED_InstList_PLM_DraygonCannonFacingUpRight_84DDA3:
    dw Instruction_PLM_DamageDraygonTurretFacingUpRight                  ;84DDA3;

UNUSED_InstList_PLM_DraygonCannonFacingUpRight_84DDA5:
    dw $0006                                                             ;84DDA5;
    dw UNUSED_DrawInst_DraygonCannonUpRight_0_84A0AD                     ;84DDA7;
    dw $0006                                                             ;84DDA9;
    dw UNUSED_DrawInst_DraygonCannonUpRight_1_84A0BD                     ;84DDAB;
    dw $0006                                                             ;84DDAD;
    dw UNUSED_DrawInst_DraygonCannonUpRight_2_84A0CD                     ;84DDAF;
    dw $0006                                                             ;84DDB1;
    dw UNUSED_DrawInst_DraygonCannonUpRight_3_84A0DD                     ;84DDB3;
    dw Instruction_PLM_GotoY                                             ;84DDB5;
    dw UNUSED_InstList_PLM_DraygonCannonFacingUpRight_84DDA5             ;84DDB7;

InstList_PLM_DraygonCannonWithShieldFacingLeft_0:
    dw Instruction_PLM_LinkInstruction_Y                                 ;84DDB9;
    dw InstList_PLM_DraygonCannonWithShieldFacingLeft_2                  ;84DDBB;
    dw Instruction_PLM_PreInstruction_inY                                ;84DDBD;
    dw PreInst_PLM_GotoLinkInstructionIfShotWithAMissile_Draygon         ;84DDBF;

InstList_PLM_DraygonCannonWithShieldFacingLeft_1:
    dw $0008                                                             ;84DDC1;
    dw DrawInst_DraygonCannonShieldLeft_0                                ;84DDC3;
    dw Instruction_PLM_Sleep                                             ;84DDC5;
    dw Instruction_PLM_GotoY                                             ;84DDC7;
    dw InstList_PLM_DraygonCannonWithShieldFacingLeft_1                  ;84DDC9;

InstList_PLM_DraygonCannonWithShieldFacingLeft_2:
    dw Instruction_PLM_IncRoomArg_RoomArgFFFF_GotoY                      ;84DDCB;
    db $03                                                               ;84DDCD;
    dw InstList_PLM_DraygonCannonFacingLeft_0                            ;84DDCE;
    dw $0003                                                             ;84DDD0;
    dw DrawInst_DraygonCannonShieldLeft_0                                ;84DDD2;
    dw $0004                                                             ;84DDD4;
    dw DrawInst_DraygonCannonShieldLeft_1                                ;84DDD6;
    dw $0003                                                             ;84DDD8;
    dw DrawInst_DraygonCannonShieldLeft_0                                ;84DDDA;
    dw $0004                                                             ;84DDDC;
    dw DrawInst_DraygonCannonShieldLeft_1                                ;84DDDE;
    dw $0003                                                             ;84DDE0;
    dw DrawInst_DraygonCannonShieldLeft_0                                ;84DDE2;
    dw $0004                                                             ;84DDE4;
    dw DrawInst_DraygonCannonShieldLeft_1                                ;84DDE6;
    dw Instruction_PLM_GotoY                                             ;84DDE8;
    dw InstList_PLM_DraygonCannonWithShieldFacingLeft_1                  ;84DDEA;

InstList_PLM_DraygonCannonFacingLeft_0:
    dw Instruction_PLM_DamageDraygonTurret_duplicate                     ;84DDEC;

InstList_PLM_DraygonCannonFacingLeft_1:
    dw $0006                                                             ;84DDEE;
    dw DrawInst_DraygonCannonLeft_0                                      ;84DDF0;
    dw $0006                                                             ;84DDF2;
    dw DrawInst_DraygonCannonLeft_1                                      ;84DDF4;
    dw $0006                                                             ;84DDF6;
    dw DrawInst_DraygonCannonLeft_2                                      ;84DDF8;
    dw $0006                                                             ;84DDFA;
    dw DrawInst_DraygonCannonLeft_3                                      ;84DDFC;
    dw Instruction_PLM_GotoY                                             ;84DDFE;
    dw InstList_PLM_DraygonCannonFacingLeft_1                            ;84DE00;

UNUSED_InstList_DraygonCannonWithShieldFacingDownLeft_84DE02:
    dw Instruction_PLM_LinkInstruction_Y                                 ;84DE02;
    dw UNUSED_InstList_DraygonCannonWithShieldFacingDownLeft_84DE14      ;84DE04;
    dw Instruction_PLM_PreInstruction_inY                                ;84DE06;
    dw PreInst_PLM_GotoLinkInstructionIfShotWithAMissile_Draygon         ;84DE08;

UNUSED_InstList_DraygonCannonWithShieldFacingDownLeft_84DE0A:
    dw $0008                                                             ;84DE0A;
    dw UNUSED_DrawInst_DraygonCannonShieldDownLeft_0_84A115              ;84DE0C;
    dw Instruction_PLM_Sleep                                             ;84DE0E;
    dw Instruction_PLM_GotoY                                             ;84DE10;
    dw UNUSED_InstList_DraygonCannonWithShieldFacingDownLeft_84DE0A      ;84DE12;

UNUSED_InstList_DraygonCannonWithShieldFacingDownLeft_84DE14:
    dw Instruction_PLM_IncRoomArg_RoomArgFFFF_GotoY                      ;84DE14;
    db $03                                                               ;84DE16;
    dw UNUSED_InstList_PLM_DraygonCannonFacingDownLeft_84DE35            ;84DE17;
    dw $0003                                                             ;84DE19;
    dw UNUSED_DrawInst_DraygonCannonShieldDownLeft_0_84A115              ;84DE1B;
    dw $0004                                                             ;84DE1D;
    dw UNUSED_DrawInst_DraygonCannonShieldDownLeft_1_84A129              ;84DE1F;
    dw $0003                                                             ;84DE21;
    dw UNUSED_DrawInst_DraygonCannonShieldDownLeft_0_84A115              ;84DE23;
    dw $0004                                                             ;84DE25;
    dw UNUSED_DrawInst_DraygonCannonShieldDownLeft_1_84A129              ;84DE27;
    dw $0003                                                             ;84DE29;
    dw UNUSED_DrawInst_DraygonCannonShieldDownLeft_0_84A115              ;84DE2B;
    dw $0004                                                             ;84DE2D;
    dw UNUSED_DrawInst_DraygonCannonShieldDownLeft_1_84A129              ;84DE2F;
    dw Instruction_PLM_GotoY                                             ;84DE31;
    dw UNUSED_InstList_DraygonCannonWithShieldFacingDownLeft_84DE0A      ;84DE33;

UNUSED_InstList_PLM_DraygonCannonFacingDownLeft_84DE35:
    dw Instruction_PLM_DamageDraygonTurretFacingDownLeft                 ;84DE35;

UNUSED_InstList_PLM_DraygonCannonFacingDownLeft_84DE37:
    dw $0006                                                             ;84DE37;
    dw UNUSED_DrawInst_DraygonCannonDownLeft_0_84A1B5                    ;84DE39;
    dw $0006                                                             ;84DE3B;
    dw UNUSED_DrawInst_DraygonCannonDownLeft_1_84A1C9                    ;84DE3D;
    dw $0006                                                             ;84DE3F;
    dw UNUSED_DrawInst_DraygonCannonDownLeft_2_84A1DD                    ;84DE41;
    dw $0006                                                             ;84DE43;
    dw UNUSED_DrawInst_DraygonCannonDownLeft_3_84A1F1                    ;84DE45;
    dw Instruction_PLM_GotoY                                             ;84DE47;
    dw UNUSED_InstList_PLM_DraygonCannonFacingDownLeft_84DE37            ;84DE49;

UNUSED_InstList_DraygonCannonWithShieldFacingUpLeft_84DE4B:
    dw Instruction_PLM_LinkInstruction_Y                                 ;84DE4B;
    dw UNUSED_InstList_DraygonCannonWithShieldFacingUpLeft_84DE5D        ;84DE4D;
    dw Instruction_PLM_PreInstruction_inY                                ;84DE4F;
    dw PreInst_PLM_GotoLinkInstructionIfShotWithAMissile_Draygon         ;84DE51;

UNUSED_InstList_DraygonCannonWithShieldFacingUpLeft_84DE53:
    dw $0008                                                             ;84DE53;
    dw UNUSED_DrawInst_DraygonCannonShieldUpLeft_0_84A13D                ;84DE55;
    dw Instruction_PLM_Sleep                                             ;84DE57;
    dw Instruction_PLM_GotoY                                             ;84DE59;
    dw UNUSED_InstList_DraygonCannonWithShieldFacingUpLeft_84DE53        ;84DE5B;

UNUSED_InstList_DraygonCannonWithShieldFacingUpLeft_84DE5D:
    dw Instruction_PLM_IncRoomArg_RoomArgFFFF_GotoY                      ;84DE5D;
    db $03                                                               ;84DE5F;
    dw UNUSED_InstList_PLM_DraygonCannonFacingUpLeft_84DE7E              ;84DE60;
    dw $0003                                                             ;84DE62;
    dw UNUSED_DrawInst_DraygonCannonShieldUpLeft_0_84A13D                ;84DE64;
    dw $0004                                                             ;84DE66;
    dw UNUSED_DrawInst_DraygonCannonShieldUpLeft_1_84A151                ;84DE68;
    dw $0003                                                             ;84DE6A;
    dw UNUSED_DrawInst_DraygonCannonShieldUpLeft_0_84A13D                ;84DE6C;
    dw $0004                                                             ;84DE6E;
    dw UNUSED_DrawInst_DraygonCannonShieldUpLeft_1_84A151                ;84DE70;
    dw $0003                                                             ;84DE72;
    dw UNUSED_DrawInst_DraygonCannonShieldUpLeft_0_84A13D                ;84DE74;
    dw $0004                                                             ;84DE76;
    dw UNUSED_DrawInst_DraygonCannonShieldUpLeft_1_84A151                ;84DE78;
    dw Instruction_PLM_GotoY                                             ;84DE7A;
    dw UNUSED_InstList_DraygonCannonWithShieldFacingUpLeft_84DE53        ;84DE7C;

UNUSED_InstList_PLM_DraygonCannonFacingUpLeft_84DE7E:
    dw Instruction_PLM_DamageDraygonTurretFacingUpLeft                   ;84DE7E;

UNUSED_InstList_PLM_DraygonCannonFacingUpLeft_84DE80:
    dw $0006                                                             ;84DE80;
    dw UNUSED_DrawInst_DraygonCannonUpLeft_0_84A205                      ;84DE82;
    dw $0006                                                             ;84DE84;
    dw UNUSED_DrawInst_DraygonCannonUpLeft_1_84A219                      ;84DE86;
    dw $0006                                                             ;84DE88;
    dw UNUSED_DrawInst_DraygonCannonUpLeft_2_84A22D                      ;84DE8A;
    dw $0006                                                             ;84DE8C;
    dw UNUSED_DrawInst_DraygonCannonUpLeft_3_84A241                      ;84DE8E;
    dw Instruction_PLM_GotoY                                             ;84DE90;
    dw UNUSED_InstList_PLM_DraygonCannonFacingUpLeft_84DE80              ;84DE92;

Setup_DraygonCannonWithShieldFacingRight:
    LDA.W $1DC7,Y                                                        ;84DE94;
    STA.W $1E17,Y                                                        ;84DE97;
    LDA.W #$0000                                                         ;84DE9A;
    STA.W $1DC7,Y                                                        ;84DE9D;
    LDX.W $1C87,Y                                                        ;84DEA0;
    LDA.W #$C044                                                         ;84DEA3;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DEA6;
    TXA                                                                  ;84DEA9;
    CLC                                                                  ;84DEAA;
    ADC.W $07A5                                                          ;84DEAB;
    ADC.W $07A5                                                          ;84DEAE;
    TAX                                                                  ;84DEB1;
    LDA.W #$D0FF                                                         ;84DEB2;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DEB5;
    RTS                                                                  ;84DEB8;


UNUSED_Setup_DraygonCannonWithShieldFacingDownUpRight_84DEB9:
    LDA.W $1DC7,Y                                                        ;84DEB9;
    STA.W $1E17,Y                                                        ;84DEBC;
    LDA.W #$0000                                                         ;84DEBF;
    STA.W $1DC7,Y                                                        ;84DEC2;
    LDX.W $1C87,Y                                                        ;84DEC5;
    LDA.W #$C044                                                         ;84DEC8;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DECB;
    INX                                                                  ;84DECE;
    INX                                                                  ;84DECF;
    LDA.W #$50FF                                                         ;84DED0;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DED3;
    LDA.W $1C87,Y                                                        ;84DED6;
    CLC                                                                  ;84DED9;
    ADC.W $07A5                                                          ;84DEDA;
    ADC.W $07A5                                                          ;84DEDD;
    TAX                                                                  ;84DEE0;
    LDA.W #$D0FF                                                         ;84DEE1;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DEE4;
    INX                                                                  ;84DEE7;
    INX                                                                  ;84DEE8;
    LDA.W #$D0FF                                                         ;84DEE9;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DEEC;
    RTS                                                                  ;84DEEF;


Setup_DraygonCannonWithShieldFacingLeft:
    LDA.W $1DC7,Y                                                        ;84DEF0;
    STA.W $1E17,Y                                                        ;84DEF3;
    LDA.W #$0000                                                         ;84DEF6;
    STA.W $1DC7,Y                                                        ;84DEF9;
    LDX.W $1C87,Y                                                        ;84DEFC;
    LDA.W #$C044                                                         ;84DEFF;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DF02;
    TXA                                                                  ;84DF05;
    CLC                                                                  ;84DF06;
    ADC.W $07A5                                                          ;84DF07;
    ADC.W $07A5                                                          ;84DF0A;
    TAX                                                                  ;84DF0D;
    LDA.W #$D0FF                                                         ;84DF0E;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DF11;
    RTS                                                                  ;84DF14;


UNUSED_Setup_DraygonCannonWithShieldFacingDownUpLeft_84DF15:
    LDA.W $1DC7,Y                                                        ;84DF15;
    STA.W $1E17,Y                                                        ;84DF18;
    LDA.W #$0000                                                         ;84DF1B;
    STA.W $1DC7,Y                                                        ;84DF1E;
    LDX.W $1C87,Y                                                        ;84DF21;
    LDA.W #$C044                                                         ;84DF24;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DF27;
    DEX                                                                  ;84DF2A;
    DEX                                                                  ;84DF2B;
    LDA.W #$5001                                                         ;84DF2C;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DF2F;
    LDA.W $1C87,Y                                                        ;84DF32;
    CLC                                                                  ;84DF35;
    ADC.W $07A5                                                          ;84DF36;
    ADC.W $07A5                                                          ;84DF39;
    TAX                                                                  ;84DF3C;
    LDA.W #$D0FF                                                         ;84DF3D;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DF40;
    DEX                                                                  ;84DF43;
    DEX                                                                  ;84DF44;
    LDA.W #$D0FF                                                         ;84DF45;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84DF48;
    RTS                                                                  ;84DF4B;


Setup_DraygonCannon:
    LDA.W $1DC7,Y                                                        ;84DF4C;
    STA.W $1E17,Y                                                        ;84DF4F;
    LDA.W #$0003                                                         ;84DF52;
    STA.W $1DC7,Y                                                        ;84DF55;
    RTS                                                                  ;84DF58;


PLMEntries_DraygonCannonWithShieldFacingRight:
    dw Setup_DraygonCannonWithShieldFacingRight                          ;84DF59;
    dw InstList_PLM_DraygonCannonWithShieldFacingRight_0                 ;84DF5B;

UNUSED_PLMEntries_DraygonCannonShieldFacingDownRight_84DF5D:
    dw UNUSED_Setup_DraygonCannonWithShieldFacingDownUpRight_84DEB9      ;84DF5D;
    dw InstList_PLM_DraygonCannonWithShieldFacingDownRight_0             ;84DF5F;

UNUSED_PLMEntries_DraygonCannonShieldFacingUpRight_84DF61:
    dw UNUSED_Setup_DraygonCannonWithShieldFacingDownUpRight_84DEB9      ;84DF61;
    dw UNUSED_InstList_DraygonCannonWithShieldFacingUpRight_84DD70       ;84DF63;

PLMEntries_DraygonCannonFacingRight:
    dw Setup_DraygonCannon                                               ;84DF65;
    dw InstList_PLM_DraygonCannonFacingRight_0                           ;84DF67;

UNUSED_PLMEntries_DraygonCannonFacingDownRight_84DF69:
    dw Setup_DraygonCannon                                               ;84DF69;
    dw UNUSED_InstList_PLM_DraygonCannonFacingDownRight_0                ;84DF6B;

UNUSED_PLMEntries_DraygonCannonFacingUpRight_84DF6D:
    dw Setup_DraygonCannon                                               ;84DF6D;
    dw UNUSED_InstList_PLM_DraygonCannonFacingUpRight_84DDA3             ;84DF6F;

PLMEntries_DraygonCannonWithShieldFacingLeft:
    dw Setup_DraygonCannonWithShieldFacingLeft                           ;84DF71;
    dw InstList_PLM_DraygonCannonWithShieldFacingLeft_0                  ;84DF73;

UNUSED_PLMEntries_DraygonCannonShieldFacingDownLeft_84DF75:
    dw UNUSED_Setup_DraygonCannonWithShieldFacingDownUpLeft_84DF15       ;84DF75;
    dw UNUSED_InstList_DraygonCannonWithShieldFacingDownLeft_84DE02      ;84DF77;

UNUSED_PLMEntries_DraygonCannonWithShieldFacingUpLeft_84DF79:
    dw UNUSED_Setup_DraygonCannonWithShieldFacingDownUpLeft_84DF15       ;84DF79;
    dw UNUSED_InstList_DraygonCannonWithShieldFacingUpLeft_84DE4B        ;84DF7B;

PLMEntries_DraygonCannonFacingLeft:
    dw Setup_DraygonCannon                                               ;84DF7D;
    dw InstList_PLM_DraygonCannonFacingLeft_0                            ;84DF7F;

UNUSED_PLMEntries_DraygonCannonFacingDownLeft_84DF81:
    dw Setup_DraygonCannon                                               ;84DF81;
    dw UNUSED_InstList_PLM_DraygonCannonFacingDownLeft_84DE35            ;84DF83;

UNUSED_PLMEntries_DraygonCannonFacingUpLeft_84DF85:
    dw Setup_DraygonCannon                                               ;84DF85;
    dw UNUSED_InstList_PLM_DraygonCannonFacingUpLeft_84DE7E              ;84DF87;

PreInstruction_PLM_GotoLinkInstructionIfTriggered:
    LDA.W $1D77,X                                                        ;84DF89;
    AND.W #$00FF                                                         ;84DF8C;
    CMP.W #$00FF                                                         ;84DF8F;
    BNE .return                                                          ;84DF92;
    LDA.W #.return                                                       ;84DF94;
    STA.W $1CD7,X                                                        ;84DF97;
    LDA.L $7EDEBC,X                                                      ;84DF9A;
    STA.W $1D27,X                                                        ;84DF9E;
    LDA.W #$0001                                                         ;84DFA1;
    STA.L $7EDE1C,X                                                      ;84DFA4;

.return:
    RTS                                                                  ;84DFA8;


InstList_PLM_EmptyItem:
    dw $0001                                                             ;84DFA9;
    dw DrawInst_ItemChozoOrb                                             ;84DFAB;
    dw Instruction_PLM_Delete                                            ;84DFAD;

InstList_PLM_ItemOrb_0:
    dw Instruction_PLM_PreInstruction_inY                                ;84DFAF;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84DFB1;

InstList_PLM_ItemOrb_1:
    dw $0014                                                             ;84DFB3;
    dw DrawInst_ItemOrb_0                                                ;84DFB5;
    dw $000A                                                             ;84DFB7;
    dw DrawInst_ItemOrb_1                                                ;84DFB9;
    dw $0014                                                             ;84DFBB;
    dw DrawInst_ItemOrb_2                                                ;84DFBD;
    dw $000A                                                             ;84DFBF;
    dw DrawInst_ItemOrb_1                                                ;84DFC1;
    dw Instruction_PLM_GotoY                                             ;84DFC3;
    dw InstList_PLM_ItemOrb_1                                            ;84DFC5;

InstList_PLM_Callable_ItemOrbBurst:
    dw Instruction_PLM_ClearPreInstruction                               ;84DFC7;
    dw $0003                                                             ;84DFC9;
    dw DrawInst_ItemChozoOrb                                             ;84DFCB;
    dw $0003                                                             ;84DFCD;
    dw DrawInst_ItemOrbBurst                                             ;84DFCF;
    dw $0003                                                             ;84DFD1;
    dw DrawInst_ItemChozoOrb                                             ;84DFD3;
    dw Instruction_PLM_Return                                            ;84DFD5;

InstList_PLM_Callable_EmptyItemOrb_0:
    dw Instruction_PLM_ClearPreInstruction                               ;84DFD7;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84DFD9;
    db $16                                                               ;84DFDB;

InstList_PLM_Callable_EmptyItemOrb_1:
    dw $0008                                                             ;84DFDC;
    dw DrawInst_ItemChozoOrb                                             ;84DFDE;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84DFE0;
    dw InstList_PLM_Callable_EmptyItemOrb_1                              ;84DFE2;
    dw Instruction_PLM_Return                                            ;84DFE4;

PreInstruction_PLM_WakePLMIfTriggered_WithDeadCodePBCheck:
    LDA.W $1D77,X                                                        ;84DFE6;
    CMP.W #$0300                                                         ;84DFE9;
    BEQ .return                                                          ;84DFEC;
    AND.W #$00FF                                                         ;84DFEE;
    CMP.W #$00FF                                                         ;84DFF1;
    BNE .return                                                          ;84DFF4;
    STZ.W $1D77,X                                                        ;84DFF6;
    INC.W $1D27,X                                                        ;84DFF9;
    INC.W $1D27,X                                                        ;84DFFC;
    LDA.W #$0001                                                         ;84DFFF;
    STA.L $7EDE1C,X                                                      ;84E002;

.return:
    RTS                                                                  ;84E006;


InstList_PLM_Callable_ItemShotBlock:
    dw Instruction_PLM_PreInstruction_inY                                ;84E007;
    dw PreInstruction_PLM_WakePLMIfTriggered_WithDeadCodePBCheck         ;84E009;
    dw Instruction_PLM_Sleep                                             ;84E00B;
    dw Instruction_PLM_ClearPreInstruction                               ;84E00D;
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6                            ;84E00F;
    db $0A                                                               ;84E011;
    dw $0004                                                             ;84E012;
    dw DrawInst_ItemShotBlock_0                                          ;84E014;
    dw $0004                                                             ;84E016;
    dw DrawInst_ItemShotBlock_1                                          ;84E018;
    dw $0004                                                             ;84E01A;
    dw DrawInst_ItemShotBlock_2                                          ;84E01C;
    dw Instruction_PLM_Return                                            ;84E01E;

InstList_PLM_Callable_ItemShotBlockReconcealing:
    dw Instruction_PLM_ClearPreInstruction                               ;84E020;
    dw $0004                                                             ;84E022;
    dw DrawInst_ItemShotBlock_2                                          ;84E024;
    dw $0004                                                             ;84E026;
    dw DrawInst_ItemShotBlock_1                                          ;84E028;
    dw $0004                                                             ;84E02A;
    dw DrawInst_ItemShotBlock_0                                          ;84E02C;
    dw Instruction_PLM_DrawPLMBlock_Clone                                ;84E02E;
    dw Instruction_PLM_Return                                            ;84E030;

InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0:
    dw Instruction_PLM_ClearPreInstruction                               ;84E032;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E034;
    db $16                                                               ;84E036;

InstList_PLM_Callable_EmptyItemShotBlockReconcealing_1:
    dw $0008                                                             ;84E037;
    dw DrawInst_ItemChozoOrb                                             ;84E039;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84E03B;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_1            ;84E03D;
    dw $0004                                                             ;84E03F;
    dw DrawInst_Respawn1x1_2                                             ;84E041;
    dw $0004                                                             ;84E043;
    dw DrawInst_Respawn1x1_1                                             ;84E045;
    dw $0004                                                             ;84E047;
    dw DrawInst_Respawn1x1_0                                             ;84E049;
    dw Instruction_PLM_DrawPLMBlock_Clone                                ;84E04B;
    dw Instruction_PLM_Return                                            ;84E04D;

Instruction_PLM_DrawItemFrame0:
    PHY                                                                  ;84E04F;
    LDA.L $7EDF0C,X                                                      ;84E050;
    TAY                                                                  ;84E054;
    LDA.W .drawInsts,Y                                                   ;84E055;
    STA.L $7EDE6C,X                                                      ;84E058;
    PLY                                                                  ;84E05C;
    BRA DrawPLM_Wait4Frames                                              ;84E05D;


.drawInsts:
    dw DrawInst_DrawItemFrame0_0                                         ;84E05F;
    dw DrawInst_DrawItemFrame0_1                                         ;84E061;
    dw DrawInst_DrawItemFrame0_2                                         ;84E063;
    dw DrawInst_DrawItemFrame0_3                                         ;84E065;

Instruction_PLM_DrawItemFrame1:
    PHY                                                                  ;84E067;
    LDA.L $7EDF0C,X                                                      ;84E068;
    TAY                                                                  ;84E06C;
    LDA.W .drawInsts,Y                                                   ;84E06D;
    STA.L $7EDE6C,X                                                      ;84E070;
    PLY                                                                  ;84E074;
    BRA DrawPLM_Wait4Frames                                              ;84E075;


.drawInsts:
    dw DrawInst_DrawItemFrame1_0                                         ;84E077;
    dw DrawInst_DrawItemFrame1_1                                         ;84E079;
    dw DrawInst_DrawItemFrame1_2                                         ;84E07B;
    dw DrawInst_DrawItemFrame1_3                                         ;84E07D;

DrawPLM_Wait4Frames:
    LDA.W #$0004                                                         ;84E07F;
    STA.L $7EDE1C,X                                                      ;84E082;
    TYA                                                                  ;84E086;
    STA.W $1D27,X                                                        ;84E087;
    JSR.W Process_PLM_Draw_Instruction                                   ;84E08A;
    LDX.W $1C27                                                          ;84E08D;
    JSL.L Calculate_PLM_Block_Coordinates                                ;84E090;
    JSR.W DrawPLM_HardCoded                                              ;84E094;
    PLA                                                                  ;84E097;
    RTS                                                                  ;84E098;


InstList_PLM_EnergyTank_0:
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E099;
    dw InstList_PLM_EnergyTank_3                                         ;84E09B;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E09D;
    dw InstList_PLM_EnergyTank_2                                         ;84E09F;
    dw Instruction_PLM_PreInstruction_inY                                ;84E0A1;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E0A3;

InstList_PLM_EnergyTank_1:
    dw $0004                                                             ;84E0A5;
    dw DrawInst_EnergyTank_0                                             ;84E0A7;
    dw $0004                                                             ;84E0A9;
    dw DrawInst_EnergyTank_1                                             ;84E0AB;
    dw Instruction_PLM_GotoY                                             ;84E0AD;
    dw InstList_PLM_EnergyTank_1                                         ;84E0AF;

InstList_PLM_EnergyTank_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E0B1;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E0B3;
    db $02                                                               ;84E0B5;
    dw Instruction_PLM_CollectHealth_EnergyTank                          ;84E0B6;
    dw $0064                                                             ;84E0B8;

InstList_PLM_EnergyTank_3:
    dw Instruction_PLM_GotoY                                             ;84E0BA;
    dw InstList_PLM_EmptyItem                                            ;84E0BC;

InstList_PLM_MissileTank_0:
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E0BE;
    dw InstList_PLM_MissileTank_3                                        ;84E0C0;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E0C2;
    dw InstList_PLM_MissileTank_2                                        ;84E0C4;
    dw Instruction_PLM_PreInstruction_inY                                ;84E0C6;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E0C8;

InstList_PLM_MissileTank_1:
    dw $0004                                                             ;84E0CA;
    dw DrawInst_MissileTank_0                                            ;84E0CC;
    dw $0004                                                             ;84E0CE;
    dw DrawInst_MissileTank_1                                            ;84E0D0;
    dw Instruction_PLM_GotoY                                             ;84E0D2;
    dw InstList_PLM_MissileTank_1                                        ;84E0D4;

InstList_PLM_MissileTank_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E0D6;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E0D8;
    db $02                                                               ;84E0DA;
    dw Instruction_PLM_CollectAmmo_MissileTank                           ;84E0DB;
    dw $0005                                                             ;84E0DD;

InstList_PLM_MissileTank_3:
    dw Instruction_PLM_GotoY                                             ;84E0DF;
    dw InstList_PLM_EmptyItem                                            ;84E0E1;

InstList_PLM_SuperMissileTank_0:
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E0E3;
    dw InstList_PLM_SuperMissileTank_3                                   ;84E0E5;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E0E7;
    dw InstList_PLM_SuperMissileTank_2                                   ;84E0E9;
    dw Instruction_PLM_PreInstruction_inY                                ;84E0EB;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E0ED;

InstList_PLM_SuperMissileTank_1:
    dw $0004                                                             ;84E0EF;
    dw DrawInst_SuperMissileTank_0                                       ;84E0F1;
    dw $0004                                                             ;84E0F3;
    dw DrawInst_SuperMissileTank_1                                       ;84E0F5;
    dw Instruction_PLM_GotoY                                             ;84E0F7;
    dw InstList_PLM_SuperMissileTank_1                                   ;84E0F9;

InstList_PLM_SuperMissileTank_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E0FB;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E0FD;
    db $02                                                               ;84E0FF;
    dw Instruction_PLM_CollectAmmo_SuperMissileTank                      ;84E100;
    dw $0005                                                             ;84E102;

InstList_PLM_SuperMissileTank_3:
    dw Instruction_PLM_GotoY                                             ;84E104;
    dw InstList_PLM_EmptyItem                                            ;84E106;

InstList_PLM_PowerBombTank_0:
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E108;
    dw InstList_PLM_PowerBombTank_3                                      ;84E10A;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E10C;
    dw InstList_PLM_PowerBombTank_2                                      ;84E10E;
    dw Instruction_PLM_PreInstruction_inY                                ;84E110;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E112;

InstList_PLM_PowerBombTank_1:
    dw $0004                                                             ;84E114;
    dw DrawInst_PowerBombTank_0                                          ;84E116;
    dw $0004                                                             ;84E118;
    dw DrawInst_PowerBombTank_1                                          ;84E11A;
    dw Instruction_PLM_GotoY                                             ;84E11C;
    dw InstList_PLM_PowerBombTank_1                                      ;84E11E;

InstList_PLM_PowerBombTank_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E120;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E122;
    db $02                                                               ;84E124;
    dw Instruction_PLM_CollectAmmo_PowerBombTank                         ;84E125;
    dw $0005                                                             ;84E127;

InstList_PLM_PowerBombTank_3:
    dw Instruction_PLM_GotoY                                             ;84E129;
    dw InstList_PLM_EmptyItem                                            ;84E12B;

InstList_PLM_Bombs_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E12D;
    dw ItemPLMGFX_Bombs                                                  ;84E12F;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E131;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E139;
    dw InstList_PLM_Bombs_3                                              ;84E13B;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E13D;
    dw InstList_PLM_Bombs_2                                              ;84E13F;
    dw Instruction_PLM_PreInstruction_inY                                ;84E141;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E143;

InstList_PLM_Bombs_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E145;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E147;
    dw Instruction_PLM_GotoY                                             ;84E149;
    dw InstList_PLM_Bombs_1                                              ;84E14B;

InstList_PLM_Bombs_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E14D;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E14F;
    db $02                                                               ;84E151;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84E152;
    dw $1000                                                             ;84E154;
    db $13                                                               ;84E156;

InstList_PLM_Bombs_3:
    dw Instruction_PLM_GotoY                                             ;84E157;
    dw InstList_PLM_EmptyItem                                            ;84E159;

InstList_PLM_ChargeBeam_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E15B;
    dw ItemPLMGFX_ChargeBeam                                             ;84E15D;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E15F;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E167;
    dw InstList_PLM_ChargeBeam_3                                         ;84E169;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E16B;
    dw InstList_PLM_ChargeBeam_2                                         ;84E16D;
    dw Instruction_PLM_PreInstruction_inY                                ;84E16F;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E171;

InstList_PLM_ChargeBeam_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E173;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E175;
    dw Instruction_PLM_GotoY                                             ;84E177;
    dw InstList_PLM_ChargeBeam_1                                         ;84E179;

InstList_PLM_ChargeBeam_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E17B;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E17D;
    db $02                                                               ;84E17F;
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox                      ;84E180;
    dw $1000                                                             ;84E182;
    db $0E                                                               ;84E184;

InstList_PLM_ChargeBeam_3:
    dw Instruction_PLM_GotoY                                             ;84E185;
    dw InstList_PLM_EmptyItem                                            ;84E187;

InstList_PLM_IceBeam_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E189;
    dw ItemPLMGFX_IceBeam                                                ;84E18B;
    db $00,$03,$00,$00,$00,$03,$00,$00                                   ;84E18D;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E195;
    dw InstList_PLM_IceBeam_3                                            ;84E197;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E199;
    dw InstList_PLM_IceBeam_2                                            ;84E19B;
    dw Instruction_PLM_PreInstruction_inY                                ;84E19D;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E19F;

InstList_PLM_IceBeam_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E1A1;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E1A3;
    dw Instruction_PLM_GotoY                                             ;84E1A5;
    dw InstList_PLM_IceBeam_1                                            ;84E1A7;

InstList_PLM_IceBeam_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E1A9;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E1AB;
    db $02                                                               ;84E1AD;
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox                      ;84E1AE;
    dw $0002                                                             ;84E1B0;
    db $0F                                                               ;84E1B2;

InstList_PLM_IceBeam_3:
    dw Instruction_PLM_GotoY                                             ;84E1B3;
    dw InstList_PLM_EmptyItem                                            ;84E1B5;

InstList_PLM_HiJumpBoots_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E1B7;
    dw ItemPLMGFX_HiJumpBoots                                            ;84E1B9;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E1BB;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E1C3;
    dw InstList_PLM_HiJumpBoots_3                                        ;84E1C5;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E1C7;
    dw InstList_PLM_HiJumpBoots_2                                        ;84E1C9;
    dw Instruction_PLM_PreInstruction_inY                                ;84E1CB;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E1CD;

InstList_PLM_HiJumpBoots_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E1CF;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E1D1;
    dw Instruction_PLM_GotoY                                             ;84E1D3;
    dw InstList_PLM_HiJumpBoots_1                                        ;84E1D5;

InstList_PLM_HiJumpBoots_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E1D7;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E1D9;
    db $02                                                               ;84E1DB;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84E1DC;
    dw $0100                                                             ;84E1DE;
    db $0B                                                               ;84E1E0;

InstList_PLM_HiJumpBoots_3:
    dw Instruction_PLM_GotoY                                             ;84E1E1;
    dw InstList_PLM_EmptyItem                                            ;84E1E3;

InstList_PLM_SpeedBooster_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E1E5;
    dw ItemPLMGFX_SpeedBooster                                           ;84E1E7;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E1E9;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E1F1;
    dw InstList_PLM_SpeedBooster_3                                       ;84E1F3;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E1F5;
    dw InstList_PLM_SpeedBooster_2                                       ;84E1F7;
    dw Instruction_PLM_PreInstruction_inY                                ;84E1F9;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E1FB;

InstList_PLM_SpeedBooster_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E1FD;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E1FF;
    dw Instruction_PLM_GotoY                                             ;84E201;
    dw InstList_PLM_SpeedBooster_1                                       ;84E203;

InstList_PLM_SpeedBooster_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E205;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E207;
    db $02                                                               ;84E209;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84E20A;
    dw $2000                                                             ;84E20C;
    db $0D                                                               ;84E20E;

InstList_PLM_SpeedBooster_3:
    dw Instruction_PLM_GotoY                                             ;84E20F;
    dw InstList_PLM_EmptyItem                                            ;84E211;

InstList_PLM_WaveBeam_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E213;
    dw ItemPLMGFX_WaveBeam                                               ;84E215;
    db $00,$02,$00,$00,$00,$02,$00,$00                                   ;84E217;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E21F;
    dw InstList_PLM_WaveBeam_3                                           ;84E221;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E223;
    dw InstList_PLM_WaveBeam_2                                           ;84E225;
    dw Instruction_PLM_PreInstruction_inY                                ;84E227;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E229;

InstList_PLM_WaveBeam_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E22B;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E22D;
    dw Instruction_PLM_GotoY                                             ;84E22F;
    dw InstList_PLM_WaveBeam_1                                           ;84E231;

InstList_PLM_WaveBeam_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E233;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E235;
    db $02                                                               ;84E237;
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox                      ;84E238;
    dw $0001                                                             ;84E23A;
    db $10                                                               ;84E23C;

InstList_PLM_WaveBeam_3:
    dw Instruction_PLM_GotoY                                             ;84E23D;
    dw InstList_PLM_EmptyItem                                            ;84E23F;

InstList_PLM_Spazer_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E241;
    dw ItemPLMGFX_Spazer                                                 ;84E243;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E245;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E24D;
    dw InstList_PLM_Spazer_3                                             ;84E24F;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E251;
    dw InstList_PLM_Spazer_2                                             ;84E253;
    dw Instruction_PLM_PreInstruction_inY                                ;84E255;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E257;

InstList_PLM_Spazer_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E259;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E25B;
    dw Instruction_PLM_GotoY                                             ;84E25D;
    dw InstList_PLM_Spazer_1                                             ;84E25F;

InstList_PLM_Spazer_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E261;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E263;
    db $02                                                               ;84E265;
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox                      ;84E266;
    dw $0004                                                             ;84E268;
    db $11                                                               ;84E26A;

InstList_PLM_Spazer_3:
    dw Instruction_PLM_GotoY                                             ;84E26B;
    dw InstList_PLM_EmptyItem                                            ;84E26D;

InstList_PLM_SpringBall_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E26F;
    dw ItemPLMGFX_SpringBall                                             ;84E271;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E273;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E27B;
    dw InstList_PLM_SpringBall_3                                         ;84E27D;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E27F;
    dw InstList_PLM_SpringBall_2                                         ;84E281;
    dw Instruction_PLM_PreInstruction_inY                                ;84E283;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E285;

InstList_PLM_SpringBall_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E287;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E289;
    dw Instruction_PLM_GotoY                                             ;84E28B;
    dw InstList_PLM_SpringBall_1                                         ;84E28D;

InstList_PLM_SpringBall_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E28F;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E291;
    db $02                                                               ;84E293;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84E294;
    dw $0002                                                             ;84E296;
    db $08                                                               ;84E298;

InstList_PLM_SpringBall_3:
    dw Instruction_PLM_GotoY                                             ;84E299;
    dw InstList_PLM_EmptyItem                                            ;84E29B;

Instruction_PLM_ClearChargeBeamCounter:
    STZ.W $0CD0                                                          ;84E29D;
    RTS                                                                  ;84E2A0;


InstList_PLM_VariaSuit_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E2A1;
    dw ItemPLMGFX_VariaSuit                                              ;84E2A3;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E2A5;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E2AD;
    dw InstList_PLM_VariaSuit_3                                          ;84E2AF;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E2B1;
    dw InstList_PLM_VariaSuit_2                                          ;84E2B3;
    dw Instruction_PLM_PreInstruction_inY                                ;84E2B5;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E2B7;

InstList_PLM_VariaSuit_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E2B9;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E2BB;
    dw Instruction_PLM_GotoY                                             ;84E2BD;
    dw InstList_PLM_VariaSuit_1                                          ;84E2BF;

InstList_PLM_VariaSuit_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E2C1;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E2C3;
    db $02                                                               ;84E2C5;
    dw Instruction_PLM_ClearChargeBeamCounter                            ;84E2C6;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84E2C8;
    dw $0001                                                             ;84E2CA;
    db $07                                                               ;84E2CC;
    dw Instruction_PLM_CallFunctionInY                                   ;84E2CD;
    dl VariaSuit_Pickup                                                  ;84E2CF;

InstList_PLM_VariaSuit_3:
    dw Instruction_PLM_GotoY                                             ;84E2D2;
    dw InstList_PLM_EmptyItem                                            ;84E2D4;

InstList_PLM_GravitySuit_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E2D6;
    dw ItemPLMGFX_GravitySuit                                            ;84E2D8;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E2DA;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E2E2;
    dw InstList_PLM_GravitySuit_3                                        ;84E2E4;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E2E6;
    dw InstList_PLM_GravitySuit_2                                        ;84E2E8;
    dw Instruction_PLM_PreInstruction_inY                                ;84E2EA;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E2EC;

InstList_PLM_GravitySuit_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E2EE;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E2F0;
    dw Instruction_PLM_GotoY                                             ;84E2F2;
    dw InstList_PLM_GravitySuit_1                                        ;84E2F4;

InstList_PLM_GravitySuit_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E2F6;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E2F8;
    db $02                                                               ;84E2FA;
    dw Instruction_PLM_ClearChargeBeamCounter                            ;84E2FB;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84E2FD;
    dw $0020                                                             ;84E2FF;
    db $1A                                                               ;84E301;
    dw Instruction_PLM_CallFunctionInY                                   ;84E302;
    dl GravitySuit_Pickup                                                ;84E304;

InstList_PLM_GravitySuit_3:
    dw Instruction_PLM_GotoY                                             ;84E307;
    dw InstList_PLM_EmptyItem                                            ;84E309;

InstList_PLM_XrayScope_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E30B;
    dw ItemPLMGFX_XrayScope                                              ;84E30D;
    db $01,$01,$00,$00,$03,$03,$00,$00                                   ;84E30F;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E317;
    dw InstList_PLM_XrayScope_3                                          ;84E319;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E31B;
    dw InstList_PLM_XrayScope_2                                          ;84E31D;
    dw Instruction_PLM_PreInstruction_inY                                ;84E31F;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E321;

InstList_PLM_XrayScope_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E323;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E325;
    dw Instruction_PLM_GotoY                                             ;84E327;
    dw InstList_PLM_XrayScope_1                                          ;84E329;

InstList_PLM_XrayScope_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E32B;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E32D;
    db $02                                                               ;84E32F;
    dw Inst_PLM_PickUpEquipment_AddXrayToHUD_DisplayMessageBox           ;84E330;
    dw $8000                                                             ;84E332;

InstList_PLM_XrayScope_3:
    dw Instruction_PLM_GotoY                                             ;84E334;
    dw InstList_PLM_EmptyItem                                            ;84E336;

InstList_PLM_PlasmaBeam_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E338;
    dw ItemPLMGFX_PlasmaBeam                                             ;84E33A;
    db $00,$01,$00,$00,$00,$01,$00,$00                                   ;84E33C;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E344;
    dw InstList_PLM_PlasmaBeam_3                                         ;84E346;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E348;
    dw InstList_PLM_PlasmaBeam_2                                         ;84E34A;
    dw Instruction_PLM_PreInstruction_inY                                ;84E34C;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E34E;

InstList_PLM_PlasmaBeam_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E350;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E352;
    dw Instruction_PLM_GotoY                                             ;84E354;
    dw InstList_PLM_PlasmaBeam_1                                         ;84E356;

InstList_PLM_PlasmaBeam_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E358;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E35A;
    db $02                                                               ;84E35C;
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox                      ;84E35D;
    dw $0008                                                             ;84E35F;
    db $12                                                               ;84E361;

InstList_PLM_PlasmaBeam_3:
    dw Instruction_PLM_GotoY                                             ;84E362;
    dw InstList_PLM_EmptyItem                                            ;84E364;

InstList_PLM_GrappleBeam_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E366;
    dw ItemPLMGFX_GrappleBeam                                            ;84E368;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E36A;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E372;
    dw InstList_PLM_GrappleBeam_3                                        ;84E374;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E376;
    dw InstList_PLM_GrappleBeam_2                                        ;84E378;
    dw Instruction_PLM_PreInstruction_inY                                ;84E37A;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E37C;

InstList_PLM_GrappleBeam_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E37E;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E380;
    dw Instruction_PLM_GotoY                                             ;84E382;
    dw InstList_PLM_GrappleBeam_1                                        ;84E384;

InstList_PLM_GrappleBeam_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E386;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E388;
    db $02                                                               ;84E38A;
    dw Inst_PLM_PickUpEquipment_AddGrappleHUD_DisplayMessageBox          ;84E38B;
    dw $4000                                                             ;84E38D;

InstList_PLM_GrappleBeam_3:
    dw Instruction_PLM_GotoY                                             ;84E38F;
    dw InstList_PLM_EmptyItem                                            ;84E391;

InstList_PLM_SpaceJump_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E393;
    dw ItemPLMGFX_SpaceJump                                              ;84E395;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E397;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E39F;
    dw InstList_PLM_SpaceJump_3                                          ;84E3A1;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E3A3;
    dw InstList_PLM_SpaceJump_2                                          ;84E3A5;
    dw Instruction_PLM_PreInstruction_inY                                ;84E3A7;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E3A9;

InstList_PLM_SpaceJump_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E3AB;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E3AD;
    dw Instruction_PLM_GotoY                                             ;84E3AF;
    dw InstList_PLM_SpaceJump_1                                          ;84E3B1;

InstList_PLM_SpaceJump_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E3B3;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E3B5;
    db $02                                                               ;84E3B7;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84E3B8;
    dw $0200                                                             ;84E3BA;
    db $0C                                                               ;84E3BC;

InstList_PLM_SpaceJump_3:
    dw Instruction_PLM_GotoY                                             ;84E3BD;
    dw InstList_PLM_EmptyItem                                            ;84E3BF;

InstList_PLM_ScrewAttack_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E3C1;
    dw ItemPLMGFX_ScrewAttack                                            ;84E3C3;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E3C5;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E3CD;
    dw InstList_PLM_ScrewAttack_3                                        ;84E3CF;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E3D1;
    dw InstList_PLM_ScrewAttack_2                                        ;84E3D3;
    dw Instruction_PLM_PreInstruction_inY                                ;84E3D5;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E3D7;

InstList_PLM_ScrewAttack_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E3D9;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E3DB;
    dw Instruction_PLM_GotoY                                             ;84E3DD;
    dw InstList_PLM_ScrewAttack_1                                        ;84E3DF;

InstList_PLM_ScrewAttack_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E3E1;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E3E3;
    db $02                                                               ;84E3E5;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84E3E6;
    dw $0008                                                             ;84E3E8;
    db $0A                                                               ;84E3EA;

InstList_PLM_ScrewAttack_3:
    dw Instruction_PLM_GotoY                                             ;84E3EB;
    dw InstList_PLM_EmptyItem                                            ;84E3ED;

InstList_PLM_MorphBall_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E3EF;
    dw ItemPLMGFX_MorphBall                                              ;84E3F1;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E3F3;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E3FB;
    dw InstList_PLM_MorphBall_3                                          ;84E3FD;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E3FF;
    dw InstList_PLM_MorphBall_2                                          ;84E401;
    dw Instruction_PLM_PreInstruction_inY                                ;84E403;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E405;

InstList_PLM_MorphBall_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E407;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E409;
    dw Instruction_PLM_GotoY                                             ;84E40B;
    dw InstList_PLM_MorphBall_1                                          ;84E40D;

InstList_PLM_MorphBall_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E40F;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E411;
    db $02                                                               ;84E413;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84E414;
    dw $0004                                                             ;84E416;
    db $09                                                               ;84E418;

InstList_PLM_MorphBall_3:
    dw Instruction_PLM_GotoY                                             ;84E419;
    dw InstList_PLM_EmptyItem                                            ;84E41B;

InstList_PLM_ReserveTank_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E41D;
    dw ItemPLMGFX_ReserveTank                                            ;84E41F;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E421;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E429;
    dw InstList_PLM_ReserveTank_3                                        ;84E42B;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E42D;
    dw InstList_PLM_ReserveTank_2                                        ;84E42F;
    dw Instruction_PLM_PreInstruction_inY                                ;84E431;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E433;

InstList_PLM_ReserveTank_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E435;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E437;
    dw Instruction_PLM_GotoY                                             ;84E439;
    dw InstList_PLM_ReserveTank_1                                        ;84E43B;

InstList_PLM_ReserveTank_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E43D;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E43F;
    db $02                                                               ;84E441;
    dw Instruction_PLM_CollectHealth_ReserveTank                         ;84E442;
    dw $0064                                                             ;84E444;

InstList_PLM_ReserveTank_3:
    dw Instruction_PLM_GotoY                                             ;84E446;
    dw InstList_PLM_EmptyItem                                            ;84E448;

InstList_PLM_EnergyTankChozoOrb_0:
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E44A;
    dw InstList_PLM_EnergyTankChozoOrb_3                                 ;84E44C;
    dw Instruction_PLM_Call_Y                                            ;84E44E;
    dw InstList_PLM_ItemOrb_0                                            ;84E450;
    dw Instruction_PLM_Call_Y                                            ;84E452;
    dw InstList_PLM_Callable_ItemOrbBurst                                ;84E454;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E456;
    dw InstList_PLM_EnergyTankChozoOrb_2                                 ;84E458;
    dw Instruction_PLM_PreInstruction_inY                                ;84E45A;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E45C;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E45E;
    db $16                                                               ;84E460;

InstList_PLM_EnergyTankChozoOrb_1:
    dw $0004                                                             ;84E461;
    dw DrawInst_EnergyTank_0                                             ;84E463;
    dw $0004                                                             ;84E465;
    dw DrawInst_EnergyTank_1                                             ;84E467;
    dw Instruction_PLM_GotoY                                             ;84E469;
    dw InstList_PLM_EnergyTankChozoOrb_1                                 ;84E46B;

InstList_PLM_EnergyTankChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E46D;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E46F;
    db $02                                                               ;84E471;
    dw Instruction_PLM_CollectHealth_EnergyTank                          ;84E472;
    dw $0064                                                             ;84E474;

InstList_PLM_EnergyTankChozoOrb_3:
    dw $0001                                                             ;84E476;
    dw DrawInst_ItemChozoOrb                                             ;84E478;
    dw Instruction_PLM_Delete                                            ;84E47A;

InstList_PLM_MissileTankChozoOrb_0:
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E47C;
    dw InstList_PLM_MissileTankChozoOrb_3                                ;84E47E;
    dw Instruction_PLM_Call_Y                                            ;84E480;
    dw InstList_PLM_ItemOrb_0                                            ;84E482;
    dw Instruction_PLM_Call_Y                                            ;84E484;
    dw InstList_PLM_Callable_ItemOrbBurst                                ;84E486;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E488;
    dw InstList_PLM_MissileTankChozoOrb_2                                ;84E48A;
    dw Instruction_PLM_PreInstruction_inY                                ;84E48C;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E48E;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E490;
    db $16                                                               ;84E492;

InstList_PLM_MissileTankChozoOrb_1:
    dw $0004                                                             ;84E493;
    dw DrawInst_MissileTank_0                                            ;84E495;
    dw $0004                                                             ;84E497;
    dw DrawInst_MissileTank_1                                            ;84E499;
    dw Instruction_PLM_GotoY                                             ;84E49B;
    dw InstList_PLM_MissileTankChozoOrb_1                                ;84E49D;

InstList_PLM_MissileTankChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E49F;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E4A1;
    db $02                                                               ;84E4A3;
    dw Instruction_PLM_CollectAmmo_MissileTank                           ;84E4A4;
    dw $0005                                                             ;84E4A6;

InstList_PLM_MissileTankChozoOrb_3:
    dw $0001                                                             ;84E4A8;
    dw DrawInst_ItemChozoOrb                                             ;84E4AA;
    dw Instruction_PLM_Delete                                            ;84E4AC;

InstList_PLM_SuperMissileTankChozoOrb_0:
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E4AE;
    dw InstList_PLM_SuperMissileTankChozoOrb_3                           ;84E4B0;
    dw Instruction_PLM_Call_Y                                            ;84E4B2;
    dw InstList_PLM_ItemOrb_0                                            ;84E4B4;
    dw Instruction_PLM_Call_Y                                            ;84E4B6;
    dw InstList_PLM_Callable_ItemOrbBurst                                ;84E4B8;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E4BA;
    dw InstList_PLM_SuperMissileTankChozoOrb_2                           ;84E4BC;
    dw Instruction_PLM_PreInstruction_inY                                ;84E4BE;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E4C0;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E4C2;
    db $16                                                               ;84E4C4;

InstList_PLM_SuperMissileTankChozoOrb_1:
    dw $0004                                                             ;84E4C5;
    dw DrawInst_SuperMissileTank_0                                       ;84E4C7;
    dw $0004                                                             ;84E4C9;
    dw DrawInst_SuperMissileTank_1                                       ;84E4CB;
    dw Instruction_PLM_GotoY                                             ;84E4CD;
    dw InstList_PLM_SuperMissileTankChozoOrb_1                           ;84E4CF;

InstList_PLM_SuperMissileTankChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E4D1;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E4D3;
    db $02                                                               ;84E4D5;
    dw Instruction_PLM_CollectAmmo_SuperMissileTank                      ;84E4D6;
    dw $0005                                                             ;84E4D8;

InstList_PLM_SuperMissileTankChozoOrb_3:
    dw $0001                                                             ;84E4DA;
    dw DrawInst_ItemChozoOrb                                             ;84E4DC;
    dw Instruction_PLM_Delete                                            ;84E4DE;

InstList_PLM_PowerBombTankChozoOrb_0:
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E4E0;
    dw InstList_PLM_PowerBombTankChozoOrb_3                              ;84E4E2;
    dw Instruction_PLM_Call_Y                                            ;84E4E4;
    dw InstList_PLM_ItemOrb_0                                            ;84E4E6;
    dw Instruction_PLM_Call_Y                                            ;84E4E8;
    dw InstList_PLM_Callable_ItemOrbBurst                                ;84E4EA;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E4EC;
    dw InstList_PLM_PowerBombTankChozoOrb_2                              ;84E4EE;
    dw Instruction_PLM_PreInstruction_inY                                ;84E4F0;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E4F2;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E4F4;
    db $16                                                               ;84E4F6;

InstList_PLM_PowerBombTankChozoOrb_1:
    dw $0004                                                             ;84E4F7;
    dw DrawInst_PowerBombTank_0                                          ;84E4F9;
    dw $0004                                                             ;84E4FB;
    dw DrawInst_PowerBombTank_1                                          ;84E4FD;
    dw Instruction_PLM_GotoY                                             ;84E4FF;
    dw InstList_PLM_PowerBombTankChozoOrb_1                              ;84E501;

InstList_PLM_PowerBombTankChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E503;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E505;
    db $02                                                               ;84E507;
    dw Instruction_PLM_CollectAmmo_PowerBombTank                         ;84E508;
    dw $0005                                                             ;84E50A;

InstList_PLM_PowerBombTankChozoOrb_3:
    dw $0001                                                             ;84E50C;
    dw DrawInst_ItemChozoOrb                                             ;84E50E;
    dw Instruction_PLM_Delete                                            ;84E510;

InstList_PLM_BombsChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E512;
    dw ItemPLMGFX_Bombs                                                  ;84E514;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E516;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E51E;
    dw InstList_PLM_BombsChozoOrb_3                                      ;84E520;
    dw Instruction_PLM_Call_Y                                            ;84E522;
    dw InstList_PLM_ItemOrb_0                                            ;84E524;
    dw Instruction_PLM_Call_Y                                            ;84E526;
    dw InstList_PLM_Callable_ItemOrbBurst                                ;84E528;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E52A;
    dw InstList_PLM_BombsChozoOrb_2                                      ;84E52C;
    dw Instruction_PLM_PreInstruction_inY                                ;84E52E;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E530;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E532;
    db $16                                                               ;84E534;

InstList_PLM_BombsChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E535;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E537;
    dw Instruction_PLM_GotoY                                             ;84E539;
    dw InstList_PLM_BombsChozoOrb_1                                      ;84E53B;

InstList_PLM_BombsChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E53D;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E53F;
    db $02                                                               ;84E541;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84E542;
    dw $1000                                                             ;84E544;
    db $13                                                               ;84E546;

InstList_PLM_BombsChozoOrb_3:
    dw $0001                                                             ;84E547;
    dw DrawInst_ItemChozoOrb                                             ;84E549;
    dw Instruction_PLM_Delete                                            ;84E54B;

InstList_PLM_ChargeBeamChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E54D;
    dw ItemPLMGFX_ChargeBeam                                             ;84E54F;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E551;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E559;
    dw InstList_PLM_ChargeBeamChozoOrb_3                                 ;84E55B;
    dw Instruction_PLM_Call_Y                                            ;84E55D;
    dw InstList_PLM_ItemOrb_0                                            ;84E55F;
    dw Instruction_PLM_Call_Y                                            ;84E561;
    dw InstList_PLM_Callable_ItemOrbBurst                                ;84E563;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E565;
    dw InstList_PLM_ChargeBeamChozoOrb_2                                 ;84E567;
    dw Instruction_PLM_PreInstruction_inY                                ;84E569;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E56B;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E56D;
    db $16                                                               ;84E56F;

InstList_PLM_ChargeBeamChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E570;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E572;
    dw Instruction_PLM_GotoY                                             ;84E574;
    dw InstList_PLM_ChargeBeamChozoOrb_1                                 ;84E576;

InstList_PLM_ChargeBeamChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E578;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E57A;
    db $02                                                               ;84E57C;
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox                      ;84E57D;
    dw $1000                                                             ;84E57F;
    db $0E                                                               ;84E581;

InstList_PLM_ChargeBeamChozoOrb_3:
    dw $0001                                                             ;84E582;
    dw DrawInst_ItemChozoOrb                                             ;84E584;
    dw Instruction_PLM_Delete                                            ;84E586;

InstList_PLM_IceBeamChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E588;
    dw ItemPLMGFX_IceBeam                                                ;84E58A;
    db $00,$03,$00,$00,$00,$03,$00,$00                                   ;84E58C;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E594;
    dw InstList_PLM_IceBeamChozoOrb_3                                    ;84E596;
    dw Instruction_PLM_Call_Y                                            ;84E598;
    dw InstList_PLM_ItemOrb_0                                            ;84E59A;
    dw Instruction_PLM_Call_Y                                            ;84E59C;
    dw InstList_PLM_Callable_ItemOrbBurst                                ;84E59E;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E5A0;
    dw InstList_PLM_IceBeamChozoOrb_2                                    ;84E5A2;
    dw Instruction_PLM_PreInstruction_inY                                ;84E5A4;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E5A6;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E5A8;
    db $16                                                               ;84E5AA;

InstList_PLM_IceBeamChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E5AB;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E5AD;
    dw Instruction_PLM_GotoY                                             ;84E5AF;
    dw InstList_PLM_IceBeamChozoOrb_1                                    ;84E5B1;

InstList_PLM_IceBeamChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E5B3;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E5B5;
    db $02                                                               ;84E5B7;
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox                      ;84E5B8;
    dw $0002                                                             ;84E5BA;
    db $0F                                                               ;84E5BC;

InstList_PLM_IceBeamChozoOrb_3:
    dw $0001                                                             ;84E5BD;
    dw DrawInst_ItemChozoOrb                                             ;84E5BF;
    dw Instruction_PLM_Delete                                            ;84E5C1;

InstList_PLM_HiJumpBootsChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E5C3;
    dw ItemPLMGFX_HiJumpBoots                                            ;84E5C5;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E5C7;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E5CF;
    dw InstList_PLM_HiJumpBootsChozoOrb_3                                ;84E5D1;
    dw Instruction_PLM_Call_Y                                            ;84E5D3;
    dw InstList_PLM_ItemOrb_0                                            ;84E5D5;
    dw Instruction_PLM_Call_Y                                            ;84E5D7;
    dw InstList_PLM_Callable_ItemOrbBurst                                ;84E5D9;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E5DB;
    dw InstList_PLM_HiJumpBootsChozoOrb_2                                ;84E5DD;
    dw Instruction_PLM_PreInstruction_inY                                ;84E5DF;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E5E1;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E5E3;
    db $16                                                               ;84E5E5;

InstList_PLM_HiJumpBootsChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E5E6;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E5E8;
    dw Instruction_PLM_GotoY                                             ;84E5EA;
    dw InstList_PLM_HiJumpBootsChozoOrb_1                                ;84E5EC;

InstList_PLM_HiJumpBootsChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E5EE;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E5F0;
    db $02                                                               ;84E5F2;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84E5F3;
    dw $0100                                                             ;84E5F5;
    db $0B                                                               ;84E5F7;

InstList_PLM_HiJumpBootsChozoOrb_3:
    dw $0001                                                             ;84E5F8;
    dw DrawInst_ItemChozoOrb                                             ;84E5FA;
    dw Instruction_PLM_Delete                                            ;84E5FC;

InstList_PLM_SpeedBoosterChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E5FE;
    dw ItemPLMGFX_SpeedBooster                                           ;84E600;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E602;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E60A;
    dw InstList_PLM_SpeedBoosterChozoOrb_4                               ;84E60C;
    dw Instruction_PLM_Call_Y                                            ;84E60E;
    dw InstList_PLM_ItemOrb_0                                            ;84E610;
    dw Instruction_PLM_Call_Y                                            ;84E612;
    dw InstList_PLM_Callable_ItemOrbBurst                                ;84E614;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E616;
    dw InstList_PLM_SpeedBoosterChozoOrb_2                               ;84E618;
    dw Instruction_PLM_PreInstruction_inY                                ;84E61A;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E61C;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E61E;
    db $16                                                               ;84E620;

InstList_PLM_SpeedBoosterChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E621;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E623;
    dw Instruction_PLM_GotoY                                             ;84E625;
    dw InstList_PLM_SpeedBoosterChozoOrb_1                               ;84E627;

InstList_PLM_SpeedBoosterChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E629;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E62B;
    db $02                                                               ;84E62D;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84E62E;
    dw $2000                                                             ;84E630;
    db $0D                                                               ;84E632;

InstList_PLM_SpeedBoosterChozoOrb_3:
    dw Instruction_PLM_FXYVelocity_FFE0                                  ;84E633;

InstList_PLM_SpeedBoosterChozoOrb_4:
    dw $0001                                                             ;84E635;
    dw DrawInst_ItemChozoOrb                                             ;84E637;
    dw Instruction_PLM_Delete                                            ;84E639;

Instruction_PLM_FXYVelocity_FFE0:
    LDA.W #$FFE0                                                         ;84E63B;
    STA.W $197C                                                          ;84E63E;
    RTS                                                                  ;84E641;


InstList_PLM_WaveBeamChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E642;
    dw ItemPLMGFX_WaveBeam                                               ;84E644;
    db $00,$02,$00,$00,$00,$02,$00,$00                                   ;84E646;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E64E;
    dw InstList_PLM_WaveBeamChozoOrb_3                                   ;84E650;
    dw Instruction_PLM_Call_Y                                            ;84E652;
    dw InstList_PLM_ItemOrb_0                                            ;84E654;
    dw Instruction_PLM_Call_Y                                            ;84E656;
    dw InstList_PLM_Callable_ItemOrbBurst                                ;84E658;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E65A;
    dw InstList_PLM_WaveBeamChozoOrb_2                                   ;84E65C;
    dw Instruction_PLM_PreInstruction_inY                                ;84E65E;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E660;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E662;
    db $16                                                               ;84E664;

InstList_PLM_WaveBeamChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E665;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E667;
    dw Instruction_PLM_GotoY                                             ;84E669;
    dw InstList_PLM_WaveBeamChozoOrb_1                                   ;84E66B;

InstList_PLM_WaveBeamChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E66D;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E66F;
    db $02                                                               ;84E671;
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox                      ;84E672;
    dw $0001                                                             ;84E674;
    db $10                                                               ;84E676;

InstList_PLM_WaveBeamChozoOrb_3:
    dw $0001                                                             ;84E677;
    dw DrawInst_ItemChozoOrb                                             ;84E679;
    dw Instruction_PLM_Delete                                            ;84E67B;

InstList_PLM_SpazerChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E67D;
    dw ItemPLMGFX_Spazer                                                 ;84E67F;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E681;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E689;
    dw InstList_PLM_SpazerChozoOrb_3                                     ;84E68B;
    dw Instruction_PLM_Call_Y                                            ;84E68D;
    dw InstList_PLM_ItemOrb_0                                            ;84E68F;
    dw Instruction_PLM_Call_Y                                            ;84E691;
    dw InstList_PLM_Callable_ItemOrbBurst                                ;84E693;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E695;
    dw InstList_PLM_SpazerChozoOrb_2                                     ;84E697;
    dw Instruction_PLM_PreInstruction_inY                                ;84E699;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E69B;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E69D;
    db $16                                                               ;84E69F;

InstList_PLM_SpazerChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E6A0;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E6A2;
    dw Instruction_PLM_GotoY                                             ;84E6A4;
    dw InstList_PLM_SpazerChozoOrb_1                                     ;84E6A6;

InstList_PLM_SpazerChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E6A8;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E6AA;
    db $02                                                               ;84E6AC;
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox                      ;84E6AD;
    dw $0004                                                             ;84E6AF;
    db $11                                                               ;84E6B1;

InstList_PLM_SpazerChozoOrb_3:
    dw $0001                                                             ;84E6B2;
    dw DrawInst_ItemChozoOrb                                             ;84E6B4;
    dw Instruction_PLM_Delete                                            ;84E6B6;

InstList_PLM_SpringBallChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E6B8;
    dw ItemPLMGFX_SpringBall                                             ;84E6BA;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E6BC;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E6C4;
    dw InstList_PLM_SpringBallChozoOrb_3                                 ;84E6C6;
    dw Instruction_PLM_Call_Y                                            ;84E6C8;
    dw InstList_PLM_ItemOrb_0                                            ;84E6CA;
    dw Instruction_PLM_Call_Y                                            ;84E6CC;
    dw InstList_PLM_Callable_ItemOrbBurst                                ;84E6CE;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E6D0;
    dw InstList_PLM_SpringBallChozoOrb_2                                 ;84E6D2;
    dw Instruction_PLM_PreInstruction_inY                                ;84E6D4;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E6D6;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E6D8;
    db $16                                                               ;84E6DA;

InstList_PLM_SpringBallChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E6DB;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E6DD;
    dw Instruction_PLM_GotoY                                             ;84E6DF;
    dw InstList_PLM_SpringBallChozoOrb_1                                 ;84E6E1;

InstList_PLM_SpringBallChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E6E3;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E6E5;
    db $02                                                               ;84E6E7;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84E6E8;
    dw $0002                                                             ;84E6EA;
    db $08                                                               ;84E6EC;

InstList_PLM_SpringBallChozoOrb_3:
    dw $0001                                                             ;84E6ED;
    dw DrawInst_ItemChozoOrb                                             ;84E6EF;
    dw Instruction_PLM_Delete                                            ;84E6F1;

InstList_PLM_VariaSuitChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E6F3;
    dw ItemPLMGFX_VariaSuit                                              ;84E6F5;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E6F7;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E6FF;
    dw InstList_PLM_VariaSuitChozoOrb_3                                  ;84E701;
    dw Instruction_PLM_Call_Y                                            ;84E703;
    dw InstList_PLM_ItemOrb_0                                            ;84E705;
    dw Instruction_PLM_Call_Y                                            ;84E707;
    dw InstList_PLM_Callable_ItemOrbBurst                                ;84E709;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E70B;
    dw InstList_PLM_VariaSuitChozoOrb_2                                  ;84E70D;
    dw Instruction_PLM_PreInstruction_inY                                ;84E70F;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E711;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E713;
    db $16                                                               ;84E715;

InstList_PLM_VariaSuitChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E716;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E718;
    dw Instruction_PLM_GotoY                                             ;84E71A;
    dw InstList_PLM_VariaSuitChozoOrb_1                                  ;84E71C;

InstList_PLM_VariaSuitChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E71E;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E720;
    db $02                                                               ;84E722;
    dw Instruction_PLM_ClearChargeBeamCounter                            ;84E723;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84E725;
    dw $0001                                                             ;84E727;
    db $07                                                               ;84E729;
    dw Instruction_PLM_CallFunctionInY                                   ;84E72A;
    dl VariaSuit_Pickup                                                  ;84E72C;

InstList_PLM_VariaSuitChozoOrb_3:
    dw $0001                                                             ;84E72F;
    dw DrawInst_ItemChozoOrb                                             ;84E731;
    dw Instruction_PLM_Delete                                            ;84E733;

InstList_PLM_GravitySuitChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E735;
    dw ItemPLMGFX_GravitySuit                                            ;84E737;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E739;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E741;
    dw InstList_PLM_GravitySuitChozoOrb_3                                ;84E743;
    dw Instruction_PLM_Call_Y                                            ;84E745;
    dw InstList_PLM_ItemOrb_0                                            ;84E747;
    dw Instruction_PLM_Call_Y                                            ;84E749;
    dw InstList_PLM_Callable_ItemOrbBurst                                ;84E74B;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E74D;
    dw InstList_PLM_GravitySuitChozoOrb_2                                ;84E74F;
    dw Instruction_PLM_PreInstruction_inY                                ;84E751;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E753;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E755;
    db $16                                                               ;84E757;

InstList_PLM_GravitySuitChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E758;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E75A;
    dw Instruction_PLM_GotoY                                             ;84E75C;
    dw InstList_PLM_GravitySuitChozoOrb_1                                ;84E75E;

InstList_PLM_GravitySuitChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E760;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E762;
    db $02                                                               ;84E764;
    dw Instruction_PLM_ClearChargeBeamCounter                            ;84E765;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84E767;
    dw $0020                                                             ;84E769;
    db $1A                                                               ;84E76B;
    dw Instruction_PLM_CallFunctionInY                                   ;84E76C;
    dl GravitySuit_Pickup                                                ;84E76E;

InstList_PLM_GravitySuitChozoOrb_3:
    dw $0001                                                             ;84E771;
    dw DrawInst_ItemChozoOrb                                             ;84E773;
    dw Instruction_PLM_Delete                                            ;84E775;

InstList_PLM_XrayScopeChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E777;
    dw ItemPLMGFX_XrayScope                                              ;84E779;
    db $01,$01,$00,$00,$03,$03,$00,$00                                   ;84E77B;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E783;
    dw InstList_PLM_XrayScopeChozoOrb_3                                  ;84E785;
    dw Instruction_PLM_Call_Y                                            ;84E787;
    dw InstList_PLM_ItemOrb_0                                            ;84E789;
    dw Instruction_PLM_Call_Y                                            ;84E78B;
    dw InstList_PLM_Callable_ItemOrbBurst                                ;84E78D;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E78F;
    dw InstList_PLM_XrayScopeChozoOrb_2                                  ;84E791;
    dw Instruction_PLM_PreInstruction_inY                                ;84E793;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E795;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E797;
    db $16                                                               ;84E799;

InstList_PLM_XrayScopeChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E79A;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E79C;
    dw Instruction_PLM_GotoY                                             ;84E79E;
    dw InstList_PLM_XrayScopeChozoOrb_1                                  ;84E7A0;

InstList_PLM_XrayScopeChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E7A2;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E7A4;
    db $02                                                               ;84E7A6;
    dw Inst_PLM_PickUpEquipment_AddXrayToHUD_DisplayMessageBox           ;84E7A7;
    dw $8000                                                             ;84E7A9;

InstList_PLM_XrayScopeChozoOrb_3:
    dw $0001                                                             ;84E7AB;
    dw DrawInst_ItemChozoOrb                                             ;84E7AD;
    dw Instruction_PLM_Delete                                            ;84E7AF;

InstList_PLM_PlasmaBeamChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E7B1;
    dw ItemPLMGFX_PlasmaBeam                                             ;84E7B3;
    db $00,$01,$00,$00,$00,$01,$00,$00                                   ;84E7B5;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E7BD;
    dw InstList_PLM_PlasmaBeamChozoOrb_3                                 ;84E7BF;
    dw Instruction_PLM_Call_Y                                            ;84E7C1;
    dw InstList_PLM_ItemOrb_0                                            ;84E7C3;
    dw Instruction_PLM_Call_Y                                            ;84E7C5;
    dw InstList_PLM_Callable_ItemOrbBurst                                ;84E7C7;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E7C9;
    dw InstList_PLM_PlasmaBeamChozoOrb_2                                 ;84E7CB;
    dw Instruction_PLM_PreInstruction_inY                                ;84E7CD;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E7CF;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E7D1;
    db $16                                                               ;84E7D3;

InstList_PLM_PlasmaBeamChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E7D4;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E7D6;
    dw Instruction_PLM_GotoY                                             ;84E7D8;
    dw InstList_PLM_PlasmaBeamChozoOrb_1                                 ;84E7DA;

InstList_PLM_PlasmaBeamChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E7DC;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E7DE;
    db $02                                                               ;84E7E0;
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox                      ;84E7E1;
    dw $0008                                                             ;84E7E3;
    db $12                                                               ;84E7E5;

InstList_PLM_PlasmaBeamChozoOrb_3:
    dw $0001                                                             ;84E7E6;
    dw DrawInst_ItemChozoOrb                                             ;84E7E8;
    dw Instruction_PLM_Delete                                            ;84E7EA;

InstList_PLM_GrappleBeamChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E7EC;
    dw ItemPLMGFX_GrappleBeam                                            ;84E7EE;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E7F0;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E7F8;
    dw InstList_PLM_GrappleBeamChozoOrb_3                                ;84E7FA;
    dw Instruction_PLM_Call_Y                                            ;84E7FC;
    dw InstList_PLM_ItemOrb_0                                            ;84E7FE;
    dw Instruction_PLM_Call_Y                                            ;84E800;
    dw InstList_PLM_Callable_ItemOrbBurst                                ;84E802;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E804;
    dw InstList_PLM_GrappleBeamChozoOrb_2                                ;84E806;
    dw Instruction_PLM_PreInstruction_inY                                ;84E808;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E80A;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E80C;
    db $16                                                               ;84E80E;

InstList_PLM_GrappleBeamChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E80F;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E811;
    dw Instruction_PLM_GotoY                                             ;84E813;
    dw InstList_PLM_GrappleBeamChozoOrb_1                                ;84E815;

InstList_PLM_GrappleBeamChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E817;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E819;
    db $02                                                               ;84E81B;
    dw Inst_PLM_PickUpEquipment_AddGrappleHUD_DisplayMessageBox          ;84E81C;
    dw $4000                                                             ;84E81E;

InstList_PLM_GrappleBeamChozoOrb_3:
    dw $0001                                                             ;84E820;
    dw DrawInst_ItemChozoOrb                                             ;84E822;
    dw Instruction_PLM_Delete                                            ;84E824;

InstList_PLM_SpaceJumpChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E826;
    dw ItemPLMGFX_SpaceJump                                              ;84E828;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E82A;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E832;
    dw InstList_PLM_SpaceJumpChozoOrb_3                                  ;84E834;
    dw Instruction_PLM_Call_Y                                            ;84E836;
    dw InstList_PLM_ItemOrb_0                                            ;84E838;
    dw Instruction_PLM_Call_Y                                            ;84E83A;
    dw InstList_PLM_Callable_ItemOrbBurst                                ;84E83C;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E83E;
    dw InstList_PLM_SpaceJumpChozoOrb_2                                  ;84E840;
    dw Instruction_PLM_PreInstruction_inY                                ;84E842;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E844;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E846;
    db $16                                                               ;84E848;

InstList_PLM_SpaceJumpChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E849;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E84B;
    dw Instruction_PLM_GotoY                                             ;84E84D;
    dw InstList_PLM_SpaceJumpChozoOrb_1                                  ;84E84F;

InstList_PLM_SpaceJumpChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E851;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E853;
    db $02                                                               ;84E855;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84E856;
    dw $0200                                                             ;84E858;
    db $0C                                                               ;84E85A;

InstList_PLM_SpaceJumpChozoOrb_3:
    dw $0001                                                             ;84E85B;
    dw DrawInst_ItemChozoOrb                                             ;84E85D;
    dw Instruction_PLM_Delete                                            ;84E85F;

InstList_PLM_ScrewAttackChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E861;
    dw ItemPLMGFX_ScrewAttack                                            ;84E863;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E865;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E86D;
    dw InstList_PLM_ScrewAttackChozoOrb_3                                ;84E86F;
    dw Instruction_PLM_Call_Y                                            ;84E871;
    dw InstList_PLM_ItemOrb_0                                            ;84E873;
    dw Instruction_PLM_Call_Y                                            ;84E875;
    dw InstList_PLM_Callable_ItemOrbBurst                                ;84E877;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E879;
    dw InstList_PLM_ScrewAttackChozoOrb_2                                ;84E87B;
    dw Instruction_PLM_PreInstruction_inY                                ;84E87D;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E87F;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E881;
    db $16                                                               ;84E883;

InstList_PLM_ScrewAttackChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E884;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E886;
    dw Instruction_PLM_GotoY                                             ;84E888;
    dw InstList_PLM_ScrewAttackChozoOrb_1                                ;84E88A;

InstList_PLM_ScrewAttackChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E88C;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E88E;
    db $02                                                               ;84E890;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84E891;
    dw $0008                                                             ;84E893;
    db $0A                                                               ;84E895;

InstList_PLM_ScrewAttackChozoOrb_3:
    dw $0001                                                             ;84E896;
    dw DrawInst_ItemChozoOrb                                             ;84E898;
    dw Instruction_PLM_Delete                                            ;84E89A;

InstList_PLM_MorphBallChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E89C;
    dw ItemPLMGFX_MorphBall                                              ;84E89E;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E8A0;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E8A8;
    dw InstList_PLM_MorphBallChozoOrb_3                                  ;84E8AA;
    dw Instruction_PLM_Call_Y                                            ;84E8AC;
    dw InstList_PLM_ItemOrb_0                                            ;84E8AE;
    dw Instruction_PLM_Call_Y                                            ;84E8B0;
    dw InstList_PLM_Callable_ItemOrbBurst                                ;84E8B2;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E8B4;
    dw InstList_PLM_MorphBallChozoOrb_2                                  ;84E8B6;
    dw Instruction_PLM_PreInstruction_inY                                ;84E8B8;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E8BA;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E8BC;
    db $16                                                               ;84E8BE;

InstList_PLM_MorphBallChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E8BF;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E8C1;
    dw Instruction_PLM_GotoY                                             ;84E8C3;
    dw InstList_PLM_MorphBallChozoOrb_1                                  ;84E8C5;

InstList_PLM_MorphBallChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E8C7;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E8C9;
    db $02                                                               ;84E8CB;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84E8CC;
    dw $0002                                                             ;84E8CE;
    db $09                                                               ;84E8D0;

InstList_PLM_MorphBallChozoOrb_3:
    dw $0001                                                             ;84E8D1;
    dw DrawInst_ItemChozoOrb                                             ;84E8D3;
    dw Instruction_PLM_Delete                                            ;84E8D5;

InstList_PLM_ReserveTankChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E8D7;
    dw ItemPLMGFX_ReserveTank                                            ;84E8D9;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E8DB;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E8E3;
    dw InstList_PLM_ReserveTankChozoOrb_3                                ;84E8E5;
    dw Instruction_PLM_Call_Y                                            ;84E8E7;
    dw InstList_PLM_ItemOrb_0                                            ;84E8E9;
    dw Instruction_PLM_Call_Y                                            ;84E8EB;
    dw InstList_PLM_Callable_ItemOrbBurst                                ;84E8ED;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E8EF;
    dw InstList_PLM_ReserveTankChozoOrb_2                                ;84E8F1;
    dw Instruction_PLM_PreInstruction_inY                                ;84E8F3;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E8F5;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E8F7;
    db $16                                                               ;84E8F9;

InstList_PLM_ReserveTankChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0                                    ;84E8FA;
    dw Instruction_PLM_DrawItemFrame1                                    ;84E8FC;
    dw Instruction_PLM_GotoY                                             ;84E8FE;
    dw InstList_PLM_ReserveTankChozoOrb_1                                ;84E900;

InstList_PLM_ReserveTankChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E902;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E904;
    db $02                                                               ;84E906;
    dw Instruction_PLM_CollectHealth_ReserveTank                         ;84E907;
    dw $0064                                                             ;84E909;

InstList_PLM_ReserveTankChozoOrb_3:
    dw $0001                                                             ;84E90B;
    dw DrawInst_ItemChozoOrb                                             ;84E90D;
    dw Instruction_PLM_Delete                                            ;84E90F;

InstList_PLM_EnergyTankShotBlock_0:
    dw Instruction_PLM_Call_Y                                            ;84E911;
    dw InstList_PLM_Callable_ItemShotBlock                               ;84E913;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E915;
    dw InstList_PLM_EnergyTankShotBlock_3                                ;84E917;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E919;
    dw InstList_PLM_EnergyTankShotBlock_2                                ;84E91B;
    dw Instruction_PLM_PreInstruction_inY                                ;84E91D;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E91F;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E921;
    db $16                                                               ;84E923;

InstList_PLM_EnergyTankShotBlock_1:
    dw $0004                                                             ;84E924;
    dw DrawInst_EnergyTank_0                                             ;84E926;
    dw $0004                                                             ;84E928;
    dw DrawInst_EnergyTank_1                                             ;84E92A;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84E92C;
    dw InstList_PLM_EnergyTankShotBlock_1                                ;84E92E;
    dw Instruction_PLM_Call_Y                                            ;84E930;
    dw InstList_PLM_Callable_ItemShotBlockReconcealing                   ;84E932;
    dw Instruction_PLM_GotoY                                             ;84E934;
    dw InstList_PLM_EnergyTankShotBlock_0                                ;84E936;

InstList_PLM_EnergyTankShotBlock_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E938;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E93A;
    db $02                                                               ;84E93C;
    dw Instruction_PLM_CollectHealth_EnergyTank                          ;84E93D;
    dw $0064                                                             ;84E93F;

InstList_PLM_EnergyTankShotBlock_3:
    dw Instruction_PLM_Call_Y                                            ;84E941;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0            ;84E943;
    dw Instruction_PLM_GotoY                                             ;84E945;
    dw InstList_PLM_EnergyTankShotBlock_0                                ;84E947;

InstList_PLM_MissileTankShotBlock_0:
    dw Instruction_PLM_Call_Y                                            ;84E949;
    dw InstList_PLM_Callable_ItemShotBlock                               ;84E94B;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E94D;
    dw InstList_PLM_MissileTankShotBlock_3                               ;84E94F;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E951;
    dw InstList_PLM_MissileTankShotBlock_2                               ;84E953;
    dw Instruction_PLM_PreInstruction_inY                                ;84E955;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E957;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E959;
    db $16                                                               ;84E95B;

InstList_PLM_MissileTankShotBlock_1:
    dw $0004                                                             ;84E95C;
    dw DrawInst_MissileTank_0                                            ;84E95E;
    dw $0004                                                             ;84E960;
    dw DrawInst_MissileTank_1                                            ;84E962;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84E964;
    dw InstList_PLM_MissileTankShotBlock_1                               ;84E966;
    dw Instruction_PLM_Call_Y                                            ;84E968;
    dw InstList_PLM_Callable_ItemShotBlockReconcealing                   ;84E96A;
    dw Instruction_PLM_GotoY                                             ;84E96C;
    dw InstList_PLM_MissileTankShotBlock_0                               ;84E96E;

InstList_PLM_MissileTankShotBlock_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E970;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E972;
    db $02                                                               ;84E974;
    dw Instruction_PLM_CollectAmmo_MissileTank                           ;84E975;
    dw $0005                                                             ;84E977;

InstList_PLM_MissileTankShotBlock_3:
    dw Instruction_PLM_Call_Y                                            ;84E979;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0            ;84E97B;
    dw Instruction_PLM_GotoY                                             ;84E97D;
    dw InstList_PLM_MissileTankShotBlock_0                               ;84E97F;

InstList_PLM_SuperMissileTankShotBlock_0:
    dw Instruction_PLM_Call_Y                                            ;84E981;
    dw InstList_PLM_Callable_ItemShotBlock                               ;84E983;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E985;
    dw InstList_PLM_SuperMissileTankShotBlock_3                          ;84E987;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E989;
    dw InstList_PLM_SuperMissileTankShotBlock_2                          ;84E98B;
    dw Instruction_PLM_PreInstruction_inY                                ;84E98D;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E98F;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E991;
    db $16                                                               ;84E993;

InstList_PLM_SuperMissileTankShotBlock_1:
    dw $0004                                                             ;84E994;
    dw DrawInst_SuperMissileTank_0                                       ;84E996;
    dw $0004                                                             ;84E998;
    dw DrawInst_SuperMissileTank_1                                       ;84E99A;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84E99C;
    dw InstList_PLM_SuperMissileTankShotBlock_1                          ;84E99E;
    dw Instruction_PLM_Call_Y                                            ;84E9A0;
    dw InstList_PLM_Callable_ItemShotBlockReconcealing                   ;84E9A2;
    dw Instruction_PLM_GotoY                                             ;84E9A4;
    dw InstList_PLM_SuperMissileTankShotBlock_0                          ;84E9A6;

InstList_PLM_SuperMissileTankShotBlock_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E9A8;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E9AA;
    db $02                                                               ;84E9AC;
    dw Instruction_PLM_CollectAmmo_SuperMissileTank                      ;84E9AD;
    dw $0005                                                             ;84E9AF;

InstList_PLM_SuperMissileTankShotBlock_3:
    dw Instruction_PLM_Call_Y                                            ;84E9B1;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0            ;84E9B3;
    dw Instruction_PLM_GotoY                                             ;84E9B5;
    dw InstList_PLM_SuperMissileTankShotBlock_0                          ;84E9B7;

InstList_PLM_PowerBombTankShotBlock_0:
    dw Instruction_PLM_Call_Y                                            ;84E9B9;
    dw InstList_PLM_Callable_ItemShotBlock                               ;84E9BB;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84E9BD;
    dw InstList_PLM_PowerBombTankShotBlock_3                             ;84E9BF;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84E9C1;
    dw InstList_PLM_PowerBombTankShotBlock_2                             ;84E9C3;
    dw Instruction_PLM_PreInstruction_inY                                ;84E9C5;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84E9C7;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84E9C9;
    db $16                                                               ;84E9CB;

InstList_PLM_PowerBombTankShotBlock_1:
    dw $0004                                                             ;84E9CC;
    dw DrawInst_PowerBombTank_0                                          ;84E9CE;
    dw $0004                                                             ;84E9D0;
    dw DrawInst_PowerBombTank_1                                          ;84E9D2;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84E9D4;
    dw InstList_PLM_PowerBombTankShotBlock_1                             ;84E9D6;
    dw Instruction_PLM_Call_Y                                            ;84E9D8;
    dw InstList_PLM_Callable_ItemShotBlockReconcealing                   ;84E9DA;
    dw Instruction_PLM_GotoY                                             ;84E9DC;
    dw InstList_PLM_PowerBombTankShotBlock_0                             ;84E9DE;

InstList_PLM_PowerBombTankShotBlock_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84E9E0;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84E9E2;
    db $02                                                               ;84E9E4;
    dw Instruction_PLM_CollectAmmo_PowerBombTank                         ;84E9E5;
    dw $0005                                                             ;84E9E7;

InstList_PLM_PowerBombTankShotBlock_3:
    dw Instruction_PLM_Call_Y                                            ;84E9E9;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0            ;84E9EB;
    dw Instruction_PLM_GotoY                                             ;84E9ED;
    dw InstList_PLM_PowerBombTankShotBlock_0                             ;84E9EF;

InstList_PLM_BombsShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84E9F1;
    dw ItemPLMGFX_Bombs                                                  ;84E9F3;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84E9F5;

InstList_PLM_BombsShotBlock_1:
    dw Instruction_PLM_Call_Y                                            ;84E9FD;
    dw InstList_PLM_Callable_ItemShotBlock                               ;84E9FF;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84EA01;
    dw InstList_PLM_BombsShotBlock_4                                     ;84EA03;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84EA05;
    dw InstList_PLM_BombsShotBlock_3                                     ;84EA07;
    dw Instruction_PLM_PreInstruction_inY                                ;84EA09;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84EA0B;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84EA0D;
    db $16                                                               ;84EA0F;

InstList_PLM_BombsShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0                                    ;84EA10;
    dw Instruction_PLM_DrawItemFrame1                                    ;84EA12;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84EA14;
    dw InstList_PLM_BombsShotBlock_2                                     ;84EA16;
    dw Instruction_PLM_Call_Y                                            ;84EA18;
    dw InstList_PLM_Callable_ItemShotBlockReconcealing                   ;84EA1A;
    dw Instruction_PLM_GotoY                                             ;84EA1C;
    dw InstList_PLM_BombsShotBlock_1                                     ;84EA1E;

InstList_PLM_BombsShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84EA20;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84EA22;
    db $02                                                               ;84EA24;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84EA25;
    dw $1000                                                             ;84EA27;
    db $13                                                               ;84EA29;

InstList_PLM_BombsShotBlock_4:
    dw Instruction_PLM_Call_Y                                            ;84EA2A;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0            ;84EA2C;
    dw Instruction_PLM_GotoY                                             ;84EA2E;
    dw InstList_PLM_BombsShotBlock_1                                     ;84EA30;

InstList_PLM_ChargeBeamShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84EA32;
    dw ItemPLMGFX_ChargeBeam                                             ;84EA34;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84EA36;

InstList_PLM_ChargeBeamShotBlock_1:
    dw Instruction_PLM_Call_Y                                            ;84EA3E;
    dw InstList_PLM_Callable_ItemShotBlock                               ;84EA40;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84EA42;
    dw InstList_PLM_ChargeBeamShotBlock_4                                ;84EA44;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84EA46;
    dw InstList_PLM_ChargeBeamShotBlock_3                                ;84EA48;
    dw Instruction_PLM_PreInstruction_inY                                ;84EA4A;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84EA4C;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84EA4E;
    db $16                                                               ;84EA50;

InstList_PLM_ChargeBeamShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0                                    ;84EA51;
    dw Instruction_PLM_DrawItemFrame1                                    ;84EA53;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84EA55;
    dw InstList_PLM_ChargeBeamShotBlock_2                                ;84EA57;
    dw Instruction_PLM_Call_Y                                            ;84EA59;
    dw InstList_PLM_Callable_ItemShotBlockReconcealing                   ;84EA5B;
    dw Instruction_PLM_GotoY                                             ;84EA5D;
    dw InstList_PLM_ChargeBeamShotBlock_1                                ;84EA5F;

InstList_PLM_ChargeBeamShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84EA61;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84EA63;
    db $02                                                               ;84EA65;
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox                      ;84EA66;
    dw $1000                                                             ;84EA68;
    db $0E                                                               ;84EA6A;

InstList_PLM_ChargeBeamShotBlock_4:
    dw Instruction_PLM_Call_Y                                            ;84EA6B;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0            ;84EA6D;
    dw Instruction_PLM_GotoY                                             ;84EA6F;
    dw InstList_PLM_ChargeBeamShotBlock_1                                ;84EA71;

InstList_PLM_IceBeamShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84EA73;
    dw ItemPLMGFX_IceBeam                                                ;84EA75;
    db $00,$03,$00,$00,$00,$03,$00,$00                                   ;84EA77;

InstList_PLM_IceBeamShotBlock_1:
    dw Instruction_PLM_Call_Y                                            ;84EA7F;
    dw InstList_PLM_Callable_ItemShotBlock                               ;84EA81;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84EA83;
    dw InstList_PLM_IceBeamShotBlock_4                                   ;84EA85;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84EA87;
    dw InstList_PLM_IceBeamShotBlock_3                                   ;84EA89;
    dw Instruction_PLM_PreInstruction_inY                                ;84EA8B;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84EA8D;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84EA8F;
    db $16                                                               ;84EA91;

InstList_PLM_IceBeamShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0                                    ;84EA92;
    dw Instruction_PLM_DrawItemFrame1                                    ;84EA94;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84EA96;
    dw InstList_PLM_IceBeamShotBlock_2                                   ;84EA98;
    dw Instruction_PLM_Call_Y                                            ;84EA9A;
    dw InstList_PLM_Callable_ItemShotBlockReconcealing                   ;84EA9C;
    dw Instruction_PLM_GotoY                                             ;84EA9E;
    dw InstList_PLM_IceBeamShotBlock_1                                   ;84EAA0;

InstList_PLM_IceBeamShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84EAA2;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84EAA4;
    db $02                                                               ;84EAA6;
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox                      ;84EAA7;
    dw $0002                                                             ;84EAA9;
    db $0F                                                               ;84EAAB;

InstList_PLM_IceBeamShotBlock_4:
    dw Instruction_PLM_Call_Y                                            ;84EAAC;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0            ;84EAAE;
    dw Instruction_PLM_GotoY                                             ;84EAB0;
    dw InstList_PLM_IceBeamShotBlock_1                                   ;84EAB2;

InstList_PLM_HiJumpBootsShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84EAB4;
    dw ItemPLMGFX_HiJumpBoots                                            ;84EAB6;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84EAB8;

InstList_PLM_HiJumpBootsShotBlock_1:
    dw Instruction_PLM_Call_Y                                            ;84EAC0;
    dw InstList_PLM_Callable_ItemShotBlock                               ;84EAC2;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84EAC4;
    dw InstList_PLM_HiJumpBootsShotBlock_4                               ;84EAC6;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84EAC8;
    dw InstList_PLM_HiJumpBootsShotBlock_3                               ;84EACA;
    dw Instruction_PLM_PreInstruction_inY                                ;84EACC;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84EACE;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84EAD0;
    db $16                                                               ;84EAD2;

InstList_PLM_HiJumpBootsShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0                                    ;84EAD3;
    dw Instruction_PLM_DrawItemFrame1                                    ;84EAD5;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84EAD7;
    dw InstList_PLM_HiJumpBootsShotBlock_2                               ;84EAD9;
    dw Instruction_PLM_Call_Y                                            ;84EADB;
    dw InstList_PLM_Callable_ItemShotBlockReconcealing                   ;84EADD;
    dw Instruction_PLM_GotoY                                             ;84EADF;
    dw InstList_PLM_HiJumpBootsShotBlock_1                               ;84EAE1;

InstList_PLM_HiJumpBootsShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84EAE3;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84EAE5;
    db $02                                                               ;84EAE7;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84EAE8;
    dw $0100                                                             ;84EAEA;
    db $0B                                                               ;84EAEC;

InstList_PLM_HiJumpBootsShotBlock_4:
    dw Instruction_PLM_Call_Y                                            ;84EAED;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0            ;84EAEF;
    dw Instruction_PLM_GotoY                                             ;84EAF1;
    dw InstList_PLM_HiJumpBootsShotBlock_1                               ;84EAF3;

InstList_PLM_SpeedBoosterShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84EAF5;
    dw ItemPLMGFX_SpeedBooster                                           ;84EAF7;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84EAF9;

InstList_PLM_SpeedBoosterShotBlock_1:
    dw Instruction_PLM_Call_Y                                            ;84EB01;
    dw InstList_PLM_Callable_ItemShotBlock                               ;84EB03;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84EB05;
    dw InstList_PLM_SpeedBoosterShotBlock_4                              ;84EB07;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84EB09;
    dw InstList_PLM_SpeedBoosterShotBlock_3                              ;84EB0B;
    dw Instruction_PLM_PreInstruction_inY                                ;84EB0D;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84EB0F;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84EB11;
    db $16                                                               ;84EB13;

InstList_PLM_SpeedBoosterShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0                                    ;84EB14;
    dw Instruction_PLM_DrawItemFrame1                                    ;84EB16;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84EB18;
    dw InstList_PLM_SpeedBoosterShotBlock_2                              ;84EB1A;
    dw Instruction_PLM_Call_Y                                            ;84EB1C;
    dw InstList_PLM_Callable_ItemShotBlockReconcealing                   ;84EB1E;
    dw Instruction_PLM_GotoY                                             ;84EB20;
    dw InstList_PLM_SpeedBoosterShotBlock_1                              ;84EB22;

InstList_PLM_SpeedBoosterShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84EB24;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84EB26;
    db $02                                                               ;84EB28;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84EB29;
    dw $2000                                                             ;84EB2B;
    db $0D                                                               ;84EB2D;

InstList_PLM_SpeedBoosterShotBlock_4:
    dw Instruction_PLM_Call_Y                                            ;84EB2E;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0            ;84EB30;
    dw Instruction_PLM_GotoY                                             ;84EB32;
    dw InstList_PLM_SpeedBoosterShotBlock_1                              ;84EB34;

InstList_PLM_WaveBeamShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84EB36;
    dw ItemPLMGFX_WaveBeam                                               ;84EB38;
    db $00,$02,$00,$00,$00,$02,$00,$00                                   ;84EB3A;

InstList_PLM_WaveBeamShotBlock_1:
    dw Instruction_PLM_Call_Y                                            ;84EB42;
    dw InstList_PLM_Callable_ItemShotBlock                               ;84EB44;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84EB46;
    dw InstList_PLM_WaveBeamShotBlock_4                                  ;84EB48;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84EB4A;
    dw InstList_PLM_WaveBeamShotBlock_3                                  ;84EB4C;
    dw Instruction_PLM_PreInstruction_inY                                ;84EB4E;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84EB50;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84EB52;
    db $16                                                               ;84EB54;

InstList_PLM_WaveBeamShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0                                    ;84EB55;
    dw Instruction_PLM_DrawItemFrame1                                    ;84EB57;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84EB59;
    dw InstList_PLM_WaveBeamShotBlock_2                                  ;84EB5B;
    dw Instruction_PLM_Call_Y                                            ;84EB5D;
    dw InstList_PLM_Callable_ItemShotBlockReconcealing                   ;84EB5F;
    dw Instruction_PLM_GotoY                                             ;84EB61;
    dw InstList_PLM_WaveBeamShotBlock_1                                  ;84EB63;

InstList_PLM_WaveBeamShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84EB65;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84EB67;
    db $02                                                               ;84EB69;
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox                      ;84EB6A;
    dw $0001                                                             ;84EB6C;
    db $10                                                               ;84EB6E;

InstList_PLM_WaveBeamShotBlock_4:
    dw Instruction_PLM_Call_Y                                            ;84EB6F;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0            ;84EB71;
    dw Instruction_PLM_GotoY                                             ;84EB73;
    dw InstList_PLM_WaveBeamShotBlock_1                                  ;84EB75;

InstList_PLM_SpazerShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84EB77;
    dw ItemPLMGFX_Spazer                                                 ;84EB79;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84EB7B;

InstList_PLM_SpazerShotBlock_1:
    dw Instruction_PLM_Call_Y                                            ;84EB83;
    dw InstList_PLM_Callable_ItemShotBlock                               ;84EB85;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84EB87;
    dw InstList_PLM_SpazerShotBlock_4                                    ;84EB89;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84EB8B;
    dw InstList_PLM_SpazerShotBlock_3                                    ;84EB8D;
    dw Instruction_PLM_PreInstruction_inY                                ;84EB8F;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84EB91;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84EB93;
    db $16                                                               ;84EB95;

InstList_PLM_SpazerShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0                                    ;84EB96;
    dw Instruction_PLM_DrawItemFrame1                                    ;84EB98;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84EB9A;
    dw InstList_PLM_SpazerShotBlock_2                                    ;84EB9C;
    dw Instruction_PLM_Call_Y                                            ;84EB9E;
    dw InstList_PLM_Callable_ItemShotBlockReconcealing                   ;84EBA0;
    dw Instruction_PLM_GotoY                                             ;84EBA2;
    dw InstList_PLM_SpazerShotBlock_1                                    ;84EBA4;

InstList_PLM_SpazerShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84EBA6;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84EBA8;
    db $02                                                               ;84EBAA;
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox                      ;84EBAB;
    dw $0004                                                             ;84EBAD;
    db $11                                                               ;84EBAF;

InstList_PLM_SpazerShotBlock_4:
    dw Instruction_PLM_Call_Y                                            ;84EBB0;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0            ;84EBB2;
    dw Instruction_PLM_GotoY                                             ;84EBB4;
    dw InstList_PLM_SpazerShotBlock_1                                    ;84EBB6;

InstList_PLM_SpringBallShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84EBB8;
    dw ItemPLMGFX_SpringBall                                             ;84EBBA;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84EBBC;

InstList_PLM_SpringBallShotBlock_1:
    dw Instruction_PLM_Call_Y                                            ;84EBC4;
    dw InstList_PLM_Callable_ItemShotBlock                               ;84EBC6;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84EBC8;
    dw InstList_PLM_SpringBallShotBlock_4                                ;84EBCA;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84EBCC;
    dw InstList_PLM_SpringBallShotBlock_3                                ;84EBCE;
    dw Instruction_PLM_PreInstruction_inY                                ;84EBD0;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84EBD2;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84EBD4;
    db $16                                                               ;84EBD6;

InstList_PLM_SpringBallShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0                                    ;84EBD7;
    dw Instruction_PLM_DrawItemFrame1                                    ;84EBD9;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84EBDB;
    dw InstList_PLM_SpringBallShotBlock_2                                ;84EBDD;
    dw Instruction_PLM_Call_Y                                            ;84EBDF;
    dw InstList_PLM_Callable_ItemShotBlockReconcealing                   ;84EBE1;
    dw Instruction_PLM_GotoY                                             ;84EBE3;
    dw InstList_PLM_SpringBallShotBlock_1                                ;84EBE5;

InstList_PLM_SpringBallShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84EBE7;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84EBE9;
    db $02                                                               ;84EBEB;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84EBEC;
    dw $0002                                                             ;84EBEE;
    db $08                                                               ;84EBF0;

InstList_PLM_SpringBallShotBlock_4:
    dw Instruction_PLM_Call_Y                                            ;84EBF1;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0            ;84EBF3;
    dw Instruction_PLM_GotoY                                             ;84EBF5;
    dw InstList_PLM_SpringBallShotBlock_1                                ;84EBF7;

InstList_PLM_VariaSuitShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84EBF9;
    dw ItemPLMGFX_VariaSuit                                              ;84EBFB;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84EBFD;

InstList_PLM_VariaSuitShotBlock_1:
    dw Instruction_PLM_Call_Y                                            ;84EC05;
    dw InstList_PLM_Callable_ItemShotBlock                               ;84EC07;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84EC09;
    dw InstList_PLM_VariaSuitShotBlock_4                                 ;84EC0B;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84EC0D;
    dw InstList_PLM_VariaSuitShotBlock_3                                 ;84EC0F;
    dw Instruction_PLM_PreInstruction_inY                                ;84EC11;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84EC13;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84EC15;
    db $16                                                               ;84EC17;

InstList_PLM_VariaSuitShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0                                    ;84EC18;
    dw Instruction_PLM_DrawItemFrame1                                    ;84EC1A;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84EC1C;
    dw InstList_PLM_VariaSuitShotBlock_2                                 ;84EC1E;
    dw Instruction_PLM_Call_Y                                            ;84EC20;
    dw InstList_PLM_Callable_ItemShotBlockReconcealing                   ;84EC22;
    dw Instruction_PLM_GotoY                                             ;84EC24;
    dw InstList_PLM_VariaSuitShotBlock_1                                 ;84EC26;

InstList_PLM_VariaSuitShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84EC28;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84EC2A;
    db $02                                                               ;84EC2C;
    dw Instruction_PLM_ClearChargeBeamCounter                            ;84EC2D;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84EC2F;
    dw $0001                                                             ;84EC31;
    db $07                                                               ;84EC33;
    dw Instruction_PLM_CallFunctionInY                                   ;84EC34;
    dl VariaSuit_Pickup                                                  ;84EC36;

InstList_PLM_VariaSuitShotBlock_4:
    dw Instruction_PLM_Call_Y                                            ;84EC39;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0            ;84EC3B;
    dw Instruction_PLM_GotoY                                             ;84EC3D;
    dw InstList_PLM_VariaSuitShotBlock_1                                 ;84EC3F;

InstList_PLM_GravitySuitShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84EC41;
    dw ItemPLMGFX_GravitySuit                                            ;84EC43;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84EC45;

InstList_PLM_GravitySuitShotBlock_1:
    dw Instruction_PLM_Call_Y                                            ;84EC4D;
    dw InstList_PLM_Callable_ItemShotBlock                               ;84EC4F;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84EC51;
    dw InstList_PLM_GravitySuitShotBlock_4                               ;84EC53;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84EC55;
    dw InstList_PLM_GravitySuitShotBlock_3                               ;84EC57;
    dw Instruction_PLM_PreInstruction_inY                                ;84EC59;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84EC5B;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84EC5D;
    db $16                                                               ;84EC5F;

InstList_PLM_GravitySuitShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0                                    ;84EC60;
    dw Instruction_PLM_DrawItemFrame1                                    ;84EC62;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84EC64;
    dw InstList_PLM_GravitySuitShotBlock_2                               ;84EC66;
    dw Instruction_PLM_Call_Y                                            ;84EC68;
    dw InstList_PLM_Callable_ItemShotBlockReconcealing                   ;84EC6A;
    dw Instruction_PLM_GotoY                                             ;84EC6C;
    dw InstList_PLM_GravitySuitShotBlock_1                               ;84EC6E;

InstList_PLM_GravitySuitShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84EC70;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84EC72;
    db $02                                                               ;84EC74;
    dw Instruction_PLM_ClearChargeBeamCounter                            ;84EC75;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84EC77;
    dw $0020                                                             ;84EC79;
    db $1A                                                               ;84EC7B;
    dw Instruction_PLM_CallFunctionInY                                   ;84EC7C;
    dl GravitySuit_Pickup                                                ;84EC7E;

InstList_PLM_GravitySuitShotBlock_4:
    dw Instruction_PLM_Call_Y                                            ;84EC81;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0            ;84EC83;
    dw Instruction_PLM_GotoY                                             ;84EC85;
    dw InstList_PLM_GravitySuitShotBlock_1                               ;84EC87;

InstList_PLM_XrayScopeShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84EC89;
    dw ItemPLMGFX_XrayScope                                              ;84EC8B;
    db $01,$01,$00,$00,$03,$03,$00,$00                                   ;84EC8D;

InstList_PLM_XrayScopeShotBlock_1:
    dw Instruction_PLM_Call_Y                                            ;84EC95;
    dw InstList_PLM_Callable_ItemShotBlock                               ;84EC97;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84EC99;
    dw InstList_PLM_XrayScopeShotBlock_4                                 ;84EC9B;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84EC9D;
    dw InstList_PLM_XrayScopeShotBlock_3                                 ;84EC9F;
    dw Instruction_PLM_PreInstruction_inY                                ;84ECA1;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84ECA3;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84ECA5;
    db $16                                                               ;84ECA7;

InstList_PLM_XrayScopeShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0                                    ;84ECA8;
    dw Instruction_PLM_DrawItemFrame1                                    ;84ECAA;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84ECAC;
    dw InstList_PLM_XrayScopeShotBlock_2                                 ;84ECAE;
    dw Instruction_PLM_Call_Y                                            ;84ECB0;
    dw InstList_PLM_Callable_ItemShotBlockReconcealing                   ;84ECB2;
    dw Instruction_PLM_GotoY                                             ;84ECB4;
    dw InstList_PLM_XrayScopeShotBlock_1                                 ;84ECB6;

InstList_PLM_XrayScopeShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84ECB8;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84ECBA;
    db $02                                                               ;84ECBC;
    dw Inst_PLM_PickUpEquipment_AddXrayToHUD_DisplayMessageBox           ;84ECBD;
    dw $8000                                                             ;84ECBF;

InstList_PLM_XrayScopeShotBlock_4:
    dw Instruction_PLM_Call_Y                                            ;84ECC1;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0            ;84ECC3;
    dw Instruction_PLM_GotoY                                             ;84ECC5;
    dw InstList_PLM_XrayScopeShotBlock_1                                 ;84ECC7;

InstList_PLM_PlasmaBeamShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84ECC9;
    dw ItemPLMGFX_PlasmaBeam                                             ;84ECCB;
    db $00,$01,$00,$00,$00,$01,$00,$00                                   ;84ECCD;

InstList_PLM_PlasmaBeamShotBlock_1:
    dw Instruction_PLM_Call_Y                                            ;84ECD5;
    dw InstList_PLM_Callable_ItemShotBlock                               ;84ECD7;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84ECD9;
    dw InstList_PLM_PlasmaBeamShotBlock_4                                ;84ECDB;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84ECDD;
    dw InstList_PLM_PlasmaBeamShotBlock_3                                ;84ECDF;
    dw Instruction_PLM_PreInstruction_inY                                ;84ECE1;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84ECE3;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84ECE5;
    db $16                                                               ;84ECE7;

InstList_PLM_PlasmaBeamShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0                                    ;84ECE8;
    dw Instruction_PLM_DrawItemFrame1                                    ;84ECEA;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84ECEC;
    dw InstList_PLM_PlasmaBeamShotBlock_2                                ;84ECEE;
    dw Instruction_PLM_Call_Y                                            ;84ECF0;
    dw InstList_PLM_Callable_ItemShotBlockReconcealing                   ;84ECF2;
    dw Instruction_PLM_GotoY                                             ;84ECF4;
    dw InstList_PLM_PlasmaBeamShotBlock_1                                ;84ECF6;

InstList_PLM_PlasmaBeamShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84ECF8;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84ECFA;
    db $02                                                               ;84ECFC;
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox                      ;84ECFD;
    dw $0008                                                             ;84ECFF;
    db $12                                                               ;84ED01;

InstList_PLM_PlasmaBeamShotBlock_4:
    dw Instruction_PLM_Call_Y                                            ;84ED02;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0            ;84ED04;
    dw Instruction_PLM_GotoY                                             ;84ED06;
    dw InstList_PLM_PlasmaBeamShotBlock_1                                ;84ED08;

InstList_PLM_GrappleBeamShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84ED0A;
    dw ItemPLMGFX_GrappleBeam                                            ;84ED0C;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84ED0E;

InstList_PLM_GrappleBeamShotBlock_1:
    dw Instruction_PLM_Call_Y                                            ;84ED16;
    dw InstList_PLM_Callable_ItemShotBlock                               ;84ED18;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84ED1A;
    dw InstList_PLM_GrappleBeamShotBlock_4                               ;84ED1C;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84ED1E;
    dw InstList_PLM_GrappleBeamShotBlock_3                               ;84ED20;
    dw Instruction_PLM_PreInstruction_inY                                ;84ED22;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84ED24;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84ED26;
    db $16                                                               ;84ED28;

InstList_PLM_GrappleBeamShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0                                    ;84ED29;
    dw Instruction_PLM_DrawItemFrame1                                    ;84ED2B;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84ED2D;
    dw InstList_PLM_GrappleBeamShotBlock_2                               ;84ED2F;
    dw Instruction_PLM_Call_Y                                            ;84ED31;
    dw InstList_PLM_Callable_ItemShotBlockReconcealing                   ;84ED33;
    dw Instruction_PLM_GotoY                                             ;84ED35;
    dw InstList_PLM_GrappleBeamShotBlock_1                               ;84ED37;

InstList_PLM_GrappleBeamShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84ED39;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84ED3B;
    db $02                                                               ;84ED3D;
    dw Inst_PLM_PickUpEquipment_AddGrappleHUD_DisplayMessageBox          ;84ED3E;
    dw $4000                                                             ;84ED40;

InstList_PLM_GrappleBeamShotBlock_4:
    dw Instruction_PLM_Call_Y                                            ;84ED42;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0            ;84ED44;
    dw Instruction_PLM_GotoY                                             ;84ED46;
    dw InstList_PLM_GrappleBeamShotBlock_1                               ;84ED48;

InstList_PLM_SpaceJumpShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84ED4A;
    dw ItemPLMGFX_SpaceJump                                              ;84ED4C;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84ED4E;

InstList_PLM_SpaceJumpShotBlock_1:
    dw Instruction_PLM_Call_Y                                            ;84ED56;
    dw InstList_PLM_Callable_ItemShotBlock                               ;84ED58;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84ED5A;
    dw InstList_PLM_SpaceJumpShotBlock_4                                 ;84ED5C;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84ED5E;
    dw InstList_PLM_SpaceJumpShotBlock_3                                 ;84ED60;
    dw Instruction_PLM_PreInstruction_inY                                ;84ED62;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84ED64;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84ED66;
    db $16                                                               ;84ED68;

InstList_PLM_SpaceJumpShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0                                    ;84ED69;
    dw Instruction_PLM_DrawItemFrame1                                    ;84ED6B;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84ED6D;
    dw InstList_PLM_SpaceJumpShotBlock_2                                 ;84ED6F;
    dw Instruction_PLM_Call_Y                                            ;84ED71;
    dw InstList_PLM_Callable_ItemShotBlockReconcealing                   ;84ED73;
    dw Instruction_PLM_GotoY                                             ;84ED75;
    dw InstList_PLM_SpaceJumpShotBlock_1                                 ;84ED77;

InstList_PLM_SpaceJumpShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84ED79;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84ED7B;
    db $02                                                               ;84ED7D;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84ED7E;
    dw $0200                                                             ;84ED80;
    db $0C                                                               ;84ED82;

InstList_PLM_SpaceJumpShotBlock_4:
    dw Instruction_PLM_Call_Y                                            ;84ED83;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0            ;84ED85;
    dw Instruction_PLM_GotoY                                             ;84ED87;
    dw InstList_PLM_SpaceJumpShotBlock_1                                 ;84ED89;

InstList_PLM_ScrewAttackShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84ED8B;
    dw ItemPLMGFX_ScrewAttack                                            ;84ED8D;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84ED8F;

InstList_PLM_ScrewAttackShotBlock_1:
    dw Instruction_PLM_Call_Y                                            ;84ED97;
    dw InstList_PLM_Callable_ItemShotBlock                               ;84ED99;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84ED9B;
    dw InstList_PLM_ScrewAttackShotBlock_4                               ;84ED9D;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84ED9F;
    dw InstList_PLM_ScrewAttackShotBlock_3                               ;84EDA1;
    dw Instruction_PLM_PreInstruction_inY                                ;84EDA3;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84EDA5;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84EDA7;
    db $16                                                               ;84EDA9;

InstList_PLM_ScrewAttackShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0                                    ;84EDAA;
    dw Instruction_PLM_DrawItemFrame1                                    ;84EDAC;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84EDAE;
    dw InstList_PLM_ScrewAttackShotBlock_2                               ;84EDB0;
    dw Instruction_PLM_Call_Y                                            ;84EDB2;
    dw InstList_PLM_Callable_ItemShotBlockReconcealing                   ;84EDB4;
    dw Instruction_PLM_GotoY                                             ;84EDB6;
    dw InstList_PLM_ScrewAttackShotBlock_1                               ;84EDB8;

InstList_PLM_ScrewAttackShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84EDBA;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84EDBC;
    db $02                                                               ;84EDBE;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84EDBF;
    dw $0008                                                             ;84EDC1;
    db $0A                                                               ;84EDC3;

InstList_PLM_ScrewAttackShotBlock_4:
    dw Instruction_PLM_Call_Y                                            ;84EDC4;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0            ;84EDC6;
    dw Instruction_PLM_GotoY                                             ;84EDC8;
    dw InstList_PLM_ScrewAttackShotBlock_1                               ;84EDCA;

InstList_PLM_MorphBallShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84EDCC;
    dw ItemPLMGFX_MorphBall                                              ;84EDCE;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84EDD0;

InstList_PLM_MorphBallShotBlock_1:
    dw Instruction_PLM_Call_Y                                            ;84EDD8;
    dw InstList_PLM_Callable_ItemShotBlock                               ;84EDDA;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84EDDC;
    dw InstList_PLM_MorphBallShotBlock_4                                 ;84EDDE;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84EDE0;
    dw InstList_PLM_MorphBallShotBlock_3                                 ;84EDE2;
    dw Instruction_PLM_PreInstruction_inY                                ;84EDE4;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84EDE6;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84EDE8;
    db $16                                                               ;84EDEA;

InstList_PLM_MorphBallShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0                                    ;84EDEB;
    dw Instruction_PLM_DrawItemFrame1                                    ;84EDED;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84EDEF;
    dw InstList_PLM_MorphBallShotBlock_2                                 ;84EDF1;
    dw Instruction_PLM_Call_Y                                            ;84EDF3;
    dw InstList_PLM_Callable_ItemShotBlockReconcealing                   ;84EDF5;
    dw Instruction_PLM_GotoY                                             ;84EDF7;
    dw InstList_PLM_MorphBallShotBlock_1                                 ;84EDF9;

InstList_PLM_MorphBallShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84EDFB;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84EDFD;
    db $02                                                               ;84EDFF;
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox                 ;84EE00;
    dw $0002                                                             ;84EE02;
    db $09                                                               ;84EE04;

InstList_PLM_MorphBallShotBlock_4:
    dw Instruction_PLM_Call_Y                                            ;84EE05;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0            ;84EE07;
    dw Instruction_PLM_GotoY                                             ;84EE09;
    dw InstList_PLM_MorphBallShotBlock_1                                 ;84EE0B;

InstList_PLM_ReserveTankShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX                                    ;84EE0D;
    dw ItemPLMGFX_ReserveTank                                            ;84EE0F;
    db $00,$00,$00,$00,$00,$00,$00,$00                                   ;84EE11;

InstList_PLM_ReserveTankShotBlock_1:
    dw Instruction_PLM_Call_Y                                            ;84EE19;
    dw InstList_PLM_Callable_ItemShotBlock                               ;84EE1B;
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected                   ;84EE1D;
    dw InstList_PLM_ReserveTankShotBlock_4                               ;84EE1F;
    dw Instruction_PLM_LinkInstruction_Y                                 ;84EE21;
    dw InstList_PLM_ReserveTankShotBlock_3                               ;84EE23;
    dw Instruction_PLM_PreInstruction_inY                                ;84EE25;
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered                 ;84EE27;
    dw Instruction_PLM_TimerEqualsY_8Bit                                 ;84EE29;
    db $16                                                               ;84EE2B;

InstList_PLM_ReserveTankShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0                                    ;84EE2C;
    dw Instruction_PLM_DrawItemFrame1                                    ;84EE2E;
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero                     ;84EE30;
    dw InstList_PLM_ReserveTankShotBlock_2                               ;84EE32;
    dw Instruction_PLM_Call_Y                                            ;84EE34;
    dw InstList_PLM_Callable_ItemShotBlockReconcealing                   ;84EE36;
    dw Instruction_PLM_GotoY                                             ;84EE38;
    dw InstList_PLM_ReserveTankShotBlock_1                               ;84EE3A;

InstList_PLM_ReserveTankShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected                          ;84EE3C;
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack                   ;84EE3E;
    db $02                                                               ;84EE40;
    dw Instruction_PLM_CollectHealth_ReserveTank                         ;84EE41;
    dw $0064                                                             ;84EE43;

InstList_PLM_ReserveTankShotBlock_4:
    dw Instruction_PLM_Call_Y                                            ;84EE45;
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0            ;84EE47;
    dw Instruction_PLM_GotoY                                             ;84EE49;
    dw InstList_PLM_ReserveTankShotBlock_1                               ;84EE4B;

Setup_EnergyTank:
    LDA.W #$0008                                                         ;84EE4D;
    BRA SetPLMItemGFXIndex_DoAbilitySetup                                ;84EE50;


Setup_MissileTank:
    LDA.W #$000A                                                         ;84EE52;
    BRA SetPLMItemGFXIndex_DoAbilitySetup                                ;84EE55;


Setup_SuperMissileTank:
    LDA.W #$000C                                                         ;84EE57;
    BRA SetPLMItemGFXIndex_DoAbilitySetup                                ;84EE5A;


Setup_PowerBombTank:
    LDA.W #$000E                                                         ;84EE5C;

SetPLMItemGFXIndex_DoAbilitySetup:
    TYX                                                                  ;84EE5F;
    STA.L $7EDF0C,X                                                      ;84EE60;

Setup_Ability:
    LDX.W $1C87,Y                                                        ;84EE64;
    LDA.W #$0045                                                         ;84EE67;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84EE6A;
    LDA.L $7ED91A                                                        ;84EE6D;
    INC A                                                                ;84EE71;
    STA.L $7ED91A                                                        ;84EE72;
    RTS                                                                  ;84EE76;


Setup_EnergyTankShotBlock:
    LDA.W #$0008                                                         ;84EE77;
    BRA SetPLMItemGFXINdex_DoAbilityShotBlockSetup                       ;84EE7A;


SetupMissileTankShotBlock:
    LDA.W #$000A                                                         ;84EE7C;
    BRA SetPLMItemGFXINdex_DoAbilityShotBlockSetup                       ;84EE7F;


Setup_SuperMissileTankShotBlock:
    LDA.W #$000C                                                         ;84EE81;
    BRA SetPLMItemGFXINdex_DoAbilityShotBlockSetup                       ;84EE84;


Setup_PowerBombTankShotBlock:
    LDA.W #$000E                                                         ;84EE86;

SetPLMItemGFXINdex_DoAbilityShotBlockSetup:
    TYX                                                                  ;84EE89;
    STA.L $7EDF0C,X                                                      ;84EE8A;

Setup_AbilityShotBlock:
    LDX.W $1C87,Y                                                        ;84EE8E;
    LDA.W #$C045                                                         ;84EE91;
    JSR.W Write_Level_Data_Block_Type_and_BTS                            ;84EE94;
    LDX.W $1C87,Y                                                        ;84EE97;
    LDA.L $7F0002,X                                                      ;84EE9A;
    STA.W $1E17,Y                                                        ;84EE9E;
    LDA.L $7ED91A                                                        ;84EEA1;
    INC A                                                                ;84EEA5;
    STA.L $7ED91A                                                        ;84EEA6;
    RTS                                                                  ;84EEAA;


Setup_ItemCollisionDetection:
    LDA.W $0A78                                                          ;84EEAB;
    BNE .delete                                                          ;84EEAE;
    TYX                                                                  ;84EEB0;
    LDA.W $1C87,X                                                        ;84EEB1;
    STZ.W $1C87,X                                                        ;84EEB4;
    LDX.W #$004E                                                         ;84EEB7;

.loop:
    CMP.W $1C87,X                                                        ;84EEBA;
    BEQ .found                                                           ;84EEBD;
    DEX                                                                  ;84EEBF;
    DEX                                                                  ;84EEC0;
    BPL .loop                                                            ;84EEC1;
    db $00                                                               ;84EEC3; BRK with no operand

.found:
    LDA.W #$00FF                                                         ;84EEC4;
    STA.W $1D77,X                                                        ;84EEC7;
    CLC                                                                  ;84EECA;
    RTS                                                                  ;84EECB;


.delete:
    LDA.W #$0000                                                         ;84EECC;
    STA.W $1C37,Y                                                        ;84EECF;
    RTS                                                                  ;84EED2;


PLMEntries_ItemCollisionDetection:
    dw Setup_ItemCollisionDetection                                      ;84EED3;
    dw InstList_PLM_Delete                                               ;84EED5;

PLMEntries_EnergyTank:
    dw Setup_EnergyTank                                                  ;84EED7;
    dw InstList_PLM_EnergyTank_0                                         ;84EED9;

PLMEntries_MissileTank:
    dw Setup_MissileTank                                                 ;84EEDB;
    dw InstList_PLM_MissileTank_0                                        ;84EEDD;

PLMEntries_SuperMissileTank:
    dw Setup_SuperMissileTank                                            ;84EEDF;
    dw InstList_PLM_SuperMissileTank_0                                   ;84EEE1;

PLMEntries_PowerBombTank:
    dw Setup_PowerBombTank                                               ;84EEE3;
    dw InstList_PLM_PowerBombTank_0                                      ;84EEE5;

PLMEntries_Bombs:
    dw Setup_Ability                                                     ;84EEE7;
    dw InstList_PLM_Bombs_0                                              ;84EEE9;

PLMEntries_ChargeBeam:
    dw Setup_Ability                                                     ;84EEEB;
    dw InstList_PLM_ChargeBeam_0                                         ;84EEED;

PLMEntries_IceBeam:
    dw Setup_Ability                                                     ;84EEEF;
    dw InstList_PLM_IceBeam_0                                            ;84EEF1;

PLMEntries_HiJumpBoots:
    dw Setup_Ability                                                     ;84EEF3;
    dw InstList_PLM_HiJumpBoots_0                                        ;84EEF5;

PLMEntries_SpeedBooster:
    dw Setup_Ability                                                     ;84EEF7;
    dw InstList_PLM_SpeedBooster_0                                       ;84EEF9;

PLMEntries_WaveBeam:
    dw Setup_Ability                                                     ;84EEFB;
    dw InstList_PLM_WaveBeam_0                                           ;84EEFD;

PLMEntries_Spazer:
    dw Setup_Ability                                                     ;84EEFF;
    dw InstList_PLM_Spazer_0                                             ;84EF01;

PLMEntries_SpringBall:
    dw Setup_Ability                                                     ;84EF03;
    dw InstList_PLM_SpringBall_0                                         ;84EF05;

PLMEntries_VariaSuit:
    dw Setup_Ability                                                     ;84EF07;
    dw InstList_PLM_VariaSuit_0                                          ;84EF09;

PLMEntries_GravitySuit:
    dw Setup_Ability                                                     ;84EF0B;
    dw InstList_PLM_GravitySuit_0                                        ;84EF0D;

PLMEntries_XrayScope:
    dw Setup_Ability                                                     ;84EF0F;
    dw InstList_PLM_XrayScope_0                                          ;84EF11;

PLMEntries_PlasmaBeam:
    dw Setup_Ability                                                     ;84EF13;
    dw InstList_PLM_PlasmaBeam_0                                         ;84EF15;

PLMEntries_GrappleBeam:
    dw Setup_Ability                                                     ;84EF17;
    dw InstList_PLM_GrappleBeam_0                                        ;84EF19;

PLMEntries_SpaceJump:
    dw Setup_Ability                                                     ;84EF1B;
    dw InstList_PLM_SpaceJump_0                                          ;84EF1D;

PLMEntries_ScrewAttack:
    dw Setup_Ability                                                     ;84EF1F;
    dw InstList_PLM_ScrewAttack_0                                        ;84EF21;

PLMEntries_MorphBall:
    dw Setup_Ability                                                     ;84EF23;
    dw InstList_PLM_MorphBall_0                                          ;84EF25;

PLMEntries_ReserveTank:
    dw Setup_Ability                                                     ;84EF27;
    dw InstList_PLM_ReserveTank_0                                        ;84EF29;

PLMEntries_EnergyTankChozoOrb:
    dw Setup_EnergyTank                                                  ;84EF2B;
    dw InstList_PLM_EnergyTankChozoOrb_0                                 ;84EF2D;

PLMEntries_MissileTankChozoOrb:
    dw Setup_MissileTank                                                 ;84EF2F;
    dw InstList_PLM_MissileTankChozoOrb_0                                ;84EF31;

PLMEntries_SuperMissileTankChozoOrb:
    dw Setup_SuperMissileTank                                            ;84EF33;
    dw InstList_PLM_SuperMissileTankChozoOrb_0                           ;84EF35;

PLMEntries_PowerBombTankChozoOrb:
    dw Setup_PowerBombTank                                               ;84EF37;
    dw InstList_PLM_PowerBombTankChozoOrb_0                              ;84EF39;

PLMEntries_BombsChozoOrb:
    dw Setup_Ability                                                     ;84EF3B;
    dw InstList_PLM_BombsChozoOrb_0                                      ;84EF3D;

PLMEntries_ChargeBeamChozoOrb:
    dw Setup_Ability                                                     ;84EF3F;
    dw InstList_PLM_ChargeBeamChozoOrb_0                                 ;84EF41;

PLMEntries_IceBeamChozoOrb:
    dw Setup_Ability                                                     ;84EF43;
    dw InstList_PLM_IceBeamChozoOrb_0                                    ;84EF45;

PLMEntries_HiJumpBootsChozoOrb:
    dw Setup_Ability                                                     ;84EF47;
    dw InstList_PLM_HiJumpBootsChozoOrb_0                                ;84EF49;

PLMEntries_SpeedBoosterChozoOrb:
    dw Setup_Ability                                                     ;84EF4B;
    dw InstList_PLM_SpeedBoosterChozoOrb_0                               ;84EF4D;

PLMEntries_WaveBeamChozoOrb:
    dw Setup_Ability                                                     ;84EF4F;
    dw InstList_PLM_WaveBeamChozoOrb_0                                   ;84EF51;

PLMEntries_SpazerChozoOrb:
    dw Setup_Ability                                                     ;84EF53;
    dw InstList_PLM_SpazerChozoOrb_0                                     ;84EF55;

PLMEntries_SpringBallChozoOrb:
    dw Setup_Ability                                                     ;84EF57;
    dw InstList_PLM_SpringBallChozoOrb_0                                 ;84EF59;

PLMEntries_VariaSuitChozoOrb:
    dw Setup_Ability                                                     ;84EF5B;
    dw InstList_PLM_VariaSuitChozoOrb_0                                  ;84EF5D;

PLMEntries_GravitySuitChozoOrb:
    dw Setup_Ability                                                     ;84EF5F;
    dw InstList_PLM_GravitySuitChozoOrb_0                                ;84EF61;

PLMEntries_XrayScopeChozoOrb:
    dw Setup_Ability                                                     ;84EF63;
    dw InstList_PLM_XrayScopeChozoOrb_0                                  ;84EF65;

PLMEntries_PlasmaBeamChozoOrb:
    dw Setup_Ability                                                     ;84EF67;
    dw InstList_PLM_PlasmaBeamChozoOrb_0                                 ;84EF69;

PLMEntries_GrappleBeamChozoOrb:
    dw Setup_Ability                                                     ;84EF6B;
    dw InstList_PLM_GrappleBeamChozoOrb_0                                ;84EF6D;

PLMEntries_SpaceJumpChozoOrb:
    dw Setup_Ability                                                     ;84EF6F;
    dw InstList_PLM_SpaceJumpChozoOrb_0                                  ;84EF71;

PLMEntries_ScrewAttackChozoOrb:
    dw Setup_Ability                                                     ;84EF73;
    dw InstList_PLM_ScrewAttackChozoOrb_0                                ;84EF75;

PLMEntries_MorphBallChozoOrb:
    dw Setup_Ability                                                     ;84EF77;
    dw InstList_PLM_MorphBallChozoOrb_0                                  ;84EF79;

PLMEntries_ReserveTankChozoOrb:
    dw Setup_Ability                                                     ;84EF7B;
    dw InstList_PLM_ReserveTankChozoOrb_0                                ;84EF7D;

PLMEntries_EnergyTankShotBlock:
    dw Setup_EnergyTankShotBlock                                         ;84EF7F;
    dw InstList_PLM_EnergyTankShotBlock_0                                ;84EF81;

PLMEntries_MissileTankShotBlock:
    dw SetupMissileTankShotBlock                                         ;84EF83;
    dw InstList_PLM_MissileTankShotBlock_0                               ;84EF85;

PLMEntries_SuperMissileTankShotBlock:
    dw Setup_SuperMissileTankShotBlock                                   ;84EF87;
    dw InstList_PLM_SuperMissileTankShotBlock_0                          ;84EF89;

PLMEntries_PowerBombTankShotBlock:
    dw Setup_PowerBombTankShotBlock                                      ;84EF8B;
    dw InstList_PLM_PowerBombTankShotBlock_0                             ;84EF8D;

PLMEntries_BombsShotBlock:
    dw Setup_AbilityShotBlock                                            ;84EF8F;
    dw InstList_PLM_BombsShotBlock_0                                     ;84EF91;

PLMEntries_ChargeBeamShotBlock:
    dw Setup_AbilityShotBlock                                            ;84EF93;
    dw InstList_PLM_ChargeBeamShotBlock_0                                ;84EF95;

PLMEntries_IceBeamShotBlock:
    dw Setup_AbilityShotBlock                                            ;84EF97;
    dw InstList_PLM_IceBeamShotBlock_0                                   ;84EF99;

PLMEntries_HiJumpBootsShotBlock:
    dw Setup_AbilityShotBlock                                            ;84EF9B;
    dw InstList_PLM_HiJumpBootsShotBlock_0                               ;84EF9D;

PLMEntries_SpeedBoosterShotBlock:
    dw Setup_AbilityShotBlock                                            ;84EF9F;
    dw InstList_PLM_SpeedBoosterShotBlock_0                              ;84EFA1;

PLMEntries_WaveBeamShotBlock:
    dw Setup_AbilityShotBlock                                            ;84EFA3;
    dw InstList_PLM_WaveBeamShotBlock_0                                  ;84EFA5;

PLMEntries_SpazerShotBlock:
    dw Setup_AbilityShotBlock                                            ;84EFA7;
    dw InstList_PLM_SpazerShotBlock_0                                    ;84EFA9;

PLMEntries_SpringBallShotBlock:
    dw Setup_AbilityShotBlock                                            ;84EFAB;
    dw InstList_PLM_SpringBallShotBlock_0                                ;84EFAD;

PLMEntries_VariaSuitShotBlock:
    dw Setup_AbilityShotBlock                                            ;84EFAF;
    dw InstList_PLM_VariaSuitShotBlock_0                                 ;84EFB1;

PLMEntries_GravitySuitShotBlock:
    dw Setup_AbilityShotBlock                                            ;84EFB3;
    dw InstList_PLM_GravitySuitShotBlock_0                               ;84EFB5;

PLMEntries_XrayScopeShotBlock:
    dw Setup_AbilityShotBlock                                            ;84EFB7;
    dw InstList_PLM_XrayScopeShotBlock_0                                 ;84EFB9;

PLMEntries_PlasmaBeamShotBlock:
    dw Setup_AbilityShotBlock                                            ;84EFBB;
    dw InstList_PLM_PlasmaBeamShotBlock_0                                ;84EFBD;

PLMEntries_GrappleBeamShotBlock:
    dw Setup_AbilityShotBlock                                            ;84EFBF;
    dw InstList_PLM_GrappleBeamShotBlock_0                               ;84EFC1;

PLMEntries_SpaceJumpShotBlock:
    dw Setup_AbilityShotBlock                                            ;84EFC3;
    dw InstList_PLM_SpaceJumpShotBlock_0                                 ;84EFC5;

PLMEntries_ScrewAttackShotBlock:
    dw Setup_AbilityShotBlock                                            ;84EFC7;
    dw InstList_PLM_ScrewAttackShotBlock_0                               ;84EFC9;

PLMEntries_MorphBallShotBlock:
    dw Setup_AbilityShotBlock                                            ;84EFCB;
    dw InstList_PLM_MorphBallShotBlock_0                                 ;84EFCD;

PLMEntries_ReserveTankShotBlock:
    dw Setup_AbilityShotBlock                                            ;84EFCF;
    dw InstList_PLM_ReserveTankShotBlock_0                               ;84EFD1;

Freespace_Bank84_EFD3:                                                   ;84EFD3;
; $102D bytes
