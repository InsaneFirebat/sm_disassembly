
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

UploadToAPU_Hardcoded:
    LDA.B $02,S                                                          ;80800A;
    STA.B $04                                                            ;80800C;
    LDA.B $01,S                                                          ;80800E;
    STA.B $03                                                            ;808010; $03 = return address
    CLC                                                                  ;808012;
    ADC.W #$0003                                                         ;808013; adjust return address
    STA.B $01,S                                                          ;808016;
    LDY.W #$0001                                                         ;808018;
    LDA.B [$03],Y                                                        ;80801B;
    STA.B $00                                                            ;80801D;
    INY                                                                  ;80801F;
    LDA.B [$03],Y                                                        ;808020;
    STA.B $01                                                            ;808022; $00 = [(return address) + 1] (parameter address)

UploadToAPU_long:
    JSR.W UploadToAPU                                                    ;808024;
    RTL                                                                  ;808027;


UploadToAPU:
    LDA.L DebugConst_DisableAudio                                        ;808028;
    BEQ .upload                                                          ;80802C; If [DebugConst_DisableAudio] != 0:
    RTS                                                                  ;80802E; Return


.upload:
    PHP                                                                  ;80802F;
    PHB                                                                  ;808030;
    REP #$30                                                             ;808031;
    LDA.W #$FFFF                                                         ;808033;
    STA.L $000617                                                        ;808036; Set uploading to APU flag
    SEP #$20                                                             ;80803A;
    REP #$10                                                             ;80803C;
    LDA.B #$FF                                                           ;80803E;
    STA.L $002140                                                        ;808040; APU IO 0 = FFh (request APU upload)
    LDY.B $00                                                            ;808044; Y = parameter short address
    LDA.B $02                                                            ;808046;
    PHA                                                                  ;808048;
    PLB                                                                  ;808049; Set DB to parameter bank
    REP #$30                                                             ;80804A;
    JSR.W SendAPUData                                                    ;80804C;
    LDA.W #$0000                                                         ;80804F;
    STA.L $000617                                                        ;808052; Clear uploading to APU flag
    PLB                                                                  ;808056;
    PLP                                                                  ;808057;
    RTS                                                                  ;808058;


SendAPUData:
    PHP                                                                  ;808059;
    REP #$30                                                             ;80805A;
    LDA.W #$3000                                                         ;80805C;
    STA.L $000641                                                        ;80805F;

.retry:
    LDA.W #$BBAA                                                         ;808063;
    CMP.L $002140                                                        ;808066;
    BEQ .AABB                                                            ;80806A; Wait until [APU IO 0..1] = AAh BBh
    LDA.L $000641                                                        ;80806C;
    DEC A                                                                ;808070;
    STA.L $000641                                                        ;808071;
    BNE .retry                                                           ;808075;

.crash:
    BRA .crash                                                           ;808077; If exceeded 3000h attempts: crash


.AABB:
    SEP #$20                                                             ;808079;
    LDA.B #$CC                                                           ;80807B; Kick = CCh
    BRA .processDataBlock                                                ;80807D;


.uploadDataBlock:
    LDA.W $0000,Y                                                        ;80807F;
    JSR.W IncY_OverflowCheck                                             ;808082; Data = [[Y++]]
    XBA                                                                  ;808085;
    LDA.B #$00                                                           ;808086; Index = 0
    BRA .uploadData                                                      ;808088;


.loopNextData:
    XBA                                                                  ;80808A;
    LDA.W $0000,Y                                                        ;80808B;
    JSR.W IncY_OverflowCheck                                             ;80808E; Data = [[Y++]]
    XBA                                                                  ;808091;

.wait:
    CMP.L $002140                                                        ;808092;
    BNE .wait                                                            ;808096; Wait until APU IO 0 echoes
    INC A                                                                ;808098; Increment index

.uploadData:
    REP #$20                                                             ;808099;
    STA.L $002140                                                        ;80809B; APU IO 0..1 = [index] [data]
    SEP #$20                                                             ;80809F;
    DEX                                                                  ;8080A1; Decrement X (block size)
    BNE .loopNextData                                                    ;8080A2; If [X] != 0: go to .loopNextData

.wait2:
    CMP.L $002140                                                        ;8080A4;
    BNE .wait2                                                           ;8080A8; Wait until APU IO 0 echoes

.inc:
    ADC.B #$03                                                           ;8080AA; Kick = [index] + 4
    BEQ .inc                                                             ;8080AC; Ensure kick != 0

.processDataBlock:
    PHA                                                                  ;8080AE;
    REP #$20                                                             ;8080AF;
    LDA.W $0000,Y                                                        ;8080B1;
    JSR.W IncYTwice_OverflowCheck                                        ;8080B4; X = [[Y]] (block size)
    TAX                                                                  ;8080B7; Y += 2
    LDA.W $0000,Y                                                        ;8080B8;
    JSR.W IncYTwice_OverflowCheck                                        ;8080BB; APU IO 2..3 = [[Y]] (destination address)
    STA.L $002142                                                        ;8080BE; Y += 2
    SEP #$20                                                             ;8080C2;
    CPX.W #$0001                                                         ;8080C4;
    LDA.B #$00                                                           ;8080C7;
    ROL A                                                                ;8080C9; If block size = 0: APU IO 1 = 0 (EOF), else APU IO 1 = 1 (arbitrary non-zero value)
    STA.L $002141                                                        ;8080CA;
    ADC.B #$7F                                                           ;8080CE; Set overflow if block size != 0, else clear overflow
    PLA                                                                  ;8080D0;
    STA.L $002140                                                        ;8080D1; APU IO 0 = kick
    PHX                                                                  ;8080D5;
    LDX.W #$1000                                                         ;8080D6;

.wait3:
    DEX                                                                  ;8080D9; Wait until APU IO 0 echoes
    BEQ .return                                                          ;8080DA; If exceeded 1000h attempts: return
    CMP.L $002140                                                        ;8080DC;
    BNE .wait3                                                           ;8080E0;
    PLX                                                                  ;8080E2;
    BVS .uploadDataBlock                                                 ;8080E3; If block size != 0: go to .uploadDataBlock
    SEP #$20                                                             ;8080E5;
    STZ.W $2141                                                          ;8080E7;
    STZ.W $2142                                                          ;8080EA; These stores have no effect (because DB is set to some hirom bank), but there's also no reason to do these stores anyway
    STZ.W $2143                                                          ;8080ED;
    PLP                                                                  ;8080F0;
    RTS                                                                  ;8080F1; Return


.return:
    SEP #$20                                                             ;8080F2;
    STZ.W $2141                                                          ;8080F4;
    STZ.W $2142                                                          ;8080F7;
    STZ.W $2143                                                          ;8080FA;
    PLX                                                                  ;8080FD;
    PLP                                                                  ;8080FE;
    RTS                                                                  ;8080FF;


IncYTwice_OverflowCheck:
    INY                                                                  ;808100;
    BEQ IncY_OverflowCheck_overflow                                      ;808101;

IncY_OverflowCheck:
    INY                                                                  ;808103;
    BEQ IncY_OverflowCheck_overflow                                      ;808104;
    RTS                                                                  ;808106;


IncY_OverflowCheck_overflow:
    INC.B $02                                                            ;808107; Increment $02
    PEI.B ($01)                                                          ;808109;
    PLB                                                                  ;80810B; DB = [$02]
    PLB                                                                  ;80810C;
    LDY.W #$8000                                                         ;80810D; Y = 8000h
    RTS                                                                  ;808110;


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


CheckIfMusicIsQueued:
    PHP                                                                  ;808EF4;
    REP #$30                                                             ;808EF5;
    PHX                                                                  ;808EF7;
    LDX.W #$000E                                                         ;808EF8;

.loop:
    LDA.W $0629,X                                                        ;808EFB;
    BNE .nonZeroTimer                                                    ;808EFE;
    DEX                                                                  ;808F00;
    DEX                                                                  ;808F01;
    BPL .loop                                                            ;808F02;
    PLX                                                                  ;808F04;
    PLP                                                                  ;808F05;
    CLC                                                                  ;808F06;
    RTL                                                                  ;808F07;


.nonZeroTimer:
    PLX                                                                  ;808F08;
    PLP                                                                  ;808F09;
    SEC                                                                  ;808F0A;
    RTL                                                                  ;808F0B;


HandleMusicQueue:
    PHP                                                                  ;808F0C;
    REP #$20                                                             ;808F0D;
    DEC.W $063F                                                          ;808F0F;
    BMI .negative                                                        ;808F12;
    BEQ .positive                                                        ;808F14;
    PLP                                                                  ;808F16;
    RTL                                                                  ;808F17;


.positive:
    LDA.W $063D                                                          ;808F18;
    BMI .musicData                                                       ;808F1B;
    SEP #$20                                                             ;808F1D;
    AND.B #$7F                                                           ;808F1F;
    STA.W $07F5                                                          ;808F21;
    STZ.W $07F6                                                          ;808F24;
    STA.W $2140                                                          ;808F27;
    STA.W $064C                                                          ;808F2A;
    REP #$20                                                             ;808F2D;
    LDA.W #$0008                                                         ;808F2F;
    STA.W $0686                                                          ;808F32;
    LDX.W $063B                                                          ;808F35;
    STZ.W $0619,X                                                        ;808F38;
    STZ.W $0629,X                                                        ;808F3B;
    INX                                                                  ;808F3E;
    INX                                                                  ;808F3F;
    TXA                                                                  ;808F40;
    AND.W #$000E                                                         ;808F41;
    STA.W $063B                                                          ;808F44;

.negative:
    LDX.W $063B                                                          ;808F47;
    CPX.W $0639                                                          ;808F4A;
    BEQ .clearTimer                                                      ;808F4D;
    LDA.W $0619,X                                                        ;808F4F;
    STA.W $063D                                                          ;808F52;
    LDA.W $0629,X                                                        ;808F55;
    STA.W $063F                                                          ;808F58;
    PLP                                                                  ;808F5B;
    RTL                                                                  ;808F5C;


.clearTimer:
    STZ.W $063F                                                          ;808F5D;
    PLP                                                                  ;808F60;
    RTL                                                                  ;808F61;


.musicData:
    AND.W #$00FF                                                         ;808F62;
    STA.W $07F3                                                          ;808F65;
    TAX                                                                  ;808F68;
    SEP #$20                                                             ;808F69;
    LDA.B #$FF                                                           ;808F6B;
    STA.W $064C                                                          ;808F6D;
    REP #$20                                                             ;808F70;
    LDA.L Music_Pointers,X                                               ;808F72;
    STA.B $00                                                            ;808F76;
    LDA.L Music_Pointers+1,X                                             ;808F78;
    STA.B $01                                                            ;808F7C;
    JSL.L UploadToAPU_long                                               ;808F7E;
    SEP #$20                                                             ;808F82;
    STZ.W $064C                                                          ;808F84;
    REP #$20                                                             ;808F87;
    LDX.W $063B                                                          ;808F89;
    STZ.W $0619,X                                                        ;808F8C;
    STZ.W $0629,X                                                        ;808F8F;
    INX                                                                  ;808F92;
    INX                                                                  ;808F93;
    TXA                                                                  ;808F94;
    AND.W #$000E                                                         ;808F95;
    STA.W $063B                                                          ;808F98;
    LDA.W #$0008                                                         ;808F9B;
    STA.W $0686                                                          ;808F9E;
    PLP                                                                  ;808FA1;
    RTL                                                                  ;808FA2;


UNUSED_QueueMusicDataOrTrack_808FA3:
    PHP                                                                  ;808FA3;
    REP #$30                                                             ;808FA4;
    PHX                                                                  ;808FA6;
    PHY                                                                  ;808FA7;
    LDX.W $0639                                                          ;808FA8;
    STA.W $0619,X                                                        ;808FAB;
    LDA.W #$0010                                                         ;808FAE;
    STA.W $0629,X                                                        ;808FB1;
    INX                                                                  ;808FB4;
    INX                                                                  ;808FB5;
    TXA                                                                  ;808FB6;
    AND.W #$000E                                                         ;808FB7;
    STA.W $0639                                                          ;808FBA;
    PLY                                                                  ;808FBD;
    PLX                                                                  ;808FBE;
    PLP                                                                  ;808FBF;
    RTL                                                                  ;808FC0;


QueueMusicDataOrTrack_8FrameDelay:
    PHP                                                                  ;808FC1;
    REP #$30                                                             ;808FC2;
    PHX                                                                  ;808FC4;
    PHY                                                                  ;808FC5;
    LDX.W $0998                                                          ;808FC6;
    CPX.W #$0028                                                         ;808FC9;
    BCS .return                                                          ;808FCC;
    PHA                                                                  ;808FCE;
    LDA.W $0639                                                          ;808FCF;
    INC A                                                                ;808FD2;
    INC A                                                                ;808FD3;
    AND.W #$000E                                                         ;808FD4;
    TAX                                                                  ;808FD7;
    PLA                                                                  ;808FD8;
    CPX.W $063B                                                          ;808FD9;
    BEQ .return                                                          ;808FDC;
    LDX.W $0639                                                          ;808FDE;
    STA.W $0619,X                                                        ;808FE1;
    LDA.W #$0008                                                         ;808FE4;
    STA.W $0629,X                                                        ;808FE7;
    INX                                                                  ;808FEA;
    INX                                                                  ;808FEB;
    TXA                                                                  ;808FEC;
    AND.W #$000E                                                         ;808FED;
    STA.W $0639                                                          ;808FF0;

.return:
    PLY                                                                  ;808FF3;
    PLX                                                                  ;808FF4;
    PLP                                                                  ;808FF5;
    RTL                                                                  ;808FF6;


QueueMusicDataOrTrack_YFrameDelay:
    PHP                                                                  ;808FF7;
    REP #$30                                                             ;808FF8;
    PHX                                                                  ;808FFA;
    LDX.W $0998                                                          ;808FFB;
    CPX.W #$0028                                                         ;808FFE;
    BCS .return                                                          ;809001;
    LDX.W $0639                                                          ;809003;
    STA.W $0619,X                                                        ;809006;
    TYA                                                                  ;809009;
    CMP.W #$0008                                                         ;80900A;
    BCS .setTimer                                                        ;80900D;
    LDA.W #$0008                                                         ;80900F;

.setTimer:
    STA.W $0629,X                                                        ;809012;
    INX                                                                  ;809015;
    INX                                                                  ;809016;
    TXA                                                                  ;809017;
    AND.W #$000E                                                         ;809018;
    STA.W $0639                                                          ;80901B;

.return:
    PLX                                                                  ;80901E;
    PLP                                                                  ;80901F;
    RTL                                                                  ;809020;


QueueSound:
    PHX                                                                  ;809021;
    PHY                                                                  ;809022;
    PHP                                                                  ;809023;
    SEP #$30                                                             ;809024;
    XBA                                                                  ;809026;
    LDA.B #$0F                                                           ;809027;
    BRA QueueSound_Lib1                                                  ;809029;


QueueSound_Lib1_Max9:
    PHX                                                                  ;80902B;
    PHY                                                                  ;80902C;
    PHP                                                                  ;80902D;
    SEP #$30                                                             ;80902E;
    XBA                                                                  ;809030;
    LDA.B #$09                                                           ;809031;
    BRA QueueSound_Lib1                                                  ;809033;


QueueSound_Lib1_Max3:
    PHX                                                                  ;809035;
    PHY                                                                  ;809036;
    PHP                                                                  ;809037;
    SEP #$30                                                             ;809038;
    XBA                                                                  ;80903A;
    LDA.B #$03                                                           ;80903B;
    BRA QueueSound_Lib1                                                  ;80903D;


QueueSound_Lib1_Max1:
    PHX                                                                  ;80903F;
    PHY                                                                  ;809040;
    PHP                                                                  ;809041;
    SEP #$30                                                             ;809042;
    XBA                                                                  ;809044;
    LDA.B #$01                                                           ;809045;
    BRA QueueSound_Lib1                                                  ;809047;


QueueSound_Lib1_Max6:
    PHX                                                                  ;809049;
    PHY                                                                  ;80904A;
    PHP                                                                  ;80904B;
    SEP #$30                                                             ;80904C;
    XBA                                                                  ;80904E;
    LDA.B #$06                                                           ;80904F;

QueueSound_Lib1:
    STA.W $0653                                                          ;809051;
    LDA.W $0646                                                          ;809054;
    SEC                                                                  ;809057;
    SBC.W $0643                                                          ;809058;
    AND.B #$0F                                                           ;80905B;
    CMP.W $0653                                                          ;80905D;
    BCS .return                                                          ;809060;
    XBA                                                                  ;809062;
    REP #$30                                                             ;809063;
    LDX.W $05F5                                                          ;809065;
    BNE .return                                                          ;809068;
    LDX.W $0998                                                          ;80906A;
    CPX.W #$0028                                                         ;80906D;
    BCS .return                                                          ;809070;
    LDX.W $0592                                                          ;809072;
    BMI .return                                                          ;809075;
    SEP #$30                                                             ;809077;
    LDY.W $0646                                                          ;809079;
    TYX                                                                  ;80907C;
    INX                                                                  ;80907D;
    CPX.B #$10                                                           ;80907E;
    BCC .queueSound                                                      ;809080;
    LDX.B #$00                                                           ;809082;

.queueSound:
    CPX.W $0643                                                          ;809084;
    BEQ .queueFull                                                       ;809087;
    STA.W $0656,Y                                                        ;809089;
    STX.W $0646                                                          ;80908C;
    STZ.W $0656,X                                                        ;80908F;

.return:
    PLP                                                                  ;809092;
    PLY                                                                  ;809093;
    PLX                                                                  ;809094;
    RTL                                                                  ;809095;


.queueFull:
    JSR.W NOPRTS_8091A7                                                  ;809096;
    CMP.W $0656,Y                                                        ;809099;
    BCS .return                                                          ;80909C;
    STA.W $0656,Y                                                        ;80909E;
    BRA .return                                                          ;8090A1;


QueueSound_Lib2_Max15:
    PHX                                                                  ;8090A3;
    PHY                                                                  ;8090A4;
    PHP                                                                  ;8090A5;
    SEP #$30                                                             ;8090A6;
    XBA                                                                  ;8090A8;
    LDA.B #$0F                                                           ;8090A9;
    BRA QueueSound_Lib2                                                  ;8090AB;


QueueSound_Lib2_Max9:
    PHX                                                                  ;8090AD;
    PHY                                                                  ;8090AE;
    PHP                                                                  ;8090AF;
    SEP #$30                                                             ;8090B0;
    XBA                                                                  ;8090B2;
    LDA.B #$09                                                           ;8090B3;
    BRA QueueSound_Lib2                                                  ;8090B5;


QueueSound_Lib2_Max3:
    PHX                                                                  ;8090B7;
    PHY                                                                  ;8090B8;
    PHP                                                                  ;8090B9;
    SEP #$30                                                             ;8090BA;
    XBA                                                                  ;8090BC;
    LDA.B #$03                                                           ;8090BD;
    BRA QueueSound_Lib2                                                  ;8090BF;


QueueSound_Lib2_Max1:
    PHX                                                                  ;8090C1;
    PHY                                                                  ;8090C2;
    PHP                                                                  ;8090C3;
    SEP #$30                                                             ;8090C4;
    XBA                                                                  ;8090C6;
    LDA.B #$01                                                           ;8090C7;
    BRA QueueSound_Lib2                                                  ;8090C9;


QueueSound_Lib2_Max6:
    PHX                                                                  ;8090CB;
    PHY                                                                  ;8090CC;
    PHP                                                                  ;8090CD;
    SEP #$30                                                             ;8090CE;
    XBA                                                                  ;8090D0;
    LDA.B #$06                                                           ;8090D1;

QueueSound_Lib2:
    STA.W $0654                                                          ;8090D3;
    LDA.W $0647                                                          ;8090D6;
    SEC                                                                  ;8090D9;
    SBC.W $0644                                                          ;8090DA;
    AND.B #$0F                                                           ;8090DD;
    CMP.W $0654                                                          ;8090DF;
    BCS .return                                                          ;8090E2;
    XBA                                                                  ;8090E4;
    REP #$30                                                             ;8090E5;
    LDX.W $05F5                                                          ;8090E7;
    BNE .return                                                          ;8090EA;
    LDX.W $0998                                                          ;8090EC;
    CPX.W #$0028                                                         ;8090EF;
    BCS .return                                                          ;8090F2;
    LDX.W $0592                                                          ;8090F4;
    BMI .return                                                          ;8090F7;
    SEP #$30                                                             ;8090F9;
    LDY.W $0647                                                          ;8090FB;
    TYX                                                                  ;8090FE;
    INX                                                                  ;8090FF;
    CPX.B #$10                                                           ;809100;
    BCC .queueSound                                                      ;809102;
    LDX.B #$00                                                           ;809104;

.queueSound:
    CPX.W $0644                                                          ;809106;
    BEQ .queueFull                                                       ;809109;
    STA.W $0666,Y                                                        ;80910B;
    STX.W $0647                                                          ;80910E;
    STZ.W $0666,X                                                        ;809111;

.return:
    PLP                                                                  ;809114;
    PLY                                                                  ;809115;
    PLX                                                                  ;809116;
    RTL                                                                  ;809117;


.queueFull:
    JSR.W NOPRTS_8091A7                                                  ;809118;
    CMP.W $0666,Y                                                        ;80911B;
    BCS .return                                                          ;80911E;
    STA.W $0666,Y                                                        ;809120;
    BRA .return                                                          ;809123;


QueueSound_Lib3_Max15:
    PHX                                                                  ;809125;
    PHY                                                                  ;809126;
    PHP                                                                  ;809127;
    SEP #$30                                                             ;809128;
    XBA                                                                  ;80912A;
    LDA.B #$0F                                                           ;80912B;
    BRA QueueSound_Lib3                                                  ;80912D;


QueueSound_Lib3_Max9:
    PHX                                                                  ;80912F;
    PHY                                                                  ;809130;
    PHP                                                                  ;809131;
    SEP #$30                                                             ;809132;
    XBA                                                                  ;809134;
    LDA.B #$09                                                           ;809135;
    BRA QueueSound_Lib3                                                  ;809137;


QueueSound_Lib3_Max3:
    PHX                                                                  ;809139;
    PHY                                                                  ;80913A;
    PHP                                                                  ;80913B;
    SEP #$30                                                             ;80913C;
    XBA                                                                  ;80913E;
    LDA.B #$03                                                           ;80913F;
    BRA QueueSound_Lib3                                                  ;809141;


QueueSound_Lib3_Max1:
    PHX                                                                  ;809143;
    PHY                                                                  ;809144;
    PHP                                                                  ;809145;
    SEP #$30                                                             ;809146;
    XBA                                                                  ;809148;
    LDA.B #$01                                                           ;809149;
    BRA QueueSound_Lib3                                                  ;80914B;


QueueSound_Lib3_Max6:
    PHX                                                                  ;80914D;
    PHY                                                                  ;80914E;
    PHP                                                                  ;80914F;
    SEP #$30                                                             ;809150;
    XBA                                                                  ;809152;
    LDA.B #$06                                                           ;809153;

QueueSound_Lib3:
    STA.W $0655                                                          ;809155;
    LDA.W $0648                                                          ;809158;
    SEC                                                                  ;80915B;
    SBC.W $0645                                                          ;80915C;
    AND.B #$0F                                                           ;80915F;
    CMP.W $0655                                                          ;809161;
    BCS .return                                                          ;809164;
    XBA                                                                  ;809166;
    REP #$30                                                             ;809167;
    LDX.W $05F5                                                          ;809169;
    BNE .return                                                          ;80916C;
    LDX.W $0998                                                          ;80916E;
    CPX.W #$0028                                                         ;809171;
    BCS .return                                                          ;809174;
    LDX.W $0592                                                          ;809176;
    BMI .return                                                          ;809179;
    SEP #$30                                                             ;80917B;
    LDY.W $0648                                                          ;80917D;
    TYX                                                                  ;809180;
    INX                                                                  ;809181;
    CPX.B #$10                                                           ;809182;
    BCC .queueSound                                                      ;809184;
    LDX.B #$00                                                           ;809186;

.queueSound:
    CPX.W $0645                                                          ;809188;
    BEQ .queueFull                                                       ;80918B;
    STA.W $0676,Y                                                        ;80918D;
    STX.W $0648                                                          ;809190;
    STZ.W $0676,X                                                        ;809193;

.return:
    PLP                                                                  ;809196;
    PLY                                                                  ;809197;
    PLX                                                                  ;809198;
    RTL                                                                  ;809199;


.queueFull:
    JSR.W NOPRTS_8091A7                                                  ;80919A;
    CMP.W $0676,Y                                                        ;80919D;
    BCS .return                                                          ;8091A0;
    STA.W $0676,Y                                                        ;8091A2;
    BRA .return                                                          ;8091A5;


NOPRTS_8091A7:
    NOP                                                                  ;8091A7;
    RTS                                                                  ;8091A8;


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
    LDX.B #$92                                                           ;809377;
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
    LDX.B #$87                                                           ;809417;
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


InterruptCommandPointers:
    dw Interrupt_Cmd0                                                    ;809616;
    dw Interrupt_Cmd2_DisableHVCounterInterrupts                         ;809618;
    dw Interrupt_Cmd4_MainGameplay_BeginHUDDrawing                       ;80961A;
    dw Interrupt_Cmd6_MainGameplay_EndHUDDrawing                         ;80961C;
    dw Interrupt_Cmd8_StartDoorTransition_BeginHUDDrawing                ;80961E;
    dw Interrupt_CmdA_StartDoorTransition_EndHUDDrawing                  ;809620;
    dw Interrupt_CmdC_Draygon_BeginHUDDrawing                            ;809622;
    dw Interrupt_CmdE_Draygon_EndHUDDrawing                              ;809624;
    dw Interrupt_Cmd10_VerticalDoorTransition_BeginHUDDrawing            ;809626;
    dw Interrupt_Cmd12_VerticalDoorTransition_EndHUDDrawing              ;809628;
    dw Interrupt_Cmd14_VerticalDoorTransition_EndDrawing                 ;80962A;
    dw Interrupt_Cmd16_HorizontalDoorTransition_BeginHUDDrawing          ;80962C;
    dw Interrupt_Cmd18_HorizontalDoorTransition_EndHUDDrawing            ;80962E;
    dw Interrupt_Cmd1A_HorizontalDoorTransition_EndDrawing               ;809630;

ExecuteDoorTransitionVRAMUpdate:
    SEP #$20                                                             ;809632;
    LDA.B #$80                                                           ;809634;
    STA.W $2100                                                          ;809636;
    LDX.W $05BE                                                          ;809639;
    STX.W $2116                                                          ;80963C;
    LDX.W #$1801                                                         ;80963F;
    STX.W $4310                                                          ;809642;
    LDX.W $05C0                                                          ;809645;
    STX.W $4312                                                          ;809648;
    LDA.W $05C2                                                          ;80964B;
    STA.W $4314                                                          ;80964E;
    LDX.W $05C3                                                          ;809651;
    STX.W $4315                                                          ;809654;
    LDA.B #$80                                                           ;809657;
    STA.W $2115                                                          ;809659;
    LDA.B #$02                                                           ;80965C;
    STA.W HW_MDMAEN                                                      ;80965E;
    LDA.B #$80                                                           ;809661;
    TRB.W $05BD                                                          ;809663;
    LDA.B #$0F                                                           ;809666;
    STA.W $2100                                                          ;809668;
    REP #$20                                                             ;80966B;
    RTS                                                                  ;80966D;


Interrupt_Cmd0:
    LDA.B $A7                                                            ;80966E;
    BEQ .returnZero                                                      ;809670;
    STZ.B $A7                                                            ;809672;
    BRA .return                                                          ;809674;


.returnZero:
    LDA.W #$0000                                                         ;809676;

.return:
    LDX.W #$0000                                                         ;809679;
    LDY.W #$0000                                                         ;80967C;
    RTS                                                                  ;80967F;


Interrupt_Cmd2_DisableHVCounterInterrupts:
    LDA.W #$0030                                                         ;809680;
    TRB.B $84                                                            ;809683;
    LDA.W #$0000                                                         ;809685;
    TAX                                                                  ;809688;
    TAY                                                                  ;809689;
    RTS                                                                  ;80968A;


Interrupt_Cmd4_MainGameplay_BeginHUDDrawing:
    SEP #$20                                                             ;80968B;
    LDA.B #$5A                                                           ;80968D;
    STA.W $2109                                                          ;80968F;
    STZ.W $2130                                                          ;809692;
    STZ.W $2131                                                          ;809695;
    LDA.B #$04                                                           ;809698;
    STA.W $212C                                                          ;80969A;
    REP #$20                                                             ;80969D;
    LDA.W #$0006                                                         ;80969F;
    LDY.W #$001F                                                         ;8096A2;
    LDX.W #$0098                                                         ;8096A5;
    RTS                                                                  ;8096A8;


Interrupt_Cmd6_MainGameplay_EndHUDDrawing:
    SEP #$20                                                             ;8096A9;
    LDA.B $70                                                            ;8096AB;
    STA.W $2130                                                          ;8096AD;
    LDA.B $73                                                            ;8096B0;
    STA.W $2131                                                          ;8096B2;
    LDA.B $5B                                                            ;8096B5;
    STA.W $2109                                                          ;8096B7;
    LDA.B $6A                                                            ;8096BA;
    STA.W $212C                                                          ;8096BC;
    REP #$20                                                             ;8096BF;
    LDA.B $A7                                                            ;8096C1;
    BEQ .setCommand4                                                     ;8096C3;
    STZ.B $A7                                                            ;8096C5;
    BRA .return                                                          ;8096C7;


.setCommand4:
    LDA.W #$0004                                                         ;8096C9;

.return:
    LDY.W #$0000                                                         ;8096CC;
    LDX.W #$0098                                                         ;8096CF;
    RTS                                                                  ;8096D2;


Interrupt_Cmd8_StartDoorTransition_BeginHUDDrawing:
    SEP #$20                                                             ;8096D3;
    LDA.B #$5A                                                           ;8096D5;
    STA.W $2109                                                          ;8096D7;
    LDA.B #$04                                                           ;8096DA;
    STA.W $212C                                                          ;8096DC;
    STZ.W $2130                                                          ;8096DF;
    STZ.W $2131                                                          ;8096E2;
    REP #$20                                                             ;8096E5;
    LDA.W #$000A                                                         ;8096E7;
    LDY.W #$001F                                                         ;8096EA;
    LDX.W #$0098                                                         ;8096ED;
    RTS                                                                  ;8096F0;


Interrupt_CmdA_StartDoorTransition_EndHUDDrawing:
    SEP #$20                                                             ;8096F1;
    LDA.W $07B3                                                          ;8096F3;
    ORA.W $07B1                                                          ;8096F6;
    BIT.B #$01                                                           ;8096F9;
    BEQ .BG1Sprites                                                      ;8096FB;
    LDA.B #$10                                                           ;8096FD;
    BRA .sprites                                                         ;8096FF;


.BG1Sprites:
    LDA.B #$11                                                           ;809701;

.sprites:
    STA.W $212C                                                          ;809703;
    REP #$20                                                             ;809706;
    LDA.B $A7                                                            ;809708;
    BEQ .command8                                                        ;80970A;
    STZ.B $A7                                                            ;80970C;
    BRA .return                                                          ;80970E;


.command8:
    LDA.W #$0008                                                         ;809710;

.return:
    LDY.W #$0000                                                         ;809713;
    LDX.W #$0098                                                         ;809716;
    RTS                                                                  ;809719;


Interrupt_CmdC_Draygon_BeginHUDDrawing:
    SEP #$20                                                             ;80971A;
    LDA.B #$04                                                           ;80971C;
    STA.W $212C                                                          ;80971E;
    STZ.W $2130                                                          ;809721;
    STZ.W $2131                                                          ;809724;
    REP #$20                                                             ;809727;
    LDA.W #$000E                                                         ;809729;
    LDY.W #$001F                                                         ;80972C;
    LDX.W #$0098                                                         ;80972F;
    RTS                                                                  ;809732;


Interrupt_CmdE_Draygon_EndHUDDrawing:
    SEP #$20                                                             ;809733;
    LDA.B $5B                                                            ;809735;
    STA.W $2109                                                          ;809737;
    LDA.B $70                                                            ;80973A;
    STA.W $2130                                                          ;80973C;
    LDA.B $73                                                            ;80973F;
    STA.W $2131                                                          ;809741;
    REP #$20                                                             ;809744;
    LDA.B $A7                                                            ;809746;
    BEQ .commandC                                                        ;809748;
    STZ.B $A7                                                            ;80974A;
    BRA .return                                                          ;80974C;


.commandC:
    LDA.W #$000C                                                         ;80974E;

.return:
    LDY.W #$0000                                                         ;809751;
    LDX.W #$0098                                                         ;809754;
    RTS                                                                  ;809757;


Interrupt_Cmd10_VerticalDoorTransition_BeginHUDDrawing:
    SEP #$20                                                             ;809758;
    LDA.B #$04                                                           ;80975A;
    STA.W $212C                                                          ;80975C;
    STZ.W $2130                                                          ;80975F;
    STZ.W $2131                                                          ;809762;
    REP #$20                                                             ;809765;
    LDA.W #$0012                                                         ;809767;
    LDY.W #$001F                                                         ;80976A;
    LDX.W #$0098                                                         ;80976D;
    RTS                                                                  ;809770;


Interrupt_Cmd12_VerticalDoorTransition_EndHUDDrawing:
    SEP #$20                                                             ;809771;
    LDA.W $07B3                                                          ;809773;
    ORA.W $07B1                                                          ;809776;
    BIT.B #$01                                                           ;809779;
    BEQ .BG1Sprites                                                      ;80977B;
    LDA.B #$10                                                           ;80977D;
    BRA .sprites                                                         ;80977F;


.BG1Sprites:
    LDA.B #$11                                                           ;809781;

.sprites:
    STA.W $212C                                                          ;809783;
    STZ.W $2130                                                          ;809786;
    STZ.W $2131                                                          ;809789;
    REP #$20                                                             ;80978C;
    LDX.W $05BC                                                          ;80978E;
    BPL .scrolling                                                       ;809791;
    JSR.W ExecuteDoorTransitionVRAMUpdate                                ;809793;

.scrolling:
    LDA.W $0931                                                          ;809796;
    BMI .return                                                          ;809799;
    JSL.L DoorTransitionScrolling                                        ;80979B;

.return:
    LDA.W #$0014                                                         ;80979F;
    LDY.W #$00D8                                                         ;8097A2;
    LDX.W #$0098                                                         ;8097A5;
    RTS                                                                  ;8097A8;


Interrupt_Cmd14_VerticalDoorTransition_EndDrawing:
    LDA.B $A7                                                            ;8097A9;
    BEQ .command10                                                       ;8097AB;
    STZ.B $A7                                                            ;8097AD;
    BRA .return                                                          ;8097AF;


.command10:
    LDA.W #$0010                                                         ;8097B1;

.return:
    LDY.W #$0000                                                         ;8097B4;
    LDX.W #$0098                                                         ;8097B7;
    STZ.W $05B4                                                          ;8097BA;
    INC.W $05B4                                                          ;8097BD;
    RTS                                                                  ;8097C0;


Interrupt_Cmd16_HorizontalDoorTransition_BeginHUDDrawing:
    SEP #$20                                                             ;8097C1;
    LDA.B #$04                                                           ;8097C3;
    STA.W $212C                                                          ;8097C5;
    STZ.W $2130                                                          ;8097C8;
    STZ.W $2131                                                          ;8097CB;
    REP #$20                                                             ;8097CE;
    LDA.W #$0018                                                         ;8097D0;
    LDY.W #$001F                                                         ;8097D3;
    LDX.W #$0098                                                         ;8097D6;
    RTS                                                                  ;8097D9;


Interrupt_Cmd18_HorizontalDoorTransition_EndHUDDrawing:
    SEP #$20                                                             ;8097DA;
    LDA.W $07B3                                                          ;8097DC;
    ORA.W $07B1                                                          ;8097DF;
    BIT.B #$01                                                           ;8097E2;
    BEQ .BG1Sprites                                                      ;8097E4;
    LDA.B #$10                                                           ;8097E6;
    BRA .sprites                                                         ;8097E8;


.BG1Sprites:
    LDA.B #$11                                                           ;8097EA;

.sprites:
    STA.W $212C                                                          ;8097EC;
    STZ.W $2130                                                          ;8097EF;
    STZ.W $2131                                                          ;8097F2;
    REP #$20                                                             ;8097F5;
    LDA.W $0931                                                          ;8097F7;
    BMI .return                                                          ;8097FA;
    JSL.L DoorTransitionScrolling                                        ;8097FC;

.return:
    LDA.W #$001A                                                         ;809800;
    LDY.W #$00A0                                                         ;809803;
    LDX.W #$0098                                                         ;809806;
    RTS                                                                  ;809809;


Interrupt_Cmd1A_HorizontalDoorTransition_EndDrawing:
    LDX.W $05BC                                                          ;80980A;
    BPL .nextCommand                                                     ;80980D;
    JSR.W ExecuteDoorTransitionVRAMUpdate                                ;80980F;

.nextCommand:
    LDA.B $A7                                                            ;809812;
    BEQ .command16                                                       ;809814;
    STZ.B $A7                                                            ;809816;
    BRA .return                                                          ;809818;


.command16:
    LDA.W #$0016                                                         ;80981A;

.return:
    LDY.W #$0000                                                         ;80981D;
    LDX.W #$0098                                                         ;809820;
    STZ.W $05B4                                                          ;809823;
    INC.W $05B4                                                          ;809826;
    RTS                                                                  ;809829;


EnableHVCounterInterrupts:
    PHP                                                                  ;80982A;
    REP #$30                                                             ;80982B;
    LDA.W #$0000                                                         ;80982D;
    STA.W $4209                                                          ;809830;
    LDA.W #$0098                                                         ;809833;
    STA.W $4207                                                          ;809836;
    LDA.W #$0030                                                         ;809839;
    TSB.B $84                                                            ;80983C;
    PLP                                                                  ;80983E;
    CLI                                                                  ;80983F;
    RTL                                                                  ;809840;


EnableHVCounterInterruptsNow:
    PHP                                                                  ;809841;
    REP #$30                                                             ;809842;
    LDA.W #$0000                                                         ;809844;
    STA.W $4209                                                          ;809847;
    LDA.W #$0098                                                         ;80984A;
    STA.W $4207                                                          ;80984D;
    LDA.W #$0030                                                         ;809850;
    TSB.B $84                                                            ;809853;
    SEP #$20                                                             ;809855;
    LDA.B $84                                                            ;809857;
    STA.W $4200                                                          ;809859;
    PLP                                                                  ;80985C;
    CLI                                                                  ;80985D;
    RTL                                                                  ;80985E;


DisableHVCounterInterrupts:
    PHP                                                                  ;80985F;
    REP #$30                                                             ;809860;
    LDA.W #$0030                                                         ;809862;
    TRB.B $84                                                            ;809865;
    PLP                                                                  ;809867;
    SEI                                                                  ;809868;
    RTL                                                                  ;809869;


IRQ:
    REP #$30                                                             ;80986A;
    JML.L .bank80                                                        ;80986C;


.bank80:
    PHB                                                                  ;809870;
    PHA                                                                  ;809871;
    PHX                                                                  ;809872;
    PHY                                                                  ;809873;
    PHK                                                                  ;809874;
    PLB                                                                  ;809875;
    LDA.W $4211                                                          ;809876;
    LDX.B $AB                                                            ;809879;
    JSR.W (InterruptCommandPointers,X)                                   ;80987B;
    STA.B $AB                                                            ;80987E;
    STY.W $4209                                                          ;809880;
    STX.W $4207                                                          ;809883;
    PLY                                                                  ;809886;
    PLX                                                                  ;809887;
    PLA                                                                  ;809888;
    PLB                                                                  ;809889;
    RTI                                                                  ;80988A;


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
    LDA.W $09A2                                                          ;809AB1;
    BIT.W #$8000                                                         ;809AB4;
    BEQ .grapple                                                         ;809AB7;
    JSL.L AddXrayToHUDTilemap                                            ;809AB9;

.grapple:
    LDA.W $09A2                                                          ;809ABD;
    BIT.W #$4000                                                         ;809AC0;
    BEQ .missiles                                                        ;809AC3;
    JSL.L AddGrappleToHUDTilemap                                         ;809AC5;

.missiles:
    LDA.W $09C8                                                          ;809AC9;
    BEQ .superMissiles                                                   ;809ACC;
    JSL.L AddMissilesToHUDTilemap                                        ;809ACE;

.superMissiles:
    LDA.W $09CC                                                          ;809AD2;
    BEQ .powerBombs                                                      ;809AD5;
    JSL.L AddSuperMissilesToHUDTilemap                                   ;809AD7;

.powerBombs:
    LDA.W $09D0                                                          ;809ADB;
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
    LDA.W #$0080                                                         ;809AFC; bank $80
    STA.B $02                                                            ;809AFF;
    LDA.W $09C8                                                          ;809B01;
    BEQ .maxSuperMissiles                                                ;809B04;
    LDA.W $09C6                                                          ;809B06;
    LDX.W #$0094                                                         ;809B09;
    JSR.W DrawThreeHUDDigits                                             ;809B0C;

.maxSuperMissiles:
    LDA.W $09CC                                                          ;809B0F;
    BEQ .maxPowerBombs                                                   ;809B12;
    LDX.W #$009C                                                         ;809B14;
    LDA.W $09CA                                                          ;809B17;
    JSR.W DrawTwoHUDDigits                                               ;809B1A;

.maxPowerBombs:
    LDA.W $09D0                                                          ;809B1D;
    BEQ .highlight                                                       ;809B20;
    LDA.W $09CE                                                          ;809B22;
    LDX.W #$00A2                                                         ;809B25;
    JSR.W DrawTwoHUDDigits                                               ;809B28;

.highlight:
    LDA.W $09D2                                                          ;809B2B;
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
    LDA.W $09C0                                                          ;809B4E;
    CMP.W #$0001                                                         ;809B51;
    BNE .handleSamusHealth                                               ;809B54;
    LDY.W #Tilemap_HUD_autoReserve                                       ;809B56;
    LDA.W $09D6                                                          ;809B59;
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
    LDA.W $09C2                                                          ;809B8B;
    CMP.W $0A06                                                          ;809B8E;
    BEQ .handleSamusMissiles                                             ;809B91;
    STA.W $0A06                                                          ;809B93;
    LDA.W $09C2                                                          ;809B96;
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
    LDA.W $09C4                                                          ;809BB3;
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
    LDA.W $09C8                                                          ;809C00;
    BEQ .handleSuperMissiles                                             ;809C03;
    LDA.W $09C6                                                          ;809C05;
    CMP.W $0A08                                                          ;809C08;
    BEQ .handleSuperMissiles                                             ;809C0B;
    STA.W $0A08                                                          ;809C0D;
    LDX.W #$0094                                                         ;809C10;
    JSR.W DrawThreeHUDDigits                                             ;809C13;

.handleSuperMissiles:
    LDA.W $09CC                                                          ;809C16;
    BEQ .handlePowerBombs                                                ;809C19;
    LDA.W $09CA                                                          ;809C1B;
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
    LDA.W $09D0                                                          ;809C3F;
    BEQ .handleHighlighter                                               ;809C42;
    LDA.W $09CE                                                          ;809C44;
    CMP.W $0A0C                                                          ;809C47;
    BEQ .handleHighlighter                                               ;809C4A;
    STA.W $0A0C                                                          ;809C4C;
    LDX.W #$00A2                                                         ;809C4F;
    JSR.W DrawTwoHUDDigits                                               ;809C52;

.handleHighlighter:
    LDA.W $09D2                                                          ;809C55;
    CMP.W $0A0E                                                          ;809C58;
    BEQ .handleAutoCancel                                                ;809C5B;
    LDX.W #$1000                                                         ;809C5D;
    JSR.W ToggleHUDItemHighlight                                         ;809C60;
    LDA.W $0A0E                                                          ;809C63;
    LDX.W #$1400                                                         ;809C66;
    JSR.W ToggleHUDItemHighlight                                         ;809C69;
    LDA.W $09D2                                                          ;809C6C;
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
    dw LoadStations_Ceres                                                ;80C4C1;
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


LoadStations_Ceres:
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
