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
