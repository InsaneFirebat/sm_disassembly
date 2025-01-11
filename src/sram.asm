SaveToSRAM:
    PHP                                                                  ;818000;
    REP #$30                                                             ;818001;
    PHB                                                                  ;818003;
    PHX                                                                  ;818004;
    PHY                                                                  ;818005;
    PEA.W $7E00                                                          ;818006;
    PLB                                                                  ;818009;
    PLB                                                                  ;81800A;
    STZ.B $14                                                            ;81800B;
    AND.W #$0003                                                         ;81800D;
    ASL A                                                                ;818010;
    STA.B $12                                                            ;818011;
    LDY.W #sizeof(Equipment)-2                                           ;818013;

.loopSamus:
    LDA.W Equipment.start,Y                                              ;818016;
    STA.W $D7C0,Y                                                        ;818019;
    DEY                                                                  ;81801C;
    DEY                                                                  ;81801D;
    BPL .loopSamus                                                       ;81801E;
    LDX.W #$0000                                                         ;818020;
    LDA.W $079F                                                          ;818023;
    XBA                                                                  ;818026;
    TAX                                                                  ;818027;
    LDY.W #$0000                                                         ;818028;

.loopMap:
    LDA.W $07F7,Y                                                        ;81802B;
    STA.W $CD52,X                                                        ;81802E;
    INY                                                                  ;818031;
    INY                                                                  ;818032;
    INX                                                                  ;818033;
    INX                                                                  ;818034;
    CPY.W #$0100                                                         ;818035;
    BMI .loopMap                                                         ;818038;
    JSR.W SaveMap                                                        ;81803A;
    LDA.W $078B                                                          ;81803D;
    STA.W $D916                                                          ;818040;
    LDA.W $079F                                                          ;818043;
    STA.W $D918                                                          ;818046;
    LDX.B $12                                                            ;818049;
    LDA.L SaveSlotOffsets,X                                              ;81804B;
    TAX                                                                  ;81804F;
    LDY.W #$D7C0                                                         ;818050; $7E

.loopToSRAM:
    LDA.W $0000,Y                                                        ;818053;
    STA.L $700000,X                                                      ;818056;
    CLC                                                                  ;81805A;
    ADC.B $14                                                            ;81805B;
    STA.B $14                                                            ;81805D;
    INX                                                                  ;81805F;
    INX                                                                  ;818060;
    INY                                                                  ;818061;
    INY                                                                  ;818062;
    CPY.W #$DE1C                                                         ;818063; $7E
    BNE .loopToSRAM                                                      ;818066;
    LDX.B $12                                                            ;818068;
    LDA.B $14                                                            ;81806A;
    STA.L $700000,X                                                      ;81806C;
    STA.L $701FF0,X                                                      ;818070;
    EOR.W #$FFFF                                                         ;818074;
    STA.L $700008,X                                                      ;818077;
    STA.L $701FF8,X                                                      ;81807B;
    PLY                                                                  ;81807F;
    PLX                                                                  ;818080;
    CLC                                                                  ;818081;
    PLB                                                                  ;818082;
    PLP                                                                  ;818083;
    RTL                                                                  ;818084;


LoadFromSRAM:
    REP #$30                                                             ;818085;
    PHB                                                                  ;818087;
    PHX                                                                  ;818088;
    PHY                                                                  ;818089;
    PEA.W $7E00                                                          ;81808A;
    PLB                                                                  ;81808D;
    PLB                                                                  ;81808E;
    STZ.B $14                                                            ;81808F;
    AND.W #$0003                                                         ;818091;
    ASL A                                                                ;818094;
    STA.B $12                                                            ;818095;
    TAX                                                                  ;818097;
    LDA.L SaveSlotOffsets,X                                              ;818098;
    TAX                                                                  ;81809C;
    LDY.W #$D7C0                                                         ;81809D; $7E

.loop:
    LDA.L $700000,X                                                      ;8180A0;
    STA.W $0000,Y                                                        ;8180A4;
    CLC                                                                  ;8180A7;
    ADC.B $14                                                            ;8180A8;
    STA.B $14                                                            ;8180AA;
    INX                                                                  ;8180AC;
    INX                                                                  ;8180AD;
    INY                                                                  ;8180AE;
    INY                                                                  ;8180AF;
    CPY.W #$DE1C                                                         ;8180B0; $7E
    BNE .loop                                                            ;8180B3;
    LDX.B $12                                                            ;8180B5;
    LDA.B $14                                                            ;8180B7;
    CMP.L $700000,X                                                      ;8180B9;
    BNE .doubleCheck                                                     ;8180BD;
    EOR.W #$FFFF                                                         ;8180BF;
    CMP.L $700008,X                                                      ;8180C2;
    BNE .doubleCheck                                                     ;8180C6;
    BRA .success                                                         ;8180C8;


.doubleCheck:
    LDA.B $14                                                            ;8180CA;
    CMP.L $701FF0,X                                                      ;8180CC;
    BNE .corrupt                                                         ;8180D0;
    EOR.W #$FFFF                                                         ;8180D2;
    CMP.L $701FF8,X                                                      ;8180D5;
    BNE .corrupt                                                         ;8180D9;

.success:
    LDY.W #sizeof(Equipment)-2                                           ;8180DB;

.loopSuccess:
    LDA.W $D7C0,Y                                                        ;8180DE;
    STA.W Equipment.start,Y                                              ;8180E1;
    DEY                                                                  ;8180E4;
    DEY                                                                  ;8180E5;
    BPL .loopSuccess                                                     ;8180E6;
    JSR.W LoadMap                                                        ;8180E8;
    LDA.W $D916                                                          ;8180EB;
    STA.W $078B                                                          ;8180EE;
    LDA.W $D918                                                          ;8180F1;
    STA.W $079F                                                          ;8180F4;
    PLY                                                                  ;8180F7;
    PLX                                                                  ;8180F8;
    CLC                                                                  ;8180F9;
    PLB                                                                  ;8180FA;
    RTL                                                                  ;8180FB;


.corrupt:
    STZ.B $14                                                            ;8180FC;
    LDX.B $12                                                            ;8180FE;
    LDA.L SaveSlotOffsets,X                                              ;818100;
    TAX                                                                  ;818104;
    LDY.W #$D7C0                                                         ;818105; $7E
    LDA.W #$0000                                                         ;818108;

.loopCorrupt:
    STA.L $700000,X                                                      ;81810B;
    CLC                                                                  ;81810F;
    ADC.B $14                                                            ;818110;
    STA.B $14                                                            ;818112;
    INX                                                                  ;818114;
    INX                                                                  ;818115;
    INY                                                                  ;818116;
    INY                                                                  ;818117;
    CPY.W #$DE1C                                                         ;818118; $7E
    BNE .loopCorrupt                                                     ;81811B;
    LDA.W #$0000                                                         ;81811D;
    STA.W $078B                                                          ;818120;
    STA.W $079F                                                          ;818123;
    PLY                                                                  ;818126;
    PLX                                                                  ;818127;
    SEC                                                                  ;818128;
    PLB                                                                  ;818129;
    RTL                                                                  ;81812A;


SaveSlotOffsets:
    dw $0010,$066C,$0CC8                                                 ;81812B;

; Lists of offsets into explored map data ($7E:CD52 + (area index) * 100h) whose bytes are saved to SRAM
; Map data offsets of 80h+ are specifying the right half of the map (7Fh- are specifying the left half)
; Each byte is 8 map tiles, and the first row (offsets 0..3 and 80h..83h) is meaningless padding
SRAMMapData_size:
    db $4A,$48,$4C,$12,$42,$15,$08                                       ;818131;

SRAMMapData_offset:
    db $00,$00,$4A,$00,$92,$00,$DE,$00,$F0,$00,$32,$01,$47,$01           ;818138;

SRAMMapData_crateria:
    db         $07                                                       ;818146;
    db         $0B
    db $0D,$0E,$0F
    db $11,    $13
    db $15,$16,$17
    db $19,$1A
    db $1D,$1E,$1F
    db $21,$22
    db $24,$25,$26
    db $28,    $2A,$2B
    db $2C,    $2E,$2F
    db $30,    $32,$33
    db         $36,$37
    db         $3A,$3B
    db         $3E,$3F
    db         $42,$43
    db         $46,$47
    db         $4A
    db         $4E
    db         $52
    db         $56
    db                 $84,$85
    db                 $88,$89
    db                 $8C,$8D
    db                 $90,$91
    db                 $94,$95,$96,$97
    db                 $98,$99,$9A,$9B
    db                 $9C,        $9F
    db                 $A0,        $A3
    db                 $A4,    $A6,$A7
    db                 $A8,    $AA,$AB
    db                 $AC,    $AE
    db                         $B2
    db                         $B6
    db                         $BA
    db $00,$00,$00,$00,$00,$00

SRAMMapData_brinstar:
    db     $05                                                           ;818196;
    db     $09,$0A,$0B
    db     $0D,$0E,$0F
    db     $11,$12,$13
    db $14,$15,$16,$17
    db     $19,$1A,$1B
    db $1C,$1D,$1E,$1F
    db $20,$21,$22,$23
    db     $25,$26,$27
    db     $29,$2A,$2B
    db $2C,$2D,$2E,$2F
    db $30,$31,$32,$33
    db     $35,$36,$37
    db     $39,$3A,$3B
    db         $42,$43
    db             $47
    db                 $90
    db                 $94
    db                 $98
    db                 $9C
    db                 $A0
    db                 $A4
    db                 $A8
    db                 $AC
    db                 $B0
    db                 $B4
    db                 $B8
    db                 $BC
    db                 $C0
    db                 $C4
    db                 $C8
    db                 $CC,$CD,$CE,$CF
    db                     $D1,$D2,$D3
    db                     $D5,$D9
    db $00,$00,$00,$00,$00,$00,$00,$00

SRAMMapData_norfair:
    db     $05                                                           ;8181E6;
    db $08,$09,    $0B
    db $0C,$0D,$0E,$0F
    db $10,$11,$12,$13
    db $14,$15,$16,$17
    db $18,$19,$1A,$1B
    db $1C,$1D,$1E,$1F
    db $20,$21,$22,$23
    db $24,$25,$26,$27
    db     $29,$2A,$2B
    db     $2D,$2E,$2F
    db     $31,$32,$33
    db $34,$35,$36,$37
    db $38,$39,$3A,$3B
    db $3C,$3D,$3E,$3F
    db $40,$41,$42
    db $44,$45,$46,$47
    db $48,$49,$4A
    db                 $8C


    db                 $98
    db                 $9C
    db                 $A0
    db                 $A4
    db                 $A8
    db                 $AC
    db                 $B0
    db                 $B4
    db                 $B8
    db                 $BC
    db                 $C0
    db                 $C4
    db $00,$00,$00,$00

SRAMMapData_wreckedShip:
    db     $2D,$2E                                                       ;818236;
    db     $31,$32
    db     $35,$36
    db     $39,$3A
    db     $3D,$3E
    db         $42
    db     $45,$46
    db     $49,$4A
    db         $4E
    db     $51,$52
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

SRAMMapData_maridia:
    db             $07                                                   ;818256;
    db             $0B
    db         $0E,$0F
    db         $12,$13
    db     $15,$16,$17
    db     $19,$1A,$1B
    db     $1D,$1E,$1F
    db     $21,$22,$23
    db     $25,$26,$27
    db     $29,$2A,$2B
    db     $2D,$2E,$2F
    db     $31,$32,$33
    db     $35,$36
    db     $39,$3A,$3B
    db     $3D,$3E,$3F
    db     $41,$42,$43
    db     $45,$46,$47
    db     $49,$4A
    db     $4D
    db     $51
    db                 $84
    db                 $88
    db                 $8C
    db                 $90
    db                 $94
    db                 $98
    db                 $9C,$9D
    db                 $A0,$A1
    db                 $A4,$A5
    db                 $A8,$A9
    db                 $AC,$AD
    db                 $C0
    db                 $C4
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

SRAMMapData_tourian:
    db         $26                                                       ;8182A6;
    db         $2A
    db         $2E
    db         $32
    db     $35,$36
    db     $39,$3A
    db         $3E
    db     $41,$42
    db     $45,$46
    db         $4A
    db     $4D,$4E
    db     $51,$52
    db     $55,$56
    db         $5A
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

SRAMMapData_colony:
    db     $2D                                                           ;8182C6;
    db     $31
    db     $35
    db     $39
    db     $3D
    db     $41
    db     $45,$46
    db $00,$00,$00,$00,$00,$00,$00,$00

MapRoomPointers:
    dw SRAMMapData_crateria                                              ;8182D6;
    dw SRAMMapData_brinstar                                              ;8182D8;
    dw SRAMMapData_norfair                                               ;8182DA;
    dw SRAMMapData_wreckedShip                                           ;8182DC;
    dw SRAMMapData_maridia                                               ;8182DE;
    dw SRAMMapData_tourian                                               ;8182E0;
    dw SRAMMapData_colony                                                ;8182E2;

LoadMap:
    PHB                                                                  ;8182E4;
    PHP                                                                  ;8182E5;
    PHK                                                                  ;8182E6;
    PLB                                                                  ;8182E7;
    REP #$30                                                             ;8182E8;
    LDX.W #$0700                                                         ;8182EA;
    LDA.W #$0000                                                         ;8182ED;

.loopTilesExplored:
    STA.L $7ECD52,X                                                      ;8182F0;
    DEX                                                                  ;8182F4;
    DEX                                                                  ;8182F5;
    BPL .loopTilesExplored                                               ;8182F6;
    STZ.B $16                                                            ;8182F8;

.loopArea:
    LDA.B $16                                                            ;8182FA;
    XBA                                                                  ;8182FC;
    STA.B $14                                                            ;8182FD;
    LDX.B $16                                                            ;8182FF;
    LDA.W SRAMMapData_size,X                                             ;818301;
    AND.W #$00FF                                                         ;818304;
    STA.B $12                                                            ;818307;
    LDA.B $16                                                            ;818309;
    ASL A                                                                ;81830B;
    TAX                                                                  ;81830C;
    LDA.W MapRoomPointers,X                                              ;81830D;
    STA.B $00                                                            ;818310;
    LDA.W #$0081                                                         ;818312;
    STA.B $02                                                            ;818315;
    LDA.W SRAMMapData_offset,X                                           ;818317;
    TAX                                                                  ;81831A;
    LDA.W #$CD52                                                         ;81831B; $7E
    STA.B $03                                                            ;81831E;
    LDA.W #$007E                                                         ;818320;
    STA.B $05                                                            ;818323;

.loopRoom:
    LDA.B ($00)                                                          ;818325;
    AND.W #$00FF                                                         ;818327;
    CLC                                                                  ;81832A;
    ADC.B $14                                                            ;81832B;
    TAY                                                                  ;81832D;
    SEP #$20                                                             ;81832E;
    LDA.L $7ED91C,X                                                      ;818330;
    STA.B [$03],Y                                                        ;818334;
    REP #$20                                                             ;818336;
    INC.B $00                                                            ;818338;
    INX                                                                  ;81833A;
    DEC.B $12                                                            ;81833B;
    BNE .loopRoom                                                        ;81833D;
    INC.B $16                                                            ;81833F;
    LDA.B $16                                                            ;818341;
    CMP.W #$0006                                                         ;818343;
    BMI .loopArea                                                        ;818346;
    PLP                                                                  ;818348;
    PLB                                                                  ;818349;
    RTS                                                                  ;81834A;


SaveMap:
    PHB                                                                  ;81834B;
    PHP                                                                  ;81834C;
    PHK                                                                  ;81834D;
    PLB                                                                  ;81834E;
    REP #$30                                                             ;81834F;
    STZ.B $1A                                                            ;818351;

.loopAreas:
    LDX.B $1A                                                            ;818353;
    LDA.W SRAMMapData_size,X                                             ;818355;
    AND.W #$00FF                                                         ;818358;
    STA.B $16                                                            ;81835B;
    LDA.B $1A                                                            ;81835D;
    ASL A                                                                ;81835F;
    TAX                                                                  ;818360;
    LDA.W MapRoomPointers,X                                              ;818361;
    STA.B $00                                                            ;818364;
    LDA.W SRAMMapData_offset,X                                           ;818366;
    TAX                                                                  ;818369;
    LDA.B $1A                                                            ;81836A;
    XBA                                                                  ;81836C;
    STA.B $18                                                            ;81836D;
    LDA.W #$CD52                                                         ;81836F; $7E
    STA.B $03                                                            ;818372;
    LDA.W #$007E                                                         ;818374;
    STA.B $05                                                            ;818377;

.loopRooms:
    LDA.B ($00)                                                          ;818379;
    AND.W #$00FF                                                         ;81837B;
    CLC                                                                  ;81837E;
    ADC.B $18                                                            ;81837F;
    TAY                                                                  ;818381;
    SEP #$20                                                             ;818382;
    LDA.B [$03],Y                                                        ;818384;
    STA.L $7ED91C,X                                                      ;818386;
    REP #$20                                                             ;81838A;
    INC.B $00                                                            ;81838C;
    INX                                                                  ;81838E;
    DEC.B $16                                                            ;81838F;
    BNE .loopRooms                                                       ;818391;
    INC.B $1A                                                            ;818393;
    LDA.B $1A                                                            ;818395;
    CMP.W #$0006                                                         ;818397;
    BMI .loopAreas                                                       ;81839A;
    PLP                                                                  ;81839C;
    PLB                                                                  ;81839D;
    RTS                                                                  ;81839E;
