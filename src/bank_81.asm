
; SRAM, spritemap handling

org $818000


;;; $8000: Save to SRAM ;;;
SaveToSRAM:
;; Parameter:
;;     A: SRAM slot (0, 1 or 2)

; Almost returns carry clear
    PHP                                                                  ;818000;
    REP #$30                                                             ;818001;
    PHB                                                                  ;818003;
    PHX                                                                  ;818004;
    PHY                                                                  ;818005;
    PEA.W SRAMMirror_Equipment>>8&$FF00                                  ;818006;
    PLB                                                                  ;818009;
    PLB                                                                  ;81800A;
    STZ.B DP_Temp14                                                      ;81800B;
    AND.W #$0003                                                         ;81800D;
    ASL                                                                  ;818010;
    STA.B DP_Temp12                                                      ;818011;
    LDY.W #$005E                                                         ;818013;

  .loopSamus:
    LDA.W EquippedItems,Y                                                ;818016;
    STA.W SRAMMirror_Equipment,Y                                         ;818019;
    DEY                                                                  ;81801C;
    DEY                                                                  ;81801D;
    BPL .loopSamus                                                       ;81801E;
    LDX.W #$0000                                                         ;818020;
    LDA.W AreaIndex                                                      ;818023;
    XBA                                                                  ;818026;
    TAX                                                                  ;818027;
    LDY.W #$0000                                                         ;818028;

  .loopMap:
    LDA.W MapTilesExplored,Y                                             ;81802B;
    STA.W ExploredMapTiles,X                                             ;81802E;
    INY                                                                  ;818031;
    INY                                                                  ;818032;
    INX                                                                  ;818033;
    INX                                                                  ;818034;
    CPY.W #$0100                                                         ;818035;
    BMI .loopMap                                                         ;818038;
    JSR.W SaveMap                                                        ;81803A;
    LDA.W LoadStationIndex                                               ;81803D;
    STA.W SRAMMirror_SaveStationIndex                                    ;818040;
    LDA.W AreaIndex                                                      ;818043;
    STA.W SRAMMirror_AreaIndex                                           ;818046;
    LDX.B DP_Temp12                                                      ;818049;
    LDA.L SaveSlotOffsets,X                                              ;81804B;
    TAX                                                                  ;81804F;
    LDY.W #SRAMMirror_Equipment                                          ;818050;

  .loopToSRAM:
    LDA.W $0000,Y                                                        ;818053;
    STA.L $700000,X                                                      ;818056;
    CLC                                                                  ;81805A;
    ADC.B DP_Temp14                                                      ;81805B;
    STA.B DP_Temp14                                                      ;81805D;
    INX                                                                  ;81805F;
    INX                                                                  ;818060;
    INY                                                                  ;818061;
    INY                                                                  ;818062;
    CPY.W #SRAMMirror_End+1                                              ;818063;
    BNE .loopToSRAM                                                      ;818066;
    LDX.B DP_Temp12                                                      ;818068;
    LDA.B DP_Temp14                                                      ;81806A;
    STA.L SRAM_Slot0Checksum0,X                                          ;81806C;
    STA.L SRAM_Slot0Checksum1,X                                          ;818070;
    EOR.W #$FFFF                                                         ;818074;
    STA.L SRAM_Slot0Complement0,X                                        ;818077;
    STA.L SRAM_Slot0Complement1,X                                        ;81807B;
    PLY                                                                  ;81807F;
    PLX                                                                  ;818080;
    CLC                                                                  ;818081;
    PLB                                                                  ;818082;
    PLP                                                                  ;818083;
    RTL                                                                  ;818084;


;;; $8085: Load from SRAM / clear SRAM ;;;
LoadFromSRAM:
;; Parameter:
;;     A: SRAM slot (0, 1 or 2)
;; Returns:
;;     Carry: Set if SRAM was corrupt

; Copies all the data from the SRAM slot out to $7E:D7C0..DE1B
; If SRAM is not corrupt (according to the checksums):
;     Copies data to $09A2..0A01 (Samus data and game options)
;     Loads map data to $7E:CD52..D351, clears Ceres map data $7E:D352..D451 (the working copy $07F7..08F6 isn't updated)
;     Copies load station index to LoadStationIndex and area index to AreaIndex
; Otherwise:
;     Clears the SRAM slot
;     Sets load station index to 0 and area index to Crateria
;     $09A2..0A01 and map data are NOT modified
    REP #$30                                                             ;818085;
    PHB                                                                  ;818087;
    PHX                                                                  ;818088;
    PHY                                                                  ;818089;
    PEA.W SRAMMirror_Equipment>>8&$FF00                                                          ;81808A;
    PLB                                                                  ;81808D;
    PLB                                                                  ;81808E;
    STZ.B DP_Temp14                                                      ;81808F;
    AND.W #$0003                                                         ;818091;
    ASL                                                                  ;818094;
    STA.B DP_Temp12                                                      ;818095;
    TAX                                                                  ;818097;
    LDA.L SaveSlotOffsets,X                                              ;818098;
    TAX                                                                  ;81809C;
    LDY.W #SRAMMirror_Equipment                                          ;81809D;

  .loop:
    LDA.L SRAM_Slot0Checksum0,X                                                      ;8180A0;
    STA.W $0000,Y                                                        ;8180A4;
    CLC                                                                  ;8180A7;
    ADC.B DP_Temp14                                                      ;8180A8;
    STA.B DP_Temp14                                                      ;8180AA;
    INX                                                                  ;8180AC;
    INX                                                                  ;8180AD;
    INY                                                                  ;8180AE;
    INY                                                                  ;8180AF;
    CPY.W #SRAMMirror_End+1                                              ;8180B0;
    BNE .loop                                                            ;8180B3;
    LDX.B DP_Temp12                                                      ;8180B5;
    LDA.B DP_Temp14                                                      ;8180B7;
    CMP.L SRAM_Slot0Checksum0,X                                                      ;8180B9;
    BNE .doubleCheck                                                     ;8180BD;
    EOR.W #$FFFF                                                         ;8180BF;
    CMP.L SRAM_Slot0Complement0,X                                                      ;8180C2;
    BNE .doubleCheck                                                     ;8180C6;
    BRA .success                                                         ;8180C8;

  .doubleCheck:
    LDA.B DP_Temp14                                                      ;8180CA;
    CMP.L SRAM_Slot0Checksum1,X                                          ;8180CC;
    BNE .corrupt                                                         ;8180D0;
    EOR.W #$FFFF                                                         ;8180D2;
    CMP.L SRAM_Slot0Complement1,X                                        ;8180D5;
    BNE .corrupt                                                         ;8180D9;

  .success:
    LDY.W #$005E                                                         ;8180DB;

  .loopSuccess:
    LDA.W SRAMMirror_Equipment,Y                                         ;8180DE;
    STA.W EquippedItems,Y                                                ;8180E1;
    DEY                                                                  ;8180E4;
    DEY                                                                  ;8180E5;
    BPL .loopSuccess                                                     ;8180E6;
    JSR.W LoadMap                                                        ;8180E8;
    LDA.W SRAMMirror_SaveStationIndex                                    ;8180EB;
    STA.W LoadStationIndex                                               ;8180EE;
    LDA.W SRAMMirror_AreaIndex                                           ;8180F1;
    STA.W AreaIndex                                                      ;8180F4;
    PLY                                                                  ;8180F7;
    PLX                                                                  ;8180F8;
    CLC                                                                  ;8180F9;
    PLB                                                                  ;8180FA;
    RTL                                                                  ;8180FB;

  .corrupt:
    STZ.B DP_Temp14                                                      ;8180FC;
    LDX.B DP_Temp12                                                      ;8180FE;
    LDA.L SaveSlotOffsets,X                                              ;818100;
    TAX                                                                  ;818104;
    LDY.W #SRAMMirror_Equipment                                          ;818105;
    LDA.W #$0000                                                         ;818108;

  .loopCorrupt:
    STA.L SRAM_Slot0Checksum0,X                                                      ;81810B;
    CLC                                                                  ;81810F;
    ADC.B DP_Temp14                                                      ;818110;
    STA.B DP_Temp14                                                      ;818112;
    INX                                                                  ;818114;
    INX                                                                  ;818115;
    INY                                                                  ;818116;
    INY                                                                  ;818117;
    CPY.W #SRAMMirror_End+1                                              ;818118;
    BNE .loopCorrupt                                                     ;81811B;
    LDA.W #$0000                                                         ;81811D;
    STA.W LoadStationIndex                                               ;818120;
    STA.W AreaIndex                                                      ;818123;
    PLY                                                                  ;818126;
    PLX                                                                  ;818127;
    SEC                                                                  ;818128;
    PLB                                                                  ;818129;
    RTL                                                                  ;81812A;


;;; $812B: SRAM offsets for each save slot ;;;
SaveSlotOffsets:
    dw $0010,$066C,$0CC8                                                 ;81812B;

;;; $8131: Exported map data ;;;
SRAMMapData:
; Lists of offsets into explored map data ($7E:CD52 + (area index) * 100h) whose bytes are saved to SRAM
; Map data offsets of 80h+ are specifying the right half of the map (7Fh- are specifying the left half)
; Each byte is 8 map tiles, and the first row (offsets 0..3 and 80h..83h) is meaningless padding
  .size:
; Size of each exported map
    db $4A,$48,$4C,$12,$42,$15,$08                                       ;818131;

  .offset:
; Offset for each exported map
    db $00,$00,$4A,$00,$92,$00,$DE,$00,$F0,$00,$32,$01,$47,$01           ;818138;

  .crateria:
; Crateria map offset list
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

  .brinstar:
; Brinstar map offset list
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

  .norfair:
; Norfair map offset list
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

  .wreckedShip:
; Wrecked Ship map offset list
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

  .maridia:
; Maridia map offset list
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

  .tourian:
; Tourian map offset list
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

  .ceres:
; Unused. Ceres map offset list
    db     $2D                                                           ;8182C6;
    db     $31
    db     $35
    db     $39
    db     $3D
    db     $41
    db     $45,$46
    db $00,$00,$00,$00,$00,$00,$00,$00

MapRoomPointers:
; Map offset list pointers. Indexed by area
    dw SRAMMapData_crateria                                              ;8182D6;
    dw SRAMMapData_brinstar                                              ;8182D8;
    dw SRAMMapData_norfair                                               ;8182DA;
    dw SRAMMapData_wreckedShip                                           ;8182DC;
    dw SRAMMapData_maridia                                               ;8182DE;
    dw SRAMMapData_tourian                                               ;8182E0;
    dw SRAMMapData_ceres                                                 ;8182E2;


;;; $82E4: Load map ;;;
LoadMap:
; Doesn't load Ceres map, but does clear it
    PHB                                                                  ;8182E4;
    PHP                                                                  ;8182E5;
    PHK                                                                  ;8182E6;
    PLB                                                                  ;8182E7;
    REP #$30                                                             ;8182E8;
    LDX.W #$0700                                                         ;8182EA;
    LDA.W #$0000                                                         ;8182ED;

  .loopTilesExplored:
    STA.L ExploredMapTiles,X                                             ;8182F0;
    DEX                                                                  ;8182F4;
    DEX                                                                  ;8182F5;
    BPL .loopTilesExplored                                               ;8182F6;
    STZ.B DP_Temp16                                                      ;8182F8;

  .loopArea:
    LDA.B DP_Temp16                                                      ;8182FA;
    XBA                                                                  ;8182FC;
    STA.B DP_Temp14                                                      ;8182FD;
    LDX.B DP_Temp16                                                      ;8182FF;
    LDA.W SRAMMapData_size,X                                             ;818301;
    AND.W #$00FF                                                         ;818304;
    STA.B DP_Temp12                                                      ;818307;
    LDA.B DP_Temp16                                                      ;818309;
    ASL                                                                  ;81830B;
    TAX                                                                  ;81830C;
    LDA.W MapRoomPointers,X                                              ;81830D;
    STA.B DP_Temp00                                                      ;818310;
    LDA.W #SRAMMapData>>16                                               ;818312;
    STA.B DP_Temp02                                                      ;818315;
    LDA.W SRAMMapData_offset,X                                           ;818317;
    TAX                                                                  ;81831A;
    LDA.W #ExploredMapTiles                                              ;81831B;
    STA.B DP_Temp03                                                      ;81831E;
    LDA.W #ExploredMapTiles>>16                                          ;818320;
    STA.B DP_Temp05                                                      ;818323;

  .loopRoom:
    LDA.B (DP_Temp00)                                                    ;818325;
    AND.W #$00FF                                                         ;818327;
    CLC                                                                  ;81832A;
    ADC.B DP_Temp14                                                      ;81832B;
    TAY                                                                  ;81832D;
    SEP #$20                                                             ;81832E;
    LDA.L SRAMMirror_MapDataCrateria,X                                   ;818330;
    STA.B [DP_Temp03],Y                                                  ;818334;
    REP #$20                                                             ;818336;
    INC.B DP_Temp00                                                      ;818338;
    INX                                                                  ;81833A;
    DEC.B DP_Temp12                                                      ;81833B;
    BNE .loopRoom                                                        ;81833D;
    INC.B DP_Temp16                                                      ;81833F;
    LDA.B DP_Temp16                                                      ;818341;
    CMP.W #$0006                                                         ;818343;
    BMI .loopArea                                                        ;818346;
    PLP                                                                  ;818348;
    PLB                                                                  ;818349;
    RTS                                                                  ;81834A;


;;; $834B: Save map ;;;
SaveMap:
; Doesn't save Ceres
    PHB                                                                  ;81834B;
    PHP                                                                  ;81834C;
    PHK                                                                  ;81834D;
    PLB                                                                  ;81834E;
    REP #$30                                                             ;81834F;
    STZ.B DP_Temp1A                                                      ;818351;

  .loopAreas:
    LDX.B DP_Temp1A                                                      ;818353;
    LDA.W SRAMMapData_size,X                                             ;818355;
    AND.W #$00FF                                                         ;818358;
    STA.B DP_Temp16                                                      ;81835B;
    LDA.B DP_Temp1A                                                      ;81835D;
    ASL                                                                  ;81835F;
    TAX                                                                  ;818360;
    LDA.W MapRoomPointers,X                                              ;818361;
    STA.B DP_Temp00                                                      ;818364;
    LDA.W SRAMMapData_offset,X                                           ;818366;
    TAX                                                                  ;818369;
    LDA.B DP_Temp1A                                                      ;81836A;
    XBA                                                                  ;81836C;
    STA.B DP_Temp18                                                      ;81836D;
    LDA.W #ExploredMapTiles                                              ;81836F;
    STA.B DP_Temp03                                                      ;818372;
    LDA.W #ExploredMapTiles>>16                                          ;818374;
    STA.B DP_Temp05                                                      ;818377;

  .loopRooms:
    LDA.B (DP_Temp00)                                                    ;818379;
    AND.W #$00FF                                                         ;81837B;
    CLC                                                                  ;81837E;
    ADC.B DP_Temp18                                                      ;81837F;
    TAY                                                                  ;818381;
    SEP #$20                                                             ;818382;
    LDA.B [DP_Temp03],Y                                                  ;818384;
    STA.L SRAMMirror_MapDataCrateria,X                                   ;818386;
    REP #$20                                                             ;81838A;
    INC.B DP_Temp00                                                      ;81838C;
    INX                                                                  ;81838E;
    DEC.B DP_Temp16                                                      ;81838F;
    BNE .loopRooms                                                       ;818391;
    INC.B DP_Temp1A                                                      ;818393;
    LDA.B DP_Temp1A                                                      ;818395;
    CMP.W #$0006                                                         ;818397;
    BMI .loopAreas                                                       ;81839A;
    PLP                                                                  ;81839C;
    PLB                                                                  ;81839D;
    RTS                                                                  ;81839E;


;;; $839F: Map of OAM index to high X position bit and size bit ;;;
MapOfOAMIndex:
  .highXPosBit:
    dw $0001                                                             ;81839F;
  .sizeBit:
    dw       $0002                                                       ;8183A1;
    dw              $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000


;;; $859F: Map of OAM index to high OAM address and corresponding bitmask ;;;
MapOfOAMIndexToHighOAM:
  .address:
    dw $0570                                                             ;81859F;
  .bitmask:
    dw       $0003                                                       ;8185A1;
    dw              $0570,$000C, $0570,$0030, $0570,$00C0
    dw $0570,$0300, $0570,$0C00, $0570,$3000, $0570,$C000
    dw $0572,$0003, $0572,$000C, $0572,$0030, $0572,$00C0
    dw $0572,$0300, $0572,$0C00, $0572,$3000, $0572,$C000
    dw $0574,$0003, $0574,$000C, $0574,$0030, $0574,$00C0
    dw $0574,$0300, $0574,$0C00, $0574,$3000, $0574,$C000
    dw $0576,$0003, $0576,$000C, $0576,$0030, $0576,$00C0
    dw $0576,$0300, $0576,$0C00, $0576,$3000, $0576,$C000
    dw $0578,$0003, $0578,$000C, $0578,$0030, $0578,$00C0
    dw $0578,$0300, $0578,$0C00, $0578,$3000, $0578,$C000
    dw $057A,$0003, $057A,$000C, $057A,$0030, $057A,$00C0
    dw $057A,$0300, $057A,$0C00, $057A,$3000, $057A,$C000
    dw $057C,$0003, $057C,$000C, $057C,$0030, $057C,$00C0
    dw $057C,$0300, $057C,$0C00, $057C,$3000, $057C,$C000
    dw $057E,$0003, $057E,$000C, $057E,$0030, $057E,$00C0
    dw $057E,$0300, $057E,$0C00, $057E,$3000, $057E,$C000
    dw $0580,$0003, $0580,$000C, $0580,$0030, $0580,$00C0
    dw $0580,$0300, $0580,$0C00, $0580,$3000, $0580,$C000
    dw $0582,$0003, $0582,$000C, $0582,$0030, $0582,$00C0
    dw $0582,$0300, $0582,$0C00, $0582,$3000, $0582,$C000
    dw $0584,$0003, $0584,$000C, $0584,$0030, $0584,$00C0
    dw $0584,$0300, $0584,$0C00, $0584,$3000, $0584,$C000
    dw $0586,$0003, $0586,$000C, $0586,$0030, $0586,$00C0
    dw $0586,$0300, $0586,$0C00, $0586,$3000, $0586,$C000
    dw $0588,$0003, $0588,$000C, $0588,$0030, $0588,$00C0
    dw $0588,$0300, $0588,$0C00, $0588,$3000, $0588,$C000
    dw $058A,$0003, $058A,$000C, $058A,$0030, $058A,$00C0
    dw $058A,$0300, $058A,$0C00, $058A,$3000, $058A,$C000
    dw $058C,$0003, $058C,$000C, $058C,$0030, $058C,$00C0
    dw $058C,$0300, $058C,$0C00, $058C,$3000, $058C,$C000
    dw $058E,$0003, $058E,$000C, $058E,$0030, $058E,$00C0
    dw $058E,$0300, $058E,$0C00, $058E,$3000, $058E,$C000


;;; $879F: Add spritemap to OAM - Y origin on-screen ;;;
AddSpritemapToOAM:
;; Parameters:
;;     DB:Y: Address of spritemap
;;     $12: Spritemap Y origin
;;     $14: Spritemap X origin
;;     $16: Palette bits of sprite (palette * 200h)

; Spritemap format is roughly:
;     nnnn         ; Number of entries (2 bytes)
;     xxxx yy attt ; Entry 0 (5 bytes)
;     ...          ; Entry 1...
; Where:
;     n = number of entries
;     x = sprite X offset
;     y = sprite Y offset
;     a = attributes
;     t = tile number

; More specifically, a spritemap entry is:
;     s000000xxxxxxxxx yyyyyyyy YXpp000ttttttttt
; Where:
;     s = size bit
;     x = sprite X offset
;     y = sprite Y offset
;     Y = Y flip
;     X = X flip
;     p = priority (relative to background)
;     t = tile number

; Called by:
;    $80:9FB3: Draw timer spritemap
;    $82:8CA1: Draw options menu spritemaps
;    $8B:936B: Add Nintendo boot logo spritemap to OAM
;    $8B:9746: Draw cinematic sprite objects - intro/title sequence
;    $8B:9799: Draw cinematic sprite objects - ending/credits
;    $A6:A2F2: Enemy graphics drawn hook - Ceres Ridley - draw Baby Metroid and door
    PHX                                                                  ;81879F;
    LDA.W $0000,Y                                                        ;8187A0;
    BNE +                                                                ;8187A3;
    PLX                                                                  ;8187A5;
    RTL                                                                  ;8187A6;

  .gotoReturn:
    JMP.W .return                                                        ;8187A7;

+   STA.B DP_Temp18                                                      ;8187AA;
    INY                                                                  ;8187AC;
    INY                                                                  ;8187AD;
    LDA.W OAMStack                                                       ;8187AE;
    BIT.W #$FE00                                                         ;8187B1;
    BNE .gotoReturn                                                      ;8187B4;
    TAX                                                                  ;8187B6;
    CLC                                                                  ;8187B7;

  .loop:
    LDA.W $0000,Y                                                        ;8187B8;
    ADC.B DP_Temp14                                                      ;8187BB;
    STA.W OAMLow,X                                                       ;8187BD;
    AND.W #$0100                                                         ;8187C0;
    BEQ .xHighClear                                                      ;8187C3;
    LDA.W $0000,Y                                                        ;8187C5;
    BPL +                                                                ;8187C8;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;8187CA;
    STA.B DP_Temp1C                                                      ;8187CE;
    LDA.B (DP_Temp1C)                                                    ;8187D0;
    ORA.L MapOfOAMIndexToHighOAM_bitmask,X                               ;8187D2;
    STA.B (DP_Temp1C)                                                    ;8187D6;
    JMP.W .merge                                                         ;8187D8;

+   LDA.L MapOfOAMIndexToHighOAM_address,X                               ;8187DB;
    STA.B DP_Temp1C                                                      ;8187DF;
    LDA.B (DP_Temp1C)                                                    ;8187E1;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;8187E3;
    STA.B (DP_Temp1C)                                                    ;8187E7;
    BRA .merge                                                           ;8187E9;

  .xHighClear:
    LDA.W $0000,Y                                                        ;8187EB;
    BPL .merge                                                           ;8187EE;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;8187F0;
    STA.B DP_Temp1C                                                      ;8187F4;
    LDA.B (DP_Temp1C)                                                    ;8187F6;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;8187F8;
    STA.B (DP_Temp1C)                                                    ;8187FC;

  .merge:
    SEP #$20                                                             ;8187FE;
    LDA.W $0002,Y                                                        ;818800;
    CLC                                                                  ;818803;
    BMI +                                                                ;818804;
    ADC.B DP_Temp12                                                      ;818806;
    BCS .setOAMPos180h                                                   ;818808;
    CMP.B #$E0                                                           ;81880A;
    BCC .onScreen                                                        ;81880C;
    BRA .setOAMPos180h                                                   ;81880E;

+   ADC.B DP_Temp12                                                      ;818810;
    BCS .lessThanE0h                                                     ;818812;
    CMP.B #$E0                                                           ;818814;
    BCS .onScreen                                                        ;818816;
    BRA .setOAMPos180h                                                   ;818818;

  .lessThanE0h:
    CMP.B #$E0                                                           ;81881A;
    BCC .onScreen                                                        ;81881C;

  .setOAMPos180h:
    JSR.W OAMEntry_XPosition_180h                                        ;81881E;
    LDA.B #$E0                                                           ;818821;

  .onScreen:
    STA.W OAMLow+1,X                                                     ;818823;
    REP #$21                                                             ;818826; clear carry
    LDA.W $0003,Y                                                        ;818828;
    AND.W #$F1FF                                                         ;81882B;
    ORA.B DP_Temp16                                                      ;81882E;
    STA.W OAMLow+2,X                                                     ;818830;
    TXA                                                                  ;818833;
    ADC.W #$0004                                                         ;818834;
    BIT.W #$FE00                                                         ;818837;
    BNE .return                                                          ;81883A;
    TAX                                                                  ;81883C;
    TYA                                                                  ;81883D;
    ADC.W #$0005                                                         ;81883E;
    TAY                                                                  ;818841;
    DEC.B DP_Temp18                                                      ;818842;
    BEQ +                                                                ;818844;
    JMP.W .loop                                                          ;818846;

+   STX.W OAMStack                                                       ;818849;
    PLX                                                                  ;81884C;
    RTL                                                                  ;81884D;

  .return:
    STA.W OAMStack                                                       ;81884E;
    PLX                                                                  ;818851;
    RTL                                                                  ;818852;


;;; $8853: Add spritemap to OAM - Y origin off-screen ;;;
AddSpritemapToOAM_Offscreen:
;; Parameters:
;;     DB:Y: Address of spritemap
;;     $12: Spritemap Y origin
;;     $14: Spritemap X origin
;;     $16: Palette bits of sprite (palette * 200h)

; Called by:
;    $8B:9746: Draw cinematic sprite objects - intro/title sequence
;    $8B:9799: Draw cinematic sprite objects - ending/credits

; See $879F for spritemap format
    PHX                                                                  ;818853;
    LDA.W $0000,Y                                                        ;818854;
    BNE +                                                                ;818857;
    PLX                                                                  ;818859;
    RTL                                                                  ;81885A;

  .goto_return:
    JMP.W .return                                                        ;81885B;

+   STA.B DP_Temp18                                                      ;81885E;
    INY                                                                  ;818860;
    INY                                                                  ;818861;
    LDA.W OAMStack                                                       ;818862;
    BIT.W #$FE00                                                         ;818865;
    BNE .goto_return                                                     ;818868;
    TAX                                                                  ;81886A;
    CLC                                                                  ;81886B;

  .loop:
    LDA.W $0000,Y                                                        ;81886C;
    ADC.B DP_Temp14                                                      ;81886F;
    STA.W OAMLow,X                                                       ;818871;
    AND.W #$0100                                                         ;818874;
    BEQ .xHighClear                                                      ;818877;
    LDA.W $0000,Y                                                        ;818879;
    BPL +                                                                ;81887C;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;81887E;
    STA.B DP_Temp1C                                                      ;818882;
    LDA.B (DP_Temp1C)                                                    ;818884;
    ORA.L MapOfOAMIndexToHighOAM_bitmask,X                               ;818886;
    STA.B (DP_Temp1C)                                                    ;81888A;
    JMP.W .merge                                                         ;81888C;

+   LDA.L MapOfOAMIndexToHighOAM_address,X                               ;81888F;
    STA.B DP_Temp1C                                                      ;818893;
    LDA.B (DP_Temp1C)                                                    ;818895;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;818897;
    STA.B (DP_Temp1C)                                                    ;81889B;
    BRA .merge                                                           ;81889D;

  .xHighClear:
    LDA.W $0000,Y                                                        ;81889F;
    BPL .merge                                                           ;8188A2;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;8188A4;
    STA.B DP_Temp1C                                                      ;8188A8;
    LDA.B (DP_Temp1C)                                                    ;8188AA;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;8188AC;
    STA.B (DP_Temp1C)                                                    ;8188B0;

  .merge:
    SEP #$20                                                             ;8188B2;
    LDA.W $0002,Y                                                        ;8188B4;
    CLC                                                                  ;8188B7;
    BMI +                                                                ;8188B8;
    ADC.B DP_Temp12                                                      ;8188BA;
    BCS .onScreen                                                        ;8188BC;
    CMP.B #$E0                                                           ;8188BE;
    BCS .onScreen                                                        ;8188C0;
    BRA .setOAMPos180h                                                   ;8188C2;

+   ADC.B DP_Temp12                                                      ;8188C4;
    BCS .lessThanE0h                                                     ;8188C6;
    CMP.B #$E0                                                           ;8188C8;
    BCC .onScreen                                                        ;8188CA;
    BRA .setOAMPos180h                                                   ;8188CC;

  .lessThanE0h:
    CMP.B #$E0                                                           ;8188CE;
    BCS .onScreen                                                        ;8188D0;

  .setOAMPos180h:
    JSR.W OAMEntry_XPosition_180h                                        ;8188D2;
    LDA.B #$E0                                                           ;8188D5;

  .onScreen:
    STA.W OAMLow+1,X                                                     ;8188D7;
    REP #$21                                                             ;8188DA; clear carry
    LDA.W $0003,Y                                                        ;8188DC;
    AND.W #$F1FF                                                         ;8188DF;
    ORA.B DP_Temp16                                                      ;8188E2;
    STA.W OAMLow+2,X                                                     ;8188E4;
    TXA                                                                  ;8188E7;
    ADC.W #$0004                                                         ;8188E8;
    BIT.W #$FE00                                                         ;8188EB;
    BNE .return                                                          ;8188EE;
    TAX                                                                  ;8188F0;
    TYA                                                                  ;8188F1;
    ADC.W #$0005                                                         ;8188F2;
    TAY                                                                  ;8188F5;
    DEC.B DP_Temp18                                                      ;8188F6;
    BEQ +                                                                ;8188F8;
    JMP.W .loop                                                          ;8188FA;

+   STX.W OAMStack                                                       ;8188FD;
    PLX                                                                  ;818900;
    RTL                                                                  ;818901;

  .return:
    STA.W OAMStack                                                       ;818902;
    PLX                                                                  ;818905;
    RTL                                                                  ;818906;


;;; $8907: OAM entry X position = 180h ;;;
OAMEntry_XPosition_180h:
;; Parameters:
;;     X: OAM entry index
    LDA.B #$80                                                           ;818907;
    STA.W OAMLow,X                                                       ;818909;
    REP #$20                                                             ;81890C;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;81890E;
    STA.B DP_Temp1C                                                      ;818912;
    LDA.B (DP_Temp1C)                                                    ;818914;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;818916;
    STA.B (DP_Temp1C)                                                    ;81891A;
    SEP #$20                                                             ;81891C;
    RTS                                                                  ;81891E;


;;; $891F: Add pause menu / menu spritemap to OAM ;;;
AddSpritemapFrom_82C569_TableToOAM:
;; Parameters:
;;     A: Index into pause menu / menu spritemap table ($82:C569)
;;        {
;;        4: Map scrolling arrow - right
;;        5: Map scrolling arrow - left
;;        6: Map scrolling arrow - up
;;        7: Map scrolling arrow - down
;;        8: Save icon
;;        9: Boss icon
;;        Ah: Energy station icon
;;        Bh: Missile station icon
;;        Ch: Debug save icon
;;        12h: File select map Samus icon
;;        14h: Equipment screen item selector - tanks
;;        15h: Equipment screen item selector - weapons
;;        16h: Equipment screen item selector - suit/misc/boots
;;        17h: Debug elevator icon
;;        1Bh: Full equipment screen reserve tank
;;        1Fh: End of equipment screen reserve health bar
;;        20h: Empty equipment screen reserve tank
;;        21h: Equipment screen 1/7 reserve tank
;;        22h: Equipment screen 2/7 reserve tank
;;        23h: Equipment screen 3/7 reserve tank
;;        24h: Equipment screen 4/7 reserve tank
;;        25h: Equipment screen 5/7 reserve tank
;;        26h: Equipment screen 6/7 reserve tank
;;        27h: Equipment screen 7/7 reserve tank
;;        28h: L button pressed highlight
;;        29h: R button pressed highlight
;;        2Ah: L/R highlight
;;        2Bh: Start button pressed highlight
;;        2Ch: File select menu Samus helmet (frame 0)
;;        2Dh: File select menu Samus helmet (frame 1)
;;        2Eh: File select menu Samus helmet (frame 2)
;;        2Fh: File select menu Samus helmet (frame 3)
;;        30h: File select menu Samus helmet (frame 4)
;;        31h: File select menu Samus helmet (frame 5)
;;        32h: File select menu Samus helmet (frame 6)
;;        33h: File select menu Samus helmet (frame 7)
;;        34h: Menu selection missile (frame 0)
;;        35h: Menu selection missile (frame 1)
;;        36h: Menu selection missile (frame 2)
;;        37h: Menu selection missile (frame 3)
;;        38h: Area select - planet Zebes
;;        39h: Area select - Crateria
;;        3Ah: Area select - Brinstar
;;        3Bh: Area select - Norfair
;;        3Ch: Area select - Wrecked Ship
;;        3Dh: Area select - Maridia
;;        3Eh: Area select - Tourian
;;        40h: File copy arrow - one slot down
;;        41h: File copy arrow - one slot up
;;        42h: File copy arrow - two slots down
;;        43h: File copy arrow - two slots up
;;        48h: Border around SAMUS DATA
;;        49h: Border around DATA COPY MODE
;;        4Ah: Border around DATA CLEAR MODE
;;        4Bh: Border around OPTION MODE
;;        4Ch: Border around CONTROLLER SETTING MODE
;;        4Dh: Border around SPECIAL SETTING MODE
;;        4Eh: Map station icon
;;        59h: Elevator destination - Crateria
;;        5Ah: Elevator destination - Brinstar
;;        5Bh: Elevator destination - Norfair
;;        5Ch: Elevator destination - Wrecked Ship
;;        5Dh: Elevator destination - Maridia
;;        5Eh: Elevator destination - Tourian
;;        5Fh: Samus position indicator (frame 0)
;;        60h: Samus position indicator (frame 1)
;;        61h: Samus position indicator (frame 2)
;;        62h: Boss cross-out icon
;;        63h: Gunship icon
;;        64h: Game over baby metroid container
;;        65h: Game over baby metroid (frame 0)
;;        66h: Game over baby metroid (frame 1)
;;        67h: Game over baby metroid (frame 2)
;;        }
;;     X: Spritemap X origin
;;     Y: Spritemap Y origin
;;     $03: Palette bits of sprite (palette * 200h)

; See $879F for spritemap format
    PHB                                                                  ;81891F;
    PEA.W MenuSpritemap_Pointers>>8&$FF00                                ;818920;
    PLB                                                                  ;818923;
    PLB                                                                  ;818924;
    STY.B DP_Temp12                                                      ;818925;
    STX.B DP_Temp14                                                      ;818927;
    ASL                                                                  ;818929;
    TAX                                                                  ;81892A;
    LDY.W MenuSpritemap_Pointers,X                                       ;81892B;
    LDA.W $0000,Y                                                        ;81892E;
    BEQ .return                                                          ;818931;
    STA.B DP_Temp18                                                      ;818933;
    INY                                                                  ;818935;
    INY                                                                  ;818936;
    LDX.W OAMStack                                                       ;818937;
    CLC                                                                  ;81893A;

  .loop:
    LDA.W $0000,Y                                                        ;81893B;
    ADC.B DP_Temp14                                                      ;81893E;
    STA.W OAMLow,X                                                       ;818940;
    AND.W #$0100                                                         ;818943;
    BEQ .xHighClear                                                      ;818946;
    LDA.W $0000,Y                                                        ;818948;
    BPL .preMerge                                                        ;81894B;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;81894D;
    STA.B DP_Temp16                                                      ;818951;
    LDA.B (DP_Temp16)                                                    ;818953;
    ORA.L MapOfOAMIndexToHighOAM_bitmask,X                               ;818955;
    STA.B (DP_Temp16)                                                    ;818959;
    JMP.W .merge                                                         ;81895B;

  .preMerge:
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;81895E;
    STA.B DP_Temp16                                                      ;818962;
    LDA.B (DP_Temp16)                                                    ;818964;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;818966;
    STA.B (DP_Temp16)                                                    ;81896A;
    JMP.W .merge                                                         ;81896C;

  .xHighClear:
    LDA.W $0000,Y                                                        ;81896F;
    BPL .merge                                                           ;818972;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818974;
    STA.B DP_Temp16                                                      ;818978;
    LDA.B (DP_Temp16)                                                    ;81897A;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;81897C;
    STA.B (DP_Temp16)                                                    ;818980;

  .merge:
    LDA.W $0002,Y                                                        ;818982;
    CLC                                                                  ;818985;
    ADC.B DP_Temp12                                                      ;818986;
    STA.W OAMLow+1,X                                                     ;818988;
    LDA.W $0003,Y                                                        ;81898B;
    AND.W #$F1FF                                                         ;81898E;
    ORA.B DP_Temp03                                                      ;818991;
    STA.W OAMLow+2,X                                                     ;818993;
    TYA                                                                  ;818996;
    CLC                                                                  ;818997;
    ADC.W #$0005                                                         ;818998;
    TAY                                                                  ;81899B;
    TXA                                                                  ;81899C;
    CLC                                                                  ;81899D;
    ADC.W #$0004                                                         ;81899E;
    AND.W #$01FF                                                         ;8189A1;
    TAX                                                                  ;8189A4;
    DEC.B DP_Temp18                                                      ;8189A5;
    BNE .loop                                                            ;8189A7;
    STX.W OAMStack                                                       ;8189A9;

  .return:
    PLB                                                                  ;8189AC;
    RTL                                                                  ;8189AD;


;;; $89AE: Add Samus spritemap to OAM ;;;
AddSamusSpritemapToOAM:
;; Parameters:
;;     A: Index into $92:808D table
;;     X: Spritemap X origin
;;     Y: Spritemap Y origin

; Actually uses the palette defined in the spritemap
; See $8A5F for spritemap format
; Also called for some atmospheric graphics:
;     186h..18Eh: Bubbles
;     18Fh..197h: Diving splash
    PHB                                                                  ;8189AE;
    PEA.W SamusSpritemapTable>>8&$FF00                                   ;8189AF;
    PLB                                                                  ;8189B2;
    PLB                                                                  ;8189B3;
    STY.B DP_Temp12                                                      ;8189B4;
    STX.B DP_Temp14                                                      ;8189B6;
    ASL                                                                  ;8189B8;
    TAX                                                                  ;8189B9;
    LDY.W SamusSpritemapTable,X                                          ;8189BA;
    LDA.W $0000,Y                                                        ;8189BD;
    BEQ .return                                                          ;8189C0;
    STA.B DP_Temp18                                                      ;8189C2;
    INY                                                                  ;8189C4;
    INY                                                                  ;8189C5;
    LDX.W OAMStack                                                       ;8189C6;
    CLC                                                                  ;8189C9;

  .loop:
    LDA.W $0000,Y                                                        ;8189CA;
    ADC.B DP_Temp14                                                      ;8189CD;
    STA.W OAMLow,X                                                       ;8189CF;
    AND.W #$0100                                                         ;8189D2;
    BEQ .xHighClear                                                      ;8189D5;
    LDA.W $0000,Y                                                        ;8189D7;
    BPL .preMerge                                                        ;8189DA;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;8189DC;
    STA.B DP_Temp16                                                      ;8189E0;
    LDA.B (DP_Temp16)                                                    ;8189E2;
    ORA.L MapOfOAMIndexToHighOAM_bitmask,X                               ;8189E4;
    STA.B (DP_Temp16)                                                    ;8189E8;
    JMP.W .merge                                                         ;8189EA;

  .preMerge:
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;8189ED;
    STA.B DP_Temp16                                                      ;8189F1;
    LDA.B (DP_Temp16)                                                    ;8189F3;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;8189F5;
    STA.B (DP_Temp16)                                                    ;8189F9;
    JMP.W .merge                                                         ;8189FB;

  .xHighClear:
    LDA.W $0000,Y                                                        ;8189FE;
    BPL .merge                                                           ;818A01;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818A03;
    STA.B DP_Temp16                                                      ;818A07;
    LDA.B (DP_Temp16)                                                    ;818A09;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;818A0B;
    STA.B (DP_Temp16)                                                    ;818A0F;

  .merge:
    LDA.W $0002,Y                                                        ;818A11;
    CLC                                                                  ;818A14;
    ADC.B DP_Temp12                                                      ;818A15;
    STA.W OAMLow+1,X                                                     ;818A17;
    LDA.W $0003,Y                                                        ;818A1A;
    STA.W OAMLow+2,X                                                     ;818A1D;
    TYA                                                                  ;818A20;
    CLC                                                                  ;818A21;
    ADC.W #$0005                                                         ;818A22;
    TAY                                                                  ;818A25;
    TXA                                                                  ;818A26;
    ADC.W #$0004                                                         ;818A27;
    AND.W #$01FF                                                         ;818A2A;
    TAX                                                                  ;818A2D;
    DEC.B DP_Temp18                                                      ;818A2E;
    BNE .loop                                                            ;818A30;
    STX.W OAMStack                                                       ;818A32;

  .return:
    PLB                                                                  ;818A35;
    RTL                                                                  ;818A36;


;;; $8A37: Add spritemap from $93:A1A1 table to OAM ;;;
AddSpritemapFrom_93A1A1_TableToOAM:
;; Parameters:
;;     A: Index into $93:A1A1 table
;;     $12: Spritemap Y origin
;;     $14: Spritemap X origin

; Called by:
;    $90:BBE1: Draw flare animation component
;    $93:F5E2: Unused. Draw shinespark windup effect sprite
;    $9B:C036: Handle grapple beam flare

; Actually uses the palette defined in the spritemap
; See $8A5F for spritemap format
; Draws charge / grapple beam flare and charge sparks
    PHB                                                                  ;818A37;
    PEA.W FlareSpritemapPointers>>8&$FF00                                ;818A38;
    PLB                                                                  ;818A3B;
    PLB                                                                  ;818A3C;
    ASL                                                                  ;818A3D;
    TAX                                                                  ;818A3E;
    LDY.W FlareSpritemapPointers,X                                       ;818A3F;
    LDA.W $0000,Y                                                        ;818A42;
    STA.B DP_Temp18                                                      ;818A45;
    INY                                                                  ;818A47;
    INY                                                                  ;818A48;
    BRA AddSpritemapToOAM_Common                                         ;818A49;


;;; $8A4B: Add projectile spritemap to OAM ;;;
AddProjectileSpritemapToOAM:
;; Parameters:
;;     X: Projectile index
;;     $12: Spritemap Y origin
;;     $14: Spritemap X origin

; Actually uses the palette defined in the spritemap
; See $8A5F for spritemap format
    PHB                                                                  ;818A4B;
    PEA.W FlareSpritemapPointers>>8&$FF00                                ;818A4C;
    PLB                                                                  ;818A4F;
    PLB                                                                  ;818A50;
    LDY.W SamusProjectile_SpritemapPointers,X                            ;818A51;
    LDA.W $0000,Y                                                        ;818A54;
    BNE +                                                                ;818A57;
    PLB                                                                  ;818A59;
    RTL                                                                  ;818A5A;

+   STA.B DP_Temp18                                                      ;818A5B;
    INY                                                                  ;818A5D;
    INY                                                                  ;818A5E; fallthrough to AddSpritemapToOAM_Common


;;; $8A5F: Add spritemap to OAM - no off-screen handling ;;;
AddSpritemapToOAM_Common:
;; Parameters:
;;     DB:Y: Address of first entry in spritemap
;;     $12: Spritemap Y origin
;;     $14: Spritemap X origin
;;     $18: Number of entries

; Spritemap format is roughly:
;     nnnn         ; Number of entries (2 bytes)
;     xxxx yy aatt ; Entry 0 (5 bytes)
;     ...          ; Entry 1...
; Where:
;     n = number of entries
;     x = X offset of sprite from center
;     y = Y offset of sprite from center
;     a = attributes
;     t = tile number

; More specifically, a spritemap entry is:
;     s000000xxxxxxxxx yyyyyyyy YXppPPPttttttttt
; Where:
;     s = size bit
;     x = X offset of sprite from center
;     y = Y offset of sprite from center
;     Y = Y flip
;     X = X flip
;     P = palette
;     p = priority (relative to background)
;     t = tile number

; Out of all of the spritemap loading routines, this one is the most sanely coded. No offscreen handling though (sprites wrap)
    LDX.W OAMStack                                                       ;818A5F;
    CLC                                                                  ;818A62;

  .loop:
    LDA.W $0000,Y                                                        ;818A63;
    ADC.B DP_Temp14                                                      ;818A66;
    STA.W OAMLow,X                                                       ;818A68;
    AND.W #$0100                                                         ;818A6B;
    BEQ +                                                                ;818A6E;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818A70;
    STA.B DP_Temp16                                                      ;818A74;
    LDA.B (DP_Temp16)                                                    ;818A76;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;818A78;
    STA.B (DP_Temp16)                                                    ;818A7C;

+   LDA.W $0000,Y                                                        ;818A7E;
    BPL +                                                                ;818A81;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818A83;
    STA.B DP_Temp16                                                      ;818A87;
    LDA.B (DP_Temp16)                                                    ;818A89;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;818A8B;
    STA.B (DP_Temp16)                                                    ;818A8F;

+   LDA.W $0002,Y                                                        ;818A91;
    CLC                                                                  ;818A94;
    ADC.B DP_Temp12                                                      ;818A95;
    STA.W OAMLow+1,X                                                     ;818A97;
    LDA.W $0003,Y                                                        ;818A9A;
    STA.W OAMLow+2,X                                                     ;818A9D;
    TYA                                                                  ;818AA0;
    CLC                                                                  ;818AA1;
    ADC.W #$0005                                                         ;818AA2;
    TAY                                                                  ;818AA5;
    TXA                                                                  ;818AA6;
    ADC.W #$0004                                                         ;818AA7;
    AND.W #$01FF                                                         ;818AAA;
    TAX                                                                  ;818AAD;
    DEC.B DP_Temp18                                                      ;818AAE;
    BNE .loop                                                            ;818AB0;
    STX.W OAMStack                                                       ;818AB2;
    PLB                                                                  ;818AB5;
    RTL                                                                  ;818AB6;


;;; $8AB7: RTL ;;;
RTL_818AB7:
    RTL                                                                  ;818AB7;


;;; $8AB8: Add spritemap to OAM with base tile number - no off-screen handling ;;;
AddSpritemapToOAM_WithBaseTileNumber_8AB8:
;; Parameters:
;;     DB:Y: Address of spritemap
;;     $12: Spritemap Y origin
;;     $14: Spritemap X origin
;;     $03: Palette bits of sprite (palette * 200h)
;;     $00: Base tile number

; Called by:
;    $A0:944A: Write enemy OAM (non extended spritemap format)
;    $B4:BD32: Draw sprite objects

; See $879F for spritemap format
    PHY                                                                  ;818AB8;
    LDA.W $0000,Y                                                        ;818AB9;
    BEQ .return                                                          ;818ABC;
    INY                                                                  ;818ABE;
    INY                                                                  ;818ABF;
    STA.B DP_Temp18                                                      ;818AC0;
    LDX.W OAMStack                                                       ;818AC2;
    CLC                                                                  ;818AC5;

  .loop:
    LDA.W $0000,Y                                                        ;818AC6;
    ADC.B DP_Temp14                                                      ;818AC9;
    STA.W OAMLow,X                                                       ;818ACB;
    AND.W #$0100                                                         ;818ACE;
    BEQ +                                                                ;818AD1;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818AD3;
    STA.B DP_Temp16                                                      ;818AD7;
    LDA.B (DP_Temp16)                                                    ;818AD9;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;818ADB;
    STA.B (DP_Temp16)                                                    ;818ADF;

+   LDA.W $0000,Y                                                        ;818AE1;
    BPL +                                                                ;818AE4;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818AE6;
    STA.B DP_Temp16                                                      ;818AEA;
    LDA.B (DP_Temp16)                                                    ;818AEC;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;818AEE;
    STA.B (DP_Temp16)                                                    ;818AF2;

+   SEP #$20                                                             ;818AF4;
    LDA.W $0002,Y                                                        ;818AF6;
    CLC                                                                  ;818AF9;
    ADC.B DP_Temp12                                                      ;818AFA;
    STA.W OAMLow+1,X                                                     ;818AFC;
    REP #$21                                                             ;818AFF; clear carry
    LDA.W $0003,Y                                                        ;818B01;
    ADC.B DP_Temp00                                                      ;818B04;
    ORA.B DP_Temp03                                                      ;818B06;
    STA.W OAMLow+2,X                                                     ;818B08;
    TYA                                                                  ;818B0B;
    ADC.W #$0005                                                         ;818B0C;
    TAY                                                                  ;818B0F;
    TXA                                                                  ;818B10;
    ADC.W #$0004                                                         ;818B11;
    AND.W #$01FF                                                         ;818B14;
    TAX                                                                  ;818B17;
    DEC.B DP_Temp18                                                      ;818B18;
    BNE .loop                                                            ;818B1A;
    STX.W OAMStack                                                       ;818B1C;

  .return:
    PLY                                                                  ;818B1F;
    RTL                                                                  ;818B20;


;;; $8B21: Unused. RTL ;;;
RTL_818B21:
    RTL                                                                  ;818B21;


;;; $8B22: Add spritemap to OAM with base tile number - Y origin on-screen ;;;
AddSpritemapToOAM_WithBaseTileNumber_8B22:
;; Parameters:
;;     DB:Y: Address of spritemap
;;     $12: Spritemap Y origin
;;     $14: Spritemap X origin
;;     $03: Palette bits of sprite (palette * 200h)
;;     $00: Base tile number

; Called by:
;    $A0:944A: Write enemy OAM (extended spritemap format)

; See $879F for spritemap format
; Bug: missing CLC before ADC when calculating Y position, causes enemies straddling the left screen boundary to shift down a pixel
    PHY                                                                  ;818B22;
    LDA.W $0000,Y                                                        ;818B23;
    BEQ .return                                                          ;818B26;
    INY                                                                  ;818B28;
    INY                                                                  ;818B29;
    STA.B DP_Temp18                                                      ;818B2A;
    LDX.W OAMStack                                                       ;818B2C;
    CLC                                                                  ;818B2F;

  .loop:
    LDA.W $0000,Y                                                        ;818B30;
    ADC.B DP_Temp14                                                      ;818B33;
    STA.W OAMLow,X                                                       ;818B35;
    AND.W #$0100                                                         ;818B38;
    BEQ +                                                                ;818B3B;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818B3D;
    STA.B DP_Temp16                                                      ;818B41;
    LDA.B (DP_Temp16)                                                    ;818B43;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;818B45;
    STA.B (DP_Temp16)                                                    ;818B49;

+   LDA.W $0000,Y                                                        ;818B4B;
    BPL +                                                                ;818B4E;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818B50;
    STA.B DP_Temp16                                                      ;818B54;
    LDA.B (DP_Temp16)                                                    ;818B56;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;818B58;
    STA.B (DP_Temp16)                                                    ;818B5C;

+   SEP #$20                                                             ;818B5E;
    LDA.W $0002,Y                                                        ;818B60;
    BMI +                                                                ;818B63;
    ADC.B DP_Temp12                                                      ;818B65;
    BCC .onScreen                                                        ;818B67;
    BCS .yPosF0h                                                         ;818B69;

+   ADC.B DP_Temp12                                                      ;818B6B;
    BCS .onScreen                                                        ;818B6D;

  .yPosF0h:
    LDA.B #$F0                                                           ;818B6F;

  .onScreen:
    STA.W OAMLow+1,X                                                     ;818B71;
    REP #$21                                                             ;818B74; clear carry
    LDA.W $0003,Y                                                        ;818B76;
    ADC.B DP_Temp00                                                      ;818B79;
    ORA.B DP_Temp03                                                      ;818B7B;
    STA.W OAMLow+2,X                                                     ;818B7D;
    TYA                                                                  ;818B80;
    ADC.W #$0005                                                         ;818B81;
    TAY                                                                  ;818B84;
    TXA                                                                  ;818B85;
    ADC.W #$0004                                                         ;818B86;
    AND.W #$01FF                                                         ;818B89;
    TAX                                                                  ;818B8C;
    DEC.B DP_Temp18                                                      ;818B8D;
    BNE .loop                                                            ;818B8F;
    STX.W OAMStack                                                       ;818B91;

  .return:
    PLY                                                                  ;818B94;
    RTL                                                                  ;818B95;


;;; $8B96: Add spritemap to OAM with base tile number - Y origin off-screen ;;;
AddSpritemapToOAM_WithBaseTileNumber_Offscreen_8B96:
;; Parameters:
;;     DB:Y: Address of spritemap
;;     $12: Spritemap Y origin
;;     $14: Spritemap X origin
;;     $03: Palette bits of sprite (palette * 200h)
;;     $00: Base tile number

; Called by:
;    $A0:944A: Write enemy OAM (extended spritemap format)

; See $879F for spritemap format
; Bug: missing CLC before ADC when calculating Y position, causes enemies straddling the left screen boundary to shift down a pixel
    PHY                                                                  ;818B96;
    LDA.W $0000,Y                                                        ;818B97;
    BEQ .return                                                          ;818B9A;
    INY                                                                  ;818B9C;
    INY                                                                  ;818B9D;
    STA.B DP_Temp18                                                      ;818B9E;
    LDX.W OAMStack                                                       ;818BA0;
    CLC                                                                  ;818BA3;

  .loop:
    LDA.W $0000,Y                                                        ;818BA4;
    ADC.B DP_Temp14                                                      ;818BA7;
    STA.W OAMLow,X                                                       ;818BA9;
    AND.W #$0100                                                         ;818BAC;
    BEQ +                                                                ;818BAF;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818BB1;
    STA.B DP_Temp16                                                      ;818BB5;
    LDA.B (DP_Temp16)                                                    ;818BB7;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;818BB9;
    STA.B (DP_Temp16)                                                    ;818BBD;

+   LDA.W $0000,Y                                                        ;818BBF;
    BPL +                                                                ;818BC2;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818BC4;
    STA.B DP_Temp16                                                      ;818BC8;
    LDA.B (DP_Temp16)                                                    ;818BCA;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;818BCC;
    STA.B (DP_Temp16)                                                    ;818BD0;

+   SEP #$20                                                             ;818BD2;
    LDA.W $0002,Y                                                        ;818BD4;
    BMI +                                                                ;818BD7;
    ADC.B DP_Temp12                                                      ;818BD9;
    BCS .onScreen                                                        ;818BDB;
    BCC .yPosF0h                                                         ;818BDD;

+   ADC.B DP_Temp12                                                      ;818BDF;
    BCC .onScreen                                                        ;818BE1;

  .yPosF0h:
    LDA.B #$F0                                                           ;818BE3;

  .onScreen:
    STA.W OAMLow+1,X                                                     ;818BE5;
    REP #$21                                                             ;818BE8; clear carry
    LDA.W $0003,Y                                                        ;818BEA;
    ADC.B DP_Temp00                                                      ;818BED;
    ORA.B DP_Temp03                                                      ;818BEF;
    STA.W OAMLow+2,X                                                     ;818BF1;
    TYA                                                                  ;818BF4;
    ADC.W #$0005                                                         ;818BF5;
    TAY                                                                  ;818BF8;
    TXA                                                                  ;818BF9;
    ADC.W #$0004                                                         ;818BFA;
    AND.W #$01FF                                                         ;818BFD;
    TAX                                                                  ;818C00;
    DEC.B DP_Temp18                                                      ;818C01;
    BNE .loop                                                            ;818C03;
    STX.W OAMStack                                                       ;818C05;

  .return:
    PLY                                                                  ;818C08;
    RTL                                                                  ;818C09;


;;; $8C0A: Add spritemap to OAM with base tile number - Y origin on-screen ;;;
AddSpritemapToOAM_WithBaseTileNumber_8C0A:
;; Parameters:
;;     DB:Y: Address of spritemap
;;     $12: Spritemap Y origin
;;     $14: Spritemap X origin
;;     $1A: Base tile number
;;     $1C: Palette bits of sprite (palette * 200h)

; Called by:
;    $86:83D6: Draw enemy projectile

; See $879F for spritemap format
    LDA.W $0000,Y                                                        ;818C0A;
    BNE +                                                                ;818C0D;
    RTL                                                                  ;818C0F;

+   STA.B DP_Temp18                                                      ;818C10;
    INY                                                                  ;818C12;
    INY                                                                  ;818C13;
    LDX.W OAMStack                                                       ;818C14;
    CLC                                                                  ;818C17;

  .loop:
    LDA.W $0000,Y                                                        ;818C18;
    CLC                                                                  ;818C1B;
    ADC.B DP_Temp14                                                      ;818C1C;
    STA.W OAMLow,X                                                       ;818C1E;
    BIT.W #$0100                                                         ;818C21;
    BEQ +                                                                ;818C24;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818C26;
    STA.B DP_Temp16                                                      ;818C2A;
    LDA.B (DP_Temp16)                                                    ;818C2C;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;818C2E;
    STA.B (DP_Temp16)                                                    ;818C32;

+   SEP #$20                                                             ;818C34;
    CLC                                                                  ;818C36;
    LDA.W $0002,Y                                                        ;818C37;
    BMI +                                                                ;818C3A;
    ADC.B DP_Temp12                                                      ;818C3C;
    BCC .onScreen                                                        ;818C3E;
    BCS .yPosF0h                                                         ;818C40;

+   ADC.B DP_Temp12                                                      ;818C42;
    BCS .onScreen                                                        ;818C44;

  .yPosF0h:
    LDA.B #$F0                                                           ;818C46;

  .onScreen:
    STA.W OAMLow+1,X                                                     ;818C48;
    REP #$21                                                             ;818C4B; clear carry
    LDA.W $0000,Y                                                        ;818C4D;
    BPL +                                                                ;818C50;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818C52;
    STA.B DP_Temp16                                                      ;818C56;
    LDA.B (DP_Temp16)                                                    ;818C58;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;818C5A;
    STA.B (DP_Temp16)                                                    ;818C5E;

+   LDA.W $0003,Y                                                        ;818C60;
    ADC.B DP_Temp1A                                                      ;818C63;
    ORA.B DP_Temp1C                                                      ;818C65;
    STA.W OAMLow+2,X                                                     ;818C67;
    TXA                                                                  ;818C6A;
    ADC.W #$0004                                                         ;818C6B;
    AND.W #$01FF                                                         ;818C6E;
    TAX                                                                  ;818C71;
    TYA                                                                  ;818C72;
    ADC.W #$0005                                                         ;818C73;
    TAY                                                                  ;818C76;
    DEC.B DP_Temp18                                                      ;818C77;
    BNE .loop                                                            ;818C79;
    STX.W OAMStack                                                       ;818C7B;
    RTL                                                                  ;818C7E;


;;; $8C7F: Add spritemap to OAM with base tile number - Y origin off-screen ;;;
AddSpritemapToOAM_WithBaseTileNumber_Offscreen_8C7F:
;; Parameters:
;;     DB:Y: Address of spritemap
;;     $12: Spritemap Y origin
;;     $14: Spritemap X origin
;;     $1A: Base tile number
;;     $1C: Palette bits of sprite (palette * 200h)

; Called by:
;    $86:83D6: Draw enemy projectile

; See $879F for spritemap format
    LDA.W $0000,Y                                                        ;818C7F;
    BNE +                                                                ;818C82;
    RTL                                                                  ;818C84;

+   STA.B DP_Temp18                                                      ;818C85;
    INY                                                                  ;818C87;
    INY                                                                  ;818C88;
    LDX.W OAMStack                                                       ;818C89;
    CLC                                                                  ;818C8C;

  .loop:
    LDA.W $0000,Y                                                        ;818C8D;
    CLC                                                                  ;818C90;
    ADC.B DP_Temp14                                                      ;818C91;
    STA.W OAMLow,X                                                       ;818C93;
    BIT.W #$0100                                                         ;818C96;
    BEQ +                                                                ;818C99;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818C9B;
    STA.B DP_Temp16                                                      ;818C9F;
    LDA.B (DP_Temp16)                                                    ;818CA1;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;818CA3;
    STA.B (DP_Temp16)                                                    ;818CA7;

+   SEP #$20                                                             ;818CA9;
    CLC                                                                  ;818CAB;
    LDA.W $0002,Y                                                        ;818CAC;
    BMI +                                                                ;818CAF;
    ADC.B DP_Temp12                                                      ;818CB1;
    BCS .onScreen                                                        ;818CB3;
    BCC .yPosF0h                                                         ;818CB5;

+   ADC.B DP_Temp12                                                      ;818CB7;
    BCC .onScreen                                                        ;818CB9;

  .yPosF0h:
    LDA.B #$F0                                                           ;818CBB;

  .onScreen:
    STA.W OAMLow+1,X                                                     ;818CBD;
    REP #$21                                                             ;818CC0; clear carry
    LDA.W $0000,Y                                                        ;818CC2;
    BPL +                                                                ;818CC5;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818CC7;
    STA.B DP_Temp16                                                      ;818CCB;
    LDA.B (DP_Temp16)                                                    ;818CCD;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;818CCF;
    STA.B (DP_Temp16)                                                    ;818CD3;

+   LDA.W $0003,Y                                                        ;818CD5;
    ADC.B DP_Temp1A                                                      ;818CD8;
    ORA.B DP_Temp1C                                                      ;818CDA;
    STA.W OAMLow+2,X                                                     ;818CDC;
    TXA                                                                  ;818CDF;
    ADC.W #$0004                                                         ;818CE0;
    AND.W #$01FF                                                         ;818CE3;
    TAX                                                                  ;818CE6;
    TYA                                                                  ;818CE7;
    ADC.W #$0005                                                         ;818CE8;
    TAY                                                                  ;818CEB;
    DEC.B DP_Temp18                                                      ;818CEC;
    BNE .loop                                                            ;818CEE;
    STX.W OAMStack                                                       ;818CF0;
    RTL                                                                  ;818CF3;


if !DEBUG
;;; $8CF4: Debug game over menu ;;;
Debug_GameOverMenu:
; Game state 1Dh
    REP #$30                                                             ;818CF4;
    PHB                                                                  ;818CF6;
    PHK                                                                  ;818CF7;
    PLB                                                                  ;818CF8;
    LDA.W PauseMenu_MenuIndex                                            ;818CF9;
    ASL                                                                  ;818CFC;
    TAX                                                                  ;818CFD;
    JSR.W (.pointers,X)                                                  ;818CFE;
    PLB                                                                  ;818D01;
    RTL                                                                  ;818D02;

  .pointers:
    dw Debug_GameOverMenu_Index0_FadeOut_ConfigureGraphicsForMenu        ;818D03;
    dw Debug_GameOverMenu_Index1_Initialise                              ;818D05;
    dw Debug_GameOverMenu_Index24_FadeIn                                 ;818D07;
    dw DebugGameOverMenu_Index3_Main                                     ;818D09;
    dw Debug_GameOverMenu_Index24_FadeIn                                 ;818D0B;
    dw DebugGameOverMenu_Index5_Continue                                 ;818D0D;
endif


;;; $8D0F: (Debug) game over menu - index 0: fade out and configure graphics for menu ;;;
Debug_GameOverMenu_Index0_FadeOut_ConfigureGraphicsForMenu:
    REP #$30                                                             ;818D0F;
    JSL.L HandleFadingOut                                                ;818D11;
    LDA.B DP_Brightness                                                  ;818D15;
    AND.W #$000F                                                         ;818D17;
    BEQ +                                                                ;818D1A;
    RTS                                                                  ;818D1C;

+   JSL.L SetForceBlankAndWaitForNMI                                     ;818D1D;
    LDA.W #$0001                                                         ;818D21;
    JSL.L QueueSound_Lib3_Max6                                           ;818D24;
    JSL.L Disable_HDMAObjects                                            ;818D28;
    JSL.L Wait_End_VBlank_Clear_HDMA                                     ;818D2C;
    LDX.W #$0000                                                         ;818D30;

  .loopPalettes:
    LDA.L Palettes,X                                                     ;818D33;
    STA.L BackupOfPalettesDuringMenu,X                                   ;818D37;
    INX                                                                  ;818D3B;
    INX                                                                  ;818D3C;
    CPX.W #$0200                                                         ;818D3D;
    BMI .loopPalettes                                                    ;818D40;
    LDX.W #$0000                                                         ;818D42;

  .loopIORegisterMirrors:
    LDA.B DP_Brightness,X                                                ;818D45;
    STA.L BackupOfRegularIORegistersDuringGameOverMenu,X                 ;818D47;
    INX                                                                  ;818D4B;
    INX                                                                  ;818D4C;
    CPX.W #$0036                                                         ;818D4D;
    BMI .loopIORegisterMirrors                                           ;818D50;
    JSR.W MapVRAMForMenu                                                 ;818D52;
    JSR.W LoadInitialMenuTiles                                           ;818D55;
    REP #$30                                                             ;818D58;
    STZ.B DP_BG1XScroll                                                  ;818D5A;
    STZ.B DP_BG2XScroll                                                  ;818D5C;
    STZ.B DP_BG3XScroll                                                  ;818D5E;
    STZ.B DP_BG1YScroll                                                  ;818D60;
    STZ.B DP_BG2YScroll                                                  ;818D62;
    STZ.B DP_BG3YScroll                                                  ;818D64;
    JSR.W LoadMenuPalettes                                               ;818D66;
    INC.W PauseMenu_MenuIndex                                            ;818D69;
    RTS                                                                  ;818D6C;


if !DEBUG
;;; $8D6D: Debug game over menu - index 1: initialise ;;;
Debug_GameOverMenu_Index1_Initialise:
    REP #$30                                                             ;818D6D;
    LDA.W #$0000                                                         ;818D6F;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;818D72;
    LDA.W #$FF03                                                         ;818D76;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;818D79;
    SEP #$20                                                             ;818D7D;
    LDA.B #$11                                                           ;818D7F;
    STA.B DP_MainScreenLayers                                            ;818D81;
    REP #$30                                                             ;818D83;
    LDA.W #Debug_GameOverMenu_VRAMTransferDefinitions                    ;818D85;
    STA.B DP_Temp00                                                      ;818D88;
    LDA.W #$0081                                                         ;818D8A;
    STA.B DP_Temp02                                                      ;818D8D;
    JSL.L LoadDebugGameOverMenuTilemap                                   ;818D8F;
    JSL.L ClearForceBlankAndWaitForNMI                                   ;818D93;
    INC.W PauseMenu_MenuIndex                                            ;818D97;
    STZ.W ScreenFadeDelay                                                ;818D9A;
    STZ.W ScreenFadeCounter                                              ;818D9D;
    STZ.W FileSelectMapAreaIndex                                         ;818DA0;
    RTS                                                                  ;818DA3;


if !FEATURE_KEEP_UNREFERENCED
;;; $8DA4: Unused ;;;
UNUSED_818DA4:
    dw $000F                                                             ;818DA4;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8DA6: Debug game over menu - index 2/4: fade in ;;;
Debug_GameOverMenu_Index24_FadeIn:
    REP #$30                                                             ;818DA6;
    JSL.L HandleFadingIn                                                 ;818DA8;
    LDA.B DP_Brightness                                                  ;818DAC;
    AND.W #$000F                                                         ;818DAE;
    CMP.W #$000F                                                         ;818DB1;
    BNE .return                                                          ;818DB4;
    INC.W PauseMenu_MenuIndex                                            ;818DB6;

  .return:
    RTS                                                                  ;818DB9;
endif


;;; $8DBA: Map VRAM for menu ;;;
MapVRAMForMenu:
; PSR.M is set on return(!)
    SEP #$20                                                             ;818DBA;
    STZ.B DP_SubScreenLayers                                             ;818DBC;
    LDA.B #$03                                                           ;818DBE;
    STA.B DP_SpriteSizeAddr                                              ;818DC0;
    LDA.B #$51                                                           ;818DC2;
    STA.B DP_BG1TilemapAddrSize                                          ;818DC4;
    LDA.B #DP_BG1TilemapAddrSize                                         ;818DC6;
    STA.B DP_BG2TilemapAddrSize                                          ;818DC8;
    LDA.B #$5C                                                           ;818DCA;
    STA.B DP_BG3TilemapAddrSize                                          ;818DCC;
    LDA.B #$00                                                           ;818DCE;
    STA.B DP_BGTilesAddr                                                 ;818DD0;
    LDA.B #$04                                                           ;818DD2;
    STA.B DP_BGTilesAddr+1                                               ;818DD4;
    LDA.B #$13                                                           ;818DD6;
    STA.B DP_MainScreenLayers                                            ;818DD8;
    RTS                                                                  ;818DDA;


;;; $8DDB: Load initial menu tiles ;;;
LoadInitialMenuTiles:
    PHP                                                                  ;818DDB;
    SEP #$30                                                             ;818DDC;
    LDA.B #$00                                                           ;818DDE;
    STA.W $2116                                                          ;818DE0;
    LDA.B #$00                                                           ;818DE3;
    STA.W $2117                                                          ;818DE5;
    LDA.B #$80                                                           ;818DE8;
    STA.W $2115                                                          ;818DEA;
    JSL.L SetupHDMATransfer                                              ;818DED;
    db $01,$01,$18                                                       ;818DF1;
    dl Tiles_Menu_BG1_BG2                                                ;818DF4;
    dw $5600                                                             ;818DF7;
    LDA.B #$02                                                           ;818DF9;
    STA.W $420B                                                          ;818DFB;
    LDA.B #$00                                                           ;818DFE;
    STA.W $2116                                                          ;818E00;
    LDA.B #$30                                                           ;818E03;
    STA.W $2117                                                          ;818E05;
    LDA.B #$80                                                           ;818E08;
    STA.W $2115                                                          ;818E0A;
    JSL.L SetupHDMATransfer                                              ;818E0D;
    db $01,$01,$18                                                       ;818E11;
    dl Tiles_PauseScreen_BG1_BG2                                         ;818E14;
    dw $2000                                                             ;818E17;
    LDA.B #$02                                                           ;818E19;
    STA.W $420B                                                          ;818E1B;
    LDA.B #$00                                                           ;818E1E;
    STA.W $2116                                                          ;818E20;
    LDA.B #DP_WindowMaskBG12                                             ;818E23;
    STA.W $2117                                                          ;818E25;
    LDA.B #$80                                                           ;818E28;
    STA.W $2115                                                          ;818E2A;
    JSL.L SetupHDMATransfer                                              ;818E2D;
    db $01,$01,$18                                                       ;818E31;
    dl Tiles_Menu_PauseScreen_Sprites                                    ;818E34;
    dw $2000                                                             ;818E37;
    LDA.B #$02                                                           ;818E39;
    STA.W $420B                                                          ;818E3B;
    LDA.B #$00                                                           ;818E3E;
    STA.W $2116                                                          ;818E40;
    LDA.B #$40                                                           ;818E43;
    STA.W $2117                                                          ;818E45;
    LDA.B #$80                                                           ;818E48;
    STA.W $2115                                                          ;818E4A;
    JSL.L SetupHDMATransfer                                              ;818E4D;
    db $01,$01,$18                                                       ;818E51;
    dl Tiles_Beta_Minimap_Area_Select_BG3                                ;818E54;
    dw $0600                                                             ;818E57;
    LDA.B #$02                                                           ;818E59;
    STA.W $420B                                                          ;818E5B;
    PLP                                                                  ;818E5E;
    RTS                                                                  ;818E5F;


;;; $8E60: Load menu palettes ;;;
LoadMenuPalettes:
    REP #$30                                                             ;818E60;
    LDX.W #$0000                                                         ;818E62;

  .loop:
    LDA.L Menu_Palettes,X                                                ;818E65;
    STA.L Palettes,X                                                     ;818E69;
    LDA.L Menu_Palettes+2,X                                              ;818E6D;
    STA.L Palettes+2,X                                                   ;818E71;
    INX                                                                  ;818E75;
    INX                                                                  ;818E76;
    INX                                                                  ;818E77;
    INX                                                                  ;818E78;
    CPX.W #$0200                                                         ;818E79;
    BMI .loop                                                            ;818E7C;
    RTS                                                                  ;818E7E;


if !DEBUG
;;; $8E7F: Load debug game over menu tilemap ;;;
LoadDebugGameOverMenuTilemap:
;; Parameters:
;;     $00: Pointer to VRAM transfer definitions ($81:8EE1)
    LDX.W #$0000                                                         ;818E7F;
    LDA.W #$000F                                                         ;818E82;

  .loopClear:
    STA.L DebugGameOverMenuTilemap,X                                     ;818E85;
    INX                                                                  ;818E89;
    INX                                                                  ;818E8A;
    CPX.W #$0800                                                         ;818E8B;
    BMI .loopClear                                                       ;818E8E;
    LDX.W VRAMWriteStack                                                 ;818E90;
    LDA.W #$0800                                                         ;818E93;
    STA.B VRAMWrite.size,X                                               ;818E96;
    LDA.W #$3800                                                         ;818E98;
    STA.B VRAMWrite.src,X                                                ;818E9B;
    LDA.W #$007E                                                         ;818E9D;
    STA.B VRAMWrite.src+2,X                                              ;818EA0;
    LDA.B DP_BG1TilemapAddrSize                                          ;818EA2;
    AND.W #$00FC                                                         ;818EA4;
    XBA                                                                  ;818EA7;
    STA.B VRAMWrite.dest,X                                               ;818EA8;
    TXA                                                                  ;818EAA;
    CLC                                                                  ;818EAB;
    ADC.W #$0007                                                         ;818EAC;
    STA.W VRAMWriteStack                                                 ;818EAF;
    LDX.W VRAMWriteStack                                                 ;818EB2;
    LDY.W #$0000                                                         ;818EB5;

  .loop:
    LDA.B [DP_Temp00],Y                                                  ;818EB8;
    CMP.W #$FFFF                                                         ;818EBA;
    BEQ .return                                                          ;818EBD;
    STA.B VRAMWrite.size,X                                               ;818EBF;
    INY                                                                  ;818EC1;
    INY                                                                  ;818EC2;
    LDA.B [DP_Temp00],Y                                                  ;818EC3;
    STA.B VRAMWrite.src,X                                                ;818EC5;
    INY                                                                  ;818EC7;
    INY                                                                  ;818EC8;
    LDA.B [DP_Temp00],Y                                                  ;818EC9;
    STA.B VRAMWrite.src+2,X                                              ;818ECB;
    INY                                                                  ;818ECD;
    INY                                                                  ;818ECE;
    LDA.B [DP_Temp00],Y                                                  ;818ECF;
    STA.B VRAMWrite.dest,X                                               ;818ED1;
    TXA                                                                  ;818ED3;
    CLC                                                                  ;818ED4;
    ADC.W #$0007                                                         ;818ED5;
    TAX                                                                  ;818ED8;
    INY                                                                  ;818ED9;
    INY                                                                  ;818EDA;
    BRA .loop                                                            ;818EDB;

  .return:
    STX.W VRAMWriteStack                                                 ;818EDD;
    RTL                                                                  ;818EE0;


;;; $8EE1: Debug game over menu VRAM transfer definitions ;;;
Debug_GameOverMenu_VRAMTransferDefinitions:
;                        __________________ Size (or FFFFh terminator)
;                       |     _____________ Source address
;                       |    |       ______ Padding byte for source bank
;                       |    |      |   ___ Destination VRAM address
;                       |    |      |  |
; '            GAME QUIT           '
    dw $0040                                                             ;818EE1; Size (or FFFFh terminator)
    dl Tilemap_DebugGameOverMenu_gameQuit                                ;818EE3; Source address
    db $00                                                               ;818EE6; Padding byte for source bank
    dw $5140                                                             ;818EE7; Destination VRAM address

; '        WOULD YOU PLAY ?        '
    dw $0040                                                             ;818EE9; Size (or FFFFh terminator)
    dl Tilemap_DebugGameOverMenu_wouldYouPlay                            ;818EEB; Source address
    db $00                                                               ;818EEE; Padding byte for source bank
    dw $5180                                                             ;818EEF; Destination VRAM address

; '            END                 '
    dw $0040                                                             ;818EF1; Size (or FFFFh terminator)
    dl Tilemap_DebugGameOverMenu_end                                     ;818EF3; Source address
    db $00                                                               ;818EF6; Padding byte for source bank
    dw $51E0                                                             ;818EF7; Destination VRAM address

; '            CONTINUE            '
    dw $0040                                                             ;818EF9; Size (or FFFFh terminator)
    dl Tilemap_DebugGameOverMenu_continue                                ;818EFB; Source address
    db $00                                                               ;818EFE; Padding byte for source bank
    dw $5220                                                             ;818EFF; Destination VRAM address
    dw $FFFF                                                             ;818F01; Terminator


;;; $8F03: Debug game over menu tilemaps ;;;
Tilemap_DebugGameOverMenu:
  .gameQuit:
; '            GAME QUIT           '
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;818F03;
    dw $000F,$000F,$000F,$000F,$0070,$006A,$0076,$006E                   ;818F13;
    dw $000F,$007A,$007E,$0072,$007D,$000F,$000F,$000F                   ;818F23;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;818F33;

  .wouldYouPlay:
; '        WOULD YOU PLAY ?        '
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;818F43;
    dw $0080,$0078,$007E,$0075,$006D,$000F,$0082,$0078                   ;818F53;
    dw $007E,$000F,$0079,$0075,$006A,$0082,$000F,$0085                   ;818F63;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;818F73;

  .end:
; '            END                 '
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;818F83;
    dw $000F,$000F,$000F,$000F,$006E,$0077,$006D,$000F                   ;818F93;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;818FA3;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;818FB3;

  .continue:
; '            CONTINUE            '
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;818FC3;
    dw $000F,$000F,$000F,$000F,$006C,$0078,$0077,$007D                   ;818FD3;
    dw $0072,$0077,$007E,$006E,$000F,$000F,$000F,$000F                   ;818FE3;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;818FF3;


;;; $9003: Debug game over menu - index 3: main ;;;
DebugGameOverMenu_Index3_Main:
    REP #$30                                                             ;819003;
    LDA.B DP_Controller1New                                              ;819005;
    BIT.W #$2000                                                         ;819007;
    BNE .toggleSelection                                                 ;81900A;
    BIT.W #$0800                                                         ;81900C;
    BNE .toggleSelection                                                 ;81900F;
    BIT.W #$0400                                                         ;819011;
    BNE .toggleSelection                                                 ;819014;
    BIT.W #$9080                                                         ;819016;
    BEQ .noChange                                                        ;819019;
    LDA.W FileSelectMapAreaIndex                                         ;81901B;
    BNE +                                                                ;81901E;
    LDA.W SaveSlotSelected                                               ;819020;
    JSL.L SaveToSRAM                                                     ;819023;
    JML.L SoftReset                                                      ;819027;

+   INC.W PauseMenu_MenuIndex                                            ;81902B;
    RTS                                                                  ;81902E;

  .toggleSelection:
    LDA.W FileSelectMapAreaIndex                                         ;81902F;
    EOR.W #$0001                                                         ;819032;
    STA.W FileSelectMapAreaIndex                                         ;819035;

  .noChange:
    LDX.W #$7800                                                         ;819038;
    LDA.W FileSelectMapAreaIndex                                         ;81903B;
    BEQ +                                                                ;81903E;
    LDX.W #$8800                                                         ;819040;

+   TXA                                                                  ;819043;
    ORA.W #$0028                                                         ;819044;
    LDX.W OAMStack                                                       ;819047;
    STA.W OAMLow,X                                                       ;81904A;
    LDA.W #$00B6                                                         ;81904D;
    STA.W OAMLow+2,X                                                     ;819050;
    INX                                                                  ;819053;
    INX                                                                  ;819054;
    INX                                                                  ;819055;
    INX                                                                  ;819056;
    STX.W OAMStack                                                       ;819057;
    RTS                                                                  ;81905A;


;;; $905B: Restore palettes and regular IO registers from debug game over menu ;;;
RestorePalettesAndIORegistersFromDebugGameOverMenu:
; The restoring of IO registers here has no effect, due to the ensuing unpause code calling $82:8E19, which sets the IO registers to the pause menu backup
; The restoring of the palettes is also redundant, due to the unpause code
    LDX.W #$0000                                                         ;81905B;

  .loopPalettes:
    LDA.L BackupOfPalettesDuringMenu,X                                   ;81905E;
    STA.L Palettes,X                                                     ;819062;
    INX                                                                  ;819066;
    INX                                                                  ;819067;
    CPX.W #$0200                                                         ;819068;
    BMI .loopPalettes                                                    ;81906B;
    LDX.W #$0000                                                         ;81906D;

  .loopIORegisters:
    LDA.L BackupOfRegularIORegistersDuringGameOverMenu,X                 ;819070;
    STA.B DP_Brightness,X                                                ;819074;
    INX                                                                  ;819076;
    INX                                                                  ;819077;
    CPX.W #$0036                                                         ;819078;
    BMI .loopIORegisters                                                 ;81907B;
    RTS                                                                  ;81907D;


;;; $907E: Debug game over menu - index 5: continue ;;;
DebugGameOverMenu_Index5_Continue:
    SEP #$30                                                             ;81907E;
    LDA.B #$00                                                           ;819080;
    STA.W $2116                                                          ;819082;
    LDA.B #$40                                                           ;819085;
    STA.W $2117                                                          ;819087;
    LDA.B #$80                                                           ;81908A;
    STA.W $2115                                                          ;81908C;
    JSL.L SetupHDMATransfer                                              ;81908F;
    db $01,$01,$18                                                       ;819093;
    dl Tiles_Standard_BG3                                                ;819096;
    dw $2000                                                             ;819099;
    LDA.B #$02                                                           ;81909B;
    STA.W $420B                                                          ;81909D;
    REP #$30                                                             ;8190A0;
    LDA.W #$0010                                                         ;8190A2;
    STA.W GameState                                                      ;8190A5;
    STZ.W FileSelectMapAreaIndex                                         ;8190A8;
    JMP.W RestorePalettesAndIORegistersFromDebugGameOverMenu             ;8190AB;
endif


;;; $90AE: Game over menu ;;;
GameOverMenu:
    REP #$30                                                             ;8190AE;
    PHB                                                                  ;8190B0;
    PHK                                                                  ;8190B1;
    PLB                                                                  ;8190B2;
    LDA.W PauseMenu_MenuIndex                                            ;8190B3;
    ASL                                                                  ;8190B6;
    TAX                                                                  ;8190B7;
    JSR.W (.pointers,X)                                                  ;8190B8;
    PLB                                                                  ;8190BB;
    RTL                                                                  ;8190BC;

  .pointers:
    dw Debug_GameOverMenu_Index0_FadeOut_ConfigureGraphicsForMenu        ;8190BD;
    dw GameOverMenu_Index1_Initialise                                    ;8190BF;
    dw GameOverMenu_Index2_PlayMusicTrack                                ;8190C1;
    dw GameOverMenu_Index3_FadeIn                                        ;8190C3;
    dw GameOverMenu_Index4_Main                                          ;8190C5;
    dw GameOverMenu_Index5_FadeOutIntoGameMapView                        ;8190C7;
    dw GameOverMenu_Index6_LoadGameMapView                               ;8190C9;
    dw GameOverMenu_Index7_FadeOutIntoGameMapView                        ;8190CB;


;;; $90CD: Game over menu - index 3: fade in ;;;
GameOverMenu_Index3_FadeIn:
    JSL.L Handle_GameOver_BabyMetroid                                    ;8190CD;
    JSL.L Draw_Menu_Selection_Missile                                    ;8190D1;
    JSL.L HandleFadingIn                                                 ;8190D5;
    LDA.B DP_Brightness                                                  ;8190D9;
    AND.W #$000F                                                         ;8190DB;
    CMP.W #$000F                                                         ;8190DE;
    BNE .return                                                          ;8190E1;
    INC.W PauseMenu_MenuIndex                                            ;8190E3;

  .return:
    RTS                                                                  ;8190E6;


;;; $90E7: Game over menu - index 5: fade out into game map view ;;;
GameOverMenu_Index5_FadeOutIntoGameMapView:
    JSL.L Handle_GameOver_BabyMetroid                                    ;8190E7;
    JSL.L Draw_Menu_Selection_Missile                                    ;8190EB;
    JSL.L HandleFadingOut                                                ;8190EF;
    LDA.B DP_Brightness                                                  ;8190F3;
    AND.W #$000F                                                         ;8190F5;
    BNE .return                                                          ;8190F8;
    INC.W PauseMenu_MenuIndex                                            ;8190FA;

  .return:
    RTS                                                                  ;8190FD;


;;; $90FE: Game over menu - index 7: fade out into soft reset ;;;
GameOverMenu_Index7_FadeOutIntoGameMapView:
    JSL.L Draw_Menu_Selection_Missile                                    ;8190FE;
    JSL.L Handle_GameOver_BabyMetroid                                    ;819102;
    JSL.L HandleFadingOut                                                ;819106;
    LDA.B DP_Brightness                                                  ;81910A;
    AND.W #$000F                                                         ;81910C;
    BEQ .softReset                                                       ;81910F;
    RTS                                                                  ;819111;

  .softReset:
    JML.L SoftReset                                                      ;819112;


;;; $9116: Game over menu - index 6: load game map view ;;;
GameOverMenu_Index6_LoadGameMapView:
    JSL.L Disable_HDMAObjects                                            ;819116;
    JSL.L Wait_End_VBlank_Clear_HDMA                                     ;81911A;
    LDA.W #$0005                                                         ;81911E;
    STA.W GameState                                                      ;819121;
    LDA.W #$0000                                                         ;819124;
    STA.W PauseMenu_MenuIndex                                            ;819127;
    RTS                                                                  ;81912A;


;;; $912B: Game over menu - index 4: main ;;;
GameOverMenu_Index4_Main:
    REP #$30                                                             ;81912B;
    JSL.L Handle_GameOver_BabyMetroid                                    ;81912D;
    JSL.L Draw_Menu_Selection_Missile                                    ;819131;
    LDA.B DP_Controller1New                                              ;819135;
    BIT.W #$2000                                                         ;819137;
    BNE .toggleSelection                                                 ;81913A;
    BIT.W #$0800                                                         ;81913C;
    BNE .toggleSelection                                                 ;81913F;
    BIT.W #$0400                                                         ;819141;
    BNE .toggleSelection                                                 ;819144;
    BIT.W #$0080                                                         ;819146;
    BEQ .noChange                                                        ;819149;
    LDA.W #$00B4                                                         ;81914B;
    STA.W Enemy.instTimer                                                ;81914E;
    LDA.W FileSelectMapAreaIndex                                         ;819151;
    BEQ +                                                                ;819154;
    LDA.W #$0007                                                         ;819156;
    STA.W PauseMenu_MenuIndex                                            ;819159;
    RTS                                                                  ;81915C;

+   LDA.L SRAMMirror_LoadingGameState                                    ;81915D;
    CMP.W #$001F                                                         ;819161;
    BEQ +                                                                ;819164;
    INC.W PauseMenu_MenuIndex                                            ;819166;
    LDA.W SaveSlotSelected                                               ;819169;
    JSL.L LoadFromSRAM                                                   ;81916C;
    RTS                                                                  ;819170;

+   STA.W GameState                                                      ;819171;
    LDA.W SaveSlotSelected                                               ;819174;
    JSL.L LoadFromSRAM                                                   ;819177;
    RTS                                                                  ;81917B;

  .toggleSelection:
    LDA.W #$0037                                                         ;81917C;
    JSL.L QueueSound_Lib1_Max6                                           ;81917F;
    LDA.W FileSelectMapAreaIndex                                         ;819183;
    EOR.W #$0001                                                         ;819186;
    STA.W FileSelectMapAreaIndex                                         ;819189;

  .noChange:
    LDX.W #$0028                                                         ;81918C;
    LDY.W #$00A0                                                         ;81918F;
    LDA.W FileSelectMapAreaIndex                                         ;819192;
    BEQ +                                                                ;819195;
    LDX.W #$0028                                                         ;819197;
    LDY.W #$00C0                                                         ;81919A;

+   STX.W Mode7Object_InstListPointers                                   ;81919D;
    STY.W Mode7Object_InstructionTimers+2                                ;8191A0;
    RTS                                                                  ;8191A3;


;;; $91A4: Game over menu - index 1: initialise ;;;
GameOverMenu_Index1_Initialise:
    SEP #$20                                                             ;8191A4;
    LDA.B #$11                                                           ;8191A6;
    STA.B DP_MainScreenLayers                                            ;8191A8;
    LDA.B #$20                                                           ;8191AA;
    STA.B DP_ColorMathSubScreenBackdropColor0                            ;8191AC;
    LDA.B #$40                                                           ;8191AE;
    STA.B DP_ColorMathSubScreenBackdropColor1                            ;8191B0;
    LDA.B #$80                                                           ;8191B2;
    STA.B DP_ColorMathSubScreenBackdropColor2                            ;8191B4;
    REP #$30                                                             ;8191B6;
    LDA.W #$0000                                                         ;8191B8;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;8191BB;
    LDA.W #$FF03                                                         ;8191BF;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;8191C2;
    LDA.W #$0001                                                         ;8191C6;
    STA.W EnemyProjectile_Enable                                         ;8191C9;
    DEC                                                                  ;8191CC;
    STA.W EnemyProjectile_ID                                             ;8191CD;
    LDX.W #$0000                                                         ;8191D0;
    LDA.W #$000F                                                         ;8191D3;

  .loop:
    STA.L MenuTilemap,X                                                  ;8191D6;
    INX                                                                  ;8191DA;
    INX                                                                  ;8191DB;
    CPX.W #$0800                                                         ;8191DC;
    BMI .loop                                                            ;8191DF;
    LDX.W VRAMWriteStack                                                 ;8191E1;
    LDA.W #$0800                                                         ;8191E4;
    STA.B VRAMWrite.size,X                                               ;8191E7;
    LDA.W #$3600                                                         ;8191E9;
    STA.B VRAMWrite.src,X                                                ;8191EC;
    LDA.W #$007E                                                         ;8191EE;
    STA.B VRAMWrite.src+2,X                                              ;8191F1;
    LDA.B DP_BG1TilemapAddrSize                                          ;8191F3;
    AND.W #$00FC                                                         ;8191F5;
    XBA                                                                  ;8191F8;
    STA.B VRAMWrite.dest,X                                               ;8191F9;
    TXA                                                                  ;8191FB;
    CLC                                                                  ;8191FC;
    ADC.W #$0007                                                         ;8191FD;
    STA.W VRAMWriteStack                                                 ;819200;
    STZ.W Enemy.palette                                                  ;819203;
    LDY.W #Tilemap_GameOver_gameOver                                     ;819206;
    LDX.W #($B<<1)|($5<<6)                                               ;819209; $0156
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;81920C;
    LDY.W #Tilemap_GameOver_findTheMetroidLarva                          ;81920F;
    LDX.W #($5<<1)|($E<<6)                                               ;819212; $038A
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819215;
    LDY.W #Tilemap_GameOver_tryAgain                                     ;819218;
    LDX.W #($A<<1)|($10<<6)                                              ;81921B; $0414
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;81921E;
    LDY.W #Tilemap_GameOver_yesReturnToGame                              ;819221;
    LDX.W #($7<<1)|($13<<6)                                              ;819224; $04CE
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819227;
    LDY.W #Tilemap_GameOver_noGoToTitle                                  ;81922A;
    LDX.W #($7<<1)|($17<<6)                                              ;81922D; $05CE
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819230;
    STZ.W Enemy.instList                                                 ;819233;
    STZ.W Enemy.instTimer                                                ;819236;
    JSL.L Handle_GameOver_BabyMetroid                                    ;819239;
    LDA.B DP_ColorMathA                                                  ;81923D;
    AND.W #$FF00                                                         ;81923F;
    STA.B DP_ColorMathA                                                  ;819242;
    JSL.L Disable_HDMAObjects                                            ;819244;
    JSL.L Wait_End_VBlank_Clear_HDMA                                     ;819248;
    JSL.L Enable_HDMAObjects                                             ;81924C;
    JSL.L Spawn_HDMAObject                                               ;819250;
    db $00,$32                                                           ;819254;
    dw HDMAObjInstList_ColorMathSubscnBackdrop_GameOverMenuGradient      ;819256;
    JSL.L Spawn_HDMAObject                                               ;819258;
    db $00,$31                                                           ;81925C;
    dw HDMAObjInstList_ColorMathCtrlRegB_GameOverMenuGradient            ;81925E;
    JSL.L ClearForceBlankAndWaitForNMI                                   ;819260;
    INC.W PauseMenu_MenuIndex                                            ;819264;
    STZ.W ScreenFadeDelay                                                ;819267;
    STZ.W ScreenFadeCounter                                              ;81926A;
    STZ.W FileSelectMapAreaIndex                                         ;81926D;
    LDA.W #$0028                                                         ;819270;
    STA.W Mode7Object_InstListPointers                                   ;819273;
    LDA.W #$00A0                                                         ;819276;
    STA.W Mode7Object_InstructionTimers+2                                ;819279;
    RTS                                                                  ;81927C;


;;; $927D: HDMA object instruction list - colour math subscreen backdrop colour - game over menu gradient ;;;
HDMAObjInstList_ColorMathSubscnBackdrop_GameOverMenuGradient:
    dw Instruction_HDMAObject_HDMATableBank : db $81                     ;81927D;
    dw Instruction_HDMAObject_PreInstructionInY : dl RTL_8192DB          ;819280;
    dw $0001, HDMATable_ColorMathSubscnBackdrop_GameOverMenuGradient     ;819285;
    dw Instruction_HDMAObject_Sleep                                      ;819289;
    dw Instruction_HDMAObject_Delete                                     ;81928B;


;;; $928D: HDMA object instruction list - colour math control register B - game over menu gradient ;;;
HDMAObjInstList_ColorMathCtrlRegB_GameOverMenuGradient:
    dw Instruction_HDMAObject_HDMATableBank : db $81                     ;81928D;
    dw Instruction_HDMAObject_PreInstructionInY : dl RTL_8192DB          ;819290;
    dw $0001, HDMATable_ColorMathCtrlRegB_GameOverMenuGradient           ;819295;
    dw Instruction_HDMAObject_Sleep                                      ;819299;
    dw Instruction_HDMAObject_Delete                                     ;81929B;


;;; $929D: HDMA table - colour math control register B - game over menu gradient ;;;
HDMATable_ColorMathCtrlRegB_GameOverMenuGradient:
; Enable subtractive colour math on BG1/backdrop
    db $40,$A1                                                           ;81929D;
    db $3A,$A1
; Enable colour math on BG1/backdrop
    db $40,$21
    db $40,$21
    db $00,$00


;;; $92A7: HDMA table - colour math subscreen backdrop colour - game over menu gradient ;;;
HDMATable_ColorMathSubscnBackdrop_GameOverMenuGradient:
    db $05,$E8                                                           ;8192A7;
    db $05,$E7
    db $05,$E6
    db $07,$E5
    db $08,$E4
    db $0A,$E3
    db $0C,$E2
    db $0C,$E1
    db $40,$E0
    db $05,$C0
    db $0E,$C1
    db $0C,$C2
    db $0C,$C3
    db $08,$C4
    db $07,$C5
    db $06,$C6
    db $06,$C7
    db $06,$C8
    db $06,$C9
    db $07,$CA
    db $06,$CB
    db $06,$CC
    db $06,$CD
    db $06,$CE
    db $02,$CF
    db $00,$00


;;; $92DB: RTL ;;;
RTL_8192DB:
    RTL                                                                  ;8192DB;


;;; $92DC: Game over tilemaps ;;;
Tilemap_GameOver_gameOver:
; GAME OVER
    dw $000C,$000A,$0026,$000E,$000F,$0000,$002D,$000E                   ;8192DC;
    dw $000D,$FFFE,$0030,$001A,$0036,$001E,$000F,$0010                   ;8192EC;
    dw $003E,$001E,$003A,$FFFF                                           ;8192FC;


Tilemap_GameOver_findTheMetroidLarva:
; FIND THE METROID LARVA!
    dw $006F,$0072,$0077,$006D,$000F,$007D,$0071,$006E                   ;819304;
    dw $000F,$0076,$006E,$007D,$007B,$0078,$0072,$006D                   ;819314;
    dw $000F,$0075,$006A,$007B,$007F,$006A,$0084,$FFFF                   ;819324;


Tilemap_GameOver_tryAgain:
; TRY AGAIN?
    dw $007D,$007B,$0082,$000F,$006A,$0070,$006A,$0072                   ;819334;
    dw $0077,$000F,$0085,$FFFF                                           ;819344;


Tilemap_GameOver_yesReturnToGame:
; YES (RETURN TO GAME)
    dw $0041,$000E,$002B,$000F,$000F,$000F,$000F,$000F                   ;81934C;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81935C;
    dw $000F,$000F,$000F,$000F,$FFFE,$0017,$001E,$003B                   ;81936C;
    dw $000F,$008A,$007B,$006E,$007D,$007E,$007B,$0077                   ;81937C;
    dw $000F,$007D,$0078,$000F,$0070,$006A,$0076,$006E                   ;81938C;
    dw $008B,$FFFF                                                       ;81939C;


Tilemap_GameOver_noGoToTitle:
; N O (GO TO TITLE)
    dw $0027,$000F,$0000,$000F,$000F,$000F,$000F,$000F                   ;8193A0;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;8193B0;
    dw $000F,$FFFE,$0037,$000F,$0010,$000F,$008A,$0070                   ;8193C0;
    dw $0078,$000F,$007D,$0078,$000F,$007D,$0072,$007D                   ;8193D0;
    dw $0075,$006E,$008B,$FFFF                                           ;8193E0;


;;; $93E8: Game over menu - index 2: play pre-statue hall music track ;;;
GameOverMenu_Index2_PlayMusicTrack:
    REP #$30                                                             ;8193E8;
    JSL.L CheckIfMusicIsQueued                                           ;8193EA;
    BCS .return                                                          ;8193EE;
    INC.W PauseMenu_MenuIndex                                            ;8193F0;
    LDA.W #$0004                                                         ;8193F3;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;8193F6;

  .return:
    RTS                                                                  ;8193FA;


;;; $93FB: File select menu ;;;
FileSelectMenu:
    REP #$30                                                             ;8193FB;
    PHB                                                                  ;8193FD;
    PHK                                                                  ;8193FE;
    PLB                                                                  ;8193FF;
    LDA.W PauseMenu_MenuIndex                                            ;819400;
    ASL                                                                  ;819403;
    TAX                                                                  ;819404;
    JSR.W (.pointers,X)                                                  ;819405;
    PLB                                                                  ;819408;
    RTL                                                                  ;819409;

  .pointers:
    dw FileSelectMenu_Index0_TitleSequenceToMain_FadeOutConfigGfx        ;81940A;
    dw FileSelectMenu_Index1_TitleSequenceToMain_LoadBG2                 ;81940C;
    dw FileSelectMenu_Index2_TitleSequenceToMain                         ;81940E;
    dw FileSelectMenu_Index3_TitleSequenceToMain_FadeIn                  ;819410;
    dw FileSelectMenu_Index4_Main                                        ;819412;
    dw FileSelectMenu_Index5_13_FadeOutFromMain                          ;819414;
    dw FileSelectMenu_Index6_MainToFileCopy_Initialise                   ;819416;
    dw FileSelectMenu_Index7_15_FadeInFromMain                           ;819418;
    dw FileSelectMenu_Index8_FileCopy_SelectSource                       ;81941A;
    dw FileSelectMenu_Index9_FileCopy_InitialiseSelectDestination        ;81941C;
    dw FileSelectMenu_IndexA_FileCopy_SelectDestination                  ;81941E;
    dw FileSelectMenu_IndexB_FileCopy_InitialiseConfirmation             ;819420;
    dw FileSelectMenu_IndexC_FileCopy_Confirmation                       ;819422;
    dw FileSelectMenu_Index0_FileCopy_DoFileCopy                         ;819424;
    dw FileSelectMenu_IndexE_FileCopy_CopyCompleted                      ;819426;
    dw FileSelectMenu_IndexF_1B_FadeOutToMain                            ;819428;
    dw FileSelectMenu_Index10_1C_ReloadMain                              ;81942A;
    dw FileSelectMenu_Index11_10_FadeInToMain                            ;81942C;
    dw FileSelectMenu_Index12_FileCopyToMain_MenuIndex_Main              ;81942E;
    dw FileSelectMenu_Index5_13_FadeOutFromMain                          ;819430;
    dw FileSelectMenu_Index14_MainToFileClear_Initialise                 ;819432;
    dw FileSelectMenu_Index7_15_FadeInFromMain                           ;819434;
    dw FileSelectMenu_Index16_FileClear_SelectSlot                       ;819436;
    dw FileSelectMenu_Index17_FileClear_InitialiseConfirmation           ;819438;
    dw FileSelectMenu_Index18_FileClear_Confirmation                     ;81943A;
    dw FileSelectMenu_Index19_FileClear_DoFileClear                      ;81943C;
    dw FileSelectMenu_Index1A_FileClear_ClearCompleted                   ;81943E;
    dw FileSelectMenu_IndexF_1B_FadeOutToMain                            ;819440;
    dw FileSelectMenu_Index10_1C_ReloadMain                              ;819442;
    dw FileSelectMenu_Index11_10_FadeInToMain                            ;819444;
    dw FileSelectMenu_Index1E_FileClearToMain_MenuIndex_Main             ;819446;
    dw FileSelectMenu_Index1F_MainToOptionsMenu_TurnSamusHelmet          ;819448;
    dw FileSelectMenu_Index20_MainToOptionsMenu_FadeOut                  ;81944A;
    dw FileSelectMenu_Index21_MainToTitleSequence                        ;81944C;


;;; $944E: File select menu - index 0: title sequence to main - fade out and configure graphics ;;;
FileSelectMenu_Index0_TitleSequenceToMain_FadeOutConfigGfx:
    REP #$30                                                             ;81944E;
    JSL.L HandleFadingOut                                                ;819450;
    LDA.B DP_Brightness                                                  ;819454;
    AND.W #$000F                                                         ;819456;
    BEQ +                                                                ;819459;
    RTS                                                                  ;81945B;

+   JSL.L SetForceBlankAndWaitForNMI                                     ;81945C;
    LDA.W #$0001                                                         ;819460;
    JSL.L QueueSound_Lib3_Max6                                           ;819463;
    JSL.L Disable_HDMAObjects                                            ;819467;
    JSL.L Wait_End_VBlank_Clear_HDMA                                     ;81946B;
    INC.W PauseMenu_MenuIndex                                            ;81946F;
    JSR.W MapVRAMForMenu                                                 ;819472;
    JSR.W LoadInitialMenuTiles                                           ;819475;
    REP #$30                                                             ;819478;
    STZ.B DP_BG1XScroll                                                  ;81947A;
    STZ.B DP_BG2XScroll                                                  ;81947C;
    STZ.B DP_BG3XScroll                                                  ;81947E;
    STZ.B DP_BG1YScroll                                                  ;819480;
    STZ.B DP_BG2YScroll                                                  ;819482;
    STZ.B DP_BG3YScroll                                                  ;819484;


;;; $9486: Load file select palettes ;;;
LoadFileSelectPalettes:
; Clone of LoadMenuPalettes, expect with no `REP #$30`
    LDX.W #$0000                                                         ;819486;

  .loop:
    LDA.L Menu_Palettes,X                                                ;819489;
    STA.L Palettes,X                                                     ;81948D;
    LDA.L Menu_Palettes+2,X                                              ;819491;
    STA.L Palettes+2,X                                                   ;819495;
    INX                                                                  ;819499;
    INX                                                                  ;81949A;
    INX                                                                  ;81949B;
    INX                                                                  ;81949C;
    CPX.W #$0200                                                         ;81949D;
    BMI .loop                                                            ;8194A0;
    RTS                                                                  ;8194A2;


;;; $94A3: File select menu - index 20h: main to options menu - fade out ;;;
FileSelectMenu_Index20_MainToOptionsMenu_FadeOut:
    REP #$30                                                             ;8194A3;
    JSL.L Draw_Menu_Selection_Missile                                    ;8194A5;
    JSL.L Draw_Border_Around_SAMUS_DATA                                  ;8194A9;
    JSR.W Draw_FileSelect_SamusHelmets                                   ;8194AD;
    JSL.L HandleFadingOut                                                ;8194B0;
    LDA.B DP_Brightness                                                  ;8194B4;
    AND.W #$000F                                                         ;8194B6;
    BNE .return                                                          ;8194B9;
    LDA.W #$0002                                                         ;8194BB;
    STA.W GameState                                                      ;8194BE;
    STZ.W PauseMenu_MenuIndex                                            ;8194C1;
    LDY.W #$0000                                                         ;8194C4;
    LDA.W #$0000                                                         ;8194C7;

  .loop:
    STA.W EnemyProjectile_Enable,Y                                       ;8194CA;
    INY                                                                  ;8194CD;
    INY                                                                  ;8194CE;
    CPY.W #$0030                                                         ;8194CF;
    BMI .loop                                                            ;8194D2;

  .return:
    RTS                                                                  ;8194D4;


;;; $94D5: File select menu - index 21h: main to title sequence ;;;
FileSelectMenu_Index21_MainToTitleSequence:
    REP #$30                                                             ;8194D5;
    JSL.L Draw_Border_Around_SAMUS_DATA                                  ;8194D7;
    JSR.W Draw_FileSelect_SamusHelmets                                   ;8194DB;
    JSL.L HandleFadingOut                                                ;8194DE;
    LDA.B DP_Brightness                                                  ;8194E2;
    AND.W #$000F                                                         ;8194E4;
    BNE .return                                                          ;8194E7;
    JML.L SoftReset                                                      ;8194E9;

  .return:
    RTS                                                                  ;8194ED;


;;; $94EE: File select menu - index 5/13h: fade out from main ;;;
FileSelectMenu_Index5_13_FadeOutFromMain:
    REP #$30                                                             ;8194EE;
    JSL.L Draw_Menu_Selection_Missile                                    ;8194F0;


;;; $94F4: File select menu - index Fh/1Bh: fade out to main ;;;
FileSelectMenu_IndexF_1B_FadeOutToMain:
    JSL.L HandleFadingOut                                                ;8194F4;
    LDA.B DP_Mosaic                                                      ;8194F8;
    AND.W #$FF0F                                                         ;8194FA;
    STA.B DP_Temp12                                                      ;8194FD;
    LDA.B DP_Brightness                                                  ;8194FF;
    AND.W #$000F                                                         ;819501;
    ASL                                                                  ;819504;
    ASL                                                                  ;819505;
    ASL                                                                  ;819506;
    ASL                                                                  ;819507;
    EOR.W #$00F0                                                         ;819508;
    ORA.B DP_Temp12                                                      ;81950B;
    STA.B DP_Mosaic                                                      ;81950D;
    LDA.B DP_Brightness                                                  ;81950F;
    AND.W #$000F                                                         ;819511;
    BNE .return                                                          ;819514;
    JSL.L SetForceBlankAndWaitForNMI                                     ;819516;
    INC.W PauseMenu_MenuIndex                                            ;81951A;

  .return:
    RTS                                                                  ;81951D;


;;; $951E: File select menu - index 11h/1Dh: fade in to main ;;;
FileSelectMenu_Index11_10_FadeInToMain:
    REP #$30                                                             ;81951E;
    LDA.W SaveSlotSelected                                               ;819520;
    ASL                                                                  ;819523;
    ASL                                                                  ;819524;
    TAX                                                                  ;819525;
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Yposition,X        ;819526;
    STA.W Mode7Object_InstructionTimers+2                                ;819529;
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Xposition,X        ;81952C;
    STA.W Mode7Object_InstListPointers                                   ;81952F; fallthrough to FileSelectMenu_Index7_15_FadeInFromMain


;;; $9532: File select menu - index 7/15h: fade in from main ;;;
FileSelectMenu_Index7_15_FadeInFromMain:
    REP #$30                                                             ;819532;
    JSL.L Draw_Menu_Selection_Missile                                    ;819534;
    JSL.L HandleFadingIn                                                 ;819538;
    LDA.B DP_Mosaic                                                      ;81953C;
    AND.W #$FF0F                                                         ;81953E;
    STA.B DP_Temp12                                                      ;819541;
    LDA.B DP_Brightness                                                  ;819543;
    AND.W #$000F                                                         ;819545;
    ASL                                                                  ;819548;
    ASL                                                                  ;819549;
    ASL                                                                  ;81954A;
    ASL                                                                  ;81954B;
    EOR.W #$00F0                                                         ;81954C;
    ORA.B DP_Temp12                                                      ;81954F;
    STA.B DP_Mosaic                                                      ;819551;
    LDA.B DP_Brightness                                                  ;819553;
    AND.W #$000F                                                         ;819555;
    CMP.W #$000F                                                         ;819558;
    BNE .return                                                          ;81955B;
    INC.W PauseMenu_MenuIndex                                            ;81955D;

  .return:
    RTS                                                                  ;819560;


;;; $9561: File select menu - index 6: main to file copy - initialise ;;;
FileSelectMenu_Index6_MainToFileCopy_Initialise:
    REP #$30                                                             ;819561;
    INC.W PauseMenu_MenuIndex                                            ;819563; fallthrough to Initialise_FileSelectMenu_FileCopy


;;; $9566: Initialise file select menu file copy ;;;
Initialise_FileSelectMenu_FileCopy:
    JSR.W ClearMenuTilemap                                               ;819566;
    LDY.W #Tilemap_FileSelect_dataCopyMode                               ;819569;
    LDX.W #($9<<1)|($1<<6)                                               ;81956C; $0052
    STZ.W Enemy.palette                                                  ;81956F;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819572;
    LDY.W #Tilemap_FileSelect_copyWhichData                              ;819575;
    LDX.W #($8<<1)|($5<<6)                                               ;819578; $0150
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;81957B;
    JSR.W LoadMenuExitTilemap                                            ;81957E;
    JSR.W Draw_FileCopyClear_SaveFileInfo                                ;819581;
    JSR.W SetInitial_FileCopyClear_MenuSelection                         ;819584;
    JSR.W Set_FileCopyMenu_SelectionMissile_Position                     ;819587;
    STZ.W TitleMenu_FileCopySrcFileClearSlot                             ;81958A;
    STZ.W TitleMenu_FileCopyDestSlot                                     ;81958D;
    RTS                                                                  ;819590;


if !FEATURE_KEEP_UNREFERENCED
;;; $9591: Unused. REP #$30 ;;;
UNUSED_REP30_819591:
    REP #$30                                                             ;819591;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9593: Set initial file copy/clear menu selection ;;;
SetInitial_FileCopyClear_MenuSelection:
    LDA.W NonEmptySaveSlots                                              ;819593;
    LDY.W #$0000                                                         ;819596;

  .loop:
    LSR                                                                  ;819599;
    BCS .return                                                          ;81959A;
    INY                                                                  ;81959C;
    CPY.W #$0003                                                         ;81959D;
    BMI .loop                                                            ;8195A0;

  .return:
    STY.W CinematicBGObject_IndirectInstructionPointers                  ;8195A2;
    RTS                                                                  ;8195A5;


;;; $95A6: Clear menu tilemap ;;;
ClearMenuTilemap:
    LDX.W #$07FE                                                         ;8195A6;
    LDA.W #$000F                                                         ;8195A9;

  .loop:
    STA.L MenuTilemap,X                                                  ;8195AC;
    DEX                                                                  ;8195B0;
    DEX                                                                  ;8195B1;
    BPL .loop                                                            ;8195B2;
    RTS                                                                  ;8195B4;


;;; $95B5: Load menu exit tilemap ;;;
LoadMenuExitTilemap:
    LDY.W #Tilemap_FileSelect_exit                                       ;8195B5;
    LDX.W #($4<<1)|($1A<<6)                                              ;8195B8; $0688
    JMP.W Load_Tilemap_in_Y_to_X_Coordinates                             ;8195BB;


;;; $95BE: Draw file copy/clear save file info ;;;
Draw_FileCopyClear_SaveFileInfo:
    LDA.W #$0000                                                         ;8195BE;
    JSR.W LoadFromSRAM_external                                          ;8195C1;
    STZ.W Enemy.palette                                                  ;8195C4;
    LDA.W NonEmptySaveSlots                                              ;8195C7;
    BIT.W #$0001                                                         ;8195CA;
    BNE +                                                                ;8195CD;
    LDA.W #$0400                                                         ;8195CF;
    STA.W Enemy.palette                                                  ;8195D2;

+   JSR.W Draw_FileCopyClear_SaveSlotAInfo                               ;8195D5;
    LDA.W #$0001                                                         ;8195D8;
    JSR.W LoadFromSRAM_external                                          ;8195DB;
    STZ.W Enemy.palette                                                  ;8195DE;
    LDA.W NonEmptySaveSlots                                              ;8195E1;
    BIT.W #$0002                                                         ;8195E4;
    BNE +                                                                ;8195E7;
    LDA.W #$0400                                                         ;8195E9;
    STA.W Enemy.palette                                                  ;8195EC;

+   JSR.W Draw_FileCopyClear_SaveSlotBInfo                               ;8195EF;
    LDA.W #$0002                                                         ;8195F2;
    JSR.W LoadFromSRAM_external                                          ;8195F5;
    STZ.W Enemy.palette                                                  ;8195F8;
    LDA.W NonEmptySaveSlots                                              ;8195FB;
    BIT.W #$0004                                                         ;8195FE;
    BNE +                                                                ;819601;
    LDA.W #$0400                                                         ;819603;
    STA.W Enemy.palette                                                  ;819606;

+   JSR.W Draw_FileCopyClear_SaveSlotCInfo                               ;819609;
    JMP.W QueueTransfer_MenuTilemap_ToVRAMBG1                            ;81960C;


;;; $960F: Draw file copy/clear save slot A info ;;;
Draw_FileCopyClear_SaveSlotAInfo:
    LDX.W #$0218                                                         ;81960F;
    LDA.W NonEmptySaveSlots                                              ;819612;
    EOR.W #$FFFF                                                         ;819615;
    AND.W #$0001                                                         ;819618;
    JSR.W Draw_FileSelection_Health                                      ;81961B;
    LDX.W #$0272                                                         ;81961E;
    LDA.W NonEmptySaveSlots                                              ;819621;
    EOR.W #$FFFF                                                         ;819624;
    AND.W #$0001                                                         ;819627;
    JSR.W Draw_FileSelection_Time                                        ;81962A;
    LDY.W #Tilemap_FileSelect_time                                       ;81962D;
    LDX.W #($1A<<1)|($8<<6)                                              ;819630; $0234
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819633;
    LDY.W #Tilemap_FileSelect_SamusA                                     ;819636;
    LDX.W #($4<<1)|($8<<6)                                               ;819639; $0208
    JMP.W Load_Tilemap_in_Y_to_X_Coordinates                             ;81963C;


;;; $963F: Draw file copy/clear save slot B info ;;;
Draw_FileCopyClear_SaveSlotBInfo:
    LDX.W #$0318                                                         ;81963F;
    LDA.W NonEmptySaveSlots                                              ;819642;
    EOR.W #$FFFF                                                         ;819645;
    AND.W #$0002                                                         ;819648;
    JSR.W Draw_FileSelection_Health                                      ;81964B;
    LDX.W #$0372                                                         ;81964E;
    LDA.W NonEmptySaveSlots                                              ;819651;
    EOR.W #$FFFF                                                         ;819654;
    AND.W #$0002                                                         ;819657;
    JSR.W Draw_FileSelection_Time                                        ;81965A;
    LDY.W #Tilemap_FileSelect_time                                       ;81965D;
    LDX.W #($1A<<1)|($C<<6)                                              ;819660; $0334
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819663;
    LDY.W #Tilemap_FileSelect_SamusB                                     ;819666;
    LDX.W #($4<<1)|($C<<6)                                               ;819669; $0308
    JMP.W Load_Tilemap_in_Y_to_X_Coordinates                             ;81966C;


;;; $966F: Draw file copy/clear save slot C info ;;;
Draw_FileCopyClear_SaveSlotCInfo:
    LDX.W #$0418                                                         ;81966F;
    LDA.W NonEmptySaveSlots                                              ;819672;
    EOR.W #$FFFF                                                         ;819675;
    AND.W #$0004                                                         ;819678;
    JSR.W Draw_FileSelection_Health                                      ;81967B;
    LDX.W #$0472                                                         ;81967E;
    LDA.W NonEmptySaveSlots                                              ;819681;
    EOR.W #$FFFF                                                         ;819684;
    AND.W #$0004                                                         ;819687;
    JSR.W Draw_FileSelection_Time                                        ;81968A;
    LDY.W #Tilemap_FileSelect_time                                       ;81968D;
    LDX.W #($1A<<1)|($10<<6)                                             ;819690; $0434
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819693;
    LDY.W #Tilemap_FileSelect_SamusC                                     ;819696;
    LDX.W #($4<<1)|($10<<6)                                              ;819699; $0408
    JMP.W Load_Tilemap_in_Y_to_X_Coordinates                             ;81969C;


;;; $969F: Queue transfer of menu tilemap to VRAM BG1 ;;;
QueueTransfer_MenuTilemap_ToVRAMBG1:
    LDX.W VRAMWriteStack                                                 ;81969F;
    LDA.W #$0800                                                         ;8196A2;
    STA.B VRAMWrite.size,X                                               ;8196A5;
    LDA.W #$3600                                                         ;8196A7;
    STA.B VRAMWrite.src,X                                                ;8196AA;
    LDA.W #$007E                                                         ;8196AC;
    STA.B VRAMWrite.src+2,X                                              ;8196AF;
    LDA.B DP_BG1TilemapAddrSize                                          ;8196B1;
    AND.W #$00FC                                                         ;8196B3;
    XBA                                                                  ;8196B6;
    STA.B VRAMWrite.dest,X                                               ;8196B7;
    TXA                                                                  ;8196B9;
    CLC                                                                  ;8196BA;
    ADC.W #$0007                                                         ;8196BB;
    STA.W VRAMWriteStack                                                 ;8196BE;
    RTS                                                                  ;8196C1;


;;; $96C2: File select menu - index 8: file copy - select source ;;;
FileSelectMenu_Index8_FileCopy_SelectSource:
    REP #$30                                                             ;8196C2;
    JSL.L Draw_Border_Around_DATA_COPY_MODE                              ;8196C4;
    JSL.L Draw_Menu_Selection_Missile                                    ;8196C8;
    LDA.B DP_Controller1New                                              ;8196CC;
    BIT.W #$1080                                                         ;8196CE;
    BNE .select                                                          ;8196D1;
    BIT.W #$8000                                                         ;8196D3;
    BNE .B                                                               ;8196D6;
    BIT.W #$0800                                                         ;8196D8;
    BNE .up                                                              ;8196DB;
    BIT.W #$0400                                                         ;8196DD;
    BEQ Set_FileCopyMenu_SelectionMissile_Position                       ;8196E0;
    SEP #$30                                                             ;8196E2;
    LDA.W NonEmptySaveSlots                                              ;8196E4;
    LDX.W CinematicBGObject_IndirectInstructionPointers                  ;8196E7;

  .loopDown:
    INX                                                                  ;8196EA;
    CPX.B #$04                                                           ;8196EB;
    BPL Set_FileCopyMenu_SelectionMissile_Position                       ;8196ED;
    CPX.B #$03                                                           ;8196EF;
    BEQ +                                                                ;8196F1;
    BIT.W .bitmasks,X                                                    ;8196F3;
    BEQ .loopDown                                                        ;8196F6;

+   STX.W CinematicBGObject_IndirectInstructionPointers                  ;8196F8;
    REP #$30                                                             ;8196FB;
    LDA.W #$0037                                                         ;8196FD;
    JSL.L QueueSound_Lib1_Max6                                           ;819700;
    BRA Set_FileCopyMenu_SelectionMissile_Position                       ;819704;
    REP #$30                                                             ;819706; >_< dead code

  .B:
    LDA.W PauseMenu_MenuIndex                                            ;819708;
    CLC                                                                  ;81970B;
    ADC.W #$0007                                                         ;81970C;
    STA.W PauseMenu_MenuIndex                                            ;81970F;
    LDA.W #$0037                                                         ;819712;
    JSL.L QueueSound_Lib1_Max6                                           ;819715;
    RTS                                                                  ;819719;

  .up:
    SEP #$30                                                             ;81971A;
    LDA.W NonEmptySaveSlots                                              ;81971C;
    LDX.W CinematicBGObject_IndirectInstructionPointers                  ;81971F;

  .loopUp:
    DEX                                                                  ;819722;
    BMI Set_FileCopyMenu_SelectionMissile_Position                       ;819723;
    BIT.W .bitmasks,X                                                    ;819725;
    BEQ .loopUp                                                          ;819728;
    STX.W CinematicBGObject_IndirectInstructionPointers                  ;81972A;
    REP #$30                                                             ;81972D;
    LDA.W #$0037                                                         ;81972F;
    JSL.L QueueSound_Lib1_Max6                                           ;819732;
    BRA Set_FileCopyMenu_SelectionMissile_Position                       ;819736;

  .select:
    REP #$30                                                             ;819738;
    LDA.W #$0037                                                         ;81973A;
    JSL.L QueueSound_Lib1_Max6                                           ;81973D;
    LDA.W CinematicBGObject_IndirectInstructionPointers                  ;819741;
    CMP.W #$0003                                                         ;819744;
    BEQ +                                                                ;819747;
    STA.W TitleMenu_FileCopySrcFileClearSlot                             ;819749;
    INC.W PauseMenu_MenuIndex                                            ;81974C;
    RTS                                                                  ;81974F;

+   LDA.W PauseMenu_MenuIndex                                            ;819750;
    CLC                                                                  ;819753;
    ADC.W #$0007                                                         ;819754;
    STA.W PauseMenu_MenuIndex                                            ;819757;
    RTS                                                                  ;81975A;

  .bitmasks:
    db $01,$02,$04                                                       ;81975B;


;;; $975E: Set file copy menu selection missile position ;;;
Set_FileCopyMenu_SelectionMissile_Position:
    REP #$30                                                             ;81975E;
    LDA.W CinematicBGObject_IndirectInstructionPointers                  ;819760;
    ASL                                                                  ;819763;
    TAX                                                                  ;819764;
    LDA.W .position,X                                                    ;819765;
    STA.W Mode7Object_InstructionTimers+2                                ;819768;
    LDA.W #$0016                                                         ;81976B;
    STA.W Mode7Object_InstListPointers                                   ;81976E;
    RTS                                                                  ;819771;

  .position:
    dw $0048,$0068,$0088,$00D3                                           ;819772;


;;; $977A: File select menu - index 9: file copy - initialise select destination ;;;
FileSelectMenu_Index9_FileCopy_InitialiseSelectDestination:
    REP #$30                                                             ;81977A;
    JSL.L Draw_Border_Around_DATA_COPY_MODE                              ;81977C;
    JSR.W Draw_FileCopy_SelectDestination_SaveFileInfo                   ;819780;
    INC.W PauseMenu_MenuIndex                                            ;819783;
    LDA.W #$0000                                                         ;819786;

  .loop:
    CMP.W TitleMenu_FileCopySrcFileClearSlot                             ;819789;
    BNE +                                                                ;81978C;
    INC                                                                  ;81978E;
    CMP.W #$0003                                                         ;81978F;
    BMI .loop                                                            ;819792;

+   STA.W CinematicBGObject_IndirectInstructionPointers                  ;819794;
    BRA Set_FileCopyMenu_SelectionMissile_Position                       ;819797;


;;; $9799: Draw file copy select destination save file info ;;;
Draw_FileCopy_SelectDestination_SaveFileInfo:
    JSR.W ClearMenuTilemap                                               ;819799;
    LDY.W #Tilemap_FileSelect_dataCopyMode                               ;81979C;
    LDX.W #($9<<1)|($1<<6)                                               ;81979F; $0052
    STZ.W Enemy.palette                                                  ;8197A2;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;8197A5;
    LDY.W #Tilemap_FileSelect_copySamusToWhere                           ;8197A8;
    LDX.W #($4<<1)|($5<<6)                                               ;8197AB; $0148
    STZ.W Enemy.palette                                                  ;8197AE;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;8197B1;
    LDA.W TitleMenu_FileCopySrcFileClearSlot                             ;8197B4;
    CLC                                                                  ;8197B7;
    ADC.W #$206A                                                         ;8197B8;
    STA.L MenuTilemap+$160                                               ;8197BB;
    JSR.W LoadMenuExitTilemap                                            ;8197BF;
    LDA.W #$0000                                                         ;8197C2;
    JSR.W LoadFromSRAM_external                                          ;8197C5;
    LDX.W #$0400                                                         ;8197C8;
    LDA.W TitleMenu_FileCopySrcFileClearSlot                             ;8197CB;
    BEQ +                                                                ;8197CE;
    LDX.W #$0000                                                         ;8197D0;

+   TXA                                                                  ;8197D3;
    STA.W Enemy.palette                                                  ;8197D4;
    JSR.W Draw_FileCopyClear_SaveSlotAInfo                               ;8197D7;
    LDA.W #$0001                                                         ;8197DA;
    JSR.W LoadFromSRAM_external                                          ;8197DD;
    LDX.W #$0400                                                         ;8197E0;
    LDA.W TitleMenu_FileCopySrcFileClearSlot                             ;8197E3;
    CMP.W #$0001                                                         ;8197E6;
    BEQ +                                                                ;8197E9;
    LDX.W #$0000                                                         ;8197EB;

+   TXA                                                                  ;8197EE;
    STA.W Enemy.palette                                                  ;8197EF;
    JSR.W Draw_FileCopyClear_SaveSlotBInfo                               ;8197F2;
    LDA.W #$0002                                                         ;8197F5;
    JSR.W LoadFromSRAM_external                                          ;8197F8;
    LDX.W #$0400                                                         ;8197FB;
    LDA.W TitleMenu_FileCopySrcFileClearSlot                             ;8197FE;
    CMP.W #$0002                                                         ;819801;
    BEQ +                                                                ;819804;
    LDX.W #$0000                                                         ;819806;

+   TXA                                                                  ;819809;
    STA.W Enemy.palette                                                  ;81980A;
    JSR.W Draw_FileCopyClear_SaveSlotCInfo                               ;81980D;
    JMP.W QueueTransfer_MenuTilemap_ToVRAMBG1                            ;819810;


;;; $9813: File select menu - index Ah: file copy - select destination ;;;
FileSelectMenu_IndexA_FileCopy_SelectDestination:
    REP #$30                                                             ;819813;
    JSL.L Draw_Border_Around_DATA_COPY_MODE                              ;819815;
    JSL.L Draw_Menu_Selection_Missile                                    ;819819;
    LDA.B DP_Controller1New                                              ;81981D;
    BIT.W #$1080                                                         ;81981F;
    BNE .select                                                          ;819822;
    BIT.W #$8000                                                         ;819824;
    BNE .B                                                               ;819827;
    BIT.W #$0800                                                         ;819829;
    BNE .up                                                              ;81982C;
    BIT.W #$0400                                                         ;81982E;
    BEQ .setMissilePosition                                              ;819831;
    LDA.W #$0037                                                         ;819833;
    JSL.L QueueSound_Lib1_Max6                                           ;819836;
    LDX.W CinematicBGObject_IndirectInstructionPointers                  ;81983A;

  .loopDown:
    INX                                                                  ;81983D;
    CPX.W #$0004                                                         ;81983E;
    BEQ .setMissilePosition                                              ;819841;
    CPX.W TitleMenu_FileCopySrcFileClearSlot                             ;819843;
    BNE .setMenuSelection                                                ;819846;
    BRA .loopDown                                                        ;819848;

  .setMenuSelection:
    STX.W CinematicBGObject_IndirectInstructionPointers                  ;81984A;

  .setMissilePosition:
    LDA.W CinematicBGObject_IndirectInstructionPointers                  ;81984D;
    ASL                                                                  ;819850;
    TAX                                                                  ;819851;
    LDA.W .positions,X                                                   ;819852;
    STA.W Mode7Object_InstructionTimers+2                                ;819855;
    LDA.W #$0016                                                         ;819858;
    STA.W Mode7Object_InstListPointers                                   ;81985B;
    RTS                                                                  ;81985E;

  .B:
    LDA.W PauseMenu_MenuIndex                                            ;81985F;
    SEC                                                                  ;819862;
    SBC.W #$0002                                                         ;819863;
    STA.W PauseMenu_MenuIndex                                            ;819866;
    LDA.W TitleMenu_FileCopySrcFileClearSlot                             ;819869;
    STA.W CinematicBGObject_IndirectInstructionPointers                  ;81986C;
    LDA.W #$0037                                                         ;81986F;
    JSL.L QueueSound_Lib1_Max6                                           ;819872;
    JMP.W Initialise_FileSelectMenu_FileCopy                             ;819876;

  .select:
    LDA.W #$0037                                                         ;819879;
    JSL.L QueueSound_Lib1_Max6                                           ;81987C;
    LDA.W CinematicBGObject_IndirectInstructionPointers                  ;819880;
    CMP.W #$0003                                                         ;819883;
    BEQ +                                                                ;819886;
    STA.W TitleMenu_FileCopyDestSlot                                     ;819888;
    INC.W PauseMenu_MenuIndex                                            ;81988B;
    BRA .setMissilePosition                                              ;81988E;

+   LDA.W PauseMenu_MenuIndex                                            ;819890;
    CLC                                                                  ;819893;
    ADC.W #$0005                                                         ;819894;
    STA.W PauseMenu_MenuIndex                                            ;819897;
    RTS                                                                  ;81989A;

  .up:
    LDA.W #$0037                                                         ;81989B;
    JSL.L QueueSound_Lib1_Max6                                           ;81989E;
    LDX.W CinematicBGObject_IndirectInstructionPointers                  ;8198A2;

  .loopUp:
    DEX                                                                  ;8198A5;
    BMI .setMissilePosition                                              ;8198A6;
    CPX.W TitleMenu_FileCopySrcFileClearSlot                             ;8198A8;
    BNE .setMenuSelection                                                ;8198AB;
    BRA .loopUp                                                          ;8198AD;

  .positions:
    dw $0048,$0068,$0088,$00D4                                           ;8198AF;


;;; $98B7: File select menu - index Bh: file copy - initialise confirmation ;;;
FileSelectMenu_IndexB_FileCopy_InitialiseConfirmation:
    JSL.L Draw_Border_Around_DATA_COPY_MODE                              ;8198B7;
    LDY.W #Tilemap_FileSelect_copySamusToSamus                           ;8198BB;
    LDX.W #($2<<1)|($5<<6)                                               ;8198BE; $0144
    STZ.W Enemy.palette                                                  ;8198C1;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;8198C4;
    LDA.W TitleMenu_FileCopySrcFileClearSlot                             ;8198C7;
    CLC                                                                  ;8198CA;
    ADC.W #$206A                                                         ;8198CB;
    STA.L MenuTilemap+$15C                                               ;8198CE;
    LDA.W TitleMenu_FileCopyDestSlot                                     ;8198D2;
    CLC                                                                  ;8198D5;
    ADC.W #$206A                                                         ;8198D6;
    STA.L MenuTilemap+$176                                               ;8198D9;
    JSR.W Draw_FileCopyClear_Confirmation                                ;8198DD;
    INC.W PauseMenu_MenuIndex                                            ;8198E0;
    STZ.W CinematicBGObject_IndirectInstructionPointers                  ;8198E3;
    LDA.W #$0008                                                         ;8198E6;
    STA.W Mode7TransformationZoomLevel                                   ;8198E9;
    RTS                                                                  ;8198EC;


;;; $98ED: Draw file copy/clear confirmation ;;;
Draw_FileCopyClear_Confirmation:
    LDY.W #Tilemap_FileSelect_isThisOK                                   ;8198ED;
    LDX.W #($A<<1)|($14<<6)                                              ;8198F0; $0514
    STZ.W Enemy.palette                                                  ;8198F3;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;8198F6;
    LDY.W #Tilemap_FileSelect_yes                                        ;8198F9;
    LDX.W #($E<<1)|($16<<6)                                              ;8198FC; $059C
    STZ.W Enemy.palette                                                  ;8198FF;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819902;
    LDX.W #$0680                                                         ;819905;
    LDA.W #$000F                                                         ;819908;

  .loop:
    STA.L MenuTilemap,X                                                  ;81990B;
    INX                                                                  ;81990F;
    INX                                                                  ;819910;
    CPX.W #$06C0                                                         ;819911;
    BMI .loop                                                            ;819914;
    LDY.W #Tilemap_FileSelect_no                                         ;819916;
    LDX.W #($E<<1)|($19<<6)                                              ;819919; $065C
    STZ.W Enemy.palette                                                  ;81991C;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;81991F; fallthrough to Draw_FileCopyClear_Confirmation_SaveFileInfo


;;; $9922: Draw file copy/clear confirmation save file info ;;;
Draw_FileCopyClear_Confirmation_SaveFileInfo:
    LDA.W #$0000                                                         ;819922;
    JSR.W LoadFromSRAM_external                                          ;819925;
    LDX.W #$0000                                                         ;819928;
    LDA.W TitleMenu_FileCopySrcFileClearSlot                             ;81992B;
    BEQ +                                                                ;81992E;
    LDA.W TitleMenu_FileCopyDestSlot                                     ;819930;
    BEQ +                                                                ;819933;
    LDX.W #$0400                                                         ;819935;

+   TXA                                                                  ;819938;
    STA.W Enemy.palette                                                  ;819939;
    JSR.W Draw_FileCopyClear_SaveSlotAInfo                               ;81993C;
    LDA.W #$0001                                                         ;81993F;
    JSR.W LoadFromSRAM_external                                          ;819942;
    LDX.W #$0000                                                         ;819945;
    LDA.W TitleMenu_FileCopySrcFileClearSlot                             ;819948;
    DEC                                                                  ;81994B;
    BEQ +                                                                ;81994C;
    LDA.W TitleMenu_FileCopyDestSlot                                     ;81994E;
    DEC                                                                  ;819951;
    BEQ +                                                                ;819952;
    LDX.W #$0400                                                         ;819954;

+   TXA                                                                  ;819957;
    STA.W Enemy.palette                                                  ;819958;
    JSR.W Draw_FileCopyClear_SaveSlotBInfo                               ;81995B;
    LDA.W #$0002                                                         ;81995E;
    JSR.W LoadFromSRAM_external                                          ;819961;
    LDX.W #$0000                                                         ;819964;
    LDA.W TitleMenu_FileCopySrcFileClearSlot                             ;819967;
    CMP.W #$0002                                                         ;81996A;
    BEQ +                                                                ;81996D;
    LDA.W TitleMenu_FileCopyDestSlot                                     ;81996F;
    CMP.W #$0002                                                         ;819972;
    BEQ +                                                                ;819975;
    LDX.W #$0400                                                         ;819977;

+   TXA                                                                  ;81997A;
    STA.W Enemy.palette                                                  ;81997B;
    JSR.W Draw_FileCopyClear_SaveSlotCInfo                               ;81997E;
    JMP.W QueueTransfer_MenuTilemap_ToVRAMBG1                            ;819981;


;;; $9984: File select menu - index Ch: file copy - confirmation ;;;
FileSelectMenu_IndexC_FileCopy_Confirmation:
    JSL.L Draw_Border_Around_DATA_COPY_MODE                              ;819984;
    JSL.L Draw_Menu_Selection_Missile                                    ;819988;
    JSR.W HandleFileCopyArrowPalette                                     ;81998C;
    JSL.L Draw_FileCopy_Arrow                                            ;81998F;
    LDA.B DP_Controller1New                                              ;819993;
    BIT.W #$0C00                                                         ;819995;
    BNE .toggle                                                          ;819998;
    BIT.W #$8000                                                         ;81999A;
    BNE .B                                                               ;81999D;
    BIT.W #$1080                                                         ;81999F;
    BEQ .setMissilePosition                                              ;8199A2;
    LDA.W #$0038                                                         ;8199A4;
    JSL.L QueueSound_Lib1_Max6                                           ;8199A7;
    LDA.W CinematicBGObject_IndirectInstructionPointers                  ;8199AB;
    BEQ .yes                                                             ;8199AE;
    LDA.W PauseMenu_MenuIndex                                            ;8199B0;
    SEC                                                                  ;8199B3;
    SBC.W #$0004                                                         ;8199B4;
    STA.W PauseMenu_MenuIndex                                            ;8199B7;
    JMP.W Initialise_FileSelectMenu_FileCopy                             ;8199BA;

  .B:
    LDA.W PauseMenu_MenuIndex                                            ;8199BD;
    SEC                                                                  ;8199C0;
    SBC.W #$0003                                                         ;8199C1;
    STA.W PauseMenu_MenuIndex                                            ;8199C4;
    LDA.W TitleMenu_FileCopyDestSlot                                     ;8199C7;
    STA.W CinematicBGObject_IndirectInstructionPointers                  ;8199CA;
    LDA.W #$0037                                                         ;8199CD;
    JSL.L QueueSound_Lib1_Max6                                           ;8199D0;
    RTS                                                                  ;8199D4;

  .yes:
    INC.W PauseMenu_MenuIndex                                            ;8199D5;
    RTS                                                                  ;8199D8;

  .toggle:
    LDA.W CinematicBGObject_IndirectInstructionPointers                  ;8199D9;
    EOR.W #$0001                                                         ;8199DC;
    STA.W CinematicBGObject_IndirectInstructionPointers                  ;8199DF;
    LDA.W #$0037                                                         ;8199E2;
    JSL.L QueueSound_Lib1_Max6                                           ;8199E5;

  .setMissilePosition:
    LDY.W #$00B8                                                         ;8199E9;
    LDA.W CinematicBGObject_IndirectInstructionPointers                  ;8199EC;
    BEQ +                                                                ;8199EF;
    LDY.W #$00D0                                                         ;8199F1;

+   STY.W Mode7Object_InstructionTimers+2                                ;8199F4;
    LDA.W #$005E                                                         ;8199F7;
    STA.W Mode7Object_InstListPointers                                   ;8199FA;
    RTS                                                                  ;8199FD;


;;; $99FE: Handle file copy arrow palette ;;;
HandleFileCopyArrowPalette:
    LDA.W Mode7TransformationZoomLevel                                   ;8199FE;
    BEQ .return                                                          ;819A01;
    DEC                                                                  ;819A03;
    STA.W Mode7TransformationZoomLevel                                   ;819A04;
    BNE .return                                                          ;819A07;
    LDA.W #$0004                                                         ;819A09;
    STA.W Mode7TransformationZoomLevel                                   ;819A0C;
    LDA.L Palettes_SpriteP1+2                                            ;819A0F;
    TAY                                                                  ;819A13;
    LDX.W #$0000                                                         ;819A14;

  .loop:
    LDA.L Palettes_SpriteP1+4,X                                          ;819A17;
    STA.L Palettes_SpriteP1+2,X                                          ;819A1B;
    INX                                                                  ;819A1F;
    INX                                                                  ;819A20;
    CPX.W #$000C                                                         ;819A21;
    BMI .loop                                                            ;819A24;
    TYA                                                                  ;819A26;
    STA.L Palettes_SpriteP1+$E                                           ;819A27;

  .return:
    RTS                                                                  ;819A2B;


;;; $9A2C: File select menu - index Dh: file copy - do file copy ;;;
FileSelectMenu_Index0_FileCopy_DoFileCopy:
    JSL.L Draw_Border_Around_DATA_COPY_MODE                              ;819A2C;
    JSL.L Draw_Menu_Selection_Missile                                    ;819A30;
    JSR.W HandleFileCopyArrowPalette                                     ;819A34;
    JSL.L Draw_FileCopy_Arrow                                            ;819A37;
    LDA.W #$0070                                                         ;819A3B;
    STA.B DP_Temp02                                                      ;819A3E;
    STA.B DP_Temp05                                                      ;819A40;
    LDA.W TitleMenu_FileCopySrcFileClearSlot                             ;819A42;
    ASL                                                                  ;819A45;
    TAX                                                                  ;819A46;
    LDA.L SaveSlotOffsets,X                                              ;819A47;
    STA.B DP_Temp00                                                      ;819A4B;
    LDA.W TitleMenu_FileCopyDestSlot                                     ;819A4D;
    ASL                                                                  ;819A50;
    TAX                                                                  ;819A51;
    LDA.L SaveSlotOffsets,X                                              ;819A52;
    STA.B DP_Temp03                                                      ;819A56;
    LDY.W #$0000                                                         ;819A58;

  .loop:
    LDA.B [DP_Temp00],Y                                                  ;819A5B;
    STA.B [DP_Temp03],Y                                                  ;819A5D;
    INY                                                                  ;819A5F;
    INY                                                                  ;819A60;
    CPY.W #$065C                                                         ;819A61;
    BMI .loop                                                            ;819A64;
    LDA.W TitleMenu_FileCopySrcFileClearSlot                             ;819A66;
    ASL                                                                  ;819A69;
    TAX                                                                  ;819A6A;
    LDA.L SRAM_Slot0Checksum1,X                                          ;819A6B;
    PHA                                                                  ;819A6F;
    LDA.L SRAM_Slot0Complement1,X                                        ;819A70;
    PHA                                                                  ;819A74;
    LDA.L SRAM_Slot0Checksum0,X                                          ;819A75;
    PHA                                                                  ;819A79;
    LDA.L SRAM_Slot0Complement0,X                                        ;819A7A;
    PHA                                                                  ;819A7E;
    LDA.W TitleMenu_FileCopyDestSlot                                     ;819A7F;
    ASL                                                                  ;819A82;
    TAX                                                                  ;819A83;
    PLA                                                                  ;819A84;
    STA.L SRAM_Slot0Complement0,X                                        ;819A85;
    PLA                                                                  ;819A89;
    STA.L SRAM_Slot0Checksum0,X                                          ;819A8A;
    PLA                                                                  ;819A8E;
    STA.L SRAM_Slot0Complement1,X                                        ;819A8F;
    PLA                                                                  ;819A93;
    STA.L SRAM_Slot0Checksum1,X                                          ;819A94;
    INC.W PauseMenu_MenuIndex                                            ;819A98;
    LDX.W #$0500                                                         ;819A9B;
    LDA.W #$000F                                                         ;819A9E;

  .loopRows:
    STA.L MenuTilemap,X                                                  ;819AA1;
    INX                                                                  ;819AA5;
    INX                                                                  ;819AA6;
    CPX.W #$0740                                                         ;819AA7;
    BMI .loopRows                                                        ;819AAA;
    LDA.W TitleMenu_FileCopyDestSlot                                     ;819AAC;
    ASL                                                                  ;819AAF;
    TAX                                                                  ;819AB0;
    LDA.W NonEmptySaveSlots                                              ;819AB1;
    ORA.W .list,X                                                        ;819AB4;
    STA.W NonEmptySaveSlots                                              ;819AB7;
    LDA.W TitleMenu_FileCopyDestSlot                                     ;819ABA;
    ASL                                                                  ;819ABD;
    ASL                                                                  ;819ABE;
    CLC                                                                  ;819ABF;
    ADC.W #$0009                                                         ;819AC0;
    ASL                                                                  ;819AC3;
    ASL                                                                  ;819AC4;
    ASL                                                                  ;819AC5;
    ASL                                                                  ;819AC6;
    ASL                                                                  ;819AC7;
    ASL                                                                  ;819AC8;
    CLC                                                                  ;819AC9;
    ADC.W #$0018                                                         ;819ACA;
    TAX                                                                  ;819ACD;
    LDY.W #$0000                                                         ;819ACE;
    LDA.W #$000F                                                         ;819AD1;

  .loopColumns:
    STA.L MenuTilemap,X                                                  ;819AD4;
    STA.L MenuTilemap-$40,X                                              ;819AD8;
    INX                                                                  ;819ADC;
    INX                                                                  ;819ADD;
    INY                                                                  ;819ADE;
    INY                                                                  ;819ADF;
    CPY.W #$0016                                                         ;819AE0;
    BMI .loopColumns                                                     ;819AE3;
    LDY.W #Tilemap_FileSelect_copyCompleted                              ;819AE5;
    LDX.W #($8<<1)|($14<<6)                                              ;819AE8; $0510
    STZ.W Enemy.palette                                                  ;819AEB;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819AEE;
    JMP.W Draw_FileCopyClear_Confirmation_SaveFileInfo                   ;819AF1;

  .list:
    dw $0001,$0002,$0004                                                 ;819AF4;


;;; $9AFA: File select menu - index Eh: file copy - copy completed ;;;
FileSelectMenu_IndexE_FileCopy_CopyCompleted:
    JSL.L Draw_Border_Around_DATA_COPY_MODE                              ;819AFA;
    LDA.B DP_Controller1New                                              ;819AFE;
    BEQ .return                                                          ;819B00;
    LDA.W #$0037                                                         ;819B02;
    JSL.L QueueSound_Lib1_Max6                                           ;819B05;
    INC.W PauseMenu_MenuIndex                                            ;819B09;
    LDA.L SRAM_SaveSlotSelected                                          ;819B0C;
    CMP.W #$0000                                                         ;819B10;
    BMI .zero                                                            ;819B13;
    CMP.W #$0003                                                         ;819B15;
    BPL .zero                                                            ;819B18;
    TAX                                                                  ;819B1A;
    AND.L SRAM_SaveSlotSelectedComplement                                ;819B1B;
    BEQ .validSaveSlot                                                   ;819B1F;

  .zero:
    LDX.W #$0000                                                         ;819B21;

  .validSaveSlot:
    STX.W SaveSlotSelected                                               ;819B24;

  .return:
    RTS                                                                  ;819B27;


;;; $9B28: File select menu - index 12h: file copy to main - menu index = main ;;;
FileSelectMenu_Index12_FileCopyToMain_MenuIndex_Main:
    LDA.W PauseMenu_MenuIndex                                            ;819B28;
    SEC                                                                  ;819B2B;
    SBC.W #$000E                                                         ;819B2C;
    STA.W PauseMenu_MenuIndex                                            ;819B2F;
    RTS                                                                  ;819B32;


;;; $9B33: File select menu - index 14h: main to file clear - initialise ;;;
FileSelectMenu_Index14_MainToFileClear_Initialise:
    REP #$30                                                             ;819B33;
    JSL.L Draw_Border_Around_DATA_CLEAR_MODE                             ;819B35;
    INC.W PauseMenu_MenuIndex                                            ;819B39;


;;; $9B3C: Initialise file select menu file clear ;;;
Initialise_FileSelectMenu_FileClear:
    JSR.W ClearMenuTilemap                                               ;819B3C;
    LDY.W #Tilemap_FileSelect_dataClearMode                              ;819B3F;
    LDX.W #($8<<1)|($1<<6)                                               ;819B42; $0050
    STZ.W Enemy.palette                                                  ;819B45;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819B48;
    LDY.W #Tilemap_FileSelect_clearWhichData                             ;819B4B;
    LDX.W #($0<<1)|($5<<6)                                               ;819B4E; $0140
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819B51;
    JSR.W LoadMenuExitTilemap                                            ;819B54;
    JSR.W Draw_FileCopyClear_SaveFileInfo                                ;819B57;
    STZ.W TitleMenu_FileCopySrcFileClearSlot                             ;819B5A;
    JSR.W SetInitial_FileCopyClear_MenuSelection                         ;819B5D;
    JSR.W Set_FileClearMenuSelection_MissilePosition                     ;819B60;
    RTS                                                                  ;819B63;


;;; $9B64: File select menu - index 16h: file clear - select slot ;;;
FileSelectMenu_Index16_FileClear_SelectSlot:
    REP #$30                                                             ;819B64;
    JSL.L Draw_Border_Around_DATA_CLEAR_MODE                             ;819B66;
    JSL.L Draw_Menu_Selection_Missile                                    ;819B6A;
    LDA.B DP_Controller1New                                              ;819B6E;
    BIT.W #$1080                                                         ;819B70;
    BNE .select                                                          ;819B73;
    BIT.W #$8000                                                         ;819B75;
    BNE .exit                                                            ;819B78;
    BIT.W #$0800                                                         ;819B7A;
    BNE .up                                                              ;819B7D;
    BIT.W #$0400                                                         ;819B7F;
    BEQ Set_FileClearMenuSelection_MissilePosition                       ;819B82;
    SEP #$30                                                             ;819B84;
    LDA.W NonEmptySaveSlots                                              ;819B86;
    LDX.W CinematicBGObject_IndirectInstructionPointers                  ;819B89;

  .loopDown:
    INX                                                                  ;819B8C;
    CPX.B #$04                                                           ;819B8D;
    BPL Set_FileClearMenuSelection_MissilePosition                       ;819B8F;
    CPX.B #$03                                                           ;819B91;
    BEQ +                                                                ;819B93;
    BIT.W .data,X                                                        ;819B95;
    BEQ .loopDown                                                        ;819B98;

+   STX.W CinematicBGObject_IndirectInstructionPointers                  ;819B9A;
    LDA.B #$37                                                           ;819B9D;
    JSL.L QueueSound_Lib1_Max6                                           ;819B9F;
    BRA Set_FileClearMenuSelection_MissilePosition                       ;819BA3;

  .exit:
    REP #$30                                                             ;819BA5;
    LDA.W #$0037                                                         ;819BA7;
    JSL.L QueueSound_Lib1_Max6                                           ;819BAA;
    LDA.W PauseMenu_MenuIndex                                            ;819BAE;
    CLC                                                                  ;819BB1;
    ADC.W #$0005                                                         ;819BB2;
    STA.W PauseMenu_MenuIndex                                            ;819BB5;
    RTS                                                                  ;819BB8;

  .up:
    SEP #$30                                                             ;819BB9;
    LDA.W NonEmptySaveSlots                                              ;819BBB;
    LDX.W CinematicBGObject_IndirectInstructionPointers                  ;819BBE;

  .loopUp:
    DEX                                                                  ;819BC1;
    BMI Set_FileClearMenuSelection_MissilePosition                       ;819BC2;
    BIT.W .data,X                                                        ;819BC4;
    BEQ .loopUp                                                          ;819BC7;
    STX.W CinematicBGObject_IndirectInstructionPointers                  ;819BC9;
    LDA.B #$37                                                           ;819BCC;
    JSL.L QueueSound_Lib1_Max6                                           ;819BCE;
    BRA Set_FileClearMenuSelection_MissilePosition                       ;819BD2;

  .select:
    REP #$30                                                             ;819BD4;
    LDA.W #$0037                                                         ;819BD6;
    JSL.L QueueSound_Lib1_Max6                                           ;819BD9;
    LDA.W CinematicBGObject_IndirectInstructionPointers                  ;819BDD;
    CMP.W #$0003                                                         ;819BE0;
    BEQ .exit                                                            ;819BE3;
    STA.W TitleMenu_FileCopySrcFileClearSlot                             ;819BE5;
    INC.W PauseMenu_MenuIndex                                            ;819BE8;
    RTS                                                                  ;819BEB;

  .data:
    db $01,$02,$04                                                       ;819BEC;


;;; $9BEF: Set file clear menu selection missile position ;;;
Set_FileClearMenuSelection_MissilePosition:
    REP #$30                                                             ;819BEF;
    LDA.W CinematicBGObject_IndirectInstructionPointers                  ;819BF1;
    ASL                                                                  ;819BF4;
    TAX                                                                  ;819BF5;
    LDA.W .positions,X                                                   ;819BF6;
    STA.W Mode7Object_InstructionTimers+2                                ;819BF9;
    LDA.W #$0016                                                         ;819BFC;
    STA.W Mode7Object_InstListPointers                                   ;819BFF;
    RTS                                                                  ;819C02;

  .positions:
    dw $0048,$0068,$0088,$00D3                                           ;819C03;


;;; $9C0B: File select menu - index 17h: file clear - initialise confirmation ;;;
FileSelectMenu_Index17_FileClear_InitialiseConfirmation:
    JSL.L Draw_Border_Around_DATA_CLEAR_MODE                             ;819C0B;
    LDY.W #Tilemap_FileSelect_clearSamusA                                ;819C0F;
    LDX.W #($0<<1)|($5<<6)                                               ;819C12; $0140
    STZ.W Enemy.palette                                                  ;819C15;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819C18;
    LDA.W TitleMenu_FileCopySrcFileClearSlot                             ;819C1B;
    CLC                                                                  ;819C1E;
    ADC.W #$206A                                                         ;819C1F;
    STA.L MenuTilemap+$16A                                               ;819C22;
    LDA.W #$0003                                                         ;819C26;
    STA.W TitleMenu_FileCopyDestSlot                                     ;819C29;
    JSR.W Draw_FileCopyClear_Confirmation                                ;819C2C;
    INC.W PauseMenu_MenuIndex                                            ;819C2F;
    STZ.W CinematicBGObject_IndirectInstructionPointers                  ;819C32;
    RTS                                                                  ;819C35;


;;; $9C36: File select menu - index 18h: file clear - confirmation ;;;
FileSelectMenu_Index18_FileClear_Confirmation:
    JSL.L Draw_Border_Around_DATA_CLEAR_MODE                             ;819C36;
    JSL.L Draw_Menu_Selection_Missile                                    ;819C3A;
    LDA.B DP_Controller1New                                              ;819C3E;
    BIT.W #$0C00                                                         ;819C40;
    BNE .toggle                                                          ;819C43;
    BIT.W #$8000                                                         ;819C45;
    BNE .B                                                               ;819C48;
    BIT.W #$1080                                                         ;819C4A;
    BEQ .setMissilePosition                                              ;819C4D;
    LDA.W #$0038                                                         ;819C4F;
    JSL.L QueueSound_Lib1_Max6                                           ;819C52;
    LDA.W CinematicBGObject_IndirectInstructionPointers                  ;819C56;
    BEQ .yes                                                             ;819C59;

  .B:
    LDA.W PauseMenu_MenuIndex                                            ;819C5B;
    SEC                                                                  ;819C5E;
    SBC.W #$0002                                                         ;819C5F;
    STA.W PauseMenu_MenuIndex                                            ;819C62;
    LDA.W TitleMenu_FileCopySrcFileClearSlot                             ;819C65;
    STA.W CinematicBGObject_IndirectInstructionPointers                  ;819C68;
    LDA.W #$0037                                                         ;819C6B;
    JSL.L QueueSound_Lib1_Max6                                           ;819C6E;
    JMP.W Initialise_FileSelectMenu_FileClear                            ;819C72;

  .yes:
    INC.W PauseMenu_MenuIndex                                            ;819C75;
    RTS                                                                  ;819C78;

  .toggle:
    LDA.W CinematicBGObject_IndirectInstructionPointers                  ;819C79;
    EOR.W #$0001                                                         ;819C7C;
    STA.W CinematicBGObject_IndirectInstructionPointers                  ;819C7F;
    LDA.W #$0037                                                         ;819C82;
    JSL.L QueueSound_Lib1_Max6                                           ;819C85;

  .setMissilePosition:
    LDY.W #$00B8                                                         ;819C89;
    LDA.W CinematicBGObject_IndirectInstructionPointers                  ;819C8C;
    BEQ +                                                                ;819C8F;
    LDY.W #$00D0                                                         ;819C91;

+   STY.W Mode7Object_InstructionTimers+2                                ;819C94;
    LDA.W #$005E                                                         ;819C97;
    STA.W Mode7Object_InstListPointers                                   ;819C9A;
    RTS                                                                  ;819C9D;


;;; $9C9E: File select menu - index 19h: file clear - do file clear ;;;
FileSelectMenu_Index19_FileClear_DoFileClear:
    REP #$30                                                             ;819C9E;
    JSL.L Draw_Border_Around_DATA_CLEAR_MODE                             ;819CA0;
    LDA.W #$0070                                                         ;819CA4;
    STA.B DP_Temp02                                                      ;819CA7;
    LDA.W TitleMenu_FileCopySrcFileClearSlot                             ;819CA9;
    ASL                                                                  ;819CAC;
    TAX                                                                  ;819CAD;
    LDA.L SaveSlotOffsets,X                                              ;819CAE;
    STA.B DP_Temp00                                                      ;819CB2;
    LDY.W #$0000                                                         ;819CB4;
    LDA.W #$0000                                                         ;819CB7;

  .loopClear:
    STA.B [DP_Temp00],Y                                                  ;819CBA;
    INY                                                                  ;819CBC;
    INY                                                                  ;819CBD;
    CPY.W #$065C                                                         ;819CBE;
    BMI .loopClear                                                       ;819CC1;
    LDA.W TitleMenu_FileCopySrcFileClearSlot                             ;819CC3;
    ASL                                                                  ;819CC6;
    TAX                                                                  ;819CC7;
    LDA.W #$0000                                                         ;819CC8;
    STA.L SRAM_Slot0Checksum0,X                                          ;819CCB;
    STA.L SRAM_Slot0Complement0,X                                        ;819CCF;
    STA.L SRAM_Slot0Checksum1,X                                          ;819CD3;
    STA.L SRAM_Slot0Complement1,X                                        ;819CD7;
    INC.W PauseMenu_MenuIndex                                            ;819CDB;
    JSR.W NewSaveFile                                                    ;819CDE;
    LDA.W TitleMenu_FileCopySrcFileClearSlot                             ;819CE1;
    JSL.L LoadFromSRAM                                                   ;819CE4;
    LDA.W TitleMenu_FileCopySrcFileClearSlot                             ;819CE8;
    STA.W AreaIndex                                                      ;819CEB;
    JSL.L LoadMirrorOfCurrentAreasMapExplored                            ;819CEE;
    LDX.W #$0500                                                         ;819CF2;
    LDA.W #$000F                                                         ;819CF5;

  .loopRows:
    STA.L MenuTilemap,X                                                  ;819CF8;
    INX                                                                  ;819CFC;
    INX                                                                  ;819CFD;
    CPX.W #$0740                                                         ;819CFE;
    BMI .loopRows                                                        ;819D01;
    LDA.W TitleMenu_FileCopySrcFileClearSlot                             ;819D03;
    ASL                                                                  ;819D06;
    TAX                                                                  ;819D07;
    LDA.W NonEmptySaveSlots                                              ;819D08;
    AND.W .data,X                                                        ;819D0B;
    STA.W NonEmptySaveSlots                                              ;819D0E;
    LDY.W #Tilemap_FileSelect_dataCleared                                ;819D11;
    LDX.W #($0<<1)|($14<<6)                                              ;819D14; $0500
    STZ.W Enemy.palette                                                  ;819D17;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819D1A;
    JMP.W Draw_FileCopyClear_Confirmation_SaveFileInfo                   ;819D1D;

  .data:
    dw $FFFE,$FFFD,$FFFB                                                 ;819D20;


;;; $9D26: File select menu - index 1Ah: file clear - clear completed ;;;
FileSelectMenu_Index1A_FileClear_ClearCompleted:
    JSL.L Draw_Border_Around_DATA_CLEAR_MODE                             ;819D26;
    LDA.B DP_Controller1New                                              ;819D2A;
    BEQ .return                                                          ;819D2C;
    LDA.W #$0037                                                         ;819D2E;
    JSL.L QueueSound_Lib1_Max6                                           ;819D31;
    INC.W PauseMenu_MenuIndex                                            ;819D35;
    LDA.W #$0000                                                         ;819D38;
    JSL.L LoadFromSRAM                                                   ;819D3B;
    BCS .slotACorrupt                                                    ;819D3F;

  .selectSlotA:
    LDA.W #$0000                                                         ;819D41;
    STA.W SaveSlotSelected                                               ;819D44;
    RTS                                                                  ;819D47;

  .slotACorrupt:
    LDA.W #$0001                                                         ;819D48;
    JSL.L LoadFromSRAM                                                   ;819D4B;
    BCS +                                                                ;819D4F;
    LDA.W #$0001                                                         ;819D51;
    STA.W SaveSlotSelected                                               ;819D54;
    RTS                                                                  ;819D57;

+   LDA.W #$0002                                                         ;819D58;
    JSL.L LoadFromSRAM                                                   ;819D5B;
    BCS .selectSlotA                                                     ;819D5F;
    LDA.W #$0002                                                         ;819D61;
    STA.W SaveSlotSelected                                               ;819D64;

  .return:
    RTS                                                                  ;819D67;


;;; $9D68: File select menu - index 1Eh: file clear to main - menu index = main ;;;
FileSelectMenu_Index1E_FileClearToMain_MenuIndex_Main:
    JSL.L Draw_Border_Around_SAMUS_DATA                                  ;819D68;
    LDA.W PauseMenu_MenuIndex                                            ;819D6C;
    SEC                                                                  ;819D6F;
    SBC.W #$001A                                                         ;819D70;
    STA.W PauseMenu_MenuIndex                                            ;819D73;
    RTS                                                                  ;819D76;


;;; $9D77: File select menu - index 1Fh: main to options menu - turn Samus helmet ;;;
FileSelectMenu_Index1F_MainToOptionsMenu_TurnSamusHelmet:
    JSL.L Draw_Menu_Selection_Missile                                    ;819D77;
    JSL.L Draw_Border_Around_SAMUS_DATA                                  ;819D7B;
    LDX.W #$0004                                                         ;819D7F;
    JSR.W Draw_FileSelect_Slot_SamusHelmet                               ;819D82;
    LDX.W #$0006                                                         ;819D85;
    JSR.W Draw_FileSelect_Slot_SamusHelmet                               ;819D88;
    LDX.W #$0008                                                         ;819D8B;
    JSR.W Draw_FileSelect_Slot_SamusHelmet                               ;819D8E;
    LDA.B DP_Controller1New                                              ;819D91;
    BIT.W #$1080                                                         ;819D93;
    BNE .advance                                                         ;819D96;
    LDA.W TitleMenu_SlotAHelmetAnimationFrame                            ;819D98;
    CMP.W #$0007                                                         ;819D9B;
    BNE +                                                                ;819D9E;
    LDA.W TitleMenu_SlotAHelmetAnimationTimer                            ;819DA0;
    BEQ .advance                                                         ;819DA3;

+   LDA.W TitleMenu_SlotBHelmetAnimationFrame                            ;819DA5;
    CMP.W #$0007                                                         ;819DA8;
    BNE +                                                                ;819DAB;
    LDA.W TitleMenu_SlotBHelmetAnimationTimer                            ;819DAD;
    BEQ .advance                                                         ;819DB0;

+   LDA.W TitleMenu_SlotCHelmetAnimationFrame                            ;819DB2;
    CMP.W #$0007                                                         ;819DB5;
    BNE .return                                                          ;819DB8;
    LDA.W TitleMenu_SlotCHelmetAnimationTimer                            ;819DBA;
    BNE .return                                                          ;819DBD;

  .advance:
    INC.W PauseMenu_MenuIndex                                            ;819DBF;

  .return:
    RTS                                                                  ;819DC2;


;;; $9DC3: Draw file select Samus helmets ;;;
Draw_FileSelect_SamusHelmets:
    LDX.W #$0004                                                         ;819DC3;
    LDA.W #$0000                                                         ;819DC6;
    STA.W EnemyProjectile_Enable,X                                       ;819DC9;
    JSR.W Draw_FileSelect_Slot_SamusHelmet                               ;819DCC;
    LDX.W #$0006                                                         ;819DCF;
    LDA.W #$0000                                                         ;819DD2;
    STA.W EnemyProjectile_Enable,X                                       ;819DD5;
    JSR.W Draw_FileSelect_Slot_SamusHelmet                               ;819DD8;
    LDX.W #$0008                                                         ;819DDB;
    LDA.W #$0000                                                         ;819DDE;
    STA.W EnemyProjectile_Enable,X                                       ;819DE1;


;;; $9DE4: Draw file select slot Samus helmet ;;;
Draw_FileSelect_Slot_SamusHelmet:
;; Parameters:
;;     X: Slot Samus helmet index. 4/6/8 for slot A/B/C
    PHX                                                                  ;819DE4;
    PHB                                                                  ;819DE5;
    PHK                                                                  ;819DE6;
    PLB                                                                  ;819DE7;
    LDA.W EnemyProjectile_Enable,X                                       ;819DE8;
    BEQ .timerHandled                                                    ;819DEB;
    DEC                                                                  ;819DED;
    STA.W EnemyProjectile_Enable,X                                       ;819DEE;
    BNE .timerHandled                                                    ;819DF1;
    LDA.W #$0008                                                         ;819DF3;
    STA.W EnemyProjectile_Enable,X                                       ;819DF6;
    LDA.W EnemyProjectile_ID,X                                           ;819DF9;
    INC                                                                  ;819DFC;
    CMP.W #$0008                                                         ;819DFD;
    BMI +                                                                ;819E00;
    LDA.W #$0000                                                         ;819E02;
    STA.W EnemyProjectile_Enable,X                                       ;819E05;
    LDA.W #$0007                                                         ;819E08;

+   STA.W EnemyProjectile_ID,X                                           ;819E0B;

  .timerHandled:
    LDA.W EnemyProjectile_ID,X                                           ;819E0E;
    ASL                                                                  ;819E11;
    TAY                                                                  ;819E12;
    LDA.W #$0E00                                                         ;819E13;
    STA.B DP_Temp03                                                      ;819E16;
    LDA.W .data,Y                                                        ;819E18;
    PHA                                                                  ;819E1B;
    LDA.W Mode7Object_InstructionTimers+2,X                              ;819E1C;
    TAY                                                                  ;819E1F;
    LDA.W Mode7Object_InstListPointers,X                                 ;819E20;
    TAX                                                                  ;819E23;
    PLA                                                                  ;819E24;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;819E25;
    PLB                                                                  ;819E29;
    PLX                                                                  ;819E2A;
    RTS                                                                  ;819E2B;

  .data:
    dw $002C,$002D,$002E,$002F,$0030,$0031,$0032,$0033,$0033             ;819E2C;


;;; $9E3E: File select map ;;;
FileSelectMap:
    REP #$30                                                             ;819E3E;
    PHB                                                                  ;819E40;
    PHK                                                                  ;819E41;
    PLB                                                                  ;819E42;
    LDA.W PauseMenu_MenuIndex                                            ;819E43;
    ASL                                                                  ;819E46;
    TAX                                                                  ;819E47;
    JSR.W (.pointers,X)                                                  ;819E48;
    PLB                                                                  ;819E4B;
    RTL                                                                  ;819E4C;

  .pointers:
    dw FileSelectMap_Index0_GameOptionsToAreaSelectMap_ClearBG2          ;819E4D;
    dw FileSelectMap_Index1_GameOptionsToAreaSelectMap_FadeOut           ;819E4F;
    dw FileSelectMap_Index2_11_Load_AreaSelect_ForegroundTilemap         ;819E51;
    dw FileSelectMap_Index3_GameOptionsToAreaSelectMap                   ;819E53;
    dw FileSelectMap_Index4_13_PrepareTransitionToAreaSelectMap          ;819E55;
    dw FileSelectMap_Index5_GameOptionsToAreaSelectMap_ExpSqrTrans       ;819E57;
    dw FileSelectMap_Index6_AreaSelectMap                                ;819E59;
    dw FileSelectMap_Index7_AreaSelectMapToRoomSelectMap                 ;819E5B;
    dw FileSelectMap_Index8_AreaSelectMapToRoomSelectMap                 ;819E5D;
    dw FileSelectMap_Index9_AreaSelectMapToRoomSelectMap_Init            ;819E5F;
    dw FileSelectMap_IndexA_RoomSelectMap                                ;819E61;
    dw FileSelectMap_IndexB_C_RoomSelectMapToLoadingGameData             ;819E63;
    dw FileSelectMap_IndexB_C_RoomSelectMapToLoadingGameData             ;819E65;
    dw FileSelectMap_IndexD_RoomSelectMapToAreaSelectMap_FadeOut         ;819E67;
    dw FileSelectMap_IndexE_RoomSelectMapToLoadingGameData_Wait          ;819E69;
    dw FileSelectMap_IndexF_RoomSelectMapToAreaSelectMap_ClearBG1        ;819E6B;
    dw FileSelectMap_Index10_RoomSelectMapToAreaSelectMap_LoadPal        ;819E6D;
    dw FileSelectMap_Index2_11_Load_AreaSelect_ForegroundTilemap         ;819E6F;
    dw FileSelectMap_Index12_RoomSelectMapToAreaSelectMap                ;819E71;
    dw FileSelectMap_Index4_13_PrepareTransitionToAreaSelectMap          ;819E73;
    dw FileSelectMap_Index14_PrepContractSquareTransToAreaSelect         ;819E75;
    dw FileSelectMap_Index15_RoomSelectMapToAreaSelectMap                ;819E77;
    dw FileSelectMap_Index16_FileClear_AreaSelectMapToGameOptions        ;819E79;


;;; $9E7B: File select map - index 16h: file clear - area select map to game options ;;;
FileSelectMap_Index16_FileClear_AreaSelectMapToGameOptions:
    JSR.W DrawAreaSelectMapLabels                                        ;819E7B;
    JSL.L HandleFadingOut                                                ;819E7E;
    LDA.B DP_Brightness                                                  ;819E82;
    AND.W #$000F                                                         ;819E84;
    BNE .return                                                          ;819E87;
    LDA.W #$0002                                                         ;819E89;
    STA.W GameState                                                      ;819E8C;
    STZ.W PauseMenu_MenuIndex                                            ;819E8F;

  .return:
    RTS                                                                  ;819E92;


;;; $9E93: File select menu - index 1: title sequence to main - load BG2 ;;;
FileSelectMenu_Index1_TitleSequenceToMain_LoadBG2:
    REP #$30                                                             ;819E93;
    LDX.W #$07FE                                                         ;819E95;
    LDA.W #$000F                                                         ;819E98;

  .loop:
    LDA.L Zebes_and_Stars_Tilemap,X                                      ;819E9B;
    STA.L MenuTilemap,X                                                  ;819E9F;
    DEX                                                                  ;819EA3;
    DEX                                                                  ;819EA4;
    BPL .loop                                                            ;819EA5;
    LDX.W VRAMWriteStack                                                 ;819EA7;
    LDA.W #$0800                                                         ;819EAA;
    STA.B VRAMWrite.size,X                                               ;819EAD;
    LDA.W #$3600                                                         ;819EAF;
    STA.B VRAMWrite.src,X                                                ;819EB2;
    LDA.W #$007E                                                         ;819EB4;
    STA.B VRAMWrite.src+2,X                                              ;819EB7;
    LDA.B DP_BG2TilemapAddrSize                                          ;819EB9;
    AND.W #$00FC                                                         ;819EBB;
    XBA                                                                  ;819EBE;
    STA.B VRAMWrite.dest,X                                               ;819EBF;
    TXA                                                                  ;819EC1;
    CLC                                                                  ;819EC2;
    ADC.W #$0007                                                         ;819EC3;
    STA.W VRAMWriteStack                                                 ;819EC6;
    INC.W PauseMenu_MenuIndex                                            ;819EC9;
    LDA.W #$0001                                                         ;819ECC;
    STA.W EnemyProjectile_Enable                                         ;819ECF;
    STZ.W EnemyProjectile_ID                                             ;819ED2;
    RTS                                                                  ;819ED5;


;;; $9ED6: File select menu - index 2: title sequence to main - initialise ;;;
FileSelectMenu_Index2_TitleSequenceToMain:
    REP #$30                                                             ;819ED6;
    LDA.L SRAM_SaveSlotSelected                                          ;819ED8;
    CMP.W #$0000                                                         ;819EDC;
    BMI +                                                                ;819EDF;
    CMP.W #$0003                                                         ;819EE1;
    BPL +                                                                ;819EE4;
    TAX                                                                  ;819EE6;
    AND.L SRAM_SaveSlotSelectedComplement                                ;819EE7;
    BEQ .validSaveSlot                                                   ;819EEB;

+   LDX.W #$0000                                                         ;819EED;

  .validSaveSlot:
    STX.W SaveSlotSelected                                               ;819EF0; fallthrough to FileSelectMenu_Index10_1C_ReloadMain


;;; $9EF3: File select menu - index 10h/1Ch: reload main ;;;
FileSelectMenu_Index10_1C_ReloadMain:
    LDX.W #$07FE                                                         ;819EF3;
    LDA.W #$000F                                                         ;819EF6;

  .loopTilemap:
    STA.L MenuTilemap,X                                                  ;819EF9;
    DEX                                                                  ;819EFD;
    DEX                                                                  ;819EFE;
    BPL .loopTilemap                                                     ;819EFF;
    LDA.W #$FFFF                                                         ;819F01;
    STA.W NonEmptySaveSlots                                              ;819F04;
    LDY.W #Tilemap_FileSelect_SamusData                                  ;819F07;
    LDX.W #($B<<1)|($1<<6)                                               ;819F0A; $0056
    STZ.W Enemy.palette                                                  ;819F0D;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819F10;
    LDY.W #Tilemap_FileSelect_SamusA                                     ;819F13;
    LDX.W #($3<<1)|($5<<6)                                               ;819F16; $0146
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819F19;
    LDA.W #$0000                                                         ;819F1C;
    JSR.W LoadFromSRAM_external                                          ;819F1F;
    ROR.W NonEmptySaveSlots                                              ;819F22;
    LDX.W #$015C                                                         ;819F25;
    LDA.W NonEmptySaveSlots                                              ;819F28;
    BIT.W #$8000                                                         ;819F2B;
    JSR.W Draw_FileSelection_Health                                      ;819F2E;
    LDX.W #$01B4                                                         ;819F31;
    LDA.W NonEmptySaveSlots                                              ;819F34;
    BIT.W #$8000                                                         ;819F37;
    JSR.W Draw_FileSelection_Time                                        ;819F3A;
    LDY.W #Tilemap_FileSelect_time                                       ;819F3D;
    LDX.W #($1B<<1)|($5<<6)                                              ;819F40; $0176
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819F43;
    LDY.W #Tilemap_FileSelect_SamusB                                     ;819F46;
    LDX.W #($3<<1)|($A<<6)                                               ;819F49; $0286
    STZ.W Enemy.palette                                                  ;819F4C;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819F4F;
    LDA.W #$0001                                                         ;819F52;
    JSR.W LoadFromSRAM_external                                          ;819F55;
    ROR.W NonEmptySaveSlots                                              ;819F58;
    LDX.W #$029C                                                         ;819F5B;
    LDA.W NonEmptySaveSlots                                              ;819F5E;
    BIT.W #$8000                                                         ;819F61;
    JSR.W Draw_FileSelection_Health                                      ;819F64;
    LDX.W #$02F4                                                         ;819F67;
    LDA.W NonEmptySaveSlots                                              ;819F6A;
    BIT.W #$8000                                                         ;819F6D;
    JSR.W Draw_FileSelection_Time                                        ;819F70;
    LDY.W #Tilemap_FileSelect_time                                       ;819F73;
    LDX.W #($1B<<1)|($A<<6)                                              ;819F76; $02B6
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819F79;
    LDY.W #Tilemap_FileSelect_SamusC                                     ;819F7C;
    LDX.W #($3<<1)|($F<<6)                                               ;819F7F; $03C6
    STZ.W Enemy.palette                                                  ;819F82;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819F85;
    LDA.W #$0002                                                         ;819F88;
    JSR.W LoadFromSRAM_external                                          ;819F8B;
    ROR.W NonEmptySaveSlots                                              ;819F8E;
    LDX.W #$03DC                                                         ;819F91;
    LDA.W NonEmptySaveSlots                                              ;819F94;
    BIT.W #$8000                                                         ;819F97;
    JSR.W Draw_FileSelection_Health                                      ;819F9A;
    LDX.W #$0434                                                         ;819F9D;
    LDA.W NonEmptySaveSlots                                              ;819FA0;
    BIT.W #$8000                                                         ;819FA3;
    JSR.W Draw_FileSelection_Time                                        ;819FA6;
    LDY.W #Tilemap_FileSelect_time                                       ;819FA9;
    LDX.W #($1B<<1)|($F<<6)                                              ;819FAC; $03F6
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819FAF;
    LDA.W NonEmptySaveSlots                                              ;819FB2;
    EOR.W #$FFFF                                                         ;819FB5;
    XBA                                                                  ;819FB8;
    LSR                                                                  ;819FB9;
    LSR                                                                  ;819FBA;
    LSR                                                                  ;819FBB;
    LSR                                                                  ;819FBC;
    LSR                                                                  ;819FBD;
    STA.W NonEmptySaveSlots                                              ;819FBE;
    CMP.W #$0000                                                         ;819FC1;
    BEQ .loadTilemap                                                     ;819FC4;
    LDY.W #Tilemap_FileSelect_dataCopy                                   ;819FC6;
    LDX.W #($4<<1)|($14<<6)                                              ;819FC9; $0508
    STZ.W Enemy.palette                                                  ;819FCC;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819FCF;
    LDY.W #Tilemap_FileSelect_dataClear                                  ;819FD2;
    LDX.W #($4<<1)|($17<<6)                                              ;819FD5; $05C8
    STZ.W Enemy.palette                                                  ;819FD8;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819FDB;

  .loadTilemap:
    LDY.W #Tilemap_FileSelect_exit                                       ;819FDE;
    LDX.W #($4<<1)|($1A<<6)                                              ;819FE1; $0688
    STZ.W Enemy.palette                                                  ;819FE4;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819FE7;
    JSR.W QueueTransfer_MenuTilemap_ToVRAMBG1                            ;819FEA;
    LDA.W #$0001                                                         ;819FED;
    STA.W EnemyProjectile_Enable                                         ;819FF0;
    DEC                                                                  ;819FF3;
    STA.W Mode7TransformationZoomLevel                                   ;819FF4;
    STA.W TitleMenu_SlotAHelmetAnimationTimer                            ;819FF7;
    STA.W TitleMenu_SlotBHelmetAnimationTimer                            ;819FFA;
    STA.W TitleMenu_SlotCHelmetAnimationTimer                            ;819FFD;
    STA.W EnemyProjectile_ID                                             ;81A000;
    STA.W neverRead1999                                                  ;81A003;
    STA.W TitleMenu_SlotAHelmetAnimationFrame                            ;81A006;
    STA.W TitleMenu_SlotBHelmetAnimationFrame                            ;81A009;
    STA.W TitleMenu_SlotCHelmetAnimationFrame                            ;81A00C;
    STA.W Mode7Object_InstListPointers                                   ;81A00F;
    STA.W Mode7Object_InstructionTimers+2                                ;81A012;
    STA.W neverRead19A3                                                  ;81A015;
    STA.W neverRead19AD                                                  ;81A018;
    LDA.W #$0064                                                         ;81A01B;
    STA.W TitleMenu_SlotAHelmetXPosition                                 ;81A01E;
    STA.W TitleMenu_SlotBHelmetXPosition                                 ;81A021;
    STA.W TitleMenu_SlotCHelmetXPosition                                 ;81A024;
    LDA.W #$002F                                                         ;81A027;
    STA.W TitleMenu_SlotAHelmetYPosition                                 ;81A02A;
    LDA.W #$0057                                                         ;81A02D;
    STA.W TitleMenu_SlotBHelmetYPosition                                 ;81A030;
    LDA.W #$007F                                                         ;81A033;
    STA.W TitleMenu_SlotCHelmetYPosition                                 ;81A036;
    LDA.W #$0001                                                         ;81A039;
    STA.W ScreenFadeDelay                                                ;81A03C;
    STA.W ScreenFadeCounter                                              ;81A03F;
    JSL.L ClearForceBlankAndWaitForNMI                                   ;81A042;
    INC.W PauseMenu_MenuIndex                                            ;81A046;
    STZ.W CinematicBGObject_IndirectInstructionPointers                  ;81A049;
    STZ.W TitleMenu_FileCopySrcFileClearSlot                             ;81A04C;
    STZ.W TitleMenu_FileCopyDestSlot                                     ;81A04F;
    RTS                                                                  ;81A052;


;;; $A053: Load from SRAM / clear SRAM ;;;
LoadFromSRAM_external:
;; Parameter:
;;     A: SRAM slot (0, 1 or 2)
;; Returns:
;;     Carry: Set if SRAM was corrupt
    JSL.L LoadFromSRAM                                                   ;81A053;
    RTS                                                                  ;81A057;


;;; $A058: File select menu - index 3: title sequence to main - fade in ;;;
FileSelectMenu_Index3_TitleSequenceToMain_FadeIn:
    JSR.W Draw_FileSelect_SamusHelmets                                   ;81A058;
    LDA.W SaveSlotSelected                                               ;81A05B;
    ASL                                                                  ;81A05E;
    ASL                                                                  ;81A05F;
    TAX                                                                  ;81A060;
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Yposition,X        ;81A061;
    STA.W Mode7Object_InstructionTimers+2                                ;81A064;
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Xposition,X        ;81A067;
    STA.W Mode7Object_InstListPointers                                   ;81A06A;
    JSL.L Draw_Menu_Selection_Missile                                    ;81A06D;
    JSL.L Draw_Border_Around_SAMUS_DATA                                  ;81A071;
    JSL.L HandleFadingIn                                                 ;81A075;
    LDA.B DP_Brightness                                                  ;81A079;
    AND.W #$000F                                                         ;81A07B;
    CMP.W #$000F                                                         ;81A07E;
    BNE .return                                                          ;81A081;
    INC.W PauseMenu_MenuIndex                                            ;81A083;

  .return:
    RTS                                                                  ;81A086;


;;; $A087: Draw file selection health ;;;
Draw_FileSelection_Health:
;; Parameters:
;;     X: Menu tilemap index
;;     Zero: Clear if SRAM is corrupt
    BEQ .zero                                                            ;81A087;
    PHX                                                                  ;81A089;
    JSR.W ClearResetOfMenuTilemapRow                                     ;81A08A;
    PLA                                                                  ;81A08D;
    CLC                                                                  ;81A08E;
    ADC.W #$0040                                                         ;81A08F;
    TAX                                                                  ;81A092;
    LDY.W #Tilemap_FileSelect_noData                                     ;81A093;
    JMP.W Load_Tilemap_in_Y_to_X_Coordinates                             ;81A096;

  .zero:
    STX.B DP_Temp1A                                                      ;81A099;
    LDY.W #Tilemap_FileSelect_energy                                     ;81A09B;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;81A09E;
    LDA.B DP_Temp1A                                                      ;81A0A1;
    CLC                                                                  ;81A0A3;
    ADC.W #$0008                                                         ;81A0A4;
    TAX                                                                  ;81A0A7;
    LDA.W Energy                                                         ;81A0A8;
    STA.W $4204                                                          ;81A0AB;
    SEP #$20                                                             ;81A0AE;
    LDA.B #$64                                                           ;81A0B0;
    STA.W $4206                                                          ;81A0B2;
    PHA                                                                  ;81A0B5;
    PLA                                                                  ;81A0B6;
    PHA                                                                  ;81A0B7;
    PLA                                                                  ;81A0B8;
    REP #$20                                                             ;81A0B9;
    LDA.W $4214                                                          ;81A0BB;
    STA.B DP_Temp14                                                      ;81A0BE;
    LDA.W $4216                                                          ;81A0C0;
    STA.B DP_Temp12                                                      ;81A0C3;
    LDA.W MaxEnergy                                                      ;81A0C5;
    STA.W $4204                                                          ;81A0C8;
    SEP #$20                                                             ;81A0CB;
    LDA.B #$64                                                           ;81A0CD;
    STA.W $4206                                                          ;81A0CF;
    PHA                                                                  ;81A0D2;
    PLA                                                                  ;81A0D3;
    PHA                                                                  ;81A0D4;
    PLA                                                                  ;81A0D5;
    REP #$20                                                             ;81A0D6;
    LDA.W $4214                                                          ;81A0D8;
    STA.B DP_Temp16                                                      ;81A0DB;
    LDA.W #$0007                                                         ;81A0DD;
    STA.B DP_Temp18                                                      ;81A0E0;
    TXA                                                                  ;81A0E2;
    CLC                                                                  ;81A0E3;
    ADC.W #$0040                                                         ;81A0E4;
    TAX                                                                  ;81A0E7;

  .loop:
    DEC.B DP_Temp16                                                      ;81A0E8;
    BMI .etanksDrawn                                                     ;81A0EA;
    LDY.W #$0099                                                         ;81A0EC;
    LDA.B DP_Temp14                                                      ;81A0EF;
    BEQ +                                                                ;81A0F1;
    DEC.B DP_Temp14                                                      ;81A0F3;
    LDY.W #$0098                                                         ;81A0F5;

+   TYA                                                                  ;81A0F8;
    ORA.W Enemy.palette                                                  ;81A0F9;
    STA.L MenuTilemap,X                                                  ;81A0FC;
    INX                                                                  ;81A100;
    INX                                                                  ;81A101;
    DEC.B DP_Temp18                                                      ;81A102;
    BNE .loop                                                            ;81A104;
    TXA                                                                  ;81A106;
    SEC                                                                  ;81A107;
    SBC.W #$004E                                                         ;81A108;
    TAX                                                                  ;81A10B;
    LDA.W #$0008                                                         ;81A10C;
    STA.B DP_Temp18                                                      ;81A10F;
    BRA .loop                                                            ;81A111;

  .etanksDrawn:
    LDX.B DP_Temp1A                                                      ;81A113;
    LDA.B DP_Temp12                                                      ;81A115;
    STA.W $4204                                                          ;81A117;
    SEP #$20                                                             ;81A11A;
    LDA.B #$0A                                                           ;81A11C;
    STA.W $4206                                                          ;81A11E;
    PHA                                                                  ;81A121;
    PLA                                                                  ;81A122;
    PHA                                                                  ;81A123;
    PLA                                                                  ;81A124;
    REP #$20                                                             ;81A125;
    LDA.W $4214                                                          ;81A127;
    STA.B DP_Temp14                                                      ;81A12A;
    LDA.W $4216                                                          ;81A12C;
    STA.B DP_Temp12                                                      ;81A12F;
    LDX.B DP_Temp1A                                                      ;81A131;
    LDA.B DP_Temp12                                                      ;81A133;
    CLC                                                                  ;81A135;
    ADC.W #$2060                                                         ;81A136;
    ORA.W Enemy.palette                                                  ;81A139;
    STA.L MenuTilemap+$44,X                                              ;81A13C;
    LDA.B DP_Temp14                                                      ;81A140;
    CLC                                                                  ;81A142;
    ADC.W #$2060                                                         ;81A143;
    ORA.W Enemy.palette                                                  ;81A146;
    STA.L MenuTilemap+$42,X                                              ;81A149;
    RTS                                                                  ;81A14D;


;;; $A14E: Draw file selection time ;;;
Draw_FileSelection_Time:
;; Parameters:
;;     X: Menu tilemap index
;;     Zero: Clear if SRAM is corrupt
    BNE .return                                                          ;81A14E;
    STX.B DP_Temp1A                                                      ;81A150;
    LDA.W IGTHours                                                       ;81A152;
    STA.W $4204                                                          ;81A155;
    SEP #$20                                                             ;81A158;
    LDA.B #$0A                                                           ;81A15A;
    STA.W $4206                                                          ;81A15C;
    PHA                                                                  ;81A15F;
    PLA                                                                  ;81A160;
    PHA                                                                  ;81A161;
    PLA                                                                  ;81A162;
    REP #$20                                                             ;81A163;
    LDX.B DP_Temp1A                                                      ;81A165;
    LDA.W $4216                                                          ;81A167;
    CLC                                                                  ;81A16A;
    ADC.W #$2060                                                         ;81A16B;
    ORA.W Enemy.palette                                                  ;81A16E;
    STA.L MenuTilemap+2,X                                                ;81A171;
    LDA.W $4214                                                          ;81A175;
    CLC                                                                  ;81A178;
    ADC.W #$2060                                                         ;81A179;
    ORA.W Enemy.palette                                                  ;81A17C;
    STA.L MenuTilemap,X                                                  ;81A17F;
    LDA.B DP_Temp1A                                                      ;81A183;
    CLC                                                                  ;81A185;
    ADC.W #$0004                                                         ;81A186;
    TAX                                                                  ;81A189;
    LDY.W #Tilemap_FileSelect_colon                                      ;81A18A;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;81A18D;
    LDA.W IGTMinutes                                                     ;81A190;
    STA.W $4204                                                          ;81A193;
    SEP #$20                                                             ;81A196;
    LDA.B #$0A                                                           ;81A198;
    STA.W $4206                                                          ;81A19A;
    PHA                                                                  ;81A19D;
    PLA                                                                  ;81A19E;
    PHA                                                                  ;81A19F;
    PLA                                                                  ;81A1A0;
    REP #$20                                                             ;81A1A1;
    LDX.B DP_Temp1A                                                      ;81A1A3;
    LDA.W $4216                                                          ;81A1A5;
    CLC                                                                  ;81A1A8;
    ADC.W #$2060                                                         ;81A1A9;
    ORA.W Enemy.palette                                                  ;81A1AC;
    STA.L MenuTilemap+8,X                                                ;81A1AF;
    LDA.W $4214                                                          ;81A1B3;
    CLC                                                                  ;81A1B6;
    ADC.W #$2060                                                         ;81A1B7;
    ORA.W Enemy.palette                                                  ;81A1BA;
    STA.L MenuTilemap+6,X                                                ;81A1BD;

  .return:
    RTS                                                                  ;81A1C1;


;;; $A1C2: File select menu - index 4: main ;;;
FileSelectMenu_Index4_Main:
    REP #$30                                                             ;81A1C2;
    JSL.L Draw_Border_Around_SAMUS_DATA                                  ;81A1C4;
    JSL.L Draw_Menu_Selection_Missile                                    ;81A1C8;
    LDX.W #$0004                                                         ;81A1CC;
    JSR.W Draw_FileSelect_Slot_SamusHelmet                               ;81A1CF;
    LDX.W #$0006                                                         ;81A1D2;
    JSR.W Draw_FileSelect_Slot_SamusHelmet                               ;81A1D5;
    LDX.W #$0008                                                         ;81A1D8;
    JSR.W Draw_FileSelect_Slot_SamusHelmet                               ;81A1DB;
    LDA.B DP_Controller1New                                              ;81A1DE;
    BIT.W #$1080                                                         ;81A1E0;
    BNE .select                                                          ;81A1E3;
    BIT.W #$0800                                                         ;81A1E5;
    BNE .up                                                              ;81A1E8;
    BIT.W #$0400                                                         ;81A1EA;
    BEQ +                                                                ;81A1ED;
    JMP.W .down                                                          ;81A1EF;

+   BIT.W #$8000                                                         ;81A1F2;
    BEQ .goto_done                                                       ;81A1F5;
    LDA.W #$0037                                                         ;81A1F7;
    JSL.L QueueSound_Lib1_Max6                                           ;81A1FA;
    LDA.W #$0021                                                         ;81A1FE;
    STA.W PauseMenu_MenuIndex                                            ;81A201;
    LDA.W #$0037                                                         ;81A204;
    JSL.L QueueSound_Lib1_Max6                                           ;81A207;

  .goto_done:
    JMP.W .done                                                          ;81A20B;

  .select:
    LDA.W SaveSlotSelected                                               ;81A20E;
    CMP.W #$0003                                                         ;81A211;
    BMI +                                                                ;81A214;
    JMP.W .fileOperation                                                 ;81A216;

+   LDA.W #$002A                                                         ;81A219;
    JSL.L QueueSound_Lib1_Max6                                           ;81A21C;
    LDA.W PauseMenu_MenuIndex                                            ;81A220;
    CLC                                                                  ;81A223;
    ADC.W #$001B                                                         ;81A224;
    STA.W PauseMenu_MenuIndex                                            ;81A227;
    LDA.W SaveSlotSelected                                               ;81A22A;
    CLC                                                                  ;81A22D;
    ADC.W #$0002                                                         ;81A22E;
    ASL                                                                  ;81A231;
    TAX                                                                  ;81A232;
    LDA.W #$0001                                                         ;81A233;
    STA.W EnemyProjectile_Enable,X                                       ;81A236;
    LDA.W SaveSlotSelected                                               ;81A239;
    STA.L SRAM_SaveSlotSelected                                          ;81A23C;
    EOR.W #$FFFF                                                         ;81A240;
    STA.L SRAM_SaveSlotSelectedComplement                                ;81A243;
    LDA.W SaveSlotSelected                                               ;81A247;
    JSL.L LoadFromSRAM                                                   ;81A24A;
    BCS +                                                                ;81A24E;
    JSL.L LoadMirrorOfCurrentAreasMapExplored                            ;81A250;
    BRA .done                                                            ;81A254;

+   JSR.W NewSaveFile                                                    ;81A256;
    STZ.W CurrentAreaMapCollectedFlag                                    ;81A259;
    BRA .done                                                            ;81A25C;

  .up:
    LDA.W NonEmptySaveSlots                                              ;81A25E;
    BEQ +                                                                ;81A261;
    LDA.W SaveSlotSelected                                               ;81A263;
    DEC                                                                  ;81A266;
    BPL .storeSelection                                                  ;81A267;
    LDA.W #$0005                                                         ;81A269;
    BRA .storeSelection                                                  ;81A26C;

+   LDA.W SaveSlotSelected                                               ;81A26E;
    DEC                                                                  ;81A271;
    BPL +                                                                ;81A272;
    LDA.W #$0005                                                         ;81A274;
    BRA .storeSelection                                                  ;81A277;

+   CMP.W #$0004                                                         ;81A279;
    BMI .storeSelection                                                  ;81A27C;
    LDA.W #$0002                                                         ;81A27E;

  .storeSelection:
    STA.W SaveSlotSelected                                               ;81A281;
    BRA .cursorSound                                                     ;81A284;

  .down:
    LDA.W NonEmptySaveSlots                                              ;81A286;
    BEQ +                                                                ;81A289;
    LDA.W SaveSlotSelected                                               ;81A28B;
    INC                                                                  ;81A28E;
    CMP.W #$0006                                                         ;81A28F;
    BMI .storeSelection2                                                 ;81A292;
    LDA.W #$0000                                                         ;81A294;
    BRA .storeSelection2                                                 ;81A297;

+   LDA.W SaveSlotSelected                                               ;81A299;
    INC                                                                  ;81A29C;
    CMP.W #$0003                                                         ;81A29D;
    BMI .storeSelection2                                                 ;81A2A0;
    CMP.W #$0006                                                         ;81A2A2;
    BPL .zero                                                            ;81A2A5;
    LDA.W #$0005                                                         ;81A2A7;
    BRA .storeSelection2                                                 ;81A2AA;

  .zero:
    LDA.W #$0000                                                         ;81A2AC;

  .storeSelection2:
    STA.W SaveSlotSelected                                               ;81A2AF;

  .cursorSound:
    LDA.W #$0037                                                         ;81A2B2;
    JSL.L QueueSound_Lib1_Max6                                           ;81A2B5;

  .done:
    LDA.W SaveSlotSelected                                               ;81A2B9;
    ASL                                                                  ;81A2BC;
    ASL                                                                  ;81A2BD;
    TAX                                                                  ;81A2BE;
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Yposition,X        ;81A2BF;
    STA.W Mode7Object_InstructionTimers+2                                ;81A2C2;
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Xposition,X        ;81A2C5;
    STA.W Mode7Object_InstListPointers                                   ;81A2C8;
    RTS                                                                  ;81A2CB;

  .fileOperation:
    CMP.W #$0003                                                         ;81A2CC;
    BNE +                                                                ;81A2CF;
    LDA.W #$0037                                                         ;81A2D1;
    JSL.L QueueSound_Lib1_Max6                                           ;81A2D4;
    INC.W PauseMenu_MenuIndex                                            ;81A2D8;
    LDA.B DP_Mosaic                                                      ;81A2DB;
    AND.W #$FF0F                                                         ;81A2DD;
    ORA.W #$0003                                                         ;81A2E0;
    STA.B DP_Mosaic                                                      ;81A2E3;
    RTS                                                                  ;81A2E5;

+   CMP.W #$0004                                                         ;81A2E6;
    BNE .checkFive                                                       ;81A2E9;
    LDA.W #$0037                                                         ;81A2EB;
    JSL.L QueueSound_Lib1_Max6                                           ;81A2EE;
    LDA.W PauseMenu_MenuIndex                                            ;81A2F2;
    CLC                                                                  ;81A2F5;
    ADC.W #$000F                                                         ;81A2F6;
    STA.W PauseMenu_MenuIndex                                            ;81A2F9;
    LDA.B DP_Mosaic                                                      ;81A2FC;
    AND.W #$FF0F                                                         ;81A2FE;
    ORA.W #$0003                                                         ;81A301;
    STA.B DP_Mosaic                                                      ;81A304;

  .checkFive:
    CMP.W #$0005                                                         ;81A306;
    BNE .return                                                          ;81A309;
    LDA.W #$0021                                                         ;81A30B;
    STA.W PauseMenu_MenuIndex                                            ;81A30E;

  .return:
    RTS                                                                  ;81A311;


;;; $A312: File select menu selection missile co-ordinates ;;;
FileSelectMenu_SelectionMissile_Coordinates:
  .Yposition:
    dw $0030                                                             ;81A312;
  .Xposition:
    dw       $000E ; Slot A
    dw $0058,$000E ; Slot B
    dw $0080,$000E ; Slot C
    dw $00A3,$000E ; File copy
    dw $00BB,$000E ; File clear
    dw $00D3,$000E ; Exit


;;; $A32A: File select map - index 0: game options to area select map - clear BG2 and set up fade out ;;;
FileSelectMap_Index0_GameOptionsToAreaSelectMap_ClearBG2:
    REP #$30                                                             ;81A32A;
    JSR.W ClearMenuTilemap                                               ;81A32C;
    LDX.W VRAMWriteStack                                                 ;81A32F;
    LDA.W #$0800                                                         ;81A332;
    STA.B VRAMWrite.size,X                                               ;81A335;
    LDA.W #MenuTilemap                                                   ;81A337;
    STA.B VRAMWrite.src,X                                                ;81A33A;
    LDA.W #MenuTilemap>>16                                               ;81A33C;
    STA.B VRAMWrite.src+2,X                                              ;81A33F;
    LDA.B DP_BG2TilemapAddrSize                                          ;81A341;
    AND.W #$00FC                                                         ;81A343;
    XBA                                                                  ;81A346;
    STA.B VRAMWrite.dest,X                                               ;81A347;
    TXA                                                                  ;81A349;
    CLC                                                                  ;81A34A;
    ADC.W #$0007                                                         ;81A34B;
    STA.W VRAMWriteStack                                                 ;81A34E;
    LDA.W #$0000                                                         ;81A351;
    STA.L PaletteChangeNumerator                                         ;81A354;
    JSR.W LoadFileSelectPalettes                                         ;81A358;
    LDX.W #$0000                                                         ;81A35B;

  .loop:
    LDA.L Palettes,X                                                     ;81A35E;
    STA.L TargetPalettes_BGP0,X                                          ;81A362;
    INX                                                                  ;81A366;
    INX                                                                  ;81A367;
    CPX.W #$0040                                                         ;81A368;
    BMI .loop                                                            ;81A36B;
    LDA.W #$0000                                                         ;81A36D;
    STA.L TargetPalettes_BGP0+$1C                                        ;81A370;
    STA.L TargetPalettes_BGP1+$1C                                        ;81A374;
    INC.W PauseMenu_MenuIndex                                            ;81A378;
    RTS                                                                  ;81A37B;


;;; $A37C: File select map - index 1: game options to area select map - fade out and load area palettes ;;;
FileSelectMap_Index1_GameOptionsToAreaSelectMap_FadeOut:
    REP #$30                                                             ;81A37C;
    LDX.W #$0000                                                         ;81A37E;
    LDY.W #$0040                                                         ;81A381;
    JSL.L Advance_GradualColorChange_ofPaletteRAM                        ;81A384;
    BCC .return                                                          ;81A388;
    STZ.B DP_BG1YScroll                                                  ;81A38A;
    STZ.B DP_BG1XScroll                                                  ;81A38C;
    STZ.B DP_BG2YScroll                                                  ;81A38E;
    STZ.B DP_BG2XScroll                                                  ;81A390;
    LDX.W #$0000                                                         ;81A392;
    LDA.W AreaIndex                                                      ;81A395;

  .loopMapAreaIndex:
    CMP.W FileSelectMapArea_IndexTable,X                                 ;81A398;
    BEQ +                                                                ;81A39B;
    INX                                                                  ;81A39D;
    INX                                                                  ;81A39E;
    CPX.W #$000C                                                         ;81A39F;
    BMI .loopMapAreaIndex                                                ;81A3A2;
    LDX.W #$0000                                                         ;81A3A4;

+   TXA                                                                  ;81A3A7;
    LSR                                                                  ;81A3A8;
    STA.W FileSelectMapAreaIndex                                         ;81A3A9;
    LDX.W #$0000                                                         ;81A3AC;

  .loopAreaColors:
    PHX                                                                  ;81A3AF;
    CPX.W AreaIndex                                                      ;81A3B0;
    BEQ .loadForegroundColors                                            ;81A3B3;
    JSR.W LoadInactiveAreaMapForegroundColors                            ;81A3B5;
    BRA +                                                                ;81A3B8;

  .loadForegroundColors:
    JSR.W LoadActiveAreaMapForegroundColors                              ;81A3BA;

+   PLX                                                                  ;81A3BD;
    INX                                                                  ;81A3BE;
    CPX.W #$0006                                                         ;81A3BF;
    BMI .loopAreaColors                                                  ;81A3C2;
    INC.W PauseMenu_MenuIndex                                            ;81A3C4;
    STZ.W neverRead0787                                                  ;81A3C7;
    SEP #$20                                                             ;81A3CA;
    LDA.B #$02                                                           ;81A3CC;
    STA.B DP_MainScreenLayers                                            ;81A3CE;

  .return:
    RTS                                                                  ;81A3D0;


if !FEATURE_KEEP_UNREFERENCED
;;; $A3D1: Unused. REP #$30 ;;;
UNUSED_REP30_81A3D1:
    REP #$30                                                             ;81A3D1;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A3D3: Load active area map foreground colours ;;;
LoadActiveAreaMapForegroundColors:
;; Parameters:
;;     X: Area index
    TXA                                                                  ;81A3D3;
    ASL                                                                  ;81A3D4;
    TAX                                                                  ;81A3D5;
    LDA.W AreaSelectMap_ForegroundPaletteTable_indices_active,X          ;81A3D6;
    TAY                                                                  ;81A3D9;
    BRA LoadAreaMapForegroundColors                                      ;81A3DA;


;;; $A3DC: Load inactive area map foreground colours ;;;
LoadInactiveAreaMapForegroundColors:
;; Parameters:
;;     X: Area index
    TXA                                                                  ;81A3DC;
    ASL                                                                  ;81A3DD;
    TAX                                                                  ;81A3DE;
    LDA.W AreaSelectMap_ForegroundPaletteTable_indices_inactive,X        ;81A3DF;
    TAY                                                                  ;81A3E2; fallthrough to LoadAreaMapForegroundColors


;;; $A3E3: Load area map foreground colours ;;;
LoadAreaMapForegroundColors:
;; Parameters:
;;     Y: Area select map foreground palette table index (relative to $A4E6)

; Colour set table format:
;     ssss,dddd ; Entry 0
;     [...]     ; Entry 1...
;     FFFF      ; Terminator
; Where:
;     s: Palette data index (relative to $A40E) to load 5 colours from
;     d: Palette RAM index (relative to $7E:C000) to store colours to
    LDA.W AreaSelectMap_ForegroundPaletteTable_data,Y                    ;81A3E3;
    CMP.W #$FFFF                                                         ;81A3E6;
    BEQ .return                                                          ;81A3E9;
    PHY                                                                  ;81A3EB;
    PHA                                                                  ;81A3EC;
    LDA.W AreaSelectMap_ForegroundPaletteTable_RAM,Y                     ;81A3ED;
    TAX                                                                  ;81A3F0;
    PLY                                                                  ;81A3F1;
    LDA.W #$0005                                                         ;81A3F2;
    STA.B DP_Temp12                                                      ;81A3F5;

  .loopColors:
    LDA.W AreaSelectMap_ForgegroundPaletteTable,Y                        ;81A3F7;
    STA.L Palettes,X                                                     ;81A3FA;
    INX                                                                  ;81A3FE;
    INX                                                                  ;81A3FF;
    INY                                                                  ;81A400;
    INY                                                                  ;81A401;
    DEC.B DP_Temp12                                                      ;81A402;
    BNE .loopColors                                                      ;81A404;
    PLY                                                                  ;81A406;
    INY                                                                  ;81A407;
    INY                                                                  ;81A408;
    INY                                                                  ;81A409;
    INY                                                                  ;81A40A;
    BRA LoadAreaMapForegroundColors                                      ;81A40B;

  .return:
    RTS                                                                  ;81A40D;


;;; $A40E: Area select map foreground palette data ;;;
AreaSelectMap_ForgegroundPaletteTable:
;              2                              Ch                             16h
    dw $0000, $7FE0,$7EA0,$7D40,$7C00,$4000, $01DB,$0196,$0150,$00EB,$00A5, $033B,$0296,$01F0,$014B,$00A5 ; 0.   Active.   WS-Crateria,  Crateria, Crateria
    dw $0400, $6400,$4C00,$3400,$1C00,$0400, $0013,$000F,$000A,$0006,$0001, $0BB1,$0B0D,$0669,$05A4,$0100 ; 20h. Active.   Maridia,      Norfair,  Brinstar
    dw $0000, $7FE0,$7EA0,$7D40,$7C00,$4000, $6417,$4C12,$380D,$2007,$0802, $5280,$4620,$39C0,$2940,$14A5 ; 40h. Active.   Wrecked Ship, Tourian,  Wrecked Ship
    dw $0000, $35AD,$2D6B,$2529,$18C6,$1084, $4A52,$3DEF,$318C,$2108,$14A5, $56B5,$4A52,$39CE,$2D6B,$1CE7 ; 60h. Inactive. WS-Crateria,  Crateria, Crateria
    dw $0000, $18C6,$14A5,$1084,$0842,$0421, $1084,$0C63,$0842,$0421,$0000, $2108,$1CE7,$14A5,$1084,$0842 ; 80h. Inactive. Maridia,      Norfair,  Brinstar
    dw $0000, $35AD,$2D6B,$2529,$18C6,$1084, $294A,$2108,$1CE7,$14A5,$0C63, $4A52,$3DEF,$318C,$2108,$14A5 ; A0h. Inactive. Wrecked Ship, Tourian,  Wrecked Ship


;;; $A4CE: Area select map foreground palette table ;;;
AreaSelectMap_ForegroundPaletteTable:
; Area select map foreground palette table indices (relative to $A4E6)
  .indices:
  ..active:
    dw $0000,$000A,$0010,$0016,$0024,$002A                               ;81A4CE;

  ..inactive:
    dw $0030,$003A,$0040,$0046,$0054,$005A                               ;81A4DA;

;        _________ Palette data index (relative to $A40E)
;       |      ___ Palette RAM index (relative to $7E:C000)
;       |     |
  .data:
    dw $000C                                                             ;81A4E6;
  .RAM:
    dw       $00AC ; Active - Crateria - orange
    dw $0016,$00B6 ; Active - Crateria - yellow
    dw $FFFF

    dw $0036,$00D6 ; Active - Brinstar
    dw $FFFF

    dw $002C,$00CC ; Active - Norfair
    dw $FFFF

    dw $0002,$00A2 ; Active - Wrecked Ship - part that overlaps with Crateria
    dw $0042,$00E2 ; Active - Wrecked Ship - dark blue
    dw $0056,$00F6 ; Active - Wrecked Ship - light blue
    dw $FFFF

    dw $0022,$00C2 ; Active - Maridia
    dw $FFFF

    dw $004C,$00EC ; Active - Tourian
    dw $FFFF

    dw $006C,$00AC ; Inactive - Crateria - dark greys
    dw $0076,$00B6 ; Inactive - Crateria - light greys
    dw $FFFF

    dw $0096,$00D6 ; Inactive - Brinstar
    dw $FFFF

    dw $008C,$00CC ; Inactive - Norfair
    dw $FFFF

    dw $0062,$00A2 ; Inactive - Wrecked Ship - part that overlaps with Crateria
    dw $00A2,$00E2 ; Inactive - Wrecked Ship - dark greys
    dw $00B6,$00F6 ; Inactive - Wrecked Ship - light greys
    dw $FFFF

    dw $0082,$00C2 ; Inactive - Maridia
    dw $FFFF

    dw $00AC,$00EC ; Inactive - Tourian
    dw $FFFF


;;; $A546: File select map - index 2/11h: load area select foreground tilemap ;;;
FileSelectMap_Index2_11_Load_AreaSelect_ForegroundTilemap:
    REP #$30                                                             ;81A546;
    LDX.W VRAMWriteStack                                                 ;81A548;
    LDA.W #$0800                                                         ;81A54B;
    STA.B VRAMWrite.size,X                                               ;81A54E;
    LDA.W #Tilemap_AreaSelect_Foreground                                 ;81A550;
    STA.B VRAMWrite.src,X                                                ;81A553;
    LDA.W #Tilemap_AreaSelect_Foreground>>16                             ;81A555;
    STA.B VRAMWrite.src+2,X                                              ;81A558;
    LDA.B DP_BG1TilemapAddrSize                                          ;81A55A;
    AND.W #$00FC                                                         ;81A55C;
    XBA                                                                  ;81A55F;
    STA.B VRAMWrite.dest,X                                               ;81A560;
    TXA                                                                  ;81A562;
    CLC                                                                  ;81A563;
    ADC.W #$0007                                                         ;81A564;
    STA.W VRAMWriteStack                                                 ;81A567;
    LDA.B DP_Brightness                                                  ;81A56A;
    AND.W #$FF00                                                         ;81A56C;
    ORA.W #$000F                                                         ;81A56F;
    STA.B DP_Brightness                                                  ;81A572;
    INC.W PauseMenu_MenuIndex                                            ;81A574;
    RTS                                                                  ;81A577;


;;; $A578: File select map - index 12h: room select map to area select map - load background tilemap ;;;
FileSelectMap_Index12_RoomSelectMapToAreaSelectMap:
    REP #$30                                                             ;81A578;
    INC.W PauseMenu_MenuIndex                                            ;81A57A;
    LDY.W AreaIndex                                                      ;81A57D;
    BRA Load_AreaSelect_BackgroundTilemap                                ;81A580;


;;; $A582: File select map - index 3: game options to area select map - load background tilemap ;;;
FileSelectMap_Index3_GameOptionsToAreaSelectMap:
    REP #$30                                                             ;81A582;
    INC.W PauseMenu_MenuIndex                                            ;81A584;
    LDY.W AreaIndex                                                      ;81A587; fallthrough to Load_AreaSelect_BackgroundTilemap


;;; $A58A: Load area select background tilemap ;;;
Load_AreaSelect_BackgroundTilemap:
;; Parameters:
;;     Y: Area index
    LDX.W VRAMWriteStack                                                 ;81A58A;
    LDA.W #$0800                                                         ;81A58D;
    STA.B VRAMWrite.size,X                                               ;81A590;
    TYA                                                                  ;81A592;
    XBA                                                                  ;81A593;
    ASL                                                                  ;81A594;
    ASL                                                                  ;81A595;
    ASL                                                                  ;81A596;
    CLC                                                                  ;81A597;
    ADC.W #Tilemap_AreaSelect_Background_Crateria                        ;81A598;
    STA.B VRAMWrite.src,X                                                ;81A59B;
    LDA.W #Tilemap_AreaSelect_Background_Crateria>>16                    ;81A59D;
    STA.B VRAMWrite.src+2,X                                              ;81A5A0;
    LDA.B DP_BG3TilemapAddrSize                                          ;81A5A2;
    AND.W #$00FC                                                         ;81A5A4;
    XBA                                                                  ;81A5A7;
    STA.B VRAMWrite.dest,X                                               ;81A5A8;
    TXA                                                                  ;81A5AA;
    CLC                                                                  ;81A5AB;
    ADC.W #$0007                                                         ;81A5AC;
    STA.W VRAMWriteStack                                                 ;81A5AF;
    RTS                                                                  ;81A5B2;


;;; $A5B3: File select map - index 4/13h: prepare expanding/contracting square transition to area select map ;;;
FileSelectMap_Index4_13_PrepareTransitionToAreaSelectMap:
    SEP #$20                                                             ;81A5B3;
    LDA.B #$04                                                           ;81A5B5;
    STA.B DP_SubScreenLayers                                             ;81A5B7;
    STA.W $212D                                                          ;81A5B9;
    LDA.B #$04                                                           ;81A5BC;
    STA.B DP_WindowAreaSubScreen                                         ;81A5BE;
    STA.W $212F                                                          ;81A5C0;
    LDA.B #$02                                                           ;81A5C3;
    STA.B DP_ColorMathA                                                  ;81A5C5;
    STA.W $2130                                                          ;81A5C7;
    LDA.B #$25                                                           ;81A5CA;
    STA.B DP_ColorMathB                                                  ;81A5CC;
    STA.W $2131                                                          ;81A5CE;
    LDA.B #$80                                                           ;81A5D1;
    STA.B DP_ColorMathSubScreenBackdropColor2                            ;81A5D3;
    LDA.B #$40                                                           ;81A5D5;
    STA.B DP_ColorMathSubScreenBackdropColor1                            ;81A5D7;
    LDA.B #$20                                                           ;81A5D9;
    STA.B DP_ColorMathSubScreenBackdropColor0                            ;81A5DB;
    JSR.W Setup_Initial_ExpandingSquareTransition_HDMA                   ;81A5DD;
    LDA.B #$0C                                                           ;81A5E0;
    STA.B DP_HDMAEnable                                                  ;81A5E2;
    STA.W $420C                                                          ;81A5E4;
    JSR.W Config_Window1_ExpandingSquareTransition                       ;81A5E7;
    STZ.W HDMAObject_Enable                                              ;81A5EA;
    STZ.W HDMAObject_Enable+1                                            ;81A5ED;
    INC.W PauseMenu_MenuIndex                                            ;81A5F0;
    REP #$30                                                             ;81A5F3;
    RTS                                                                  ;81A5F5;


;;; $A5F6: Configure window 1 for expanding square transition ;;;
Config_Window1_ExpandingSquareTransition:
    SEP #$20                                                             ;81A5F6;
    LDA.B #$13                                                           ;81A5F8;
    STA.B DP_MainScreenLayers                                            ;81A5FA;
    STA.W $212C                                                          ;81A5FC;
    LDA.B #$13                                                           ;81A5FF;
    STA.B DP_WindowAreaMainScreen                                        ;81A601;
    STA.W $212E                                                          ;81A603;
    LDA.B #$23                                                           ;81A606;
    STA.B DP_WindowMaskBG12                                              ;81A608;
    STA.W $2123                                                          ;81A60A;
    LDA.B #$03                                                           ;81A60D;
    STA.B DP_WindowMaskBG34                                              ;81A60F;
    STA.W $2124                                                          ;81A611;
    LDA.B #$23                                                           ;81A614;
    STA.B DP_WindowMaskSprite                                            ;81A616;
    STA.W $2125                                                          ;81A618;
    RTS                                                                  ;81A61B;


;;; $A61C: Set up initial expanding square transition HDMA ;;;
Setup_Initial_ExpandingSquareTransition_HDMA:
    SEP #$20                                                             ;81A61C;
    LDA.B #$00                                                           ;81A61E;
    STA.L ExpandingSquare_TopBottomMarginRightPosition                   ;81A620;
    STA.L ExpandingSquare_TopBottomMarginRightPosition+1                 ;81A624;
    DEC                                                                  ;81A628;
    STA.L ExpandingSquare_TopBottomMarginLeftPosition                    ;81A629;
    STA.L ExpandingSquare_TopBottomMarginLeftPosition+1                  ;81A62D;
    LDA.B #$7F                                                           ;81A631;
    STA.L ExpandingSquare_LeftPosition                                   ;81A633;
    LDA.B #$81                                                           ;81A637;
    STA.L ExpandingSquare_RightPosition                                  ;81A639;
    LDA.B #$6F                                                           ;81A63D;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable          ;81A63F;
    LDA.B #$22                                                           ;81A643;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+1        ;81A645;
    LDA.B #$9E                                                           ;81A649;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+2        ;81A64B;
    LDA.B #$01                                                           ;81A64F;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+3        ;81A651;
    LDA.B #$32                                                           ;81A655;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+4        ;81A657;
    LDA.B #$9E                                                           ;81A65B;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+5        ;81A65D;
    LDA.B #$01                                                           ;81A661;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+6        ;81A663;
    LDA.B #$32                                                           ;81A667;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+7        ;81A669;
    LDA.B #$9E                                                           ;81A66D;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+8        ;81A66F;
    LDA.B #$6F                                                           ;81A673;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+9        ;81A675;
    LDA.B #$20                                                           ;81A679;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+$A       ;81A67B;
    LDA.B #$9E                                                           ;81A67F;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+$B       ;81A681;
    LDA.B #$40                                                           ;81A685;
    STA.W $4320                                                          ;81A687;
    LDA.B #$26                                                           ;81A68A;
    STA.W $4321                                                          ;81A68C;
    LDA.B #$00                                                           ;81A68F;
    STA.W $4322                                                          ;81A691;
    LDA.B #$9E                                                           ;81A694;
    STA.W $4323                                                          ;81A696;
    LDA.B #$7E                                                           ;81A699;
    STA.W $4324                                                          ;81A69B;
    STA.W $4327                                                          ;81A69E;
    STZ.W $4325                                                          ;81A6A1;
    STZ.W $4326                                                          ;81A6A4;
    STZ.W $4328                                                          ;81A6A7;
    STZ.W $4329                                                          ;81A6AA;
    STZ.W $432A                                                          ;81A6AD;
    LDA.B #$6F                                                           ;81A6B0;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable        ;81A6B2;
    LDA.B #$20                                                           ;81A6B6;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+1      ;81A6B8;
    LDA.B #$9E                                                           ;81A6BC;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+2      ;81A6BE;
    LDA.B #$01                                                           ;81A6C2;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+3      ;81A6C4;
    LDA.B #$36                                                           ;81A6C8;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+4      ;81A6CA;
    LDA.B #$9E                                                           ;81A6CE;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+5      ;81A6D0;
    LDA.B #$01                                                           ;81A6D4;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+6      ;81A6D6;
    LDA.B #$36                                                           ;81A6DA;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+7      ;81A6DC;
    LDA.B #$9E                                                           ;81A6E0;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+8      ;81A6E2;
    LDA.B #$6F                                                           ;81A6E6;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+9      ;81A6E8;
    LDA.B #$20                                                           ;81A6EC;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+$A     ;81A6EE;
    LDA.B #$9E                                                           ;81A6F2;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+$B     ;81A6F4;
    LDA.B #$40                                                           ;81A6F8;
    STA.W $4330                                                          ;81A6FA;
    LDA.B #$27                                                           ;81A6FD;
    STA.W $4331                                                          ;81A6FF;
    LDA.B #$10                                                           ;81A702;
    STA.W $4332                                                          ;81A704;
    LDA.B #$9E                                                           ;81A707;
    STA.W $4333                                                          ;81A709;
    LDA.B #$7E                                                           ;81A70C;
    STA.W $4334                                                          ;81A70E;
    STA.W $4337                                                          ;81A711;
    STZ.W $4335                                                          ;81A714;
    STZ.W $4336                                                          ;81A717;
    STZ.W $4338                                                          ;81A71A;
    STZ.W $4339                                                          ;81A71D;
    STZ.W $433A                                                          ;81A720;
    RTS                                                                  ;81A723;


;;; $A724: Expanding square transition speed ;;;
ExpandingSquareTransitionSpeed:
    db $04                                                               ;81A724;


;;; $A725: File select map - index 5: game options to area select map - expanding square transition ;;;
FileSelectMap_Index5_GameOptionsToAreaSelectMap_ExpSqrTrans:
; Prepares the room select map when finished transition
    REP #$30                                                             ;81A725;
    JSR.W DrawAreaSelectMapLabels                                        ;81A727;
    SEP #$20                                                             ;81A72A;
    LDA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable          ;81A72C;
    SEC                                                                  ;81A730;
    SBC.W ExpandingSquareTransitionSpeed                                 ;81A731;
    BMI +                                                                ;81A734;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable          ;81A736;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+9        ;81A73A;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable        ;81A73E;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+9      ;81A742;
    LDA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+3        ;81A746;
    CLC                                                                  ;81A74A;
    ADC.W ExpandingSquareTransitionSpeed                                 ;81A74B;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+3        ;81A74E;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+6        ;81A752;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+3      ;81A756;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+6      ;81A75A;
    LDA.L ExpandingSquare_LeftPosition                                   ;81A75E;
    SEC                                                                  ;81A762;
    SBC.W ExpandingSquareTransitionSpeed                                 ;81A763;
    STA.L ExpandingSquare_LeftPosition                                   ;81A766;
    LDA.L ExpandingSquare_RightPosition                                  ;81A76A;
    CLC                                                                  ;81A76E;
    ADC.W ExpandingSquareTransitionSpeed                                 ;81A76F;
    STA.L ExpandingSquare_RightPosition                                  ;81A772;
    RTS                                                                  ;81A776;

+   INC.W PauseMenu_MenuIndex                                            ;81A777;
    LDA.B DP_MainScreenLayers                                            ;81A77A;
    AND.B #$FD                                                           ;81A77C;
    STA.B DP_MainScreenLayers                                            ;81A77E;
    LDA.B DP_WindowAreaMainScreen                                        ;81A780;
    AND.B #$00                                                           ;81A782;
    STA.B DP_WindowAreaMainScreen                                        ;81A784;
    LDA.B DP_WindowAreaSubScreen                                         ;81A786;
    AND.B #$00                                                           ;81A788;
    STA.B DP_WindowAreaSubScreen                                         ;81A78A;
    LDA.B #$18                                                           ;81A78C;
    STA.B DP_BG2YScroll                                                  ;81A78E;
    LDA.B #$00                                                           ;81A790;
    STA.B DP_BG2YScroll+1                                                ;81A792;
    REP #$30                                                             ;81A794;
    LDA.W #$0001                                                         ;81A796;
    STA.W PauseMenu_PaletteAnimationTimer                                ;81A799;
    LDX.W #$0000                                                         ;81A79C;

  .copyTilemap:
    LDA.L Tilemap_BG2PauseScreen_BG2RoomSelectMap_0,X                    ;81A79F;
    STA.L BG2Tilemap,X                                                   ;81A7A3;
    INX                                                                  ;81A7A7;
    INX                                                                  ;81A7A8;
    CPX.W #$0640                                                         ;81A7A9;
    BMI .copyTilemap                                                     ;81A7AC;
    LDA.W #$2801                                                         ;81A7AE;

  .loopTilemap:
    STA.L BG2Tilemap,X                                                   ;81A7B1;
    INX                                                                  ;81A7B5;
    INX                                                                  ;81A7B6;
    CPX.W #$0800                                                         ;81A7B7;
    BMI .loopTilemap                                                     ;81A7BA;
    LDA.W #BG2Tilemap+$154                                               ;81A7BC;
    STA.B DP_Temp00                                                      ;81A7BF;
    LDA.W #BG2Tilemap>>16                                                ;81A7C1;
    STA.B DP_Temp02                                                      ;81A7C4;
    JSL.L DrawRoomSelectMap_AreaLabel                                    ;81A7C6;
    LDY.W #$0140                                                         ;81A7CA;
    LDX.W #$077E                                                         ;81A7CD;

  .loopMapControls:
    LDA.W Tilemap_RoomSelectMap_Controls,Y                               ;81A7D0;
    STA.L BG2Tilemap,X                                                   ;81A7D3;
    DEX                                                                  ;81A7D7;
    DEX                                                                  ;81A7D8;
    DEY                                                                  ;81A7D9;
    DEY                                                                  ;81A7DA;
    BNE .loopMapControls                                                 ;81A7DB;
    LDX.W VRAMWriteStack                                                 ;81A7DD;
    LDA.W #$0800                                                         ;81A7E0;
    STA.B VRAMWrite.size,X                                               ;81A7E3;
    LDA.W #$4000                                                         ;81A7E5;
    STA.B VRAMWrite.src,X                                                ;81A7E8;
    LDA.W #$007E                                                         ;81A7EA;
    STA.B VRAMWrite.src+2,X                                              ;81A7ED;
    LDA.B DP_BG2TilemapAddrSize                                          ;81A7EF;
    AND.W #$00FC                                                         ;81A7F1;
    XBA                                                                  ;81A7F4;
    STA.B VRAMWrite.dest,X                                               ;81A7F5;
    TXA                                                                  ;81A7F7;
    CLC                                                                  ;81A7F8;
    ADC.W #$0007                                                         ;81A7F9;
    STA.W VRAMWriteStack                                                 ;81A7FC;
    RTS                                                                  ;81A7FF;


;;; $A800: File select map - index 6: area select map ;;;
FileSelectMap_Index6_AreaSelectMap:
; BUG: The check for debug mode here loads zero if debug mode isn't enabled,
;      causing the subsequent BITs that expect newly pressed controller 1 input in A to always flag zero
;      This means pressing up/left/down/right/select the same frame as B/A/start negates the B/A/start input
    REP #$30                                                             ;81A800;
    LDA.B DP_Controller1New                                              ;81A802;
    BIT.W #$0A00                                                         ;81A804;
    BEQ +                                                                ;81A807;
if !DEBUG
    LDA.W Debug_Enable                                                   ;81A809; <-- clobbers A >_<;
    BEQ .checkB                                                          ;81A80C;
    JMP.W .debug                                                         ;81A80E;
endif

+   BIT.W #$2500                                                         ;81A811;
    BEQ .checkB                                                          ;81A814;
if !DEBUG
    LDA.W Debug_Enable                                                   ;81A816; <-- clobbers A >_<;
    BEQ .checkB                                                          ;81A819;
    JMP.W .debugNext                                                     ;81A81B;
endif

  .checkB:
    BIT.W #$8000                                                         ;81A81E;
    BEQ +                                                                ;81A821;
    LDA.W #$0016                                                         ;81A823;
    STA.W PauseMenu_MenuIndex                                            ;81A826;
    JMP.W DrawAreaSelectMapLabels                                        ;81A829;
+   BIT.W #$1080                                                         ;81A82C;
    BEQ .JMP_DrawAreaSelectMapLabels                                     ;81A82F;
    LDA.W #$0038                                                         ;81A831;
    JSL.L QueueSound_Lib1_Max6                                           ;81A834;
    JMP.W Select_FileSelectMap_Area                                      ;81A838;

  .JMP_DrawAreaSelectMapLabels:
    JMP.W DrawAreaSelectMapLabels                                        ;81A83B;

if !DEBUG
  .debug:
    STZ.B DP_Temp18                                                      ;81A83E; >_<
    LDA.B DP_Temp16                                                      ;81A840;
    STA.B DP_Temp18                                                      ;81A842;
    LDA.W FileSelectMapAreaIndex                                         ;81A844;
    JSR.W A_equals_A_Minus_1_Mod_6                                       ;81A847;
    JSR.W Debug_Check_FileSelectMapArea_CanBeSelected                    ;81A84A;
    BNE .selected                                                        ;81A84D;
    LDA.B DP_Temp1C                                                      ;81A84F;
    JSR.W A_equals_A_Minus_1_Mod_6                                       ;81A851;
    JSR.W Debug_Check_FileSelectMapArea_CanBeSelected                    ;81A854;
    BNE .selected                                                        ;81A857;
    LDA.B DP_Temp1C                                                      ;81A859;
    JSR.W A_equals_A_Minus_1_Mod_6                                       ;81A85B;
    JSR.W Debug_Check_FileSelectMapArea_CanBeSelected                    ;81A85E;
    BEQ .JMP_DrawAreaSelectMapLabels                                     ;81A861;
endif

  .selected:
    LDA.W #$0037                                                         ;81A863;
    JSL.L QueueSound_Lib1_Max6                                           ;81A866;
    JSR.W Switch_Active_FileSelectMapArea                                ;81A86A;
    JMP.W DrawAreaSelectMapLabels                                        ;81A86D;

if !DEBUG
  .debugNext:
    LDA.W #$0006                                                         ;81A870;
    STA.B DP_Temp16                                                      ;81A873;
    LDA.W FileSelectMapAreaIndex                                         ;81A875;
    STA.B DP_Temp1C                                                      ;81A878;
endif

  .loop:
    LDA.B DP_Temp1C                                                      ;81A87A;
    JSR.W A_equals_A_Plus_1_Mod_6                                        ;81A87C;
    JSR.W Debug_Check_FileSelectMapArea_CanBeSelected                    ;81A87F;
    BNE .switch                                                          ;81A882;
    DEC.B DP_Temp16                                                      ;81A884;
    BNE .loop                                                            ;81A886;
    JMP.W DrawAreaSelectMapLabels                                        ;81A888;

  .switch:
    JSR.W Switch_Active_FileSelectMapArea                                ;81A88B;
    LDA.W #$0037                                                         ;81A88E;
    JSL.L QueueSound_Lib1_Max6                                           ;81A891;
    JMP.W DrawAreaSelectMapLabels                                        ;81A895;


;;; $A898: A = ([A] - 1) % 6 ;;;
A_equals_A_Minus_1_Mod_6:
    DEC                                                                  ;81A898;
    BPL .return                                                          ;81A899;
    LDA.W #$0005                                                         ;81A89B;

  .return:
    RTS                                                                  ;81A89E;


;;; $A89F: A = ([A] + 1) % 6 ;;;
A_equals_A_Plus_1_Mod_6:
    INC                                                                  ;81A89F;
    CMP.W #$0006                                                         ;81A8A0;
    BMI .return                                                          ;81A8A3;
    LDA.W #$0000                                                         ;81A8A5;

  .return:
    RTS                                                                  ;81A8A8;



;;; $A8A9: Select file select map area ;;;
Select_FileSelectMap_Area:
    INC.W PauseMenu_MenuIndex                                            ;81A8A9;
if !DEBUG
    LDA.W Debug_Enable                                                   ;81A8AC;
    BNE .debugEnabled                                                    ;81A8AF;
endif
    LDA.L SRAMMirror_AreaIndex                                           ;81A8B1;
    STA.W AreaIndex                                                      ;81A8B5;
    LDA.L SRAMMirror_SaveStationIndex                                    ;81A8B8;
    STA.W LoadStationIndex                                               ;81A8BC;
    JMP.W FileSelectMap_Index6_AreaSelectMap_JMP_DrawAreaSelectMapLabels ;81A8BF;

if !DEBUG
  .debugEnabled:
    LDA.W FileSelectMapAreaIndex                                         ;81A8C2;
    ASL                                                                  ;81A8C5;
    TAX                                                                  ;81A8C6;
    LDA.W FileSelectMapArea_IndexTable,X                                 ;81A8C7;
    STA.W AreaIndex                                                      ;81A8CA;
    ASL                                                                  ;81A8CD;
    TAX                                                                  ;81A8CE;
    LDA.L SRAMMirror_UsedSaveStationsElevators,X                         ;81A8CF;
    STA.B DP_Temp12                                                      ;81A8D3;
    LDX.W #$0000                                                         ;81A8D5;
    LDA.W #MapIcon_PositionTablePointers>>16                             ;81A8D8;
    STA.B DP_Temp02                                                      ;81A8DB;
    LDA.W #MapIcon_PositionTablePointers_savePoints                      ;81A8DD;
    STA.B DP_Temp00                                                      ;81A8E0;
    LDA.W AreaIndex                                                      ;81A8E2;
    ASL                                                                  ;81A8E5;
    TAY                                                                  ;81A8E6;
    LDA.B [DP_Temp00],Y                                                  ;81A8E7;

  .crash:
    BEQ .crash                                                           ;81A8E9;
    STA.B DP_Temp00                                                      ;81A8EB;
    LDA.W #$0010                                                         ;81A8ED;
    STA.B DP_Temp14                                                      ;81A8F0;

  .loopSavesElevators:
    LSR.B DP_Temp12                                                      ;81A8F2;
    BCC +                                                                ;81A8F4;
    TXA                                                                  ;81A8F6;
    ASL                                                                  ;81A8F7;
    ASL                                                                  ;81A8F8;
    TAY                                                                  ;81A8F9;
    LDA.B [DP_Temp00],Y                                                  ;81A8FA;
    CMP.W #$FFFE                                                         ;81A8FC;
    BEQ +                                                                ;81A8FF;
    CMP.W #$FFFF                                                         ;81A901;
    BNE .found                                                           ;81A904;
    LDX.W #$FFFF                                                         ;81A906;

+   INX                                                                  ;81A909;
    DEC.B DP_Temp14                                                      ;81A90A;
    BNE .loopSavesElevators                                              ;81A90C;
    LDA.W #$0008                                                         ;81A90E;

  .loopDebugSavePoints:
    TXA                                                                  ;81A911;
    ASL                                                                  ;81A912;
    ASL                                                                  ;81A913;
    TAY                                                                  ;81A914;
    LDA.B [DP_Temp00],Y                                                  ;81A915;
    CMP.W #$FFFE                                                         ;81A917;
    BEQ +                                                                ;81A91A;
    CMP.W #$FFFF                                                         ;81A91C;
    BNE .found                                                           ;81A91F;
    LDX.W #$FFFF                                                         ;81A921;

+   INX                                                                  ;81A924;
    DEC.B DP_Temp14                                                      ;81A925;
    BNE .loopDebugSavePoints                                             ;81A927;

  .crash2:
    BRA .crash2                                                          ;81A929;

  .found:
    STX.W LoadStationIndex                                               ;81A92B;
    JMP.W FileSelectMap_Index6_AreaSelectMap_JMP_DrawAreaSelectMapLabels ;81A92E;


;;; $A931: Debug. Check if file select map area can be selected ;;;
Debug_Check_FileSelectMapArea_CanBeSelected:
;; Parameters:
;;     A: File select map area index
;; Returns:
;;     Zero: Clear if used save station or elevator in area, or if area has debug elevator markers (which they all do); otherwise set

; Always returns zero clear
    STA.B DP_Temp1C                                                      ;81A931;
    ASL                                                                  ;81A933;
    TAX                                                                  ;81A934;
    LDA.W FileSelectMapArea_IndexTable,X                                 ;81A935;
    ASL                                                                  ;81A938;
    TAX                                                                  ;81A939;
    LDA.L SRAMMirror_UsedSaveStationsElevators,X                         ;81A93A;
    BNE .return                                                          ;81A93E;
    PHB                                                                  ;81A940;
    LDA.W #MapIcon_PositionTablePointers>>8&$FF00                        ;81A941;
    PHA                                                                  ;81A944;
    PLB                                                                  ;81A945;
    PLB                                                                  ;81A946;
    LDA.L MapIcon_PositionTablePointers_savePoints,X                     ;81A947;
    CLC                                                                  ;81A94B;
    ADC.W #$0040                                                         ;81A94C;
    TAX                                                                  ;81A94F;
    LDA.W $0000,X                                                        ;81A950;
    PLB                                                                  ;81A953;
    CMP.W #$FFFF                                                         ;81A954;

  .return:
    RTS                                                                  ;81A957;


;;; $A958: Debug. Switch active file select map area ;;;
Switch_Active_FileSelectMapArea:
    LDA.W FileSelectMapAreaIndex                                         ;81A958;
    ASL                                                                  ;81A95B;
    TAX                                                                  ;81A95C;
    LDA.W FileSelectMapArea_IndexTable,X                                 ;81A95D;
    TAX                                                                  ;81A960;
    JSR.W LoadInactiveAreaMapForegroundColors                            ;81A961;
    LDA.B DP_Temp1C                                                      ;81A964;
    STA.W FileSelectMapAreaIndex                                         ;81A966;
    ASL                                                                  ;81A969;
    TAX                                                                  ;81A96A;
    LDA.W FileSelectMapArea_IndexTable,X                                 ;81A96B;
    TAX                                                                  ;81A96E;
    JSR.W LoadActiveAreaMapForegroundColors                              ;81A96F;
    LDA.W FileSelectMapAreaIndex                                         ;81A972;
    ASL                                                                  ;81A975;
    TAX                                                                  ;81A976;
    LDA.W FileSelectMapArea_IndexTable,X                                 ;81A977;
    TAY                                                                  ;81A97A;
    JMP.W Load_AreaSelect_BackgroundTilemap                              ;81A97B;
endif


;;; $A97E: Draw area select map labels ;;;
DrawAreaSelectMapLabels:
    STZ.B DP_Temp03                                                      ;81A97E;
    LDX.W #$0080                                                         ;81A980;
    LDY.W #$0010                                                         ;81A983;
    LDA.L AreaSelect_SpritemapBaseIndex                                  ;81A986;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;81A98A;
    STZ.B DP_Temp1C                                                      ;81A98E;

  .loopAreas:
    LDX.W #$0200                                                         ;81A990;
    LDA.B DP_Temp1C                                                      ;81A993;
    CMP.W FileSelectMapAreaIndex                                         ;81A995;
    BNE +                                                                ;81A998;
    LDX.W #$0000                                                         ;81A99A;

+   STX.B DP_Temp03                                                      ;81A99D;
    LDA.B DP_Temp1C                                                      ;81A99F;
    ASL                                                                  ;81A9A1;
    TAX                                                                  ;81A9A2;
    LDA.W FileSelectMapArea_IndexTable,X                                 ;81A9A3;
    ASL                                                                  ;81A9A6;
    TAX                                                                  ;81A9A7;
    PHB                                                                  ;81A9A8;
    LDA.W #MapIcon_PositionTablePointers>>8&$FF00                        ;81A9A9;
    PHA                                                                  ;81A9AC;
    PLB                                                                  ;81A9AD;
    PLB                                                                  ;81A9AE;
    LDA.L SRAMMirror_UsedSaveStationsElevators,X                         ;81A9AF;
    STA.B DP_Temp24                                                      ;81A9B3;
    LDA.L MapIcon_PositionTablePointers_savePoints,X                     ;81A9B5;
    TAX                                                                  ;81A9B9;
    LDA.W #$0010                                                         ;81A9BA;
    STA.B DP_Temp1E                                                      ;81A9BD;

  .loopSavePoints:
    LDA.W $0000,X                                                        ;81A9BF;
    CMP.W #$FFFF                                                         ;81A9C2;
    BEQ .PLBNext                                                         ;81A9C5;
    LSR.B DP_Temp24                                                      ;81A9C7;
    BCC +                                                                ;81A9C9;
    CMP.W #$FFFE                                                         ;81A9CB;
    BNE .foundUsedSavePoint                                              ;81A9CE;

+   TXA                                                                  ;81A9D0;
    CLC                                                                  ;81A9D1;
    ADC.W #$0004                                                         ;81A9D2;
    TAX                                                                  ;81A9D5;
    DEC.B DP_Temp1E                                                      ;81A9D6;
    BNE .loopSavePoints                                                  ;81A9D8;
if !DEBUG
    LDA.W Debug_Enable                                                   ;81A9DA;
    BEQ .PLBNext                                                         ;81A9DD;
    LDA.W $0000,X                                                        ;81A9DF;
    CMP.W #$FFFF                                                         ;81A9E2;
    BEQ .PLBNext                                                         ;81A9E5;
endif

  .foundUsedSavePoint:
    PLB                                                                  ;81A9E7;
    LDA.B DP_Temp1C                                                      ;81A9E8;
    ASL                                                                  ;81A9EA;
    TAX                                                                  ;81A9EB;
    LDA.W FileSelectMapArea_IndexTable,X                                 ;81A9EC;
    ASL                                                                  ;81A9EF;
    ASL                                                                  ;81A9F0;
    TAX                                                                  ;81A9F1;
    LDA.W FileSelectMap_Labels_Positions_Y,X                             ;81A9F2;
    TAY                                                                  ;81A9F5;
    LDA.W FileSelectMap_Labels_Positions_X,X                             ;81A9F6;
    PHA                                                                  ;81A9F9;
    LDA.B DP_Temp1C                                                      ;81A9FA;
    ASL                                                                  ;81A9FC;
    TAX                                                                  ;81A9FD;
    LDA.W FileSelectMapArea_IndexTable,X                                 ;81A9FE;
    CLC                                                                  ;81AA01;
    ADC.L AreaSelect_SpritemapBaseIndex                                  ;81AA02;
    INC                                                                  ;81AA06;
    PLX                                                                  ;81AA07;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;81AA08;

  .next:
    INC.B DP_Temp1C                                                      ;81AA0C;
    LDA.B DP_Temp1C                                                      ;81AA0E;
    CMP.W #$0006                                                         ;81AA10;
    BPL .return                                                          ;81AA13;
    JMP.W .loopAreas                                                     ;81AA15;

  .return:
    RTS                                                                  ;81AA18;

  .PLBNext:
    PLB                                                                  ;81AA19;
    BRA .next                                                            ;81AA1A;


;;; $AA1C: Area select map labels positions ;;;
FileSelectMap_Labels_Positions:
  .X:
    dw $005B                                                             ;81AA1C;
  .Y:
    dw       $0032 ; Crateria
    dw $002A,$007F ; Brinstar
    dw $005E,$00B5 ; Norfair
    dw $00CE,$0050 ; Wrecked Ship
    dw $00CE,$009F ; Maridia
    dw $0087,$008B ; Tourian


;;; $AA34: Room select map expanding square velocities ;;;
RoomSelectMap_ExpandingSquare_Velocities:
;        ________________________________________________ Left position subvelocity
;       |      __________________________________________ Left position velocity
;       |     |       ___________________________________ Right subvelocity
;       |     |      |      _____________________________ Right velocity
;       |     |      |     |       ______________________ Top subvelocity
;       |     |      |     |      |      ________________ Top velocity
;       |     |      |     |      |     |       _________ Bottom subvelocity
;       |     |      |     |      |     |      |      ___ Bottom velocity
;       |     |      |     |      |     |      |     |
  .leftSub:
    dw $3C00                                                             ;81AA34; Crateria
  .left:
    dw       $FFFE                                                       ;81AA36;
  .rightSub:
    dw              $3400                                                ;81AA38;
  .right:
    dw                    $0003                                          ;81AA3A;
  .topSub:
    dw                           $0800                                   ;81AA3C;
  .top:
    dw                                 $FFFF                             ;81AA3E;
  .bottomSub:
    dw                                        $0000                      ;81AA40;
  .bottom:
    dw                                              $0004                ;81AA42;

    dw $3800,$FFFF, $0000,$0004, $A400,$FFFD, $6800,$0002 ; Brinstar
    dw $F000,$FFFD, $9400,$0003, $0000,$FFFC, $A800,$0001 ; Norfair
    dw $0000,$FFFC, $F800,$0000, $7400,$FFFE, $6800,$0003 ; Wrecked Ship
    dw $0000,$FFFC, $F800,$0000, $EC00,$FFFC, $E000,$0001 ; Maridia
    dw $2000,$FFFC, $7800,$0003, $0000,$FFFC, $5C00,$0003 ; Tourian


;;; $AA94: Room select map expanding square timers ;;;
RoomSelectMap_ExpandingSquare_Timers:
    dw $0033 ; Crateria
    dw $0035 ; Brinstar
    dw $002D ; Norfair
    dw $0033 ; Wrecked Ship
    dw $0033 ; Maridia
    dw $0022 ; Tourian


;;; $AAA0: File select map area index table ;;;
FileSelectMapArea_IndexTable:
; Maps file select map area index (FileSelectMapAreaIndex) to area index (AreaIndex)
    dw $0000 ; Crateria
    dw $0003 ; Wrecked Ship
    dw $0005 ; Tourian
    dw $0001 ; Brinstar
    dw $0004 ; Maridia
    dw $0002 ; Norfair


;;; $AAAC: File select map - index 7: area select map to room select map - prepare expanding square transition ;;;
FileSelectMap_Index7_AreaSelectMapToRoomSelectMap:
    REP #$30                                                             ;81AAAC;
    JSR.W DrawAreaSelectMapLabels                                        ;81AAAE;
    SEP #$20                                                             ;81AAB1;
    JSR.W Setup_Initial_ExpandingSquareTransition_HDMA                   ;81AAB3;
    LDA.B #$13                                                           ;81AAB6;
    STA.B DP_MainScreenLayers                                            ;81AAB8;
    LDA.B #$13                                                           ;81AABA;
    STA.B DP_WindowAreaMainScreen                                        ;81AABC;
    LDA.B #$32                                                           ;81AABE;
    STA.B DP_WindowMaskBG12                                              ;81AAC0;
    STA.W $2123                                                          ;81AAC2;
    LDA.B #$02                                                           ;81AAC5;
    STA.B DP_WindowMaskBG34                                              ;81AAC7;
    STA.W $2124                                                          ;81AAC9;
    LDA.B #$05                                                           ;81AACC;
    STA.B DP_ColorMathB                                                  ;81AACE;
    STA.W $2131                                                          ;81AAD0;
    LDA.B #$22                                                           ;81AAD3;
    STA.B DP_WindowMaskSprite                                            ;81AAD5;
    STA.W $2125                                                          ;81AAD7;
    LDA.B #$30                                                           ;81AADA;
    STA.B DP_BGTilesAddr                                                 ;81AADC;
    LDA.B #$00                                                           ;81AADE;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+9        ;81AAE0;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+9      ;81AAE4;
    REP #$30                                                             ;81AAE8;
    LDA.W #$4154                                                         ;81AAEA;
    STA.B DP_Temp00                                                      ;81AAED;
    LDA.W #$007E                                                         ;81AAEF;
    STA.B DP_Temp02                                                      ;81AAF2;
    JSL.L DrawRoomSelectMap_AreaLabel                                    ;81AAF4;
    LDX.W VRAMWriteStack                                                 ;81AAF8;
    LDA.W #$0200                                                         ;81AAFB;
    STA.B VRAMWrite.size,X                                               ;81AAFE;
    LDA.W #BG2Tilemap                                                    ;81AB00;
    STA.B VRAMWrite.src,X                                                ;81AB03;
    LDA.W #BG2Tilemap>>16                                                ;81AB05;
    STA.B VRAMWrite.src+2,X                                              ;81AB08;
    LDA.B DP_BG2TilemapAddrSize                                          ;81AB0A;
    AND.W #$00FC                                                         ;81AB0C;
    XBA                                                                  ;81AB0F;
    STA.B VRAMWrite.dest,X                                               ;81AB10;
    TXA                                                                  ;81AB12;
    CLC                                                                  ;81AB13;
    ADC.W #$0007                                                         ;81AB14;
    STA.W VRAMWriteStack                                                 ;81AB17;
    LDA.W AreaIndex                                                      ;81AB1A;
    ASL                                                                  ;81AB1D;
    TAX                                                                  ;81AB1E;
    LDA.W RoomSelectMap_ExpandingSquare_Timers,X                         ;81AB1F;
    STA.L ExpandingSquare_Timer                                          ;81AB22;
    TXA                                                                  ;81AB26;
    ASL                                                                  ;81AB27;
    TAX                                                                  ;81AB28;
    LDA.W FileSelectMap_Labels_Positions_X,X                             ;81AB29;
    STA.L ExpandingSquare_LeftPosition                                   ;81AB2C;
    STA.L ExpandingSquare_RightPosition                                  ;81AB30;
    LDA.W FileSelectMap_Labels_Positions_Y,X                             ;81AB34;
    STA.L ExpandingSquare_TopPosition                                    ;81AB37;
    STA.L ExpandingSquare_BottomPosition                                 ;81AB3B;
    LDA.W #$0000                                                         ;81AB3F;
    STA.L ExpandingSquare_LeftSubPosition                                ;81AB42;
    STA.L ExpandingSquare_RightSubPosition                               ;81AB46;
    STA.L ExpandingSquare_TopSubPosition                                 ;81AB4A;
    STA.L ExpandingSquare_BottomSubPosition                              ;81AB4E;
    TXA                                                                  ;81AB52;
    ASL                                                                  ;81AB53;
    ASL                                                                  ;81AB54;
    TAX                                                                  ;81AB55;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_leftSub,X             ;81AB56;
    STA.L ExpandingSquare_LeftPositionSubVelocity                        ;81AB59;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_left,X                ;81AB5D;
    STA.L ExpandingSquare_LeftPositionVelocity                           ;81AB60;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_rightSub,X            ;81AB64;
    STA.L ExpandingSquare_RightSubVelocity                               ;81AB67;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_right,X               ;81AB6B;
    STA.L ExpandingSquare_RightVelocity                                  ;81AB6E;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_topSub,X              ;81AB72;
    STA.L ExpandingSquare_TopSubVelocity                                 ;81AB75;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_top,X                 ;81AB79;
    STA.L ExpandingSquare_TopVelocity                                    ;81AB7C;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_bottomSub,X           ;81AB80;
    STA.L ExpandingSquare_BottomSubVelocity                              ;81AB83;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_bottom,X              ;81AB87;
    STA.L ExpandingSquare_BottomVelocity                                 ;81AB8A;
    SEP #$20                                                             ;81AB8E;
    JSR.W Setup_FileSelectMap_ExpandingSquareTransition_HDMA             ;81AB90;
    LDA.B #$0C                                                           ;81AB93;
    STA.B DP_HDMAEnable                                                  ;81AB95;
    STA.W $420C                                                          ;81AB97;
    REP #$20                                                             ;81AB9A;
    INC.W PauseMenu_MenuIndex                                            ;81AB9C;
    LDA.W #$003B                                                         ;81AB9F;
    JSL.L QueueSound_Lib1_Max6                                           ;81ABA2;
    RTS                                                                  ;81ABA6;


;;; $ABA7: Set up file select map expanding square transition HDMA ;;;
Setup_FileSelectMap_ExpandingSquareTransition_HDMA:
    SEP #$20                                                             ;81ABA7;
    LDX.W #$0000                                                         ;81ABA9;
    LDA.L ExpandingSquare_TopPosition                                    ;81ABAC;
    LDY.W #ExpandingSquare_TopBottomMarginLeftPosition                   ;81ABB0;
    JSR.W AddExpandingSquareTransition_LeftPos_IndirectHDMATable         ;81ABB3;
    LDY.W #ExpandingSquare_TopBottomMarginRightPosition                  ;81ABB6;
    JSR.W AddExpandingSquareTransition_RightPos_IndirectHDMATable        ;81ABB9;
    LDA.L ExpandingSquare_BottomPosition                                 ;81ABBC;
    SEC                                                                  ;81ABC0;
    SBC.L ExpandingSquare_TopPosition                                    ;81ABC1;
    BNE +                                                                ;81ABC5;
    LDA.B #$01                                                           ;81ABC7;

+   LDY.W #ExpandingSquare_LeftPosition                                  ;81ABC9;
    JSR.W AddExpandingSquareTransition_LeftPos_IndirectHDMATable         ;81ABCC;
    LDY.W #ExpandingSquare_RightPosition                                 ;81ABCF;
    JSR.W AddExpandingSquareTransition_RightPos_IndirectHDMATable        ;81ABD2;
    LDA.B #$E0                                                           ;81ABD5;
    SEC                                                                  ;81ABD7;
    SBC.L ExpandingSquare_BottomPosition                                 ;81ABD8;
    BNE +                                                                ;81ABDC;
    LDA.B #$01                                                           ;81ABDE;

+   LDY.W #ExpandingSquare_TopBottomMarginLeftPosition                   ;81ABE0;
    JSR.W AddExpandingSquareTransition_LeftPos_IndirectHDMATable         ;81ABE3;
    LDY.W #ExpandingSquare_TopBottomMarginRightPosition                  ;81ABE6;
    JSR.W AddExpandingSquareTransition_RightPos_IndirectHDMATable        ;81ABE9;
    LDA.B #$00                                                           ;81ABEC;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable,X        ;81ABEE;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable,X      ;81ABF2;
    RTS                                                                  ;81ABF6;


;;; $ABF7: Add expanding square transition left position indirect HDMA table entry ;;;
AddExpandingSquareTransition_LeftPos_IndirectHDMATable:
;; Parameters:
;;     A: Number of lines
;;     X: Indirect HDMA table offset
;;     Y: Address of window 1 left position
    PHA                                                                  ;81ABF7;
    PHY                                                                  ;81ABF8;
    PHP                                                                  ;81ABF9;
    SEP #$20                                                             ;81ABFA;
    BIT.B #$80                                                           ;81ABFC;
    BNE +                                                                ;81ABFE;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable,X        ;81AC00;
    REP #$20                                                             ;81AC04;
    TYA                                                                  ;81AC06;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+1,X      ;81AC07;
    PLP                                                                  ;81AC0B;
    PLY                                                                  ;81AC0C;
    PLA                                                                  ;81AC0D;
    RTS                                                                  ;81AC0E;

    SEP #$20                                                             ;81AC0F; dead code

+   SEC                                                                  ;81AC11;
    SBC.B #$7F                                                           ;81AC12;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable,X        ;81AC14;
    LDA.B #$7F                                                           ;81AC18;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+3,X      ;81AC1A;
    REP #$20                                                             ;81AC1E;
    TYA                                                                  ;81AC20;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+1,X      ;81AC21;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+4,X      ;81AC25;
    PLP                                                                  ;81AC29;
    PLY                                                                  ;81AC2A;
    PLA                                                                  ;81AC2B;
    RTS                                                                  ;81AC2C;


;;; $AC2D: Add expanding square transition right position indirect HDMA table entry ;;;
AddExpandingSquareTransition_RightPos_IndirectHDMATable:
;; Parameters:
;;     A: Number of lines
;;     X: Indirect HDMA table offset
;;     Y: Address of window 1 right position
;; Returns:
;;     X: Next indirect HDMA table offset
    PHP                                                                  ;81AC2D;
    SEP #$20                                                             ;81AC2E;
    BIT.B #$80                                                           ;81AC30;
    BNE +                                                                ;81AC32;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable,X      ;81AC34;
    REP #$20                                                             ;81AC38;
    TYA                                                                  ;81AC3A;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+1,X    ;81AC3B;
    INX                                                                  ;81AC3F;
    INX                                                                  ;81AC40;
    INX                                                                  ;81AC41;
    PLP                                                                  ;81AC42;
    RTS                                                                  ;81AC43;

    SEP #$20                                                             ;81AC44; dead code

+   SEC                                                                  ;81AC46;
    SBC.B #$7F                                                           ;81AC47;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable,X      ;81AC49;
    LDA.B #$7F                                                           ;81AC4D;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+3,X    ;81AC4F;
    REP #$20                                                             ;81AC53;
    TYA                                                                  ;81AC55;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+1,X    ;81AC56;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+4,X    ;81AC5A;
    TXA                                                                  ;81AC5E;
    CLC                                                                  ;81AC5F;
    ADC.W #$0006                                                         ;81AC60;
    TAX                                                                  ;81AC63;
    PLP                                                                  ;81AC64;
    RTS                                                                  ;81AC65;


;;; $AC66: File select map - index 8: area select map to room select map - expanding square transition ;;;
FileSelectMap_Index8_AreaSelectMapToRoomSelectMap:
    REP #$30                                                             ;81AC66;
    JSR.W HandleRoomSelectMap_ExpandingSquareTransition                  ;81AC68;
    BPL +                                                                ;81AC6B;
    INC.W PauseMenu_MenuIndex                                            ;81AC6D;
    SEP #$20                                                             ;81AC70;
    LDA.B #$02                                                           ;81AC72;
    STA.B DP_MainScreenLayers                                            ;81AC74;
    LDA.B #$00                                                           ;81AC76;
    STA.B DP_WindowAreaMainScreen                                        ;81AC78;
    STA.B DP_WindowAreaSubScreen                                         ;81AC7A;
    STA.B DP_SubScreenLayers                                             ;81AC7C;

+   REP #$30                                                             ;81AC7E;
    JSR.W DrawAreaSelectMapLabels                                        ;81AC80;
    RTS                                                                  ;81AC83;


;;; $AC84: Handle room select map expanding square transition ;;;
HandleRoomSelectMap_ExpandingSquareTransition:
;; Returns:
;;     Negative: Set if finished, clear otherwise
    LDA.L ExpandingSquare_LeftSubPosition                                ;81AC84;
    CLC                                                                  ;81AC88;
    ADC.L ExpandingSquare_LeftPositionSubVelocity                        ;81AC89;
    STA.L ExpandingSquare_LeftSubPosition                                ;81AC8D;
    LDA.L ExpandingSquare_LeftPosition                                   ;81AC91;
    ADC.L ExpandingSquare_LeftPositionVelocity                           ;81AC95;
    CMP.W #$0001                                                         ;81AC99;
    BPL +                                                                ;81AC9C;
    LDA.W #$0001                                                         ;81AC9E;

+   STA.L ExpandingSquare_LeftPosition                                   ;81ACA1;
    LDA.L ExpandingSquare_RightSubPosition                               ;81ACA5;
    CLC                                                                  ;81ACA9;
    ADC.L ExpandingSquare_RightSubVelocity                               ;81ACAA;
    STA.L ExpandingSquare_RightSubPosition                               ;81ACAE;
    LDA.L ExpandingSquare_RightPosition                                  ;81ACB2;
    ADC.L ExpandingSquare_RightVelocity                                  ;81ACB6;
    CMP.W #$0100                                                         ;81ACBA;
    BMI +                                                                ;81ACBD;
    LDA.W #$00FF                                                         ;81ACBF;

+   STA.L ExpandingSquare_RightPosition                                  ;81ACC2;
    LDA.L ExpandingSquare_TopSubPosition                                 ;81ACC6;
    CLC                                                                  ;81ACCA;
    ADC.L ExpandingSquare_TopSubVelocity                                 ;81ACCB;
    STA.L ExpandingSquare_TopSubPosition                                 ;81ACCF;
    LDA.L ExpandingSquare_TopPosition                                    ;81ACD3;
    ADC.L ExpandingSquare_TopVelocity                                    ;81ACD7;
    CMP.W #$0001                                                         ;81ACDB;
    BPL +                                                                ;81ACDE;
    LDA.W #$0001                                                         ;81ACE0;

+   STA.L ExpandingSquare_TopPosition                                    ;81ACE3;
    LDA.L ExpandingSquare_BottomSubPosition                              ;81ACE7;
    CLC                                                                  ;81ACEB;
    ADC.L ExpandingSquare_BottomSubVelocity                              ;81ACEC;
    STA.L ExpandingSquare_BottomSubPosition                              ;81ACF0;
    LDA.L ExpandingSquare_BottomPosition                                 ;81ACF4;
    ADC.L ExpandingSquare_BottomVelocity                                 ;81ACF8;
    CMP.W #$00E0                                                         ;81ACFC;
    BMI +                                                                ;81ACFF;
    LDA.W #$00E0                                                         ;81AD01;

+   STA.L ExpandingSquare_BottomPosition                                 ;81AD04;
    JSR.W Setup_FileSelectMap_ExpandingSquareTransition_HDMA             ;81AD08;
    REP #$20                                                             ;81AD0B;
    LDA.L ExpandingSquare_Timer                                          ;81AD0D;
    DEC                                                                  ;81AD11;
    STA.L ExpandingSquare_Timer                                          ;81AD12;
    RTS                                                                  ;81AD16;


;;; $AD17: File select map - index 9: area select map to room select map - initialise ;;;
FileSelectMap_Index9_AreaSelectMapToRoomSelectMap_Init:
    REP #$30                                                             ;81AD17;
    JSL.L LoadMirrorOfCurrentAreasMapExplored                            ;81AD19;
    JSL.L DrawRoomSelectMap                                              ;81AD1D;
    JSL.L LoadFromLoadStation                                            ;81AD21;
    JSL.L Disable_HDMAObjects                                            ;81AD25;
    JSL.L Wait_End_VBlank_Clear_HDMA                                     ;81AD29;
    PHB                                                                  ;81AD2D;
    SEP #$20                                                             ;81AD2E;
    LDA.B #$8F                                                           ;81AD30;
    PHA                                                                  ;81AD32;
    PLB                                                                  ;81AD33;
    LDX.W RoomPointer                                                    ;81AD34;
    LDA.W $0001,X                                                        ;81AD37;
    AND.B #$FF                                                           ;81AD3A;
    STA.W AreaIndex                                                      ;81AD3C;
    LDA.W $0002,X                                                        ;81AD3F;
    AND.B #$FF                                                           ;81AD42;
    STA.W RoomMapX                                                       ;81AD44;
    LDA.W $0003,X                                                        ;81AD47;
    AND.B #$FF                                                           ;81AD4A;
    STA.W RoomMapY                                                       ;81AD4C;
    PLB                                                                  ;81AD4F;
    REP #$20                                                             ;81AD50;
    JSL.L Setup_MapScrolling_for_FileSelectMap                           ;81AD52;
    LDA.W MapScroll_MinY                                                 ;81AD56;
    CLC                                                                  ;81AD59;
    ADC.W #$0018                                                         ;81AD5A;
    STA.W MapScroll_MinY                                                 ;81AD5D;
    LDA.W #$0018                                                         ;81AD60;
    STA.B DP_BG2YScroll                                                  ;81AD63;
    LDA.B DP_MainScreenLayers                                            ;81AD65;
    AND.W #$FFFB                                                         ;81AD67;
    STA.B DP_MainScreenLayers                                            ;81AD6A;
    INC.W PauseMenu_MenuIndex                                            ;81AD6C;
    STZ.W MapScrolling_Direction                                         ;81AD6F;
    STZ.W MapScrolling_SpeedIndex                                        ;81AD72;
    STZ.W PauseMenu_SamusPositionIndicatorAnimFrame                      ;81AD75;
    STZ.W PauseMenu_SamusPositionIndicatorAnimTimer                      ;81AD78;
    STZ.W PauseMenu_SamusPositionIndicatorAnimLoopCount                  ;81AD7B;
    RTS                                                                  ;81AD7E;


;;; $AD7F: File select map - index Ah: room select map ;;;
FileSelectMap_IndexA_RoomSelectMap:
    REP #$30                                                             ;81AD7F;
    JSL.L Draw_FileSelectMap_Icons                                       ;81AD81;
    JSR.W Handle_FileSelectMap_ScrollArrows                              ;81AD85;
    JSL.L MapScrolling                                                   ;81AD88;
    JSL.L Display_Map_Elevator_Destinations                              ;81AD8C;
if !DEBUG
    LDA.W Debug_Enable                                                   ;81AD90;
    BEQ +                                                                ;81AD93;
    LDA.B DP_Controller2New                                              ;81AD95;
    BIT.W #$2000                                                         ;81AD97;
    BNE .debug                                                           ;81AD9A;
endif

+   LDA.B DP_Controller1New                                              ;81AD9C;
    BIT.W #$8000                                                         ;81AD9E;
    BNE .exit                                                            ;81ADA1;
    BIT.W #$1080                                                         ;81ADA3;
    BEQ .earlyReturn                                                     ;81ADA6;
    INC.W PauseMenu_MenuIndex                                            ;81ADA8;
    LDA.W #$0038                                                         ;81ADAB;
    JSL.L QueueSound_Lib1_Max6                                           ;81ADAE;

  .earlyReturn:
    RTS                                                                  ;81ADB2;

  .exit:
    LDA.W PauseMenu_MenuIndex                                            ;81ADB3;
    CLC                                                                  ;81ADB6;
    ADC.W #$0005                                                         ;81ADB7;
    STA.W PauseMenu_MenuIndex                                            ;81ADBA;
    LDX.W #$0000                                                         ;81ADBD;
    LDA.W AreaIndex                                                      ;81ADC0;

  .loopMapAreaIndex:
    CMP.W FileSelectMapArea_IndexTable,X                                 ;81ADC3;
    BEQ +                                                                ;81ADC6;
    INX                                                                  ;81ADC8;
    INX                                                                  ;81ADC9;
    CPX.W #$000C                                                         ;81ADCA;
    BMI .loopMapAreaIndex                                                ;81ADCD;
    STZ.W FileSelectMapAreaIndex                                         ;81ADCF;
    RTS                                                                  ;81ADD2;

+   TXA                                                                  ;81ADD3;
    LSR                                                                  ;81ADD4;
    STA.W FileSelectMapAreaIndex                                         ;81ADD5;
    LDA.W #$003C                                                         ;81ADD8;
    JSL.L QueueSound_Lib1_Max6                                           ;81ADDB;
    RTS                                                                  ;81ADDF;

if !DEBUG
  .debug:
    LDA.W #$0038                                                         ;81ADE0;
    JSL.L QueueSound_Lib1_Max6                                           ;81ADE3;
    PHB                                                                  ;81ADE7;
    SEP #$20                                                             ;81ADE8;
    LDA.B #MapIcon_PositionTablePointers>>16                             ;81ADEA;
    STA.B DP_Temp02                                                      ;81ADEC;
    PHA                                                                  ;81ADEE;
    PLB                                                                  ;81ADEF;
    REP #$20                                                             ;81ADF0;
    LDA.W AreaIndex                                                      ;81ADF2;
    ASL                                                                  ;81ADF5;
    TAX                                                                  ;81ADF6;
    LDA.L SRAMMirror_UsedSaveStationsElevators,X                         ;81ADF7;
    STA.B DP_Temp18                                                      ;81ADFB;
    LDA.W LoadStationIndex                                               ;81ADFD;

  .loopIndex:
    LSR.B DP_Temp18                                                      ;81AE00;
    DEC                                                                  ;81AE02;
    BPL .loopIndex                                                       ;81AE03;
    LDA.W AreaIndex                                                      ;81AE05;
    ASL                                                                  ;81AE08;
    CLC                                                                  ;81AE09;
    ADC.W #MapIcon_PositionTablePointers_savePoints                      ;81AE0A;
    TAX                                                                  ;81AE0D;
    LDA.W $0000,X                                                        ;81AE0E;

  .crash:
    BEQ .crash                                                           ;81AE11;
    STA.B DP_Temp00                                                      ;81AE13;
    LDA.W LoadStationIndex                                               ;81AE15;
    ASL                                                                  ;81AE18;
    ASL                                                                  ;81AE19;
    TAY                                                                  ;81AE1A;
    LDA.B [DP_Temp00],Y                                                  ;81AE1B;
    STA.B DP_Temp12                                                      ;81AE1D;
    INY                                                                  ;81AE1F;
    INY                                                                  ;81AE20;
    LDA.B [DP_Temp00],Y                                                  ;81AE21;
    STA.B DP_Temp14                                                      ;81AE23;
    LDA.W LoadStationIndex                                               ;81AE25;
    CMP.W #$0010                                                         ;81AE28;
    BPL .debugSavePoints                                                 ;81AE2B;
    BRA .savesElevators                                                  ;81AE2D;

  .loopSavesElevators:
    LSR.B DP_Temp18                                                      ;81AE2F;
    BCC .savesElevators                                                  ;81AE31;
    LDA.W LoadStationIndex                                               ;81AE33;
    ASL                                                                  ;81AE36;
    ASL                                                                  ;81AE37;
    TAY                                                                  ;81AE38;
    LDA.B [DP_Temp00],Y                                                  ;81AE39;
    CMP.W #$FFFE                                                         ;81AE3B;
    BEQ .savesElevators                                                  ;81AE3E;
    CMP.W #$FFFF                                                         ;81AE40;
    BNE .found                                                           ;81AE43;

  .savesElevators:
    INC.W LoadStationIndex                                               ;81AE45;
    LDA.W LoadStationIndex                                               ;81AE48;
    CMP.W #$0010                                                         ;81AE4B;
    BMI .loopSavesElevators                                              ;81AE4E;

  .loopDebugSavePoints:
    LDA.W LoadStationIndex                                               ;81AE50;
    ASL                                                                  ;81AE53;
    ASL                                                                  ;81AE54;
    TAY                                                                  ;81AE55;
    LDA.B [DP_Temp00],Y                                                  ;81AE56;
    CMP.W #$FFFF                                                         ;81AE58;
    BEQ .finishedDebugSavePoints                                         ;81AE5B;
    CMP.W #$FFFE                                                         ;81AE5D;
    BNE .found                                                           ;81AE60;

  .debugSavePoints:
    INC.W LoadStationIndex                                               ;81AE62;
    BRA .loopDebugSavePoints                                             ;81AE65;

  .finishedDebugSavePoints:
    STZ.W LoadStationIndex                                               ;81AE67;
    LDA.W AreaIndex                                                      ;81AE6A;
    ASL                                                                  ;81AE6D;
    TAX                                                                  ;81AE6E;
    LDA.L SRAMMirror_UsedSaveStationsElevators,X                         ;81AE6F;
    STA.B DP_Temp18                                                      ;81AE73;
    BRA .loopSavesElevators                                              ;81AE75;

  .found:
    LDA.W LoadStationIndex                                               ;81AE77;
    ASL                                                                  ;81AE7A;
    ASL                                                                  ;81AE7B;
    TAY                                                                  ;81AE7C;
    LDA.B [DP_Temp00],Y                                                  ;81AE7D;
    CMP.B DP_BG1XScroll                                                  ;81AE7F;
    BMI +                                                                ;81AE81;
    SEC                                                                  ;81AE83;
    SBC.W #$0100                                                         ;81AE84;
    CMP.B DP_BG1XScroll                                                  ;81AE87;
    BMI .noXScroll                                                       ;81AE89;

+   LDA.B [DP_Temp00],Y                                                  ;81AE8B;
    SEC                                                                  ;81AE8D;
    SBC.B DP_Temp12                                                      ;81AE8E;
    CLC                                                                  ;81AE90;
    ADC.B DP_BG1XScroll                                                  ;81AE91;
    BPL +                                                                ;81AE93;
    LDA.W #$0000                                                         ;81AE95;
    BRA .storeXScroll                                                    ;81AE98;

+   CMP.W MapScroll_MinX                                                 ;81AE9A;
    BMI .storeXScroll                                                    ;81AE9D;
    LDA.W MapScroll_MinX                                                 ;81AE9F;

  .storeXScroll:
    STA.B DP_BG1XScroll                                                  ;81AEA2;

  .noXScroll:
    INY                                                                  ;81AEA4;
    INY                                                                  ;81AEA5;
    LDA.B [DP_Temp00],Y                                                  ;81AEA6;
    CMP.B DP_BG1YScroll                                                  ;81AEA8;
    BMI +                                                                ;81AEAA;
    SEC                                                                  ;81AEAC;
    SBC.W #$00A1                                                         ;81AEAD;
    CMP.B DP_BG1YScroll                                                  ;81AEB0;
    BMI .return                                                          ;81AEB2;

+   LDA.B [DP_Temp00],Y                                                  ;81AEB4;
    SEC                                                                  ;81AEB6;
    SBC.B DP_Temp14                                                      ;81AEB7;
    CLC                                                                  ;81AEB9;
    ADC.B DP_BG1YScroll                                                  ;81AEBA;
    CMP.W MapScroll_MinY                                                 ;81AEBC;
    BMI +                                                                ;81AEBF;
    LDA.W MapScroll_MinY                                                 ;81AEC1;

+   STA.B DP_BG1YScroll                                                  ;81AEC4;

  .return:
    PLB                                                                  ;81AEC6;
    RTS                                                                  ;81AEC7;
endif


if !FEATURE_KEEP_UNREFERENCED
;;; $AEC8: Unused. REP #$30 ;;;
UNUSED_REP30_81AEC8:
    REP #$30                                                             ;81AEC8;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $AECA: Handle file select map scroll arrows ;;;
Handle_FileSelectMap_ScrollArrows:
; Fork of $82:B934 (handle map scroll arrows) that changes the map screen boundaries
    PHP                                                                  ;81AECA;
    PHB                                                                  ;81AECB;
    PHK                                                                  ;81AECC;
    PLB                                                                  ;81AECD;
    REP #$20                                                             ;81AECE;
    LDA.W MapScroll_MinX                                                 ;81AED0;
    SEC                                                                  ;81AED3;
    SBC.W #$0018                                                         ;81AED4;
    CMP.B DP_BG1XScroll                                                  ;81AED7;
    BPL +                                                                ;81AED9;
    LDX.W #MapScroll_ArrowData_mapScrollDirection_left                   ;81AEDB;
    JSL.L Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction         ;81AEDE;

+   LDA.W MapScroll_MaxX                                                 ;81AEE2;
    CLC                                                                  ;81AEE5;
    ADC.W #$0018                                                         ;81AEE6;
    SEC                                                                  ;81AEE9;
    SBC.W #$0100                                                         ;81AEEA;
    CMP.B DP_BG1XScroll                                                  ;81AEED;
    BMI +                                                                ;81AEEF;
    LDX.W #MapScroll_ArrowData_mapScrollDirection_right                  ;81AEF1;
    JSL.L Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction         ;81AEF4;

+   LDA.W MapScroll_MinY                                                 ;81AEF8;
    SEC                                                                  ;81AEFB;
    SBC.W #$0040                                                         ;81AEFC;
    CMP.B DP_BG1YScroll                                                  ;81AEFF;
    BPL +                                                                ;81AF01;
    LDX.W #MapScroll_ArrowData_mapScrollDirection_up                     ;81AF03;
    JSL.L Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction         ;81AF06;

+   LDA.W MapScroll_MaxY                                                 ;81AF0A;
    SEC                                                                  ;81AF0D;
    SBC.W #$0091                                                         ;81AF0E;
    CMP.B DP_BG1YScroll                                                  ;81AF11;
    BMI .cancelScrollDown                                                ;81AF13;
    LDX.W #MapScroll_ArrowData_mapScrollDirection_down                   ;81AF15;
    JSL.L Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction         ;81AF18;

  .return:
    PLB                                                                  ;81AF1C;
    PLP                                                                  ;81AF1D;
    RTS                                                                  ;81AF1E;

  .cancelScrollDown:
    LDA.W MapScrolling_Direction                                         ;81AF1F;
    CMP.W MapScroll_ArrowData_mapScrollDirection_end                     ;81AF22;
    BNE .return                                                          ;81AF25;
    STZ.W MapScrolling_GearSwitchTimer                                   ;81AF27;
    STZ.W MapScrolling_Direction                                         ;81AF2A;
    STZ.W MapScrolling_SpeedIndex                                        ;81AF2D;
    BRA .return                                                          ;81AF30;


MapScroll_ArrowData_mapScrollDirection:
; Map scroll arrow data
;        ___________________________ X position
;       |      _____________________ Y position
;       |     |      _______________ Pause screen animation ID
;       |     |     |      _________ Necessary input
;       |     |     |     |      ___ Map scrolling direction
;       |     |     |     |     |
  .left:
    dw $0010,$0060,$0009,$0200,$0001                                     ;81AF32;
  .right:
    dw $00F0,$0060,$0008,$0100,$0002                                     ;81AF3C;
  .up:
    dw $0080,$0020,$0006,$0800,$0003                                     ;81AF46;
  .down:
    dw $0080,$00A0,$0007,$0400                                           ;81AF50;
  .end:
    dw                         $0004                                     ;81AF58;


;;; $AF5A: File select map - index Bh/Ch: room select map to loading game data - wait before fade out ;;;
FileSelectMap_IndexB_C_RoomSelectMapToLoadingGameData:
    JSL.L Draw_FileSelectMap_Icons                                       ;81AF5A;
    JSL.L Display_Map_Elevator_Destinations                              ;81AF5E;
    INC.W PauseMenu_MenuIndex                                            ;81AF62;
    RTS                                                                  ;81AF65;


;;; $AF66: File select map - index Dh: room select map to loading game data - fade out ;;;
FileSelectMap_IndexD_RoomSelectMapToAreaSelectMap_FadeOut:
    JSL.L Draw_FileSelectMap_Icons                                       ;81AF66;
    JSL.L Display_Map_Elevator_Destinations                              ;81AF6A;
    JSL.L HandleFadingOut                                                ;81AF6E;
    LDA.B DP_Brightness                                                  ;81AF72;
    AND.W #$000F                                                         ;81AF74;
    BNE .return                                                          ;81AF77;
    INC.W PauseMenu_MenuIndex                                            ;81AF79;
    LDA.W #$0020                                                         ;81AF7C;
    STA.W Enemy.XPosition                                                ;81AF7F;

  .return:
    RTS                                                                  ;81AF82;


;;; $AF83: File select map - index Eh: room select map to loading game data - wait ;;;
FileSelectMap_IndexE_RoomSelectMapToLoadingGameData_Wait:
    LDA.W Enemy.XPosition                                                ;81AF83;
    DEC                                                                  ;81AF86;
    STA.W Enemy.XPosition                                                ;81AF87;
    BNE .return                                                          ;81AF8A;
    JSL.L SetForceBlankAndWaitForNMI                                     ;81AF8C;
    INC.W GameState                                                      ;81AF90;
    STZ.W PauseMenu_MenuIndex                                            ;81AF93;

  .return:
    RTS                                                                  ;81AF96;


;;; $AF97: File select map - index Fh: room select map to area select map - clear BG1 tilemap ;;;
FileSelectMap_IndexF_RoomSelectMapToAreaSelectMap_ClearBG1:
    SEP #$20                                                             ;81AF97;
    LDA.B #$12                                                           ;81AF99;
    STA.B DP_MainScreenLayers                                            ;81AF9B;
    REP #$30                                                             ;81AF9D;
    LDA.W #$000F                                                         ;81AF9F;
    LDX.W #$07FE                                                         ;81AFA2;

  .loop:
    STA.L GameOptionsMenuTilemap,X                                       ;81AFA5;
    DEX                                                                  ;81AFA9;
    DEX                                                                  ;81AFAA;
    BPL .loop                                                            ;81AFAB;
    LDX.W VRAMWriteStack                                                 ;81AFAD;
    LDA.W #$0800                                                         ;81AFB0;
    STA.B VRAMWrite.size,X                                               ;81AFB3;
    LDA.W #GameOptionsMenuTilemap                                        ;81AFB5;
    STA.B VRAMWrite.src,X                                                ;81AFB8;
    LDA.W #GameOptionsMenuTilemap>>16                                    ;81AFBA;
    STA.B VRAMWrite.src+2,X                                              ;81AFBD;
    LDA.B DP_BG1TilemapAddrSize                                          ;81AFBF;
    AND.W #$00FC                                                         ;81AFC1;
    XBA                                                                  ;81AFC4;
    STA.B VRAMWrite.dest,X                                               ;81AFC5;
    TXA                                                                  ;81AFC7;
    CLC                                                                  ;81AFC8;
    ADC.W #$0007                                                         ;81AFC9;
    STA.W VRAMWriteStack                                                 ;81AFCC;
    INC.W PauseMenu_MenuIndex                                            ;81AFCF;
    RTS                                                                  ;81AFD2;


;;; $AFD3: File select map - index 10h: room select map to area select map - load palettes ;;;
FileSelectMap_Index10_RoomSelectMapToAreaSelectMap_LoadPal:
    REP #$30                                                             ;81AFD3;
    JSR.W LoadMenuPalettes                                               ;81AFD5;
    LDX.W #$0000                                                         ;81AFD8;

  .loop:
    PHX                                                                  ;81AFDB;
    JSR.W LoadInactiveAreaMapForegroundColors                            ;81AFDC;
    PLX                                                                  ;81AFDF;
    INX                                                                  ;81AFE0;
    CPX.W #$0006                                                         ;81AFE1;
    BMI .loop                                                            ;81AFE4;
    LDX.W AreaIndex                                                      ;81AFE6;
    JSR.W LoadActiveAreaMapForegroundColors                              ;81AFE9;
    LDY.W AreaIndex                                                      ;81AFEC;
    JSR.W Load_AreaSelect_BackgroundTilemap                              ;81AFEF;
    INC.W PauseMenu_MenuIndex                                            ;81AFF2;
    RTS                                                                  ;81AFF5;


;;; $AFF6: File select map - index 14h: prepare contracting square transition to area select map ;;;
FileSelectMap_Index14_PrepContractSquareTransToAreaSelect:
    SEP #$20                                                             ;81AFF6;
    LDA.B #$00                                                           ;81AFF8;
    STA.B DP_HDMAEnable                                                  ;81AFFA;
    REP #$30                                                             ;81AFFC;
    LDA.W #$003C                                                         ;81AFFE;
    JSL.L QueueSound_Lib1_Max6                                           ;81B001;
    LDA.W AreaIndex                                                      ;81B005;
    ASL                                                                  ;81B008;
    TAX                                                                  ;81B009;
    LDA.W RoomSelectMap_ExpandingSquare_Timers,X                         ;81B00A;
    SEC                                                                  ;81B00D;
    SBC.W #$000C                                                         ;81B00E;
    STA.L ExpandingSquare_Timer                                          ;81B011;
    TXA                                                                  ;81B015;
    ASL                                                                  ;81B016;
    ASL                                                                  ;81B017;
    ASL                                                                  ;81B018;
    TAX                                                                  ;81B019;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_leftSub,X             ;81B01A;
    STA.L ExpandingSquare_LeftPositionSubVelocity                        ;81B01D;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_left,X                ;81B021;
    STA.L ExpandingSquare_LeftPositionVelocity                           ;81B024;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_rightSub,X            ;81B028;
    STA.L ExpandingSquare_RightSubVelocity                               ;81B02B;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_right,X               ;81B02F;
    STA.L ExpandingSquare_RightVelocity                                  ;81B032;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_topSub,X              ;81B036;
    STA.L ExpandingSquare_TopSubVelocity                                 ;81B039;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_top,X                 ;81B03D;
    STA.L ExpandingSquare_TopVelocity                                    ;81B040;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_bottomSub,X           ;81B044;
    STA.L ExpandingSquare_BottomSubVelocity                              ;81B047;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_bottom,X              ;81B04B;
    STA.L ExpandingSquare_BottomVelocity                                 ;81B04E;
    LDA.W #$0008                                                         ;81B052;
    STA.L ExpandingSquare_LeftPosition                                   ;81B055;
    LDA.W #$00F8                                                         ;81B059;
    STA.L ExpandingSquare_RightPosition                                  ;81B05C;
    LDA.W #$0008                                                         ;81B060;
    STA.L ExpandingSquare_TopPosition                                    ;81B063;
    LDA.W #$00D8                                                         ;81B067;
    STA.L ExpandingSquare_BottomPosition                                 ;81B06A;
    LDA.W #$0000                                                         ;81B06E;
    STA.L ExpandingSquare_LeftSubPosition                                ;81B071;
    STA.L ExpandingSquare_RightSubPosition                               ;81B075;
    STA.L ExpandingSquare_TopSubPosition                                 ;81B079;
    STA.L ExpandingSquare_BottomSubPosition                              ;81B07D;
    JSR.W Setup_FileSelectMap_ExpandingSquareTransition_HDMA             ;81B081;
    INC.W PauseMenu_MenuIndex                                            ;81B084;
    SEP #$20                                                             ;81B087;
    LDA.B #$0C                                                           ;81B089;
    STA.B DP_HDMAEnable                                                  ;81B08B;
    STA.W $420C                                                          ;81B08D;
    LDA.B #$32                                                           ;81B090;
    STA.B DP_WindowMaskBG12                                              ;81B092;
    STA.W $2123                                                          ;81B094;
    LDA.B #$02                                                           ;81B097;
    STA.B DP_WindowMaskBG34                                              ;81B099;
    STA.W $2124                                                          ;81B09B;
    LDA.B #$30                                                           ;81B09E;
    STA.B DP_BGTilesAddr                                                 ;81B0A0;
    LDA.B #$22                                                           ;81B0A2;
    STA.B DP_WindowMaskSprite                                            ;81B0A4;
    LDA.B #$00                                                           ;81B0A6;
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+9        ;81B0A8;
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+9      ;81B0AC;
    LDA.B #$00                                                           ;81B0B0;
    STA.B DP_BG1YScroll                                                  ;81B0B2;
    STA.B DP_BG1YScroll+1                                                ;81B0B4;
    STA.B DP_BG1XScroll                                                  ;81B0B6;
    STA.B DP_BG1XScroll+1                                                ;81B0B8;
    RTS                                                                  ;81B0BA;


;;; $B0BB: File select map - index 15h: room select map to area select map - contracting square transition ;;;
FileSelectMap_Index15_RoomSelectMapToAreaSelectMap:
    REP #$30                                                             ;81B0BB;
    LDA.L ExpandingSquare_LeftSubPosition                                ;81B0BD;
    SEC                                                                  ;81B0C1;
    SBC.L ExpandingSquare_LeftPositionSubVelocity                        ;81B0C2;
    STA.L ExpandingSquare_LeftSubPosition                                ;81B0C6;
    LDA.L ExpandingSquare_LeftPosition                                   ;81B0CA;
    SBC.L ExpandingSquare_LeftPositionVelocity                           ;81B0CE;
    STA.L ExpandingSquare_LeftPosition                                   ;81B0D2;
    LDA.L ExpandingSquare_RightSubPosition                               ;81B0D6;
    SEC                                                                  ;81B0DA;
    SBC.L ExpandingSquare_RightSubVelocity                               ;81B0DB;
    STA.L ExpandingSquare_RightSubPosition                               ;81B0DF;
    LDA.L ExpandingSquare_RightPosition                                  ;81B0E3;
    SBC.L ExpandingSquare_RightVelocity                                  ;81B0E7;
    STA.L ExpandingSquare_RightPosition                                  ;81B0EB;
    LDA.L ExpandingSquare_TopSubPosition                                 ;81B0EF;
    SEC                                                                  ;81B0F3;
    SBC.L ExpandingSquare_TopSubVelocity                                 ;81B0F4;
    STA.L ExpandingSquare_TopSubPosition                                 ;81B0F8;
    LDA.L ExpandingSquare_TopPosition                                    ;81B0FC;
    SBC.L ExpandingSquare_TopVelocity                                    ;81B100;
    STA.L ExpandingSquare_TopPosition                                    ;81B104;
    LDA.L ExpandingSquare_BottomSubPosition                              ;81B108;
    SEC                                                                  ;81B10C;
    SBC.L ExpandingSquare_BottomSubVelocity                              ;81B10D;
    STA.L ExpandingSquare_BottomSubPosition                              ;81B111;
    LDA.L ExpandingSquare_BottomPosition                                 ;81B115;
    SBC.L ExpandingSquare_BottomVelocity                                 ;81B119;
    STA.L ExpandingSquare_BottomPosition                                 ;81B11D;
    JSR.W Setup_FileSelectMap_ExpandingSquareTransition_HDMA             ;81B121;
    REP #$20                                                             ;81B124;
    JSR.W DrawAreaSelectMapLabels                                        ;81B126;
    LDA.L ExpandingSquare_Timer                                          ;81B129;
    DEC                                                                  ;81B12D;
    STA.L ExpandingSquare_Timer                                          ;81B12E;
    BPL .return                                                          ;81B132;
    LDA.W PauseMenu_MenuIndex                                            ;81B134;
    SEC                                                                  ;81B137;
    SBC.W #$000F                                                         ;81B138;
    STA.W PauseMenu_MenuIndex                                            ;81B13B;
    SEP #$20                                                             ;81B13E;
    LDA.B #$11                                                           ;81B140;
    STA.B DP_MainScreenLayers                                            ;81B142;
    LDA.B #$00                                                           ;81B144;
    STA.B DP_WindowAreaMainScreen                                        ;81B146;
    STA.B DP_WindowAreaSubScreen                                         ;81B148;

  .return:
    RTS                                                                  ;81B14A;


;;; $B14B: Tilemap - room select map controls ;;;
Tilemap_RoomSelectMap_Controls:
; First word is skipped
; '                                '
; '                                '
; '   <^MAP     AA       BB        '
; '   v>SCROLL  AAStart  BBCancel  '
; '                                '
; '                                '
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B14B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B15B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B16B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B17B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B18B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B19B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B1AB;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B1BB;
    dw $2801,$2801,$2801,$28B6,$28B7,$283C,$2830,$283F                   ;81B1CB;
    dw $2801,$2801,$2801,$2801,$2801,$2850,$6850,$2801                   ;81B1DB;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2851,$2852                   ;81B1EB;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B1FB;
    dw $2801,$2801,$2801,$28C6,$28C7,$2842,$2832,$2841                   ;81B20B;
    dw $283E,$283B,$283B,$2801,$2801,$2860,$6860,$2842                   ;81B21B;
    dw $2843,$2830,$2841,$2843,$2801,$2801,$2861,$2862                   ;81B22B;
    dw $2832,$2830,$283D,$2832,$2834,$283B,$2801,$2801                   ;81B23B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B24B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B25B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B26B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B27B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B28B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B29B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B2AB;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B2BB;


;;; $B2CB: New save file ;;;
NewSaveFile:
    REP #$30                                                             ;81B2CB;
    LDA.W #$0063                                                         ;81B2CD;
    STA.W MaxEnergy                                                      ;81B2D0;
    STA.W Energy                                                         ;81B2D3;
    LDA.W #$0000                                                         ;81B2D6;
    STA.W MaxMissiles                                                    ;81B2D9;
    STA.W Missiles                                                       ;81B2DC;
    LDA.W #$0000                                                         ;81B2DF;
    STA.W MaxSuperMissiles                                               ;81B2E2;
    STA.W SuperMissiles                                                  ;81B2E5;
    LDA.W #$0000                                                         ;81B2E8;
    STA.W MaxPowerBombs                                                  ;81B2EB;
    STA.W PowerBombs                                                     ;81B2EE;
    STZ.W SelectedHUDItem                                                ;81B2F1;
    STZ.W CollectedBeams                                                 ;81B2F4;
    STZ.W EquippedBeams                                                  ;81B2F7;
    STZ.W CollectedItems                                                 ;81B2FA;
    STZ.W EquippedItems                                                  ;81B2FD;
    STZ.W ReserveTankMode                                                ;81B300;
    STZ.W MaxReserveEnergy                                               ;81B303;
    STZ.W ReserveEnergy                                                  ;81B306;
    STZ.W ReserveMissiles                                                ;81B309;
    LDA.W #$0800                                                         ;81B30C;
    STA.W UpBinding                                                      ;81B30F;
    LDA.W #$0400                                                         ;81B312;
    STA.W DownBinding                                                    ;81B315;
    LDA.W #$0200                                                         ;81B318;
    STA.W LeftBinding                                                    ;81B31B;
    LDA.W #$0100                                                         ;81B31E;
    STA.W RightBinding                                                   ;81B321;
    LDA.W #$0080                                                         ;81B324;
    STA.W JumpBinding                                                    ;81B327;
    LDA.W #$8000                                                         ;81B32A;
    STA.W DashBinding                                                    ;81B32D;
    LDA.W #$0040                                                         ;81B330;
    STA.W ShotBinding                                                    ;81B333;
    LDA.W #$4000                                                         ;81B336;
    STA.W ItemCancelBinding                                              ;81B339;
    LDA.W #$2000                                                         ;81B33C;
    STA.W ItemSelectBinding                                              ;81B33F;
    LDA.W #$0010                                                         ;81B342;
    STA.W AimUpBinding                                                   ;81B345;
    LDA.W #$0020                                                         ;81B348;
    STA.W AimDownBinding                                                 ;81B34B;
    STZ.W IGTFrames                                                      ;81B34E;
    STZ.W IGTSeconds                                                     ;81B351;
    STZ.W IGTMinutes                                                     ;81B354;
    STZ.W IGTHours                                                       ;81B357;
    STZ.W AltText                                                        ;81B35A;
    STZ.W Moonwalk                                                       ;81B35D;
    STZ.W IconCancel                                                     ;81B360;
    LDA.W #$0001                                                         ;81B363;
    STA.W SamusPlacementMode                                             ;81B366;
    STA.W neverRead09E8                                                  ;81B369;
    LDX.W #$0000                                                         ;81B36C;
    LDA.W #$0000                                                         ;81B36F;

  .loopClearEvents:
    STA.L SRAMMirror_ChozeBlockDestroyed,X                               ;81B372;
    STA.L SRAMMirror_Items,X                                             ;81B376;
    STA.L SRAMMirror_Items,X                                             ;81B37A; >.<
    STA.L SRAMMirror_Doors,X                                             ;81B37E;
    STA.L unusedD8F0,X                                                   ;81B382;
    STA.L SRAMMirror_MapStations,X                                       ;81B386;
    STA.L SRAMMirror_UsedSaveStationsElevators,X                         ;81B38A;
    STA.L SRAMMirror_UsedSaveStationsElevators+8,X                       ;81B38E;
    INX                                                                  ;81B392;
    INX                                                                  ;81B393;
    CPX.W #$0008                                                         ;81B394;
    BMI .loopClearEvents                                                 ;81B397;
    LDA.W #$0000                                                         ;81B399;

  .loopClearEventsAgain:
    STA.L SRAMMirror_ChozeBlockDestroyed,X                               ;81B39C;
    STA.L SRAMMirror_Items,X                                             ;81B3A0;
    STA.L SRAMMirror_Items,X                                             ;81B3A4; >.<
    STA.L SRAMMirror_Doors,X                                             ;81B3A8;
    INX                                                                  ;81B3AC;
    INX                                                                  ;81B3AD;
    CPX.W #$0040                                                         ;81B3AE;
    BMI .loopClearEventsAgain                                            ;81B3B1;
    LDX.W #$0000                                                         ;81B3B3;
    LDA.W #$0000                                                         ;81B3B6;

  .loopClearMapData:
    STA.L ExploredMapTiles,X                                             ;81B3B9;
    INX                                                                  ;81B3BD;
    INX                                                                  ;81B3BE;
    CPX.W #$0700                                                         ;81B3BF;
    BMI .loopClearMapData                                                ;81B3C2;
    RTS                                                                  ;81B3C4;


;;; $B3C5: Clear rest of menu tilemap row ;;;
ClearResetOfMenuTilemapRow:
;; Parameters:
;;     X: Menu tilemap index
    TXA                                                                  ;81B3C5;
    AND.W #$003F                                                         ;81B3C6;
    LSR                                                                  ;81B3C9;
    SEC                                                                  ;81B3CA;
    SBC.W #$0020                                                         ;81B3CB;
    EOR.W #$FFFF                                                         ;81B3CE;
    INC                                                                  ;81B3D1;
    STA.B DP_Temp12                                                      ;81B3D2;
    LDA.W #$000F                                                         ;81B3D4;

  .loop:
    STA.L MenuTilemap,X                                                  ;81B3D7;
    INX                                                                  ;81B3DB;
    INX                                                                  ;81B3DC;
    DEC.B DP_Temp12                                                      ;81B3DD;
    BNE .loop                                                            ;81B3DF;
    RTS                                                                  ;81B3E1;


;;; $B3E2: Load menu tilemap [Y] to ([X] / 2 % 20h, [X] / 40h) ;;;
Load_Tilemap_in_Y_to_X_Coordinates:
;; Parameters:
;;     X: Destination tilemap index
;;     Y: Source tilemap pointer

; def f(i):
;     formatValue = lambda v: f'{v:X}' + ('h' if v >= 0xA else '')
;     print(f'{formatValue(i // 2 % 0x20)}, {formatValue(i // 0x40)}')
    PHX                                                                  ;81B3E2;

  .loop:
    LDA.W $0000,Y                                                        ;81B3E3;
    CMP.W #$FFFE                                                         ;81B3E6;
    BEQ +                                                                ;81B3E9;
    CMP.W #$FFFF                                                         ;81B3EB;
    BEQ .return                                                          ;81B3EE;
    ORA.W Enemy.palette                                                  ;81B3F0;
    STA.L MenuTilemap,X                                                  ;81B3F3;
    INX                                                                  ;81B3F7;
    INX                                                                  ;81B3F8;
    INY                                                                  ;81B3F9;
    INY                                                                  ;81B3FA;
    BRA .loop                                                            ;81B3FB;

+   INY                                                                  ;81B3FD;
    INY                                                                  ;81B3FE;
    PLA                                                                  ;81B3FF;
    CLC                                                                  ;81B400;
    ADC.W #$0040                                                         ;81B401;
    TAX                                                                  ;81B404;
    PHA                                                                  ;81B405;
    BRA .loop                                                            ;81B406;

  .return:
    PLX                                                                  ;81B408;
    RTS                                                                  ;81B409;


;;; $B40A: File select tilemaps ;;;
Tilemap_FileSelect:
  .SamusData:
; SAMUS DATA
    dw $202B,$200A,$2026,$202D,$202B,$200F,$200D,$200A,$202C,$200A,$FFFE ;81B40A;
    dw $203B,$201A,$2036,$2010,$203B,$200F,$201D,$201A,$2011,$201A,$FFFF ;81B420;

  .SamusA:
; SAMUS A
    dw $202B,$200A,$2026,$202D,$202B,$200F,$200A,$FFFE                   ;81B436;
    dw $203B,$201A,$2036,$2010,$203B,$200F,$201A,$FFFF                   ;81B446;

  .SamusB:
; SAMUS B
    dw $202B,$200A,$2026,$202D,$202B,$200F,$200B,$FFFE                   ;81B456;
    dw $203B,$201A,$2036,$2010,$203B,$200F,$201B,$FFFF                   ;81B466;

  .SamusC:
; SAMUS C
    dw $202B,$200A,$2026,$202D,$202B,$200F,$200C,$FFFE                   ;81B476;
    dw $203B,$201A,$2036,$2010,$203B,$200F,$201C,$FFFF                   ;81B486;

  .energy:
; ENERGY
    dw $209D,$209E,$209F,$20CC,$FFFF                                     ;81B496;

  .time:
; TIME
    dw $20AD,$20AE,$20AF,$FFFF                                           ;81B4A0;

  .colon:
; :
    dw $208C,$FFFF                                                       ;81B4A8;

  .noData:
; NO DATA
    dw $000F,$2077,$2078,$200F,$206D,$206A,$207D,$206A                   ;81B4AC;
    dw $200F,$200F,$200F,$FFFF                                           ;81B4BC;

  .dataCopy:
; DATA COPY
    dw $206D,$206A,$207D,$206A,$200F,$206C,$2078,$2079                   ;81B4C4;
    dw $2082,$FFFF                                                       ;81B4D4;

  .dataClear:
; DATA CLEAR
    dw $206D,$206A,$207D,$206A,$200F,$206C,$2075,$206E                   ;81B4D8;
    dw $206A,$207B,$FFFF                                                 ;81B4E8;

  .exit:
; EXIT
    dw $206E,$2081,$2072,$207D,$FFFF                                     ;81B4EE;

  .dataCopyMode:
; DATA COPY MODE
    dw $000D,$200A,$202C,$200A,$200F,$200C,$2000,$200D                   ;81B4F8;
    dw $2041,$200F,$2026,$2000,$200D,$200E,$FFFE,$201D                   ;81B508;
    dw $201A,$2011,$201A,$200F,$201C,$2010,$2038,$2017                   ;81B518;
    dw $200F,$2036,$2010,$201D,$201E,$FFFF                               ;81B528;

  .dataClearMode:
; DATA CLEAR MODE
    dw $000D,$000A,$002C,$000A,$000F,$000C,$0025,$000E                   ;81B534;
    dw $000A,$000D,$000F,$0026,$0000,$000D,$000E,$FFFE                   ;81B544;
    dw $001D,$001A,$0011,$001A,$000F,$001C,$0035,$001E                   ;81B554;
    dw $001A,$003A,$000F,$0036,$0010,$001D,$001E,$FFFF                   ;81B564;

  .copyWhichData:
; COPY WHICH DATA?
    dw $206C,$2078,$2079,$2082,$200F,$2080,$2071,$2072                   ;81B574;
    dw $206C,$2071,$200F,$206D,$206A,$207D,$206A,$2085                   ;81B584;
    dw $FFFF                                                             ;81B594;

  .copySamusToWhere:
; COPY (SAMUS  ) TO WHERE?
    dw $206C,$2078,$2079,$2082,$200F,$208A,$207C,$206A                   ;81B596;
    dw $2076,$207E,$207C,$200F,$200F,$208B,$200F,$207D                   ;81B5A6;
    dw $2078,$200F,$2080,$2071,$206E,$207B,$206E,$2085                   ;81B5B6;
    dw $FFFF                                                             ;81B5C6;

  .copySamusToSamus:
; COPY (SAMUS  ) TO (SAMUS  ).
    dw $206C,$2078,$2079,$2082,$200F,$208A,$207C,$206A                   ;81B5C8;
    dw $2076,$207E,$207C,$200F,$200F,$208B,$200F,$207D                   ;81B5D8;
    dw $2078,$200F,$208A,$207C,$206A,$2076,$207E,$207C                   ;81B5E8;
    dw $200F,$200F,$208B,$2088,$FFFF                                     ;81B5F8;

  .isThisOK:
; IS THIS OK?
    dw $2072,$207C,$200F,$207D,$2071,$2072,$207C,$200F                   ;81B602;
    dw $2078,$2074,$2085,$FFFF                                           ;81B612;

  .yes:
; YES
    dw $2041,$200E,$202B,$FFFE                                           ;81B61A;
    dw $2017,$201E,$203B,$FFFF

  .no:
; N O
    dw $2027,$200F,$2000,$FFFE                                           ;81B62A;
    dw $2037,$200F,$2010,$FFFF

  .copyCompleted:
; COPY COMPLETED.
    dw $206C,$2078,$2079,$2082,$200F,$206C,$2078,$2076                   ;81B63A;
    dw $2079,$2075,$206E,$207D,$206E,$206D,$2088,$FFFF                   ;81B64A;

  .clearWhichData:
;        CLEAR WHICH DATA?
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$006C                   ;81B65A;
    dw $0075,$006E,$006A,$007B,$000F,$0080,$0071,$0072                   ;81B66A;
    dw $006C,$0071,$000F,$006D,$006A,$007D,$006A,$0085                   ;81B67A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$FFFF                   ;81B68A;

  .clearSamusA:
;         CLEAR (SAMUS A).
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81B69A;
    dw $006C,$0075,$006E,$006A,$007B,$000F,$008A,$007C                   ;81B6AA;
    dw $006A,$0076,$007E,$007C,$000F,$006A,$008B,$0088                   ;81B6BA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$FFFF                   ;81B6CA;

  .dataCleared:
;         DATA CLEARED...
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81B6DA;
    dw $006D,$006A,$007D,$006A,$000F,$006C,$0075,$006E                   ;81B6EA;
    dw $006A,$007B,$006E,$006D,$0088,$0088,$0088,$000F                   ;81B6FA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$FFFF                   ;81B70A;


;;; $B71A: Area select foreground tilemap ;;;
Tilemap_AreaSelect_Foreground:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81B71A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81B72A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81B73A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81B74A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81B75A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81B76A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81B77A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81B78A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81B79A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81B7AA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81B7BA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81B7CA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$15AD,$15AE                   ;81B7DA;
    dw $55AD,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81B7EA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81B7FA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81B80A;
    dw $000F,$000F,$000F,$000F,$15AD,$15AE,$95CC,$15BC                   ;81B81A;
    dw $15D5,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81B82A;
    dw $15AD,$15AE,$15DA,$15A8,$55A7,$000F,$000F,$000F                   ;81B83A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81B84A;
    dw $000F,$000F,$000F,$000F,$15BB,$15BC,$15D5,$15C8                   ;81B85A;
    dw $15DB,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81B86A;
    dw $15BB,$15BC,$15D5,$15B6,$15B7,$000F,$1DA1,$1DA2                   ;81B87A;
    dw $5DA1,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81B88A;
    dw $000F,$000F,$000F,$000F,$15DC,$15C8,$15CF,$15A8                   ;81B89A;
    dw $55A7,$000F,$15A7,$15A8,$55A7,$000F,$15A7,$15A8                   ;81B8AA;
    dw $55CB,$15AE,$55CA,$15A8,$55AA,$1DA2,$9DA6,$1DB0                   ;81B8BA;
    dw $1DD4,$1DAE,$5DAD,$000F,$000F,$000F,$000F,$000F                   ;81B8CA;
    dw $000F,$000F,$000F,$000F,$55D0,$55A8,$95AC,$15B6                   ;81B8DA;
    dw $15AC,$15A8,$15D3,$15BC,$55D3,$15A8,$15D3,$15AE                   ;81B8EA;
    dw $95CC,$15BC,$15D5,$15B6,$15B7,$1DB0,$1DA6,$1DA2                   ;81B8FA;
    dw $1DBB,$1DBC,$1DD5,$1DA2,$5DA1,$000F,$000F,$000F                   ;81B90A;
    dw $000F,$000F,$000F,$000F,$15B5,$15B6,$15AC,$15A8                   ;81B91A;
    dw $15D3,$15AE,$15CC,$15AE,$95CC,$15AE,$95CC,$15BC                   ;81B92A;
    dw $15D5,$15C8,$15CF,$15A8,$55AA,$1DA2,$9DA6,$1DB0                   ;81B93A;
    dw $1DDC,$1DC8,$1DDD,$1DB0,$DDA4,$000F,$000F,$000F                   ;81B94A;
    dw $000F,$000F,$000F,$000F,$15C2,$15C3,$15B5,$15B6                   ;81B95A;
    dw $15BB,$15BC,$15BB,$15BC,$15D5,$15BC,$15D5,$15C8                   ;81B96A;
    dw $15CF,$15A8,$55AC,$15B6,$15B7,$1DB0,$1DA6,$1DA2                   ;81B97A;
    dw $1DE6,$1DC8,$1DB4,$1DA2,$5DA4,$000F,$000F,$000F                   ;81B98A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$15C2,$15C3                   ;81B99A;
    dw $15DC,$15C8,$15DC,$15C8,$15DD,$15C8,$15CF,$15A8                   ;81B9AA;
    dw $55AC,$15B6,$15AC,$15A8,$55AA,$1DA2,$9DA6,$1DB0                   ;81B9BA;
    dw $1DA6,$1DA2,$9DA6,$1DA2,$DDA4,$000F,$000F,$000F                   ;81B9CA;
    dw $000F,$000F,$19AD,$19AE,$59AD,$000F,$000F,$000F                   ;81B9DA;
    dw $15C7,$15C8,$15DC,$15C8,$15CF,$15A8,$55AC,$15B6                   ;81B9EA;
    dw $15B7,$15C3,$15B5,$15B6,$15B7,$1DB0,$1DA6,$1DA2                   ;81B9FA;
    dw $9DA6,$1DA2,$DDA4,$1DBE,$1DBF,$000F,$000F,$000F                   ;81BA0A;
    dw $000F,$000F,$19BB,$19BC,$19CC,$19AE,$59AD,$000F                   ;81BA1A;
    dw $000F,$000F,$15C7,$15C8,$15B5,$15B6,$15B7,$15C3                   ;81BA2A;
    dw $15C4,$000F,$15C2,$15C3,$15CD,$1DA2,$9DA6,$1DA2                   ;81BA3A;
    dw $DDA4,$1DBE,$1DBF,$000F,$000F,$000F,$000F,$000F                   ;81BA4A;
    dw $000F,$000F,$19C7,$19C8,$19BB,$19BC,$19D5,$000F                   ;81BA5A;
    dw $000F,$000F,$000F,$000F,$15C2,$15C3,$15C4,$000F                   ;81BA6A;
    dw $000F,$000F,$000F,$000F,$15AF,$1DB0,$DDA4,$1DBE                   ;81BA7A;
    dw $1DBF,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BA8A;
    dw $000F,$000F,$000F,$000F,$59D7,$19AE,$59D8,$000F                   ;81BA9A;
    dw $19AD,$19AE,$59AD,$000F,$000F,$000F,$000F,$1DA7                   ;81BAAA;
    dw $1DA8,$5DA7,$000F,$000F,$15BD,$1DBE,$1DBF,$000F                   ;81BABA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BACA;
    dw $000F,$000F,$000F,$000F,$19BB,$19BC,$19CC,$19AE                   ;81BADA;
    dw $99CC,$19BC,$19CC,$19AE,$59AD,$000F,$000F,$1DB5                   ;81BAEA;
    dw $1DB6,$1DB7,$000F,$000F,$000F,$000F,$000F,$19A1                   ;81BAFA;
    dw $19A2,$59A1,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BB0A;
    dw $000F,$000F,$000F,$000F,$59D7,$19AE,$99CC,$19AE                   ;81BB1A;
    dw $19CC,$19AE,$99CC,$19BC,$19D5,$000F,$000F,$1DC2                   ;81BB2A;
    dw $1DC3,$1DC4,$000F,$000F,$000F,$19A1,$19A2,$99A6                   ;81BB3A;
    dw $19B0,$19A6,$19A2,$59A1,$000F,$000F,$000F,$000F                   ;81BB4A;
    dw $000F,$000F,$000F,$000F,$19BB,$19BC,$19D5,$19C8                   ;81BB5A;
    dw $19BB,$19BC,$19D5,$19C8,$D9D5,$19AE,$59AD,$000F                   ;81BB6A;
    dw $000F,$000F,$000F,$000F,$000F,$19AF,$19B0,$19A6                   ;81BB7A;
    dw $19A2,$99A6,$19B0,$D9A4,$000F,$000F,$000F,$000F                   ;81BB8A;
    dw $000F,$000F,$000F,$000F,$19C7,$19C8,$19DB,$000F                   ;81BB9A;
    dw $19DC,$19C8,$19DD,$19C8,$19BB,$19BC,$19D5,$000F                   ;81BBAA;
    dw $000F,$19A1,$19A2,$59A1,$000F,$59B2,$19A2,$99A6                   ;81BBBA;
    dw $19B0,$19A6,$19A2,$59A4,$000F,$000F,$000F,$000F                   ;81BBCA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BBDA;
    dw $19C7,$19C8,$19DB,$000F,$19C7,$19C8,$19DB,$000F                   ;81BBEA;
    dw $000F,$19AF,$19B0,$19A6,$19A2,$99A6,$19B0,$19A6                   ;81BBFA;
    dw $19A2,$99A6,$19A2,$D9A4,$000F,$000F,$000F,$000F                   ;81BC0A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BC1A;
    dw $000F,$000F,$19A7,$19A8,$59A7,$000F,$19A7,$19A8                   ;81BC2A;
    dw $59A7,$19BD,$19BE,$19AF,$19B0,$19A6,$19A2,$99A6                   ;81BC3A;
    dw $19A2,$D9A4,$19BE,$19C1,$000F,$000F,$000F,$000F                   ;81BC4A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BC5A;
    dw $19A7,$19A8,$99AC,$19B6,$19AC,$19A8,$99AC,$19B6                   ;81BC6A;
    dw $19B7,$000F,$000F,$59B2,$19A2,$99A6,$19A2,$D9A4                   ;81BC7A;
    dw $19BE,$19A3,$19BE,$19C1,$000F,$000F,$000F,$000F                   ;81BC8A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$19A7,$19A8                   ;81BC9A;
    dw $99AC,$19B6,$19AC,$19A8,$99AC,$19B6,$19AC,$19A8                   ;81BCAA;
    dw $59BA,$000F,$000F,$19AF,$19B0,$D9A4,$19BE,$19C1                   ;81BCBA;
    dw $000F,$19BD,$19BE,$19BF,$000F,$000F,$000F,$000F                   ;81BCCA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$19B5,$19B6                   ;81BCDA;
    dw $19AC,$19A8,$59AC,$19B6,$19AC,$19A8,$99AC,$19B6                   ;81BCEA;
    dw $19AC,$19A8,$59A7,$19C0,$19BE,$19C1,$19BE,$19BF                   ;81BCFA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BD0A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$19C2,$19C3                   ;81BD1A;
    dw $19B5,$19B6,$19B7,$19C3,$19B5,$19A8,$19B7,$19C3                   ;81BD2A;
    dw $19B5,$19A8,$19B7,$19BD,$19BE,$19BF,$000F,$000F                   ;81BD3A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BD4A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BD5A;
    dw $19C2,$19C3,$19C4,$000F,$19C2,$19C3,$19C4,$000F                   ;81BD6A;
    dw $19C2,$19C3,$19C4,$000F,$000F,$000F,$000F,$000F                   ;81BD7A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BD8A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BD9A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BDAA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BDBA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BDCA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BDDA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BDEA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BDFA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BE0A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BE1A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BE2A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BE3A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BE4A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BE5A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BE6A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BE7A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BE8A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BE9A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BEAA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BEBA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BECA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BEDA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BEEA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BEFA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BF0A;


;;; $BF1A: Area select background tilemap - Crateria ;;;
Tilemap_AreaSelect_Background_Crateria:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BF1A;
    dw $000F,$000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81BF2A;
    dw $5C51,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BF3A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BF4A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BF5A;
    dw $1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81BF6A;
    dw $1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F,$000F                   ;81BF7A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BF8A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$1C51,$1C4E                   ;81BF9A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81BFAA;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$000F,$000F                   ;81BFBA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81BFCA;
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C50,$000F                   ;81BFDA;
    dw $1C50,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81BFEA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F                   ;81BFFA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C00A;
    dw $000F,$000F,$1C51,$1C4E,$5C50,$000F,$000F,$000F                   ;81C01A;
    dw $000F,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81C02A;
    dw $5C50,$000F,$1C54,$000F,$9C51,$1C53,$1C4D,$1C4E                   ;81C03A;
    dw $5C51,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C04A;
    dw $1C51,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F                   ;81C05A;
    dw $1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81C06A;
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C4D,$1C53                   ;81C07A;
    dw $1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F,$000F                   ;81C08A;
    dw $9C4D,$1C53,$1C4D,$1C4E,$000F,$000F,$000F,$000F                   ;81C09A;
    dw $9C51,$1C53,$DC51,$000F,$9C51,$1C53,$DC51,$000F                   ;81C0AA;
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E                   ;81C0BA;
    dw $5C50,$000F,$1C50,$1C4E,$5C51,$000F,$000F,$000F                   ;81C0CA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F                   ;81C0DA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C0EA;
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C4D,$1C53                   ;81C0FA;
    dw $000F,$000F,$000F,$1C53,$1C4D,$1C4E,$5C51,$000F                   ;81C10A;
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$000F,$000F                   ;81C11A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C12A;
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E                   ;81C13A;
    dw $5C51,$000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81C14A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F                   ;81C15A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C16A;
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C4D,$1C53                   ;81C17A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81C18A;
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81C19A;
    dw $5C51,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C1AA;
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E                   ;81C1BA;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81C1CA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81C1DA;
    dw $1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F,$000F                   ;81C1EA;
    dw $1C51,$1C4E,$5C51,$000F,$1C51,$1C4E,$5C4D,$1C53                   ;81C1FA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81C20A;
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81C21A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$1C51,$1C4E                   ;81C22A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81C23A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81C24A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81C25A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81C26A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81C27A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81C28A;
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81C29A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81C2AA;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81C2BA;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81C2CA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81C2DA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81C2EA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81C2FA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81C30A;
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81C31A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81C32A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81C33A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F                   ;81C34A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81C35A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81C36A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81C37A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F                   ;81C38A;
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81C39A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81C3AA;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81C3BA;
    dw $5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F,$000F                   ;81C3CA;
    dw $000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81C3DA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81C3EA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81C3FA;
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C40A;
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E                   ;81C41A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81C42A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F                   ;81C43A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C44A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$9C51,$1C53                   ;81C45A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81C46A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F                   ;81C47A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C48A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C49A;
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81C4AA;
    dw $5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F,$000F                   ;81C4BA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C4CA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C4DA;
    dw $000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81C4EA;
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C4FA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C50A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C51A;
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$DC51,$000F                   ;81C52A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C53A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C54A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C55A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C56A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C57A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C58A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C59A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C5AA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C5BA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C5CA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C5DA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C5EA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C5FA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C60A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C61A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C62A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C63A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C64A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C65A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C66A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C67A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C68A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C69A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C6AA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C6BA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C6CA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C6DA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C6EA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C6FA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C70A;


;;; $C71A: Area select background tilemap - Brinstar ;;;
Tilemap_AreaSelect_Background_Brinstar:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C71A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C72A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C73A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C74A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C75A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C76A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C77A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C78A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C79A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C7AA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C7BA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C7CA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C7DA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C7EA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C7FA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C80A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C81A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C82A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C83A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C84A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C85A;
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C51,$000F                   ;81C86A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C87A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C88A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C89A;
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$DC51,$000F                   ;81C8AA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C8BA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C8CA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C8DA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C8EA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C8FA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C90A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C91A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C92A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C93A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C94A;
    dw $000F,$000F,$000F,$000F,$9C54,$000F,$000F,$000F                   ;81C95A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C96A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C97A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C98A;
    dw $000F,$000F,$1C51,$1C4E,$5C4D,$1C53,$DC50,$000F                   ;81C99A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C9AA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C9BA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C9CA;
    dw $1C51,$1C4E,$5C50,$000F,$1C50,$1C4E,$5C4D,$1C53                   ;81C9DA;
    dw $DC50,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C9EA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81C9FA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CA0A;
    dw $9C4D,$1C53,$000F,$000F,$000F,$000F,$1C50,$1C4E                   ;81CA1A;
    dw $5C4D,$1C53,$DC50,$000F,$000F,$000F,$000F,$000F                   ;81CA2A;
    dw $9C50,$1C53,$DC50,$000F,$000F,$000F,$000F,$000F                   ;81CA3A;
    dw $000F,$000F,$1C51,$1C4E,$5C51,$000F,$000F,$000F                   ;81CA4A;
    dw $1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F,$1C53                   ;81CA5A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC50,$000F,$9C50,$1C53                   ;81CA6A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F                   ;81CA7A;
    dw $1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F                   ;81CA8A;
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C52,$000F,$1C52,$1C4E                   ;81CA9A;
    dw $5C50,$000F,$1C50,$1C4E,$5C4D,$1C53,$1C4D,$5C55                   ;81CAAA;
    dw $000F,$9C51,$1C4D,$1C4E,$5C51,$000F,$1C51,$1C4E                   ;81CABA;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81CACA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F                   ;81CADA;
    dw $000F,$000F,$000F,$000F,$1C50,$1C4E,$5C4D,$000F                   ;81CAEA;
    dw $000F,$000F,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81CAFA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81CB0A;
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C52,$000F,$000F,$000F                   ;81CB1A;
    dw $000F,$000F,$000F,$000F,$000F,$1C53,$1C4D,$5C51                   ;81CB2A;
    dw $000F,$1C51,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81CB3A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81CB4A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F                   ;81CB5A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$9C51,$1C53                   ;81CB6A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81CB7A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81CB8A;
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$1C51,$1C4E                   ;81CB9A;
    dw $5C51,$000F,$1C51,$1C4E,$5C51,$000F,$1C51,$1C4E                   ;81CBAA;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81CBBA;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81CBCA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81CBDA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81CBEA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81CBFA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81CC0A;
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81CC1A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81CC2A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81CC3A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81CC4A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81CC5A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81CC6A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81CC7A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81CC8A;
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81CC9A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81CCAA;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81CCBA;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F                   ;81CCCA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81CCDA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81CCEA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81CCFA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F                   ;81CD0A;
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81CD1A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81CD2A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81CD3A;
    dw $5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F,$000F                   ;81CD4A;
    dw $000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81CD5A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81CD6A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81CD7A;
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CD8A;
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E                   ;81CD9A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81CDAA;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F                   ;81CDBA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CDCA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$9C51,$1C53                   ;81CDDA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81CDEA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F                   ;81CDFA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CE0A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CE1A;
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81CE2A;
    dw $5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F,$000F                   ;81CE3A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CE4A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CE5A;
    dw $000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81CE6A;
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CE7A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CE8A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CE9A;
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$DC51,$000F                   ;81CEAA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CEBA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CECA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CEDA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CEEA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CEFA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CF0A;


;;; $CF1A: Area select background tilemap - Norfair ;;;
Tilemap_AreaSelect_Background_Norfair:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CF1A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CF2A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CF3A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CF4A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CF5A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CF6A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CF7A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CF8A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CF9A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CFAA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CFBA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CFCA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CFDA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CFEA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81CFFA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D00A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D01A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D02A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D03A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D04A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D05A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D06A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D07A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D08A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D09A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D0AA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D0BA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D0CA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D0DA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D0EA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D0FA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D10A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D11A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D12A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D13A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D14A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D15A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D16A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D17A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D18A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D19A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D1AA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D1BA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D1CA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D1DA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D1EA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D1FA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D20A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D21A;
    dw $000F,$000F,$9C54,$000F,$000F,$000F,$000F,$000F                   ;81D22A;
    dw $9C54,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D23A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D24A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D25A;
    dw $1C51,$1C4E,$5C4D,$1C53,$DC50,$000F,$9C50,$1C53                   ;81D26A;
    dw $1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F,$000F                   ;81D27A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D28A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$9C57,$1C4E                   ;81D29A;
    dw $5C50,$000F,$1C50,$1C4E,$5C4D,$1C53,$1C4D,$5C55                   ;81D2AA;
    dw $000F,$9C51,$1C4D,$1C4E,$5C51,$000F,$000F,$000F                   ;81D2BA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D2CA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D2DA;
    dw $000F,$000F,$000F,$000F,$1C50,$1C4E,$5C4D,$000F                   ;81D2EA;
    dw $000F,$000F,$5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F                   ;81D2FA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D30A;
    dw $000F,$000F,$1C51,$1C4E,$5C52,$000F,$000F,$000F                   ;81D31A;
    dw $000F,$000F,$000F,$000F,$000F,$1C53,$1C4D,$5C51                   ;81D32A;
    dw $000F,$1C56,$1C4D,$1C4E,$5C4D,$DC51,$000F,$000F                   ;81D33A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D34A;
    dw $1C51,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F                   ;81D35A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$9C51,$1C53                   ;81D36A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$000F,$000F,$000F                   ;81D37A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D38A;
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$1C51,$1C4E                   ;81D39A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$1C4E                   ;81D3AA;
    dw $5C4D,$DC51,$000F,$1C55,$5C4D,$5C52,$000F,$000F                   ;81D3BA;
    dw $000F,$000F,$000F,$000F,$5C51,$000F,$000F,$000F                   ;81D3CA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81D3DA;
    dw $DC50,$000F,$9C58,$1C53,$DC50,$000F,$9C58,$1C53                   ;81D3EA;
    dw $1C4D,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D3FA;
    dw $000F,$000F,$000F,$000F,$1C4D,$1C4E,$5C51,$000F                   ;81D40A;
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81D41A;
    dw $5C4D,$1C53,$DC51,$000F,$9C51,$1C53,$DC51,$000F                   ;81D42A;
    dw $9C51,$5C51,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D43A;
    dw $000F,$000F,$000F,$000F,$5C4D,$1C53,$1C4D,$1C4E                   ;81D44A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81D45A;
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D46A;
    dw $1C51,$1C4E,$5C4D,$5C52,$000F,$000F,$000F,$000F                   ;81D47A;
    dw $000F,$000F,$000F,$000F,$1C4D,$1C4E,$5C4D,$1C53                   ;81D48A;
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F                   ;81D49A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D4AA;
    dw $9C51,$1C53,$1C4D,$000F,$000F,$000F,$000F,$000F                   ;81D4BA;
    dw $5C4D,$5C51,$000F,$1C56,$5C4D,$1C53,$1C4D,$1C4E                   ;81D4CA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F                   ;81D4DA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D4EA;
    dw $000F,$000F,$9C51,$000F,$000F,$000F,$000F,$1C56                   ;81D4FA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81D50A;
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81D51A;
    dw $5C51,$000F,$1C51,$1C4E,$5C51,$000F,$1C51,$1C4E                   ;81D52A;
    dw $5C51,$000F,$1C51,$5C51,$000F,$1C56,$1C4D,$1C4E                   ;81D53A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81D54A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81D55A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81D56A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81D57A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81D58A;
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81D59A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81D5AA;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81D5BA;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81D5CA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81D5DA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81D5EA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81D5FA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81D60A;
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81D61A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81D62A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81D63A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F                   ;81D64A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81D65A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81D66A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81D67A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F                   ;81D68A;
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81D69A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81D6AA;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81D6BA;
    dw $5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F,$000F                   ;81D6CA;
    dw $000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81D6DA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81D6EA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81D6FA;
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D70A;


;;; $D71A: Area select background tilemap - Wrecked Ship ;;;
Tilemap_AreaSelect_Background_WreckedShip:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D71A;
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C51,$000F                   ;81D72A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D73A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D74A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D75A;
    dw $000F,$000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81D76A;
    dw $5C51,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D77A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D78A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D79A;
    dw $1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81D7AA;
    dw $1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F,$000F                   ;81D7BA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D7CA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D7DA;
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81D7EA;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$000F,$000F                   ;81D7FA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D80A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D81A;
    dw $000F,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81D82A;
    dw $DC51,$000F,$1C54,$000F,$1C50,$1C4E,$5C51,$000F                   ;81D83A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D84A;
    dw $000F,$000F,$1C51,$1C4E,$000F,$000F,$000F,$000F                   ;81D85A;
    dw $9C50,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81D86A;
    dw $000F,$000F,$000F,$000F,$000F,$1C53,$DC51,$000F                   ;81D87A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D88A;
    dw $1C51,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F                   ;81D89A;
    dw $1C50,$1C4E,$5C50,$000F,$1C50,$1C4E,$5C50,$000F                   ;81D8AA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D8BA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D8CA;
    dw $9C4D,$1C53,$1C4D,$1C4E,$000F,$000F,$000F,$000F                   ;81D8DA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D8EA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D8FA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D90A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F                   ;81D91A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D92A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D93A;
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C51,$000F                   ;81D94A;
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$000F,$000F                   ;81D95A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D96A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D97A;
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E                   ;81D98A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F                   ;81D99A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D9AA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D9BA;
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C4D,$1C53                   ;81D9CA;
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81D9DA;
    dw $5C51,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D9EA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81D9FA;
    dw $000F,$000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81DA0A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81DA1A;
    dw $1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F,$000F                   ;81DA2A;
    dw $1C51,$1C4E,$5C51,$000F,$000F,$000F,$000F,$000F                   ;81DA3A;
    dw $1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81DA4A;
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81DA5A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$1C51,$1C4E                   ;81DA6A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$1C51,$1C4E                   ;81DA7A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81DA8A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81DA9A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81DAAA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81DABA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81DACA;
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81DADA;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81DAEA;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81DAFA;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81DB0A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81DB1A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81DB2A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81DB3A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81DB4A;
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81DB5A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81DB6A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81DB7A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F                   ;81DB8A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81DB9A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81DBAA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81DBBA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F                   ;81DBCA;
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81DBDA;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81DBEA;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81DBFA;
    dw $5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F,$000F                   ;81DC0A;
    dw $000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81DC1A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81DC2A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81DC3A;
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DC4A;
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E                   ;81DC5A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81DC6A;
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F                   ;81DC7A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DC8A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$9C51,$1C53                   ;81DC9A;
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81DCAA;
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F                   ;81DCBA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DCCA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DCDA;
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E                   ;81DCEA;
    dw $5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F,$000F                   ;81DCFA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DD0A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DD1A;
    dw $000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53                   ;81DD2A;
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DD3A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DD4A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DD5A;
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$DC51,$000F                   ;81DD6A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DD7A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DD8A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DD9A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DDAA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DDBA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DDCA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DDDA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DDEA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DDFA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DE0A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DE1A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DE2A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DE3A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DE4A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DE5A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DE6A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DE7A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DE8A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DE9A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DEAA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DEBA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DECA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DEDA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DEEA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DEFA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DF0A;


;;; $DF1A: Area select background tilemap - Maridia ;;;
Tilemap_AreaSelect_Background_Maridia:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DF1A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DF2A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DF3A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DF4A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DF5A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DF6A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DF7A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DF8A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DF9A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DFAA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DFBA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DFCA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DFDA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DFEA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81DFFA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E00A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E01A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E02A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E03A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E04A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E05A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E06A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E07A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E08A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E09A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E0AA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E0BA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E0CA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E0DA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E0EA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E0FA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E10A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E11A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E12A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E13A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E14A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E15A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E16A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E17A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E18A;
    dw $000F,$000F,$000F,$000F,$000F,$1C51,$5C51,$000F                   ;81E19A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E1AA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E1BA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E1CA;
    dw $000F,$000F,$000F,$000F,$9C51,$5C4D,$1C53,$1C4D                   ;81E1DA;
    dw $5C51,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E1EA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E1FA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E20A;
    dw $000F,$1C51,$000F,$000F,$000F,$000F,$1C55,$5C4D                   ;81E21A;
    dw $1C53,$1C4D,$5C51,$000F,$000F,$000F,$000F,$000F                   ;81E22A;
    dw $1C51,$1C4D,$5C51,$000F,$000F,$000F,$000F,$000F                   ;81E23A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E24A;
    dw $1C4E,$5C4D,$5C51,$000F,$000F,$000F,$000F,$1C4D                   ;81E25A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$5C51,$000F,$1C51,$1C4D                   ;81E26A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$000F,$000F,$000F,$000F                   ;81E27A;
    dw $1C51,$5C51,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E28A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$5C57,$000F,$1C52,$5C4D                   ;81E29A;
    dw $DC51,$000F,$1C55,$5C4D,$1C53,$1C4D,$1C4E,$5C50                   ;81E2AA;
    dw $000F,$1C50,$1C4E,$5C4D,$5C51,$000F,$1C51,$5C4D                   ;81E2BA;
    dw $1C53,$1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F                   ;81E2CA;
    dw $1C4E,$5C4D,$1C53,$1C4D,$000F,$000F,$000F,$000F                   ;81E2DA;
    dw $000F,$000F,$000F,$000F,$1C55,$5C4D,$1C53,$000F                   ;81E2EA;
    dw $000F,$000F,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51                   ;81E2FA;
    dw $000F,$9C51,$1C53,$1C4D,$1C4E,$5C51,$000F,$000F                   ;81E30A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$5C57,$000F,$000F,$000F                   ;81E31A;
    dw $000F,$000F,$000F,$000F,$000F,$1C4D,$1C4E,$5C51                   ;81E32A;
    dw $000F,$1C51,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F                   ;81E33A;
    dw $000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C51                   ;81E34A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$000F,$000F,$000F,$000F                   ;81E35A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$9C51,$1C4D                   ;81E36A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$000F                   ;81E37A;
    dw $000F,$000F,$000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D                   ;81E38A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$5C51,$000F,$1C56,$5C4D                   ;81E39A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$5C4D                   ;81E3AA;
    dw $1C53,$DC51,$000F,$9C51,$1C53,$DC51,$000F,$000F                   ;81E3BA;
    dw $000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D                   ;81E3CA;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81E3DA;
    dw $5C51,$000F,$1C56,$1C4D,$5C51,$000F,$1C56,$1C4D                   ;81E3EA;
    dw $1C4E,$5C51,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E3FA;
    dw $000F,$000F,$000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D                   ;81E40A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81E41A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81E42A;
    dw $1C53,$1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F                   ;81E43A;
    dw $000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81E44A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81E45A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81E46A;
    dw $1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F,$1C51                   ;81E47A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81E48A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81E49A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81E4AA;
    dw $1C53,$1C4D,$1C4E,$5C51,$000F,$1C51,$1C4E,$5C4D                   ;81E4BA;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81E4CA;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81E4DA;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81E4EA;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81E4FA;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51                   ;81E50A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81E51A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81E52A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81E53A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F                   ;81E54A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81E55A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81E56A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81E57A;
    dw $1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F                   ;81E58A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81E59A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81E5AA;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81E5BA;
    dw $1C53,$DC51,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E5CA;
    dw $000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81E5DA;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81E5EA;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51                   ;81E5FA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E60A;
    dw $000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D                   ;81E61A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81E62A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F                   ;81E63A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E64A;
    dw $000F,$000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D                   ;81E65A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81E66A;
    dw $1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F                   ;81E67A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E68A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$9C51                   ;81E69A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81E6AA;
    dw $1C53,$DC51,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E6BA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E6CA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E6DA;
    dw $000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51                   ;81E6EA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E6FA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E70A;


;;; $E71A: Area select background tilemap - Tourian ;;;
Tilemap_AreaSelect_Background_Tourian:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E71A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E72A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E73A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E74A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E75A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E76A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E77A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E78A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E79A;
    dw $000F,$000F,$000F,$1C51,$1C4E,$5C51,$000F,$000F                   ;81E7AA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E7BA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E7CA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E7DA;
    dw $000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51                   ;81E7EA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E7FA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E80A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E81A;
    dw $000F,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81E82A;
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E83A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E84A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E85A;
    dw $1C51,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81E86A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E87A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E88A;
    dw $000F,$000F,$000F,$1C51,$000F,$000F,$000F,$000F                   ;81E89A;
    dw $1C55,$5C4D,$DC51,$000F,$1C55,$5C4D,$DC51,$000F                   ;81E8AA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E8BA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E8CA;
    dw $000F,$1C51,$1C4E,$5C4D,$000F,$000F,$000F,$000F                   ;81E8DA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E8EA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E8FA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E90A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$000F,$000F,$000F,$000F                   ;81E91A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E92A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E93A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E94A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$5C51,$000F,$000F,$000F                   ;81E95A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E96A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E97A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E98A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$5C51,$000F                   ;81E99A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E9AA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E9BA;
    dw $000F,$000F,$000F,$000F,$000F,$5C51,$000F,$000F                   ;81E9CA;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81E9DA;
    dw $5C51,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E9EA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81E9FA;
    dw $000F,$000F,$000F,$000F,$1C51,$1C4D,$1C4E,$5C51                   ;81EA0A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81EA1A;
    dw $1C4E,$5C4D,$5C51,$000F,$000F,$000F,$000F,$000F                   ;81EA2A;
    dw $1C51,$5C4D,$5C51,$000F,$000F,$000F,$000F,$000F                   ;81EA3A;
    dw $000F,$000F,$1C51,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81EA4A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81EA5A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$5C51,$000F,$1C51,$5C4D                   ;81EA6A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$000F,$000F,$000F,$000F                   ;81EA7A;
    dw $1C51,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81EA8A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81EA9A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51                   ;81EAAA;
    dw $000F,$9C51,$1C53,$1C4D,$5C51,$000F,$1C51,$1C4D                   ;81EABA;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81EACA;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81EADA;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51                   ;81EAEA;
    dw $000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81EAFA;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81EB0A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81EB1A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81EB2A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81EB3A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81EB4A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81EB5A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81EB6A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81EB7A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81EB8A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81EB9A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81EBAA;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81EBBA;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51                   ;81EBCA;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81EBDA;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81EBEA;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81EBFA;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F                   ;81EC0A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81EC1A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81EC2A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81EC3A;
    dw $1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F                   ;81EC4A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81EC5A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81EC6A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81EC7A;
    dw $1C53,$DC51,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EC8A;
    dw $000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81EC9A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81ECAA;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51                   ;81ECBA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81ECCA;
    dw $000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D                   ;81ECDA;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81ECEA;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F                   ;81ECFA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81ED0A;
    dw $000F,$000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D                   ;81ED1A;
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D                   ;81ED2A;
    dw $1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F                   ;81ED3A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81ED4A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$9C51                   ;81ED5A;
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D                   ;81ED6A;
    dw $1C53,$DC51,$000F,$000F,$000F,$000F,$000F,$000F                   ;81ED7A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81ED8A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81ED9A;
    dw $000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51                   ;81EDAA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EDBA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EDCA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EDDA;
    dw $000F,$000F,$000F,$9C51,$1C53,$DC51,$000F,$000F                   ;81EDEA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EDFA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EE0A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EE1A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EE2A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EE3A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EE4A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EE5A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EE6A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EE7A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EE8A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EE9A;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EEAA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EEBA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EECA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EEDA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EEEA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EEFA;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81EF0A;

Freespace_Bank81_EF1A:                                                   ;81EF1A;
; $FE6 bytes


ORG $81FF00
;;; $FF00: Thanks Genji! ;;;
    db " Special thanks "
    db "       2        "
    db "  Genji Kubota  "
    db "       &        "
    db "all debug staff."
    db "                "

; Thanks to P.JBoy for the bank logs at https://patrickjohnston.org/bank/index.html
; This disassembly relied heavily on his work
; Created with https://github.com/IsoFrieze/DiztinGUIsh


Freespace_Bank81_FF60:
; $A0 bytes
