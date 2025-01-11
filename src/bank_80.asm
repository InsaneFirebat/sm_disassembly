
org $808000


Debug_RegionSRAM:
    dw $0000                                                             ;808000; Skip NTSC/PAL and SRAM mapping check ($85F6)

DebugConst_DemoRecorder:
    dw $0000                                                             ;808002; Demo recorder ($90:E759)

DebugConst_DebugMode:
    dw $0000                                                             ;808004; Debug mode, written to $05D1 on boot

DebugConst_DebugScrolling:
    dw $0000                                                             ;808006; Debug scrolling ($82:8B44: game state 8 - main gameplay)

DebugConst_DisableAudio:
    dw $0000                                                             ;808008; Disable audio ($80:8024)

incsrc "apu_upload.asm"

GenerateRandomNumber:
    SEP #$20                                                             ;808111;
    LDA.W $05E5                                                          ;808113;
    STA.W HW_WRMPYA                                                      ;808116;
    LDA.B #$05                                                           ;808119;
    STA.W HW_WRMPYB                                                      ;80811B;
    NOP                                                                  ;80811E; A = [random number low] * 5
    REP #$20                                                             ;80811F;
    LDA.W HW_RDMPY                                                       ;808121; A += ([random number high] * 5 + 1) * 100h
    PHA                                                                  ;808124;
    SEP #$20                                                             ;808125;
    LDA.W $05E6                                                          ;808127;
    STA.W HW_WRMPYA                                                      ;80812A;
    LDA.B #$05                                                           ;80812D;
    STA.W HW_WRMPYB                                                      ;80812F;
    XBA                                                                  ;808132;
    NOP                                                                  ;808133;
    LDA.W HW_RDMPY                                                       ;808134; A += ([random number high] * 5 + 1) * 100h
    SEC                                                                  ;808137;
    ADC.B $02,S                                                          ;808138;
    STA.B $02,S                                                          ;80813A;
    REP #$20                                                             ;80813C;
    PLA                                                                  ;80813E;
    ADC.W #$0011                                                         ;80813F;
    STA.W $05E5                                                          ;808142; Random number = [A] + 11h
    RTL                                                                  ;808145;


UpdateHeldInput:
    PHP                                                                  ;808146;
    PHB                                                                  ;808147;
    REP #$30                                                             ;808148;
    PHX                                                                  ;80814A;
    PHK                                                                  ;80814B;
    PLB                                                                  ;80814C;
    STA.W $05DD                                                          ;80814D; Timed held input timer reset value = [A]
    LDA.B $8B                                                            ;808150;
    STA.B $12                                                            ;808152;
    LDA.B $8F                                                            ;808154;
    TRB.B $12                                                            ;808156;
    LDA.B $12                                                            ;808158; If held input != [previous held input]: go to .unheld
    CMP.W $05D9                                                          ;80815A;
    STA.W $05D9                                                          ;80815D; Previous held input = held input
    BNE .unheld                                                          ;808160;
    DEC.W $05DB                                                          ;808162; Decrement timed held input timer
    BPL .positive                                                        ;808165; If [timed held input timer] >= 0: go to .positive
    STZ.W $05DB                                                          ;808167; Timed held input timer = 0
    LDX.W $05DF                                                          ;80816A;
    STX.W $05E3                                                          ;80816D; Previous timed held input = [timed held input]
    STA.W $05DF                                                          ;808170; Timed held input = [held input]
    BRA .return                                                          ;808173; Go to .return


.unheld:
    LDA.W $05DD                                                          ;808175;
    STA.W $05DB                                                          ;808178; Timed held input timer = [timed held input timer reset value]

.positive:
    STZ.W $05DF                                                          ;80817B; Timed held input = 0

.return:
    LDA.W $05DF                                                          ;80817E;
    EOR.W $05E3                                                          ;808181;
    AND.W $05DF                                                          ;808184; Newly held down timed held input = newly held down timed held input
    STA.W $05E1                                                          ;808187;
    PLX                                                                  ;80818A;
    PLB                                                                  ;80818B;
    PLP                                                                  ;80818C;
    RTL                                                                  ;80818D;


BitIndexToByteIndexAndBitmask:
    TAX                                                                  ;80818E;
    BPL .dontCrash                                                       ;80818F;
    db $00                                                               ;808191; BRK with no operand

.dontCrash:
    STZ.W $05E7                                                          ;808192;
    PHA                                                                  ;808195;
    AND.W #$0007                                                         ;808196;
    SEC                                                                  ;808199;

.loop:
    ROL.W $05E7                                                          ;80819A;
    DEC A                                                                ;80819D;
    BPL .loop                                                            ;80819E;
    PLA                                                                  ;8081A0;
    LSR A                                                                ;8081A1;
    LSR A                                                                ;8081A2;
    LSR A                                                                ;8081A3;
    TAX                                                                  ;8081A4;
    RTL                                                                  ;8081A5;


SetBossBitsInAForCurrentArea:
    PHX                                                                  ;8081A6;
    PHY                                                                  ;8081A7;
    PHP                                                                  ;8081A8;
    SEP #$20                                                             ;8081A9;
    STA.W $05E7                                                          ;8081AB;
    LDX.W $079F                                                          ;8081AE;
    LDA.L $7ED828,X                                                      ;8081B1;
    ORA.W $05E7                                                          ;8081B5;
    STA.L $7ED828,X                                                      ;8081B8;
    PLP                                                                  ;8081BC;
    PLY                                                                  ;8081BD;
    PLX                                                                  ;8081BE;
    RTL                                                                  ;8081BF;


UNUSED_ClearBossBitsInAForCurrentArea_8081C0:
    PHX                                                                  ;8081C0;
    PHY                                                                  ;8081C1;
    PHP                                                                  ;8081C2;
    SEP #$20                                                             ;8081C3;
    EOR.B #$FF                                                           ;8081C5;
    STA.W $05E7                                                          ;8081C7;
    LDX.W $079F                                                          ;8081CA;
    LDA.L $7ED828,X                                                      ;8081CD;
    AND.W $05E7                                                          ;8081D1;
    STA.L $7ED828,X                                                      ;8081D4;
    PLP                                                                  ;8081D8;
    PLY                                                                  ;8081D9;
    PLX                                                                  ;8081DA;
    RTL                                                                  ;8081DB;


CheckIfBossBitsForCurrentAreaMatchAnyBitsInA:
    PHX                                                                  ;8081DC;
    PHY                                                                  ;8081DD;
    PHP                                                                  ;8081DE;
    SEP #$20                                                             ;8081DF;
    STA.W $05E7                                                          ;8081E1;
    LDX.W $079F                                                          ;8081E4;
    LDA.L $7ED828,X                                                      ;8081E7;
    AND.W $05E7                                                          ;8081EB;
    BNE .match                                                           ;8081EE;
    PLP                                                                  ;8081F0;
    PLY                                                                  ;8081F1;
    PLX                                                                  ;8081F2;
    CLC                                                                  ;8081F3;
    RTL                                                                  ;8081F4;


.match:
    PLP                                                                  ;8081F5;
    PLY                                                                  ;8081F6;
    PLX                                                                  ;8081F7;
    SEC                                                                  ;8081F8;
    RTL                                                                  ;8081F9;


MarkEvent_inA:
    PHX                                                                  ;8081FA;
    PHY                                                                  ;8081FB;
    PHP                                                                  ;8081FC;
    REP #$30                                                             ;8081FD;
    JSL.L BitIndexToByteIndexAndBitmask                                  ;8081FF;
    LDA.L $7ED820,X                                                      ;808203;
    ORA.W $05E7                                                          ;808207;
    STA.L $7ED820,X                                                      ;80820A;
    PLP                                                                  ;80820E;
    PLY                                                                  ;80820F;
    PLX                                                                  ;808210;
    RTL                                                                  ;808211;


UnmarkEvent_inA:
    PHX                                                                  ;808212;
    PHY                                                                  ;808213;
    PHP                                                                  ;808214;
    REP #$30                                                             ;808215;
    JSL.L BitIndexToByteIndexAndBitmask                                  ;808217;
    LDA.W $05E7                                                          ;80821B;
    EOR.W #$FFFF                                                         ;80821E;
    STA.W $05E7                                                          ;808221;
    LDA.L $7ED820,X                                                      ;808224;
    AND.W $05E7                                                          ;808228;
    STA.L $7ED820,X                                                      ;80822B;
    PLP                                                                  ;80822F;
    PLY                                                                  ;808230;
    PLX                                                                  ;808231;
    RTL                                                                  ;808232;


CheckIfEvent_inA_HasHappened:
    PHX                                                                  ;808233;
    PHY                                                                  ;808234;
    PHP                                                                  ;808235;
    REP #$30                                                             ;808236;
    JSL.L BitIndexToByteIndexAndBitmask                                  ;808238;
    LDA.L $7ED820,X                                                      ;80823C;
    AND.W $05E7                                                          ;808240;
    BNE .marked                                                          ;808243;
    PLP                                                                  ;808245;
    PLY                                                                  ;808246;
    PLX                                                                  ;808247;
    CLC                                                                  ;808248;
    RTL                                                                  ;808249;


.marked:
    PLP                                                                  ;80824A;
    PLY                                                                  ;80824B;
    PLX                                                                  ;80824C;
    SEC                                                                  ;80824D;
    RTL                                                                  ;80824E;


Write_supermetroid_ToSRAM:
    PHX                                                                  ;80824F;
    LDX.W #$000A                                                         ;808250;

.loop:
    LDA.L Text_supermetroid,X                                            ;808253;
    STA.L $701FE0,X                                                      ;808257;
    DEX                                                                  ;80825B;
    DEX                                                                  ;80825C;
    BPL .loop                                                            ;80825D;
    PLX                                                                  ;80825F;
    RTL                                                                  ;808260;


CheckForNonCorruptSRAM:
    PHX                                                                  ;808261;
    LDA.W #$0003                                                         ;808262;
    STA.W $1F59                                                          ;808265; Number of demo sets = 3
    LDA.W #$0000                                                         ;808268;
    JSL.L LoadFromSRAM                                                   ;80826B; Load SRAM slot A
    BCC .nonCorrupt                                                      ;80826F; If not corrupt, go to .nonCorrupt
    LDA.W #$0001                                                         ;808271;
    JSL.L LoadFromSRAM                                                   ;808274; Load SRAM slot B
    BCC .nonCorrupt                                                      ;808278; If not corrupt, go to .nonCorrupt
    LDA.W #$0002                                                         ;80827A;
    JSL.L LoadFromSRAM                                                   ;80827D; Load SRAM slot C
    BCC .nonCorrupt                                                      ;808281; If not corrupt, go to .nonCorrupt
    LDX.W #$000A                                                         ;808283;

.corruptLoop:
    LDA.L Text_madadameyohn,X                                            ;808286;
    STA.L $701FE0,X                                                      ;80828A; $70:1FE0..1FEB = 'madadameyohn' (all SRAM is corrupt)
    DEX                                                                  ;80828E;
    DEX                                                                  ;80828F;
    BPL .corruptLoop                                                     ;808290;
    PLX                                                                  ;808292;
    RTL                                                                  ;808293; Return


.nonCorrupt:
    LDX.W #$000A                                                         ;808294;

.nonCorruptLoop:
    LDA.L $701FE0,X                                                      ;808297;
    CMP.L Text_supermetroid,X                                            ;80829B;
    BNE .return                                                          ;80829F; If $70:1FE0..1FEB = 'supermetroid':
    DEX                                                                  ;8082A1;
    DEX                                                                  ;8082A2;
    BPL .nonCorruptLoop                                                  ;8082A3;
    LDA.W #$0004                                                         ;8082A5;
    STA.W $1F59                                                          ;8082A8; Number of demo sets = 4

.return:
    PLX                                                                  ;8082AB;
    RTL                                                                  ;8082AC;


Text_madadameyohn:
    db "madadameyohn"                                                    ;8082AD; 'madadameyohn'

Text_supermetroid:
    db "supermetroid"                                                    ;8082B9; 'supermetroid'

WaitUntilTheEndOfAVBlank:
    PHA                                                                  ;8082C5;
    PHP                                                                  ;8082C6;
    SEP #$20                                                             ;8082C7;

.waitVBlankStart:
    LDA.W $4212                                                          ;8082C9;
    BPL .waitVBlankStart                                                 ;8082CC; Wait until v-blank is active

.waitVBlankEnd:
    LDA.W $4212                                                          ;8082CE;
    BMI .waitVBlankEnd                                                   ;8082D1; Wait until v-blank has finished
    PLP                                                                  ;8082D3;
    PLA                                                                  ;8082D4;
    RTL                                                                  ;8082D5;


A_Y_16bit_UnsignedMultiplication:
    PHX                                                                  ;8082D6;
    STA.W $05E9                                                          ;8082D7; Let $05E9 = a + b * 100h
    STY.W $05EB                                                          ;8082DA; Let $05EB = c + d * 100h
    STZ.W $05F1                                                          ;8082DD;
    STZ.W $05F3                                                          ;8082E0; Result = 0
    SEP #$10                                                             ;8082E3;
    LDY.W $05EB                                                          ;8082E5;
    STY.W HW_WRMPYA                                                      ;8082E8;
    LDY.W $05E9                                                          ;8082EB;
    STY.W HW_WRMPYB                                                      ;8082EE;
    NOP                                                                  ;8082F1; Result = ac
    NOP                                                                  ;8082F2;
    NOP                                                                  ;8082F3;
    LDA.W HW_RDMPY                                                       ;8082F4;
    STA.W $05F1                                                          ;8082F7;
    LDY.W $05EA                                                          ;8082FA;
    STY.W HW_WRMPYB                                                      ;8082FD;
    NOP                                                                  ;808300;
    LDA.W $05F2                                                          ;808301; Result += bc * 100h
    CLC                                                                  ;808304;
    ADC.W HW_RDMPY                                                       ;808305;
    STA.W $05F2                                                          ;808308;
    LDY.W $05EC                                                          ;80830B;
    STY.W HW_WRMPYA                                                      ;80830E;
    LDY.W $05E9                                                          ;808311;
    STY.W HW_WRMPYB                                                      ;808314;
    NOP                                                                  ;808317; Result += ad * 100h
    LDA.W $05F2                                                          ;808318;
    CLC                                                                  ;80831B;
    ADC.W HW_RDMPY                                                       ;80831C;
    STA.W $05F2                                                          ;80831F;
    LDY.W $05EA                                                          ;808322;
    STY.W HW_WRMPYB                                                      ;808325;
    NOP                                                                  ;808328;
    NOP                                                                  ;808329;
    LDA.W $05F3                                                          ;80832A; Result += bd * 10000h
    CLC                                                                  ;80832D;
    ADC.W HW_RDMPY                                                       ;80832E;
    STA.W $05F3                                                          ;808331;
    REP #$30                                                             ;808334;
    PLX                                                                  ;808336;
    RTL                                                                  ;808337;


WaitForNMI:
    PHP                                                                  ;808338;
    PHB                                                                  ;808339;
    PHK                                                                  ;80833A;
    PLB                                                                  ;80833B;
    SEP #$30                                                             ;80833C;
    LDA.B #$01                                                           ;80833E;
    STA.W $05B4                                                          ;808340; Set NMI request flag

.wait:
    LDA.W $05B4                                                          ;808343;
    BNE .wait                                                            ;808346; Wait until NMI request acknowledged
    PLB                                                                  ;808348;
    PLP                                                                  ;808349;
    RTL                                                                  ;80834A;


EnableNMI:
    PHP                                                                  ;80834B;
    PHB                                                                  ;80834C;
    PHK                                                                  ;80834D;
    PLB                                                                  ;80834E;
    SEP #$20                                                             ;80834F;
    LDA.B $84                                                            ;808351;
    ORA.B #$80                                                           ;808353;
    STA.W $4200                                                          ;808355;
    STA.B $84                                                            ;808358;
    PLB                                                                  ;80835A;
    PLP                                                                  ;80835B;
    RTL                                                                  ;80835C;


DisableNMI:
    PHP                                                                  ;80835D;
    PHB                                                                  ;80835E;
    PHK                                                                  ;80835F;
    PLB                                                                  ;808360;
    SEP #$20                                                             ;808361;
    LDA.B $84                                                            ;808363;
    AND.B #$7F                                                           ;808365;
    STA.W $4200                                                          ;808367;
    STA.B $84                                                            ;80836A;
    PLB                                                                  ;80836C;
    PLP                                                                  ;80836D;
    RTL                                                                  ;80836E;


SetForceBlankAndWaitForNMI:
    PHP                                                                  ;80836F;
    PHB                                                                  ;808370;
    PHK                                                                  ;808371;
    PLB                                                                  ;808372;
    SEP #$20                                                             ;808373;
    LDA.B $51                                                            ;808375;
    ORA.B #$80                                                           ;808377;
    STA.B $51                                                            ;808379;
    JSL.L WaitForNMI                                                     ;80837B;
    PLB                                                                  ;80837F;
    PLP                                                                  ;808380;
    RTL                                                                  ;808381;


ClearForceBlankAndWaitForNMI:
    PHP                                                                  ;808382;
    PHB                                                                  ;808383;
    PHK                                                                  ;808384;
    PLB                                                                  ;808385;
    SEP #$20                                                             ;808386;
    LDA.B $51                                                            ;808388;
    AND.B #$7F                                                           ;80838A;
    STA.B $51                                                            ;80838C;
    JSL.L WaitForNMI                                                     ;80838E;
    PLB                                                                  ;808392;
    PLP                                                                  ;808393;
    RTL                                                                  ;808394;


UNUSED_UpdateCGRAM_808395:
    PHP                                                                  ;808395;
    SEP #$10                                                             ;808396;
    REP #$20                                                             ;808398;
    LDA.W #$2200                                                         ;80839A;
    STA.W $4310                                                          ;80839D;
    LDA.W #$C000                                                         ;8083A0;
    STA.W $4312                                                          ;8083A3;
    LDX.B #$7E                                                           ;8083A6;
    STX.W $4314                                                          ;8083A8;
    LDA.W #$0200                                                         ;8083AB;
    STA.W $4315                                                          ;8083AE;
    LDX.B #$00                                                           ;8083B1;
    STX.W $2121                                                          ;8083B3;
    LDX.B #$02                                                           ;8083B6;
    STX.W HW_MDMAEN                                                      ;8083B8;
    PLP                                                                  ;8083BB;
    RTL                                                                  ;8083BC;


UNUSED_WriteYBytesOfATo_000000_X_8bit_8083BD:
    PHP                                                                  ;8083BD;
    PHB                                                                  ;8083BE;
    PHK                                                                  ;8083BF;
    PLB                                                                  ;8083C0;
    SEP #$20                                                             ;8083C1;
    REP #$10                                                             ;8083C3;

.loop:
    STA.L $000000,X                                                      ;8083C5;
    INX                                                                  ;8083C9;
    DEY                                                                  ;8083CA;
    BNE .loop                                                            ;8083CB;
    PLB                                                                  ;8083CD;
    PLP                                                                  ;8083CE;
    RTL                                                                  ;8083CF;


UNUSED_WriteYBytesOfATo_000000_X_16bit_8083D0:
    PHP                                                                  ;8083D0;
    PHB                                                                  ;8083D1;
    PHK                                                                  ;8083D2;
    PLB                                                                  ;8083D3;
    REP #$30                                                             ;8083D4;

.loop:
    STA.L $000000,X                                                      ;8083D6;
    INX                                                                  ;8083DA;
    INX                                                                  ;8083DB;
    DEY                                                                  ;8083DC;
    DEY                                                                  ;8083DD;
    BNE .loop                                                            ;8083DE;
    PLB                                                                  ;8083E0;
    PLP                                                                  ;8083E1;
    RTL                                                                  ;8083E2;


UNUSED_WriteYBytesOfATo_7E0000_X_8bit_8083E3:
    PHP                                                                  ;8083E3;
    PHB                                                                  ;8083E4;
    PHK                                                                  ;8083E5;
    PLB                                                                  ;8083E6;
    SEP #$20                                                             ;8083E7;
    REP #$10                                                             ;8083E9;

.loop:
    STA.L $7E0000,X                                                      ;8083EB;
    INX                                                                  ;8083EF;
    DEY                                                                  ;8083F0;
    BNE .loop                                                            ;8083F1;
    PLB                                                                  ;8083F3;
    PLP                                                                  ;8083F4;
    RTL                                                                  ;8083F5;


WriteYBytesOfATo_7E0000_X_16bit:
    PHP                                                                  ;8083F6;
    PHB                                                                  ;8083F7;
    PHK                                                                  ;8083F8;
    PLB                                                                  ;8083F9;
    REP #$30                                                             ;8083FA;

.loop:
    STA.L $7E0000,X                                                      ;8083FC;
    INX                                                                  ;808400;
    INX                                                                  ;808401;
    DEY                                                                  ;808402;
    DEY                                                                  ;808403;
    BNE .loop                                                            ;808404;
    PLB                                                                  ;808406;
    PLP                                                                  ;808407;
    RTL                                                                  ;808408;


WriteYBytesOfATo_7F0000_X_16bit:
    PHP                                                                  ;808409;
    PHB                                                                  ;80840A;
    PHK                                                                  ;80840B;
    PLB                                                                  ;80840C;
    REP #$30                                                             ;80840D;

.loop:
    STA.L $7F0000,X                                                      ;80840F;
    INX                                                                  ;808413;
    INX                                                                  ;808414;
    DEY                                                                  ;808415;
    DEY                                                                  ;808416;
    BNE .loop                                                            ;808417;
    PLB                                                                  ;808419;
    PLP                                                                  ;80841A;
    RTL                                                                  ;80841B;


Boot:
    SEI                                                                  ;80841C; Disable IRQ
    CLC                                                                  ;80841D;
    XCE                                                                  ;80841E; Enable native mode
    JML.L .bank80                                                        ;80841F; Execute in bank $80 (FastROM)


.bank80:
    SEP #$20                                                             ;808423;
    LDA.B #$01                                                           ;808425;
    STA.W $420D                                                          ;808427; Enable FastROM
    STA.B $86                                                            ;80842A;
    REP #$30                                                             ;80842C;
    LDX.W #$1FFF                                                         ;80842E;
    TXS                                                                  ;808431; Allocate stack memory
    LDA.W #$0000                                                         ;808432;
    TCD                                                                  ;808435; Clear direct page
    PHK                                                                  ;808436;
    PLB                                                                  ;808437; DB = $80
    SEP #$30                                                             ;808438;
    LDX.B #$04                                                           ;80843A;

.wait3Frames:
    LDA.W $4212                                                          ;80843C;
    BPL .wait3Frames                                                     ;80843F; Wait the remainder of this frame and 3 more frames (???)

..wait:
    LDA.W $4212                                                          ;808441;
    BMI ..wait                                                           ;808444;
    DEX                                                                  ;808446;
    BNE .wait3Frames                                                     ;808447;
    REP #$30                                                             ;808449;
    LDX.W #$1FFE                                                         ;80844B;

.loop:
    STZ.W $0000,X                                                        ;80844E;
    DEX                                                                  ;808451; Clear $0000..1FFF
    DEX                                                                  ;808452;
    BPL .loop                                                            ;808453;
    JSL.L Initialise_IO_Registers_and_Display_Nintendo_Logo              ;808455; Initialise IO registers and display Nintendo logo
    JSL.L UploadToAPU_Hardcoded                                          ;808459;
    dl SPC_Engine                                                        ;80845D; Upload SPC engine to APU
    BRA CommonBootSection                                                ;808460; Go to common boot section


SoftReset:
    SEI                                                                  ;808462; Disable IRQ
    CLC                                                                  ;808463;
    XCE                                                                  ;808464; Enable native mode
    REP #$30                                                             ;808465;
    LDX.W #$1FFF                                                         ;808467;
    TXS                                                                  ;80846A; Allocate stack memory
    LDA.W #$0000                                                         ;80846B;
    TCD                                                                  ;80846E; Clear direct page
    PHK                                                                  ;80846F;
    PLB                                                                  ;808470; DB = $80
    SEP #$30                                                             ;808471;
    LDX.B #$04                                                           ;808473;

.wait:
    LDA.W $4212                                                          ;808475;
    BPL .wait                                                            ;808478;

.wait3Frames:
    LDA.W $4212                                                          ;80847A;
    BMI .wait3Frames                                                     ;80847D; Wait the remainder of this frame and 3 more frames (???)
    DEX                                                                  ;80847F;
    BNE .wait                                                            ;808480;

CommonBootSection:
    SEP #$20                                                             ;808482;
    LDA.B #$8F                                                           ;808484;
    STA.W $2100                                                          ;808486; Enable forced blank
    REP #$30                                                             ;808489;
    PEA.W $7E00                                                          ;80848B;
    PLB                                                                  ;80848E;
    PLB                                                                  ;80848F;
    LDX.W #$1FFE                                                         ;808490;

.clearBank7E:
    STZ.W $0000,X                                                        ;808493;
    STZ.W $2000,X                                                        ;808496;
    STZ.W $4000,X                                                        ;808499;
    STZ.W $6000,X                                                        ;80849C;
    STZ.W $8000,X                                                        ;80849F; Clear bank $7E
    STZ.W $A000,X                                                        ;8084A2;
    STZ.W $C000,X                                                        ;8084A5;
    STZ.W $E000,X                                                        ;8084A8;
    DEX                                                                  ;8084AB;
    DEX                                                                  ;8084AC;
    BPL .clearBank7E                                                     ;8084AD;
    PHK                                                                  ;8084AF;
    PLB                                                                  ;8084B0;
    SEP #$30                                                             ;8084B1;
    STZ.W $4200                                                          ;8084B3;
    STZ.B $84                                                            ;8084B6; Disable NMI and auto-joypad read
    LDA.B #$8F                                                           ;8084B8;
    STA.B $51                                                            ;8084BA; Set forced blank
    JSR.W Initialise_CPU_IO_Registers                                    ;8084BC; Initialise CPU IO registers
    JSR.W InitialisePPURegisters                                         ;8084BF; Initialise PPU registers
    JSR.W WriteALoadOf_1C2F                                              ;8084C2; Write a load of 1C2Fh
    SEP #$20                                                             ;8084C5;
    STZ.W $0643                                                          ;8084C7;
    STZ.W $0644                                                          ;8084CA;
    STZ.W $0645                                                          ;8084CD;
    STZ.W $0646                                                          ;8084D0;
    STZ.W $0647                                                          ;8084D3;
    STZ.W $0648                                                          ;8084D6;
    STZ.W $0649                                                          ;8084D9;
    STZ.W $064A                                                          ;8084DC;
    STZ.W $064B                                                          ;8084DF;
    STZ.W $064D                                                          ;8084E2; Clear sound queues
    STZ.W $064E                                                          ;8084E5;
    STZ.W $064F                                                          ;8084E8;
    STZ.W $0650                                                          ;8084EB;
    STZ.W $0651                                                          ;8084EE;
    STZ.W $0652                                                          ;8084F1;
    STZ.W $0656                                                          ;8084F4;
    STZ.W $0666                                                          ;8084F7;
    STZ.W $0676                                                          ;8084FA;
    REP #$20                                                             ;8084FD;
    STZ.W $0590                                                          ;8084FF; OAM stack pointer = 0
    STZ.B $53                                                            ;808502; OAM address = 0
    JSL.L ClearHighOAM                                                   ;808504; Clear high OAM
    JSL.L Finalise_OAM                                                   ;808508; Finalise OAM
    STZ.W $071D                                                          ;80850C; Clear Samus tiles transfer flags
    STZ.W $071F                                                          ;80850F; Samus top half tiles definition = 0
    STZ.W $0721                                                          ;808512; Samus bottom half tiles definition = 0
    JSL.L EnableNMI                                                      ;808515; Enable NMI
    REP #$30                                                             ;808519;
    STZ.W $2140                                                          ;80851B;
    STZ.W $2142                                                          ;80851E; Clear APU IO registers (harmless 16-bit write bug)
    SEP #$30                                                             ;808521;
    LDX.B #$04                                                           ;808523;

.wait:
    LDA.W $4212                                                          ;808525;
    BPL .wait                                                            ;808528;

.wait3Frames:
    LDA.W $4212                                                          ;80852A;
    BMI .wait3Frames                                                     ;80852D; Wait the remainder of this frame and 3 more frames (???)
    DEX                                                                  ;80852F;
    BNE .wait                                                            ;808530;
    REP #$30                                                             ;808532;
    LDA.W #$0061                                                         ;808534;
    STA.W $05E5                                                          ;808537; Seed random number with 61h
    LDA.W #$0000                                                         ;80853A;
    STA.W $063F                                                          ;80853D;
    STA.W $0629                                                          ;808540;
    STA.W $062B                                                          ;808543;
    STA.W $062D                                                          ;808546;
    STA.W $062F                                                          ;808549; Clear music queue
    STA.W $0631                                                          ;80854C;
    STA.W $0633                                                          ;80854F;
    STA.W $0635                                                          ;808552;
    STA.W $0637                                                          ;808555;
    LDA.L DebugConst_DebugMode                                           ;808558;
    STA.W $05D1                                                          ;80855C; Mirror debug byte to RAM
    JSR.W NTSC_PAL_SRAM_MappingCheck                                     ;80855F; NTSC/PAL and SRAM mapping check
    REP #$30                                                             ;808562;
    JSL.L CheckForNonCorruptSRAM                                         ;808564; Check for non-corrupt SRAM
    STZ.W $05F5                                                          ;808568; Enable sounds
    STZ.W $0686                                                          ;80856B; Sound handler downtime = 0
    JML.L MainGameLoop                                                   ;80856E; Go to main game loop

    db $00                                                               ;808572; BRK with no operand

Crash_Handler:
    JML.L Crash_Handler                                                  ;808573; Crash handler, jump to self


UNUSED_WaitAFrames_808577:
    PHP                                                                  ;808577;
    PHB                                                                  ;808578;
    PHK                                                                  ;808579;
    PLB                                                                  ;80857A;
    SEP #$20                                                             ;80857B;
    STA.W $071C                                                          ;80857D;

.waitNMI:
    JSL.L WaitForNMI                                                     ;808580;
    DEC.W $071C                                                          ;808584;
    BNE .waitNMI                                                         ;808587;
    PLB                                                                  ;808589;
    PLP                                                                  ;80858A;
    RTL                                                                  ;80858B;


LoadMirrorOfCurrentAreasMapExplored:
    PHP                                                                  ;80858C;
    REP #$30                                                             ;80858D;
    LDA.W $079F                                                          ;80858F;
    XBA                                                                  ;808592;
    TAX                                                                  ;808593;
    LDY.W #$0000                                                         ;808594;

.loop:
    LDA.L $7ECD52,X                                                      ;808597;
    STA.W $07F7,Y                                                        ;80859B;
    INX                                                                  ;80859E;
    INX                                                                  ;80859F;
    INY                                                                  ;8085A0;
    INY                                                                  ;8085A1;
    CPY.W #$0100                                                         ;8085A2;
    BMI .loop                                                            ;8085A5;
    LDX.W $079F                                                          ;8085A7;
    LDA.L $7ED908,X                                                      ;8085AA;
    AND.W #$00FF                                                         ;8085AE;
    STA.W $0789                                                          ;8085B1;
    PLP                                                                  ;8085B4;
    RTL                                                                  ;8085B5;


UNUSED_Generic_Bitmasks:
    dw $0001,$0002,$0004,$0008,$0010,$0020,$0040,$0080                   ;8085B6;

MirrorCurrentAreasMapExplored:
    PHP                                                                  ;8085C6;
    REP #$30                                                             ;8085C7;
    LDA.W $079F                                                          ;8085C9;
    XBA                                                                  ;8085CC;
    TAX                                                                  ;8085CD;
    LDY.W #$0000                                                         ;8085CE;

.loop:
    LDA.W $07F7,Y                                                        ;8085D1;
    STA.L $7ECD52,X                                                      ;8085D4;
    INX                                                                  ;8085D8;
    INX                                                                  ;8085D9;
    INY                                                                  ;8085DA;
    INY                                                                  ;8085DB;
    CPY.W #$0100                                                         ;8085DC;
    BMI .loop                                                            ;8085DF;
    LDA.W $0789                                                          ;8085E1;
    BEQ .return                                                          ;8085E4;
    LDX.W $079F                                                          ;8085E6;
    LDA.L $7ED908,X                                                      ;8085E9;
    ORA.W #$00FF                                                         ;8085ED;
    STA.L $7ED908,X                                                      ;8085F0;

.return:
    PLP                                                                  ;8085F4;
    RTL                                                                  ;8085F5;


NTSC_PAL_SRAM_MappingCheck:
    PHP                                                                  ;8085F6;
    SEP #$30                                                             ;8085F7;
    LDA.L Debug_RegionSRAM                                               ;8085F9;
    BEQ .region                                                          ;8085FD; If [$80:8000] != 0:
    JMP.W .return                                                        ;8085FF; Return


.region:
    LDA.L ROM_HEADER_country&$00FFFF                                     ;808602;
    CMP.B #$00                                                           ;808606; If country code != Japan:
    BEQ .japan                                                           ;808608;
    LDA.W $213F                                                          ;80860A;
    BIT.B #$10                                                           ;80860D; If PPU set to PAL:
    BEQ .failedRegion                                                    ;80860F;
    JMP.W .SRAMCheck                                                     ;808611;


.japan:
    LDA.W $213F                                                          ;808614;
    BIT.B #$10                                                           ;808617; If PPU set to NTSC: go to .SRAMCheck
    BEQ .SRAMCheck                                                       ;808619;

.failedRegion:
    LDA.B #$8F                                                           ;80861B;
    STA.W $2100                                                          ;80861D; Enable forced blank
    STZ.W $4200                                                          ;808620; Disable all interrupts
    LDA.B #$00                                                           ;808623;
    STA.W $2116                                                          ;808625;
    LDA.B #$00                                                           ;808628;
    STA.W $2117                                                          ;80862A;
    LDA.B #$80                                                           ;80862D;
    STA.W $2115                                                          ;80862F; VRAM $0000..1FFF = [$8E:8000..BFFF] (BG1 tiles)
    JSL.L SetupHDMATransfer                                              ;808632; Set up a (H)DMA transfer
    db $01,$01,$18                                                       ;808636;
    dl Tiles_Menu_BG1_BG2                                                ;808639;
    dw $4000                                                             ;80863C;
    LDA.B #$02                                                           ;80863E;
    STA.W HW_MDMAEN                                                      ;808640;
    LDA.B #$00                                                           ;808643;
    STA.W $2116                                                          ;808645;
    LDA.B #$40                                                           ;808648;
    STA.W $2117                                                          ;80864A;
    LDA.B #$80                                                           ;80864D;
    STA.W $2115                                                          ;80864F; VRAM $4000..47FF = [$80:B437..C436] (BG1 tilemap)
    JSL.L SetupHDMATransfer                                              ;808652; Set up a (H)DMA transfer
    db $01,$01,$18                                                       ;808656;
    dl Tilemap_FailedRegionCheck                                         ;808659;
    dw $1000                                                             ;80865C;
    LDA.B #$02                                                           ;80865E;
    STA.W HW_MDMAEN                                                      ;808660;
    STZ.W $2121                                                          ;808663;
    JSL.L SetupHDMATransfer                                              ;808666; Set up a (H)DMA transfer
    db $01,$00,$22                                                       ;80866A; CGRAM = [$8E:E400..E5FF] (menu palettes)
    dl Menu_Palettes                                                     ;80866D;
    dw $0200                                                             ;808670;
    LDA.B #$02                                                           ;808672;
    STA.W HW_MDMAEN                                                      ;808674;
    STZ.W $2131                                                          ;808677; Disable colour math
    STZ.W $212D                                                          ;80867A; Disable subscreen
    LDA.B #$01                                                           ;80867D;
    STA.W $212C                                                          ;80867F; Main screen layers = BG1
    LDA.B #$0F                                                           ;808682;
    STA.W $2100                                                          ;808684; Disable forced blank
    LDA.B #$00                                                           ;808687;
    STA.W $210B                                                          ;808689; BG1 tiles base address = $0000
    LDA.B #$40                                                           ;80868C;
    STA.W $2107                                                          ;80868E; BG1 tilemap base address = $4000

.gotoCrash:
    BRA .gotoCrash                                                       ;808691;


.SRAMCheck:
    REP #$30                                                             ;808693;
    LDX.W #$1FFE                                                         ;808695;

.backupSRAM:
    LDA.L $700000,X                                                      ;808698;
    STA.L $7F0000,X                                                      ;80869C; $7F:0000..1FFF = [$70:0000..1FFF]
    DEX                                                                  ;8086A0;
    DEX                                                                  ;8086A1;
    BPL .backupSRAM                                                      ;8086A2;
    LDA.W #$0000                                                         ;8086A4;
    LDX.W #$1FFE                                                         ;8086A7;

.clearSRAM:
    STA.L $700000,X                                                      ;8086AA; Clear $70:0000..1FFF
    DEX                                                                  ;8086AE;
    DEX                                                                  ;8086AF;
    BPL .clearSRAM                                                       ;8086B0;
    LDA.W #$0000                                                         ;8086B2;
    LDX.W #$1FFE                                                         ;8086B5;

.writeSRAM:
    STA.L $702000,X                                                      ;8086B8;
    INC A                                                                ;8086BC; $70:2000..3FFF = 0..FFFh
    DEX                                                                  ;8086BD;
    DEX                                                                  ;8086BE;
    BPL .writeSRAM                                                       ;8086BF;
    LDA.W #$0000                                                         ;8086C1;
    LDX.W #$1FFE                                                         ;8086C4;

.loop:
    CMP.L $700000,X                                                      ;8086C7;
    BNE .failedSRAMCheck                                                 ;8086CB; If [$70:0000..1FFF] != 0..FFFh: go to .failedSRAMCheck
    INC A                                                                ;8086CD;
    DEX                                                                  ;8086CE;
    DEX                                                                  ;8086CF;

.verifySRAM:
    BPL .loop                                                            ;8086D0;
    LDX.W #$1FFE                                                         ;8086D2;

.restoreSRAM:
    LDA.L $7F0000,X                                                      ;8086D5;
    STA.L $700000,X                                                      ;8086D9; $70:0000..1FFF = [$7F:0000..1FFF]
    DEX                                                                  ;8086DD;
    DEX                                                                  ;8086DE;
    BPL .restoreSRAM                                                     ;8086DF;

.return:
    PLP                                                                  ;8086E1;
    RTS                                                                  ;8086E2; return


.failedSRAMCheck:
    SEP #$20                                                             ;8086E3;
    LDA.B #$8F                                                           ;8086E5;
    STA.W $2100                                                          ;8086E7; Enable forced blank
    STZ.W $4200                                                          ;8086EA; Disable all interrupts
    LDA.B #$00                                                           ;8086ED;
    STA.W $2116                                                          ;8086EF;
    LDA.B #$00                                                           ;8086F2;
    STA.W $2117                                                          ;8086F4;
    LDA.B #$80                                                           ;8086F7;
    STA.W $2115                                                          ;8086F9; VRAM $0000..1FFF = [$8E:8000..BFFF] (BG1 tiles)
    JSL.L SetupHDMATransfer                                              ;8086FC; Set up a (H)DMA transfer
    db $01,$01,$18                                                       ;808700;
    dl Tiles_Menu_BG1_BG2                                                ;808703;
    dw $4000                                                             ;808706;
    LDA.B #$02                                                           ;808708;
    STA.W HW_MDMAEN                                                      ;80870A;
    LDA.B #$00                                                           ;80870D;
    STA.W $2116                                                          ;80870F;
    LDA.B #$40                                                           ;808712;
    STA.W $2117                                                          ;808714;
    LDA.B #$80                                                           ;808717;
    STA.W $2115                                                          ;808719; VRAM $4000..47FF = [$80:BC37..C436] (BG1 tilemap)
    JSL.L SetupHDMATransfer                                              ;80871C; Set up a (H)DMA transfer
    db $01,$01,$18                                                       ;808720;
    dl Tilemap_FailedSRAMMappingCheck                                    ;808723;
    dw $1000                                                             ;808726;
    LDA.B #$02                                                           ;808728;
    STA.W HW_MDMAEN                                                      ;80872A;
    STZ.W $2121                                                          ;80872D;
    JSL.L SetupHDMATransfer                                              ;808730; Set up a (H)DMA transfer
    db $01,$00,$22                                                       ;808734; CGRAM = [$8E:E400..E5FF] (menu palettes)
    dl Menu_Palettes                                                     ;808737;
    dw $0200                                                             ;80873A;
    LDA.B #$02                                                           ;80873C;
    STA.W HW_MDMAEN                                                      ;80873E;
    STZ.W $2131                                                          ;808741; Disable colour math
    STZ.W $212D                                                          ;808744; Disable subscreen
    LDA.B #$01                                                           ;808747;
    STA.W $212C                                                          ;808749; Main screen layers = BG1
    LDA.B #$0F                                                           ;80874C;
    STA.W $2100                                                          ;80874E; Disable forced blank
    LDA.B #$00                                                           ;808751;
    STA.W $210B                                                          ;808753; BG1 tiles base address = $0000
    LDA.B #$40                                                           ;808756;
    STA.W $2107                                                          ;808758; BG1 tilemap base address = $4000

.crash:
    BRA .crash                                                           ;80875B; Crash


Initialise_CPU_IO_Registers:
    LDA.B #$01                                                           ;80875D;
    STA.W $4200                                                          ;80875F; Enable auto-joypad read
    STA.B $84                                                            ;808762;
    STZ.W $4201                                                          ;808764; Joypad programmable IO port = 0
    STZ.W HW_WRMPYA                                                      ;808767;
    STZ.W HW_WRMPYB                                                      ;80876A; Multiplication operands = 0
    STZ.W HW_WRDIV                                                       ;80876D;
    STZ.W $4205                                                          ;808770; Division operands = 0 (causes harmless division by zero)
    STZ.W HW_WRDIVB                                                      ;808773;
    STZ.W $4207                                                          ;808776;
    STZ.W $4208                                                          ;808779; IRQ h-counter target = 0
    STZ.W $4209                                                          ;80877C;
    STZ.W $420A                                                          ;80877F; IRQ v-counter target = 0
    STZ.W HW_MDMAEN                                                      ;808782; Disable all DMA channels
    STZ.W HW_HDMAEN                                                      ;808785;
    STZ.B $85                                                            ;808788; Disable all HDMA channels
    LDA.B #$01                                                           ;80878A;
    STA.W $420D                                                          ;80878C; Enable FastROM
    STA.B $86                                                            ;80878F;
    RTS                                                                  ;808791;


InitialisePPURegisters:
    LDA.B #$8F                                                           ;808792;
    STA.W $2100                                                          ;808794; Enable forced blank
    STA.B $51                                                            ;808797;
    LDA.B #$03                                                           ;808799;
    STA.W $2101                                                          ;80879B; Sprite tiles base address = $6000, sprite sizes = 8x8 / 16x16
    STA.B $52                                                            ;80879E;
    STZ.W $2102                                                          ;8087A0;
    STZ.B $53                                                            ;8087A3;
    LDA.B #$80                                                           ;8087A5; OAM address = $0000, priority sprite index = 0
    STA.W $2103                                                          ;8087A7;
    STA.B $54                                                            ;8087AA;
    STZ.W $2104                                                          ;8087AC;
    STZ.W $2104                                                          ;8087AF; OAM $0000 = 0
    LDA.B #$09                                                           ;8087B2;
    STA.W $2105                                                          ;8087B4; BG mode = 1 with BG3 priority, BG tile sizes = 8x8
    STA.B $55                                                            ;8087B7;
    STZ.W $2106                                                          ;8087B9;
    STZ.B $57                                                            ;8087BC; Disable mosaic
    LDA.B #$40                                                           ;8087BE;
    STA.W $2107                                                          ;8087C0; BG1 tilemap base address = $4000, size = 32x32
    STA.B $58                                                            ;8087C3;
    LDA.B #$44                                                           ;8087C5;
    STA.W $2108                                                          ;8087C7; BG2 tilemap base address = $4400, size = 32x32
    STA.B $59                                                            ;8087CA;
    LDA.B #$48                                                           ;8087CC;
    STA.W $2109                                                          ;8087CE; BG3 tilemap base address = $4800, size = 32x32
    STA.B $5A                                                            ;8087D1;
    LDA.B #$48                                                           ;8087D3; >.<
    STZ.W $210A                                                          ;8087D5;
    STZ.B $5C                                                            ;8087D8; BG4 tilemap base address = $0000, size = 32x32
    LDA.B #$00                                                           ;8087DA;
    STA.W $210B                                                          ;8087DC;
    STA.B $5D                                                            ;8087DF; BG1/2/4 tiles base address = $0000
    LDA.B #$05                                                           ;8087E1; BG3 tiles base address = $5000
    STA.W $210C                                                          ;8087E3;
    STA.B $5E                                                            ;8087E6;
    STZ.W $210D                                                          ;8087E8;
    STZ.W $210D                                                          ;8087EB; BG1 X scroll = 0
    STZ.W $210E                                                          ;8087EE;
    STZ.W $210E                                                          ;8087F1; BG1 Y scroll = 0
    STZ.W $210F                                                          ;8087F4;
    STZ.W $210F                                                          ;8087F7; BG2 X scroll = 0
    STZ.W $2110                                                          ;8087FA;
    STZ.W $2110                                                          ;8087FD; BG2 Y scroll = 0
    STZ.W $2111                                                          ;808800;
    STZ.W $2111                                                          ;808803; BG3 X scroll = 0
    STZ.W $2112                                                          ;808806;
    STZ.W $2112                                                          ;808809; BG3 Y scroll = 0
    STZ.W $2113                                                          ;80880C;
    STZ.W $2113                                                          ;80880F; BG4 X scroll = 0
    STZ.W $2114                                                          ;808812;
    STZ.W $2114                                                          ;808815; BG4 Y scroll = 0
    STZ.W $2115                                                          ;808818; VRAM address increment mode = 8-bit
    STZ.W $211A                                                          ;80881B;
    STZ.B $5F                                                            ;80881E; Mode 7 settings = 0
    STZ.W $211B                                                          ;808820;
    STZ.W $211C                                                          ;808823;
    STZ.W $211D                                                          ;808826; Mode 7 transformation matrix = {{0, 0}, {0, 0}}
    STZ.W $211E                                                          ;808829;
    STZ.W $211F                                                          ;80882C; Mode 7 transformation origin co-ordinate X = 0
    STZ.W $2120                                                          ;80882F; Mode 7 transformation origin co-ordinate Y = 0
    LDA.B #$00                                                           ;808832;
    STA.W $2123                                                          ;808834;
    STA.B $60                                                            ;808837;
    LDA.B #$00                                                           ;808839;
    STA.W $2124                                                          ;80883B; Disable all window masks
    STA.B $61                                                            ;80883E;
    STZ.W $2125                                                          ;808840;
    STZ.B $62                                                            ;808843;
    LDA.B #$00                                                           ;808845;
    STA.W $2126                                                          ;808847; Window 1 left position = 0
    STA.B $63                                                            ;80884A;
    LDA.B #$F8                                                           ;80884C;
    STA.W $2127                                                          ;80884E; Window 1 right position = F8h
    STA.B $64                                                            ;808851;
    STZ.W $2128                                                          ;808853;
    STZ.B $65                                                            ;808856; Window 2 left position = 0
    STZ.W $2129                                                          ;808858;
    STZ.B $66                                                            ;80885B; Window 2 right position = 0
    STZ.W $212A                                                          ;80885D;
    STZ.B $67                                                            ;808860;
    STZ.W $212B                                                          ;808862; Window 1/2 mask logic = OR
    STZ.B $68                                                            ;808865;
    LDA.B #$11                                                           ;808867;
    STA.W $212C                                                          ;808869; Main screen layers = BG1/sprites
    STA.B $69                                                            ;80886C;
    STA.W $212E                                                          ;80886E;
    STA.B $6C                                                            ;808871; Disable BG1/sprites in window area main screen
    LDA.B #$02                                                           ;808873;
    STA.W $212D                                                          ;808875; Subscreen layers = BG2
    STA.B $6B                                                            ;808878;
    STA.W $212F                                                          ;80887A;
    STA.B $6D                                                            ;80887D; Disable BG2 in window area subscreen
    LDA.B #$02                                                           ;80887F;
    STA.W $2130                                                          ;808881; Enable colour math subscreen layers
    STA.B $6E                                                            ;808884;
    LDA.B #$A1                                                           ;808886;
    STA.W $2131                                                          ;808888; Enable subtractive colour math on BG1/backdrop
    STA.B $71                                                            ;80888B;
    LDA.B #$E0                                                           ;80888D;
    STA.W $2132                                                          ;80888F;
    LDA.B #$E0                                                           ;808892; >.<
    STA.W $2132                                                          ;808894;
    LDA.B #$80                                                           ;808897;
    STA.W $2132                                                          ;808899;
    STA.B $74                                                            ;80889C;
    LDA.B #$40                                                           ;80889E;
    STA.W $2132                                                          ;8088A0; Colour math subscreen backdrop colour = (0, 0, 0)
    STA.B $75                                                            ;8088A3;
    LDA.B #$20                                                           ;8088A5;
    STA.W $2132                                                          ;8088A7;
    STA.B $76                                                            ;8088AA;
    LDA.B #$00                                                           ;8088AC;
    STA.W $2133                                                          ;8088AE; Use standard NTSC resolution
    STA.B $77                                                            ;8088B1;
    RTS                                                                  ;8088B3;


UNUSED_ClearHighRAM_8088B4:
    REP #$30                                                             ;8088B4;
    LDA.W #$0000                                                         ;8088B6;
    LDX.W #$2000                                                         ;8088B9;
    LDY.W #$E000                                                         ;8088BC; Clear $7E:2000..FFFF
    JSL.L WriteYBytesOfATo_7E0000_X_16bit                                ;8088BF;
    LDA.W #$0000                                                         ;8088C3;
    TAX                                                                  ;8088C6;
    LDY.W #$DFFE                                                         ;8088C7; Clear $7F:0000..DFFD
    JSL.L WriteYBytesOfATo_7F0000_X_16bit                                ;8088CA;
    SEP #$30                                                             ;8088CE;
    RTS                                                                  ;8088D0;


WriteALoadOf_1C2F:
    REP #$30                                                             ;8088D1;
    LDA.W #$1C2F                                                         ;8088D3;
    JSL.L Write_800h_Bytes_Of_A_To_7E3000                                ;8088D6; $7E:3000..37FF = 1C2Fh
    LDA.W #$1C2F                                                         ;8088DA;
    JSL.L Write_800h_Bytes_Of_A_To_7E4000                                ;8088DD; $7E:4000..47FF = 1C2Fh
    LDA.W #$1C2F                                                         ;8088E1;
    JSL.L Write_800h_Bytes_Of_A_To_7E6000                                ;8088E4; $7E:6000..67FF = 1C2Fh
    SEP #$30                                                             ;8088E8;
    RTS                                                                  ;8088EA;


Write_800h_Bytes_Of_A_To_7E3000:
    PHP                                                                  ;8088EB;
    PHB                                                                  ;8088EC;
    PHK                                                                  ;8088ED;
    PLB                                                                  ;8088EE;
    REP #$30                                                             ;8088EF;
    LDX.W #$3000                                                         ;8088F1;
    LDY.W #$0800                                                         ;8088F4;
    JSL.L WriteYBytesOfATo_7E0000_X_16bit                                ;8088F7;
    PLB                                                                  ;8088FB;
    PLP                                                                  ;8088FC;
    RTL                                                                  ;8088FD;


Write_800h_Bytes_Of_A_To_7E4000:
    PHP                                                                  ;8088FE;
    PHB                                                                  ;8088FF;
    PHK                                                                  ;808900;
    PLB                                                                  ;808901;
    REP #$30                                                             ;808902;
    LDX.W #$4000                                                         ;808904;
    LDY.W #$0800                                                         ;808907;
    JSL.L WriteYBytesOfATo_7E0000_X_16bit                                ;80890A;
    PLB                                                                  ;80890E;
    PLP                                                                  ;80890F;
    RTL                                                                  ;808910;


Write_800h_Bytes_Of_A_To_7E6000:
    PHP                                                                  ;808911;
    PHB                                                                  ;808912;
    PHK                                                                  ;808913;
    PLB                                                                  ;808914;
    REP #$30                                                             ;808915;
    LDX.W #$6000                                                         ;808917;
    LDY.W #$0800                                                         ;80891A;
    JSL.L WriteYBytesOfATo_7E0000_X_16bit                                ;80891D;
    PLB                                                                  ;808921;
    PLP                                                                  ;808922;
    RTL                                                                  ;808923;


HandleFadingOut:
    PHP                                                                  ;808924;
    REP #$20                                                             ;808925;
    LDA.W $0725                                                          ;808927;
    DEC A                                                                ;80892A; If [screen fade counter] != 0:
    BMI .fadeOut                                                         ;80892B;
    STA.W $0725                                                          ;80892D; Decrement screen fade counter
    BRA .return                                                          ;808930; Return


.fadeOut:
    LDA.W $0723                                                          ;808932;
    STA.W $0725                                                          ;808935; Screen fade counter = [screen fade delay]
    SEP #$30                                                             ;808938;
    LDA.B $51                                                            ;80893A;
    AND.B #$0F                                                           ;80893C; If (brightness) = 0: return
    BEQ .return                                                          ;80893E;
    DEC A                                                                ;808940;
    BNE .disableFBlank                                                   ;808941; If (brightness) = 1:
    LDA.B #$80                                                           ;808943;
    STA.B $51                                                            ;808945; Enable forced blank, brightness = 0
    BRA .return                                                          ;808947; Return


.disableFBlank:
    STA.B $51                                                            ;808949; Decrement brightness (disable forced blank)

.return:
    PLP                                                                  ;80894B;
    RTL                                                                  ;80894C;


HandleFadingIn:
    PHP                                                                  ;80894D;
    REP #$20                                                             ;80894E;
    LDA.W $0725                                                          ;808950;
    DEC A                                                                ;808953; If [screen fade counter] != 0:
    BMI .fadeIn                                                          ;808954;
    STA.W $0725                                                          ;808956; Decrement screen fade counter
    BRA .return                                                          ;808959; Return


.fadeIn:
    LDA.W $0723                                                          ;80895B;
    STA.W $0725                                                          ;80895E; Screen fade counter = [screen fade delay]
    SEP #$30                                                             ;808961;
    LDA.B $51                                                            ;808963;
    INC A                                                                ;808965;
    AND.B #$0F                                                           ;808966; If brightness is not max:
    BEQ .return                                                          ;808968;
    STA.B $51                                                            ;80896A; Increment brightness (disable forced blank)

.return:
    PLP                                                                  ;80896C;
    RTL                                                                  ;80896D;


Finalise_OAM:
    PHP                                                                  ;80896E;
    REP #$30                                                             ;80896F;
    LDA.W $0590                                                          ;808971;
    CMP.W #$0200                                                         ;808974;
    BPL .clearOAMStackPointer                                            ;808977;
    LSR A                                                                ;808979;
    STA.B $12                                                            ;80897A;
    LSR A                                                                ;80897C;
    ADC.B $12                                                            ;80897D;
    CLC                                                                  ;80897F;
    ADC.W #.spriteY00F0                                                  ;808980;
    STA.B $12                                                            ;808983;
    LDA.W #$00F0                                                         ;808985;
    SEP #$30                                                             ;808988;
    JMP.W ($0012)                                                        ;80898A;


.clearOAMStackPointer:
    STZ.W $0590                                                          ;80898D;
    PLP                                                                  ;808990;
    RTL                                                                  ;808991;


.spriteY00F0:
    STA.W $0371                                                          ;808992;
    STA.W $0375                                                          ;808995;
    STA.W $0379                                                          ;808998;
    STA.W $037D                                                          ;80899B;
    STA.W $0381                                                          ;80899E;
    STA.W $0385                                                          ;8089A1;
    STA.W $0389                                                          ;8089A4;
    STA.W $038D                                                          ;8089A7;
    STA.W $0391                                                          ;8089AA;
    STA.W $0395                                                          ;8089AD;
    STA.W $0399                                                          ;8089B0;
    STA.W $039D                                                          ;8089B3;
    STA.W $03A1                                                          ;8089B6;
    STA.W $03A5                                                          ;8089B9;
    STA.W $03A9                                                          ;8089BC;
    STA.W $03AD                                                          ;8089BF;
    STA.W $03B1                                                          ;8089C2;
    STA.W $03B5                                                          ;8089C5;
    STA.W $03B9                                                          ;8089C8;
    STA.W $03BD                                                          ;8089CB;
    STA.W $03C1                                                          ;8089CE;
    STA.W $03C5                                                          ;8089D1;
    STA.W $03C9                                                          ;8089D4;
    STA.W $03CD                                                          ;8089D7;
    STA.W $03D1                                                          ;8089DA;
    STA.W $03D5                                                          ;8089DD;
    STA.W $03D9                                                          ;8089E0;
    STA.W $03DD                                                          ;8089E3;
    STA.W $03E1                                                          ;8089E6;
    STA.W $03E5                                                          ;8089E9;
    STA.W $03E9                                                          ;8089EC;
    STA.W $03ED                                                          ;8089EF;
    STA.W $03F1                                                          ;8089F2;
    STA.W $03F5                                                          ;8089F5;
    STA.W $03F9                                                          ;8089F8;
    STA.W $03FD                                                          ;8089FB;
    STA.W $0401                                                          ;8089FE;
    STA.W $0405                                                          ;808A01;
    STA.W $0409                                                          ;808A04;
    STA.W $040D                                                          ;808A07;
    STA.W $0411                                                          ;808A0A;
    STA.W $0415                                                          ;808A0D;
    STA.W $0419                                                          ;808A10;
    STA.W $041D                                                          ;808A13;
    STA.W $0421                                                          ;808A16;
    STA.W $0425                                                          ;808A19;
    STA.W $0429                                                          ;808A1C;
    STA.W $042D                                                          ;808A1F;
    STA.W $0431                                                          ;808A22;
    STA.W $0435                                                          ;808A25;
    STA.W $0439                                                          ;808A28;
    STA.W $043D                                                          ;808A2B;
    STA.W $0441                                                          ;808A2E;
    STA.W $0445                                                          ;808A31;
    STA.W $0449                                                          ;808A34;
    STA.W $044D                                                          ;808A37;
    STA.W $0451                                                          ;808A3A;
    STA.W $0455                                                          ;808A3D;
    STA.W $0459                                                          ;808A40;
    STA.W $045D                                                          ;808A43;
    STA.W $0461                                                          ;808A46;
    STA.W $0465                                                          ;808A49;
    STA.W $0469                                                          ;808A4C;
    STA.W $046D                                                          ;808A4F;
    STA.W $0471                                                          ;808A52;
    STA.W $0475                                                          ;808A55;
    STA.W $0479                                                          ;808A58;
    STA.W $047D                                                          ;808A5B;
    STA.W $0481                                                          ;808A5E;
    STA.W $0485                                                          ;808A61;
    STA.W $0489                                                          ;808A64;
    STA.W $048D                                                          ;808A67;
    STA.W $0491                                                          ;808A6A;
    STA.W $0495                                                          ;808A6D;
    STA.W $0499                                                          ;808A70;
    STA.W $049D                                                          ;808A73;
    STA.W $04A1                                                          ;808A76;
    STA.W $04A5                                                          ;808A79;
    STA.W $04A9                                                          ;808A7C;
    STA.W $04AD                                                          ;808A7F;
    STA.W $04B1                                                          ;808A82;
    STA.W $04B5                                                          ;808A85;
    STA.W $04B9                                                          ;808A88;
    STA.W $04BD                                                          ;808A8B;
    STA.W $04C1                                                          ;808A8E;
    STA.W $04C5                                                          ;808A91;
    STA.W $04C9                                                          ;808A94;
    STA.W $04CD                                                          ;808A97;
    STA.W $04D1                                                          ;808A9A;
    STA.W $04D5                                                          ;808A9D;
    STA.W $04D9                                                          ;808AA0;
    STA.W $04DD                                                          ;808AA3;
    STA.W $04E1                                                          ;808AA6;
    STA.W $04E5                                                          ;808AA9;
    STA.W $04E9                                                          ;808AAC;
    STA.W $04ED                                                          ;808AAF;
    STA.W $04F1                                                          ;808AB2;
    STA.W $04F5                                                          ;808AB5;
    STA.W $04F9                                                          ;808AB8;
    STA.W $04FD                                                          ;808ABB;
    STA.W $0501                                                          ;808ABE;
    STA.W $0505                                                          ;808AC1;
    STA.W $0509                                                          ;808AC4;
    STA.W $050D                                                          ;808AC7;
    STA.W $0511                                                          ;808ACA;
    STA.W $0515                                                          ;808ACD;
    STA.W $0519                                                          ;808AD0;
    STA.W $051D                                                          ;808AD3;
    STA.W $0521                                                          ;808AD6;
    STA.W $0525                                                          ;808AD9;
    STA.W $0529                                                          ;808ADC;
    STA.W $052D                                                          ;808ADF;
    STA.W $0531                                                          ;808AE2;
    STA.W $0535                                                          ;808AE5;
    STA.W $0539                                                          ;808AE8;
    STA.W $053D                                                          ;808AEB;
    STA.W $0541                                                          ;808AEE;
    STA.W $0545                                                          ;808AF1;
    STA.W $0549                                                          ;808AF4;
    STA.W $054D                                                          ;808AF7;
    STA.W $0551                                                          ;808AFA;
    STA.W $0555                                                          ;808AFD;
    STA.W $0559                                                          ;808B00;
    STA.W $055D                                                          ;808B03;
    STA.W $0561                                                          ;808B06;
    STA.W $0565                                                          ;808B09;
    STA.W $0569                                                          ;808B0C;
    STA.W $056D                                                          ;808B0F;
    STZ.W $0590                                                          ;808B12;
    STZ.W $0591                                                          ;808B15;
    PLP                                                                  ;808B18;
    RTL                                                                  ;808B19;


ClearHighOAM:
    PHP                                                                  ;808B1A;
    REP #$30                                                             ;808B1B;
    STZ.W $0570                                                          ;808B1D;
    STZ.W $0572                                                          ;808B20;
    STZ.W $0574                                                          ;808B23;
    STZ.W $0576                                                          ;808B26;
    STZ.W $0578                                                          ;808B29;
    STZ.W $057A                                                          ;808B2C;
    STZ.W $057C                                                          ;808B2F;
    STZ.W $057E                                                          ;808B32;
    STZ.W $0580                                                          ;808B35;
    STZ.W $0582                                                          ;808B38;
    STZ.W $0584                                                          ;808B3B;
    STZ.W $0586                                                          ;808B3E;
    STZ.W $0588                                                          ;808B41;
    STZ.W $058A                                                          ;808B44;
    STZ.W $058C                                                          ;808B47;
    STZ.W $058E                                                          ;808B4A;
    PLP                                                                  ;808B4D;
    RTL                                                                  ;808B4E;


QueueMode7Transfers:
    PHX                                                                  ;808B4F;
    PHY                                                                  ;808B50;
    LDY.W $0334                                                          ;808B51;
    DEX                                                                  ;808B54;

.loop:
    BIT.W $0000,X                                                        ;808B55;
    BMI .VRAM                                                            ;808B58;
    BVS .CGRAM                                                           ;808B5A;
    STY.W $0334                                                          ;808B5C;
    PLY                                                                  ;808B5F;
    PLX                                                                  ;808B60;
    RTL                                                                  ;808B61;


.CGRAM:
    LDA.W $0001,X                                                        ;808B62;
    STA.W $02D0,Y                                                        ;808B65;
    LDA.W $0003,X                                                        ;808B68;
    STA.W $02D2,Y                                                        ;808B6B;
    LDA.W $0005,X                                                        ;808B6E;
    STA.W $02D4,Y                                                        ;808B71;
    LDA.W $0007,X                                                        ;808B74;
    AND.W #$00FF                                                         ;808B77;
    STA.W $02D6,Y                                                        ;808B7A;
    TXA                                                                  ;808B7D;
    CLC                                                                  ;808B7E;
    ADC.W #$0007                                                         ;808B7F;
    TAX                                                                  ;808B82;
    TYA                                                                  ;808B83;
    CLC                                                                  ;808B84;
    ADC.W #$0007                                                         ;808B85;
    TAY                                                                  ;808B88;
    BRA .loop                                                            ;808B89;


.VRAM:
    LDA.W $0001,X                                                        ;808B8B;
    STA.W $02D0,Y                                                        ;808B8E;
    LDA.W $0003,X                                                        ;808B91;
    STA.W $02D2,Y                                                        ;808B94;
    LDA.W $0005,X                                                        ;808B97;
    STA.W $02D4,Y                                                        ;808B9A;
    LDA.W $0007,X                                                        ;808B9D;
    STA.W $02D6,Y                                                        ;808BA0;
    LDA.W $0009,X                                                        ;808BA3;
    AND.W #$00FF                                                         ;808BA6;
    STA.W $02D8,Y                                                        ;808BA9;
    TXA                                                                  ;808BAC;
    CLC                                                                  ;808BAD;
    ADC.W #$0009                                                         ;808BAE;
    TAX                                                                  ;808BB1;
    TYA                                                                  ;808BB2;
    CLC                                                                  ;808BB3;
    ADC.W #$0009                                                         ;808BB4;
    TAY                                                                  ;808BB7;
    BRA .loop                                                            ;808BB8;


HandleMode7Transfers:
    PHP                                                                  ;808BBA;
    REP #$10                                                             ;808BBB;
    LDX.W $0334                                                          ;808BBD;
    BEQ .return                                                          ;808BC0;
    LDX.W #$02D0                                                         ;808BC2;
    JSL.L ProcessMode7Transfers                                          ;808BC5;
    REP #$20                                                             ;808BC9;
    STZ.W $02D0                                                          ;808BCB;
    STZ.W $0334                                                          ;808BCE;

.return:
    PLP                                                                  ;808BD1;
    RTL                                                                  ;808BD2;


ProcessMode7Transfers:
    PHP                                                                  ;808BD3;

.loop:
    SEP #$20                                                             ;808BD4;
    LDA.W $0000,X                                                        ;808BD6;
    BMI .VRAM                                                            ;808BD9;
    ASL A                                                                ;808BDB;
    BMI .CGRAM                                                           ;808BDC;
    PLP                                                                  ;808BDE;
    RTL                                                                  ;808BDF;


.CGRAM:
    LSR A                                                                ;808BE0;
    AND.B #$1F                                                           ;808BE1;
    STA.W $4310                                                          ;808BE3;
    LDY.W $0001,X                                                        ;808BE6;
    STY.W $4312                                                          ;808BE9;
    LDA.W $0003,X                                                        ;808BEC;
    STA.W $4314                                                          ;808BEF;
    LDY.W $0004,X                                                        ;808BF2;
    STY.W $4315                                                          ;808BF5;
    LDA.B #$22                                                           ;808BF8;
    STA.W $4311                                                          ;808BFA;
    LDA.W $0006,X                                                        ;808BFD;
    STA.W $2121                                                          ;808C00;
    LDA.B #$02                                                           ;808C03;
    STA.W HW_MDMAEN                                                      ;808C05;
    REP #$21                                                             ;808C08; carry clear
    TXA                                                                  ;808C0A;
    ADC.W #$0007                                                         ;808C0B;
    TAX                                                                  ;808C0E;
    BRA .loop                                                            ;808C0F;


.VRAM:
    ASL A                                                                ;808C11;
    BMI .VRAMTiles                                                       ;808C12;
    LSR A                                                                ;808C14;
    AND.B #$1F                                                           ;808C15;
    STA.W $4310                                                          ;808C17;
    LDY.W $0001,X                                                        ;808C1A;
    STY.W $4312                                                          ;808C1D;
    LDA.W $0003,X                                                        ;808C20;
    STA.W $4314                                                          ;808C23;
    LDY.W $0004,X                                                        ;808C26;
    STY.W $4315                                                          ;808C29;
    LDA.B #$18                                                           ;808C2C;
    STA.W $4311                                                          ;808C2E;
    LDY.W $0006,X                                                        ;808C31;
    STY.W $2116                                                          ;808C34;
    LDA.W $0008,X                                                        ;808C37;
    STA.W $2115                                                          ;808C3A;
    LDA.B #$02                                                           ;808C3D;
    STA.W HW_MDMAEN                                                      ;808C3F;
    REP #$21                                                             ;808C42;
    TXA                                                                  ;808C44;
    ADC.W #$0009                                                         ;808C45;
    TAX                                                                  ;808C48;
    BRA .loop                                                            ;808C49;


.VRAMTiles:
    LSR A                                                                ;808C4B;
    AND.B #$1F                                                           ;808C4C;
    STA.W $4310                                                          ;808C4E;
    LDY.W $0001,X                                                        ;808C51;
    STY.W $4312                                                          ;808C54;
    LDA.W $0003,X                                                        ;808C57;
    STA.W $4314                                                          ;808C5A;
    LDY.W $0004,X                                                        ;808C5D;
    STY.W $4315                                                          ;808C60;
    LDA.B #$19                                                           ;808C63;
    STA.W $4311                                                          ;808C65;
    LDY.W $0006,X                                                        ;808C68;
    STY.W $2116                                                          ;808C6B;
    LDA.W $0008,X                                                        ;808C6E;
    STA.W $2115                                                          ;808C71;
    LDA.B #$02                                                           ;808C74;
    STA.W HW_MDMAEN                                                      ;808C76;
    REP #$21                                                             ;808C79; clear carry
    TXA                                                                  ;808C7B;
    ADC.W #$0009                                                         ;808C7C;
    TAX                                                                  ;808C7F;
    JMP.W .loop                                                          ;808C80;


HandleVRAMWriteTable_ScrollingDMAs:
    PHP                                                                  ;808C83;
    REP #$30                                                             ;808C84;
    LDX.W $0330                                                          ;808C86;
    BEQ .done                                                            ;808C89;
    STZ.B $D0,X                                                          ;808C8B;
    LDA.W #$1801                                                         ;808C8D;
    STA.W $4310                                                          ;808C90;
    LDY.W #$0000                                                         ;808C93;

.loop:
    LDA.W $00D0,Y                                                        ;808C96;
    BEQ .done                                                            ;808C99;
    STA.W $4315                                                          ;808C9B;
    LDA.W $00D2,Y                                                        ;808C9E;
    STA.W $4312                                                          ;808CA1;
    LDA.W $00D3,Y                                                        ;808CA4;
    STA.W $4313                                                          ;808CA7;
    LDA.W #$0080                                                         ;808CAA;
    LDX.B $D5,Y                                                          ;808CAD;
    BPL .skip                                                            ;808CAF;
    INC A                                                                ;808CB1;

.skip:
    STA.W $2115                                                          ;808CB2;
    STX.W $2116                                                          ;808CB5;
    SEP #$20                                                             ;808CB8;
    LDA.B #$02                                                           ;808CBA;
    STA.W HW_MDMAEN                                                      ;808CBC;
    REP #$20                                                             ;808CBF;
    TYA                                                                  ;808CC1;
    CLC                                                                  ;808CC2;
    ADC.W #$0007                                                         ;808CC3;
    TAY                                                                  ;808CC6;
    BRA .loop                                                            ;808CC7;


.done:
    STZ.W $0330                                                          ;808CC9;
    SEP #$20                                                             ;808CCC;
    REP #$10                                                             ;808CCE;
    JSR.W ExecuteHorizontalScrollingDMAs                                 ;808CD0;
    JSR.W ExecuteVerticalScrollingDMAs                                   ;808CD3;
    PLP                                                                  ;808CD6;
    RTL                                                                  ;808CD7;


ExecuteHorizontalScrollingDMAs:
    LDA.B #$81                                                           ;808CD8;
    STA.W $2115                                                          ;808CDA;
    LDA.W $0962                                                          ;808CDD;
    BEQ .BG2                                                             ;808CE0;
    STZ.W $0962                                                          ;808CE2;
    LDY.W $095A                                                          ;808CE5;
    STY.W $2116                                                          ;808CE8;
    LDX.W #$1801                                                         ;808CEB;
    STX.W $4310                                                          ;808CEE;
    LDX.W #$C8C8                                                         ;808CF1; $7EC8C8
    STX.W $4312                                                          ;808CF4;
    LDA.B #$7E                                                           ;808CF7;
    STA.W $4314                                                          ;808CF9;
    LDX.W $0956                                                          ;808CFC;
    STX.W $4315                                                          ;808CFF;
    LDA.B #$02                                                           ;808D02;
    STA.W HW_MDMAEN                                                      ;808D04;
    INY                                                                  ;808D07;
    STY.W $2116                                                          ;808D08;
    STX.W $4315                                                          ;808D0B;
    LDX.W #$C908                                                         ;808D0E; $7EC908
    STX.W $4312                                                          ;808D11;
    LDA.B #$02                                                           ;808D14;
    STA.W HW_MDMAEN                                                      ;808D16;
    LDX.W $095E                                                          ;808D19;
    STX.W $4312                                                          ;808D1C;
    LDX.W $0958                                                          ;808D1F;
    BEQ .BG2                                                             ;808D22;
    STX.W $4315                                                          ;808D24;
    LDY.W $095C                                                          ;808D27;
    STY.W $2116                                                          ;808D2A;
    LDA.B #$02                                                           ;808D2D;
    STA.W HW_MDMAEN                                                      ;808D2F;
    INY                                                                  ;808D32;
    STY.W $2116                                                          ;808D33;
    STX.W $4315                                                          ;808D36;
    LDX.W $0960                                                          ;808D39;
    STX.W $4312                                                          ;808D3C;
    LDA.B #$02                                                           ;808D3F;
    STA.W HW_MDMAEN                                                      ;808D41;

.BG2:
    LDA.W $097E                                                          ;808D44;
    BEQ .return                                                          ;808D47;
    STZ.W $097E                                                          ;808D49;
    LDY.W $0976                                                          ;808D4C;
    STY.W $2116                                                          ;808D4F;
    LDX.W #$1801                                                         ;808D52;
    STX.W $4310                                                          ;808D55;
    LDX.W #$C9D0                                                         ;808D58; $7EC9D0
    STX.W $4312                                                          ;808D5B;
    LDA.B #$7E                                                           ;808D5E;
    STA.W $4314                                                          ;808D60;
    LDX.W $0972                                                          ;808D63;
    STX.W $4315                                                          ;808D66;
    LDA.B #$02                                                           ;808D69;
    STA.W HW_MDMAEN                                                      ;808D6B;
    INY                                                                  ;808D6E;
    STY.W $2116                                                          ;808D6F;
    STX.W $4315                                                          ;808D72;
    LDX.W #$CA10                                                         ;808D75; $7ECA10
    STX.W $4312                                                          ;808D78;
    LDA.B #$02                                                           ;808D7B;
    STA.W HW_MDMAEN                                                      ;808D7D;
    LDX.W $097A                                                          ;808D80;
    STX.W $4312                                                          ;808D83;
    LDX.W $0974                                                          ;808D86;
    BEQ .return                                                          ;808D89;
    STX.W $4315                                                          ;808D8B;
    LDY.W $0978                                                          ;808D8E;
    STY.W $2116                                                          ;808D91;
    LDA.B #$02                                                           ;808D94;
    STA.W HW_MDMAEN                                                      ;808D96;
    INY                                                                  ;808D99;
    STY.W $2116                                                          ;808D9A;
    STX.W $4315                                                          ;808D9D;
    LDX.W $097C                                                          ;808DA0;
    STX.W $4312                                                          ;808DA3;
    LDA.B #$02                                                           ;808DA6;
    STA.W HW_MDMAEN                                                      ;808DA8;

.return:
    RTS                                                                  ;808DAB;


ExecuteVerticalScrollingDMAs:
    LDA.B #$80                                                           ;808DAC;
    STA.W $2115                                                          ;808DAE;
    LDA.W $0970                                                          ;808DB1;
    BEQ .BG2                                                             ;808DB4;
    STZ.W $0970                                                          ;808DB6;
    LDY.W $0968                                                          ;808DB9;
    STY.W $2116                                                          ;808DBC;
    LDX.W #$1801                                                         ;808DBF;
    STX.W $4310                                                          ;808DC2;
    LDX.W #$C948                                                         ;808DC5; $7EC948
    STX.W $4312                                                          ;808DC8;
    LDA.B #$7E                                                           ;808DCB;
    STA.W $4314                                                          ;808DCD;
    LDX.W $0964                                                          ;808DD0;
    STX.W $4315                                                          ;808DD3;
    LDA.B #$02                                                           ;808DD6;
    STA.W HW_MDMAEN                                                      ;808DD8;
    REP #$20                                                             ;808DDB;
    TYA                                                                  ;808DDD;
    ORA.W #$0020                                                         ;808DDE;
    STA.W $2116                                                          ;808DE1;
    SEP #$20                                                             ;808DE4;
    STX.W $4315                                                          ;808DE6;
    LDX.W #$C98C                                                         ;808DE9; $7E
    STX.W $4312                                                          ;808DEC;
    LDA.B #$02                                                           ;808DEF;
    STA.W HW_MDMAEN                                                      ;808DF1;
    LDX.W $096C                                                          ;808DF4;
    STX.W $4312                                                          ;808DF7;
    LDX.W $0966                                                          ;808DFA;
    BEQ .BG2                                                             ;808DFD;
    STX.W $4315                                                          ;808DFF;
    LDY.W $096A                                                          ;808E02;
    STY.W $2116                                                          ;808E05;
    LDA.B #$02                                                           ;808E08;
    STA.W HW_MDMAEN                                                      ;808E0A;
    REP #$20                                                             ;808E0D;
    TYA                                                                  ;808E0F;
    ORA.W #$0020                                                         ;808E10;
    STA.W $2116                                                          ;808E13;
    SEP #$20                                                             ;808E16;
    STX.W $4315                                                          ;808E18;
    LDX.W $096E                                                          ;808E1B;
    STX.W $4312                                                          ;808E1E;
    LDA.B #$02                                                           ;808E21;
    STA.W HW_MDMAEN                                                      ;808E23;

.BG2:
    LDA.W $098C                                                          ;808E26;
    BEQ .return                                                          ;808E29;
    STZ.W $098C                                                          ;808E2B;
    LDY.W $0984                                                          ;808E2E;
    STY.W $2116                                                          ;808E31;
    LDX.W #$1801                                                         ;808E34;
    STX.W $4310                                                          ;808E37;
    LDX.W #$CA50                                                         ;808E3A; $7E
    STX.W $4312                                                          ;808E3D;
    LDA.B #$7E                                                           ;808E40;
    STA.W $4314                                                          ;808E42;
    LDX.W $0980                                                          ;808E45;
    STX.W $4315                                                          ;808E48;
    LDA.B #$02                                                           ;808E4B;
    STA.W HW_MDMAEN                                                      ;808E4D;
    REP #$20                                                             ;808E50;
    TYA                                                                  ;808E52;
    ORA.W #$0020                                                         ;808E53;
    STA.W $2116                                                          ;808E56;
    SEP #$20                                                             ;808E59;
    STX.W $4315                                                          ;808E5B;
    LDX.W #$CA94                                                         ;808E5E; $7E
    STX.W $4312                                                          ;808E61;
    LDA.B #$02                                                           ;808E64;
    STA.W HW_MDMAEN                                                      ;808E66;
    LDX.W $0988                                                          ;808E69;
    STX.W $4312                                                          ;808E6C;
    LDX.W $0982                                                          ;808E6F;
    BEQ .return                                                          ;808E72;
    STX.W $4315                                                          ;808E74;
    LDY.W $0986                                                          ;808E77;
    STY.W $2116                                                          ;808E7A;
    LDA.B #$02                                                           ;808E7D;
    STA.W HW_MDMAEN                                                      ;808E7F;
    SEP #$02                                                             ;808E82;
    BEQ .continue                                                        ;808E84;

.crash:
    BRA .crash                                                           ;808E86;


.continue:
    REP #$20                                                             ;808E88;
    TYA                                                                  ;808E8A;
    ORA.W #$0020                                                         ;808E8B;
    STA.W $2116                                                          ;808E8E;
    SEP #$20                                                             ;808E91;
    STX.W $4315                                                          ;808E93;
    LDX.W $098A                                                          ;808E96;
    STX.W $4312                                                          ;808E99;
    LDA.B #$02                                                           ;808E9C;
    STA.W HW_MDMAEN                                                      ;808E9E;

.return:
    RTS                                                                  ;808EA1;


HandleVRAMReadTable:
    PHP                                                                  ;808EA2;
    SEP #$30                                                             ;808EA3;
    LDX.W $0360                                                          ;808EA5;
    BNE .readTable                                                       ;808EA8;
    PLP                                                                  ;808EAA;
    RTL                                                                  ;808EAB;


.readTable:
    STZ.W $0340,X                                                        ;808EAC;
    LDX.B #$00                                                           ;808EAF;
    LDA.B #$80                                                           ;808EB1;
    STA.W $2115                                                          ;808EB3;

.loop:
    REP #$20                                                             ;808EB6;
    LDA.W $0340,X                                                        ;808EB8;
    BEQ .done                                                            ;808EBB;
    STA.W $2116                                                          ;808EBD;
    LDA.W $2139                                                          ;808EC0;
    LDA.W $0342,X                                                        ;808EC3;
    STA.W $4310                                                          ;808EC6;
    LDA.W $0344,X                                                        ;808EC9;
    STA.W $4312                                                          ;808ECC;
    LDA.W $0345,X                                                        ;808ECF;
    STA.W $4313                                                          ;808ED2;
    LDA.W $0347,X                                                        ;808ED5;
    STA.W $4315                                                          ;808ED8;
    STZ.W $4317                                                          ;808EDB;
    STZ.W $4319                                                          ;808EDE;
    SEP #$20                                                             ;808EE1;
    LDA.B #$02                                                           ;808EE3;
    STA.W HW_MDMAEN                                                      ;808EE5;
    TXA                                                                  ;808EE8;
    CLC                                                                  ;808EE9;
    ADC.B #$09                                                           ;808EEA;
    TAX                                                                  ;808EEC;
    BRA .loop                                                            ;808EED;


.done:
    STZ.W $0360                                                          ;808EEF;
    PLP                                                                  ;808EF2;
    RTL                                                                  ;808EF3;


incsrc "queue_music_sound.asm"

SetupHDMATransfer:
    PHP                                                                  ;8091A9;
    PHB                                                                  ;8091AA;
    REP #$30                                                             ;8091AB;
    LDA.B $04,S                                                          ;8091AD;
    PHA                                                                  ;8091AF;
    PLB                                                                  ;8091B0;
    PLB                                                                  ;8091B1;
    LDA.B $03,S                                                          ;8091B2;
    TAY                                                                  ;8091B4;
    LDA.W $0001,Y                                                        ;8091B5;
    AND.W #$00FF                                                         ;8091B8;
    TAX                                                                  ;8091BB;
    LDA.L .table,X                                                       ;8091BC;
    AND.W #$00FF                                                         ;8091C0;
    TAX                                                                  ;8091C3;
    LDA.W $0002,Y                                                        ;8091C4;
    STA.W $4300,X                                                        ;8091C7;
    LDA.W $0004,Y                                                        ;8091CA;
    STA.W $4302,X                                                        ;8091CD;
    LDA.W $0006,Y                                                        ;8091D0;
    STA.W $4304,X                                                        ;8091D3;
    LDA.W $0007,Y                                                        ;8091D6;
    STA.W $4305,X                                                        ;8091D9;
    TYA                                                                  ;8091DC;
    CLC                                                                  ;8091DD;
    ADC.W #$0008                                                         ;8091DE;
    STA.B $03,S                                                          ;8091E1;
    PLB                                                                  ;8091E3;
    PLP                                                                  ;8091E4;
    RTL                                                                  ;8091E5;


.table:
    db $00,$10,$20,$30,$40,$50,$60,$70                                   ;8091E6;

incsrc "nmi.asm"
incsrc "irq.asm"
incsrc "hud.asm"
incsrc "timer.asm"

StartGameplay:
    PHP                                                                  ;80A07B;
    PHB                                                                  ;80A07C;
    PHK                                                                  ;80A07D;
    PLB                                                                  ;80A07E;
    REP #$30                                                             ;80A07F;
    SEI                                                                  ;80A081;
    STZ.W HW_MDMAEN                                                      ;80A082;
    STZ.W $07E9                                                          ;80A085;
    STZ.W $07F3                                                          ;80A088;
    STZ.W $07F5                                                          ;80A08B;
    STZ.W $0943                                                          ;80A08E;
    JSL.L ResetSoundQueues                                               ;80A091;
    LDA.W #$FFFF                                                         ;80A095;
    STA.W $05F5                                                          ;80A098;
    JSL.L DisableNMI                                                     ;80A09B;
    JSL.L DisableHVCounterInterrupts                                     ;80A09F;
    JSL.L Load_Destination_Room                                          ;80A0A3;
    JSR.W HandleMusicQueueFor20Frames                                    ;80A0A7;
    JSL.L Clear_AnimatedTilesObjects                                     ;80A0AA;
    JSL.L Wait_End_VBlank_Clear_HDMA                                     ;80A0AE;
    JSL.L Initialise_Special_Effects_for_New_Room                        ;80A0B2;
    JSL.L Clear_PLMs                                                     ;80A0B6;
    JSL.L Clear_Enemy_Projectiles                                        ;80A0BA;
    JSL.L Clear_PaletteFXObjects                                         ;80A0BE;
    JSL.L Update_Beam_Tiles_and_Palette                                  ;80A0C2;
    JSL.L Load_Target_Colors_for_Common_SpritesBeamsFlashingEnemies      ;80A0C6;
    JSL.L Load_Enemies                                                   ;80A0CA;
    JSL.L Queue_Room_Music_Data                                          ;80A0CE;
    JSR.W HandleMusicQueueFor20Frames                                    ;80A0D2;
    JSL.L Update_Music_Track_Index                                       ;80A0D5;
    JSL.L RTL_82E113                                                     ;80A0D9;
    JSL.L ClearBG2Tilemap                                                ;80A0DD;
    JSL.L LoadLevelData_CRE_TileTable_ScrollData_PLMs_DoorASM_RoomASM    ;80A0E1;
    JSL.L Load_FX_Header                                                 ;80A0E5;
    JSL.L LoadLibraryBackground_LoadingPausing                           ;80A0E9;
    JSR.W CalculateLayer2XPosition                                       ;80A0ED;
    JSR.W CalculateLayer2YPosition                                       ;80A0F0;
    LDA.W $0917                                                          ;80A0F3;
    STA.W $0921                                                          ;80A0F6;
    LDA.W $0919                                                          ;80A0F9;
    STA.W $0923                                                          ;80A0FC;
    JSR.W CalculateBGScrolls                                             ;80A0FF;
    JSL.L DisplayViewablePartOfRoom                                      ;80A102;
    JSL.L EnableNMI                                                      ;80A106;
    LDA.B $A9                                                            ;80A10A;
    BNE .setNextInterrupt                                                ;80A10C;
    LDA.W #$0004                                                         ;80A10E;

.setNextInterrupt:
    STA.B $A7                                                            ;80A111;
    JSL.L EnableHVCounterInterrupts                                      ;80A113;
    JSR.W HandleMusicQueueFor20Frames                                    ;80A117;
    JSL.L Spawn_Hardcoded_PLM                                            ;80A11A;
    db $08,$08                                                           ;80A11E;
    dw PLMEntries_enableSoundsIn20Frames_F0FramesIfCeres                 ;80A120;
    LDA.W #DoorTransitionFunction_FadeInTheScreen_and_RunEnemies_Finish  ;80A122;
    STA.W $099C                                                          ;80A125;
    PLB                                                                  ;80A128;
    PLP                                                                  ;80A129;
    RTL                                                                  ;80A12A;


HandleMusicQueueFor20Frames:
    PHP                                                                  ;80A12B;
    SEP #$30                                                             ;80A12C;
    JSL.L EnableNMI                                                      ;80A12E;
    LDX.B #$14                                                           ;80A132;

.loop:
    PHX                                                                  ;80A134;
    PHP                                                                  ;80A135;
    JSL.L HandleMusicQueue                                               ;80A136;
    JSL.L WaitForNMI                                                     ;80A13A;
    PLP                                                                  ;80A13E;
    PLX                                                                  ;80A13F;
    DEX                                                                  ;80A140;
    BNE .loop                                                            ;80A141;
    JSL.L DisableNMI                                                     ;80A143;
    PLP                                                                  ;80A147;
    RTS                                                                  ;80A148;


ResumeGameplay:
    PHP                                                                  ;80A149;
    PHB                                                                  ;80A14A;
    PHK                                                                  ;80A14B;
    PLB                                                                  ;80A14C;
    REP #$30                                                             ;80A14D;
    SEI                                                                  ;80A14F;
    STZ.W HW_MDMAEN                                                      ;80A150;
    JSL.L DisableNMI                                                     ;80A153;
    JSL.L DisableHVCounterInterrupts                                     ;80A157;
    JSL.L Load_CRETiles_TilesetTiles_and_TilesetPalette_DB_8F            ;80A15B;
    JSL.L LoadLibraryBackground_LoadingPausing                           ;80A15F;
    JSL.L DisplayViewablePartOfRoom                                      ;80A163;
    JSL.L Load_Room_PLM_Graphics                                         ;80A167;
    JSL.L EnableNMI                                                      ;80A16B;
    JSL.L EnableHVCounterInterrupts                                      ;80A16F;
    PLB                                                                  ;80A173;
    PLP                                                                  ;80A174;
    RTL                                                                  ;80A175;


DisplayViewablePartOfRoom:
    PHP                                                                  ;80A176;
    SEP #$20                                                             ;80A177;
    LDA.B $58                                                            ;80A179;
    SEC                                                                  ;80A17B;
    SBC.B $59                                                            ;80A17C;
    XBA                                                                  ;80A17E;
    REP #$20                                                             ;80A17F;
    AND.W #$F800                                                         ;80A181;
    STA.W $098E                                                          ;80A184;
    JSR.W Calculate_BGScroll_LayerPositionBlocks                         ;80A187;
    LDX.W #$0000                                                         ;80A18A;

.loop:
    PHX                                                                  ;80A18D;
    LDA.W $08F7                                                          ;80A18E;
    STA.W $0990                                                          ;80A191;
    LDA.W $08F9                                                          ;80A194;
    STA.W $0992                                                          ;80A197;
    LDA.W $0907                                                          ;80A19A;
    STA.W $0994                                                          ;80A19D;
    LDA.W $0909                                                          ;80A1A0;
    STA.W $0996                                                          ;80A1A3;
    JSR.W UpdateLevelDataColumn                                          ;80A1A6;
    LDA.W $091B                                                          ;80A1A9;
    LSR A                                                                ;80A1AC;
    BCS .increment                                                       ;80A1AD;
    LDA.W $08FB                                                          ;80A1AF;
    STA.W $0990                                                          ;80A1B2;
    LDA.W $08FD                                                          ;80A1B5;
    STA.W $0992                                                          ;80A1B8;
    LDA.W $090B                                                          ;80A1BB;
    STA.W $0994                                                          ;80A1BE;
    LDA.W $090D                                                          ;80A1C1;
    STA.W $0996                                                          ;80A1C4;
    JSR.W UpdateBackgroundDataColumn                                     ;80A1C7;

.increment:
    JSL.L HandleVRAMWriteTable_ScrollingDMAs                             ;80A1CA;
    PLX                                                                  ;80A1CE;
    INC.W $08F7                                                          ;80A1CF;
    INC.W $0907                                                          ;80A1D2;
    INC.W $08FB                                                          ;80A1D5;
    INC.W $090B                                                          ;80A1D8;
    INX                                                                  ;80A1DB;
    CPX.W #$0011                                                         ;80A1DC;
    BNE .loop                                                            ;80A1DF;
    PLP                                                                  ;80A1E1;
    RTL                                                                  ;80A1E2;


UNUSED_QueueClearingOfBG2Tilemap_80A1E3:
    LDX.W #$0FFE                                                         ;80A1E3;
    LDA.W #$0338                                                         ;80A1E6;

.loop:
    STA.L $7E4000,X                                                      ;80A1E9;
    DEX                                                                  ;80A1ED;
    DEX                                                                  ;80A1EE;
    BPL .loop                                                            ;80A1EF;
    LDX.W $0330                                                          ;80A1F1;
    LDA.W #$1000                                                         ;80A1F4;
    STA.B $D0,X                                                          ;80A1F7;
    LDA.W #$4000                                                         ;80A1F9;
    STA.B $D2,X                                                          ;80A1FC;
    LDA.W #$007E                                                         ;80A1FE;
    STA.B $D4,X                                                          ;80A201;
    LDA.W #$4800                                                         ;80A203;
    STA.B $D5,X                                                          ;80A206;
    TXA                                                                  ;80A208;
    CLC                                                                  ;80A209;
    ADC.W #$0007                                                         ;80A20A;
    STA.W $0330                                                          ;80A20D;
    RTL                                                                  ;80A210;


QueueClearingOfFXTilemap:
    LDX.W #$0EFE                                                         ;80A211;
    LDA.W #$184E                                                         ;80A214;

.loop:
    STA.L $7E4000,X                                                      ;80A217;
    DEX                                                                  ;80A21B;
    DEX                                                                  ;80A21C;
    BPL .loop                                                            ;80A21D;
    LDX.W $0330                                                          ;80A21F;
    LDA.W #$0F00                                                         ;80A222;
    STA.B $D0,X                                                          ;80A225;
    LDA.W #$4000                                                         ;80A227;
    STA.B $D2,X                                                          ;80A22A;
    LDA.W #$007E                                                         ;80A22C;
    STA.B $D4,X                                                          ;80A22F;
    LDA.W #$5880                                                         ;80A231;
    STA.B $D5,X                                                          ;80A234;
    TXA                                                                  ;80A236;
    CLC                                                                  ;80A237;
    ADC.W #$0007                                                         ;80A238;
    STA.W $0330                                                          ;80A23B;
    RTL                                                                  ;80A23E;


ClearBG2Tilemap:
    PHP                                                                  ;80A23F;
    REP #$20                                                             ;80A240;
    LDA.W #$4800                                                         ;80A242;
    STA.W $2116                                                          ;80A245;
    LDA.W #$1808                                                         ;80A248;
    STA.W $4310                                                          ;80A24B;
    LDA.W #.addr                                                         ;80A24E;
    STA.W $4312                                                          ;80A251;
    LDA.W #$0080                                                         ;80A254;
    STA.W $4314                                                          ;80A257;
    LDA.W #$0800                                                         ;80A25A;
    STA.W $4315                                                          ;80A25D;
    SEP #$20                                                             ;80A260;
    LDA.B #$00                                                           ;80A262;
    STA.W $2115                                                          ;80A264;
    LDA.B #$02                                                           ;80A267;
    STA.W HW_MDMAEN                                                      ;80A269;
    REP #$20                                                             ;80A26C;
    LDA.W #$4800                                                         ;80A26E;
    STA.W $2116                                                          ;80A271;
    LDA.W #$1908                                                         ;80A274;
    STA.W $4310                                                          ;80A277;
    LDA.W #.addr                                                         ;80A27A;
    STA.W $4312                                                          ;80A27D;
    LDA.W #$0080                                                         ;80A280;
    STA.W $4314                                                          ;80A283;
    LDA.W #$0800                                                         ;80A286;
    STA.W $4315                                                          ;80A289;
    SEP #$20                                                             ;80A28C;
    LDA.B #$80                                                           ;80A28E;
    STA.W $2115                                                          ;80A290;
    LDA.B #$02                                                           ;80A293;
    STA.W HW_MDMAEN                                                      ;80A295;
    PLP                                                                  ;80A298;
    RTL                                                                  ;80A299;


.addr:
    dw $0338                                                             ;80A29A;

ClearFXTilemap:
    PHP                                                                  ;80A29C;
    REP #$20                                                             ;80A29D;
    LDA.W #$5880                                                         ;80A29F;
    STA.W $2116                                                          ;80A2A2;
    LDA.W #$1808                                                         ;80A2A5;
    STA.W $4310                                                          ;80A2A8;
    LDA.W #.addr                                                         ;80A2AB;
    STA.W $4312                                                          ;80A2AE;
    LDA.W #$0080                                                         ;80A2B1;
    STA.W $4314                                                          ;80A2B4;
    LDA.W #$0780                                                         ;80A2B7;
    STA.W $4315                                                          ;80A2BA;
    SEP #$20                                                             ;80A2BD;
    LDA.B #$00                                                           ;80A2BF;
    STA.W $2115                                                          ;80A2C1;
    LDA.B #$02                                                           ;80A2C4;
    STA.W HW_MDMAEN                                                      ;80A2C6;
    REP #$20                                                             ;80A2C9;
    LDA.W #$5880                                                         ;80A2CB;
    STA.W $2116                                                          ;80A2CE;
    LDA.W #$1908                                                         ;80A2D1;
    STA.W $4310                                                          ;80A2D4;
    LDA.W #.addr+1                                                       ;80A2D7;
    STA.W $4312                                                          ;80A2DA;
    LDA.W #$0080                                                         ;80A2DD;
    STA.W $4314                                                          ;80A2E0;
    LDA.W #$0780                                                         ;80A2E3;
    STA.W $4315                                                          ;80A2E6;
    SEP #$20                                                             ;80A2E9;
    LDA.B #$80                                                           ;80A2EB;
    STA.W $2115                                                          ;80A2ED;
    LDA.B #$02                                                           ;80A2F0;
    STA.W HW_MDMAEN                                                      ;80A2F2;
    PLP                                                                  ;80A2F5;
    RTL                                                                  ;80A2F6;


.addr:
    dw $184E                                                             ;80A2F7;


incsrc "scroll.asm"
incsrc "decompress.asm"

Tilemap_FailedRegionCheck:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B437;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B447;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B457;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B467;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B477;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B487;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B497;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B4A7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B4B7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B4C7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B4D7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B4E7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B4F7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B507;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B517;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B527;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B537;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B547;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B557;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B567;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B577;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B587;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B597;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B5A7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B5B7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B5C7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B5D7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B5E7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B5F7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B607;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B617;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B627;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B637;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B647;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B657;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B667;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B677;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B687;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B697;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B6A7;
    dw $000F,$007D,$0071,$0072,$007C,$000F,$0070,$006A                   ;80B6B7;
    dw $0076,$006E,$000F,$0079,$006A,$0074,$000F,$0072                   ;80B6C7;
    dw $007C,$000F,$0077,$0078,$007D,$000F,$006D,$006E                   ;80B6D7;
    dw $007C,$0072,$0070,$0072,$0077,$006E,$006D,$000F                   ;80B6E7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B6F7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B707;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B717;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B727;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B737;
    dw $000F,$000F,$002B,$002D,$000D,$000E,$000D,$000F                   ;80B747;
    dw $000E,$000A,$0026,$0022,$000C,$0000,$0026,$000F                   ;80B757;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B767;
    dw $000F,$006F,$0078,$007B,$000F,$0082,$0078,$007E                   ;80B777;
    dw $007B,$000F,$003B,$0010,$0038,$001E,$003A,$000F                   ;80B787;
    dw $001F,$001A,$0036,$0011,$001C,$0010,$0036,$000F                   ;80B797;
    dw $0078,$007B,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B7A7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B7B7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B7C7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B7D7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B7E7;
    dw $000F,$002B,$002D,$000D,$000E,$000D,$000F,$0027                   ;80B7F7;
    dw $000E,$002B,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B807;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B817;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B827;
    dw $000F,$003B,$0010,$0038,$001E,$003A,$000F,$0037                   ;80B837;
    dw $001E,$003B,$0088,$000F,$000F,$000F,$000F,$000F                   ;80B847;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$0077                   ;80B857;
    dw $0072,$0077,$007D,$006E,$0077,$006D,$0078,$000F                   ;80B867;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B877;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B887;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B897;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B8A7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B8B7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B8C7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B8D7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B8E7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B8F7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B907;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B917;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B927;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B937;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B947;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B957;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B967;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B977;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B987;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B997;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B9A7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B9B7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B9C7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B9D7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B9E7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80B9F7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BA07;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BA17;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BA27;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BA37;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BA47;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BA57;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BA67;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BA77;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BA87;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BA97;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BAA7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BAB7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BAC7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BAD7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BAE7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BAF7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BB07;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BB17;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BB27;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BB37;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BB47;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BB57;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BB67;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BB77;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BB87;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BB97;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BBA7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BBB7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BBC7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BBD7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BBE7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BBF7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BC07;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BC17;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BC27;

Tilemap_FailedSRAMMappingCheck:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BC37;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BC47;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BC57;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BC67;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BC77;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BC87;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BC97;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BCA7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BCB7;
    dw $000F,$000F,$000F,$000F,$002F,$000A,$000D,$0027                   ;80BCC7;
    dw $0022,$0027,$000C,$000F,$000F,$000F,$000F,$000F                   ;80BCD7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BCE7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BCF7;
    dw $000F,$000F,$000F,$000F,$003F,$001A,$003A,$0037                   ;80BD07;
    dw $0011,$0037,$0030,$000F,$000F,$000F,$000F,$000F                   ;80BD17;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BD27;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BD37;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BD47;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BD57;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BD67;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BD77;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BD87;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BD97;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BDA7;
    dw $000F,$0072,$007D,$000F,$0072,$007C,$000F,$006A                   ;80BDB7;
    dw $000F,$007C,$006E,$007B,$0072,$0078,$007E,$007C                   ;80BDC7;
    dw $000F,$006C,$007B,$0072,$0076,$006E,$000F,$007D                   ;80BDD7;
    dw $0078,$000F,$006C,$0078,$0079,$0082,$000F,$000F                   ;80BDE7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BDF7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BE07;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BE17;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BE27;
    dw $000F,$007F,$0072,$006D,$006E,$0078,$000F,$0070                   ;80BE37;
    dw $006A,$0076,$006E,$007C,$0088,$000F,$000F,$000F                   ;80BE47;
    dw $000F,$000F,$000F,$0061,$0068,$000F,$007E,$007C                   ;80BE57;
    dw $006C,$000F,$0062,$0063,$0061,$0069,$0088,$000F                   ;80BE67;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BE77;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BE87;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BE97;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BEA7;
    dw $000F,$0079,$0075,$006E,$006A,$007C,$006E,$000F                   ;80BEB7;
    dw $007B,$006E,$006F,$006E,$007B,$000F,$007D,$0078                   ;80BEC7;
    dw $000F,$0082,$0078,$007E,$007B,$000F,$0077,$0072                   ;80BED7;
    dw $0077,$007D,$006E,$0077,$006D,$0078,$000F,$000F                   ;80BEE7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BEF7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BF07;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BF17;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BF27;
    dw $000F,$0070,$006A,$0076,$006E,$000F,$0072,$0077                   ;80BF37;
    dw $007C,$007D,$007B,$007E,$006C,$007D,$0072,$0078                   ;80BF47;
    dw $0077,$000F,$006B,$0078,$0078,$0074,$0075,$006E                   ;80BF57;
    dw $007D,$000F,$006F,$0078,$007B,$000F,$000F,$000F                   ;80BF67;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BF77;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BF87;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BF97;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BFA7;
    dw $000F,$006F,$007E,$007B,$007D,$0071,$006E,$007B                   ;80BFB7;
    dw $000F,$0072,$0077,$006F,$0078,$007B,$0076,$006A                   ;80BFC7;
    dw $007D,$0072,$0078,$0077,$0088,$000F,$000F,$000F                   ;80BFD7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BFE7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80BFF7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C007;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C017;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C027;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C037;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C047;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C057;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C067;
    dw $0056,$0056,$0056,$0056,$0056,$0056,$0056,$0056                   ;80C077;
    dw $0056,$0056,$0056,$0056,$0056,$0056,$0056,$0056                   ;80C087;
    dw $0056,$0056,$0056,$0056,$0056,$0056,$0056,$0056                   ;80C097;
    dw $0056,$0056,$0056,$0056,$0056,$0056,$0056,$0056                   ;80C0A7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C0B7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C0C7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C0D7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C0E7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C0F7;
    dw $000F,$000F,$000F,$000F,$000F,$0168,$000F,$000F                   ;80C107;
    dw $0169,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C117;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C127;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C137;
    dw $000F,$000F,$000F,$000F,$000F,$0178,$000F,$000F                   ;80C147;
    dw $0179,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C157;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C167;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C177;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C187;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C197;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C1A7;
    dw $000F,$000F,$000F,$000F,$000F,$008E,$00C8,$00D6                   ;80C1B7;
    dw $0106,$000F,$0119,$018F,$00F0,$008D,$000F,$0161                   ;80C1C7;
    dw $016A,$016B,$0126,$016C,$017E,$0180,$0181,$0182                   ;80C1D7;
    dw $0183,$0184,$0185,$000F,$000F,$000F,$000F,$000F                   ;80C1E7;
    dw $000F,$000F,$000F,$000F,$000F,$008F,$00E4,$00E6                   ;80C1F7;
    dw $010F,$0056,$0129,$019F,$0100,$008F,$0056,$0171                   ;80C207;
    dw $017A,$017B,$0192,$017C,$017D,$0190,$0191,$0192                   ;80C217;
    dw $0193,$0194,$0195,$017F,$000F,$000F,$000F,$000F                   ;80C227;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C237;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C247;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C257;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C267;
    dw $000F,$000F,$000F,$000F,$000F,$0051,$016D,$0186                   ;80C277;
    dw $0161,$0187,$0188,$0189,$018A,$018B,$018C,$018D                   ;80C287;
    dw $018E,$016D,$0182,$0186,$00E3,$0110,$0183,$000F                   ;80C297;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C2A7;
    dw $000F,$000F,$000F,$000F,$000F,$0043,$017D,$0196                   ;80C2B7;
    dw $0171,$0197,$0198,$0199,$019A,$019B,$019C,$019D                   ;80C2C7;
    dw $019E,$017D,$0192,$0196,$00EB,$0120,$0193,$017F                   ;80C2D7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C2E7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C2F7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C307;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C317;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C327;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C337;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C347;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C357;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C367;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C377;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C387;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C397;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C3A7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C3B7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C3C7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C3D7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C3E7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C3F7;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C407;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C417;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;80C427;

LoadFromLoadStation:
    PHP                                                                  ;80C437;
    PHB                                                                  ;80C438;
    PHK                                                                  ;80C439;
    PLB                                                                  ;80C43A;
    REP #$30                                                             ;80C43B;
    LDA.W #$0001                                                         ;80C43D;
    STA.W $1E75                                                          ;80C440;
    LDA.W $079F                                                          ;80C443;
    ASL A                                                                ;80C446;
    TAX                                                                  ;80C447;
    LDA.W $078B                                                          ;80C448;
    ASL A                                                                ;80C44B;
    STA.B $12                                                            ;80C44C;
    ASL A                                                                ;80C44E;
    CLC                                                                  ;80C44F;
    ADC.B $12                                                            ;80C450;
    ADC.W $078B                                                          ;80C452;
    ASL A                                                                ;80C455;
    CLC                                                                  ;80C456;
    ADC.W LoadStationListPointers,X                                      ;80C457;
    TAX                                                                  ;80C45A;
    LDA.W $0000,X                                                        ;80C45B;
    STA.W $079B                                                          ;80C45E;
    LDA.W $0002,X                                                        ;80C461;
    STA.W $078D                                                          ;80C464;
    LDA.W $0004,X                                                        ;80C467;
    STA.W $078F                                                          ;80C46A;
    LDA.W $0006,X                                                        ;80C46D;
    STA.W $0911                                                          ;80C470;
    STA.W $091D                                                          ;80C473;
    LDA.W $0008,X                                                        ;80C476;
    STA.W $0915                                                          ;80C479;
    STA.W $091F                                                          ;80C47C;
    LDA.W $000A,X                                                        ;80C47F;
    CLC                                                                  ;80C482;
    ADC.W $0915                                                          ;80C483;
    STA.W $0AFA                                                          ;80C486;
    STA.W $0B14                                                          ;80C489;
    LDA.W $0911                                                          ;80C48C;
    CLC                                                                  ;80C48F;
    ADC.W #$0080                                                         ;80C490;
    ADC.W $000C,X                                                        ;80C493;
    STA.W $0AF6                                                          ;80C496;
    STA.W $0B10                                                          ;80C499;
    STZ.B $B1                                                            ;80C49C;
    STZ.B $B3                                                            ;80C49E;
    SEP #$20                                                             ;80C4A0;
    LDA.B #$8F                                                           ;80C4A2;
    PHA                                                                  ;80C4A4;
    PLB                                                                  ;80C4A5;
    LDX.W $079B                                                          ;80C4A6;
    LDA.W $0001,X                                                        ;80C4A9;
    STA.W $079F                                                          ;80C4AC;
    STZ.W $05F7                                                          ;80C4AF;
    PLB                                                                  ;80C4B2;
    PLP                                                                  ;80C4B3;
    RTL                                                                  ;80C4B4;


LoadStationListPointers:
    dw LoadStations_Crateria                                             ;80C4B5;
    dw LoadStations_Brinstar                                             ;80C4B7;
    dw LoadStations_Norfair                                              ;80C4B9;
    dw LoadStations_WreckedShip                                          ;80C4BB;
    dw LoadStations_Maridia                                              ;80C4BD;
    dw LoadStations_Tourian                                              ;80C4BF;
    dw LoadStations_Colony                                               ;80C4C1;
    dw LoadStations_Debug                                                ;80C4C3;

LoadStations_Crateria:
    dw RoomHeader_LandingSite                                            ;80C4C5;
    dw Door_Parlor_1                                                     ;80C4C7;
    dw $0000,$0400,$0400,$0040,$0000                                     ;80C4C9;

    dw RoomHeader_CrateriaSave                                           ;80C4D3;
    dw Door_Parlor_5                                                     ;80C4D5;
    dw $0000,$0000,$0000,$0098,$FFE0                                     ;80C4D7;

    dw $0000                                                             ;80C4E1;
    dw $0000                                                             ;80C4E3;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C4E5;

    dw $0000                                                             ;80C4EF;
    dw $0000                                                             ;80C4F1;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C4F3;

    dw $0000                                                             ;80C4FD;
    dw $0000                                                             ;80C4FF;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C501;

    dw $0000                                                             ;80C50B;
    dw $0000                                                             ;80C50D;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C50F;

    dw $0000                                                             ;80C519;
    dw $0000                                                             ;80C51B;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C51D;

    dw $0000                                                             ;80C527;
    dw $0000                                                             ;80C529;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C52B;

    dw RoomHeader_ForgottenHighwayElev                                   ;80C535;
    dw Door_ForgottenHighwayElbow_1                                      ;80C537;
    dw $0000,$0000,$0000,$00A8,$0000                                     ;80C539;

    dw RoomHeader_RedBinstarElev                                         ;80C543;
    dw Door_CrateriaKihunter_2                                           ;80C545;
    dw $0000,$0000,$0000,$00A8,$0000                                     ;80C547;

    dw RoomHeader_ElevToBlueBrinstar                                     ;80C551;
    dw Door_Pit_1                                                        ;80C553;
    dw $0000,$0000,$0000,$0088,$0000                                     ;80C555;

    dw RoomHeader_GreenBrinstarElev                                      ;80C55F;
    dw Door_LowerMushrooms_1                                             ;80C561;
    dw $0000,$0000,$0000,$0088,$0000                                     ;80C563;

    dw RoomHeader_Statues                                                ;80C56D;
    dw Door_StatuesHallway_1                                             ;80C56F;
    dw $0000,$0000,$0100,$0098,$0000                                     ;80C571;

    dw $0000                                                             ;80C57B;
    dw $0000                                                             ;80C57D;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C57F;

    dw $0000                                                             ;80C589;
    dw $0000                                                             ;80C58B;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C58D;

    dw $0000                                                             ;80C597;
    dw $0000                                                             ;80C599;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C59B;

    dw RoomHeader_LandingSite                                            ;80C5A5;
    dw Door_Parlor_1                                                     ;80C5A7;
    dw $0000,$0400,$0400,$0040,$0000                                     ;80C5A9;

    dw RoomHeader_EastOcean                                              ;80C5B3;
    dw Door_ForgottenHighwayKagos_0                                      ;80C5B5;
    dw $0000,$0000,$0400,$0095,$0000                                     ;80C5B7;

    dw RoomHeader_LandingSite                                            ;80C5C1;
    dw Door_LandingSite_LandingCutscene                                  ;80C5C3;
    dw $0000,$0400,$0000,$0080,$0000                                     ;80C5C5;


LoadStations_Brinstar:
    dw RoomHeader_BigPinkSaveRoom                                        ;80C5CF;
    dw Door_BigPink_4                                                    ;80C5D1;
    dw $0000,$0000,$0000,$0098,$FFE0                                     ;80C5D3;

    dw RoomHeader_GreenBrinstarSave                                      ;80C5DD;
    dw Door_GreenBrinstarMainShaft_A                                     ;80C5DF;
    dw $0000,$0000,$0000,$0098,$FFE0                                     ;80C5E1;

    dw RoomHeader_EtecoonSave                                            ;80C5EB;
    dw Door_EtecoonETank_3                                               ;80C5ED;
    dw $0000,$0000,$0000,$0098,$FFE0                                     ;80C5EF;

    dw RoomHeader_WarehouseSave                                          ;80C5F9;
    dw Door_WarehouseKihunter_2                                          ;80C5FB;
    dw $0000,$0000,$0000,$0098,$0000                                     ;80C5FD;

    dw RoomHeader_RedBrinstarSave                                        ;80C607;
    dw Door_Caterpillar_6                                                ;80C609;
    dw $0000,$0000,$0000,$0098,$0000                                     ;80C60B;

    dw $0000                                                             ;80C615;
    dw $0000                                                             ;80C617;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C619;

    dw $0000                                                             ;80C623;
    dw $0000                                                             ;80C625;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C627;

    dw $0000                                                             ;80C631;
    dw $0000                                                             ;80C633;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C635;

    dw RoomHeader_GreenBrinstarMainShaft                                 ;80C63F;
    dw Door_BrinstarPreMap_1                                             ;80C641;
    dw $0001,$0000,$0200,$00A8,$0000                                     ;80C643;

    dw RoomHeader_MorphBall                                              ;80C64D;
    dw Door_GreenHillZone_1                                              ;80C64F;
    dw $0000,$0500,$0200,$00A8,$0000                                     ;80C651;

    dw RoomHeader_Caterpillar                                            ;80C65B;
    dw Door_Hellway_1                                                    ;80C65D;
    dw $0000,$0000,$0200,$00A8,$0000                                     ;80C65F;

    dw RoomHeader_WarehouseEntrance                                      ;80C669;
    dw Door_EastTunnel_1                                                 ;80C66B;
    dw $0000,$0000,$0000,$0088,$0000                                     ;80C66D;

    dw $0000                                                             ;80C677;
    dw $0000                                                             ;80C679;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C67B;

    dw $0000                                                             ;80C685;
    dw $0000                                                             ;80C687;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C689;

    dw $0000                                                             ;80C693;
    dw $0000                                                             ;80C695;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C697;

    dw $0000                                                             ;80C6A1;
    dw $0000                                                             ;80C6A3;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C6A5;

    dw RoomHeader_GreenBrinstarMainShaft                                 ;80C6AF;
    dw Door_BrinstarPreMap_1                                             ;80C6B1;
    dw $0001,$0000,$0200,$00A8,$0000                                     ;80C6B3;

    dw RoomHeader_KraidEyeDoor                                           ;80C6BD;
    dw Door_Kraid_0                                                      ;80C6BF;
    dw $0000,$0000,$0100,$0080,$0000                                     ;80C6C1;

    dw RoomHeader_BigPink                                                ;80C6CB;
    dw Door_PinkBrinstarPowerBombs_0                                     ;80C6CD;
    dw $0000,$0300,$0000,$0080,$0000                                     ;80C6CF;


LoadStations_Norfair:
    dw RoomHeader_PostCrocSave                                           ;80C6D9;
    dw Door_PostCrocFarming_3                                            ;80C6DB;
    dw $0000,$0000,$0000,$0098,$0000                                     ;80C6DD;

    dw RoomHeader_BubbleMountainSave                                     ;80C6E7;
    dw Door_BubbleMountain_6                                             ;80C6E9;
    dw $0000,$0000,$0000,$0098,$FFE0                                     ;80C6EB;

    dw RoomHeader_FrogSave                                               ;80C6F5;
    dw Door_FrogSpeedway_0                                               ;80C6F7;
    dw $0000,$0000,$0000,$0098,$0000                                     ;80C6F9;

    dw RoomHeader_CrocomireSave                                          ;80C703;
    dw Door_CrocomireSpeedway_2                                          ;80C705;
    dw $0000,$0000,$0000,$0098,$0000                                     ;80C707;

    dw RoomHeader_LNElevSave                                             ;80C711;
    dw Door_LowerNorfairElev_3                                           ;80C713;
    dw $0000,$0000,$0000,$0098,$FFE0                                     ;80C715;

    dw RoomHeader_LNSave                                                 ;80C71F;
    dw Door_RedKihunterShaft_3                                           ;80C721;
    dw $0000,$0000,$0000,$0098,$0000                                     ;80C723;

    dw $0000                                                             ;80C72D;
    dw $0000                                                             ;80C72F;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C731;

    dw $0000                                                             ;80C73B;
    dw $0000                                                             ;80C73D;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C73F;

    dw RoomHeader_BusinessCenter                                         ;80C749;
    dw Door_CathedralEntrance_0                                          ;80C74B;
    dw $0000,$0000,$0200,$00A8,$0000                                     ;80C74D;

    dw RoomHeader_LowerNorfairElev                                       ;80C757;
    dw Door_LavaDive_1                                                   ;80C759;
    dw $0000,$0000,$0000,$0088,$0000                                     ;80C75B;

    dw RoomHeader_MainHall                                               ;80C765;
    dw Door_AcidStatue_1                                                 ;80C767;
    dw $0000,$0400,$0200,$0088,$0000                                     ;80C769;

    dw $0000                                                             ;80C773;
    dw $0000                                                             ;80C775;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C777;

    dw $0000                                                             ;80C781;
    dw $0000                                                             ;80C783;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C785;

    dw $0000                                                             ;80C78F;
    dw $0000                                                             ;80C791;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C793;

    dw $0000                                                             ;80C79D;
    dw $0000                                                             ;80C79F;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C7A1;

    dw $0000                                                             ;80C7AB;
    dw $0000                                                             ;80C7AD;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C7AF;

    dw RoomHeader_BusinessCenter                                         ;80C7B9;
    dw Door_IceBeamGate_2                                                ;80C7BB;
    dw $0002,$0000,$0200,$00A8,$0000                                     ;80C7BD;

    dw RoomHeader_CrocomireSpeedway                                      ;80C7C7;
    dw Door_Crocomire_1                                                  ;80C7C9;
    dw $0001,$0C00,$0200,$00A0,$0000                                     ;80C7CB;

    dw RoomHeader_LNFarming                                              ;80C7D5;
    dw Door_Plowerhouse_0                                                ;80C7D7;
    dw $0000,$0000,$0000,$00A0,$0000                                     ;80C7D9;

    dw RoomHeader_PostCrocFarming                                        ;80C7E3;
    dw Door_PostCrocPowerBombs_0                                         ;80C7E5;
    dw $0000,$0000,$0000,$00B5,$0000                                     ;80C7E7;

    dw RoomHeader_MainHall                                               ;80C7F1;
    dw Door_AcidStatue_1                                                 ;80C7F3;
    dw $0001,$0500,$0200,$0035,$0000                                     ;80C7F5;

    dw RoomHeader_GoldenTorizo                                           ;80C7FF;
    dw Door_GTEnergyRefill_0                                             ;80C801;
    dw $0000,$0200,$0200,$0000,$0000                                     ;80C803;

    dw RoomHeader_GoldenTorizo                                           ;80C80D;
    dw Door_AcidStatue_0                                                 ;80C80F;
    dw $0000,$0000,$0000,$0080,$0000                                     ;80C811;


LoadStations_WreckedShip:
    dw RoomHeader_WreckedShipSave                                        ;80C81B;
    dw Door_WreckedShipMainShaft_6                                       ;80C81D;
    dw $0000,$0000,$0000,$0098,$0000                                     ;80C81F;

    dw $0000                                                             ;80C829;
    dw $0000                                                             ;80C82B;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C82D;

    dw $0000                                                             ;80C837;
    dw $0000                                                             ;80C839;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C83B;

    dw $0000                                                             ;80C845;
    dw $0000                                                             ;80C847;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C849;

    dw $0000                                                             ;80C853;
    dw $0000                                                             ;80C855;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C857;

    dw $0000                                                             ;80C861;
    dw $0000                                                             ;80C863;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C865;

    dw $0000                                                             ;80C86F;
    dw $0000                                                             ;80C871;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C873;

    dw $0000                                                             ;80C87D;
    dw $0000                                                             ;80C87F;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C881;

    dw $0000                                                             ;80C88B;
    dw $0000                                                             ;80C88D;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C88F;

    dw $0000                                                             ;80C899;
    dw $0000                                                             ;80C89B;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C89D;

    dw $0000                                                             ;80C8A7;
    dw $0000                                                             ;80C8A9;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C8AB;

    dw $0000                                                             ;80C8B5;
    dw $0000                                                             ;80C8B7;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C8B9;

    dw $0000                                                             ;80C8C3;
    dw $0000                                                             ;80C8C5;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C8C7;

    dw $0000                                                             ;80C8D1;
    dw $0000                                                             ;80C8D3;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C8D5;

    dw $0000                                                             ;80C8DF;
    dw $0000                                                             ;80C8E1;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C8E3;

    dw $0000                                                             ;80C8ED;
    dw $0000                                                             ;80C8EF;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C8F1;

    dw RoomHeader_WreckedShipEntrance                                    ;80C8FB;
    dw Door_WreckedShipMainShaft_0                                       ;80C8FD;
    dw $0001,$0000,$0000,$0080,$0000                                     ;80C8FF;

    dw RoomHeader_Basement                                               ;80C909;
    dw Door_WreckedShipMap_0                                             ;80C90B;
    dw $0000,$0400,$0000,$0080,$0000                                     ;80C90D;


LoadStations_Maridia:
    dw RoomHeader_GlassTunnelSave                                        ;80C917;
    dw Door_GlassTunnel_3                                                ;80C919;
    dw $0000,$0000,$0000,$0098,$0000                                     ;80C91B;

    dw RoomHeader_ForgottenHighwaySave                                   ;80C925;
    dw Door_MaridiaElev_1                                                ;80C927;
    dw $0000,$0000,$0000,$0098,$0000                                     ;80C929;

    dw RoomHeader_AqueductSave                                           ;80C933;
    dw Door_Aqueduct_5                                                   ;80C935;
    dw $0000,$0000,$0000,$0098,$FFE0                                     ;80C937;

    dw RoomHeader_DraygonSave                                            ;80C941;
    dw Door_Colosseum_1                                                  ;80C943;
    dw $0000,$0000,$0000,$0098,$0000                                     ;80C945;

    dw $0000                                                             ;80C94F;
    dw $0000                                                             ;80C951;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C953;

    dw $0000                                                             ;80C95D;
    dw $0000                                                             ;80C95F;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C961;

    dw $0000                                                             ;80C96B;
    dw $0000                                                             ;80C96D;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C96F;

    dw $0000                                                             ;80C979;
    dw $0000                                                             ;80C97B;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C97D;

    dw RoomHeader_MaridiaElev                                            ;80C987;
    dw Door_ThreadTheNeedle_1                                            ;80C989;
    dw $0000,$0000,$0200,$00A8,$0000                                     ;80C98B;

    dw $0000                                                             ;80C995;
    dw $0000                                                             ;80C997;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C999;

    dw $0000                                                             ;80C9A3;
    dw $0000                                                             ;80C9A5;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C9A7;

    dw $0000                                                             ;80C9B1;
    dw $0000                                                             ;80C9B3;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C9B5;

    dw $0000                                                             ;80C9BF;
    dw $0000                                                             ;80C9C1;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C9C3;

    dw $0000                                                             ;80C9CD;
    dw $0000                                                             ;80C9CF;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C9D1;

    dw $0000                                                             ;80C9DB;
    dw $0000                                                             ;80C9DD;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C9DF;

    dw $0000                                                             ;80C9E9;
    dw $0000                                                             ;80C9EB;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80C9ED;

    dw RoomHeader_PseudoPlasmaSpark                                      ;80C9F7;
    dw Door_NWestMaridiaBug_1                                            ;80C9F9;
    dw $0001,$0000,$0000,$00D0,$0000                                     ;80C9FB;

    dw RoomHeader_ThePrecious                                            ;80CA05;
    dw Door_ThePrecious_MaridiaLoad11                                    ;80CA07;
    dw $0000,$0000,$0200,$0080,$0000                                     ;80CA09;

    dw RoomHeader_BotwoonHallway                                         ;80CA13;
    dw Door_Aqueduct_3                                                   ;80CA15;
    dw $0000,$0300,$0000,$0080,$0000                                     ;80CA17;

    dw RoomHeader_Oasis                                                  ;80CA21;
    dw Door_WestSandHall_1                                               ;80CA23;
    dw $0000,$0000,$0100,$0080,$0000                                     ;80CA25;


LoadStations_Tourian:
    dw RoomHeader_MotherBrainSave                                        ;80CA2F;
    dw Door_RinkaShaft_1                                                 ;80CA31;
    dw $0000,$0000,$0000,$0098,$FFE0                                     ;80CA33;

    dw RoomHeader_UpperTourianSave                                       ;80CA3D;
    dw Door_TourianFirst_3                                               ;80CA3F;
    dw $0000,$0000,$0000,$0098,$0000                                     ;80CA41;

    dw $0000                                                             ;80CA4B;
    dw $0000                                                             ;80CA4D;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80CA4F;

    dw $0000                                                             ;80CA59;
    dw $0000                                                             ;80CA5B;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80CA5D;

    dw $0000                                                             ;80CA67;
    dw $0000                                                             ;80CA69;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80CA6B;

    dw $0000                                                             ;80CA75;
    dw $0000                                                             ;80CA77;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80CA79;

    dw $0000                                                             ;80CA83;
    dw $0000                                                             ;80CA85;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80CA87;

    dw $0000                                                             ;80CA91;
    dw $0000                                                             ;80CA93;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80CA95;

    dw RoomHeader_TourianFirst                                           ;80CA9F;
    dw Door_Metroids1_0                                                  ;80CAA1;
    dw $0000,$0000,$0200,$00A8,$0000                                     ;80CAA3;

    dw $0000                                                             ;80CAAD;
    dw $0000                                                             ;80CAAF;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80CAB1;

    dw $0000                                                             ;80CABB;
    dw $0000                                                             ;80CABD;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80CABF;

    dw $0000                                                             ;80CAC9;
    dw $0000                                                             ;80CACB;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80CACD;

    dw $0000                                                             ;80CAD7;
    dw $0000                                                             ;80CAD9;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80CADB;

    dw $0000                                                             ;80CAE5;
    dw $0000                                                             ;80CAE7;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80CAE9;

    dw $0000                                                             ;80CAF3;
    dw $0000                                                             ;80CAF5;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80CAF7;

    dw $0000                                                             ;80CB01;
    dw $0000                                                             ;80CB03;
    dw $0000,$0400,$0400,$00B0,$0000                                     ;80CB05;

    dw RoomHeader_RinkaShaft                                             ;80CB0F;
    dw Door_TourianEyeDoor_1                                             ;80CB11;
    dw $0000,$0000,$0200,$0080,$0000                                     ;80CB13;

    dw RoomHeader_RinkaShaft                                             ;80CB1D;
    dw Door_BigBoy_0                                                     ;80CB1F;
    dw $0000,$0000,$0000,$0080,$0000                                     ;80CB21;


LoadStations_Colony:
    dw RoomHeader_CeresElev                                              ;80CB2B;
    dw Door_FallingTile_0                                                ;80CB2D;
    dw $0000,$0000,$0000,$0048,$0000                                     ;80CB2F;

    dw RoomHeader_CeresElev                                              ;80CB39;
    dw Door_FallingTile_0                                                ;80CB3B;
    dw $0000,$0000,$0000,$0040,$0000                                     ;80CB3D;

    dw RoomHeader_CeresElev                                              ;80CB47;
    dw Door_FallingTile_0                                                ;80CB49;
    dw $0000,$0000,$0000,$0040,$0000                                     ;80CB4B;

    dw RoomHeader_CeresElev                                              ;80CB55;
    dw Door_FallingTile_0                                                ;80CB57;
    dw $0000,$0000,$0000,$0040,$0000                                     ;80CB59;

    dw RoomHeader_CeresElev                                              ;80CB63;
    dw Door_FallingTile_0                                                ;80CB65;
    dw $0000,$0000,$0000,$0040,$0000                                     ;80CB67;

    dw RoomHeader_CeresElev                                              ;80CB71;
    dw Door_FallingTile_0                                                ;80CB73;
    dw $0000,$0000,$0000,$0040,$0000                                     ;80CB75;

    dw RoomHeader_CeresElev                                              ;80CB7F;
    dw Door_FallingTile_0                                                ;80CB81;
    dw $0000,$0000,$0000,$0040,$0000                                     ;80CB83;

    dw RoomHeader_CeresElev                                              ;80CB8D;
    dw Door_FallingTile_0                                                ;80CB8F;
    dw $0000,$0000,$0000,$0040,$0000                                     ;80CB91;

    dw RoomHeader_CeresElev                                              ;80CB9B;
    dw Door_FallingTile_0                                                ;80CB9D;
    dw $0000,$0000,$0000,$0040,$0000                                     ;80CB9F;

    dw RoomHeader_CeresElev                                              ;80CBA9;
    dw Door_FallingTile_0                                                ;80CBAB;
    dw $0000,$0000,$0000,$0040,$0000                                     ;80CBAD;

    dw RoomHeader_CeresElev                                              ;80CBB7;
    dw Door_FallingTile_0                                                ;80CBB9;
    dw $0000,$0000,$0000,$0040,$0000                                     ;80CBBB;

    dw RoomHeader_CeresElev                                              ;80CBC5;
    dw Door_FallingTile_0                                                ;80CBC7;
    dw $0000,$0000,$0000,$0040,$0000                                     ;80CBC9;

    dw RoomHeader_CeresElev                                              ;80CBD3;
    dw Door_FallingTile_0                                                ;80CBD5;
    dw $0000,$0000,$0000,$0040,$0000                                     ;80CBD7;

    dw RoomHeader_CeresElev                                              ;80CBE1;
    dw Door_FallingTile_0                                                ;80CBE3;
    dw $0000,$0000,$0000,$0040,$0000                                     ;80CBE5;

    dw RoomHeader_CeresElev                                              ;80CBEF;
    dw Door_FallingTile_0                                                ;80CBF1;
    dw $0000,$0000,$0000,$0040,$0000                                     ;80CBF3;

    dw RoomHeader_CeresElev                                              ;80CBFD;
    dw Door_FallingTile_0                                                ;80CBFF;
    dw $0000,$0000,$0000,$0040,$0000                                     ;80CC01;

    dw RoomHeader_CeresElev                                              ;80CC0B;
    dw Door_FallingTile_0                                                ;80CC0D;
    dw $0000,$0000,$0000,$0040,$0000                                     ;80CC0F;


LoadStations_Debug:
    dw RoomHeader_Debug                                                  ;80CC19;
    dw UNUSED_Door_Debug_0_83ABC4                                        ;80CC1B;
    dw $0000,$0000,$0000,$00B0,$0000                                     ;80CC1D;

    dw RoomHeader_Debug                                                  ;80CC27;
    dw UNUSED_Door_Debug_0_83ABC4                                        ;80CC29;
    dw $0000,$0000,$0000,$00B0,$0000                                     ;80CC2B;

    dw RoomHeader_Debug                                                  ;80CC35;
    dw UNUSED_Door_Debug_0_83ABC4                                        ;80CC37;
    dw $0000,$0000,$0000,$00B0,$0000                                     ;80CC39;

    dw RoomHeader_Debug                                                  ;80CC43;
    dw UNUSED_Door_Debug_0_83ABC4                                        ;80CC45;
    dw $0000,$0000,$0000,$00B0,$0000                                     ;80CC47;

    dw RoomHeader_Debug                                                  ;80CC51;
    dw UNUSED_Door_Debug_0_83ABC4                                        ;80CC53;
    dw $0000,$0000,$0000,$00B0,$0000                                     ;80CC55;

    dw RoomHeader_Debug                                                  ;80CC5F;
    dw UNUSED_Door_Debug_0_83ABC4                                        ;80CC61;
    dw $0000,$0000,$0000,$00B0,$0000                                     ;80CC63;

    dw RoomHeader_Debug                                                  ;80CC6D;
    dw UNUSED_Door_Debug_0_83ABC4                                        ;80CC6F;
    dw $0000,$0000,$0000,$00B0,$0000                                     ;80CC71;

    dw RoomHeader_Debug                                                  ;80CC7B;
    dw UNUSED_Door_Debug_0_83ABC4                                        ;80CC7D;
    dw $0000,$0000,$0000,$00B0,$0000                                     ;80CC7F;

    dw RoomHeader_Debug                                                  ;80CC89;
    dw UNUSED_Door_Debug_0_83ABC4                                        ;80CC8B;
    dw $0000,$0000,$0000,$00B0,$0000                                     ;80CC8D;

    dw RoomHeader_Debug                                                  ;80CC97;
    dw UNUSED_Door_Debug_0_83ABC4                                        ;80CC99;
    dw $0000,$0000,$0000,$00B0,$0000                                     ;80CC9B;

    dw RoomHeader_Debug                                                  ;80CCA5;
    dw UNUSED_Door_Debug_0_83ABC4                                        ;80CCA7;
    dw $0000,$0000,$0000,$00B0,$0000                                     ;80CCA9;

    dw RoomHeader_Debug                                                  ;80CCB3;
    dw UNUSED_Door_Debug_0_83ABC4                                        ;80CCB5;
    dw $0000,$0000,$0000,$00B0,$0000                                     ;80CCB7;

    dw RoomHeader_Debug                                                  ;80CCC1;
    dw UNUSED_Door_Debug_0_83ABC4                                        ;80CCC3;
    dw $0000,$0000,$0000,$00B0,$0000                                     ;80CCC5;

    dw RoomHeader_Debug                                                  ;80CCCF;
    dw UNUSED_Door_Debug_0_83ABC4                                        ;80CCD1;
    dw $0000,$0000,$0000,$00B0,$0000                                     ;80CCD3;

    dw RoomHeader_Debug                                                  ;80CCDD;
    dw UNUSED_Door_Debug_0_83ABC4                                        ;80CCDF;
    dw $0000,$0000,$0000,$00B0,$0000                                     ;80CCE1;

    dw RoomHeader_Debug                                                  ;80CCEB;
    dw UNUSED_Door_Debug_0_83ABC4                                        ;80CCED;
    dw $0000,$0000,$0000,$00B0,$0000                                     ;80CCEF;

    dw RoomHeader_Debug                                                  ;80CCF9;
    dw UNUSED_Door_Debug_0_83ABC4                                        ;80CCFB;
    dw $0000,$0000,$0000,$00B0,$0000                                     ;80CCFD;


SetDebugElevatorAsUsed:
    PHP                                                                  ;80CD07;
    PHB                                                                  ;80CD08;
    PHK                                                                  ;80CD09;
    PLB                                                                  ;80CD0A;
    REP #$30                                                             ;80CD0B;
    LDA.W $079F                                                          ;80CD0D;
    ASL A                                                                ;80CD10;
    TAX                                                                  ;80CD11;
    LDA.W $0793                                                          ;80CD12;
    AND.W #$000F                                                         ;80CD15;
    DEC A                                                                ;80CD18;
    ASL A                                                                ;80CD19;
    ASL A                                                                ;80CD1A;
    CLC                                                                  ;80CD1B;
    ADC.W .elevatorBits,X                                                ;80CD1C;
    TAY                                                                  ;80CD1F;
    LDA.W #$0000                                                         ;80CD20;
    SEP #$20                                                             ;80CD23;
    LDA.W $0000,Y                                                        ;80CD25;
    TAX                                                                  ;80CD28;
    LDA.W $0001,Y                                                        ;80CD29;
    ORA.L $7ED8F8,X                                                      ;80CD2C;
    STA.L $7ED8F8,X                                                      ;80CD30;
    LDA.W $0002,Y                                                        ;80CD34;
    TAX                                                                  ;80CD37;
    LDA.W $0003,Y                                                        ;80CD38;
    ORA.L $7ED8F8,X                                                      ;80CD3B;
    STA.L $7ED8F8,X                                                      ;80CD3F;
    PLB                                                                  ;80CD43;
    PLP                                                                  ;80CD44;
    RTL                                                                  ;80CD45;


.elevatorBits:
    dw ..crateria                                                        ;80CD46;
    dw ..brinstar                                                        ;80CD48;
    dw ..norfair                                                         ;80CD4A;
    dw ..wreckedShip                                                     ;80CD4C;
    dw ..maridia                                                         ;80CD4E;
    dw ..tourian                                                         ;80CD50;

;        _____________ Source area index
;       |    _________ Source bit
;       |   |    _____ Destination area index
;       |   |   |    _ Destination bit
;       |   |   |   |
..crateria:
    db $01,$01,$09,$01                                                   ;80CD52;
    db $01,$02,$03,$04
    db $01,$04,$03,$02
    db $01,$08,$03,$01
    db $01,$10,$0B,$01

..brinstar:
    db $03,$01,$01,$08                                                   ;80CD66;
    db $03,$02,$01,$04
    db $03,$04,$01,$02
    db $03,$08,$05,$01 

..norfair:
    db $05,$01,$03,$08                                                   ;80CD76;
    db $05,$02,$05,$04
    db $05,$04,$05,$02

..maridia:
    db $09,$01,$01,$01                                                   ;80CD82;

..tourian:
    db $0B,$01,$01,$10                                                   ;80CD86;

..wreckedShip:
    db $00,$00,$00,$00                                                   ;80CD8A;


Freespace_Bank80_CD8E:                                                   ;80CD8E;
; $2F32 bytes


warnpc $80FFC0
ORG $80FFC0
ROM_HEADER:
    db "Super Metroid        "                                           ;80FFC0;

.ROMSpeed_MapMode:
    db $30                                                               ;80FFD5;

.chipset:
    db $02                                                               ;80FFD6;

.ROMSize:
    db $0C                                                               ;80FFD7;

.SRAMSize:
    db $03                                                               ;80FFD8;

.country:
    db $00                                                               ;80FFD9;

.developer:
    db $01                                                               ;80FFDA;

.version:
    db $00                                                               ;80FFDB;

.complement:
    dw $0720                                                             ;80FFDC;

.checksum:
    dw $F8DF                                                             ;80FFDE;

    dw Crash_Handler                                                     ;80FFE0;
    dw Crash_Handler                                                     ;80FFE2;

Native_COP:
    dw Crash_Handler                                                     ;80FFE4;

Native_BRK:
    dw Crash_Handler                                                     ;80FFE6;

Native_ABORT:
    dw Crash_Handler                                                     ;80FFE8;

Native_NMI:
    dw NMI                                                               ;80FFEA;

Native_RESET:
    dw Crash_Handler                                                     ;80FFEC;

Native_IRQ:
    dw IRQ                                                               ;80FFEE;

    dw Crash_Handler                                                     ;80FFF0;
    dw Crash_Handler                                                     ;80FFF2;

Emulation_COP:
    dw Crash_Handler                                                     ;80FFF4;

Emulation_BRK:
    dw Crash_Handler                                                     ;80FFF6;

Emulation_ABORT:
    dw Crash_Handler                                                     ;80FFF8;

Emulation_NMI:
    dw Crash_Handler                                                     ;80FFFA;

Emulation_RESET:
    dw Boot                                                              ;80FFFC;

Emulation_IRQBRK:
    dw Crash_Handler                                                     ;80FFFE;
