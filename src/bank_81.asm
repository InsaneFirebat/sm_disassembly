
org $818000


;;; $8000: Save to SRAM ;;;
SaveToSRAM:
;; Parameter:
;;     A: SRAM slot (0, 1 or 2)

; Almost returns carry clear
    PHP
    REP #$30
    PHB : PHX : PHY
    PEA.W SRAMMirror_Equipment>>8&$FF00 : PLB : PLB
    STZ.B DP_Temp14
    AND.W #$0003 : ASL : STA.B DP_Temp12
    LDY.W #$005E

  .loopSamus:
    LDA.W EquippedItems,Y : STA.W SRAMMirror_Equipment,Y
    DEY #2 : BPL .loopSamus
    LDX.W #$0000
    LDA.W AreaIndex : XBA : TAX
    LDY.W #$0000

  .loopMap:
    LDA.W MapTilesExplored,Y : STA.W ExploredMapTiles,X
    INY #2
    INX #2
    CPY.W #$0100 : BMI .loopMap
    JSR SaveMap
    LDA.W LoadStationIndex : STA.W SRAMMirror_SaveStationIndex
    LDA.W AreaIndex : STA.W SRAMMirror_AreaIndex
    LDX.B DP_Temp12
    LDA.L SaveSlotOffsets,X : TAX
    LDY.W #SRAMMirror_Equipment

  .loopToSRAM:
    LDA.W $0000,Y : STA.L $700000,X
    CLC : ADC.B DP_Temp14 : STA.B DP_Temp14
    INX #2
    INY #2 : CPY.W #SRAMMirror_End+1 : BNE .loopToSRAM
    LDX.B DP_Temp12
    LDA.B DP_Temp14 : STA.L SRAM_Slot0Checksum0,X : STA.L SRAM_Slot0Checksum1,X
    EOR.W #$FFFF : STA.L SRAM_Slot0Complement0,X : STA.L SRAM_Slot0Complement1,X
    PLY : PLX
    CLC
    PLB : PLP
    RTL


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
    REP #$30
    PHB : PHX : PHY
    PEA.W SRAMMirror_Equipment>>8&$FF00 : PLB : PLB
    STZ.B DP_Temp14
    AND.W #$0003 : ASL : STA.B DP_Temp12
    TAX
    LDA.L SaveSlotOffsets,X : TAX
    LDY.W #SRAMMirror_Equipment

  .loop:
    LDA.L SRAM_Slot0Checksum0,X : STA.W $0000,Y
    CLC : ADC.B DP_Temp14 : STA.B DP_Temp14
    INX #2
    INY #2 : CPY.W #SRAMMirror_End+1 : BNE .loop
    LDX.B DP_Temp12
    LDA.B DP_Temp14 : CMP.L SRAM_Slot0Checksum0,X : BNE .doubleCheck
    EOR.W #$FFFF : CMP.L SRAM_Slot0Complement0,X : BNE .doubleCheck
    BRA .success

  .doubleCheck:
    LDA.B DP_Temp14 : CMP.L SRAM_Slot0Checksum1,X : BNE .corrupt
    EOR.W #$FFFF : CMP.L SRAM_Slot0Complement1,X : BNE .corrupt

  .success:
    LDY.W #$005E

  .loopSuccess:
    LDA.W SRAMMirror_Equipment,Y : STA.W EquippedItems,Y
    DEY #2 : BPL .loopSuccess
    JSR LoadMap
    LDA.W SRAMMirror_SaveStationIndex : STA.W LoadStationIndex
    LDA.W SRAMMirror_AreaIndex : STA.W AreaIndex
    PLY : PLX
    CLC
    PLB
    RTL

  .corrupt:
    STZ.B DP_Temp14
    LDX.B DP_Temp12
    LDA.L SaveSlotOffsets,X : TAX
    LDY.W #SRAMMirror_Equipment
    LDA.W #$0000

  .loopCorrupt:
    STA.L SRAM_Slot0Checksum0,X
    CLC : ADC.B DP_Temp14 : STA.B DP_Temp14
    INX #2
    INY #2 : CPY.W #SRAMMirror_End+1 : BNE .loopCorrupt
    LDA.W #$0000 : STA.W LoadStationIndex : STA.W AreaIndex
    PLY : PLX
    SEC
    PLB
    RTL


;;; $812B: SRAM offsets for each save slot ;;;
SaveSlotOffsets:
    dw $0010,$066C,$0CC8

;;; $8131: Exported map data ;;;
SRAMMapData:
; Lists of offsets into explored map data ($7E:CD52 + (area index) * 100h) whose bytes are saved to SRAM
; Map data offsets of 80h+ are specifying the right half of the map (7Fh- are specifying the left half)
; Each byte is 8 map tiles, and the first row (offsets 0..3 and 80h..83h) is meaningless padding
  .size:
; Size of each exported map
    db $4A,$48,$4C,$12,$42,$15,$08

  .offset:
; Offset for each exported map
    db $00,$00,$4A,$00,$92,$00,$DE,$00,$F0,$00,$32,$01,$47,$01

  .crateria:
; Crateria map offset list
    db         $07
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
    db     $05
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
    db     $05
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
    db     $2D,$2E
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
    db             $07
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
    db         $26
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
    db     $2D
    db     $31
    db     $35
    db     $39
    db     $3D
    db     $41
    db     $45,$46
    db $00,$00,$00,$00,$00,$00,$00,$00

MapRoomPointers:
; Map offset list pointers. Indexed by area
    dw SRAMMapData_crateria
    dw SRAMMapData_brinstar
    dw SRAMMapData_norfair
    dw SRAMMapData_wreckedShip
    dw SRAMMapData_maridia
    dw SRAMMapData_tourian
    dw SRAMMapData_ceres


;;; $82E4: Load map ;;;
LoadMap:
; Doesn't load Ceres map, but does clear it
    PHB : PHP
    PHK : PLB
    REP #$30
    LDX.W #$0700
    LDA.W #$0000

  .loopTilesExplored:
    STA.L ExploredMapTiles,X
    DEX #2 : BPL .loopTilesExplored
    STZ.B DP_Temp16

  .loopArea:
    LDA.B DP_Temp16 : XBA : STA.B DP_Temp14
    LDX.B DP_Temp16
    LDA.W SRAMMapData_size,X : AND.W #$00FF : STA.B DP_Temp12
    LDA.B DP_Temp16 : ASL : TAX
    LDA.W MapRoomPointers,X : STA.B DP_Temp00
    LDA.W #SRAMMapData>>16 : STA.B DP_Temp02
    LDA.W SRAMMapData_offset,X : TAX
    LDA.W #ExploredMapTiles : STA.B DP_Temp03
    LDA.W #ExploredMapTiles>>16 : STA.B DP_Temp05

  .loopRoom:
    LDA.B (DP_Temp00) : AND.W #$00FF : CLC : ADC.B DP_Temp14 : TAY
    SEP #$20
    LDA.L SRAMMirror_MapDataCrateria,X : STA.B [DP_Temp03],Y
    REP #$20
    INC.B DP_Temp00
    INX
    DEC.B DP_Temp12 : BNE .loopRoom
    INC.B DP_Temp16
    LDA.B DP_Temp16 : CMP.W #$0006 : BMI .loopArea
    PLP : PLB
    RTS


;;; $834B: Save map ;;;
SaveMap:
; Doesn't save Ceres
    PHB : PHP
    PHK : PLB
    REP #$30
    STZ.B DP_Temp1A

  .loopAreas:
    LDX.B DP_Temp1A
    LDA.W SRAMMapData_size,X : AND.W #$00FF : STA.B DP_Temp16
    LDA.B DP_Temp1A : ASL : TAX
    LDA.W MapRoomPointers,X : STA.B DP_Temp00
    LDA.W SRAMMapData_offset,X : TAX
    LDA.B DP_Temp1A : XBA : STA.B DP_Temp18
    LDA.W #ExploredMapTiles : STA.B DP_Temp03
    LDA.W #ExploredMapTiles>>16 : STA.B DP_Temp05

  .loopRooms:
    LDA.B (DP_Temp00) : AND.W #$00FF : CLC : ADC.B DP_Temp18 : TAY
    SEP #$20
    LDA.B [DP_Temp03],Y : STA.L SRAMMirror_MapDataCrateria,X
    REP #$20
    INC.B DP_Temp00
    INX
    DEC.B DP_Temp16 : BNE .loopRooms
    INC.B DP_Temp1A
    LDA.B DP_Temp1A : CMP.W #$0006 : BMI .loopAreas
    PLP : PLB
    RTS


;;; $839F: Map of OAM index to high X position bit and size bit ;;;
MapOfOAMIndex:
  .highXPosBit:
    dw $0001
  .sizeBit:
    dw       $0002
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
    dw $0570
  .bitmask:
    dw       $0003
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
    PHX
    LDA.W $0000,Y : BNE +
    PLX
    RTL

  .gotoReturn:
    JMP .return

+   STA.B DP_Temp18
    INY #2
    LDA.W OAMStack : BIT.W #$FE00 : BNE .gotoReturn
    TAX
    CLC

  .loop:
    LDA.W $0000,Y : ADC.B DP_Temp14 : STA.W OAMLow,X
    AND.W #$0100 : BEQ .xHighClear
    LDA.W $0000,Y : BPL +
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp1C
    LDA.B (DP_Temp1C) : ORA.L MapOfOAMIndexToHighOAM_bitmask,X : STA.B (DP_Temp1C)
    JMP .merge

+   LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp1C
    LDA.B (DP_Temp1C) : ORA.L MapOfOAMIndex_highXPosBit,X : STA.B (DP_Temp1C)
    BRA .merge

  .xHighClear:
    LDA.W $0000,Y : BPL .merge
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp1C
    LDA.B (DP_Temp1C) : ORA.L MapOfOAMIndex_sizeBit,X : STA.B (DP_Temp1C)

  .merge:
    SEP #$20
    LDA.W $0002,Y : CLC : BMI +
    ADC.B DP_Temp12 : BCS .setOAMPos180h
    CMP.B #$E0 : BCC .onScreen
    BRA .setOAMPos180h

+   ADC.B DP_Temp12 : BCS .lessThanE0h
    CMP.B #$E0 : BCS .onScreen
    BRA .setOAMPos180h

  .lessThanE0h:
    CMP.B #$E0 : BCC .onScreen

  .setOAMPos180h:
    JSR OAMEntry_XPosition_180h
    LDA.B #$E0

  .onScreen:
    STA.W OAMLow+1,X
    REP #$21                                                             ; clear carry
    LDA.W $0003,Y : AND.W #$F1FF : ORA.B DP_Temp16 : STA.W OAMLow+2,X
    TXA : ADC.W #$0004 : BIT.W #$FE00 : BNE .return
    TAX
    TYA : ADC.W #$0005 : TAY
    DEC.B DP_Temp18 : BEQ +
    JMP .loop

+   STX.W OAMStack
    PLX
    RTL

  .return:
    STA.W OAMStack
    PLX
    RTL


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
    PHX
    LDA.W $0000,Y : BNE +
    PLX
    RTL

  .goto_return:
    JMP .return

+   STA.B DP_Temp18
    INY #2
    LDA.W OAMStack : BIT.W #$FE00 : BNE .goto_return
    TAX
    CLC

  .loop:
    LDA.W $0000,Y : ADC.B DP_Temp14 : STA.W OAMLow,X
    AND.W #$0100 : BEQ .xHighClear
    LDA.W $0000,Y : BPL +
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp1C
    LDA.B (DP_Temp1C) : ORA.L MapOfOAMIndexToHighOAM_bitmask,X : STA.B (DP_Temp1C)
    JMP .merge

+   LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp1C
    LDA.B (DP_Temp1C) : ORA.L MapOfOAMIndex_highXPosBit,X : STA.B (DP_Temp1C)
    BRA .merge

  .xHighClear:
    LDA.W $0000,Y : BPL .merge
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp1C
    LDA.B (DP_Temp1C) : ORA.L MapOfOAMIndex_sizeBit,X : STA.B (DP_Temp1C)

  .merge:
    SEP #$20
    LDA.W $0002,Y : CLC : BMI +
    ADC.B DP_Temp12 : BCS .onScreen
    CMP.B #$E0 : BCS .onScreen
    BRA .setOAMPos180h

+   ADC.B DP_Temp12 : BCS .lessThanE0h
    CMP.B #$E0 : BCC .onScreen
    BRA .setOAMPos180h

  .lessThanE0h:
    CMP.B #$E0 : BCS .onScreen

  .setOAMPos180h:
    JSR OAMEntry_XPosition_180h
    LDA.B #$E0

  .onScreen:
    STA.W OAMLow+1,X
    REP #$21                                                             ; clear carry
    LDA.W $0003,Y : AND.W #$F1FF : ORA.B DP_Temp16 : STA.W OAMLow+2,X
    TXA : ADC.W #$0004 : BIT.W #$FE00 : BNE .return
    TAX
    TYA : ADC.W #$0005 : TAY
    DEC.B DP_Temp18 : BEQ +
    JMP .loop

+   STX.W OAMStack
    PLX
    RTL

  .return:
    STA.W OAMStack
    PLX
    RTL


;;; $8907: OAM entry X position = 180h ;;;
OAMEntry_XPosition_180h:
;; Parameters:
;;     X: OAM entry index
    LDA.B #$80 : STA.W OAMLow,X
    REP #$20
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp1C
    LDA.B (DP_Temp1C) : ORA.L MapOfOAMIndex_highXPosBit,X : STA.B (DP_Temp1C)
    SEP #$20
    RTS


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
    PHB
    PEA.W MenuSpritemap_Pointers>>8&$FF00 : PLB : PLB
    STY.B DP_Temp12
    STX.B DP_Temp14
    ASL : TAX
    LDY.W MenuSpritemap_Pointers,X
    LDA.W $0000,Y : BEQ .return
    STA.B DP_Temp18
    INY #2
    LDX.W OAMStack
    CLC

  .loop:
    LDA.W $0000,Y : ADC.B DP_Temp14 : STA.W OAMLow,X
    AND.W #$0100 : BEQ .xHighClear
    LDA.W $0000,Y : BPL .preMerge
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp16
    LDA.B (DP_Temp16) : ORA.L MapOfOAMIndexToHighOAM_bitmask,X : STA.B (DP_Temp16)
    JMP .merge

  .preMerge:
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp16
    LDA.B (DP_Temp16) : ORA.L MapOfOAMIndex_highXPosBit,X : STA.B (DP_Temp16)
    JMP .merge

  .xHighClear:
    LDA.W $0000,Y : BPL .merge
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp16
    LDA.B (DP_Temp16) : ORA.L MapOfOAMIndex_sizeBit,X : STA.B (DP_Temp16)

  .merge:
    LDA.W $0002,Y : CLC : ADC.B DP_Temp12 : STA.W OAMLow+1,X
    LDA.W $0003,Y : AND.W #$F1FF : ORA.B DP_Temp03 : STA.W OAMLow+2,X
    TYA : CLC : ADC.W #$0005 : TAY
    TXA : CLC : ADC.W #$0004 : AND.W #$01FF : TAX
    DEC.B DP_Temp18 : BNE .loop
    STX.W OAMStack

  .return:
    PLB
    RTL


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
    PHB
    PEA.W SamusSpritemapTable>>8&$FF00 : PLB : PLB
    STY.B DP_Temp12
    STX.B DP_Temp14
    ASL : TAX
    LDY.W SamusSpritemapTable,X
    LDA.W $0000,Y : BEQ .return
    STA.B DP_Temp18
    INY #2
    LDX.W OAMStack
    CLC

  .loop:
    LDA.W $0000,Y : ADC.B DP_Temp14 : STA.W OAMLow,X
    AND.W #$0100 : BEQ .xHighClear
    LDA.W $0000,Y : BPL .preMerge
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp16
    LDA.B (DP_Temp16) : ORA.L MapOfOAMIndexToHighOAM_bitmask,X : STA.B (DP_Temp16)
    JMP .merge

  .preMerge:
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp16
    LDA.B (DP_Temp16) : ORA.L MapOfOAMIndex_highXPosBit,X : STA.B (DP_Temp16)
    JMP .merge

  .xHighClear:
    LDA.W $0000,Y : BPL .merge
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp16
    LDA.B (DP_Temp16) : ORA.L MapOfOAMIndex_sizeBit,X : STA.B (DP_Temp16)

  .merge:
    LDA.W $0002,Y : CLC : ADC.B DP_Temp12 : STA.W OAMLow+1,X
    LDA.W $0003,Y : STA.W OAMLow+2,X
    TYA : CLC : ADC.W #$0005 : TAY
    TXA : ADC.W #$0004 : AND.W #$01FF : TAX
    DEC.B DP_Temp18 : BNE .loop
    STX.W OAMStack

  .return:
    PLB
    RTL


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
    PHB
    PEA.W FlareSpritemapPointers>>8&$FF00 : PLB : PLB
    ASL : TAX
    LDY.W FlareSpritemapPointers,X
    LDA.W $0000,Y : STA.B DP_Temp18
    INY #2
    BRA AddSpritemapToOAM_Common


;;; $8A4B: Add projectile spritemap to OAM ;;;
AddProjectileSpritemapToOAM:
;; Parameters:
;;     X: Projectile index
;;     $12: Spritemap Y origin
;;     $14: Spritemap X origin

; Actually uses the palette defined in the spritemap
; See $8A5F for spritemap format
    PHB
    PEA.W FlareSpritemapPointers>>8&$FF00 : PLB : PLB
    LDY.W SamusProjectile_SpritemapPointers,X
    LDA.W $0000,Y : BNE +
    PLB
    RTL

+   STA.B DP_Temp18
    INY #2
; fallthrough to AddSpritemapToOAM_Common


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
    LDX.W OAMStack
    CLC

  .loop:
    LDA.W $0000,Y : ADC.B DP_Temp14 : STA.W OAMLow,X
    AND.W #$0100 : BEQ +
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp16
    LDA.B (DP_Temp16) : ORA.L MapOfOAMIndex_highXPosBit,X : STA.B (DP_Temp16)

+   LDA.W $0000,Y : BPL +
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp16
    LDA.B (DP_Temp16) : ORA.L MapOfOAMIndex_sizeBit,X : STA.B (DP_Temp16)

+   LDA.W $0002,Y : CLC : ADC.B DP_Temp12 : STA.W OAMLow+1,X
    LDA.W $0003,Y : STA.W OAMLow+2,X
    TYA : CLC : ADC.W #$0005 : TAY
    TXA : ADC.W #$0004 : AND.W #$01FF : TAX
    DEC.B DP_Temp18 : BNE .loop
    STX.W OAMStack
    PLB
    RTL


;;; $8AB7: RTL ;;;
RTL_818AB7:
    RTL


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
    PHY
    LDA.W $0000,Y : BEQ .return
    INY #2
    STA.B DP_Temp18
    LDX.W OAMStack
    CLC

  .loop:
    LDA.W $0000,Y : ADC.B DP_Temp14 : STA.W OAMLow,X
    AND.W #$0100 : BEQ +
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp16
    LDA.B (DP_Temp16) : ORA.L MapOfOAMIndex_highXPosBit,X : STA.B (DP_Temp16)

+   LDA.W $0000,Y : BPL +
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp16
    LDA.B (DP_Temp16) : ORA.L MapOfOAMIndex_sizeBit,X : STA.B (DP_Temp16)

+   SEP #$20
    LDA.W $0002,Y : CLC : ADC.B DP_Temp12 : STA.W OAMLow+1,X
    REP #$21 ; clear carry
    LDA.W $0003,Y : ADC.B DP_Temp00 : ORA.B DP_Temp03 : STA.W OAMLow+2,X
    TYA : ADC.W #$0005 : TAY
    TXA : ADC.W #$0004 : AND.W #$01FF : TAX
    DEC.B DP_Temp18 : BNE .loop
    STX.W OAMStack

  .return:
    PLY
    RTL


;;; $8B21: Unused. RTL ;;;
RTL_818B21:
    RTL


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
    PHY
    LDA.W $0000,Y : BEQ .return
    INY #2
    STA.B DP_Temp18
    LDX.W OAMStack
    CLC

  .loop:
    LDA.W $0000,Y : ADC.B DP_Temp14 : STA.W OAMLow,X
    AND.W #$0100 : BEQ +
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp16
    LDA.B (DP_Temp16) : ORA.L MapOfOAMIndex_highXPosBit,X : STA.B (DP_Temp16)

+   LDA.W $0000,Y : BPL +
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp16
    LDA.B (DP_Temp16) : ORA.L MapOfOAMIndex_sizeBit,X : STA.B (DP_Temp16)

+   SEP #$20
    LDA.W $0002,Y : BMI +
    ADC.B DP_Temp12 : BCC .onScreen
    BCS .yPosF0h

+   ADC.B DP_Temp12
    BCS .onScreen

  .yPosF0h:
    LDA.B #$F0

  .onScreen:
    STA.W OAMLow+1,X
    REP #$21 ; clear carry
    LDA.W $0003,Y
    ADC.B DP_Temp00 : ORA.B DP_Temp03 : STA.W OAMLow+2,X
    TYA : ADC.W #$0005 : TAY
    TXA : ADC.W #$0004 : AND.W #$01FF : TAX
    DEC.B DP_Temp18 : BNE .loop
    STX.W OAMStack

  .return:
    PLY
    RTL


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
    PHY
    LDA.W $0000,Y : BEQ .return
    INY #2
    STA.B DP_Temp18
    LDX.W OAMStack
    CLC

  .loop:
    LDA.W $0000,Y : ADC.B DP_Temp14 : STA.W OAMLow,X
    AND.W #$0100 : BEQ +
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp16
    LDA.B (DP_Temp16) : ORA.L MapOfOAMIndex_highXPosBit,X : STA.B (DP_Temp16)

+   LDA.W $0000,Y : BPL +
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp16
    LDA.B (DP_Temp16) : ORA.L MapOfOAMIndex_sizeBit,X : STA.B (DP_Temp16)

+   SEP #$20
    LDA.W $0002,Y : BMI +
    ADC.B DP_Temp12 : BCS .onScreen
    BCC .yPosF0h

+   ADC.B DP_Temp12 : BCC .onScreen

  .yPosF0h:
    LDA.B #$F0

  .onScreen:
    STA.W OAMLow+1,X
    REP #$21 ; clear carry
    LDA.W $0003,Y : ADC.B DP_Temp00 : ORA.B DP_Temp03 : STA.W OAMLow+2,X
    TYA : ADC.W #$0005 : TAY
    TXA : ADC.W #$0004 : AND.W #$01FF : TAX
    DEC.B DP_Temp18 : BNE .loop
    STX.W OAMStack

  .return:
    PLY
    RTL


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
    LDA.W $0000,Y : BNE +
    RTL

+   STA.B DP_Temp18
    INY #2
    LDX.W OAMStack
    CLC

  .loop:
    LDA.W $0000,Y : CLC : ADC.B DP_Temp14 : STA.W OAMLow,X
    BIT.W #$0100 : BEQ +
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp16
    LDA.B (DP_Temp16) : ORA.L MapOfOAMIndex_highXPosBit,X : STA.B (DP_Temp16)

+   SEP #$20
    CLC
    LDA.W $0002,Y : BMI +
    ADC.B DP_Temp12 : BCC .onScreen
    BCS .yPosF0h

+   ADC.B DP_Temp12 : BCS .onScreen

  .yPosF0h:
    LDA.B #$F0

  .onScreen:
    STA.W OAMLow+1,X
    REP #$21 ; clear carry
    LDA.W $0000,Y : BPL +
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp16
    LDA.B (DP_Temp16) : ORA.L MapOfOAMIndex_sizeBit,X : STA.B (DP_Temp16)

+   LDA.W $0003,Y : ADC.B DP_Temp1A : ORA.B DP_Temp1C : STA.W OAMLow+2,X
    TXA : ADC.W #$0004 : AND.W #$01FF : TAX
    TYA : ADC.W #$0005 : TAY
    DEC.B DP_Temp18 : BNE .loop
    STX.W OAMStack
    RTL


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
    LDA.W $0000,Y : BNE +
    RTL

+   STA.B DP_Temp18
    INY #2
    LDX.W OAMStack
    CLC

  .loop:
    LDA.W $0000,Y : CLC : ADC.B DP_Temp14 : STA.W OAMLow,X
    BIT.W #$0100 : BEQ +
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp16
    LDA.B (DP_Temp16) : ORA.L MapOfOAMIndex_highXPosBit,X : STA.B (DP_Temp16)

+   SEP #$20
    CLC
    LDA.W $0002,Y : BMI +
    ADC.B DP_Temp12 : BCS .onScreen
    BCC .yPosF0h

+   ADC.B DP_Temp12 : BCC .onScreen

  .yPosF0h:
    LDA.B #$F0

  .onScreen:
    STA.W OAMLow+1,X
    REP #$21                                                             ; clear carry
    LDA.W $0000,Y : BPL +
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp16
    LDA.B (DP_Temp16) : ORA.L MapOfOAMIndex_sizeBit,X : STA.B (DP_Temp16)

+   LDA.W $0003,Y : ADC.B DP_Temp1A : ORA.B DP_Temp1C : STA.W OAMLow+2,X
    TXA : ADC.W #$0004 : AND.W #$01FF : TAX
    TYA : ADC.W #$0005 : TAY
    DEC.B DP_Temp18 : BNE .loop
    STX.W OAMStack
    RTL


;;; $8CF4: Debug game over menu ;;;
Debug_GameOverMenu:
; Game state 1Dh
    REP #$30
    PHB
    PHK : PLB
    LDA.W PauseMenu_MenuIndex : ASL : TAX
    JSR.W (.pointers,X)
    PLB
    RTL

  .pointers:
    dw Debug_GameOverMenu_Index0_FadeOut_ConfigureGraphicsForMenu
    dw Debug_GameOverMenu_Index1_Initialise
    dw Debug_GameOverMenu_Index24_FadeIn
    dw DebugGameOverMenu_Index3_Main
    dw Debug_GameOverMenu_Index24_FadeIn
    dw DebugGameOverMenu_Index5_Continue


;;; $8D0F: (Debug) game over menu - index 0: fade out and configure graphics for menu ;;;
Debug_GameOverMenu_Index0_FadeOut_ConfigureGraphicsForMenu:
    REP #$30
    JSL HandleFadingOut
    LDA.B DP_Brightness : AND.W #$000F : BEQ +
    RTS

+   JSL SetForceBlankAndWaitForNMI
    LDA.W #$0001
    JSL QueueSound_Lib3_Max6
    JSL Disable_HDMAObjects
    JSL Wait_End_VBlank_Clear_HDMA
    LDX.W #$0000

  .loopPalettes:
    LDA.L Palettes,X : STA.L BackupOfPalettesDuringMenu,X
    INX #2 : CPX.W #$0200 : BMI .loopPalettes
    LDX.W #$0000

  .loopIORegisterMirrors:
    LDA.B DP_Brightness,X : STA.L BackupOfRegularIORegistersDuringGameOverMenu,X
    INX #2 : CPX.W #$0036 : BMI .loopIORegisterMirrors
    JSR MapVRAMForMenu
    JSR LoadInitialMenuTiles
    REP #$30
    STZ.B DP_BG1XScroll : STZ.B DP_BG2XScroll : STZ.B DP_BG3XScroll
    STZ.B DP_BG1YScroll : STZ.B DP_BG2YScroll : STZ.B DP_BG3YScroll
    JSR LoadMenuPalettes
    INC.W PauseMenu_MenuIndex
    RTS


;;; $8D6D: Debug game over menu - index 1: initialise ;;;
Debug_GameOverMenu_Index1_Initialise:
    REP #$30
    LDA.W #$0000
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$FF03
    JSL QueueMusicDataOrTrack_8FrameDelay
    SEP #$20
    LDA.B #$11 : STA.B DP_MainScreenLayers
    REP #$30
    LDA.W #Debug_GameOverMenu_VRAMTransferDefinitions : STA.B DP_Temp00
    LDA.W #$0081 : STA.B DP_Temp02
    JSL LoadDebugGameOverMenuTilemap
    JSL ClearForceBlankAndWaitForNMI
    INC.W PauseMenu_MenuIndex
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    STZ.W FileSelectMapAreaIndex
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8DA4: Unused ;;;
UNUSED_818DA4:
    dw $000F
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8DA6: Debug game over menu - index 2/4: fade in ;;;
Debug_GameOverMenu_Index24_FadeIn:
    REP #$30
    JSL HandleFadingIn
    LDA.B DP_Brightness : AND.W #$000F : CMP.W #$000F : BNE .return
    INC.W PauseMenu_MenuIndex

  .return:
    RTS


;;; $8DBA: Map VRAM for menu ;;;
MapVRAMForMenu:
; PSR.M is set on return(!)
    SEP #$20
    STZ.B DP_SubScreenLayers
    LDA.B #$03 : STA.B DP_SpriteSizeAddr
    LDA.B #$51 : STA.B DP_BG1TilemapAddrSize
    LDA.B #DP_BG1TilemapAddrSize : STA.B DP_BG2TilemapAddrSize
    LDA.B #$5C : STA.B DP_BG3TilemapAddrSize
    LDA.B #$00 : STA.B DP_BGTilesAddr
    LDA.B #$04 : STA.B DP_BGTilesAddr+1
    LDA.B #$13 : STA.B DP_MainScreenLayers
    RTS


;;; $8DDB: Load initial menu tiles ;;;
LoadInitialMenuTiles:
    PHP
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$00 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl Tiles_Menu_BG1_BG2
    dw $5600
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$30 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl Tiles_PauseScreen_BG1_BG2
    dw $2000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #DP_WindowMaskBG12 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl Tiles_Menu_PauseScreen_Sprites
    dw $2000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$40 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl Tiles_Beta_Minimap_Area_Select_BG3
    dw $0600
    LDA.B #$02 : STA.W $420B
    PLP
    RTS


;;; $8E60: Load menu palettes ;;;
LoadMenuPalettes:
    REP #$30
    LDX.W #$0000

  .loop:
    LDA.L Menu_Palettes,X : STA.L Palettes,X
    LDA.L Menu_Palettes+2,X : STA.L Palettes+2,X
    INX #4 : CPX.W #$0200 : BMI .loop
    RTS


;;; $8E7F: Load debug game over menu tilemap ;;;
LoadDebugGameOverMenuTilemap:
;; Parameters:
;;     $00: Pointer to VRAM transfer definitions ($81:8EE1)
    LDX.W #$0000
    LDA.W #$000F

  .loopClear:
    STA.L CinematicBGTilemap,X
    INX #2 : CPX.W #$0800 : BMI .loopClear
    LDX.W VRAMWriteStack
    LDA.W #$0800 : STA.B VRAMWrite.size,X
    LDA.W #$3800 : STA.B VRAMWrite.src,X
    LDA.W #$007E : STA.B VRAMWrite.src+2,X
    LDA.B DP_BG1TilemapAddrSize : AND.W #$00FC : XBA : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    LDX.W VRAMWriteStack
    LDY.W #$0000

  .loop:
    LDA.B [DP_Temp00],Y : CMP.W #$FFFF : BEQ .return
    STA.B VRAMWrite.size,X
    INY #2
    LDA.B [DP_Temp00],Y : STA.B VRAMWrite.src,X
    INY #2
    LDA.B [DP_Temp00],Y : STA.B VRAMWrite.src+2,X
    INY #2
    LDA.B [DP_Temp00],Y : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : TAX
    INY #2
    BRA .loop

  .return:
    STX.W VRAMWriteStack
    RTL


;;; $8EE1: Debug game over menu VRAM transfer definitions ;;;
Debug_GameOverMenu_VRAMTransferDefinitions:
;                        __________________ Size (or FFFFh terminator)
;                       |     _____________ Source address
;                       |    |       ______ Padding byte for source bank
;                       |    |      |   ___ Destination VRAM address
;                       |    |      |  |
; '            GAME QUIT           '
    dw $0040                                                             ; Size (or FFFFh terminator)
    dl Tilemap_DebugGameOverMenu_gameQuit                                ; Source address
    db $00                                                               ; Padding byte for source bank
    dw $5140                                                             ; Destination VRAM address

; '        WOULD YOU PLAY ?        '
    dw $0040                                                             ; Size (or FFFFh terminator)
    dl Tilemap_DebugGameOverMenu_wouldYouPlay                            ; Source address
    db $00                                                               ; Padding byte for source bank
    dw $5180                                                             ; Destination VRAM address

; '            END                 '
    dw $0040                                                             ; Size (or FFFFh terminator)
    dl Tilemap_DebugGameOverMenu_end                                     ; Source address
    db $00                                                               ; Padding byte for source bank
    dw $51E0                                                             ; Destination VRAM address

; '            CONTINUE            '
    dw $0040                                                             ; Size (or FFFFh terminator)
    dl Tilemap_DebugGameOverMenu_continue                                ; Source address
    db $00                                                               ; Padding byte for source bank
    dw $5220                                                             ; Destination VRAM address
    dw $FFFF                                                             ; Terminator


;;; $8F03: Debug game over menu tilemaps ;;;
Tilemap_DebugGameOverMenu:
  .gameQuit:
; '            GAME QUIT           '
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$0070,$006A,$0076,$006E
    dw $000F,$007A,$007E,$0072,$007D,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F

  .wouldYouPlay:
; '        WOULD YOU PLAY ?        '
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $0080,$0078,$007E,$0075,$006D,$000F,$0082,$0078
    dw $007E,$000F,$0079,$0075,$006A,$0082,$000F,$0085
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F

  .end:
; '            END                 '
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$006E,$0077,$006D,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F

  .continue:
; '            CONTINUE            '
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$006C,$0078,$0077,$007D
    dw $0072,$0077,$007E,$006E,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F


;;; $9003: Debug game over menu - index 3: main ;;;
DebugGameOverMenu_Index3_Main:
    REP #$30
    LDA.B DP_Controller1New : BIT.W #$2000 : BNE .toggleSelection
    BIT.W #$0800 : BNE .toggleSelection
    BIT.W #$0400 : BNE .toggleSelection
    BIT.W #$9080 : BEQ .noChange
    LDA.W FileSelectMapAreaIndex : BNE +
    LDA.W SaveSlotSelected
    JSL SaveToSRAM
    JML SoftReset

+   INC.W PauseMenu_MenuIndex
    RTS

  .toggleSelection:
    LDA.W FileSelectMapAreaIndex : EOR.W #$0001 : STA.W FileSelectMapAreaIndex

  .noChange:
    LDX.W #$7800
    LDA.W FileSelectMapAreaIndex : BEQ +
    LDX.W #$8800

+   TXA : ORA.W #$0028
    LDX.W OAMStack
    STA.W OAMLow,X
    LDA.W #$00B6 : STA.W OAMLow+2,X
    INX #4
    STX.W OAMStack
    RTS


;;; $905B: Restore palettes and regular IO registers from debug game over menu ;;;
RestorePalettesAndIORegistersFromDebugGameOverMenu:
; The restoring of IO registers here has no effect, due to the ensuing unpause code calling $82:8E19, which sets the IO registers to the pause menu backup
; The restoring of the palettes is also redundant, due to the unpause code
    LDX.W #$0000

  .loopPalettes:
    LDA.L BackupOfPalettesDuringMenu,X : STA.L Palettes,X
    INX #2 : CPX.W #$0200 : BMI .loopPalettes
    LDX.W #$0000

  .loopIORegisters:
    LDA.L BackupOfRegularIORegistersDuringGameOverMenu,X : STA.B DP_Brightness,X
    INX #2 : CPX.W #$0036 : BMI .loopIORegisters
    RTS


;;; $907E: Debug game over menu - index 5: continue ;;;
DebugGameOverMenu_Index5_Continue:
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$40 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl Tiles_Standard_BG3
    dw $2000
    LDA.B #$02 : STA.W $420B
    REP #$30
    LDA.W #$0010 : STA.W GameState
    STZ.W FileSelectMapAreaIndex
    JMP RestorePalettesAndIORegistersFromDebugGameOverMenu


;;; $90AE: Game over menu ;;;
GameOverMenu:
    REP #$30
    PHB
    PHK : PLB
    LDA.W PauseMenu_MenuIndex : ASL : TAX
    JSR.W (.pointers,X)
    PLB
    RTL

  .pointers:
    dw Debug_GameOverMenu_Index0_FadeOut_ConfigureGraphicsForMenu
    dw GameOverMenu_Index1_Initialise
    dw GameOverMenu_Index2_PlayMusicTrack
    dw GameOverMenu_Index3_FadeIn
    dw GameOverMenu_Index4_Main
    dw GameOverMenu_Index5_FadeOutIntoGameMapView
    dw GameOverMenu_Index6_LoadGameMapView
    dw GameOverMenu_Index7_FadeOutIntoGameMapView


;;; $90CD: Game over menu - index 3: fade in ;;;
GameOverMenu_Index3_FadeIn:
    JSL Handle_GameOver_BabyMetroid
    JSL Draw_Menu_Selection_Missile
    JSL HandleFadingIn
    LDA.B DP_Brightness : AND.W #$000F : CMP.W #$000F : BNE .return
    INC.W PauseMenu_MenuIndex

  .return:
    RTS


;;; $90E7: Game over menu - index 5: fade out into game map view ;;;
GameOverMenu_Index5_FadeOutIntoGameMapView:
    JSL Handle_GameOver_BabyMetroid
    JSL Draw_Menu_Selection_Missile
    JSL HandleFadingOut
    LDA.B DP_Brightness : AND.W #$000F : BNE .return
    INC.W PauseMenu_MenuIndex

  .return:
    RTS


;;; $90FE: Game over menu - index 7: fade out into soft reset ;;;
GameOverMenu_Index7_FadeOutIntoGameMapView:
    JSL Draw_Menu_Selection_Missile
    JSL Handle_GameOver_BabyMetroid
    JSL HandleFadingOut
    LDA.B DP_Brightness : AND.W #$000F : BEQ .softReset
    RTS

  .softReset:
    JML SoftReset


;;; $9116: Game over menu - index 6: load game map view ;;;
GameOverMenu_Index6_LoadGameMapView:
    JSL Disable_HDMAObjects
    JSL Wait_End_VBlank_Clear_HDMA
    LDA.W #$0005 : STA.W GameState
    LDA.W #$0000 : STA.W PauseMenu_MenuIndex
    RTS


;;; $912B: Game over menu - index 4: main ;;;
GameOverMenu_Index4_Main:
    REP #$30
    JSL Handle_GameOver_BabyMetroid
    JSL Draw_Menu_Selection_Missile
    LDA.B DP_Controller1New : BIT.W #$2000 : BNE .toggleSelection
    BIT.W #$0800 : BNE .toggleSelection
    BIT.W #$0400 : BNE .toggleSelection
    BIT.W #$0080 : BEQ .noChange
    LDA.W #$00B4 : STA.W Enemy.instTimer
    LDA.W FileSelectMapAreaIndex : BEQ +
    LDA.W #$0007 : STA.W PauseMenu_MenuIndex
    RTS

+   LDA.L SRAMMirror_LoadingGameState : CMP.W #$001F : BEQ +
    INC.W PauseMenu_MenuIndex
    LDA.W SaveSlotSelected
    JSL LoadFromSRAM
    RTS

+   STA.W GameState : LDA.W SaveSlotSelected
    JSL LoadFromSRAM
    RTS

  .toggleSelection:
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    LDA.W FileSelectMapAreaIndex : EOR.W #$0001 : STA.W FileSelectMapAreaIndex

  .noChange:
    LDX.W #$0028
    LDY.W #$00A0
    LDA.W FileSelectMapAreaIndex : BEQ +
    LDX.W #$0028
    LDY.W #$00C0

+   STX.W Mode7Object_InstListPointers
    STY.W Mode7Object_InstructionTimers+2
    RTS


;;; $91A4: Game over menu - index 1: initialise ;;;
GameOverMenu_Index1_Initialise:
    SEP #$20
    LDA.B #$11 : STA.B DP_MainScreenLayers
    LDA.B #$20 : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.B #$40 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor2
    REP #$30
    LDA.W #$0000
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$FF03
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$0001 : STA.W EnemyProjectile_Enable
    DEC : STA.W EnemyProjectile_ID
    LDX.W #$0000
    LDA.W #$000F

  .loop:
    STA.L MenuTilemap,X
    INX #2 : CPX.W #$0800 : BMI .loop
    LDX.W VRAMWriteStack
    LDA.W #$0800 : STA.B VRAMWrite.size,X
    LDA.W #$3600 : STA.B VRAMWrite.src,X
    LDA.W #$007E : STA.B VRAMWrite.src+2,X
    LDA.B DP_BG1TilemapAddrSize : AND.W #$00FC : XBA : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    STZ.W Enemy.palette
    LDY.W #Tilemap_GameOver_gameOver
    LDX.W #($B<<1)|($5<<6)                                               ; $0156
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDY.W #Tilemap_GameOver_findTheMetroidLarva
    LDX.W #($5<<1)|($E<<6)                                               ; $038A
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDY.W #Tilemap_GameOver_tryAgain
    LDX.W #($A<<1)|($10<<6)                                              ; $0414
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDY.W #Tilemap_GameOver_yesReturnToGame
    LDX.W #($7<<1)|($13<<6)                                              ; $04CE
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDY.W #Tilemap_GameOver_noGoToTitle
    LDX.W #($7<<1)|($17<<6)                                              ; $05CE
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    STZ.W Enemy.instList : STZ.W Enemy.instTimer
    JSL Handle_GameOver_BabyMetroid
    LDA.B DP_ColorMathA : AND.W #$FF00 : STA.B DP_ColorMathA
    JSL Disable_HDMAObjects
    JSL Wait_End_VBlank_Clear_HDMA
    JSL Enable_HDMAObjects
    JSL Spawn_HDMAObject
    db $00,$32
    dw HDMAObjInstList_ColorMathSubscnBackdrop_GameOverMenuGradient
    JSL Spawn_HDMAObject
    db $00,$31
    dw HDMAObjInstList_ColorMathCtrlRegB_GameOverMenuGradient
    JSL ClearForceBlankAndWaitForNMI
    INC.W PauseMenu_MenuIndex
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    STZ.W FileSelectMapAreaIndex
    LDA.W #$0028 : STA.W Mode7Object_InstListPointers
    LDA.W #$00A0 : STA.W Mode7Object_InstructionTimers+2
    RTS


;;; $927D: HDMA object instruction list - colour math subscreen backdrop colour - game over menu gradient ;;;
HDMAObjInstList_ColorMathSubscnBackdrop_GameOverMenuGradient:
    dw Instruction_HDMAObject_HDMATableBank : db $81
    dw Instruction_HDMAObject_PreInstructionInY : dl RTL_8192DB
    dw $0001, HDMATable_ColorMathSubscnBackdrop_GameOverMenuGradient
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_Delete


;;; $928D: HDMA object instruction list - colour math control register B - game over menu gradient ;;;
HDMAObjInstList_ColorMathCtrlRegB_GameOverMenuGradient:
    dw Instruction_HDMAObject_HDMATableBank : db $81
    dw Instruction_HDMAObject_PreInstructionInY : dl RTL_8192DB
    dw $0001, HDMATable_ColorMathCtrlRegB_GameOverMenuGradient
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_Delete


;;; $929D: HDMA table - colour math control register B - game over menu gradient ;;;
HDMATable_ColorMathCtrlRegB_GameOverMenuGradient:
; Enable subtractive colour math on BG1/backdrop
    db $40,$A1
    db $3A,$A1
; Enable colour math on BG1/backdrop
    db $40,$21
    db $40,$21
    db $00,$00


;;; $92A7: HDMA table - colour math subscreen backdrop colour - game over menu gradient ;;;
HDMATable_ColorMathSubscnBackdrop_GameOverMenuGradient:
    db $05,$E8
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
    RTL


;;; $92DC: Game over tilemaps ;;;
Tilemap_GameOver_gameOver:
; GAME OVER
    dw $000C,$000A,$0026,$000E,$000F,$0000,$002D,$000E
    dw $000D,$FFFE,$0030,$001A,$0036,$001E,$000F,$0010
    dw $003E,$001E,$003A,$FFFF


Tilemap_GameOver_findTheMetroidLarva:
; FIND THE METROID LARVA!
    dw $006F,$0072,$0077,$006D,$000F,$007D,$0071,$006E
    dw $000F,$0076,$006E,$007D,$007B,$0078,$0072,$006D
    dw $000F,$0075,$006A,$007B,$007F,$006A,$0084,$FFFF


Tilemap_GameOver_tryAgain:
; TRY AGAIN?
    dw $007D,$007B,$0082,$000F,$006A,$0070,$006A,$0072
    dw $0077,$000F,$0085,$FFFF


Tilemap_GameOver_yesReturnToGame:
; YES (RETURN TO GAME)
    dw $0041,$000E,$002B,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$FFFE,$0017,$001E,$003B
    dw $000F,$008A,$007B,$006E,$007D,$007E,$007B,$0077
    dw $000F,$007D,$0078,$000F,$0070,$006A,$0076,$006E
    dw $008B,$FFFF


Tilemap_GameOver_noGoToTitle:
; N O (GO TO TITLE)
    dw $0027,$000F,$0000,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$FFFE,$0037,$000F,$0010,$000F,$008A,$0070
    dw $0078,$000F,$007D,$0078,$000F,$007D,$0072,$007D
    dw $0075,$006E,$008B,$FFFF


;;; $93E8: Game over menu - index 2: play pre-statue hall music track ;;;
GameOverMenu_Index2_PlayMusicTrack:
    REP #$30
    JSL CheckIfMusicIsQueued
    BCS .return
    INC.W PauseMenu_MenuIndex
    LDA.W #$0004
    JSL QueueMusicDataOrTrack_8FrameDelay

  .return:
    RTS


;;; $93FB: File select menu ;;;
FileSelectMenu:
    REP #$30
    PHB
    PHK : PLB
    LDA.W PauseMenu_MenuIndex : ASL : TAX
    JSR.W (.pointers,X)
    PLB
    RTL

  .pointers:
    dw FileSelectMenu_Index0_TitleSequenceToMain_FadeOutConfigGfx
    dw FileSelectMenu_Index1_TitleSequenceToMain_LoadBG2
    dw FileSelectMenu_Index2_TitleSequenceToMain
    dw FileSelectMenu_Index3_TitleSequenceToMain_FadeIn
    dw FileSelectMenu_Index4_Main
    dw FileSelectMenu_Index5_13_FadeOutFromMain
    dw FileSelectMenu_Index6_MainToFileCopy_Initialise
    dw FileSelectMenu_Index7_15_FadeInFromMain
    dw FileSelectMenu_Index8_FileCopy_SelectSource
    dw FileSelectMenu_Index9_FileCopy_InitialiseSelectDestination
    dw FileSelectMenu_IndexA_FileCopy_SelectDestination
    dw FileSelectMenu_IndexB_FileCopy_InitialiseConfirmation
    dw FileSelectMenu_IndexC_FileCopy_Confirmation
    dw FileSelectMenu_Index0_FileCopy_DoFileCopy
    dw FileSelectMenu_IndexE_FileCopy_CopyCompleted
    dw FileSelectMenu_IndexF_1B_FadeOutToMain
    dw FileSelectMenu_Index10_1C_ReloadMain
    dw FileSelectMenu_Index11_10_FadeInToMain
    dw FileSelectMenu_Index12_FileCopyToMain_MenuIndex_Main
    dw FileSelectMenu_Index5_13_FadeOutFromMain
    dw FileSelectMenu_Index14_MainToFileClear_Initialise
    dw FileSelectMenu_Index7_15_FadeInFromMain
    dw FileSelectMenu_Index16_FileClear_SelectSlot
    dw FileSelectMenu_Index17_FileClear_InitialiseConfirmation
    dw FileSelectMenu_Index18_FileClear_Confirmation
    dw FileSelectMenu_Index19_FileClear_DoFileClear
    dw FileSelectMenu_Index1A_FileClear_ClearCompleted
    dw FileSelectMenu_IndexF_1B_FadeOutToMain
    dw FileSelectMenu_Index10_1C_ReloadMain
    dw FileSelectMenu_Index11_10_FadeInToMain
    dw FileSelectMenu_Index1E_FileClearToMain_MenuIndex_Main
    dw FileSelectMenu_Index1F_MainToOptionsMenu_TurnSamusHelmet
    dw FileSelectMenu_Index20_MainToOptionsMenu_FadeOut
    dw FileSelectMenu_Index21_MainToTitleSequence


;;; $944E: File select menu - index 0: title sequence to main - fade out and configure graphics ;;;
FileSelectMenu_Index0_TitleSequenceToMain_FadeOutConfigGfx:
    REP #$30
    JSL HandleFadingOut
    LDA.B DP_Brightness : AND.W #$000F : BEQ +
    RTS

+   JSL SetForceBlankAndWaitForNMI
    LDA.W #$0001
    JSL QueueSound_Lib3_Max6
    JSL Disable_HDMAObjects
    JSL Wait_End_VBlank_Clear_HDMA
    INC.W PauseMenu_MenuIndex
    JSR MapVRAMForMenu
    JSR LoadInitialMenuTiles
    REP #$30
    STZ.B DP_BG1XScroll : STZ.B DP_BG2XScroll : STZ.B DP_BG3XScroll
    STZ.B DP_BG1YScroll : STZ.B DP_BG2YScroll : STZ.B DP_BG3YScroll


;;; $9486: Load file select palettes ;;;
LoadFileSelectPalettes:
; Clone of $8E60, expect with no `REP #$30`
    LDX.W #$0000

  .loop:
    LDA.L Menu_Palettes,X : STA.L Palettes,X
    LDA.L Menu_Palettes+2,X : STA.L Palettes+2,X
    INX #4 : CPX.W #$0200 : BMI .loop
    RTS


;;; $94A3: File select menu - index 20h: main to options menu - fade out ;;;
FileSelectMenu_Index20_MainToOptionsMenu_FadeOut:
    REP #$30
    JSL Draw_Menu_Selection_Missile
    JSL Draw_Border_Around_SAMUS_DATA
    JSR Draw_FileSelect_SamusHelmets
    JSL HandleFadingOut
    LDA.B DP_Brightness : AND.W #$000F : BNE .return
    LDA.W #$0002 : STA.W GameState
    STZ.W PauseMenu_MenuIndex
    LDY.W #$0000
    LDA.W #$0000

  .loop:
    STA.W EnemyProjectile_Enable,Y
    INY #2 : CPY.W #$0030 : BMI .loop

  .return:
    RTS


;;; $94D5: File select menu - index 21h: main to title sequence ;;;
FileSelectMenu_Index21_MainToTitleSequence:
    REP #$30
    JSL Draw_Border_Around_SAMUS_DATA
    JSR Draw_FileSelect_SamusHelmets
    JSL HandleFadingOut
    LDA.B DP_Brightness : AND.W #$000F : BNE .return
    JML SoftReset

  .return:
    RTS


;;; $94EE: File select menu - index 5/13h: fade out from main ;;;
FileSelectMenu_Index5_13_FadeOutFromMain:
    REP #$30
    JSL Draw_Menu_Selection_Missile


;;; $94F4: File select menu - index Fh/1Bh: fade out to main ;;;
FileSelectMenu_IndexF_1B_FadeOutToMain:
    JSL HandleFadingOut
    LDA.B DP_Mosaic : AND.W #$FF0F : STA.B DP_Temp12
    LDA.B DP_Brightness : AND.W #$000F
    ASL #4 : EOR.W #$00F0 : ORA.B DP_Temp12 : STA.B DP_Mosaic
    LDA.B DP_Brightness : AND.W #$000F : BNE .return
    JSL SetForceBlankAndWaitForNMI
    INC.W PauseMenu_MenuIndex

  .return:
    RTS


;;; $951E: File select menu - index 11h/1Dh: fade in to main ;;;
FileSelectMenu_Index11_10_FadeInToMain:
    REP #$30
    LDA.W SaveSlotSelected : ASL #2 : TAX
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Yposition,X : STA.W Mode7Object_InstructionTimers+2
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Xposition,X : STA.W Mode7Object_InstListPointers
; fallthrough to FileSelectMenu_Index7_15_FadeInFromMain


;;; $9532: File select menu - index 7/15h: fade in from main ;;;
FileSelectMenu_Index7_15_FadeInFromMain:
    REP #$30
    JSL Draw_Menu_Selection_Missile
    JSL HandleFadingIn
    LDA.B DP_Mosaic : AND.W #$FF0F : STA.B DP_Temp12
    LDA.B DP_Brightness : AND.W #$000F
    ASL #4 : EOR.W #$00F0 : ORA.B DP_Temp12 : STA.B DP_Mosaic
    LDA.B DP_Brightness : AND.W #$000F : CMP.W #$000F : BNE .return
    INC.W PauseMenu_MenuIndex

  .return:
    RTS


;;; $9561: File select menu - index 6: main to file copy - initialise ;;;
FileSelectMenu_Index6_MainToFileCopy_Initialise:
    REP #$30
    INC.W PauseMenu_MenuIndex                                            ; fallthrough to Initialise_FileSelectMenu_FileCopy


;;; $9566: Initialise file select menu file copy ;;;
Initialise_FileSelectMenu_FileCopy:
    JSR ClearMenuTilemap
    LDY.W #Tilemap_FileSelect_dataCopyMode
    LDX.W #($9<<1)|($1<<6)                                               ; $0052
    STZ.W Enemy.palette
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDY.W #Tilemap_FileSelect_copyWhichData
    LDX.W #($8<<1)|($5<<6)                                               ; $0150
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    JSR LoadMenuExitTilemap
    JSR Draw_FileCopyClear_SaveFileInfo
    JSR SetInitial_FileCopyClear_MenuSelection
    JSR Set_FileCopyMenu_SelectionMissile_Position
    STZ.W TitleMenu_FileCopySrcFileClearSlot : STZ.W TitleMenu_FileCopyDestSlot
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $9591: Unused. REP #$30 ;;;
UNUSED_REP30_819591:
    REP #$30
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9593: Set initial file copy/clear menu selection ;;;
SetInitial_FileCopyClear_MenuSelection:
    LDA.W NonEmptySaveSlots
    LDY.W #$0000

  .loop:
    LSR : BCS .return
    INY : CPY.W #$0003 : BMI .loop

  .return:
    STY.W CinematicBGObject_IndirectInstructionPointers
    RTS


;;; $95A6: Clear menu tilemap ;;;
ClearMenuTilemap:
    LDX.W #$07FE
    LDA.W #$000F

  .loop:
    STA.L MenuTilemap,X
    DEX #2 : BPL .loop
    RTS


;;; $95B5: Load menu exit tilemap ;;;
LoadMenuExitTilemap:
    LDY.W #Tilemap_FileSelect_exit
    LDX.W #($4<<1)|($1A<<6)                                              ; $0688
    JMP Load_Tilemap_in_Y_to_X_Coordinates


;;; $95BE: Draw file copy/clear save file info ;;;
Draw_FileCopyClear_SaveFileInfo:
    LDA.W #$0000
    JSR LoadFromSRAM_external
    STZ.W Enemy.palette
    LDA.W NonEmptySaveSlots : BIT.W #$0001 : BNE +
    LDA.W #$0400 : STA.W Enemy.palette

+   JSR Draw_FileCopyClear_SaveSlotAInfo
    LDA.W #$0001
    JSR LoadFromSRAM_external
    STZ.W Enemy.palette
    LDA.W NonEmptySaveSlots : BIT.W #$0002 : BNE +
    LDA.W #$0400 : STA.W Enemy.palette

+   JSR Draw_FileCopyClear_SaveSlotBInfo
    LDA.W #$0002
    JSR LoadFromSRAM_external
    STZ.W Enemy.palette
    LDA.W NonEmptySaveSlots : BIT.W #$0004 : BNE +
    LDA.W #$0400 : STA.W Enemy.palette

+   JSR Draw_FileCopyClear_SaveSlotCInfo
    JMP QueueTransfer_MenuTilemap_ToVRAMBG1


;;; $960F: Draw file copy/clear save slot A info ;;;
Draw_FileCopyClear_SaveSlotAInfo:
    LDX.W #$0218
    LDA.W NonEmptySaveSlots : EOR.W #$FFFF : AND.W #$0001
    JSR Draw_FileSelection_Health
    LDX.W #$0272
    LDA.W NonEmptySaveSlots : EOR.W #$FFFF : AND.W #$0001
    JSR Draw_FileSelection_Time
    LDY.W #Tilemap_FileSelect_time
    LDX.W #($1A<<1)|($8<<6)                                              ; $0234
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDY.W #Tilemap_FileSelect_SamusA
    LDX.W #($4<<1)|($8<<6)                                               ; $0208
    JMP Load_Tilemap_in_Y_to_X_Coordinates


;;; $963F: Draw file copy/clear save slot B info ;;;
Draw_FileCopyClear_SaveSlotBInfo:
    LDX.W #$0318
    LDA.W NonEmptySaveSlots : EOR.W #$FFFF : AND.W #$0002
    JSR Draw_FileSelection_Health
    LDX.W #$0372
    LDA.W NonEmptySaveSlots : EOR.W #$FFFF : AND.W #$0002
    JSR Draw_FileSelection_Time
    LDY.W #Tilemap_FileSelect_time
    LDX.W #($1A<<1)|($C<<6)                                              ; $0334
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDY.W #Tilemap_FileSelect_SamusB
    LDX.W #($4<<1)|($C<<6)                                               ; $0308
    JMP Load_Tilemap_in_Y_to_X_Coordinates


;;; $966F: Draw file copy/clear save slot C info ;;;
Draw_FileCopyClear_SaveSlotCInfo:
    LDX.W #$0418
    LDA.W NonEmptySaveSlots : EOR.W #$FFFF : AND.W #$0004
    JSR Draw_FileSelection_Health
    LDX.W #$0472
    LDA.W NonEmptySaveSlots : EOR.W #$FFFF : AND.W #$0004
    JSR Draw_FileSelection_Time
    LDY.W #Tilemap_FileSelect_time
    LDX.W #($1A<<1)|($10<<6)                                             ; $0434
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDY.W #Tilemap_FileSelect_SamusC
    LDX.W #($4<<1)|($10<<6)                                              ; $0408
    JMP Load_Tilemap_in_Y_to_X_Coordinates


;;; $969F: Queue transfer of menu tilemap to VRAM BG1 ;;;
QueueTransfer_MenuTilemap_ToVRAMBG1:
    LDX.W VRAMWriteStack
    LDA.W #$0800 : STA.B VRAMWrite.size,X
    LDA.W #$3600 : STA.B VRAMWrite.src,X
    LDA.W #$007E : STA.B VRAMWrite.src+2,X
    LDA.B DP_BG1TilemapAddrSize : AND.W #$00FC : XBA : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    RTS


;;; $96C2: File select menu - index 8: file copy - select source ;;;
FileSelectMenu_Index8_FileCopy_SelectSource:
    REP #$30
    JSL Draw_Border_Around_DATA_COPY_MODE
    JSL Draw_Menu_Selection_Missile
    LDA.B DP_Controller1New : BIT.W #$1080 : BNE .select
    BIT.W #$8000 : BNE .B
    BIT.W #$0800 : BNE .up
    BIT.W #$0400 : BEQ Set_FileCopyMenu_SelectionMissile_Position
    SEP #$30
    LDA.W NonEmptySaveSlots
    LDX.W CinematicBGObject_IndirectInstructionPointers

  .loopDown:
    INX : CPX.B #$04 : BPL Set_FileCopyMenu_SelectionMissile_Position
    CPX.B #$03 : BEQ +
    BIT.W .bitmasks,X : BEQ .loopDown

+   STX.W CinematicBGObject_IndirectInstructionPointers
    REP #$30
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    BRA Set_FileCopyMenu_SelectionMissile_Position
    REP #$30 ; >_< dead code

  .B:
    LDA.W PauseMenu_MenuIndex : CLC : ADC.W #$0007 : STA.W PauseMenu_MenuIndex
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    RTS

  .up:
    SEP #$30
    LDA.W NonEmptySaveSlots
    LDX.W CinematicBGObject_IndirectInstructionPointers

  .loopUp:
    DEX : BMI Set_FileCopyMenu_SelectionMissile_Position
    BIT.W .bitmasks,X : BEQ .loopUp
    STX.W CinematicBGObject_IndirectInstructionPointers
    REP #$30
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    BRA Set_FileCopyMenu_SelectionMissile_Position

  .select:
    REP #$30
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    LDA.W CinematicBGObject_IndirectInstructionPointers : CMP.W #$0003 : BEQ +
    STA.W TitleMenu_FileCopySrcFileClearSlot
    INC.W PauseMenu_MenuIndex
    RTS

+   LDA.W PauseMenu_MenuIndex : CLC : ADC.W #$0007 : STA.W PauseMenu_MenuIndex
    RTS

  .bitmasks:
    db $01,$02,$04


;;; $975E: Set file copy menu selection missile position ;;;
Set_FileCopyMenu_SelectionMissile_Position:
    REP #$30
    LDA.W CinematicBGObject_IndirectInstructionPointers : ASL : TAX
    LDA.W .position,X : STA.W Mode7Object_InstructionTimers+2
    LDA.W #$0016 : STA.W Mode7Object_InstListPointers
    RTS

  .position:
    dw $0048,$0068,$0088,$00D3


;;; $977A: File select menu - index 9: file copy - initialise select destination ;;;
FileSelectMenu_Index9_FileCopy_InitialiseSelectDestination:
    REP #$30
    JSL Draw_Border_Around_DATA_COPY_MODE
    JSR Draw_FileCopy_SelectDestination_SaveFileInfo
    INC.W PauseMenu_MenuIndex
    LDA.W #$0000

  .loop:
    CMP.W TitleMenu_FileCopySrcFileClearSlot : BNE +
    INC : CMP.W #$0003 : BMI .loop

+   STA.W CinematicBGObject_IndirectInstructionPointers
    BRA Set_FileCopyMenu_SelectionMissile_Position


;;; $9799: Draw file copy select destination save file info ;;;
Draw_FileCopy_SelectDestination_SaveFileInfo:
    JSR ClearMenuTilemap
    LDY.W #Tilemap_FileSelect_dataCopyMode
    LDX.W #($9<<1)|($1<<6) ; $0052
    STZ.W Enemy.palette
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDY.W #Tilemap_FileSelect_copySamusToWhere
    LDX.W #($4<<1)|($5<<6) ; $0148
    STZ.W Enemy.palette
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDA.W TitleMenu_FileCopySrcFileClearSlot : CLC : ADC.W #$206A : STA.L MenuTilemap+$160
    JSR LoadMenuExitTilemap
    LDA.W #$0000
    JSR LoadFromSRAM_external
    LDX.W #$0400
    LDA.W TitleMenu_FileCopySrcFileClearSlot : BEQ +
    LDX.W #$0000

+   TXA : STA.W Enemy.palette
    JSR Draw_FileCopyClear_SaveSlotAInfo
    LDA.W #$0001
    JSR LoadFromSRAM_external
    LDX.W #$0400
    LDA.W TitleMenu_FileCopySrcFileClearSlot : CMP.W #$0001 : BEQ +
    LDX.W #$0000

+   TXA : STA.W Enemy.palette
    JSR Draw_FileCopyClear_SaveSlotBInfo
    LDA.W #$0002
    JSR LoadFromSRAM_external
    LDX.W #$0400
    LDA.W TitleMenu_FileCopySrcFileClearSlot : CMP.W #$0002 : BEQ +
    LDX.W #$0000

+   TXA : STA.W Enemy.palette
    JSR Draw_FileCopyClear_SaveSlotCInfo
    JMP QueueTransfer_MenuTilemap_ToVRAMBG1


;;; $9813: File select menu - index Ah: file copy - select destination ;;;
FileSelectMenu_IndexA_FileCopy_SelectDestination:
    REP #$30
    JSL Draw_Border_Around_DATA_COPY_MODE
    JSL Draw_Menu_Selection_Missile
    LDA.B DP_Controller1New : BIT.W #$1080 : BNE .select
    BIT.W #$8000 : BNE .B
    BIT.W #$0800 : BNE .up
    BIT.W #$0400 : BEQ .setMissilePosition
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    LDX.W CinematicBGObject_IndirectInstructionPointers

  .loopDown:
    INX : CPX.W #$0004 : BEQ .setMissilePosition
    CPX.W TitleMenu_FileCopySrcFileClearSlot : BNE .setMenuSelection
    BRA .loopDown

  .setMenuSelection:
    STX.W CinematicBGObject_IndirectInstructionPointers

  .setMissilePosition:
    LDA.W CinematicBGObject_IndirectInstructionPointers : ASL : TAX
    LDA.W .positions,X : STA.W Mode7Object_InstructionTimers+2
    LDA.W #$0016 : STA.W Mode7Object_InstListPointers
    RTS

  .B:
    LDA.W PauseMenu_MenuIndex : SEC : SBC.W #$0002 : STA.W PauseMenu_MenuIndex
    LDA.W TitleMenu_FileCopySrcFileClearSlot : STA.W CinematicBGObject_IndirectInstructionPointers
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    JMP Initialise_FileSelectMenu_FileCopy

  .select:
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    LDA.W CinematicBGObject_IndirectInstructionPointers : CMP.W #$0003 : BEQ +
    STA.W TitleMenu_FileCopyDestSlot
    INC.W PauseMenu_MenuIndex
    BRA .setMissilePosition

+   LDA.W PauseMenu_MenuIndex : CLC : ADC.W #$0005 : STA.W PauseMenu_MenuIndex
    RTS

  .up:
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    LDX.W CinematicBGObject_IndirectInstructionPointers

  .loopUp:
    DEX : BMI .setMissilePosition
    CPX.W TitleMenu_FileCopySrcFileClearSlot : BNE .setMenuSelection
    BRA .loopUp

  .positions:
    dw $0048,$0068,$0088,$00D4


;;; $98B7: File select menu - index Bh: file copy - initialise confirmation ;;;
FileSelectMenu_IndexB_FileCopy_InitialiseConfirmation:
    JSL Draw_Border_Around_DATA_COPY_MODE
    LDY.W #Tilemap_FileSelect_copySamusToSamus
    LDX.W #($2<<1)|($5<<6) ; $0144
    STZ.W Enemy.palette
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDA.W TitleMenu_FileCopySrcFileClearSlot : CLC : ADC.W #$206A : STA.L MenuTilemap+$15C
    LDA.W TitleMenu_FileCopyDestSlot : CLC : ADC.W #$206A : STA.L MenuTilemap+$176
    JSR Draw_FileCopyClear_Confirmation
    INC.W PauseMenu_MenuIndex
    STZ.W CinematicBGObject_IndirectInstructionPointers
    LDA.W #$0008
    STA.W Mode7TransformationZoomLevel
    RTS


;;; $98ED: Draw file copy/clear confirmation ;;;
Draw_FileCopyClear_Confirmation:
    LDY.W #Tilemap_FileSelect_isThisOK
    LDX.W #($A<<1)|($14<<6) ; $0514
    STZ.W Enemy.palette
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDY.W #Tilemap_FileSelect_yes
    LDX.W #($E<<1)|($16<<6) ; $059C
    STZ.W Enemy.palette
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDX.W #$0680
    LDA.W #$000F

  .loop:
    STA.L MenuTilemap,X
    INX #2 : CPX.W #$06C0 : BMI .loop
    LDY.W #Tilemap_FileSelect_no
    LDX.W #($E<<1)|($19<<6) ; $065C
    STZ.W Enemy.palette
    JSR Load_Tilemap_in_Y_to_X_Coordinates                             ; fallthrough to Draw_FileCopyClear_Confirmation_SaveFileInfo


;;; $9922: Draw file copy/clear confirmation save file info ;;;
Draw_FileCopyClear_Confirmation_SaveFileInfo:
    LDA.W #$0000
    JSR LoadFromSRAM_external
    LDX.W #$0000
    LDA.W TitleMenu_FileCopySrcFileClearSlot : BEQ +
    LDA.W TitleMenu_FileCopyDestSlot : BEQ +
    LDX.W #$0400

+   TXA : STA.W Enemy.palette
    JSR Draw_FileCopyClear_SaveSlotAInfo
    LDA.W #$0001
    JSR LoadFromSRAM_external
    LDX.W #$0000
    LDA.W TitleMenu_FileCopySrcFileClearSlot : DEC : BEQ +
    LDA.W TitleMenu_FileCopyDestSlot : DEC : BEQ +
    LDX.W #$0400

+   TXA : STA.W Enemy.palette
    JSR Draw_FileCopyClear_SaveSlotBInfo
    LDA.W #$0002
    JSR LoadFromSRAM_external
    LDX.W #$0000
    LDA.W TitleMenu_FileCopySrcFileClearSlot : CMP.W #$0002 : BEQ +
    LDA.W TitleMenu_FileCopyDestSlot : CMP.W #$0002 : BEQ +
    LDX.W #$0400

+   TXA : STA.W Enemy.palette
    JSR Draw_FileCopyClear_SaveSlotCInfo
    JMP QueueTransfer_MenuTilemap_ToVRAMBG1


;;; $9984: File select menu - index Ch: file copy - confirmation ;;;
FileSelectMenu_IndexC_FileCopy_Confirmation:
    JSL Draw_Border_Around_DATA_COPY_MODE
    JSL Draw_Menu_Selection_Missile
    JSR HandleFileCopyArrowPalette
    JSL Draw_FileCopy_Arrow
    LDA.B DP_Controller1New : BIT.W #$0C00 : BNE .toggle
    BIT.W #$8000 : BNE .B
    BIT.W #$1080 : BEQ .setMissilePosition
    LDA.W #$0038
    JSL QueueSound_Lib1_Max6
    LDA.W CinematicBGObject_IndirectInstructionPointers : BEQ .yes
    LDA.W PauseMenu_MenuIndex : SEC : SBC.W #$0004 : STA.W PauseMenu_MenuIndex
    JMP Initialise_FileSelectMenu_FileCopy

  .B:
    LDA.W PauseMenu_MenuIndex : SEC : SBC.W #$0003 : STA.W PauseMenu_MenuIndex
    LDA.W TitleMenu_FileCopyDestSlot : STA.W CinematicBGObject_IndirectInstructionPointers
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    RTS

  .yes:
    INC.W PauseMenu_MenuIndex
    RTS

  .toggle:
    LDA.W CinematicBGObject_IndirectInstructionPointers : EOR.W #$0001 : STA.W CinematicBGObject_IndirectInstructionPointers
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6

  .setMissilePosition:
    LDY.W #$00B8
    LDA.W CinematicBGObject_IndirectInstructionPointers : BEQ +
    LDY.W #$00D0

+   STY.W Mode7Object_InstructionTimers+2
    LDA.W #$005E : STA.W Mode7Object_InstListPointers
    RTS


;;; $99FE: Handle file copy arrow palette ;;;
HandleFileCopyArrowPalette:
    LDA.W Mode7TransformationZoomLevel : BEQ .return
    DEC : STA.W Mode7TransformationZoomLevel : BNE .return
    LDA.W #$0004 : STA.W Mode7TransformationZoomLevel
    LDA.L Palettes_SpriteP1+2 : TAY
    LDX.W #$0000

  .loop:
    LDA.L Palettes_SpriteP1+4,X : STA.L Palettes_SpriteP1+2,X
    INX #2 : CPX.W #$000C : BMI .loop
    TYA : STA.L Palettes_SpriteP1+$E

  .return:
    RTS


;;; $9A2C: File select menu - index Dh: file copy - do file copy ;;;
FileSelectMenu_Index0_FileCopy_DoFileCopy:
    JSL Draw_Border_Around_DATA_COPY_MODE
    JSL Draw_Menu_Selection_Missile
    JSR HandleFileCopyArrowPalette
    JSL Draw_FileCopy_Arrow
    LDA.W #$0070 : STA.B DP_Temp02 : STA.B DP_Temp05
    LDA.W TitleMenu_FileCopySrcFileClearSlot : ASL : TAX
    LDA.L SaveSlotOffsets,X : STA.B DP_Temp00
    LDA.W TitleMenu_FileCopyDestSlot : ASL : TAX
    LDA.L SaveSlotOffsets,X : STA.B DP_Temp03
    LDY.W #$0000

  .loop:
    LDA.B [DP_Temp00],Y : STA.B [DP_Temp03],Y
    INY #2 : CPY.W #$065C : BMI .loop
    LDA.W TitleMenu_FileCopySrcFileClearSlot : ASL : TAX
    LDA.L SRAM_Slot0Checksum1,X : PHA
    LDA.L SRAM_Slot0Complement1,X : PHA
    LDA.L SRAM_Slot0Checksum0,X : PHA
    LDA.L SRAM_Slot0Complement0,X : PHA
    LDA.W TitleMenu_FileCopyDestSlot : ASL : TAX
    PLA : STA.L SRAM_Slot0Complement0,X
    PLA : STA.L SRAM_Slot0Checksum0,X
    PLA : STA.L SRAM_Slot0Complement1,X
    PLA : STA.L SRAM_Slot0Checksum1,X
    INC.W PauseMenu_MenuIndex
    LDX.W #$0500
    LDA.W #$000F

  .loopRows:
    STA.L MenuTilemap,X
    INX #2 : CPX.W #$0740 : BMI .loopRows
    LDA.W TitleMenu_FileCopyDestSlot : ASL : TAX
    LDA.W NonEmptySaveSlots : ORA.W .list,X : STA.W NonEmptySaveSlots
    LDA.W TitleMenu_FileCopyDestSlot : ASL #2
    CLC : ADC.W #$0009 : ASL #6
    CLC : ADC.W #$0018 : TAX
    LDY.W #$0000
    LDA.W #$000F

  .loopColumns:
    STA.L MenuTilemap,X : STA.L MenuTilemap-$40,X
    INX #2
    INY #2 : CPY.W #$0016 : BMI .loopColumns
    LDY.W #Tilemap_FileSelect_copyCompleted
    LDX.W #($8<<1)|($14<<6) ; $0510
    STZ.W Enemy.palette
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    JMP Draw_FileCopyClear_Confirmation_SaveFileInfo

  .list:
    dw $0001,$0002,$0004


;;; $9AFA: File select menu - index Eh: file copy - copy completed ;;;
FileSelectMenu_IndexE_FileCopy_CopyCompleted:
    JSL Draw_Border_Around_DATA_COPY_MODE
    LDA.B DP_Controller1New : BEQ .return
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    INC.W PauseMenu_MenuIndex
    LDA.L SRAM_SaveSlotSelected : CMP.W #$0000 : BMI .zero
    CMP.W #$0003 : BPL .zero
    TAX
    AND.L SRAM_SaveSlotSelectedComplement : BEQ .validSaveSlot

  .zero:
    LDX.W #$0000

  .validSaveSlot:
    STX.W SaveSlotSelected

  .return:
    RTS


;;; $9B28: File select menu - index 12h: file copy to main - menu index = main ;;;
FileSelectMenu_Index12_FileCopyToMain_MenuIndex_Main:
    LDA.W PauseMenu_MenuIndex : SEC : SBC.W #$000E : STA.W PauseMenu_MenuIndex
    RTS


;;; $9B33: File select menu - index 14h: main to file clear - initialise ;;;
FileSelectMenu_Index14_MainToFileClear_Initialise:
    REP #$30
    JSL Draw_Border_Around_DATA_CLEAR_MODE
    INC.W PauseMenu_MenuIndex


;;; $9B3C: Initialise file select menu file clear ;;;
Initialise_FileSelectMenu_FileClear:
    JSR ClearMenuTilemap
    LDY.W #Tilemap_FileSelect_dataClearMode
    LDX.W #($8<<1)|($1<<6)                                               ; $0050
    STZ.W Enemy.palette
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDY.W #Tilemap_FileSelect_clearWhichData
    LDX.W #($0<<1)|($5<<6)                                               ; $0140
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    JSR LoadMenuExitTilemap
    JSR Draw_FileCopyClear_SaveFileInfo
    STZ.W TitleMenu_FileCopySrcFileClearSlot
    JSR SetInitial_FileCopyClear_MenuSelection
    JSR Set_FileClearMenuSelection_MissilePosition
    RTS


;;; $9B64: File select menu - index 16h: file clear - select slot ;;;
FileSelectMenu_Index16_FileClear_SelectSlot:
    REP #$30
    JSL Draw_Border_Around_DATA_CLEAR_MODE
    JSL Draw_Menu_Selection_Missile
    LDA.B DP_Controller1New : BIT.W #$1080 : BNE .select
    BIT.W #$8000 : BNE .exit
    BIT.W #$0800 : BNE .up
    BIT.W #$0400 : BEQ Set_FileClearMenuSelection_MissilePosition
    SEP #$30
    LDA.W NonEmptySaveSlots
    LDX.W CinematicBGObject_IndirectInstructionPointers

  .loopDown:
    INX : CPX.B #$04 : BPL Set_FileClearMenuSelection_MissilePosition
    CPX.B #$03 : BEQ +
    BIT.W .data,X : BEQ .loopDown

+   STX.W CinematicBGObject_IndirectInstructionPointers
    LDA.B #$37
    JSL QueueSound_Lib1_Max6
    BRA Set_FileClearMenuSelection_MissilePosition

  .exit:
    REP #$30
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    LDA.W PauseMenu_MenuIndex : CLC : ADC.W #$0005 : STA.W PauseMenu_MenuIndex
    RTS

  .up:
    SEP #$30
    LDA.W NonEmptySaveSlots
    LDX.W CinematicBGObject_IndirectInstructionPointers

  .loopUp:
    DEX : BMI Set_FileClearMenuSelection_MissilePosition
    BIT.W .data,X : BEQ .loopUp
    STX.W CinematicBGObject_IndirectInstructionPointers
    LDA.B #$37
    JSL QueueSound_Lib1_Max6
    BRA Set_FileClearMenuSelection_MissilePosition

  .select:
    REP #$30
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    LDA.W CinematicBGObject_IndirectInstructionPointers : CMP.W #$0003 : BEQ .exit
    STA.W TitleMenu_FileCopySrcFileClearSlot
    INC.W PauseMenu_MenuIndex
    RTS

  .data:
    db $01,$02,$04


;;; $9BEF: Set file clear menu selection missile position ;;;
Set_FileClearMenuSelection_MissilePosition:
    REP #$30
    LDA.W CinematicBGObject_IndirectInstructionPointers : ASL : TAX
    LDA.W .positions,X : STA.W Mode7Object_InstructionTimers+2
    LDA.W #$0016 : STA.W Mode7Object_InstListPointers
    RTS

  .positions:
    dw $0048,$0068,$0088,$00D3


;;; $9C0B: File select menu - index 17h: file clear - initialise confirmation ;;;
FileSelectMenu_Index17_FileClear_InitialiseConfirmation:
    JSL Draw_Border_Around_DATA_CLEAR_MODE
    LDY.W #Tilemap_FileSelect_clearSamusA
    LDX.W #($0<<1)|($5<<6)                                               ; $0140
    STZ.W Enemy.palette
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDA.W TitleMenu_FileCopySrcFileClearSlot : CLC : ADC.W #$206A : STA.L MenuTilemap+$16A
    LDA.W #$0003 : STA.W TitleMenu_FileCopyDestSlot
    JSR Draw_FileCopyClear_Confirmation
    INC.W PauseMenu_MenuIndex
    STZ.W CinematicBGObject_IndirectInstructionPointers
    RTS


;;; $9C36: File select menu - index 18h: file clear - confirmation ;;;
FileSelectMenu_Index18_FileClear_Confirmation:
    JSL Draw_Border_Around_DATA_CLEAR_MODE
    JSL Draw_Menu_Selection_Missile
    LDA.B DP_Controller1New : BIT.W #$0C00 : BNE .toggle
    BIT.W #$8000 : BNE .B
    BIT.W #$1080 : BEQ .setMissilePosition
    LDA.W #$0038
    JSL QueueSound_Lib1_Max6
    LDA.W CinematicBGObject_IndirectInstructionPointers : BEQ .yes

  .B:
    LDA.W PauseMenu_MenuIndex : SEC : SBC.W #$0002 : STA.W PauseMenu_MenuIndex
    LDA.W TitleMenu_FileCopySrcFileClearSlot : STA.W CinematicBGObject_IndirectInstructionPointers
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    JMP Initialise_FileSelectMenu_FileClear

  .yes:
    INC.W PauseMenu_MenuIndex
    RTS

  .toggle:
    LDA.W CinematicBGObject_IndirectInstructionPointers : EOR.W #$0001 : STA.W CinematicBGObject_IndirectInstructionPointers
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6

  .setMissilePosition:
    LDY.W #$00B8
    LDA.W CinematicBGObject_IndirectInstructionPointers : BEQ +
    LDY.W #$00D0

+   STY.W Mode7Object_InstructionTimers+2
    LDA.W #$005E : STA.W Mode7Object_InstListPointers
    RTS


;;; $9C9E: File select menu - index 19h: file clear - do file clear ;;;
FileSelectMenu_Index19_FileClear_DoFileClear:
    REP #$30
    JSL Draw_Border_Around_DATA_CLEAR_MODE
    LDA.W #$0070 : STA.B DP_Temp02
    LDA.W TitleMenu_FileCopySrcFileClearSlot : ASL : TAX
    LDA.L SaveSlotOffsets,X : STA.B DP_Temp00
    LDY.W #$0000
    LDA.W #$0000

  .loopClear:
    STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$065C : BMI .loopClear
    LDA.W TitleMenu_FileCopySrcFileClearSlot : ASL : TAX
    LDA.W #$0000
    STA.L SRAM_Slot0Checksum0,X : STA.L SRAM_Slot0Complement0,X
    STA.L SRAM_Slot0Checksum1,X : STA.L SRAM_Slot0Complement1,X
    INC.W PauseMenu_MenuIndex
    JSR NewSaveFile
    LDA.W TitleMenu_FileCopySrcFileClearSlot
    JSL LoadFromSRAM
    LDA.W TitleMenu_FileCopySrcFileClearSlot : STA.W AreaIndex
    JSL LoadMirrorOfCurrentAreasMapExplored
    LDX.W #$0500
    LDA.W #$000F

  .loopRows:
    STA.L MenuTilemap,X
    INX #2 : CPX.W #$0740 : BMI .loopRows
    LDA.W TitleMenu_FileCopySrcFileClearSlot : ASL : TAX
    LDA.W NonEmptySaveSlots : AND.W .data,X : STA.W NonEmptySaveSlots
    LDY.W #Tilemap_FileSelect_dataCleared
    LDX.W #($0<<1)|($14<<6) ; $0500
    STZ.W Enemy.palette
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    JMP Draw_FileCopyClear_Confirmation_SaveFileInfo

  .data:
    dw $FFFE,$FFFD,$FFFB


;;; $9D26: File select menu - index 1Ah: file clear - clear completed ;;;
FileSelectMenu_Index1A_FileClear_ClearCompleted:
    JSL Draw_Border_Around_DATA_CLEAR_MODE
    LDA.B DP_Controller1New : BEQ .return
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    INC.W PauseMenu_MenuIndex
    LDA.W #$0000
    JSL LoadFromSRAM
    BCS .slotACorrupt

  .selectSlotA:
    LDA.W #$0000 : STA.W SaveSlotSelected
    RTS

  .slotACorrupt:
    LDA.W #$0001
    JSL LoadFromSRAM
    BCS +
    LDA.W #$0001 : STA.W SaveSlotSelected
    RTS

+   LDA.W #$0002
    JSL LoadFromSRAM
    BCS .selectSlotA
    LDA.W #$0002 : STA.W SaveSlotSelected

  .return:
    RTS


;;; $9D68: File select menu - index 1Eh: file clear to main - menu index = main ;;;
FileSelectMenu_Index1E_FileClearToMain_MenuIndex_Main:
    JSL Draw_Border_Around_SAMUS_DATA
    LDA.W PauseMenu_MenuIndex : SEC : SBC.W #$001A : STA.W PauseMenu_MenuIndex
    RTS


;;; $9D77: File select menu - index 1Fh: main to options menu - turn Samus helmet ;;;
FileSelectMenu_Index1F_MainToOptionsMenu_TurnSamusHelmet:
    JSL Draw_Menu_Selection_Missile
    JSL Draw_Border_Around_SAMUS_DATA
    LDX.W #$0004
    JSR Draw_FileSelect_Slot_SamusHelmet
    LDX.W #$0006
    JSR Draw_FileSelect_Slot_SamusHelmet
    LDX.W #$0008
    JSR Draw_FileSelect_Slot_SamusHelmet
    LDA.B DP_Controller1New : BIT.W #$1080 : BNE .advance
    LDA.W TitleMenu_SlotAHelmetAnimationFrame : CMP.W #$0007 : BNE +
    LDA.W TitleMenu_SlotAHelmetAnimationTimer : BEQ .advance

+   LDA.W TitleMenu_SlotBHelmetAnimationFrame : CMP.W #$0007 : BNE +
    LDA.W TitleMenu_SlotBHelmetAnimationTimer : BEQ .advance

+   LDA.W TitleMenu_SlotCHelmetAnimationFrame : CMP.W #$0007 : BNE .return
    LDA.W TitleMenu_SlotCHelmetAnimationTimer : BNE .return

  .advance:
    INC.W PauseMenu_MenuIndex

  .return:
    RTS


;;; $9DC3: Draw file select Samus helmets ;;;
Draw_FileSelect_SamusHelmets:
    LDX.W #$0004
    LDA.W #$0000 : STA.W EnemyProjectile_Enable,X
    JSR Draw_FileSelect_Slot_SamusHelmet
    LDX.W #$0006
    LDA.W #$0000 : STA.W EnemyProjectile_Enable,X
    JSR Draw_FileSelect_Slot_SamusHelmet
    LDX.W #$0008
    LDA.W #$0000 : STA.W EnemyProjectile_Enable,X


;;; $9DE4: Draw file select slot Samus helmet ;;;
Draw_FileSelect_Slot_SamusHelmet:
;; Parameters:
;;     X: Slot Samus helmet index. 4/6/8 for slot A/B/C
    PHX : PHB
    PHK : PLB
    LDA.W EnemyProjectile_Enable,X : BEQ .timerHandled
    DEC : STA.W EnemyProjectile_Enable,X : BNE .timerHandled
    LDA.W #$0008 : STA.W EnemyProjectile_Enable,X
    LDA.W EnemyProjectile_ID,X : INC : CMP.W #$0008 : BMI +
    LDA.W #$0000 : STA.W EnemyProjectile_Enable,X
    LDA.W #$0007

+   STA.W EnemyProjectile_ID,X

  .timerHandled:
    LDA.W EnemyProjectile_ID,X : ASL : TAY
    LDA.W #$0E00 : STA.B $03
    LDA.W .data,Y : PHA
    LDA.W Mode7Object_InstructionTimers+2,X : TAY
    LDA.W Mode7Object_InstListPointers,X : TAX
    PLA
    JSL AddSpritemapFrom_82C569_TableToOAM
    PLB : PLX
    RTS

  .data:
    dw $002C,$002D,$002E,$002F,$0030,$0031,$0032,$0033,$0033


;;; $9E3E: File select map ;;;
FileSelectMap:
    REP #$30
    PHB
    PHK : PLB
    LDA.W PauseMenu_MenuIndex : ASL : TAX
    JSR.W (.pointers,X)
    PLB
    RTL

  .pointers:
    dw FileSelectMap_Index0_GameOptionsToAreaSelectMap_ClearBG2
    dw FileSelectMap_Index1_GameOptionsToAreaSelectMap_FadeOut
    dw FileSelectMap_Index2_11_Load_AreaSelect_ForegroundTilemap
    dw FileSelectMap_Index3_GameOptionsToAreaSelectMap
    dw FileSelectMap_Index4_13_PrepareTransitionToAreaSelectMap
    dw FileSelectMap_Index5_GameOptionsToAreaSelectMap_ExpSqrTrans
    dw FileSelectMap_Index6_AreaSelectMap
    dw FileSelectMap_Index7_AreaSelectMapToRoomSelectMap
    dw FileSelectMap_Index8_AreaSelectMapToRoomSelectMap
    dw FileSelectMap_Index9_AreaSelectMapToRoomSelectMap_Init
    dw FileSelectMap_IndexA_RoomSelectMap
    dw FileSelectMap_IndexB_C_RoomSelectMapToLoadingGameData
    dw FileSelectMap_IndexB_C_RoomSelectMapToLoadingGameData
    dw FileSelectMap_IndexD_RoomSelectMapToAreaSelectMap_FadeOut
    dw FileSelectMap_IndexE_RoomSelectMapToLoadingGameData_Wait
    dw FileSelectMap_IndexF_RoomSelectMapToAreaSelectMap_ClearBG1
    dw FileSelectMap_Index10_RoomSelectMapToAreaSelectMap_LoadPal
    dw FileSelectMap_Index2_11_Load_AreaSelect_ForegroundTilemap
    dw FileSelectMap_Index12_RoomSelectMapToAreaSelectMap
    dw FileSelectMap_Index4_13_PrepareTransitionToAreaSelectMap
    dw FileSelectMap_Index14_PrepContractSquareTransToAreaSelect
    dw FileSelectMap_Index15_RoomSelectMapToAreaSelectMap
    dw FileSelectMap_Index16_FileClear_AreaSelectMapToGameOptions


;;; $9E7B: File select map - index 16h: file clear - area select map to game options ;;;
FileSelectMap_Index16_FileClear_AreaSelectMapToGameOptions:
    JSR DrawAreaSelectMapLabels
    JSL HandleFadingOut
    LDA.B DP_Brightness : AND.W #$000F : BNE .return
    LDA.W #$0002 : STA.W GameState
    STZ.W PauseMenu_MenuIndex

  .return:
    RTS


;;; $9E93: File select menu - index 1: title sequence to main - load BG2 ;;;
FileSelectMenu_Index1_TitleSequenceToMain_LoadBG2:
    REP #$30
    LDX.W #$07FE
    LDA.W #$000F

  .loop:
    LDA.L Zebes_and_Stars_Tilemap,X : STA.L MenuTilemap,X
    DEX #2 : BPL .loop
    LDX.W VRAMWriteStack
    LDA.W #$0800 : STA.B VRAMWrite.size,X
    LDA.W #$3600 : STA.B VRAMWrite.src,X
    LDA.W #$007E : STA.B VRAMWrite.src+2,X
    LDA.B DP_BG2TilemapAddrSize : AND.W #$00FC : XBA : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    INC.W PauseMenu_MenuIndex
    LDA.W #$0001 : STA.W EnemyProjectile_Enable : STZ.W EnemyProjectile_ID
    RTS


;;; $9ED6: File select menu - index 2: title sequence to main - initialise ;;;
FileSelectMenu_Index2_TitleSequenceToMain:
    REP #$30
    LDA.L SRAM_SaveSlotSelected : CMP.W #$0000 : BMI +
    CMP.W #$0003 : BPL +
    TAX : AND.L SRAM_SaveSlotSelectedComplement : BEQ .validSaveSlot

+   LDX.W #$0000

  .validSaveSlot:
    STX.W SaveSlotSelected
; fallthrough to FileSelectMenu_Index10_1C_ReloadMain


;;; $9EF3: File select menu - index 10h/1Ch: reload main ;;;
FileSelectMenu_Index10_1C_ReloadMain:
    LDX.W #$07FE
    LDA.W #$000F

  .loopTilemap:
    STA.L MenuTilemap,X
    DEX #2 : BPL .loopTilemap
    LDA.W #$FFFF : STA.W NonEmptySaveSlots
    LDY.W #Tilemap_FileSelect_SamusData
    LDX.W #($B<<1)|($1<<6) ; $0056
    STZ.W Enemy.palette
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDY.W #Tilemap_FileSelect_SamusA
    LDX.W #($3<<1)|($5<<6) ; $0146
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDA.W #$0000
    JSR LoadFromSRAM_external
    ROR.W NonEmptySaveSlots
    LDX.W #$015C
    LDA.W NonEmptySaveSlots : BIT.W #$8000 : JSR Draw_FileSelection_Health
    LDX.W #$01B4
    LDA.W NonEmptySaveSlots : BIT.W #$8000
    JSR Draw_FileSelection_Time
    LDY.W #Tilemap_FileSelect_time
    LDX.W #($1B<<1)|($5<<6) ; $0176
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDY.W #Tilemap_FileSelect_SamusB
    LDX.W #($3<<1)|($A<<6) ; $0286
    STZ.W Enemy.palette
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDA.W #$0001
    JSR LoadFromSRAM_external
    ROR.W NonEmptySaveSlots
    LDX.W #$029C
    LDA.W NonEmptySaveSlots : BIT.W #$8000
    JSR Draw_FileSelection_Health
    LDX.W #$02F4
    LDA.W NonEmptySaveSlots : BIT.W #$8000
    JSR Draw_FileSelection_Time
    LDY.W #Tilemap_FileSelect_time
    LDX.W #($1B<<1)|($A<<6) ; $02B6
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDY.W #Tilemap_FileSelect_SamusC
    LDX.W #($3<<1)|($F<<6) ; $03C6
    STZ.W Enemy.palette
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDA.W #$0002
    JSR LoadFromSRAM_external
    ROR.W NonEmptySaveSlots
    LDX.W #$03DC
    LDA.W NonEmptySaveSlots : BIT.W #$8000
    JSR Draw_FileSelection_Health
    LDX.W #$0434
    LDA.W NonEmptySaveSlots : BIT.W #$8000
    JSR Draw_FileSelection_Time
    LDY.W #Tilemap_FileSelect_time
    LDX.W #($1B<<1)|($F<<6) ; $03F6
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDA.W NonEmptySaveSlots : EOR.W #$FFFF : XBA : LSR #5 : STA.W NonEmptySaveSlots
    CMP.W #$0000 : BEQ .loadTilemap
    LDY.W #Tilemap_FileSelect_dataCopy
    LDX.W #($4<<1)|($14<<6) ; $0508
    STZ.W Enemy.palette
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDY.W #Tilemap_FileSelect_dataClear
    LDX.W #($4<<1)|($17<<6) ; $05C8
    STZ.W Enemy.palette
    JSR Load_Tilemap_in_Y_to_X_Coordinates

  .loadTilemap:
    LDY.W #Tilemap_FileSelect_exit
    LDX.W #($4<<1)|($1A<<6) ; $0688
    STZ.W Enemy.palette
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    JSR QueueTransfer_MenuTilemap_ToVRAMBG1
    LDA.W #$0001 : STA.W EnemyProjectile_Enable
    DEC
    STA.W Mode7TransformationZoomLevel
    STA.W TitleMenu_SlotAHelmetAnimationTimer : STA.W TitleMenu_SlotBHelmetAnimationTimer : STA.W TitleMenu_SlotCHelmetAnimationTimer
    STA.W EnemyProjectile_ID
    STA.W neverRead1999
    STA.W TitleMenu_SlotAHelmetAnimationFrame : STA.W TitleMenu_SlotBHelmetAnimationFrame : STA.W TitleMenu_SlotCHelmetAnimationFrame
    STA.W Mode7Object_InstListPointers : STA.W Mode7Object_InstructionTimers+2
    STA.W neverRead19A3 : STA.W neverRead19AD
    LDA.W #$0064
    STA.W TitleMenu_SlotAHelmetXPosition : STA.W TitleMenu_SlotBHelmetXPosition : STA.W TitleMenu_SlotCHelmetXPosition
    LDA.W #$002F : STA.W TitleMenu_SlotAHelmetYPosition
    LDA.W #$0057 : STA.W TitleMenu_SlotBHelmetYPosition
    LDA.W #$007F : STA.W TitleMenu_SlotCHelmetYPosition
    LDA.W #$0001 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter
    JSL ClearForceBlankAndWaitForNMI
    INC.W PauseMenu_MenuIndex
    STZ.W CinematicBGObject_IndirectInstructionPointers
    STZ.W TitleMenu_FileCopySrcFileClearSlot : STZ.W TitleMenu_FileCopyDestSlot
    RTS


;;; $A053: Load from SRAM / clear SRAM ;;;
LoadFromSRAM_external:
;; Parameter:
;;     A: SRAM slot (0, 1 or 2)
;; Returns:
;;     Carry: Set if SRAM was corrupt
    JSL LoadFromSRAM
    RTS


;;; $A058: File select menu - index 3: title sequence to main - fade in ;;;
FileSelectMenu_Index3_TitleSequenceToMain_FadeIn:
    JSR Draw_FileSelect_SamusHelmets
    LDA.W SaveSlotSelected : ASL #2 : TAX
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Yposition,X : STA.W Mode7Object_InstructionTimers+2
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Xposition,X : STA.W Mode7Object_InstListPointers
    JSL Draw_Menu_Selection_Missile
    JSL Draw_Border_Around_SAMUS_DATA
    JSL HandleFadingIn
    LDA.B DP_Brightness : AND.W #$000F : CMP.W #$000F : BNE .return
    INC.W PauseMenu_MenuIndex

  .return:
    RTS


;;; $A087: Draw file selection health ;;;
Draw_FileSelection_Health:
;; Parameters:
;;     X: Menu tilemap index
;;     Zero: Clear if SRAM is corrupt
    BEQ .zero
    PHX
    JSR ClearResetOfMenuTilemapRow
    PLA : CLC : ADC.W #$0040 : TAX
    LDY.W #Tilemap_FileSelect_noData
    JMP Load_Tilemap_in_Y_to_X_Coordinates

  .zero:
    STX.B DP_Temp1A
    LDY.W #Tilemap_FileSelect_energy
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDA.B DP_Temp1A : CLC : ADC.W #$0008 : TAX
    LDA.W Energy : STA.W $4204
    SEP #$20
    LDA.B #$64 : STA.W $4206
    PHA : PLA : PHA : PLA
    REP #$20
    LDA.W $4214 : STA.B DP_Temp14
    LDA.W $4216 : STA.B DP_Temp12
    LDA.W MaxEnergy : STA.W $4204
    SEP #$20
    LDA.B #$64 : STA.W $4206
    PHA : PLA : PHA : PLA
    REP #$20
    LDA.W $4214 : STA.B DP_Temp16
    LDA.W #$0007 : STA.B DP_Temp18
    TXA : CLC : ADC.W #$0040 : TAX

  .loop:
    DEC.B DP_Temp16 : BMI .etanksDrawn
    LDY.W #$0099
    LDA.B DP_Temp14 : BEQ +
    DEC.B DP_Temp14
    LDY.W #$0098

+   TYA : ORA.W Enemy.palette : STA.L MenuTilemap,X
    INX #2
    DEC.B DP_Temp18 : BNE .loop
    TXA : SEC : SBC.W #$004E : TAX
    LDA.W #$0008 : STA.B DP_Temp18
    BRA .loop

  .etanksDrawn:
    LDX.B DP_Temp1A
    LDA.B DP_Temp12 : STA.W $4204
    SEP #$20
    LDA.B #$0A : STA.W $4206
    PHA : PLA : PHA : PLA
    REP #$20
    LDA.W $4214 : STA.B DP_Temp14
    LDA.W $4216 : STA.B DP_Temp12
    LDX.B DP_Temp1A
    LDA.B DP_Temp12 : CLC : ADC.W #$2060 : ORA.W Enemy.palette : STA.L MenuTilemap+$44,X
    LDA.B DP_Temp14 : CLC : ADC.W #$2060 : ORA.W Enemy.palette : STA.L MenuTilemap+$42,X
    RTS


;;; $A14E: Draw file selection time ;;;
Draw_FileSelection_Time:
;; Parameters:
;;     X: Menu tilemap index
;;     Zero: Clear if SRAM is corrupt
    BNE .return
    STX.B DP_Temp1A
    LDA.W IGTHours : STA.W $4204
    SEP #$20
    LDA.B #$0A : STA.W $4206
    PHA : PLA : PHA : PLA
    REP #$20
    LDX.B DP_Temp1A
    LDA.W $4216 : CLC : ADC.W #$2060 : ORA.W Enemy.palette : STA.L MenuTilemap+2,X
    LDA.W $4214 : CLC : ADC.W #$2060 : ORA.W Enemy.palette : STA.L MenuTilemap,X
    LDA.B DP_Temp1A : CLC : ADC.W #$0004 : TAX
    LDY.W #Tilemap_FileSelect_colon
    JSR Load_Tilemap_in_Y_to_X_Coordinates
    LDA.W IGTMinutes : STA.W $4204
    SEP #$20
    LDA.B #$0A : STA.W $4206
    PHA : PLA : PHA : PLA
    REP #$20
    LDX.B $1A
    LDA.W $4216 : CLC : ADC.W #$2060 : ORA.W Enemy.palette : STA.L MenuTilemap+8,X
    LDA.W $4214 : CLC : ADC.W #$2060 : ORA.W Enemy.palette : STA.L MenuTilemap+6,X

  .return:
    RTS


;;; $A1C2: File select menu - index 4: main ;;;
FileSelectMenu_Index4_Main:
    REP #$30
    JSL Draw_Border_Around_SAMUS_DATA
    JSL Draw_Menu_Selection_Missile
    LDX.W #$0004
    JSR Draw_FileSelect_Slot_SamusHelmet
    LDX.W #$0006
    JSR Draw_FileSelect_Slot_SamusHelmet
    LDX.W #$0008
    JSR Draw_FileSelect_Slot_SamusHelmet
    LDA.B DP_Controller1New : BIT.W #$1080 : BNE .select
    BIT.W #$0800 : BNE .up
    BIT.W #$0400 : BEQ +
    JMP .down

+   BIT.W #$8000 : BEQ .goto_done
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    LDA.W #$0021 : STA.W PauseMenu_MenuIndex
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6

  .goto_done:
    JMP .done

  .select:
    LDA.W SaveSlotSelected : CMP.W #$0003 : BMI +
    JMP .fileOperation

+   LDA.W #$002A
    JSL QueueSound_Lib1_Max6
    LDA.W PauseMenu_MenuIndex : CLC : ADC.W #$001B : STA.W PauseMenu_MenuIndex
    LDA.W SaveSlotSelected : CLC : ADC.W #$0002 : ASL : TAX
    LDA.W #$0001 : STA.W EnemyProjectile_Enable,X
    LDA.W SaveSlotSelected : STA.L SRAM_SaveSlotSelected
    EOR.W #$FFFF : STA.L SRAM_SaveSlotSelectedComplement
    LDA.W SaveSlotSelected
    JSL LoadFromSRAM
    BCS +
    JSL LoadMirrorOfCurrentAreasMapExplored
    BRA .done

+   JSR NewSaveFile
    STZ.W CurrentAreaMapCollectedFlag
    BRA .done

  .up:
    LDA.W NonEmptySaveSlots : BEQ +
    LDA.W SaveSlotSelected : DEC : BPL .storeSelection
    LDA.W #$0005
    BRA .storeSelection

+   LDA.W SaveSlotSelected : DEC : BPL +
    LDA.W #$0005
    BRA .storeSelection

+   CMP.W #$0004 : BMI .storeSelection
    LDA.W #$0002

  .storeSelection:
    STA.W SaveSlotSelected
    BRA .cursorSound

  .down:
    LDA.W NonEmptySaveSlots : BEQ +
    LDA.W SaveSlotSelected : INC : CMP.W #$0006 : BMI .storeSelection2
    LDA.W #$0000
    BRA .storeSelection2

+   LDA.W SaveSlotSelected : INC : CMP.W #$0003 : BMI .storeSelection2
    CMP.W #$0006 : BPL .zero
    LDA.W #$0005
    BRA .storeSelection2

  .zero:
    LDA.W #$0000

  .storeSelection2:
    STA.W SaveSlotSelected

  .cursorSound:
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6

  .done:
    LDA.W SaveSlotSelected : ASL #2 : TAX
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Yposition,X : STA.W Mode7Object_InstructionTimers+2
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Xposition,X : STA.W Mode7Object_InstListPointers
    RTS

  .fileOperation:
    CMP.W #$0003 : BNE +
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    INC.W PauseMenu_MenuIndex
    LDA.B DP_Mosaic : AND.W #$FF0F : ORA.W #$0003 : STA.B DP_Mosaic
    RTS

+   CMP.W #$0004 : BNE .checkFive
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    LDA.W PauseMenu_MenuIndex : CLC : ADC.W #$000F : STA.W PauseMenu_MenuIndex
    LDA.B DP_Mosaic : AND.W #$FF0F : ORA.W #$0003 : STA.B DP_Mosaic

  .checkFive:
    CMP.W #$0005 : BNE .return
    LDA.W #$0021 : STA.W PauseMenu_MenuIndex

  .return:
    RTS


;;; $A312: File select menu selection missile co-ordinates ;;;
FileSelectMenu_SelectionMissile_Coordinates:
  .Yposition:
    dw $0030
  .Xposition:
    dw       $000E ; Slot A
    dw $0058,$000E ; Slot B
    dw $0080,$000E ; Slot C
    dw $00A3,$000E ; File copy
    dw $00BB,$000E ; File clear
    dw $00D3,$000E ; Exit


;;; $A32A: File select map - index 0: game options to area select map - clear BG2 and set up fade out ;;;
FileSelectMap_Index0_GameOptionsToAreaSelectMap_ClearBG2:
    REP #$30
    JSR ClearMenuTilemap
    LDX.W VRAMWriteStack
    LDA.W #$0800 : STA.B VRAMWrite.size,X
    LDA.W #MenuTilemap : STA.B VRAMWrite.src,X
    LDA.W #MenuTilemap>>16 : STA.B VRAMWrite.src+2,X
    LDA.B DP_BG2TilemapAddrSize : AND.W #$00FC : XBA : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    LDA.W #$0000 : STA.L PaletteChangeNumerator
    JSR LoadFileSelectPalettes
    LDX.W #$0000

  .loop:
    LDA.L Palettes,X : STA.L TargetPalettes_BGP0,X
    INX #2 : CPX.W #$0040 : BMI .loop
    LDA.W #$0000 : STA.L TargetPalettes_BGP0+$1C : STA.L TargetPalettes_BGP1+$1C
    INC.W PauseMenu_MenuIndex
    RTS


;;; $A37C: File select map - index 1: game options to area select map - fade out and load area palettes ;;;
FileSelectMap_Index1_GameOptionsToAreaSelectMap_FadeOut:
    REP #$30
    LDX.W #$0000
    LDY.W #$0040
    JSL Advance_GradualColorChange_ofPaletteRAM
    BCC .return
    STZ.B DP_BG1YScroll : STZ.B DP_BG1XScroll
    STZ.B DP_BG2YScroll : STZ.B DP_BG2XScroll
    LDX.W #$0000
    LDA.W AreaIndex

  .loopMapAreaIndex:
    CMP.W FileSelectMapArea_IndexTable,X : BEQ +
    INX #2 : CPX.W #$000C : BMI .loopMapAreaIndex
    LDX.W #$0000

+   TXA : LSR : STA.W FileSelectMapAreaIndex
    LDX.W #$0000

  .loopAreaColors:
    PHX
    CPX.W AreaIndex : BEQ .loadForegroundColors
    JSR LoadInactiveAreaMapForegroundColors
    BRA +

  .loadForegroundColors:
    JSR LoadActiveAreaMapForegroundColors

+   PLX
    INX : CPX.W #$0006 : BMI .loopAreaColors
    INC.W PauseMenu_MenuIndex
    STZ.W neverRead0787
    SEP #$20
    LDA.B #$02 : STA.B DP_MainScreenLayers

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $A3D1: Unused. REP #$30 ;;;
UNUSED_REP30_81A3D1:
    REP #$30
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A3D3: Load active area map foreground colours ;;;
LoadActiveAreaMapForegroundColors:
;; Parameters:
;;     X: Area index
    TXA : ASL : TAX
    LDA.W AreaSelectMap_ForegroundPaletteTable_indices_active,X : TAY
    BRA LoadAreaMapForegroundColors


;;; $A3DC: Load inactive area map foreground colours ;;;
LoadInactiveAreaMapForegroundColors:
;; Parameters:
;;     X: Area index
    TXA : ASL : TAX
    LDA.W AreaSelectMap_ForegroundPaletteTable_indices_inactive,X : TAY
; fallthrough to LoadAreaMapForegroundColors


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
    LDA.W AreaSelectMap_ForegroundPaletteTable_data,Y : CMP.W #$FFFF : BEQ .return
    PHY : PHA
    LDA.W AreaSelectMap_ForegroundPaletteTable_RAM,Y : TAX
    PLY
    LDA.W #$0005 : STA.B DP_Temp12

  .loopColors:
    LDA.W AreaSelectMap_ForgegroundPaletteTable,Y : STA.L Palettes,X
    INX #2
    INY #2
    DEC.B DP_Temp12 : BNE .loopColors
    PLY : INY #2
    INY #2
    BRA LoadAreaMapForegroundColors

  .return:
    RTS


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
    dw $0000,$000A,$0010,$0016,$0024,$002A

  ..inactive:
    dw $0030,$003A,$0040,$0046,$0054,$005A

;        _________ Palette data index (relative to $A40E)
;       |      ___ Palette RAM index (relative to $7E:C000)
;       |     |
  .data:
    dw $000C
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
    REP #$30
    LDX.W VRAMWriteStack
    LDA.W #$0800 : STA.B VRAMWrite.size,X
    LDA.W #Tilemap_AreaSelect_Foreground : STA.B VRAMWrite.src,X
    LDA.W #Tilemap_AreaSelect_Foreground>>16 : STA.B VRAMWrite.src+2,X
    LDA.B DP_BG1TilemapAddrSize : AND.W #$00FC : XBA : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    LDA.B DP_Brightness : AND.W #$FF00 : ORA.W #$000F : STA.B DP_Brightness
    INC.W PauseMenu_MenuIndex
    RTS


;;; $A578: File select map - index 12h: room select map to area select map - load background tilemap ;;;
FileSelectMap_Index12_RoomSelectMapToAreaSelectMap:
    REP #$30
    INC.W PauseMenu_MenuIndex
    LDY.W AreaIndex
    BRA Load_AreaSelect_BackgroundTilemap


;;; $A582: File select map - index 3: game options to area select map - load background tilemap ;;;
FileSelectMap_Index3_GameOptionsToAreaSelectMap:
    REP #$30
    INC.W PauseMenu_MenuIndex
    LDY.W AreaIndex                                                      ; fallthrough to Load_AreaSelect_BackgroundTilemap


;;; $A58A: Load area select background tilemap ;;;
Load_AreaSelect_BackgroundTilemap:
;; Parameters:
;;     Y: Area index
    LDX.W VRAMWriteStack
    LDA.W #$0800 : STA.B VRAMWrite.size,X
    TYA : XBA : ASL #3 : CLC : ADC.W #Tilemap_AreaSelect_Background_Crateria : STA.B VRAMWrite.src,X
    LDA.W #Tilemap_AreaSelect_Background_Crateria>>16 : STA.B VRAMWrite.src+2,X
    LDA.B DP_BG3TilemapAddrSize : AND.W #$00FC : XBA : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    RTS


;;; $A5B3: File select map - index 4/13h: prepare expanding/contracting square transition to area select map ;;;
FileSelectMap_Index4_13_PrepareTransitionToAreaSelectMap:
    SEP #$20
    LDA.B #$04 : STA.B DP_SubScreenLayers : STA.W $212D
    LDA.B #$04 : STA.B DP_WindowAreaSubScreen : STA.W $212F
    LDA.B #$02 : STA.B DP_ColorMathA : STA.W $2130
    LDA.B #$25 : STA.B DP_ColorMathB : STA.W $2131
    LDA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor2
    LDA.B #$40 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$20 : STA.B DP_ColorMathSubScreenBackdropColor0
    JSR Setup_Initial_ExpandingSquareTransition_HDMA
    LDA.B #$0C : STA.B DP_HDMAEnable : STA.W $420C
    JSR Config_Window1_ExpandingSquareTransition
    STZ.W HDMAObject_Enable : STZ.W HDMAObject_Enable+1
    INC.W PauseMenu_MenuIndex
    REP #$30
    RTS


;;; $A5F6: Configure window 1 for expanding square transition ;;;
Config_Window1_ExpandingSquareTransition:
    SEP #$20
    LDA.B #$13 : STA.B DP_MainScreenLayers : STA.W $212C
    LDA.B #$13 : STA.B DP_WindowAreaMainScreen : STA.W $212E
    LDA.B #$23 : STA.B DP_WindowMaskBG12 : STA.W $2123
    LDA.B #$03 : STA.B DP_WindowMaskBG34 : STA.W $2124
    LDA.B #$23 : STA.B DP_WindowMaskSprite : STA.W $2125
    RTS


;;; $A61C: Set up initial expanding square transition HDMA ;;;
Setup_Initial_ExpandingSquareTransition_HDMA:
    SEP #$20
    LDA.B #$00 : STA.L ExpandingSquare_TopBottomMarginRightPosition : STA.L ExpandingSquare_TopBottomMarginRightPosition+1
    DEC
    STA.L ExpandingSquare_TopBottomMarginLeftPosition : STA.L ExpandingSquare_TopBottomMarginLeftPosition+1
    LDA.B #$7F : STA.L ExpandingSquare_LeftPosition
    LDA.B #$81 : STA.L ExpandingSquare_RightPosition
    LDA.B #$6F : STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable
    LDA.B #$22 : STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+1
    LDA.B #$9E : STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+2
    LDA.B #$01 : STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+3
    LDA.B #$32 : STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+4
    LDA.B #$9E : STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+5
    LDA.B #$01 : STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+6
    LDA.B #$32 : STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+7
    LDA.B #$9E : STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+8
    LDA.B #$6F : STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+9
    LDA.B #$20 : STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+$A
    LDA.B #$9E : STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+$B
    LDA.B #$40 : STA.W $4320
    LDA.B #$26 : STA.W $4321
    LDA.B #$00 : STA.W $4322
    LDA.B #$9E : STA.W $4323
    LDA.B #$7E : STA.W $4324
    STA.W $4327 : STZ.W $4325 : STZ.W $4326
    STZ.W $4328 : STZ.W $4329 : STZ.W $432A
    LDA.B #$6F : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable
    LDA.B #$20 : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+1
    LDA.B #$9E : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+2
    LDA.B #$01 : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+3
    LDA.B #$36 : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+4
    LDA.B #$9E : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+5
    LDA.B #$01 : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+6
    LDA.B #$36 : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+7
    LDA.B #$9E : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+8
    LDA.B #$6F : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+9
    LDA.B #$20 : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+$A
    LDA.B #$9E : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+$B
    LDA.B #$40 : STA.W $4330
    LDA.B #$27 : STA.W $4331
    LDA.B #$10 : STA.W $4332
    LDA.B #$9E : STA.W $4333
    LDA.B #$7E : STA.W $4334
    STA.W $4337 : STZ.W $4335 : STZ.W $4336
    STZ.W $4338 : STZ.W $4339 : STZ.W $433A
    RTS


;;; $A724: Expanding square transition speed ;;;
ExpandingSquareTransitionSpeed:
    db $04


;;; $A725: File select map - index 5: game options to area select map - expanding square transition ;;;
FileSelectMap_Index5_GameOptionsToAreaSelectMap_ExpSqrTrans:
; Prepares the room select map when finished transition
    REP #$30
    JSR DrawAreaSelectMapLabels
    SEP #$20
    LDA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable : SEC : SBC.W ExpandingSquareTransitionSpeed : BMI +
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable : STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+9
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+9
    LDA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+3 : CLC : ADC.W ExpandingSquareTransitionSpeed
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+3 : STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+6
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+3 : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+6
    LDA.L ExpandingSquare_LeftPosition : SEC : SBC.W ExpandingSquareTransitionSpeed : STA.L ExpandingSquare_LeftPosition
    LDA.L ExpandingSquare_RightPosition : CLC : ADC.W ExpandingSquareTransitionSpeed : STA.L ExpandingSquare_RightPosition
    RTS

+   INC.W PauseMenu_MenuIndex
    LDA.B DP_MainScreenLayers : AND.B #$FD : STA.B DP_MainScreenLayers
    LDA.B DP_WindowAreaMainScreen : AND.B #$00 : STA.B DP_WindowAreaMainScreen ; >.<
    LDA.B DP_WindowAreaSubScreen : AND.B #$00 : STA.B DP_WindowAreaSubScreen ; >.<
    LDA.B #$18 : STA.B DP_BG2YScroll
    LDA.B #$00 : STA.B DP_BG2YScroll+1
    REP #$30
    LDA.W #$0001 : STA.W PauseMenu_PaletteAnimationTimer
    LDX.W #$0000

  .copyTilemap:
    LDA.L Tilemap_BG2PauseScreen_BG2RoomSelectMap_0,X : STA.L BG2Tilemap,X
    INX #2 : CPX.W #$0640 : BMI .copyTilemap
    LDA.W #$2801

  .loopTilemap:
    STA.L BG2Tilemap,X
    INX #2 : CPX.W #$0800 : BMI .loopTilemap
    LDA.W #BG2Tilemap+$154 : STA.B DP_Temp00
    LDA.W #BG2Tilemap>>16 : STA.B DP_Temp02
    JSL DrawRoomSelectMap_AreaLabel
    LDY.W #$0140
    LDX.W #$077E

  .loopMapControls:
    LDA.W Tilemap_RoomSelectMap_Controls,Y : STA.L BG2Tilemap,X
    DEX #2
    DEY #2 : BNE .loopMapControls
    LDX.W VRAMWriteStack
    LDA.W #$0800 : STA.B VRAMWrite.size,X
    LDA.W #$4000 : STA.B VRAMWrite.src,X
    LDA.W #$007E : STA.B VRAMWrite.src+2,X
    LDA.B DP_BG2TilemapAddrSize : AND.W #$00FC : XBA : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    RTS


;;; $A800: File select map - index 6: area select map ;;;
FileSelectMap_Index6_AreaSelectMap:
; BUG: The check for debug mode here loads zero if debug mode isn't enabled,
;      causing the subsequent BITs that expect newly pressed controller 1 input in A to always flag zero
;      This means pressing up/left/down/right/select the same frame as B/A/start negates the B/A/start input
    REP #$30
    LDA.B DP_Controller1New : BIT.W #$0A00 : BEQ +
    LDA.W Debug_Enable : BEQ .checkB ; <-- clobbers A >_<;
    JMP .debug

+   BIT.W #$2500 : BEQ .checkB
    LDA.W Debug_Enable : BEQ .checkB ; <-- clobbers A >_<;
    JMP .debugNext

  .checkB:
    BIT.W #$8000 : BEQ +
    LDA.W #$0016 : STA.W PauseMenu_MenuIndex
    JMP DrawAreaSelectMapLabels
+   BIT.W #$1080 : BEQ .JMP_DrawAreaSelectMapLabels
    LDA.W #$0038
    JSL QueueSound_Lib1_Max6
    JMP Select_FileSelectMap_Area

  .JMP_DrawAreaSelectMapLabels:
    JMP DrawAreaSelectMapLabels

  .debug:
    STZ.B DP_Temp18 ; >_<
    LDA.B DP_Temp16 : STA.B DP_Temp18
    LDA.W FileSelectMapAreaIndex
    JSR A_equals_A_Minus_1_Mod_6
    JSR Debug_Check_FileSelectMapArea_CanBeSelected
    BNE .selected
    LDA.B DP_Temp1C
    JSR A_equals_A_Minus_1_Mod_6
    JSR Debug_Check_FileSelectMapArea_CanBeSelected
    BNE .selected
    LDA.B DP_Temp1C
    JSR A_equals_A_Minus_1_Mod_6
    JSR Debug_Check_FileSelectMapArea_CanBeSelected
    BEQ .JMP_DrawAreaSelectMapLabels

  .selected:
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    JSR Switch_Active_FileSelectMapArea
    JMP DrawAreaSelectMapLabels

  .debugNext:
    LDA.W #$0006 : STA.B DP_Temp16
    LDA.W FileSelectMapAreaIndex : STA.B DP_Temp1C

  .loop:
    LDA.B DP_Temp1C
    JSR A_equals_A_Plus_1_Mod_6
    JSR Debug_Check_FileSelectMapArea_CanBeSelected
    BNE .switch
    DEC.B DP_Temp16 : BNE .loop
    JMP DrawAreaSelectMapLabels

  .switch:
    JSR Switch_Active_FileSelectMapArea
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    JMP DrawAreaSelectMapLabels


;;; $A898: A = ([A] - 1) % 6 ;;;
A_equals_A_Minus_1_Mod_6:
    DEC : BPL .return
    LDA.W #$0005

  .return:
    RTS


;;; $A89F: A = ([A] + 1) % 6 ;;;
A_equals_A_Plus_1_Mod_6:
    INC : CMP.W #$0006 : BMI .return
    LDA.W #$0000

  .return:
    RTS



;;; $A8A9: Select file select map area ;;;
Select_FileSelectMap_Area:
    INC.W PauseMenu_MenuIndex
    LDA.W Debug_Enable : BNE .debugEnabled
    LDA.L SRAMMirror_AreaIndex : STA.W AreaIndex
    LDA.L SRAMMirror_SaveStationIndex : STA.W LoadStationIndex
    JMP FileSelectMap_Index6_AreaSelectMap_JMP_DrawAreaSelectMapLabels

  .debugEnabled:
    LDA.W FileSelectMapAreaIndex : ASL : TAX
    LDA.W FileSelectMapArea_IndexTable,X : STA.W AreaIndex
    ASL : TAX
    LDA.L SRAMMirror_UsedSaveStationsElevators,X : STA.B DP_Temp12
    LDX.W #$0000
    LDA.W #MapIcon_PositionTablePointers>>16 : STA.B DP_Temp02
    LDA.W #MapIcon_PositionTablePointers_savePoints : STA.B DP_Temp00
    LDA.W AreaIndex : ASL : TAY
    LDA.B [DP_Temp00],Y

  .crash:
    BEQ .crash
    STA.B DP_Temp00
    LDA.W #$0010 : STA.B DP_Temp14

  .loopSavesElevators:
    LSR.B DP_Temp12 : BCC +
    TXA : ASL #2 : TAY
    LDA.B [DP_Temp00],Y : CMP.W #$FFFE : BEQ +
    CMP.W #$FFFF : BNE .found
    LDX.W #$FFFF

+   INX
    DEC.B DP_Temp14 : BNE .loopSavesElevators
    LDA.W #$0008

  .loopDebugSavePoints:
    TXA : ASL #2 : TAY
    LDA.B [DP_Temp00],Y : CMP.W #$FFFE : BEQ +
    CMP.W #$FFFF : BNE .found
    LDX.W #$FFFF

+   INX
    DEC.B DP_Temp14 : BNE .loopDebugSavePoints

  .crash2:
    BRA .crash2

  .found:
    STX.W LoadStationIndex
    JMP FileSelectMap_Index6_AreaSelectMap_JMP_DrawAreaSelectMapLabels


;;; $A931: Debug. Check if file select map area can be selected ;;;
Debug_Check_FileSelectMapArea_CanBeSelected:
;; Parameters:
;;     A: File select map area index
;; Returns:
;;     Zero: Clear if used save station or elevator in area, or if area has debug elevator markers (which they all do); otherwise set

; Always returns zero clear
    STA.B DP_Temp1C
    ASL : TAX
    LDA.W FileSelectMapArea_IndexTable,X : ASL : TAX
    LDA.L SRAMMirror_UsedSaveStationsElevators,X : BNE .return
    PHB
    LDA.W #MapIcon_PositionTablePointers>>8&$FF00 : PHA : PLB : PLB
    LDA.L MapIcon_PositionTablePointers_savePoints,X : CLC : ADC.W #$0040 : TAX
    LDA.W $0000,X
    PLB
    CMP.W #$FFFF

  .return:
    RTS


;;; $A958: Debug. Switch active file select map area ;;;
Switch_Active_FileSelectMapArea:
    LDA.W FileSelectMapAreaIndex : ASL : TAX
    LDA.W FileSelectMapArea_IndexTable,X : TAX
    JSR LoadInactiveAreaMapForegroundColors
    LDA.B DP_Temp1C : STA.W FileSelectMapAreaIndex
    ASL : TAX
    LDA.W FileSelectMapArea_IndexTable,X : TAX
    JSR LoadActiveAreaMapForegroundColors
    LDA.W FileSelectMapAreaIndex : ASL : TAX
    LDA.W FileSelectMapArea_IndexTable,X : TAY
    JMP Load_AreaSelect_BackgroundTilemap


;;; $A97E: Draw area select map labels ;;;
DrawAreaSelectMapLabels:
    STZ.B DP_Temp03
    LDX.W #$0080
    LDY.W #$0010
    LDA.L AreaSelect_SpritemapBaseIndex
    JSL AddSpritemapFrom_82C569_TableToOAM
    STZ.B DP_Temp1C

  .loopAreas:
    LDX.W #$0200
    LDA.B DP_Temp1C : CMP.W FileSelectMapAreaIndex : BNE +
    LDX.W #$0000

+   STX.B DP_Temp03
    LDA.B DP_Temp1C : ASL : TAX
    LDA.W FileSelectMapArea_IndexTable,X : ASL : TAX
    PHB
    LDA.W #MapIcon_PositionTablePointers>>8&$FF00 : PHA : PLB : PLB
    LDA.L SRAMMirror_UsedSaveStationsElevators,X : STA.B DP_Temp24
    LDA.L MapIcon_PositionTablePointers_savePoints,X : TAX
    LDA.W #$0010 : STA.B DP_Temp1E

  .loopSavePoints:
    LDA.W $0000,X : CMP.W #$FFFF : BEQ .PLBNext
    LSR.B DP_Temp24 : BCC +
    CMP.W #$FFFE : BNE .foundUsedSavePoint

+   TXA : CLC : ADC.W #$0004 : TAX
    DEC.B DP_Temp1E : BNE .loopSavePoints
    LDA.W Debug_Enable : BEQ .PLBNext
    LDA.W $0000,X : CMP.W #$FFFF : BEQ .PLBNext

  .foundUsedSavePoint:
    PLB
    LDA.B DP_Temp1C : ASL : TAX
    LDA.W FileSelectMapArea_IndexTable,X : ASL #2 : TAX
    LDA.W FileSelectMap_Labels_Positions_Y,X : TAY
    LDA.W FileSelectMap_Labels_Positions_X,X : PHA
    LDA.B DP_Temp1C : ASL : TAX
    LDA.W FileSelectMapArea_IndexTable,X : CLC : ADC.L AreaSelect_SpritemapBaseIndex : INC
    PLX
    JSL AddSpritemapFrom_82C569_TableToOAM

  .next:
    INC.B DP_Temp1C
    LDA.B DP_Temp1C : CMP.W #$0006 : BPL .return
    JMP .loopAreas

  .return:
    RTS

  .PLBNext:
    PLB
    BRA .next


;;; $AA1C: Area select map labels positions ;;;
FileSelectMap_Labels_Positions:
  .X:
    dw $005B
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
    dw $3C00                                                             ; Crateria
  .left:
    dw       $FFFE
  .rightSub:
    dw              $3400
  .right:
    dw                    $0003
  .topSub:
    dw                           $0800
  .top:
    dw                                 $FFFF
  .bottomSub:
    dw                                        $0000
  .bottom:
    dw                                              $0004

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
    REP #$30
    JSR DrawAreaSelectMapLabels
    SEP #$20
    JSR Setup_Initial_ExpandingSquareTransition_HDMA
    LDA.B #$13 : STA.B DP_MainScreenLayers
    LDA.B #$13 : STA.B DP_WindowAreaMainScreen
    LDA.B #$32 : STA.B DP_WindowMaskBG12 : STA.W $2123
    LDA.B #$02 : STA.B DP_WindowMaskBG34 : STA.W $2124
    LDA.B #$05 : STA.B DP_ColorMathB : STA.W $2131
    LDA.B #$22 : STA.B DP_WindowMaskSprite : STA.W $2125
    LDA.B #$30 : STA.B DP_BGTilesAddr
    LDA.B #$00 : STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+9 : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+9
    REP #$30
    LDA.W #$4154 : STA.B DP_Temp00
    LDA.W #$007E : STA.B DP_Temp02
    JSL DrawRoomSelectMap_AreaLabel
    LDX.W VRAMWriteStack
    LDA.W #$0200 : STA.B VRAMWrite.size,X
    LDA.W #BG2Tilemap : STA.B VRAMWrite.src,X
    LDA.W #BG2Tilemap>>16 : STA.B VRAMWrite.src+2,X
    LDA.B DP_BG2TilemapAddrSize : AND.W #$00FC : XBA : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    LDA.W AreaIndex : ASL : TAX
    LDA.W RoomSelectMap_ExpandingSquare_Timers,X : STA.L ExpandingSquare_Timer
    TXA : ASL : TAX
    LDA.W FileSelectMap_Labels_Positions_X,X : STA.L ExpandingSquare_LeftPosition : STA.L ExpandingSquare_RightPosition
    LDA.W FileSelectMap_Labels_Positions_Y,X : STA.L ExpandingSquare_TopPosition : STA.L ExpandingSquare_BottomPosition
    LDA.W #$0000
    STA.L ExpandingSquare_LeftSubPosition : STA.L ExpandingSquare_RightSubPosition
    STA.L ExpandingSquare_TopSubPosition : STA.L ExpandingSquare_BottomSubPosition
    TXA : ASL #2 : TAX
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_leftSub,X : STA.L ExpandingSquare_LeftPositionSubVelocity
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_left,X : STA.L ExpandingSquare_LeftPositionVelocity
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_rightSub,X : STA.L ExpandingSquare_RightSubVelocity
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_right,X : STA.L ExpandingSquare_RightVelocity
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_topSub,X : STA.L ExpandingSquare_TopSubVelocity
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_top,X : STA.L ExpandingSquare_TopVelocity
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_bottomSub,X : STA.L ExpandingSquare_BottomSubVelocity
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_bottom,X : STA.L ExpandingSquare_BottomVelocity
    SEP #$20
    JSR Setup_FileSelectMap_ExpandingSquareTransition_HDMA
    LDA.B #$0C : STA.B DP_HDMAEnable : STA.W $420C
    REP #$20
    INC.W PauseMenu_MenuIndex
    LDA.W #$003B
    JSL QueueSound_Lib1_Max6
    RTS


;;; $ABA7: Set up file select map expanding square transition HDMA ;;;
Setup_FileSelectMap_ExpandingSquareTransition_HDMA:
    SEP #$20
    LDX.W #$0000
    LDA.L ExpandingSquare_TopPosition
    LDY.W #ExpandingSquare_TopBottomMarginLeftPosition
    JSR AddExpandingSquareTransition_LeftPos_IndirectHDMATable
    LDY.W #ExpandingSquare_TopBottomMarginRightPosition
    JSR AddExpandingSquareTransition_RightPos_IndirectHDMATable
    LDA.L ExpandingSquare_BottomPosition : SEC : SBC.L ExpandingSquare_TopPosition : BNE +
    LDA.B #$01

+   LDY.W #ExpandingSquare_LeftPosition
    JSR AddExpandingSquareTransition_LeftPos_IndirectHDMATable
    LDY.W #ExpandingSquare_RightPosition
    JSR AddExpandingSquareTransition_RightPos_IndirectHDMATable
    LDA.B #$E0 : SEC : SBC.L ExpandingSquare_BottomPosition : BNE +
    LDA.B #$01

+   LDY.W #ExpandingSquare_TopBottomMarginLeftPosition
    JSR AddExpandingSquareTransition_LeftPos_IndirectHDMATable
    LDY.W #ExpandingSquare_TopBottomMarginRightPosition
    JSR AddExpandingSquareTransition_RightPos_IndirectHDMATable
    LDA.B #$00 : STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable,X : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable,X
    RTS


;;; $ABF7: Add expanding square transition left position indirect HDMA table entry ;;;
AddExpandingSquareTransition_LeftPos_IndirectHDMATable:
;; Parameters:
;;     A: Number of lines
;;     X: Indirect HDMA table offset
;;     Y: Address of window 1 left position
    PHA : PHY : PHP
    SEP #$20
    BIT.B #$80 : BNE +
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable,X
    REP #$20
    TYA : STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+1,X
    PLP : PLY : PLA
    RTS

    SEP #$20 ; dead code

+   SEC : SBC.B #$7F : STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable,X
    LDA.B #$7F : STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+3,X
    REP #$20
    TYA : STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+1,X : STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+4,X
    PLP : PLY : PLA
    RTS


;;; $AC2D: Add expanding square transition right position indirect HDMA table entry ;;;
AddExpandingSquareTransition_RightPos_IndirectHDMATable:
;; Parameters:
;;     A: Number of lines
;;     X: Indirect HDMA table offset
;;     Y: Address of window 1 right position
;; Returns:
;;     X: Next indirect HDMA table offset
    PHP
    SEP #$20
    BIT.B #$80 : BNE +
    STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable,X
    REP #$20
    TYA : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+1,X
    INX #3
    PLP
    RTS

    SEP #$20 ; dead code

+   SEC : SBC.B #$7F : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable,X
    LDA.B #$7F : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+3,X
    REP #$20
    TYA : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+1,X : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+4,X
    TXA : CLC : ADC.W #$0006 : TAX
    PLP
    RTS


;;; $AC66: File select map - index 8: area select map to room select map - expanding square transition ;;;
FileSelectMap_Index8_AreaSelectMapToRoomSelectMap:
    REP #$30
    JSR HandleRoomSelectMap_ExpandingSquareTransition
    BPL +
    INC.W PauseMenu_MenuIndex
    SEP #$20
    LDA.B #$02 : STA.B DP_MainScreenLayers
    LDA.B #$00
    STA.B DP_WindowAreaMainScreen : STA.B DP_WindowAreaSubScreen : STA.B DP_SubScreenLayers

+   REP #$30
    JSR DrawAreaSelectMapLabels
    RTS


;;; $AC84: Handle room select map expanding square transition ;;;
HandleRoomSelectMap_ExpandingSquareTransition:
;; Returns:
;;     Negative: Set if finished, clear otherwise
    LDA.L ExpandingSquare_LeftSubPosition : CLC : ADC.L ExpandingSquare_LeftPositionSubVelocity : STA.L ExpandingSquare_LeftSubPosition
    LDA.L ExpandingSquare_LeftPosition : ADC.L ExpandingSquare_LeftPositionVelocity : CMP.W #$0001 : BPL +
    LDA.W #$0001

+   STA.L ExpandingSquare_LeftPosition
    LDA.L ExpandingSquare_RightSubPosition : CLC : ADC.L ExpandingSquare_RightSubVelocity : STA.L ExpandingSquare_RightSubPosition
    LDA.L ExpandingSquare_RightPosition : ADC.L ExpandingSquare_RightVelocity : CMP.W #$0100 : BMI +
    LDA.W #$00FF

+   STA.L ExpandingSquare_RightPosition
    LDA.L ExpandingSquare_TopSubPosition : CLC : ADC.L ExpandingSquare_TopSubVelocity : STA.L ExpandingSquare_TopSubPosition
    LDA.L ExpandingSquare_TopPosition : ADC.L ExpandingSquare_TopVelocity : CMP.W #$0001 : BPL +
    LDA.W #$0001

+   STA.L ExpandingSquare_TopPosition
    LDA.L ExpandingSquare_BottomSubPosition : CLC : ADC.L ExpandingSquare_BottomSubVelocity : STA.L ExpandingSquare_BottomSubPosition
    LDA.L ExpandingSquare_BottomPosition : ADC.L ExpandingSquare_BottomVelocity : CMP.W #$00E0 : BMI +
    LDA.W #$00E0

+   STA.L ExpandingSquare_BottomPosition
    JSR Setup_FileSelectMap_ExpandingSquareTransition_HDMA
    REP #$20
    LDA.L ExpandingSquare_Timer : DEC : STA.L ExpandingSquare_Timer
    RTS


;;; $AD17: File select map - index 9: area select map to room select map - initialise ;;;
FileSelectMap_Index9_AreaSelectMapToRoomSelectMap_Init:
    REP #$30
    JSL LoadMirrorOfCurrentAreasMapExplored
    JSL DrawRoomSelectMap
    JSL LoadFromLoadStation
    JSL Disable_HDMAObjects
    JSL Wait_End_VBlank_Clear_HDMA
    PHB
    SEP #$20
    LDA.B #$8F : PHA : PLB
    LDX.W RoomPointer
    LDA.W $0001,X : AND.B #$FF : STA.W AreaIndex ; >.<
    LDA.W $0002,X : AND.B #$FF : STA.W RoomMapX ; >.<
    LDA.W $0003,X : AND.B #$FF : STA.W RoomMapY ; >.<
    PLB
    REP #$20
    JSL Setup_MapScrolling_for_FileSelectMap
    LDA.W MapScroll_MinY : CLC : ADC.W #$0018 : STA.W MapScroll_MinY
    LDA.W #$0018 : STA.B DP_BG2YScroll
    LDA.B DP_MainScreenLayers : AND.W #$FFFB : STA.B DP_MainScreenLayers
    INC.W PauseMenu_MenuIndex
    STZ.W MapScrolling_Direction : STZ.W MapScrolling_SpeedIndex
    STZ.W PauseMenu_SamusPositionIndicatorAnimFrame : STZ.W PauseMenu_SamusPositionIndicatorAnimTimer
    STZ.W PauseMenu_SamusPositionIndicatorAnimLoopCount
    RTS


;;; $AD7F: File select map - index Ah: room select map ;;;
FileSelectMap_IndexA_RoomSelectMap:
    REP #$30
    JSL Draw_FileSelectMap_Icons
    JSR Handle_FileSelectMap_ScrollArrows
    JSL MapScrolling
    JSL Display_Map_Elevator_Destinations
    LDA.W Debug_Enable : BEQ +
    LDA.B DP_Controller2New : BIT.W #$2000 : BNE .debug

+   LDA.B DP_Controller1New : BIT.W #$8000 : BNE .exit
    BIT.W #$1080 : BEQ .earlyReturn
    INC.W PauseMenu_MenuIndex
    LDA.W #$0038
    JSL QueueSound_Lib1_Max6

  .earlyReturn:
    RTS

  .exit:
    LDA.W PauseMenu_MenuIndex : CLC : ADC.W #$0005 : STA.W PauseMenu_MenuIndex
    LDX.W #$0000
    LDA.W AreaIndex

  .loopMapAreaIndex:
    CMP.W FileSelectMapArea_IndexTable,X : BEQ +
    INX #2 : CPX.W #$000C : BMI .loopMapAreaIndex
    STZ.W FileSelectMapAreaIndex
    RTS

+   TXA : LSR : STA.W FileSelectMapAreaIndex
    LDA.W #$003C
    JSL QueueSound_Lib1_Max6
    RTS

  .debug:
    LDA.W #$0038
    JSL QueueSound_Lib1_Max6
    PHB
    SEP #$20
    LDA.B #MapIcon_PositionTablePointers>>16 : STA.B DP_Temp02
    PHA : PLB
    REP #$20
    LDA.W AreaIndex : ASL : TAX
    LDA.L SRAMMirror_UsedSaveStationsElevators,X : STA.B DP_Temp18
    LDA.W LoadStationIndex

  .loopIndex:
    LSR.B DP_Temp18
    DEC : BPL .loopIndex
    LDA.W AreaIndex : ASL : CLC : ADC.W #MapIcon_PositionTablePointers_savePoints : TAX
    LDA.W $0000,X

  .crash:
    BEQ .crash
    STA.B DP_Temp00
    LDA.W LoadStationIndex : ASL #2 : TAY
    LDA.B [DP_Temp00],Y : STA.B DP_Temp12
    INY #2
    LDA.B [DP_Temp00],Y : STA.B DP_Temp14
    LDA.W LoadStationIndex : CMP.W #$0010 : BPL .debugSavePoints
    BRA .savesElevators

  .loopSavesElevators:
    LSR.B DP_Temp18 : BCC .savesElevators
    LDA.W LoadStationIndex : ASL #2 : TAY
    LDA.B [DP_Temp00],Y : CMP.W #$FFFE : BEQ .savesElevators
    CMP.W #$FFFF : BNE .found

  .savesElevators:
    INC.W LoadStationIndex
    LDA.W LoadStationIndex : CMP.W #$0010 : BMI .loopSavesElevators

  .loopDebugSavePoints:
    LDA.W LoadStationIndex : ASL #2 : TAY
    LDA.B [DP_Temp00],Y : CMP.W #$FFFF : BEQ .finishedDebugSavePoints
    CMP.W #$FFFE : BNE .found

  .debugSavePoints:
    INC.W LoadStationIndex
    BRA .loopDebugSavePoints

  .finishedDebugSavePoints:
    STZ.W LoadStationIndex
    LDA.W AreaIndex : ASL : TAX
    LDA.L SRAMMirror_UsedSaveStationsElevators,X : STA.B DP_Temp18
    BRA .loopSavesElevators

  .found:
    LDA.W LoadStationIndex : ASL #2 : TAY
    LDA.B [DP_Temp00],Y : CMP.B DP_BG1XScroll : BMI +
    SEC : SBC.W #$0100 : CMP.B DP_BG1XScroll : BMI .noXScroll

+   LDA.B [DP_Temp00],Y : SEC : SBC.B DP_Temp12
    CLC : ADC.B DP_BG1XScroll : BPL +
    LDA.W #$0000
    BRA .storeXScroll

+   CMP.W MapScroll_MinX : BMI .storeXScroll
    LDA.W MapScroll_MinX

  .storeXScroll:
    STA.B DP_BG1XScroll

  .noXScroll:
    INY #2
    LDA.B [DP_Temp00],Y : CMP.B DP_BG1YScroll : BMI +
    SEC : SBC.W #$00A1 : CMP.B DP_BG1YScroll : BMI .return

+   LDA.B [DP_Temp00],Y : SEC : SBC.B DP_Temp14
    CLC : ADC.B DP_BG1YScroll : CMP.W MapScroll_MinY : BMI +
    LDA.W MapScroll_MinY

+   STA.B DP_BG1YScroll

  .return:
    PLB
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $AEC8: Unused. REP #$30 ;;;
UNUSED_REP30_81AEC8:
    REP #$30
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $AECA: Handle file select map scroll arrows ;;;
Handle_FileSelectMap_ScrollArrows:
; Fork of $82:B934 (handle map scroll arrows) that changes the map screen boundaries
    PHP : PHB
    PHK : PLB
    REP #$20
    LDA.W MapScroll_MinX : SEC : SBC.W #$0018 : CMP.B DP_BG1XScroll : BPL +
    LDX.W #MapScroll_ArrowData_mapScrollDirection_left
    JSL Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction

+   LDA.W MapScroll_MaxX : CLC : ADC.W #$0018
    SEC : SBC.W #$0100 : CMP.B DP_BG1XScroll : BMI +
    LDX.W #MapScroll_ArrowData_mapScrollDirection_right
    JSL Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction

+   LDA.W MapScroll_MinY : SEC : SBC.W #$0040 : CMP.B DP_BG1YScroll : BPL +
    LDX.W #MapScroll_ArrowData_mapScrollDirection_up
    JSL Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction

+   LDA.W MapScroll_MaxY : SEC : SBC.W #$0091 : CMP.B DP_BG1YScroll : BMI .cancelScrollDown
    LDX.W #MapScroll_ArrowData_mapScrollDirection_down
    JSL Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction

  .return:
    PLB : PLP
    RTS

  .cancelScrollDown:
    LDA.W MapScrolling_Direction : CMP.W MapScroll_ArrowData_mapScrollDirection_end : BNE .return
    STZ.W MapScrolling_GearSwitchTimer : STZ.W MapScrolling_Direction : STZ.W MapScrolling_SpeedIndex
    BRA .return


MapScroll_ArrowData_mapScrollDirection:
; Map scroll arrow data
;        ___________________________ X position
;       |      _____________________ Y position
;       |     |      _______________ Pause screen animation ID
;       |     |     |      _________ Necessary input
;       |     |     |     |      ___ Map scrolling direction
;       |     |     |     |     |
  .left:
    dw $0010,$0060,$0009,$0200,$0001
  .right:
    dw $00F0,$0060,$0008,$0100,$0002
  .up:
    dw $0080,$0020,$0006,$0800,$0003
  .down:
    dw $0080,$00A0,$0007,$0400
  .end:
    dw                         $0004


;;; $AF5A: File select map - index Bh/Ch: room select map to loading game data - wait before fade out ;;;
FileSelectMap_IndexB_C_RoomSelectMapToLoadingGameData:
    JSL Draw_FileSelectMap_Icons
    JSL Display_Map_Elevator_Destinations
    INC.W PauseMenu_MenuIndex
    RTS


;;; $AF66: File select map - index Dh: room select map to loading game data - fade out ;;;
FileSelectMap_IndexD_RoomSelectMapToAreaSelectMap_FadeOut:
    JSL Draw_FileSelectMap_Icons
    JSL Display_Map_Elevator_Destinations
    JSL HandleFadingOut
    LDA.B DP_Brightness : AND.W #$000F : BNE .return
    INC.W PauseMenu_MenuIndex
    LDA.W #$0020 : STA.W Enemy.XPosition

  .return:
    RTS


;;; $AF83: File select map - index Eh: room select map to loading game data - wait ;;;
FileSelectMap_IndexE_RoomSelectMapToLoadingGameData_Wait:
    LDA.W Enemy.XPosition : DEC : STA.W Enemy.XPosition : BNE .return
    JSL SetForceBlankAndWaitForNMI
    INC.W GameState
    STZ.W PauseMenu_MenuIndex

  .return:
    RTS


;;; $AF97: File select map - index Fh: room select map to area select map - clear BG1 tilemap ;;;
FileSelectMap_IndexF_RoomSelectMapToAreaSelectMap_ClearBG1:
    SEP #$20
    LDA.B #$12 : STA.B DP_MainScreenLayers
    REP #$30
    LDA.W #$000F
    LDX.W #$07FE

  .loop:
    STA.L GameOptionsMenuTilemap,X
    DEX #2 : BPL .loop
    LDX.W VRAMWriteStack
    LDA.W #$0800 : STA.B VRAMWrite.size,X
    LDA.W #GameOptionsMenuTilemap : STA.B VRAMWrite.src,X
    LDA.W #GameOptionsMenuTilemap>>16 : STA.B VRAMWrite.src+2,X
    LDA.B DP_BG1TilemapAddrSize : AND.W #$00FC : XBA : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    INC.W PauseMenu_MenuIndex
    RTS


;;; $AFD3: File select map - index 10h: room select map to area select map - load palettes ;;;
FileSelectMap_Index10_RoomSelectMapToAreaSelectMap_LoadPal:
    REP #$30
    JSR LoadMenuPalettes
    LDX.W #$0000

  .loop:
    PHX
    JSR LoadInactiveAreaMapForegroundColors
    PLX
    INX : CPX.W #$0006 : BMI .loop
    LDX.W AreaIndex
    JSR LoadActiveAreaMapForegroundColors
    LDY.W AreaIndex
    JSR Load_AreaSelect_BackgroundTilemap
    INC.W PauseMenu_MenuIndex
    RTS


;;; $AFF6: File select map - index 14h: prepare contracting square transition to area select map ;;;
FileSelectMap_Index14_PrepContractSquareTransToAreaSelect:
    SEP #$20
    LDA.B #$00 : STA.B DP_HDMAEnable
    REP #$30
    LDA.W #$003C
    JSL QueueSound_Lib1_Max6
    LDA.W AreaIndex : ASL : TAX
    LDA.W RoomSelectMap_ExpandingSquare_Timers,X : SEC : SBC.W #$000C : STA.L ExpandingSquare_Timer
    TXA : ASL #3 : TAX
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_leftSub,X : STA.L ExpandingSquare_LeftPositionSubVelocity
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_left,X : STA.L ExpandingSquare_LeftPositionVelocity
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_rightSub,X : STA.L ExpandingSquare_RightSubVelocity
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_right,X : STA.L ExpandingSquare_RightVelocity
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_topSub,X : STA.L ExpandingSquare_TopSubVelocity
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_top,X : STA.L ExpandingSquare_TopVelocity
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_bottomSub,X : STA.L ExpandingSquare_BottomSubVelocity
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_bottom,X : STA.L ExpandingSquare_BottomVelocity
    LDA.W #$0008 : STA.L ExpandingSquare_LeftPosition
    LDA.W #$00F8 : STA.L ExpandingSquare_RightPosition
    LDA.W #$0008 : STA.L ExpandingSquare_TopPosition
    LDA.W #$00D8 : STA.L ExpandingSquare_BottomPosition
    LDA.W #$0000 : STA.L ExpandingSquare_LeftSubPosition : STA.L ExpandingSquare_RightSubPosition
    STA.L ExpandingSquare_TopSubPosition : STA.L ExpandingSquare_BottomSubPosition
    JSR Setup_FileSelectMap_ExpandingSquareTransition_HDMA
    INC.W PauseMenu_MenuIndex
    SEP #$20
    LDA.B #$0C : STA.B DP_HDMAEnable : STA.W $420C
    LDA.B #$32 : STA.B DP_WindowMaskBG12 : STA.W $2123
    LDA.B #$02 : STA.B DP_WindowMaskBG34 : STA.W $2124
    LDA.B #$30 : STA.B DP_BGTilesAddr
    LDA.B #$22 : STA.B DP_WindowMaskSprite
    LDA.B #$00
    STA.L ExpandingSquareTransitionWindow1LeftIndirectHDMATable+9 : STA.L ExpandingSquare_TransitionWindow1RightIndirectHDMATable+9
    LDA.B #$00
    STA.B DP_BG1YScroll : STA.B DP_BG1YScroll+1
    STA.B DP_BG1XScroll : STA.B DP_BG1XScroll+1
    RTS


;;; $B0BB: File select map - index 15h: room select map to area select map - contracting square transition ;;;
FileSelectMap_Index15_RoomSelectMapToAreaSelectMap:
    REP #$30
    LDA.L ExpandingSquare_LeftSubPosition : SEC : SBC.L ExpandingSquare_LeftPositionSubVelocity : STA.L ExpandingSquare_LeftSubPosition
    LDA.L ExpandingSquare_LeftPosition : SBC.L ExpandingSquare_LeftPositionVelocity : STA.L ExpandingSquare_LeftPosition
    LDA.L ExpandingSquare_RightSubPosition : SEC : SBC.L ExpandingSquare_RightSubVelocity : STA.L ExpandingSquare_RightSubPosition
    LDA.L ExpandingSquare_RightPosition : SBC.L ExpandingSquare_RightVelocity : STA.L ExpandingSquare_RightPosition
    LDA.L ExpandingSquare_TopSubPosition : SEC : SBC.L ExpandingSquare_TopSubVelocity : STA.L ExpandingSquare_TopSubPosition
    LDA.L ExpandingSquare_TopPosition : SBC.L ExpandingSquare_TopVelocity : STA.L ExpandingSquare_TopPosition
    LDA.L ExpandingSquare_BottomSubPosition : SEC : SBC.L ExpandingSquare_BottomSubVelocity : STA.L ExpandingSquare_BottomSubPosition
    LDA.L ExpandingSquare_BottomPosition : SBC.L ExpandingSquare_BottomVelocity : STA.L ExpandingSquare_BottomPosition
    JSR Setup_FileSelectMap_ExpandingSquareTransition_HDMA
    REP #$20
    JSR DrawAreaSelectMapLabels
    LDA.L ExpandingSquare_Timer : DEC : STA.L ExpandingSquare_Timer : BPL .return
    LDA.W PauseMenu_MenuIndex : SEC : SBC.W #$000F : STA.W PauseMenu_MenuIndex
    SEP #$20
    LDA.B #$11 : STA.B DP_MainScreenLayers
    LDA.B #$00 : STA.B DP_WindowAreaMainScreen : STA.B DP_WindowAreaSubScreen

  .return:
    RTS


;;; $B14B: Tilemap - room select map controls ;;;
Tilemap_RoomSelectMap_Controls:
; First word is skipped
; '                                '
; '                                '
; '   <^MAP     AA       BB        '
; '   v>SCROLL  AAStart  BBCancel  '
; '                                '
; '                                '
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801
    dw $2801,$2801,$2801,$28B6,$28B7,$283C,$2830,$283F
    dw $2801,$2801,$2801,$2801,$2801,$2850,$6850,$2801
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2851,$2852
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801
    dw $2801,$2801,$2801,$28C6,$28C7,$2842,$2832,$2841
    dw $283E,$283B,$283B,$2801,$2801,$2860,$6860,$2842
    dw $2843,$2830,$2841,$2843,$2801,$2801,$2861,$2862
    dw $2832,$2830,$283D,$2832,$2834,$283B,$2801,$2801
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801


;;; $B2CB: New save file ;;;
NewSaveFile:
    REP #$30
    LDA.W #$0063 : STA.W MaxEnergy : STA.W Energy
    LDA.W #$0000 : STA.W MaxMissiles : STA.W Missiles
    LDA.W #$0000 : STA.W MaxSuperMissiles : STA.W SuperMissiles
    LDA.W #$0000 : STA.W MaxPowerBombs : STA.W PowerBombs
    STZ.W SelectedHUDItem
    STZ.W CollectedBeams : STZ.W EquippedBeams
    STZ.W CollectedItems : STZ.W EquippedItems
    STZ.W ReserveTankMode : STZ.W MaxReserveEnergy : STZ.W ReserveEnergy : STZ.W ReserveMissiles
    LDA.W #$0800 : STA.W UpBinding
    LDA.W #$0400 : STA.W DownBinding
    LDA.W #$0200 : STA.W LeftBinding
    LDA.W #$0100 : STA.W RightBinding
    LDA.W #$0080 : STA.W JumpBinding
    LDA.W #$8000 : STA.W DashBinding
    LDA.W #$0040 : STA.W ShotBinding
    LDA.W #$4000 : STA.W ItemCancelBinding
    LDA.W #$2000 : STA.W ItemSelectBinding
    LDA.W #$0010 : STA.W AimUpBinding
    LDA.W #$0020 : STA.W AimDownBinding
    STZ.W IGTFrames : STZ.W IGTSeconds : STZ.W IGTMinutes : STZ.W IGTHours
    STZ.W JapanText : STZ.W Moonwalk : STZ.W IconCancel
    LDA.W #$0001 : STA.W SamusPlacementMode
    STA.W neverRead09E8
    LDX.W #$0000
    LDA.W #$0000

  .loopClearEvents:
    STA.L SRAMMirror_ChozeBlockDestroyed,X
    STA.L SRAMMirror_Items,X : STA.L SRAMMirror_Items,X                                             ; >.<
    STA.L SRAMMirror_Doors,X
    STA.L unusedD8F0,X
    STA.L SRAMMirror_MapStations,X
    STA.L SRAMMirror_UsedSaveStationsElevators,X : STA.L SRAMMirror_UsedSaveStationsElevators+8,X
    INX #2 : CPX.W #$0008 : BMI .loopClearEvents
    LDA.W #$0000

  .loopClearEventsAgain:
    STA.L SRAMMirror_ChozeBlockDestroyed,X
    STA.L SRAMMirror_Items,X : STA.L SRAMMirror_Items,X                                             ; >.<
    STA.L SRAMMirror_Doors,X
    INX #2 : CPX.W #$0040 : BMI .loopClearEventsAgain
    LDX.W #$0000
    LDA.W #$0000

  .loopClearMapData:
    STA.L ExploredMapTiles,X
    INX #2 : CPX.W #$0700 : BMI .loopClearMapData
    RTS


;;; $B3C5: Clear rest of menu tilemap row ;;;
ClearResetOfMenuTilemapRow:
;; Parameters:
;;     X: Menu tilemap index
    TXA : AND.W #$003F : LSR
    SEC : SBC.W #$0020 : EOR.W #$FFFF : INC : STA.B DP_Temp12
    LDA.W #$000F

  .loop:
    STA.L MenuTilemap,X
    INX #2
    DEC.B DP_Temp12 : BNE .loop
    RTS


;;; $B3E2: Load menu tilemap [Y] to ([X] / 2 % 20h, [X] / 40h) ;;;
Load_Tilemap_in_Y_to_X_Coordinates:
;; Parameters:
;;     X: Destination tilemap index
;;     Y: Source tilemap pointer

; def f(i):
;     formatValue = lambda v: f'{v:X}' + ('h' if v >= 0xA else '')
;     print(f'{formatValue(i // 2 % 0x20)}, {formatValue(i // 0x40)}')
    PHX

  .loop:
    LDA.W $0000,Y : CMP.W #$FFFE : BEQ +
    CMP.W #$FFFF : BEQ .return
    ORA.W Enemy.palette : STA.L MenuTilemap,X
    INX #2
    INY #2
    BRA .loop

+   INY #2
    PLA : CLC : ADC.W #$0040 : TAX
    PHA
    BRA .loop

  .return:
    PLX
    RTS


;;; $B40A: File select tilemaps ;;;
Tilemap_FileSelect:
  .SamusData:
; SAMUS DATA
    dw $202B,$200A,$2026,$202D,$202B,$200F,$200D,$200A,$202C,$200A,$FFFE
    dw $203B,$201A,$2036,$2010,$203B,$200F,$201D,$201A,$2011,$201A,$FFFF

  .SamusA:
; SAMUS A
    dw $202B,$200A,$2026,$202D,$202B,$200F,$200A,$FFFE
    dw $203B,$201A,$2036,$2010,$203B,$200F,$201A,$FFFF

  .SamusB:
; SAMUS B
    dw $202B,$200A,$2026,$202D,$202B,$200F,$200B,$FFFE
    dw $203B,$201A,$2036,$2010,$203B,$200F,$201B,$FFFF

  .SamusC:
; SAMUS C
    dw $202B,$200A,$2026,$202D,$202B,$200F,$200C,$FFFE
    dw $203B,$201A,$2036,$2010,$203B,$200F,$201C,$FFFF

  .energy:
; ENERGY
    dw $209D,$209E,$209F,$20CC,$FFFF

  .time:
; TIME
    dw $20AD,$20AE,$20AF,$FFFF

  .colon:
; :
    dw $208C,$FFFF

  .noData:
; NO DATA
    dw $000F,$2077,$2078,$200F,$206D,$206A,$207D,$206A
    dw $200F,$200F,$200F,$FFFF

  .dataCopy:
; DATA COPY
    dw $206D,$206A,$207D,$206A,$200F,$206C,$2078,$2079
    dw $2082,$FFFF

  .dataClear:
; DATA CLEAR
    dw $206D,$206A,$207D,$206A,$200F,$206C,$2075,$206E
    dw $206A,$207B,$FFFF

  .exit:
; EXIT
    dw $206E,$2081,$2072,$207D,$FFFF

  .dataCopyMode:
; DATA COPY MODE
    dw $000D,$200A,$202C,$200A,$200F,$200C,$2000,$200D
    dw $2041,$200F,$2026,$2000,$200D,$200E,$FFFE,$201D
    dw $201A,$2011,$201A,$200F,$201C,$2010,$2038,$2017
    dw $200F,$2036,$2010,$201D,$201E,$FFFF

  .dataClearMode:
; DATA CLEAR MODE
    dw $000D,$000A,$002C,$000A,$000F,$000C,$0025,$000E
    dw $000A,$000D,$000F,$0026,$0000,$000D,$000E,$FFFE
    dw $001D,$001A,$0011,$001A,$000F,$001C,$0035,$001E
    dw $001A,$003A,$000F,$0036,$0010,$001D,$001E,$FFFF

  .copyWhichData:
; COPY WHICH DATA?
    dw $206C,$2078,$2079,$2082,$200F,$2080,$2071,$2072
    dw $206C,$2071,$200F,$206D,$206A,$207D,$206A,$2085
    dw $FFFF

  .copySamusToWhere:
; COPY (SAMUS  ) TO WHERE?
    dw $206C,$2078,$2079,$2082,$200F,$208A,$207C,$206A
    dw $2076,$207E,$207C,$200F,$200F,$208B,$200F,$207D
    dw $2078,$200F,$2080,$2071,$206E,$207B,$206E,$2085
    dw $FFFF

  .copySamusToSamus:
; COPY (SAMUS  ) TO (SAMUS  ).
    dw $206C,$2078,$2079,$2082,$200F,$208A,$207C,$206A
    dw $2076,$207E,$207C,$200F,$200F,$208B,$200F,$207D
    dw $2078,$200F,$208A,$207C,$206A,$2076,$207E,$207C
    dw $200F,$200F,$208B,$2088,$FFFF

  .isThisOK:
; IS THIS OK?
    dw $2072,$207C,$200F,$207D,$2071,$2072,$207C,$200F
    dw $2078,$2074,$2085,$FFFF

  .yes:
; YES
    dw $2041,$200E,$202B,$FFFE
    dw $2017,$201E,$203B,$FFFF

  .no:
; N O
    dw $2027,$200F,$2000,$FFFE
    dw $2037,$200F,$2010,$FFFF

  .copyCompleted:
; COPY COMPLETED.
    dw $206C,$2078,$2079,$2082,$200F,$206C,$2078,$2076
    dw $2079,$2075,$206E,$207D,$206E,$206D,$2088,$FFFF

  .clearWhichData:
;        CLEAR WHICH DATA?
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$006C
    dw $0075,$006E,$006A,$007B,$000F,$0080,$0071,$0072
    dw $006C,$0071,$000F,$006D,$006A,$007D,$006A,$0085
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$FFFF

  .clearSamusA:
;         CLEAR (SAMUS A).
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $006C,$0075,$006E,$006A,$007B,$000F,$008A,$007C
    dw $006A,$0076,$007E,$007C,$000F,$006A,$008B,$0088
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$FFFF

  .dataCleared:
;         DATA CLEARED...
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $006D,$006A,$007D,$006A,$000F,$006C,$0075,$006E
    dw $006A,$007B,$006E,$006D,$0088,$0088,$0088,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$FFFF


;;; $B71A: Area select foreground tilemap ;;;
Tilemap_AreaSelect_Foreground:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$15AD,$15AE
    dw $55AD,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$15AD,$15AE,$95CC,$15BC
    dw $15D5,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $15AD,$15AE,$15DA,$15A8,$55A7,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$15BB,$15BC,$15D5,$15C8
    dw $15DB,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $15BB,$15BC,$15D5,$15B6,$15B7,$000F,$1DA1,$1DA2
    dw $5DA1,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$15DC,$15C8,$15CF,$15A8
    dw $55A7,$000F,$15A7,$15A8,$55A7,$000F,$15A7,$15A8
    dw $55CB,$15AE,$55CA,$15A8,$55AA,$1DA2,$9DA6,$1DB0
    dw $1DD4,$1DAE,$5DAD,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$55D0,$55A8,$95AC,$15B6
    dw $15AC,$15A8,$15D3,$15BC,$55D3,$15A8,$15D3,$15AE
    dw $95CC,$15BC,$15D5,$15B6,$15B7,$1DB0,$1DA6,$1DA2
    dw $1DBB,$1DBC,$1DD5,$1DA2,$5DA1,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$15B5,$15B6,$15AC,$15A8
    dw $15D3,$15AE,$15CC,$15AE,$95CC,$15AE,$95CC,$15BC
    dw $15D5,$15C8,$15CF,$15A8,$55AA,$1DA2,$9DA6,$1DB0
    dw $1DDC,$1DC8,$1DDD,$1DB0,$DDA4,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$15C2,$15C3,$15B5,$15B6
    dw $15BB,$15BC,$15BB,$15BC,$15D5,$15BC,$15D5,$15C8
    dw $15CF,$15A8,$55AC,$15B6,$15B7,$1DB0,$1DA6,$1DA2
    dw $1DE6,$1DC8,$1DB4,$1DA2,$5DA4,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$15C2,$15C3
    dw $15DC,$15C8,$15DC,$15C8,$15DD,$15C8,$15CF,$15A8
    dw $55AC,$15B6,$15AC,$15A8,$55AA,$1DA2,$9DA6,$1DB0
    dw $1DA6,$1DA2,$9DA6,$1DA2,$DDA4,$000F,$000F,$000F
    dw $000F,$000F,$19AD,$19AE,$59AD,$000F,$000F,$000F
    dw $15C7,$15C8,$15DC,$15C8,$15CF,$15A8,$55AC,$15B6
    dw $15B7,$15C3,$15B5,$15B6,$15B7,$1DB0,$1DA6,$1DA2
    dw $9DA6,$1DA2,$DDA4,$1DBE,$1DBF,$000F,$000F,$000F
    dw $000F,$000F,$19BB,$19BC,$19CC,$19AE,$59AD,$000F
    dw $000F,$000F,$15C7,$15C8,$15B5,$15B6,$15B7,$15C3
    dw $15C4,$000F,$15C2,$15C3,$15CD,$1DA2,$9DA6,$1DA2
    dw $DDA4,$1DBE,$1DBF,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$19C7,$19C8,$19BB,$19BC,$19D5,$000F
    dw $000F,$000F,$000F,$000F,$15C2,$15C3,$15C4,$000F
    dw $000F,$000F,$000F,$000F,$15AF,$1DB0,$DDA4,$1DBE
    dw $1DBF,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$59D7,$19AE,$59D8,$000F
    dw $19AD,$19AE,$59AD,$000F,$000F,$000F,$000F,$1DA7
    dw $1DA8,$5DA7,$000F,$000F,$15BD,$1DBE,$1DBF,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$19BB,$19BC,$19CC,$19AE
    dw $99CC,$19BC,$19CC,$19AE,$59AD,$000F,$000F,$1DB5
    dw $1DB6,$1DB7,$000F,$000F,$000F,$000F,$000F,$19A1
    dw $19A2,$59A1,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$59D7,$19AE,$99CC,$19AE
    dw $19CC,$19AE,$99CC,$19BC,$19D5,$000F,$000F,$1DC2
    dw $1DC3,$1DC4,$000F,$000F,$000F,$19A1,$19A2,$99A6
    dw $19B0,$19A6,$19A2,$59A1,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$19BB,$19BC,$19D5,$19C8
    dw $19BB,$19BC,$19D5,$19C8,$D9D5,$19AE,$59AD,$000F
    dw $000F,$000F,$000F,$000F,$000F,$19AF,$19B0,$19A6
    dw $19A2,$99A6,$19B0,$D9A4,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$19C7,$19C8,$19DB,$000F
    dw $19DC,$19C8,$19DD,$19C8,$19BB,$19BC,$19D5,$000F
    dw $000F,$19A1,$19A2,$59A1,$000F,$59B2,$19A2,$99A6
    dw $19B0,$19A6,$19A2,$59A4,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $19C7,$19C8,$19DB,$000F,$19C7,$19C8,$19DB,$000F
    dw $000F,$19AF,$19B0,$19A6,$19A2,$99A6,$19B0,$19A6
    dw $19A2,$99A6,$19A2,$D9A4,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$19A7,$19A8,$59A7,$000F,$19A7,$19A8
    dw $59A7,$19BD,$19BE,$19AF,$19B0,$19A6,$19A2,$99A6
    dw $19A2,$D9A4,$19BE,$19C1,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $19A7,$19A8,$99AC,$19B6,$19AC,$19A8,$99AC,$19B6
    dw $19B7,$000F,$000F,$59B2,$19A2,$99A6,$19A2,$D9A4
    dw $19BE,$19A3,$19BE,$19C1,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$19A7,$19A8
    dw $99AC,$19B6,$19AC,$19A8,$99AC,$19B6,$19AC,$19A8
    dw $59BA,$000F,$000F,$19AF,$19B0,$D9A4,$19BE,$19C1
    dw $000F,$19BD,$19BE,$19BF,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$19B5,$19B6
    dw $19AC,$19A8,$59AC,$19B6,$19AC,$19A8,$99AC,$19B6
    dw $19AC,$19A8,$59A7,$19C0,$19BE,$19C1,$19BE,$19BF
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$19C2,$19C3
    dw $19B5,$19B6,$19B7,$19C3,$19B5,$19A8,$19B7,$19C3
    dw $19B5,$19A8,$19B7,$19BD,$19BE,$19BF,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $19C2,$19C3,$19C4,$000F,$19C2,$19C3,$19C4,$000F
    dw $19C2,$19C3,$19C4,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F


;;; $BF1A: Area select background tilemap - Crateria ;;;
Tilemap_AreaSelect_Background_Crateria:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C51,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$1C51,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C50,$000F
    dw $1C50,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$1C51,$1C4E,$5C50,$000F,$000F,$000F
    dw $000F,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C50,$000F,$1C54,$000F,$9C51,$1C53,$1C4D,$1C4E
    dw $5C51,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $1C51,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F
    dw $1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F,$000F
    dw $9C4D,$1C53,$1C4D,$1C4E,$000F,$000F,$000F,$000F
    dw $9C51,$1C53,$DC51,$000F,$9C51,$1C53,$DC51,$000F
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E
    dw $5C50,$000F,$1C50,$1C4E,$5C51,$000F,$000F,$000F
    dw $1C4D,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C4D,$1C53
    dw $000F,$000F,$000F,$1C53,$1C4D,$1C4E,$5C51,$000F
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E
    dw $5C51,$000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C51,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F,$000F
    dw $1C51,$1C4E,$5C51,$000F,$1C51,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$1C51,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$9C51,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$DC51,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F


;;; $C71A: Area select background tilemap - Brinstar ;;;
Tilemap_AreaSelect_Background_Brinstar:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C51,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$DC51,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$9C54,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$1C51,$1C4E,$5C4D,$1C53,$DC50,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $1C51,$1C4E,$5C50,$000F,$1C50,$1C4E,$5C4D,$1C53
    dw $DC50,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $9C4D,$1C53,$000F,$000F,$000F,$000F,$1C50,$1C4E
    dw $5C4D,$1C53,$DC50,$000F,$000F,$000F,$000F,$000F
    dw $9C50,$1C53,$DC50,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$1C51,$1C4E,$5C51,$000F,$000F,$000F
    dw $1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC50,$000F,$9C50,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F
    dw $1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C52,$000F,$1C52,$1C4E
    dw $5C50,$000F,$1C50,$1C4E,$5C4D,$1C53,$1C4D,$5C55
    dw $000F,$9C51,$1C4D,$1C4E,$5C51,$000F,$1C51,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $1C4D,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$1C50,$1C4E,$5C4D,$000F
    dw $000F,$000F,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C52,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$1C53,$1C4D,$5C51
    dw $000F,$1C51,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $1C4D,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$9C51,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$1C51,$1C4E
    dw $5C51,$000F,$1C51,$1C4E,$5C51,$000F,$1C51,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$9C51,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$DC51,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F


;;; $CF1A: Area select background tilemap - Norfair ;;;
Tilemap_AreaSelect_Background_Norfair:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$9C54,$000F,$000F,$000F,$000F,$000F
    dw $9C54,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $1C51,$1C4E,$5C4D,$1C53,$DC50,$000F,$9C50,$1C53
    dw $1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$9C57,$1C4E
    dw $5C50,$000F,$1C50,$1C4E,$5C4D,$1C53,$1C4D,$5C55
    dw $000F,$9C51,$1C4D,$1C4E,$5C51,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$1C50,$1C4E,$5C4D,$000F
    dw $000F,$000F,$5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$1C51,$1C4E,$5C52,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$1C53,$1C4D,$5C51
    dw $000F,$1C56,$1C4D,$1C4E,$5C4D,$DC51,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $1C51,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$9C51,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$1C51,$1C4E
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$1C4E
    dw $5C4D,$DC51,$000F,$1C55,$5C4D,$5C52,$000F,$000F
    dw $000F,$000F,$000F,$000F,$5C51,$000F,$000F,$000F
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $DC50,$000F,$9C58,$1C53,$DC50,$000F,$9C58,$1C53
    dw $1C4D,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$1C4D,$1C4E,$5C51,$000F
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$DC51,$000F,$9C51,$1C53,$DC51,$000F
    dw $9C51,$5C51,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$5C4D,$1C53,$1C4D,$1C4E
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $1C51,$1C4E,$5C4D,$5C52,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$1C4D,$1C4E,$5C4D,$1C53
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $9C51,$1C53,$1C4D,$000F,$000F,$000F,$000F,$000F
    dw $5C4D,$5C51,$000F,$1C56,$5C4D,$1C53,$1C4D,$1C4E
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$9C51,$000F,$000F,$000F,$000F,$1C56
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C51,$000F,$1C51,$1C4E,$5C51,$000F,$1C51,$1C4E
    dw $5C51,$000F,$1C51,$5C51,$000F,$1C56,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F


;;; $D71A: Area select background tilemap - Wrecked Ship ;;;
Tilemap_AreaSelect_Background_WreckedShip:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C51,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C51,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $DC51,$000F,$1C54,$000F,$1C50,$1C4E,$5C51,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$1C51,$1C4E,$000F,$000F,$000F,$000F
    dw $9C50,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $000F,$000F,$000F,$000F,$000F,$1C53,$DC51,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $1C51,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F
    dw $1C50,$1C4E,$5C50,$000F,$1C50,$1C4E,$5C50,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $9C4D,$1C53,$1C4D,$1C4E,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $1C4D,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C51,$000F
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C4D,$1C53
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C51,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F,$000F
    dw $1C51,$1C4E,$5C51,$000F,$000F,$000F,$000F,$000F
    dw $1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$1C51,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$1C51,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$9C51,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E
    dw $5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$DC51,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F


;;; $DF1A: Area select background tilemap - Maridia ;;;
Tilemap_AreaSelect_Background_Maridia:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$1C51,$5C51,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$9C51,$5C4D,$1C53,$1C4D
    dw $5C51,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$1C51,$000F,$000F,$000F,$000F,$1C55,$5C4D
    dw $1C53,$1C4D,$5C51,$000F,$000F,$000F,$000F,$000F
    dw $1C51,$1C4D,$5C51,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $1C4E,$5C4D,$5C51,$000F,$000F,$000F,$000F,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$5C51,$000F,$1C51,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$000F,$000F,$000F,$000F
    dw $1C51,$5C51,$000F,$000F,$000F,$000F,$000F,$000F
    dw $1C53,$1C4D,$1C4E,$5C4D,$5C57,$000F,$1C52,$5C4D
    dw $DC51,$000F,$1C55,$5C4D,$1C53,$1C4D,$1C4E,$5C50
    dw $000F,$1C50,$1C4E,$5C4D,$5C51,$000F,$1C51,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F
    dw $1C4E,$5C4D,$1C53,$1C4D,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$1C55,$5C4D,$1C53,$000F
    dw $000F,$000F,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51
    dw $000F,$9C51,$1C53,$1C4D,$1C4E,$5C51,$000F,$000F
    dw $1C53,$1C4D,$1C4E,$5C4D,$5C57,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$1C4D,$1C4E,$5C51
    dw $000F,$1C51,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F
    dw $000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C51
    dw $1C4E,$5C4D,$1C53,$1C4D,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$9C51,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$000F
    dw $000F,$000F,$000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$5C51,$000F,$1C56,$5C4D
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$5C4D
    dw $1C53,$DC51,$000F,$9C51,$1C53,$DC51,$000F,$000F
    dw $000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $5C51,$000F,$1C56,$1C4D,$5C51,$000F,$1C56,$1C4D
    dw $1C4E,$5C51,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F
    dw $000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F,$1C51
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C51,$000F,$1C51,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$DC51,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$9C51
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$DC51,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F


;;; $E71A: Area select background tilemap - Tourian ;;;
Tilemap_AreaSelect_Background_Tourian:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$1C51,$1C4E,$5C51,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $1C51,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$1C51,$000F,$000F,$000F,$000F
    dw $1C55,$5C4D,$DC51,$000F,$1C55,$5C4D,$DC51,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$1C51,$1C4E,$5C4D,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $1C4E,$5C4D,$1C53,$1C4D,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $1C53,$1C4D,$1C4E,$5C4D,$5C51,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$5C51,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$5C51,$000F,$000F
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $5C51,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$1C51,$1C4D,$1C4E,$5C51
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$5C51,$000F,$000F,$000F,$000F,$000F
    dw $1C51,$5C4D,$5C51,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$1C51,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$5C51,$000F,$1C51,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$000F,$000F,$000F,$000F
    dw $1C51,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51
    dw $000F,$9C51,$1C53,$1C4D,$5C51,$000F,$1C51,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51
    dw $000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$DC51,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D
    dw $1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$9C51
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D
    dw $1C53,$DC51,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$9C51,$1C53,$DC51,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F

Freespace_Bank81_EF1A:
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
