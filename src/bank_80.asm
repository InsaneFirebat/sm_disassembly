
org $808000


;;; $8000: Debug constants ;;;
DebugConst:
  .RegionSRAM:
    dw $0000 ; Skip NTSC/PAL and SRAM mapping check ($85F6)
  .DemoRecorder:
    dw $0000 ; Demo recorder ($90:E759)
  .DebugMode:
    dw $0000 ; Debug mode, written to Debug_Enable on boot
  .DebugScrolling:
    dw $0000 ; Debug scrolling ($82:8B44: game state 8 - main gameplay)
  .DisableAudio:
    dw $0000 ; Disable audio (UploadToAPU_long)


;;; $800A: Upload to APU (hardcoded parameter) ;;;
UploadToAPU_Hardcoded:
;; Parameter:
;;     [[S] + 1] + 1: APU data pointer ($CF:8000)
    ; return address
    LDA.B $02,S : STA.B DP_Temp04
    LDA.B $01,S : STA.B DP_Temp03
    ; adjust return += 3
    CLC : ADC.W #$0003 : STA.B $01,S
    ; DP_Temp00 = [(return address) + 1] (parameter address)
    LDY.W #$0001
    LDA.B [DP_Temp03],Y : STA.B DP_Temp00
    INY
    LDA.B [DP_Temp03],Y : STA.B DP_Temp01


;;; $8024: Upload to APU (from [$00]) (external) ;;;
UploadToAPU_long:
;; Parameter
;;     $00: APU data pointer
    JSR UploadToAPU
    RTL


;;; $8028: Upload to APU (from [$00]) ;;;
UploadToAPU:
;; Parameter
;;     $00: APU data pointer
    ; If [DebugConst_DisableAudio] != 0:
    LDA.L DebugConst_DisableAudio : BEQ .upload
    RTS

  .upload:
    PHP : PHB
    REP #$30
    ; Set uploading to APU flag
    LDA.W #$FFFF : STA.L APU_UploadingFlag
    SEP #$20 : REP #$10
    ; APU IO 0 = FFh (request APU upload)
    LDA.B #$FF : STA.L $002140
    ; Y = parameter short address
    LDY.B DP_Temp00
    ; Set DB to parameter bank
    LDA.B DP_Temp02 : PHA : PLB
    REP #$30
    JSR SendAPUData
    ; Clear uploading to APU flag
    LDA.W #$0000 : STA.L APU_UploadingFlag
    PLB : PLP
    RTS


;;; $8059: Send APU data ;;;
SendAPUData:
;; Parameters:
;;     DB:Y: APU data pointer

; Data format:
;     ssss dddd [xx xx...] (data block 0)
;     ssss dddd [xx xx...] (data block 1)
;     ...
;     0000 aaaa
; Where:
;     s = data block size in bytes
;     d = destination address
;     x = data
;     a = entry address. Ignored by SPC engine after first APU transfer

; The xx data can cross bank boundaries, but the data block entries otherwise can't (i.e. s, d, a and 0000) unless they're word-aligned

; Wait until APU sets APU IO 0..1 = AAh BBh
; Kick = CCh
; For each data block:
;    APU IO 2..3 = destination address
;    APU IO 1 = 1 (arbitrary non-zero value)
;    APU IO 0 = kick
;    Wait until APU echoes kick back through APU IO 0
;    Index = 0
;    For each data byte
;       APU IO 1 = data byte
;       APU IO 0 = index
;       Wait until APU echoes index back through APU IO 0
;       Increment index
;    Increment index (and again if resulting in 0)
;    Kick = index
; Send entry address through APU IO 2..3
; APU IO 1 = 0
; APU IO 0 = kick
; (Optionally wait until APU echoes kick back through APU IO 0)
    PHP
    REP #$30
    LDA.W #$3000 : STA.L APU_RemainingPollAttempts

  .retry:
    ; Wait until [APU IO 0..1] = AAh BBh
    LDA.W #$BBAA : CMP.L $002140 : BEQ .AABB
    LDA.L APU_RemainingPollAttempts : DEC : STA.L APU_RemainingPollAttempts
    BNE .retry

  .crash:
    ; If exceeded 3000h attempts: crash
    BRA .crash

  .AABB:
    SEP #$20
    ; Kick = CCh
    LDA.B #$CC
    BRA .processDataBlock

  .uploadDataBlock:
    ; Data = [[Y++]]
    LDA.W $0000,Y
    JSR IncY_OverflowCheck                                            
    XBA
    ; Index = 0
    LDA.B #$00                                                          
    BRA .uploadData

  .loopNextData:
    XBA
    ; Data = [[Y++]]
    LDA.W $0000,Y
    JSR IncY_OverflowCheck                                            
    XBA

  .wait:
    ; Wait until APU IO 0 echoes
    CMP.L $002140 : BNE .wait
    ; Increment index
    INC                                                                 

  .uploadData:
    REP #$20
    ; APU IO 0..1 = [index] [data]
    STA.L $002140                                                       
    SEP #$20
    ; If [block size] != 0: go to .loopNextData
    DEX : BNE .loopNextData                                                    

  .wait2:
    ; Wait until APU IO 0 echoes
    CMP.L $002140 : BNE .wait2

  .inc:
    ; Kick = [index] + 4, Ensure kick != 0
    ADC.B #$03 : BEQ .inc

  .processDataBlock:
    PHA
    REP #$20
    ; X = [[Y]] (block size)
    LDA.W $0000,Y
    JSR IncYTwice_OverflowCheck
    ; Y += 2
    TAX
    ; APU IO 2..3 = [[Y]] (destination address)
    LDA.W $0000,Y
    JSR IncYTwice_OverflowCheck
    ; Y += 2
    STA.L $002142
    SEP #$20
    ; If block size = 0: APU IO 1 = 0 (EOF), else APU IO 1 = 1 (arbitrary non-zero value)
    CPX.W #$0001 : LDA.B #$00 : ROL : STA.L $002141
    ; Set overflow if block size != 0, else clear overflow
    ADC.B #$7F
    ; APU IO 0 = kick
    PLA : STA.L $002140
    PHX
    LDX.W #$1000

  .wait3:
    ; If exceeded 1000h attempts: return
    DEX : BEQ .return
    CMP.L $002140 : BNE .wait3
    PLX
    ; If block size != 0: go to .uploadDataBlock
    BVS .uploadDataBlock
    SEP #$20
    ; These stores have no effect (because DB is set to some hirom bank), but there's also no reason to do these stores anyway
    STZ.W $2141 : STZ.W $2142 : STZ.W $2143
    PLP
    RTS

  .return:
    SEP #$20
    STZ.W $2141 : STZ.W $2142 : STZ.W $2143
    PLX
    PLP
    RTS


;;; $8100: Increment Y twice, bank overflow check ;;;
IncYTwice_OverflowCheck:
;; Parameters:
;;     DB:Y: Pointer
;;     $02: Bank mirror
;; Returns:
;;     DB:Y: Pointer incremented twice (Y wraps around from $8000 if bank overflows)
;;     $02: Bank mirror incremented if needed

; Fails to increment Y a second time if the first increment overflows the bank
    ; If [Y] = 0: go to handle bank overflow
    INY : BEQ IncY_OverflowCheck_overflow


;;; $8103: Increment Y, bank overflow check ;;;
IncY_OverflowCheck:
;; Parameters:
;;     DB:Y: Pointer
;;     $02: Bank mirror
;; Returns:
;;     DB:Y: Pointer incremented twice (Y wraps around from $8000 if bank overflows)
;;     $02: Bank mirror incremented if needed
    ; If [Y] = 0: go to handle bank overflow
    INY : BEQ IncY_OverflowCheck_overflow
    RTS


;;; $8107: Handle bank overflow ;;;
IncY_OverflowCheck_overflow:
;; Parameters:
;;     $02: Bank
;; Returns:
;;     Y: $8000
;;     DB/$02: Incremented bank
    ; Increment $02 (DB)
    INC.B DP_Temp02 : PEI.B (DP_Temp01) : PLB : PLB
    ; Y = 8000h
    LDY.W #$8000                                                        
    RTS


;;; $8111: Generate random number ;;;
GenerateRandomNumber:
;; Returns:
;;     A: New random number

; r(t+1) = r(t) * 5 + 0x111 (roughly; if the adding of x * 100h causes overflow, then a further 1 is added)
    SEP #$20
    LDA.W RandomNumberSeed : STA.W $4202
    ; A = [random number low] * 5
    LDA.B #$05 : STA.W $4203
    NOP
    REP #$20
    ; A += ([random number high] * 5 + 1) * 100h
    LDA.W $4216 : PHA
    SEP #$20
    LDA.W RandomNumberSeed+1 : STA.W $4202
    LDA.B #$05 : STA.W $4203
    XBA : NOP
    ; A += ([random number high] * 5 + 1) * 100h
    LDA.W $4216 : SEC : ADC.B $02,S : STA.B $02,S
    REP #$20
   ; Random number = [A] + 11h
    PLA : ADC.W #$0011 : STA.W RandomNumberSeed 
    RTL


;;; $8146: Update held input ;;;
UpdateHeldInput:
;; Parameter:
;;     A: Timed held input timer reset value ("timed held input" is input held for [A] + 1 frames)

; Called by:
;     GameState_F_Paused_MapAndItemScreens with A = 3

; Held input is [$8B] & ![$8F]: the input pressed, but not newly
    PHP : PHB
    REP #$30
    PHX
    PHK : PLB
    STA.W Input_TimedHeldReset
    LDA.B DP_Controller1Input : STA.B DP_Temp12
    LDA.B DP_Controller1New : TRB.B DP_Temp12
    ; If held input != [previous held input]: go to .unheld
    ; Previous held input = held input
    LDA.B DP_Temp12 : CMP.W Input_HeldPrev : STA.W Input_HeldPrev : BNE .unheld
    ; If [timed held input timer] >= 0: go to .positive
    DEC.W Input_TimedHeldTimer : BPL .positive
    STZ.W Input_TimedHeldTimer
    LDX.W Input_TimedHeldInput : STX.W Input_TimedHeldPrev
    STA.W Input_TimedHeldInput
    BRA .return

  .unheld:
    LDA.W Input_TimedHeldReset : STA.W Input_TimedHeldTimer

  .positive:
    STZ.W Input_TimedHeldInput

  .return:
    ; Newly held down timed held input = newly held down timed held input
    LDA.W Input_TimedHeldInput : EOR.W Input_TimedHeldPrev : AND.W Input_TimedHeldInput : STA.W Input_TimedHeldNew
    PLX : PLB : PLP
    RTL


;;; $818E: Change bit index to byte index and bitmask ;;;
BitIndexToByteIndexAndBitmask:
;; Parameter:
;;     A: Bit index, 8000h bit is forbidden
;; Returns:
;;     A/X: Byte index ([A] >> 3)
;;     $05E7: Bitmask (1 << ([A] & 7))

; Called mostly by PLMs
    TAX : BPL .dontCrash
    db $00 ; BRK with no operand

  .dontCrash:
    STZ.W Bitmask
    PHA : AND.W #$0007
    SEC

  .loop:
    ROL.W Bitmask
    DEC : BPL .loop
    PLA
    LSR #3
    TAX
    RTL


;;; $81A6: Set boss bits in A for current area ;;;
SetBossBitsInAForCurrentArea:
;; Parameter:
;;     A: Boss bits
;;         1: Area boss (Kraid, Phantoon, Draygon, both Ridleys)
;;         2: Area mini-boss (Spore Spawn, Botwoon, Crocomire, Mother Brain)
;;         4: Area torizo (Bomb Torizo, Golden Torizo)
    PHX : PHY : PHP
    SEP #$20
    STA.W Bitmask
    LDX.W AreaIndex
    LDA.L SRAMMirror_Boss,X : ORA.W Bitmask : STA.L SRAMMirror_Boss,X
    PLP : PLY : PLX
    RTL


;;; $81C0: Unused. Clear boss bits in A for current area ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_ClearBossBitsInAForCurrentArea_8081C0:
;; Parameter:
;;     A: Boss bits
;;         1: Area boss (Kraid, Phantoon, Draygon, both Ridleys)
;;         2: Area mini-boss (Spore Spawn, Botwoon, Crocomire, Mother Brain)
;;         4: Area torizo (Bomb Torizo, Golden Torizo)
    PHX : PHY : PHP
    SEP #$20
    EOR.B #$FF : STA.W Bitmask
    LDX.W AreaIndex
    LDA.L SRAMMirror_Boss,X : AND.W Bitmask : STA.L SRAMMirror_Boss,X
    PLP : PLY : PLX
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $81DC: Checks if the boss bits for the current area match any bits in A ;;;
CheckIfBossBitsForCurrentAreaMatchAnyBitsInA:
;; Parameter:
;;     A: Boss bits
;;         1: Area boss (Kraid, Phantoon, Draygon, both Ridleys)
;;         2: Area mini-boss (Spore Spawn, Botwoon, Crocomire, Mother Brain)
;;         4: Area torizo (Bomb Torizo, Golden Torizo)
;; Returns:
;;     A/carry: Set if there's a match
    PHX : PHY : PHP
    SEP #$20
    STA.W Bitmask
    LDX.W AreaIndex
    LDA.L SRAMMirror_Boss,X : AND.W Bitmask : BNE .match
    PLP : PLY : PLX
    CLC
    RTL

  .match:
    PLP : PLY : PLX
    SEC
    RTL


;;; $81FA: Mark event [A] ;;;
MarkEvent_inA:
;; Parameter:
;;     A: Event number
;;         0: Zebes is awake
;;         1: Shitroid ate sidehopper
;;         2: Mother Brain's glass is destroyed
;;         3: Zebetite destroyed bit 0 (true if 1 or 3 zebetites are destroyed)
;;         4: Zebetite destroyed bit 1 (true if 2 or 3 zebetites are destroyed)
;;         5: Zebetite destroyed bit 2 (true if all 4 zebetites are destroyed)
;;         6: Phantoon statue is grey
;;         7: Ridley statue is grey
;;         8: Draygon statue is grey
;;         9: Kraid statue is grey
;;         Ah: Entrance to Tourian is unlocked
;;         Bh: Maridia noobtube is broken
;;         Ch: Lower Norfair chozo has lowered the acid
;;         Dh: Shaktool cleared a path
;;         Eh: Zebes timebomb set
;;         Fh: Critters escaped
;;         10h: 1st metroid hall cleared
;;         11h: 1st metroid shaft cleared
;;         12h: 2nd metroid hall cleared
;;         13h: 2nd metroid shaft cleared
;;         14h: Unused
;;         15h: Outran speed booster lavaquake
    PHX : PHY : PHP
    REP #$30
    JSL BitIndexToByteIndexAndBitmask
    LDA.L SRAMMirror_Event,X : ORA.W Bitmask : STA.L SRAMMirror_Event,X
    PLP : PLY : PLX
    RTL


;;; $8212: Unmark event [A] ;;;
UnmarkEvent_inA:
;; Parameter:
;;     A: Event number

; Called by:
;     $A6:FCCB: Mark/unmark zebetite destroyed counter event
    PHX : PHY : PHP
    REP #$30
    JSL BitIndexToByteIndexAndBitmask
    LDA.W Bitmask : EOR.W #$FFFF : STA.W Bitmask
    LDA.L SRAMMirror_Event,X : AND.W Bitmask : STA.L SRAMMirror_Event,X
    PLP : PLY : PLX
    RTL


;;; $8233: Checks event [A] has happened ;;;
CheckIfEvent_inA_HasHappened:
;; Parameter:
;;     A: Event number
;; Returns:
;;     Carry: Set if the event is marked

; Note that Tourian entrance statue FX routine $88:DCCB assumes this routine returns A = 0 when carry clear is returned
    PHX : PHY : PHP
    REP #$30
    JSL BitIndexToByteIndexAndBitmask
    LDA.L SRAMMirror_Event,X : AND.W Bitmask : BNE .marked
    PLP : PLY : PLX
    CLC
    RTL

  .marked:
    PLP : PLY : PLX
    SEC
    RTL


;;; $824F: Write 'supermetroid' to SRAM  ;;;
Write_supermetroid_ToSRAM:
; Called by:
;     $8B:E797: Cinematic function - post-credits - scroll item percentage down

; $70:1FE0..1FEB = 'supermetroid' (game completed)
    PHX
    LDX.W #$000A

  .loop:
    LDA.L Text_supermetroid,X : STA.L SRAM_GameCompletionFlag,X
    DEX #2 : BPL .loop
    PLX
    RTL


;;; $8261: Determine number of demo sets ;;;
DetermineNumberOfDemoSets:
    PHX
    LDA.W #$0003 : STA.W NumberOfDemoSets ; Number of demo sets = 3
    LDA.W #$0000
    JSL LoadFromSRAM                                                   ; Load SRAM slot A
    BCC .nonCorrupt                                                      ; If not corrupt, go to .nonCorrupt
    LDA.W #$0001
    JSL LoadFromSRAM                                                   ; Load SRAM slot B
    BCC .nonCorrupt                                                      ; If not corrupt, go to .nonCorrupt
    LDA.W #$0002
    JSL LoadFromSRAM                                                   ; Load SRAM slot C
    BCC .nonCorrupt                                                      ; If not corrupt, go to .nonCorrupt
    LDX.W #$000A

  .corruptLoop:
    LDA.L Text_madadameyohn,X : STA.L SRAM_GameCompletionFlag,X ; $70:1FE0..1FEB = 'madadameyohn' (all SRAM is corrupt)
    DEX #2 : BPL .corruptLoop
    PLX
    RTL

  .nonCorrupt:
    LDX.W #$000A

  .nonCorruptLoop:
    LDA.L SRAM_GameCompletionFlag,X : CMP.L Text_supermetroid,X : BNE .return ; If $70:1FE0..1FEB = 'supermetroid':
    DEX #2 : BPL .nonCorruptLoop
    LDA.W #$0004 : STA.W NumberOfDemoSets ; Number of demo sets = 4

  .return:
    PLX
    RTL


Text_madadameyohn:
    db "madadameyohn"

Text_supermetroid:
    db "supermetroid"


;;; $82C5: Wait until the end of a v-blank ;;;
WaitUntilTheEndOfAVBlank:
    PHA : PHP
    SEP #$20

  .waitVBlankStart:
    ; Wait until v-blank is active
    LDA.W $4212 : BPL .waitVBlankStart

  .waitVBlankEnd:
    ; Wait until v-blank has finished
    LDA.W $4212 : BMI .waitVBlankEnd
    PLP : PLA
    RTL


;;; $82D6: $05F1 = [A] * [Y] (16-bit unsigned multiplication) ;;;
A_Y_16bit_UnsignedMultiplication:
;; Parameters:
;;     A: Multiplicand
;;     Y: Multiplicand
;; Returns:
;;     $05F1..F4: 32-bit result

; Called by:
;     $94:84D6: Samus block collision reaction - horizontal - slope - non-square
;     $94:ACFE: Handle grapple beam swinging movement
;     $9B:CA65: Propel Samus from grapple swing
;     $A0:C449: Enemy block collision reaction - horizontal - slope - non-square
;     $A3:E8A5: Adjust enemy X velocity for slopes

; Exactly 1060 master cycles (78% of a scanline) (1250 if using slowrom).

; Can be inaccurate.
; Let:
;     [A] = a + b * 100h
;     [Y] = c + d * 100h
; Then:
;    [A] * [Y] = (a + b * 100h) (c + d * 100h)
;              = ac + (bc + ad) * 100h + bd * 10000h
; However, (bc + ad) can overflow 10000h (e.g. C0h * C0h + C0h * C0h = 12000h)
; and the carry isn't propagated to the calculation of bd (instruction $832D should be removed).
    PHX
    STA.W Multiplier16bitA                                               ; Let Multiplier16bitA = a + b * 100h
    STY.W Multiplier16bitB                                               ; Let Multiplier16bitB = c + d * 100h
    STZ.W MultiplicationResult
    STZ.W MultiplicationResult+2                                         ; Result = 0
    SEP #$10
    LDY.W Multiplier16bitB : STY.W $4202
    LDY.W Multiplier16bitA : STY.W $4203
    NOP #3
    LDA.W $4216 : STA.W MultiplicationResult
    LDY.W Multiplier16bitA+1 : STY.W $4203
    NOP
    LDA.W MultiplicationResult+1 : CLC : ADC.W $4216 : STA.W MultiplicationResult+1 ; Result += bc * 100h
    LDY.W Multiplier16bitB+1 : STY.W $4202
    LDY.W Multiplier16bitA : STY.W $4203                                 ; Result += ad * 100h
    NOP
    LDA.W MultiplicationResult+1 : CLC : ADC.W $4216 : STA.W MultiplicationResult+1
    LDY.W Multiplier16bitA+1 : STY.W $4203
    NOP #2
    LDA.W MultiplicationResult+2 : CLC : ADC.W $4216 : STA.W MultiplicationResult+2 ; Result += bd * 10000h
    REP #$30
    PLX
    RTL


;;; $8338: Wait for NMI ;;;
WaitForNMI:
    PHP : PHB
    PHK : PLB
    SEP #$30
    LDA.B #$01 : STA.W NMI_Request                                                    ; Set NMI request flag

  .wait:
    LDA.W NMI_Request : BNE .wait                                                            ; Wait until NMI request acknowledged
    PLB : PLP
    RTL


;;; $834B: Enable NMI ;;;
EnableNMI:
    PHP : PHB
    PHK : PLB
    SEP #$20
    LDA.B DP_IRQAutoJoy : ORA.B #$80 : STA.W $4200 : STA.B DP_IRQAutoJoy
    PLB : PLP
    RTL


;;; $835D: Disable NMI ;;;
DisableNMI:
    PHP : PHB
    PHK : PLB
    SEP #$20
    LDA.B DP_IRQAutoJoy : AND.B #$7F : STA.W $4200 : STA.B DP_IRQAutoJoy
    PLB : PLP
    RTL


;;; $836F: Set force blank and wait for NMI ;;;
SetForceBlankAndWaitForNMI:
; Called by:
;     $B032: Unused. Set up rotating mode 7 background
;     $81:8D0F: (Debug) game over menu - index 0: fade out and configure graphics for menu
;     $81:944E: File select menu - index 0: title sequence to main - fade out and configure graphics
;     $81:94EE: File select menu - index 5/13h: fade out from main
;     $81:AF83: File select map - index Eh: room select map to loading game data - wait
;     $A7:C1FB: Unpause hook - Kraid is dead
;     $A7:C24E: Unpause hook - Kraid is alive
;     $A7:C2A0: Unpause hook - Kraid is sinking

; Note that setting force blank allows PPU writes even if NMI execution spills into the next frame's drawing period,
; so you can set up large VRAM transfers before calling this
    PHP : PHB
    PHK : PLB
    SEP #$20
    LDA.B DP_Brightness : ORA.B #$80 : STA.B DP_Brightness
    JSL WaitForNMI
    PLB : PLP
    RTL


;;; $8382: Clear force blank and wait for NMI ;;;
ClearForceBlankAndWaitForNMI:
; Called by:
;     $B032: Unused. Set up rotating mode 7 background
;     $81:8D6D: Debug game over menu - index 1: initialise
;     $81:91A4: Game over menu - index 1: initialise
;     $81:9ED6: File select menu - index 2: title sequence to main - initialise
;     $A7:C24E: Unpause hook - Kraid is alive
    PHP : PHB
    PHK : PLB
    SEP #$20
    LDA.B DP_Brightness : AND.B #$7F : STA.B DP_Brightness
    JSL WaitForNMI
    PLB : PLP
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $8395: Unused. Update CGRAM ;;;
UNUSED_UpdateCGRAM_808395:
; This routine is subsumed by $933A (update OAM & CGRAM)
    PHP
    SEP #$10 : REP #$20
    LDA.W #$2200 : STA.W $4310
    LDA.W #$C000 : STA.W $4312
    LDX.B #$7E : STX.W $4314
    LDA.W #$0200 : STA.W $4315
    LDX.B #$00 : STX.W $2121
    LDX.B #$02 : STX.W $420B
    PLP
    RTL


;;; $83BD: Unused. Write [Y] bytes of [A] to $00:0000 + [X] - 8-bit ;;;
UNUSED_WriteYBytesOfATo_000000_X_8bit_8083BD:
;; Parameters:
;;     A: Fill value
;;     X: Destination address. Range $0000..1FFF for WRAM writes
;;     Y: Size
    PHP : PHB
    PHK : PLB
    SEP #$20 : REP #$10

  .loop:
    STA.L $000000,X
    INX
    DEY : BNE .loop
    PLB : PLP
    RTL


;;; $83D0: Unused. Write [Y] bytes of [A] to $00:0000 + [X] - 16-bit ;;;
UNUSED_WriteYBytesOfATo_000000_X_16bit_8083D0:
;; Parameters:
;;     A: Fill value
;;     X: Destination address. Range $0000..1FFF for WRAM writes
;;     Y: Size
    PHP : PHB
    PHK : PLB
    REP #$30

  .loop:
    STA.L $000000,X
    INX #2
    DEY #2 : BNE .loop
    PLB : PLP
    RTL


;;; $83E3: Unused. Write [Y] bytes of [A] to $7E:0000 + [X] - 8-bit ;;;
UNUSED_WriteYBytesOfATo_7E0000_X_8bit_8083E3:
;; Parameters:
;;     A: Fill value
;;     X: Destination address
;;     Y: Size
    PHP : PHB
    PHK : PLB
    SEP #$20 : REP #$10

  .loop:
    STA.L $7E0000,X
    INX
    DEY : BNE .loop
    PLB : PLP
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $83F6: Write [Y] bytes of [A] to $7E:0000 + [X] - 16-bit ;;;
WriteYBytesOfATo_7E0000_X_16bit:
;; Parameters:
;;     A: Fill value
;;     X: Destination address
;;     Y: Size

; Called by:
;     $88B4: Unused. Clear high RAM
;     $88EB: Write 800h bytes of [A] to $7E:3000
;     $88FE: Write 800h bytes of [A] to $7E:4000
;     $88FE: Write 800h bytes of [A] to $7E:6000
;     $82:81DD: Set up PPU for gameplay
;     $8B:8000: Set up PPU for title sequence
;     $8B:80DA: Set up PPU for intro
    PHP : PHB
    PHK : PLB
    REP #$30

  .loop:
    STA.L $7E0000,X
    INX #2
    DEY #2 : BNE .loop
    PLB : PLP
    RTL


;;; $8409: Write [Y] bytes of [A] to $7F:0000 + [X] - 16-bit ;;;
WriteYBytesOfATo_7F0000_X_16bit:
;; Parameters:
;;     A: Fill value
;;     X: Destination address
;;     Y: Size

; Called by
;     $88B4: Unused. Clear high RAM
    PHP : PHB
    PHK : PLB
    REP #$30

  .loop:
    STA.L $7F0000,X
    INX #2
    DEY #2 : BNE .loop
    PLB : PLP
    RTL


;;; $841C: Boot ;;;
Boot:
; Most SNES games don't randomly wait 3 frames before running initialisation
; Best wild guess is that they might have had some kind of dev hardware thingy attached somewhere that boot-up had to wait for
    SEI                                                                  ; Disable IRQ
    CLC : XCE                                                                  ; Enable native mode
    JML .bank80                                                        ; Execute in bank $80 (FastROM)

  .bank80:
    SEP #$20
    LDA.B #$01 : STA.W $420D : STA.B $86 ; Enable FastROM
    REP #$30
    LDX.W #$1FFF : TXS                                                                  ; Allocate stack memory
    LDA.W #$0000 : TCD                                                                  ; Clear direct page
    PHK : PLB                                                                  ; DB = $80
    SEP #$30
    LDX.B #$04

  .wait3Frames:
    LDA.W $4212 : BPL .wait3Frames ; Wait the remainder of this frame and 3 more frames (???)

  ..wait:
    LDA.W $4212 : BMI ..wait
    DEX : BNE .wait3Frames
    REP #$30
    LDX.W #$1FFE

  .loop:
    ; Clear $0000..1FFF
    STZ.W $0000,X
    DEX #2 : BPL .loop
    JSL Initialise_IO_Registers_and_Display_Nintendo_Logo              ; Initialise IO registers and display Nintendo logo
    JSL UploadToAPU_Hardcoded
    dl SPC_Engine                                                        ; Upload SPC engine to APU
    BRA CommonBootSection                                                ; Go to common boot section


;;; $8462: Soft reset ;;;
SoftReset:
; Called by:
;     $9459: Read controller input. Also a debug branch
;     $81:9003: Debug game over menu - index 3: main
;     $81:90FE: Game over menu - index 7: fade out into soft reset
;     $81:94D5: File select menu - index 21h: fade out to title sequence

; Compared to boot ($841C), doesn't display Nintendo logo or upload SPC engine, but still waits 3 frames (see $841C)
    SEI                                                                  ; Disable IRQ
    CLC : XCE                                                                  ; Enable native mode
    REP #$30
    LDX.W #$1FFF : TXS                                                                  ; Allocate stack memory
    LDA.W #$0000 : TCD                                                                  ; Clear direct page
    PHK : PLB                                                                  ; DB = $80
    SEP #$30
    LDX.B #$04

  .wait:
    LDA.W $4212 : BPL .wait

  .wait3Frames:
    LDA.W $4212 : BMI .wait3Frames                                                     ; Wait the remainder of this frame and 3 more frames (???)
    DEX : BNE .wait


;;; $8482: Common boot section ;;;
CommonBootSection:
; They wait another (see $841C) 3 frames here at $8523
; It might be giving the SPC engine a chance to run its initialisation after sending zero bytes to the APU IO registers
    SEP #$20
    LDA.B #$8F : STA.W $2100                                                          ; Enable forced blank
    REP #$30
    PEA $7E00 : PLB : PLB
    LDX.W #$1FFE

  .clearBank7E:
    STZ.W $0000,X : STZ.W $2000,X : STZ.W $4000,X : STZ.W $6000,X
    STZ.W $8000,X : STZ.W $A000,X : STZ.W $C000,X : STZ.W $E000,X
    DEX #2 : BPL .clearBank7E
    PHK : PLB
    SEP #$30
    STZ.W $4200
    STZ.B DP_IRQAutoJoy                                                  ; Disable NMI and auto-joypad read
    LDA.B #$8F : STA.B DP_Brightness                                                  ; Set forced blank
    JSR Initialise_CPU_IO_Registers                                    ; Initialise CPU IO registers
    JSR InitialisePPURegisters                                         ; Initialise PPU registers
    JSR WriteALoadOf_1C2F                                              ; Write a load of 1C2Fh
    SEP #$20
    STZ.W APU_SoundQueueStartIndexLib1 : STZ.W APU_SoundQueueStartIndexLib2 : STZ.W APU_SoundQueueStartIndexLib3
    STZ.W APU_SoundQueueNextIndexLib1 : STZ.W APU_SoundQueueNextIndexLib2 : STZ.W APU_SoundQueueNextIndexLib3
    STZ.W APU_SoundStateLib1 : STZ.W APU_SoundStateLib2 : STZ.W APU_SoundStateLib3
    STZ.W APU_CurrentSoundLib1 : STZ.W APU_CurrentSoundLib2 : STZ.W APU_CurrentSoundLib3
    STZ.W APU_ClearSoundDelayLib1 : STZ.W APU_ClearSoundDelayLib2 : STZ.W APU_ClearSoundDelayLib3
    STZ.W APU_SoundQueueLib1 : STZ.W APU_SoundQueueLib2 : STZ.W APU_SoundQueueLib3
    REP #$20
    STZ.W OAMStack : STZ.B DP_OAMAddrPrio
    JSL ClearHighOAM                                                   ; Clear high OAM
    JSL Finalise_OAM                                                   ; Finalise OAM
    STZ.W SamusTiles_TopHalfFlag                                         ; Clear Samus tiles transfer flags
    STZ.W SamusTiles_TopHalfTilesDef : STZ.W SamusTiles_BottomHalfTilesDef
    JSL EnableNMI                                                      ; Enable NMI
    REP #$30
    STZ.W $2140 : STZ.W $2142 ; Clear APU IO registers (harmless 16-bit write bug)
    SEP #$30
    LDX.B #$04

  .wait:
    LDA.W $4212 : BPL .wait

  .wait3Frames:
    LDA.W $4212 : BMI .wait3Frames                                                     ; Wait the remainder of this frame and 3 more frames (???)
    DEX : BNE .wait
    REP #$30
    LDA.W #$0061 : STA.W RandomNumberSeed                                               ; Seed random number with 61h
    LDA.W #$0000 ; Clear music queue
    STA.W APU_MusicTimer
    STA.W APU_MusicQueueTimers : STA.W APU_MusicQueueTimers+2
    STA.W APU_MusicQueueTimers+4 : STA.W APU_MusicQueueTimers+6                                         
    STA.W APU_MusicQueueTimers+8 : STA.W APU_MusicQueueTimers+10
    STA.W APU_MusicQueueTimers+12 : STA.W APU_MusicQueueTimers+14
    LDA.L DebugConst_DebugMode : STA.W Debug_Enable                                                   ; Mirror debug byte to RAM
    JSR NTSC_PAL_SRAM_MappingCheck                                     ; NTSC/PAL and SRAM mapping check
    REP #$30
    JSL DetermineNumberOfDemoSets                                      ; Check for non-corrupt SRAM
    STZ.W DisableSounds                                                  ; Enable sounds
    STZ.W APU_SoundHandlerDowntime                                       ; Sound handler downtime = 0
    JML MainGameLoop                                                   ; Go to main game loop


;;; $8572: Unused. BRK ;;;
    db $00 ; BRK with no operand


;;; $8573: Infinite loop; pointed to by misc. error handling ;;;
Crash_Handler:
; Called by:
;     $90:E9CE: Handle periodic damage to Samus
;     $91:DF51: Deal [A] damage to Samus
;     $93:8000: Initialise projectile
;     $93:8071: Initialise super missile link
;     $93:80A0: Initialise (power) bomb
;     $93:8163: Initialise shinespark echo or spazer SBA trail projectile
;     $93:81A4: Initialise SBA projectile
    JML Crash_Handler                                                  ; Crash handler, jump to self


if !FEATURE_KEEP_UNREFERENCED
;;; $8577: Unused. Block for [A] frames ;;;
UNUSED_WaitAFrames_808577:
;; Parameters:
;;     A: Number of frames to block for (including the rest of this frame)
    PHP : PHB
    PHK : PLB
    SEP #$20
    STA.W BlockFramesTimer

  .waitNMI:
    JSL WaitForNMI
    DEC.W BlockFramesTimer : BNE .waitNMI
    PLB : PLP
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $858C: Load map explored ;;;
LoadMirrorOfCurrentAreasMapExplored:
; Called by:
;     $81:9C9E: File select menu - index 19h: file clear - do file clear
;     $81:A1C2: File select menu - index 4: main
;     $81:AD17: File select map - index 9: area select map to room select map - initialise
;     $82:8000: Game state 6/1Fh/28h (loading game data / set up new game / load demo game data)
;     $82:DFB6: Load map explored if elevator
    PHP
    REP #$30
    LDA.W AreaIndex : XBA : TAX
    LDY.W #$0000

  .loop:
    LDA.L ExploredMapTiles,X : STA.W MapTilesExplored,Y
    INX #2
    INY #2 : CPY.W #$0100 : BMI .loop
    LDX.W AreaIndex
    LDA.L SRAMMirror_MapStations,X : AND.W #$00FF : STA.W CurrentAreaMapCollectedFlag
    PLP
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $85B6: Unused. Generic bitmasks ;;;
UNUSED_Generic_Bitmasks:
    dw $0001,$0002,$0004,$0008,$0010,$0020,$0040,$0080
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $85C6: Save map explored ;;;
MirrorCurrentAreasMapExplored:
; Called by:
;     $82:DF99: Save map explored if elevator
    PHP
    REP #$30
    LDA.W AreaIndex : XBA : TAX
    LDY.W #$0000

  .loop:
    LDA.W MapTilesExplored,Y : STA.L ExploredMapTiles,X
    INX #2
    INY #2 : CPY.W #$0100 : BMI .loop
    LDA.W CurrentAreaMapCollectedFlag : BEQ .return
    LDX.W AreaIndex
    LDA.L SRAMMirror_MapStations,X : ORA.W #$00FF : STA.L SRAMMirror_MapStations,X

  .return:
    PLP
    RTL


;;; $85F6: NTSC/PAL and SRAM mapping check ;;;
NTSC_PAL_SRAM_MappingCheck:
; Checks that the SNES PPU's region matches up with the game header's region
; and that the SRAM regions $70:0000..1FFF and $70:2000..3FFF are mirrors
    PHP
    SEP #$30
    LDA.L DebugConst_RegionSRAM : BEQ .region                                                          ; If [$80:8000] != 0:
    JMP .return                                                        ; Return

  .region:
    LDA.L ROM_HEADER_country&$00FFFF : CMP.B #$00 : BEQ .japan ; If country code != Japan:
    LDA.W $213F : BIT.B #$10 : BEQ .failedRegion ; If PPU set to PAL:
    JMP .SRAMCheck

  .japan:
    ; If PPU set to NTSC: go to .SRAMCheck
    LDA.W $213F : BIT.B #$10 : BEQ .SRAMCheck

  .failedRegion:
    LDA.B #$8F : STA.W $2100                                                          ; Enable forced blank
    STZ.W $4200                                                          ; Disable all interrupts
    LDA.B #$00 : STA.W $2116
    LDA.B #$00 : STA.W $2117
    LDA.B #$80 : STA.W $2115                                                          ; VRAM $0000..1FFF = [$8E:8000..BFFF] (BG1 tiles)
    JSL SetupHDMATransfer                                              ; Set up a (H)DMA transfer
    db $01,$01,$18
    dl Tiles_Menu_BG1_BG2
    dw $4000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$40 : STA.W $2117
    LDA.B #$80 : STA.W $2115                                                          ; VRAM $4000..47FF = [$80:B437..C436] (BG1 tilemap)
    JSL SetupHDMATransfer                                              ; Set up a (H)DMA transfer
    db $01,$01,$18
    dl Tilemap_FailedRegionCheck
    dw $1000
    LDA.B #$02 : STA.W $420B
    STZ.W $2121
    JSL SetupHDMATransfer                                              ; Set up a (H)DMA transfer
    db $01,$00,$22                                                       ; CGRAM = [$8E:E400..E5FF] (menu palettes)
    dl Menu_Palettes
    dw $0200
    LDA.B #$02 : STA.W $420B
    STZ.W $2131                                                          ; Disable colour math
    STZ.W $212D                                                          ; Disable subscreen
    LDA.B #$01 : STA.W $212C                                                          ; Main screen layers = BG1
    LDA.B #$0F : STA.W $2100                                                          ; Disable forced blank
    LDA.B #$00 : STA.W $210B                                                          ; BG1 tiles base address = $0000
    LDA.B #$40 : STA.W $2107                                                          ; BG1 tilemap base address = $4000

  .gotoCrash:
    BRA .gotoCrash

  .SRAMCheck:
    REP #$30
    LDX.W #$1FFE

  .backupSRAM:
    LDA.L $700000,X : STA.L $7F0000,X                                                      ; $7F:0000..1FFF = [$70:0000..1FFF]
    DEX #2 : BPL .backupSRAM
    LDA.W #$0000
    LDX.W #$1FFE

  .clearSRAM:
    STA.L $700000,X                                                      ; Clear $70:0000..1FFF
    DEX #2 : BPL .clearSRAM
    LDA.W #$0000
    LDX.W #$1FFE

  .writeSRAM:
    STA.L $702000,X
    INC                                                                  ; $70:2000..3FFF = 0..FFFh
    DEX #2 : BPL .writeSRAM
    LDA.W #$0000
    LDX.W #$1FFE

  .loop:
    CMP.L $700000,X : BNE .failedSRAMCheck ; If [$70:0000..1FFF] != 0..FFFh: go to .failedSRAMCheck
    INC
    DEX #2

  .verifySRAM:
    BPL .loop
    LDX.W #$1FFE

  .restoreSRAM:
    LDA.L $7F0000,X : STA.L $700000,X                                                      ; $70:0000..1FFF = [$7F:0000..1FFF]
    DEX #2 : BPL .restoreSRAM

  .return:
    PLP
    RTS                                                                  ; return

  .failedSRAMCheck:
    SEP #$20
    LDA.B #$8F : STA.W $2100                                                          ; Enable forced blank
    STZ.W $4200                                                          ; Disable all interrupts
    LDA.B #$00 : STA.W $2116
    LDA.B #$00 : STA.W $2117
    LDA.B #$80 : STA.W $2115                                                          ; VRAM $0000..1FFF = [$8E:8000..BFFF] (BG1 tiles)
    JSL SetupHDMATransfer                                              ; Set up a (H)DMA transfer
    db $01,$01,$18
    dl Tiles_Menu_BG1_BG2
    dw $4000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$40 : STA.W $2117
    LDA.B #$80 : STA.W $2115                                                          ; VRAM $4000..47FF = [$80:BC37..C436] (BG1 tilemap)
    JSL SetupHDMATransfer                                              ; Set up a (H)DMA transfer
    db $01,$01,$18
    dl Tilemap_FailedSRAMMappingCheck
    dw $1000
    LDA.B #$02 : STA.W $420B
    STZ.W $2121
    JSL SetupHDMATransfer                                              ; Set up a (H)DMA transfer
    db $01,$00,$22                                                       ; CGRAM = [$8E:E400..E5FF] (menu palettes)
    dl Menu_Palettes
    dw $0200
    LDA.B #$02 : STA.W $420B
    STZ.W $2131                                                          ; Disable colour math
    STZ.W $212D                                                          ; Disable subscreen
    LDA.B #$01 : STA.W $212C                                                          ; Main screen layers = BG1
    LDA.B #$0F : STA.W $2100                                                          ; Disable forced blank
    LDA.B #$00 : STA.W $210B                                                          ; BG1 tiles base address = $0000
    LDA.B #$40 : STA.W $2107                                                          ; BG1 tilemap base address = $4000

  .crash:
    BRA .crash                                                           ; Crash


;;; $875D: Initialise CPU IO registers ;;;
Initialise_CPU_IO_Registers:
    ; Enable auto-joypad read
    LDA.B #$01 : STA.W $4200 : STA.B DP_IRQAutoJoy
    STZ.W $4201                                                          ; Joypad programmable IO port = 0
    STZ.W $4202
    STZ.W $4203                                                          ; Multiplication operands = 0
    STZ.W $4204
    STZ.W $4205                                                          ; Division operands = 0 (causes harmless division by zero)
    STZ.W $4206
    STZ.W $4207
    STZ.W $4208                                                          ; IRQ h-counter target = 0
    STZ.W $4209
    STZ.W $420A                                                          ; IRQ v-counter target = 0
    STZ.W $420B                                                          ; Disable all DMA channels
    STZ.W $420C
    STZ.B DP_HDMAEnable                                                  ; Disable all HDMA channels
    LDA.B #$01 : STA.W $420D : STA.B DP_ROMAccessSpeed ; Enable FastROM
    RTS


;;; $8792: Initialise PPU registers ;;;
InitialisePPURegisters:
; These BG/sprites addresses aren't used, $8B:8000 (set up PPU for title sequence) overwrites them
    LDA.B #$8F : STA.W $2100 : STA.B DP_Brightness ; Enable forced blank
    ; Sprite tiles base address = $6000, sprite sizes = 8x8 / 16x16
    LDA.B #$03 : STA.W $2101 : STA.B DP_SpriteSizeAddr
    STZ.W $2102
    STZ.B DP_OAMAddrPrio
    LDA.B #$80 : STA.W $2103 : STA.B DP_OAMAddrPrio+1 ; OAM address = $0000, priority sprite index = 0
    STZ.W $2104 : STZ.W $2104 ; OAM $0000 = 0
    LDA.B #$09 : STA.W $2105 : STA.B DP_BGModeSize ; BG mode = 1 with BG3 priority, BG tile sizes = 8x8
    STZ.W $2106
    STZ.B DP_Mosaic                                                      ; Disable mosaic
    LDA.B #$40 : STA.W $2107 : STA.B DP_BG1TilemapAddrSize ; BG1 tilemap base address = $4000, size = 32x32
    LDA.B #$44 : STA.W $2108 : STA.B DP_BG2TilemapAddrSize                                          ; BG2 tilemap base address = $4400, size = 32x32
    LDA.B #$48 : STA.W $2109 : STA.B DP_BG3TilemapAddrSize                                          ; BG3 tilemap base address = $4800, size = 32x32
    LDA.B #$48                                                           ; >.<
    STZ.W $210A : STZ.B DP_BG4TilemapAddrSize                                          ; BG4 tilemap base address = $0000, size = 32x32
    LDA.B #$00 : STA.W $210B : STA.B DP_BGTilesAddr                                                 ; BG1/2/4 tiles base address = $0000
    LDA.B #$05 : STA.W $210C : STA.B DP_BGTilesAddr+1                                               ; BG3 tiles base address = $5000
    STZ.W $210D : STZ.W $210D                                                          ; BG1 X scroll = 0
    STZ.W $210E : STZ.W $210E                                                          ; BG1 Y scroll = 0
    STZ.W $210F : STZ.W $210F                                                          ; BG2 X scroll = 0
    STZ.W $2110 : STZ.W $2110                                                          ; BG2 Y scroll = 0
    STZ.W $2111 : STZ.W $2111                                                          ; BG3 X scroll = 0
    STZ.W $2112 : STZ.W $2112                                                          ; BG3 Y scroll = 0
    STZ.W $2113 : STZ.W $2113                                                          ; BG4 X scroll = 0
    STZ.W $2114 : STZ.W $2114                                                          ; BG4 Y scroll = 0
    STZ.W $2115                                                          ; VRAM address increment mode = 8-bit
    STZ.W $211A : STZ.B DP_Mode7Settings                                               ; Mode 7 settings = 0
    STZ.W $211B : STZ.W $211C : STZ.W $211D : STZ.W $211E ; Mode 7 transformation matrix = {{0, 0}, {0, 0}}
    STZ.W $211F : STZ.W $2120                                                          ; Mode 7 transformation origin co-ordinate X/Y = 0
    LDA.B #$00 : STA.W $2123 : STA.B DP_WindowMaskBG12
    LDA.B #$00 : STA.W $2124 : STA.B DP_WindowMaskBG34 ; Disable all window masks
    STZ.W $2125 : STZ.B DP_WindowMaskSprite
    LDA.B #$00 : STA.W $2126 : STA.B DP_Window1Left ; Window 1 left position = 0
    LDA.B #$F8 : STA.W $2127 : STA.B DP_Window1Right ; Window 1 right position = F8h
    STZ.W $2128 : STZ.B DP_Window2Left                                                 ; Window 2 left position = 0
    STZ.W $2129 : STZ.B DP_Window2Right                                                ; Window 2 right position = 0
    STZ.W $212A : STZ.B DP_Window12BGMaskLogic
    STZ.W $212B : STZ.B DP_Window12SpriteMaskLogic ; Window 1/2 mask logic = OR
    LDA.B #$11 : STA.W $212C                                                         
    STA.B DP_MainScreenLayers ; Main screen layers = BG1/sprites
    STA.W $212E
    STA.B DP_WindowAreaMainScreen                                        ; Disable BG1/sprites in window area main screen
    LDA.B #$02 : STA.W $212D : STA.B DP_SubScreenLayers ; Subscreen layers = BG2
    STA.W $212F : STA.B DP_WindowAreaSubScreen                                         ; Disable BG2 in window area subscreen
    LDA.B #$02 : STA.W $2130 : STA.B DP_NextGameplayColorMathA ; Enable colour math subscreen layers
    LDA.B #$A1 : STA.W $2131 : STA.B DP_NextGameplayColorMathB ; Enable subtractive colour math on BG1/backdrop
    LDA.B #$E0 : STA.W $2132
    LDA.B #$E0 : STA.W $2132
    LDA.B #$80 : STA.W $2132 : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.B #$40 : STA.W $2132 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$20 : STA.W $2132 : STA.B DP_ColorMathSubScreenBackdropColor2
    LDA.B #$00 : STA.W $2133 : STA.B DP_DisplayResolution
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $88B4: Unused. Clear high RAM ;;;
UNUSED_ClearHighRAM_8088B4:
    REP #$30
    LDA.W #$0000
    LDX.W #$2000
    LDY.W #$E000                                                         ; Clear $7E:2000..FFFF
    JSL WriteYBytesOfATo_7E0000_X_16bit
    LDA.W #$0000 : TAX ; >.<
    LDY.W #$DFFE                                                         ; Clear $7F:0000..DFFD
    JSL WriteYBytesOfATo_7F0000_X_16bit
    SEP #$30
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $88D1: Write a load of 1C2Fh ;;;
WriteALoadOf_1C2F:
; Called by:
;     $8482: Common boot section

; These assignments have no effect. Before the first read to any of these RAM regions:
;     $7E:3000..37FF is set to 0 by $8B:8000 (set up PPU for title sequence), which also has no effect, then to either 0 by $82:81DD (set up PPU for gameplay) or Zebes and stars tilemap by $81:9E93 (file select menu - index 1: title sequence to main - load BG2)
;     $7E:4000..47FF is set to 006Fh by $82:81DD (set up PPU for gameplay)
;     $7E:6000..67FF is clobbered by a decompression in $82:E3C0 (door transition function - place Samus, load tiles)
    REP #$30
    LDA.W #$1C2F
    JSL Write_800h_Bytes_Of_A_To_7E3000                                ; $7E:3000..37FF = 1C2Fh
    LDA.W #$1C2F
    JSL Write_800h_Bytes_Of_A_To_7E4000                                ; $7E:4000..47FF = 1C2Fh
    LDA.W #$1C2F
    JSL Write_800h_Bytes_Of_A_To_7E6000                                ; $7E:6000..67FF = 1C2Fh
    SEP #$30
    RTS


;;; $88EB: Write 800h bytes of [A] to $7E:3000 ;;;
Write_800h_Bytes_Of_A_To_7E3000:
;; Parameters:
;;     A: Fill value

; Called by:
;     $88D1: Write a load of 1C2Fh
    PHP : PHB
    PHK : PLB
    REP #$30
    LDX.W #$3000
    LDY.W #$0800
    JSL WriteYBytesOfATo_7E0000_X_16bit
    PLB : PLP
    RTL


;;; $88FE: Write 800h bytes of [A] to $7E:4000 ;;;
Write_800h_Bytes_Of_A_To_7E4000:
;; Parameters:
;;     A: Fill value

; Called by:
;     $88D1: Write a load of 1C2Fh
    PHP : PHB
    PHK : PLB
    REP #$30
    LDX.W #$4000
    LDY.W #$0800
    JSL WriteYBytesOfATo_7E0000_X_16bit
    PLB : PLP
    RTL


;;; $8911: Write 800h bytes of [A] to $7E:6000 ;;;
Write_800h_Bytes_Of_A_To_7E6000:
;; Parameters:
;;     A: Fill value

; Called by:
;     $88D1: Write a load of 1C2Fh
    PHP : PHB
    PHK : PLB
    REP #$30
    LDX.W #$6000
    LDY.W #$0800
    JSL WriteYBytesOfATo_7E0000_X_16bit
    PLB : PLP
    RTL


;;; $8924: Handle fading out ;;;
HandleFadingOut:
; When the screen has finished fading out, [$51] = 80h.
; Easiest way to check is:
;     LDA $51 : BMI BRANCH_FINISHED ; If PSR.M = 1
;     LDA $50 : BMI BRANCH_FINISHED ; If PSR.M = 0
    PHP
    REP #$20
    LDA.W ScreenFadeCounter : DEC : BMI .fadeOut
    STA.W ScreenFadeCounter                                              ; Decrement screen fade counter
    BRA .return                                                          ; Return

  .fadeOut:
    LDA.W ScreenFadeDelay : STA.W ScreenFadeCounter                                              ; Screen fade counter = [screen fade delay]
    SEP #$30
    ; If (brightness) = 0: return
    LDA.B DP_Brightness : AND.B #$0F : BEQ .return
    DEC : BNE .disableFBlank                                                   ; If (brightness) = 1:
    LDA.B #$80 : STA.B DP_Brightness                                                  ; Enable forced blank, brightness = 0
    BRA .return                                                          ; Return

  .disableFBlank:
    STA.B DP_Brightness                                                  ; Decrement brightness (disable forced blank)

  .return:
    PLP
    RTL


;;; $894D: Handle fading in ;;;
HandleFadingIn:
; When the screen has finished fading in, [$51] = Fh.
; Easiest way to check is:
;     LDA $51 : CMP #$0F : BEQ BRANCH_FINISHED         ; If PSR.M = 1
;     LDA $50 : ASL : CMP #$1E00 : BCS BRANCH_FINISHED ; If PSR.M = 0
;     LDA $50 : CMP #$0F00 : BCS BRANCH_FINISHED       ; If PSR.M = 0 and forced blank is known to be disabled (force blank is enabled by fade out)
    PHP
    REP #$20
    ; If [screen fade counter] != 0:
    LDA.W ScreenFadeCounter : DEC : BMI .fadeIn
    STA.W ScreenFadeCounter                                              ; Decrement screen fade counter
    BRA .return                                                          ; Return

  .fadeIn:
    LDA.W ScreenFadeDelay : STA.W ScreenFadeCounter                                              ; Screen fade counter = [screen fade delay]
    SEP #$30
    ; If brightness is not max:
    LDA.B DP_Brightness : INC : AND.B #$0F : BEQ .return
    STA.B DP_Brightness                                                  ; Increment brightness (disable forced blank)

  .return:
    PLP
    RTL


;;; $896E: Finalise OAM ;;;
Finalise_OAM:
; Move unused sprites to Y = F0h and reset OAM stack pointer
; Uses one hell of an unrolled loop
    PHP
    REP #$30
    LDA.W OAMStack : CMP.W #$0200 : BPL .clearOAMStackPointer
    LSR : STA.B DP_Temp12
    LSR : ADC.B DP_Temp12 : CLC : ADC.W #.spriteY00F0 : STA.B DP_Temp12
    LDA.W #$00F0
    SEP #$30
    JMP.W (DP_Temp12)

  .clearOAMStackPointer:
    STZ.W OAMStack
    PLP
    RTL

  .spriteY00F0:
    STA.W OAMLow+1 : STA.W OAMLow+5 : STA.W OAMLow+9 : STA.W OAMLow+$D
    STA.W OAMLow+$11 : STA.W OAMLow+$15 : STA.W OAMLow+$19 : STA.W OAMLow+$1D
    STA.W OAMLow+$21 : STA.W OAMLow+$25 : STA.W OAMLow+$29 : STA.W OAMLow+$2D
    STA.W OAMLow+$31 : STA.W OAMLow+$35 : STA.W OAMLow+$39 : STA.W OAMLow+$3D
    STA.W OAMLow+$41 : STA.W OAMLow+$45 : STA.W OAMLow+$49 : STA.W OAMLow+$4D
    STA.W OAMLow+$51 : STA.W OAMLow+$55 : STA.W OAMLow+$59 : STA.W OAMLow+$5D
    STA.W OAMLow+$61 : STA.W OAMLow+$65 : STA.W OAMLow+$69 : STA.W OAMLow+$6D
    STA.W OAMLow+$71 : STA.W OAMLow+$75 : STA.W OAMLow+$79 : STA.W OAMLow+$7D
    STA.W OAMLow+$81 : STA.W OAMLow+$85 : STA.W OAMLow+$89 : STA.W OAMLow+$8D
    STA.W OAMLow+$91 : STA.W OAMLow+$95 : STA.W OAMLow+$99 : STA.W OAMLow+$9D
    STA.W OAMLow+$A1 : STA.W OAMLow+$A5 : STA.W OAMLow+$A9 : STA.W OAMLow+$AD
    STA.W OAMLow+$B1 : STA.W OAMLow+$B5 : STA.W OAMLow+$B9 : STA.W OAMLow+$BD
    STA.W OAMLow+$C1 : STA.W OAMLow+$C5 : STA.W OAMLow+$C9 : STA.W OAMLow+$CD
    STA.W OAMLow+$D1 : STA.W OAMLow+$D5 : STA.W OAMLow+$D9 : STA.W OAMLow+$DD
    STA.W OAMLow+$E1 : STA.W OAMLow+$E5 : STA.W OAMLow+$E9 : STA.W OAMLow+$ED
    STA.W OAMLow+$F1 : STA.W OAMLow+$F5 : STA.W OAMLow+$F9 : STA.W OAMLow+$FD
    STA.W OAMLow+$101 : STA.W OAMLow+$105 : STA.W OAMLow+$109 : STA.W OAMLow+$10D
    STA.W OAMLow+$111 : STA.W OAMLow+$115 : STA.W OAMLow+$119 : STA.W OAMLow+$11D
    STA.W OAMLow+$121 : STA.W OAMLow+$125 : STA.W OAMLow+$129 : STA.W OAMLow+$12D
    STA.W OAMLow+$131 : STA.W OAMLow+$135 : STA.W OAMLow+$139 : STA.W OAMLow+$13D
    STA.W OAMLow+$141 : STA.W OAMLow+$145 : STA.W OAMLow+$149 : STA.W OAMLow+$14D
    STA.W OAMLow+$151 : STA.W OAMLow+$155 : STA.W OAMLow+$159 : STA.W OAMLow+$15D
    STA.W OAMLow+$161 : STA.W OAMLow+$165 : STA.W OAMLow+$169 : STA.W OAMLow+$16D
    STA.W OAMLow+$171 : STA.W OAMLow+$175 : STA.W OAMLow+$179 : STA.W OAMLow+$17D
    STA.W OAMLow+$181 : STA.W OAMLow+$185 : STA.W OAMLow+$189 : STA.W OAMLow+$18D
    STA.W OAMLow+$191 : STA.W OAMLow+$195 : STA.W OAMLow+$199 : STA.W OAMLow+$19D
    STA.W OAMLow+$1A1 : STA.W OAMLow+$1A5 : STA.W OAMLow+$1A9 : STA.W OAMLow+$1AD
    STA.W OAMLow+$1B1 : STA.W OAMLow+$1B5 : STA.W OAMLow+$1B9 : STA.W OAMLow+$1BD
    STA.W OAMLow+$1C1 : STA.W OAMLow+$1C5 : STA.W OAMLow+$1C9 : STA.W OAMLow+$1CD
    STA.W OAMLow+$1D1 : STA.W OAMLow+$1D5 : STA.W OAMLow+$1D9 : STA.W OAMLow+$1DD
    STA.W OAMLow+$1E1 : STA.W OAMLow+$1E5 : STA.W OAMLow+$1E9 : STA.W OAMLow+$1ED
    STA.W OAMLow+$1F1 : STA.W OAMLow+$1F5 : STA.W OAMLow+$1F9 : STA.W OAMLow+$1FD
    STZ.W OAMStack : STZ.W OAMStack+1
    PLP
    RTL


;;; $8B1A: Clear high OAM ;;;
ClearHighOAM:
    PHP
    REP #$30
    STZ.W OAMHigh+0 : STZ.W OAMHigh+2 : STZ.W OAMHigh+4 : STZ.W OAMHigh+6
    STZ.W OAMHigh+8 : STZ.W OAMHigh+$A : STZ.W OAMHigh+$C : STZ.W OAMHigh+$E
    STZ.W OAMHigh+$10 : STZ.W OAMHigh+$12 : STZ.W OAMHigh+$14 : STZ.W OAMHigh+$16
    STZ.W OAMHigh+$18 : STZ.W OAMHigh+$1A : STZ.W OAMHigh+$1C : STZ.W OAMHigh+$1E
    PLP
    RTL


;;; $8B4F: Queue mode 7 transfers ;;;
QueueMode7Transfers:
;; Parameter:
;;     DB:X: Pointer to mode 7 transfers data (see $8BD3)

; Called by:
;     $8B:9537: Process mode 7 object instruction list (used only by baby metroid in title sequence)
;     $8B:BDF9: Cinematic function - fly to Ceres - flying into camera with DB:X = $8B:BE74 (back of gunship going to Ceres)
;     $8B:C345: Cinematic function - Ceres goes boom - Ceres explosions with DB:X = $8B:C3E6 (front of gunship leaving Ceres) / $8B:C3F0/C3FA (clear Ceres tilemap)
;     $A6:ACBC (Ceres Ridley)
;     $A6:AD27 (Ceres Ridley)
;     $A6:F8F1: Animate Ceres elevator platform with DB:X = $A6:F904/F90E (light/dark)

; CGRAM transfers are supported, but no mode 7 transfers data actually define any CGRAM transfers, so $8B62..8B8A is dead code

; From the RAM map:
; $02D0..032F: Mode 7 transfers. 7 or 9 byte entries. 1 byte zero-terminator
; {
;   +   0: Control
;         DMA control = [control] & 1Fh (transfer unit selection and address increment direction)
;         DMA target = [control] & C0h:
;             40h: CGRAM data write
;             80h: VRAM data write low (tilemap)
;             C0h: VRAM data write high (tiles)
;   +   1: Source address
;   +   4: Size
;   +   6: Destination address (1 byte for CGRAM transfers, 2 bytes for VRAM transfers)
;   +   8: VRAM address increment mode (for VRAM transfers only)
; }
    PHX : PHY
    LDY.W Mode7Stack
    DEX

  .loop:
    BIT.W $0000,X : BMI .VRAM
    BVS .CGRAM
    STY.W Mode7Stack
    PLY : PLX
    RTL

  .CGRAM:
    LDA.W $0001,X : STA.W Mode7Transfer.control,Y
    LDA.W $0003,X : STA.W Mode7Transfer.src+1,Y
    LDA.W $0005,X : STA.W Mode7Transfer.size,Y
    LDA.W $0007,X : AND.W #$00FF : STA.W Mode7Transfer.dest,Y
    TXA : CLC : ADC.W #$0007 : TAX
    TYA : CLC : ADC.W #$0007 : TAY
    BRA .loop

  .VRAM:
    LDA.W $0001,X : STA.W Mode7Transfer.control,Y
    LDA.W $0003,X : STA.W Mode7Transfer.src+1,Y
    LDA.W $0005,X : STA.W Mode7Transfer.size,Y
    LDA.W $0007,X : STA.W Mode7Transfer.dest,Y
    LDA.W $0009,X : AND.W #$00FF : STA.W Mode7Transfer.inc,Y
    TXA : CLC : ADC.W #$0009 : TAX
    TYA : CLC : ADC.W #$0009 : TAY
    BRA .loop


;;; $8BBA: Handle mode 7 transfers ;;;
HandleMode7Transfers:
    PHP
    REP #$10
    LDX.W Mode7Stack : BEQ .return
    LDX.W #Mode7Transfer.control
    JSL ProcessMode7Transfers
    REP #$20
    STZ.W Mode7Transfer.control : STZ.W Mode7Stack

  .return:
    PLP
    RTL


;;; $8BD3: Process mode 7 transfers ;;;
ProcessMode7Transfers:
;; Parameter:
;;     X: Pointer to mode 7 transfers data

; CGRAM transfers are never queued, so $8BE0..8C10 is dead code
    PHP

  .loop:
    SEP #$20
    LDA.W $0000,X : BMI .VRAM
    ASL : BMI .CGRAM
    PLP
    RTL

  .CGRAM:
    LSR : AND.B #$1F : STA.W $4310
    LDY.W $0001,X : STY.W $4312
    LDA.W $0003,X : STA.W $4314
    LDY.W $0004,X : STY.W $4315
    LDA.B #$22 : STA.W $4311
    LDA.W $0006,X : STA.W $2121
    LDA.B #$02 : STA.W $420B
    REP #$21 ; carry clear
    TXA : ADC.W #$0007 : TAX
    BRA .loop

  .VRAM:
    ASL : BMI .VRAMTiles
    LSR : AND.B #$1F : STA.W $4310
    LDY.W $0001,X : STY.W $4312
    LDA.W $0003,X : STA.W $4314
    LDY.W $0004,X : STY.W $4315
    LDA.B #$18 : STA.W $4311
    LDY.W $0006,X : STY.W $2116
    LDA.W $0008,X : STA.W $2115
    LDA.B #$02 : STA.W $420B
    REP #$21 ; carry clear
    TXA : ADC.W #$0009 : TAX
    BRA .loop

  .VRAMTiles:
    LSR : AND.B #$1F : STA.W $4310
    LDY.W $0001,X : STY.W $4312
    LDA.W $0003,X : STA.W $4314
    LDY.W $0004,X : STY.W $4315
    LDA.B #$19 : STA.W $4311
    LDY.W $0006,X : STY.W $2116
    LDA.W $0008,X : STA.W $2115
    LDA.B #$02 : STA.W $420B
    REP #$21 ; carry clear
    TXA : ADC.W #$0009 : TAX
    JMP .loop


;;; $8C83: Handle VRAM write table and scrolling DMAs ;;;
HandleVRAMWriteTable_ScrollingDMAs:
    PHP
    REP #$30
    LDX.W VRAMWriteStack : BEQ .done
    STZ.B VRAMWrite.size,X
    LDA.W #$1801 : STA.W $4310
    LDY.W #$0000

  .loop:
    LDA.W VRAMWrite.size,Y : BEQ .done
    STA.W $4315
    LDA.W VRAMWrite.src,Y : STA.W $4312
    LDA.W VRAMWrite.src+1,Y : STA.W $4313
    LDA.W #$0080
    LDX.B VRAMWrite.dest,Y : BPL .skip
    INC

  .skip:
    STA.W $2115
    STX.W $2116
    SEP #$20
    LDA.B #$02 : STA.W $420B
    REP #$20
    TYA : CLC : ADC.W #$0007 : TAY
    BRA .loop

  .done:
    STZ.W VRAMWriteStack
    SEP #$20 : REP #$10
    JSR ExecuteHorizontalScrollingDMAs
    JSR ExecuteVerticalScrollingDMAs
    PLP
    RTL


;;; $8CD8: Execute horizontal scrolling DMAs ;;;
ExecuteHorizontalScrollingDMAs:
    LDA.B #$81 : STA.W $2115
    LDA.W BG1Col_updateVRAMTilemapFlag : BEQ .BG2
    STZ.W BG1Col_updateVRAMTilemapFlag
    LDY.W BG1Col_unwrappedTilemapVRAMUpdateDest : STY.W $2116
    LDX.W #$1801 : STX.W $4310
    LDX.W #BG1ColumnUpdateTilemapLeftHalves : STX.W $4312
    LDA.B #$7E : STA.W $4314
    LDX.W BG1Col_unwrappedTilemapVRAMUpdateSize : STX.W $4315
    LDA.B #$02 : STA.W $420B
    INY : STY.W $2116
    STX.W $4315
    LDX.W #BG1ColumnUpdateTilemapRightHalves : STX.W $4312
    LDA.B #$02 : STA.W $420B
    LDX.W BG1Col_wrappedTilemapVRAMUpdateLeftHalvesSrc : STX.W $4312
    LDX.W BG1Col_wrappedTilemapVRAMUpdateSize : BEQ .BG2
    STX.W $4315
    LDY.W BG1Col_wrappedTilemapVRAMUpdateDest : STY.W $2116
    LDA.B #$02 : STA.W $420B
    INY : STY.W $2116
    STX.W $4315
    LDX.W BG1Col_wrappedTilemapVRAMUpdateRightHalvesSrc : STX.W $4312
    LDA.B #$02 : STA.W $420B

  .BG2:
    LDA.W BG2Col_updateVRAMTilemapFlag : BEQ .return
    STZ.W BG2Col_updateVRAMTilemapFlag
    LDY.W BG2Col_unwrappedTilemapVRAMUpdateDest : STY.W $2116
    LDX.W #$1801 : STX.W $4310
    LDX.W #BG2ColumnUpdateTilemapLeftHalves : STX.W $4312
    LDA.B #$7E : STA.W $4314
    LDX.W BG2Col_unwrappedTilemapVRAMUpdateSize : STX.W $4315
    LDA.B #$02 : STA.W $420B
    INY : STY.W $2116
    STX.W $4315
    LDX.W #BG2ColumnUpdateTilemapRightHalves : STX.W $4312
    LDA.B #$02 : STA.W $420B
    LDX.W BG2Col_wrappedTilemapVRAMUpdateLeftHalvesSrc : STX.W $4312
    LDX.W BG2Col_wrappedTilemapVRAMUpdateSize : BEQ .return
    STX.W $4315
    LDY.W BG2Col_wrappedTilemapVRAMUpdateDest : STY.W $2116
    LDA.B #$02 : STA.W $420B
    INY : STY.W $2116
    STX.W $4315
    LDX.W BG2Col_wrappedTilemapVRAMUpdateRightHalvesSrc : STX.W $4312
    LDA.B #$02 : STA.W $420B

  .return:
    RTS


;;; $8DAC: Execute vertical scrolling DMAs ;;;
ExecuteVerticalScrollingDMAs:
    LDA.B #$80 : STA.W $2115
    LDA.W BG1Row_updateVRAMTilemapFlag : BEQ .BG2
    STZ.W BG1Row_updateVRAMTilemapFlag
    LDY.W BG1Row_unwrappedTilemapVRAMUpdateDest : STY.W $2116
    LDX.W #$1801 : STX.W $4310
    LDX.W #BG1RowUpdateTilemapTopHalves : STX.W $4312
    LDA.B #$7E : STA.W $4314
    LDX.W BG1Row_unwrappedTilemapVRAMUpdateSize : STX.W $4315
    LDA.B #$02 : STA.W $420B
    REP #$20
    TYA : ORA.W #$0020 : STA.W $2116
    SEP #$20
    STX.W $4315
    LDX.W #BG1RowUpdateTilemapBottomHalves : STX.W $4312
    LDA.B #$02 : STA.W $420B
    LDX.W BG1Row_wrappedTilemapVRAMUpdateLeftHalvesSrc : STX.W $4312
    LDX.W BG1Row_wrappedTilemapVRAMUpdateSize : BEQ .BG2
    STX.W $4315
    LDY.W BG1Row_wrappedTilemapVRAMUpdateDest : STY.W $2116
    LDA.B #$02 : STA.W $420B
    REP #$20
    TYA : ORA.W #$0020 : STA.W $2116
    SEP #$20
    STX.W $4315
    LDX.W BG1Row_wrappedTilemapVRAMUpdateRightHalvesSrc : STX.W $4312
    LDA.B #$02 : STA.W $420B

  .BG2:
    LDA.W BG2Row_updateVRAMTilemapFlag : BEQ .return
    STZ.W BG2Row_updateVRAMTilemapFlag
    LDY.W BG2Row_unwrappedTilemapVRAMUpdateDest : STY.W $2116
    LDX.W #$1801 : STX.W $4310
    LDX.W #BG2RowUpdateTilemapTopHalves : STX.W $4312
    LDA.B #$7E : STA.W $4314
    LDX.W BG2Row_unwrappedTilemapVRAMUpdateSize : STX.W $4315
    LDA.B #$02 : STA.W $420B
    REP #$20
    TYA : ORA.W #$0020 : STA.W $2116
    SEP #$20
    STX.W $4315
    LDX.W #BG2RowUpdateTilemapBottomHalves : STX.W $4312
    LDA.B #$02 : STA.W $420B
    LDX.W BG2Row_wrappedTilemapVRAMUpdateLeftHalvesSrc : STX.W $4312
    LDX.W BG2Row_wrappedTilemapVRAMUpdateSize : BEQ .return
    STX.W $4315
    LDY.W BG2Row_wrappedTilemapVRAMUpdateDest : STY.W $2116
    LDA.B #$02 : STA.W $420B
    SEP #$02 : BEQ .continue ; reset zero flag, then test if zero >.<

  .crash:
    BRA .crash ; dead code

  .continue:
    REP #$20
    TYA : ORA.W #$0020 : STA.W $2116
    SEP #$20
    STX.W $4315
    LDX.W BG2Row_wrappedTilemapVRAMUpdateRighttHalvesSrc : STX.W $4312
    LDA.B #$02 : STA.W $420B

  .return:
    RTS


;;; $8EA2: Handle VRAM read table ;;;
HandleVRAMReadTable:
; Buggy? This routine stores a 1-byte zero-terminator but checks for a 2-byte zero terminator as the loop condition.
; I think this only works because only one entry is ever set up in any given frame
    PHP
    SEP #$30
    LDX.W VRAMReadStack : BNE .readTable
    PLP
    RTL

  .readTable:
    STZ.W VRAMRead.src,X
    LDX.B #$00
    LDA.B #$80 : STA.W $2115

  .loop:
    REP #$20
    LDA.W VRAMRead.src,X : BEQ .done
    STA.W $2116
    LDA.W $2139
    LDA.W VRAMRead.control,X : STA.W $4310
    LDA.W VRAMRead.dest,X : STA.W $4312
    LDA.W VRAMRead.dest+1,X : STA.W $4313
    LDA.W VRAMRead.size,X : STA.W $4315
    STZ.W $4317 : STZ.W $4319
    SEP #$20
    LDA.B #$02 : STA.W $420B
    TXA : CLC : ADC.B #$09 : TAX
    BRA .loop

  .done:
    STZ.W VRAMReadStack
    PLP
    RTL


;;; $8EF4: Check if music is queued ;;;
CheckIfMusicIsQueued:
;; Returns:
;;     Carry: set if there's a non-zero music queue timer, clear otherwise
    PHP
    REP #$30
    PHX
    LDX.W #$000E

  .loop:
    LDA.W APU_MusicQueueTimers,X : BNE .nonZeroTimer
    DEX #2 : BPL .loop
    PLX : PLP
    CLC
    RTL

  .nonZeroTimer:
    PLX : PLP
    SEC
    RTL


;;; $8F0C: Handle music queue ;;;
HandleMusicQueue:
; Decrement music timer
; If APU_MusicTimer > 0:
;     Return
; If APU_MusicTimer = 0:
;     Process APU_MusicEntry
;     Handle new music track / music data
;     Erase first entry from queue (advancing the start index)
;     Sound handler downtime = 8
;     If music data:
;         Return
; If APU_MusicQueueStartIndex = APU_MusicQueueNextIndex (queue is empty):
;     Music timer = 0 (try again next loop)
; Else:
;     Load music entry and music timer from first entry in queue

; Note that APU_CurrentMusicTrack is never read anywhere, MusicTrackIndex is used instead
    PHP
    REP #$20
    DEC.W APU_MusicTimer : BMI .negative
    BEQ .positive
    PLP
    RTL

  .positive:
    LDA.W APU_MusicEntry : BMI .musicData
    SEP #$20
    AND.B #$7F : STA.W MusicTrackIndex
    STZ.W MusicTrackIndex+1
    STA.W $2140 : STA.W APU_CurrentMusicTrack
    REP #$20
    LDA.W #$0008 : STA.W APU_SoundHandlerDowntime
    LDX.W APU_MusicQueueStartIndex
    STZ.W APU_MusicQueueEntries,X : STZ.W APU_MusicQueueTimers,X
    INX #2
    TXA : AND.W #$000E : STA.W APU_MusicQueueStartIndex

  .negative:
    LDX.W APU_MusicQueueStartIndex : CPX.W APU_MusicQueueNextIndex : BEQ .clearTimer
    LDA.W APU_MusicQueueEntries,X : STA.W APU_MusicEntry
    LDA.W APU_MusicQueueTimers,X : STA.W APU_MusicTimer
    PLP
    RTL

  .clearTimer:
    STZ.W APU_MusicTimer
    PLP
    RTL

  .musicData:
    AND.W #$00FF : STA.W MusicDataIndex
    TAX
    SEP #$20
    LDA.B #$FF : STA.W APU_CurrentMusicTrack
    REP #$20
    LDA.L Music_Pointers,X : STA.B DP_Temp00
    LDA.L Music_Pointers+1,X : STA.B DP_Temp01
    JSL UploadToAPU_long
    SEP #$20
    STZ.W APU_CurrentMusicTrack
    REP #$20
    LDX.W APU_MusicQueueStartIndex
    STZ.W APU_MusicQueueEntries,X : STZ.W APU_MusicQueueTimers,X
    INX #2
    TXA : AND.W #$000E : STA.W APU_MusicQueueStartIndex
    LDA.W #$0008 : STA.W APU_SoundHandlerDowntime
    PLP
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $8FA3: Unused. Queue music data or music track, 16 frame delay, can overwrite old entries, doesn't check for demo ;;;
UNUSED_QueueMusicDataOrTrack_808FA3:
;; Parameter:
;;     A: Music data / music track

; If [A] is negative, the low byte is a music data index, otherwise [A] is a music track
    PHP
    REP #$30
    PHX : PHY
    LDX.W APU_MusicQueueNextIndex
    STA.W APU_MusicQueueEntries,X
    LDA.W #$0010 : STA.W APU_MusicQueueTimers,X
    INX #2
    TXA : AND.W #$000E : STA.W APU_MusicQueueNextIndex
    PLY : PLX : PLP
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8FC1: Queue music data or music track, 8 frame delay, cannot set last queue entry ;;;
QueueMusicDataOrTrack_8FrameDelay:
;; Parameter:
;;     A: Music data / music track

; If [A] is negative, the low byte is a music data index, otherwise [A] is a music track
    PHP
    REP #$30
    PHX : PHY
    LDX.W GameState : CPX.W #$0028 : BCS .return
    PHA
    LDA.W APU_MusicQueueNextIndex : INC #2 : AND.W #$000E : TAX
    PLA
    CPX.W APU_MusicQueueStartIndex : BEQ .return
    LDX.W APU_MusicQueueNextIndex
    STA.W APU_MusicQueueEntries,X
    LDA.W #$0008 : STA.W APU_MusicQueueTimers,X
    INX #2
    TXA : AND.W #$000E : STA.W APU_MusicQueueNextIndex

  .return:
    PLY : PLX : PLP
    RTL


;;; $8FF7: Queue music data or music track, max([Y], 8) frame delay, can overwrite old entries ;;;
QueueMusicDataOrTrack_YFrameDelay:
;; Parameter:
;;     A: Music data / music track
;;     Y: Delay

; Called by:
;     $82:DCE0 with A = 5, Y = 14: Game state 14h (death sequence, black out surroundings)
;     $82:E0D5 with Y = 6: Load new music track if changed
;     $82:E118 with A = 0: Play room music track after [A] frames
;     $8B:A613 with A = 5, Y = 14: Cinematic function - intro - queue "the galaxy is at peace" music
;     $8B:A66F with A = 5, Y = 14: Cinematic function - intro - set up intro text page 1
;     $8B:BCA0 with A = 5, Y = 14: Cinematic function - fly to Ceres - initial
;     $8B:C11B with A = 7, Y = 14: Cinematic function - Ceres goes boom - initial
;     $8B:D480 with A = 5, Y = 14: Cinematic function - ending - setup
;     $8B:DB9E with A = 5, Y = 14: Cinematic function - ending - space view - change music
;     $92:ED24 with A = 1, Y = 14: Play Samus fanfare

; If [A] is negative, the low byte is a music data index, otherwise [A] is a music track
    PHP
    REP #$30
    PHX
    LDX.W GameState : CPX.W #$0028 : BCS .return
    LDX.W APU_MusicQueueNextIndex : STA.W APU_MusicQueueEntries,X
    TYA : CMP.W #$0008 : BCS .setTimer
    LDA.W #$0008

  .setTimer:
    STA.W APU_MusicQueueTimers,X
    INX #2
    TXA : AND.W #$000E : STA.W APU_MusicQueueNextIndex

  .return:
    PLX : PLP
    RTL


;;; $9021: Queue sound, sound library 1, max queued sounds allowed = 15 ;;;
QueueSound:
;; Parameter:
;;     A: Sound to queue
    PHX : PHY : PHP
    SEP #$30
    XBA
    LDA.B #$0F
    BRA QueueSound_Lib1


;;; $902B: Queue sound, sound library 1, max queued sounds allowed = 9 ;;;
QueueSound_Lib1_Max9:
;; Parameter:
;;     A: Sound to queue
    PHX : PHY : PHP
    SEP #$30
    XBA
    LDA.B #$09
    BRA QueueSound_Lib1


;;; $9035: Queue sound, sound library 1, max queued sounds allowed = 3 ;;;
QueueSound_Lib1_Max3:
;; Parameter:
;;     A: Sound to queue
    PHX : PHY : PHP
    SEP #$30
    XBA
    LDA.B #$03
    BRA QueueSound_Lib1


;;; $903F: Queue sound, sound library 1, max queued sounds allowed = 1 ;;;
QueueSound_Lib1_Max1:
;; Parameter:
;;     A: Sound to queue
    PHX : PHY : PHP
    SEP #$30
    XBA
    LDA.B #$01
    BRA QueueSound_Lib1


;;; $9049: Queue sound, sound library 1, max queued sounds allowed = 6 ;;;
QueueSound_Lib1_Max6:
;; Parameter:
;;     A: Sound to queue
    PHX : PHY : PHP
    SEP #$30
    XBA
    LDA.B #$06


;;; $9051: Queue sound, sound library 1 ;;;
QueueSound_Lib1:
;; Parameter:
;;     A low: Max queued sounds allowed
;;     A high: Sound to queue

; Checks whether sound can be queued; returns if queue threshold is exceeded, sounds are disabled, in a demo or a power bomb is exploding.
; If it can be queued and the following slot is empty, queues the sound, sets the 'next index' and returns.
; If the following slot is not empty, the sound with the lower ID gets priority and the 'next index' is unchanged.
    STA.W APU_MaxQueuedSoundsAllowedLib1
    LDA.W APU_SoundQueueNextIndexLib1 : SEC : SBC.W APU_SoundQueueStartIndexLib1
    AND.B #$0F : CMP.W APU_MaxQueuedSoundsAllowedLib1 : BCS .return
    XBA
    REP #$30
    LDX.W DisableSounds : BNE .return
    LDX.W GameState : CPX.W #$0028 : BCS .return
    LDX.W PowerBombExplosionStatus : BMI .return
    SEP #$30
    LDY.W APU_SoundQueueNextIndexLib1 : TYX
    INX : CPX.B #$10 : BCC .queueSound
    LDX.B #$00

  .queueSound:
    CPX.W APU_SoundQueueStartIndexLib1 : BEQ .queueFull
    STA.W APU_SoundQueueLib1,Y
    STX.W APU_SoundQueueNextIndexLib1
    STZ.W APU_SoundQueueLib1,X

  .return:
    PLP : PLY : PLX
    RTL

  .queueFull:
    JSR NOPRTS_8091A7
    CMP.W APU_SoundQueueLib1,Y : BCS .return
    STA.W APU_SoundQueueLib1,Y
    BRA .return


;;; $90A3: Queue sound, sound library 2, max queued sounds allowed = 15 ;;;
QueueSound_Lib2_Max15:
;; Parameter:
;;     A: Sound to queue
    PHX : PHY : PHP
    SEP #$30
    XBA
    LDA.B #$0F
    BRA QueueSound_Lib2


;;; $90AD: Queue sound, sound library 2, max queued sounds allowed = 9 ;;;
QueueSound_Lib2_Max9:
;; Parameter:
;;     A: Sound to queue
    PHX : PHY : PHP
    SEP #$30
    XBA
    LDA.B #$09
    BRA QueueSound_Lib2


;;; $90B7: Queue sound, sound library 2, max queued sounds allowed = 3 ;;;
QueueSound_Lib2_Max3:
;; Parameter:
;;     A: Sound to queue
    PHX : PHY : PHP
    SEP #$30
    XBA
    LDA.B #$03
    BRA QueueSound_Lib2


;;; $90C1: Queue sound, sound library 2, max queued sounds allowed = 1 ;;;
QueueSound_Lib2_Max1:
;; Parameter:
;;     A: Sound to queue
    PHX : PHY : PHP
    SEP #$30
    XBA
    LDA.B #$01
    BRA QueueSound_Lib2


;;; $90CB: Queue sound, sound library 2, max queued sounds allowed = 6 ;;;
QueueSound_Lib2_Max6:
;; Parameter:
;;     A: Sound to queue
    PHX : PHY : PHP
    SEP #$30
    XBA
    LDA.B #$06


;;; $90D3: Queue sound, sound library 2 ;;;
QueueSound_Lib2:
;; Parameter:
;;     A low: Max queued sounds allowed
;;     A high: Sound to queue

; Checks whether sound can be queued; returns if queue threshold is exceeded, sounds are disabled, in a demo or a power bomb is exploding.
; If it can be queued and the following slot is empty, queues the sound, sets the 'next index' and returns.
; If the following slot is not empty, the sound with the lower ID gets priority and the 'next index' is unchanged.
    STA.W APU_MaxQueuedSoundsAllowedLib2
    LDA.W APU_SoundQueueNextIndexLib2 : SEC : SBC.W APU_SoundQueueStartIndexLib2
    AND.B #$0F : CMP.W APU_MaxQueuedSoundsAllowedLib2 : BCS .return
    XBA
    REP #$30
    LDX.W DisableSounds : BNE .return
    LDX.W GameState : CPX.W #$0028 : BCS .return
    LDX.W PowerBombExplosionStatus : BMI .return
    SEP #$30
    LDY.W APU_SoundQueueNextIndexLib2 : TYX
    INX : CPX.B #$10 : BCC .queueSound
    LDX.B #$00

  .queueSound:
    CPX.W APU_SoundQueueStartIndexLib2 : BEQ .queueFull
    STA.W APU_SoundQueueLib2,Y
    STX.W APU_SoundQueueNextIndexLib2
    STZ.W APU_SoundQueueLib2,X

  .return:
    PLP : PLY : PLX
    RTL

  .queueFull:
    JSR NOPRTS_8091A7
    CMP.W APU_SoundQueueLib2,Y : BCS .return
    STA.W APU_SoundQueueLib2,Y
    BRA .return


;;; $9125: Queue sound, sound library 3, max queued sounds allowed = 15 ;;;
QueueSound_Lib3_Max15:
;; Parameter:
;;     A: Sound to queue
    PHX : PHY : PHP
    SEP #$30
    XBA
    LDA.B #$0F
    BRA QueueSound_Lib3


;;; $912F: Queue sound, sound library 3, max queued sounds allowed = 9 ;;;
QueueSound_Lib3_Max9:
;; Parameter:
;;     A: Sound to queue
    PHX : PHY : PHP
    SEP #$30
    XBA
    LDA.B #$09
    BRA QueueSound_Lib3


;;; $9139: Queue sound, sound library 3, max queued sounds allowed = 3 ;;;
QueueSound_Lib3_Max3:
;; Parameter:
;;     A: Sound to queue
    PHX : PHY : PHP
    SEP #$30
    XBA
    LDA.B #$03
    BRA QueueSound_Lib3


;;; $9143: Queue sound, sound library 3, max queued sounds allowed = 1 ;;;
QueueSound_Lib3_Max1:
;; Parameter:
;;     A: Sound to queue
    PHX : PHY : PHP
    SEP #$30
    XBA
    LDA.B #$01
    BRA QueueSound_Lib3


;;; $914D: Queue sound, sound library 3, max queued sounds allowed = 6 ;;;
QueueSound_Lib3_Max6:
;; Parameter:
;;     A: Sound to queue
    PHX : PHY : PHP
    SEP #$30
    XBA
    LDA.B #$06


;;; $9155: Queue sound, sound library 3 ;;;
QueueSound_Lib3:
;; Parameter:
;;     A low: Max queued sounds allowed
;;     A high: Sound to queue

; Checks whether sound can be queued; returns if queue threshold is exceeded, sounds are disabled, in a demo or a power bomb is exploding.
; If it can be queued and the following slot is empty, queues the sound, sets the 'next index' and returns.
; If the following slot is not empty, the sound with the lower ID gets priority and the 'next index' is unchanged.
    STA.W APU_MaxQueuedSoundsAllowedLib3
    LDA.W APU_SoundQueueNextIndexLib3 : SEC : SBC.W APU_SoundQueueStartIndexLib3
    AND.B #$0F : CMP.W APU_MaxQueuedSoundsAllowedLib3 : BCS .return
    XBA
    REP #$30
    LDX.W DisableSounds : BNE .return
    LDX.W GameState : CPX.W #$0028 : BCS .return
    LDX.W PowerBombExplosionStatus : BMI .return
    SEP #$30
    LDY.W APU_SoundQueueNextIndexLib3 : TYX
    INX : CPX.B #$10 : BCC .queueSound
    LDX.B #$00

  .queueSound:
    CPX.W APU_SoundQueueStartIndexLib3 : BEQ .queueFull
    STA.W APU_SoundQueueLib3,Y
    STX.W APU_SoundQueueNextIndexLib3
    STZ.W APU_SoundQueueLib3,X

  .return:
    PLP : PLY : PLX
    RTL

  .queueFull:
    JSR NOPRTS_8091A7
    CMP.W APU_SoundQueueLib3,Y : BCS .return
    STA.W APU_SoundQueueLib3,Y
    BRA .return


;;; $91A7: NOP : RTS ;;;
NOPRTS_8091A7:
; Called by:
;     $9051: Queue sound, sound library 1
;     $90D3: Queue sound, sound library 2
;     $9155: Queue sound, sound library 3
    NOP
    RTS


;;; $91A9: Set up a (H)DMA transfer ;;;
SetupHDMATransfer:
;; Parameters:
;;     [[S] + 1] + 1: DMA channel
;;     [[S] + 1] + 2: DMA options
;;     [[S] + 1] + 3: DMA target
;;     [[S] + 1] + 4: Source address (24-bit)
;;     [[S] + 1] + 7: Size (in bytes)
    PHP : PHB
    REP #$30
    LDA.B $04,S : PHA : PLB : PLB
    LDA.B $03,S : TAY
    LDA.W $0001,Y : AND.W #$00FF : TAX
    LDA.L .table,X : AND.W #$00FF : TAX
    LDA.W $0002,Y : STA.W $4300,X
    LDA.W $0004,Y : STA.W $4302,X
    LDA.W $0006,Y : STA.W $4304,X
    LDA.W $0007,Y : STA.W $4305,X
    TYA : CLC : ADC.W #$0008 : STA.B $03,S
    PLB : PLP
    RTL

  .table:
    db $00,$10,$20,$30,$40,$50,$60,$70


;;; $91EE: Update IO registers ;;;
Update_IO_Registers:
    LDX.B DP_IRQAutoJoy : STX.W $4200
    LDX.B DP_Brightness : STX.W $2100
    LDX.B DP_SpriteSizeAddr : STX.W $2101
    LDX.B DP_BGModeSize : STX.W $2105
    LDX.B DP_Mosaic : STX.W $2106
    LDX.B DP_BG1TilemapAddrSize : STX.W $2107
    LDX.B DP_BG2TilemapAddrSize : STX.W $2108
    LDX.B DP_BG3TilemapAddrSize : STX.W $2109
    LDX.B DP_BG4TilemapAddrSize : STX.W $210A
    LDX.B DP_BGTilesAddr : STX.W $210B
    LDX.B DP_BGTilesAddr+1 : STX.W $210C
    LDX.B DP_Mode7Settings : STX.W $211A
    LDX.B DP_WindowMaskBG12 : STX.W $2123
    LDX.B DP_WindowMaskBG34 : STX.W $2124
    LDX.B DP_WindowMaskSprite : STX.W $2125
    LDX.B DP_Window1Left : STX.W $2126
    LDX.B DP_Window1Right : STX.W $2127
    LDX.B DP_Window2Left : STX.W $2128
    LDX.B DP_Window2Right : STX.W $2129
    LDX.B DP_Window12BGMaskLogic : STX.W $212A
    LDX.B DP_Window12SpriteMaskLogic : STX.W $212B
    LDX.B DP_MainScreenLayers : STX.B DP_GameplayMainScreenLayers : STX.W $212C
    LDX.B DP_WindowAreaMainScreen : STX.W $212E
    LDX.B DP_SubScreenLayers : STX.W $212D
    LDX.B DP_WindowAreaSubScreen : STX.W $212F
    LDX.B DP_ColorMathA : STX.W $2130
    LDX.B DP_ColorMathB : STX.W $2131
    LDX.B DP_NextGameplayColorMathA : STX.B DP_GameplayColorMathA
    LDX.B DP_NextGameplayColorMathB : STX.B DP_GameplayColorMathB
    LDX.B DP_ColorMathSubScreenBackdropColor0 : STX.W $2132
    LDX.B DP_ColorMathSubScreenBackdropColor1 : STX.W $2132
    LDX.B DP_ColorMathSubScreenBackdropColor2 : STX.W $2132
    LDX.B DP_DisplayResolution : STX.W $2133
    LDX.B DP_BG1XScroll : STX.W $210D
    LDX.B DP_BG1XScroll+1 : STX.W $210D
    LDX.B DP_BG1YScroll : STX.W $210E
    LDX.B DP_BG1YScroll+1 : STX.W $210E
    LDX.B DP_BG2XScroll : STX.W $210F
    LDX.B DP_BG2XScroll+1 : STX.W $210F
    LDX.B DP_BG2YScroll : STX.W $2110
    LDX.B DP_BG2YScroll+1 : STX.W $2110
    LDX.B DP_BG3XScroll : STX.W $2111
    LDX.B DP_BG3XScroll+1 : STX.W $2111
    LDX.B DP_BG3YScroll : STX.W $2112
    LDX.B DP_BG3YScroll+1 : STX.W $2112
    LDX.B DP_BG4XScroll : STX.W $2113
    LDX.B DP_BG4XScroll+1 : STX.W $2113
    LDX.B DP_BG4YScroll : STX.W $2114
    LDX.B DP_BG4YScroll+1 : STX.W $2114
    LDX.B DP_FakeBGModeSize : STX.W $07EC
    LDA.B DP_BGModeSize : AND.W #$0007 : CMP.W #$0007 : BEQ .mode7
    LDA.B DP_FakeBGModeSize : AND.W #$0007 : CMP.W #$0007 : BEQ .mode7
    RTS

  .mode7:
    LDX.B DP_Mode7TransMatrixA : STX.W $211B
    LDX.B DP_Mode7TransMatrixA+1 : STX.W $211B
    LDX.B DP_Mode7TransMatrixB : STX.W $211C
    LDX.B DP_Mode7TransMatrixB+1 : STX.W $211C
    LDX.B DP_Mode7TransMatrixC : STX.W $211D
    LDX.B DP_Mode7TransMatrixC+1 : STX.W $211D
    LDX.B DP_Mode7TransMatrixD : STX.W $211E
    LDX.B DP_Mode7TransMatrixD+1 : STX.W $211E
    LDX.B DP_Mode7TransOriginX : STX.W $211F
    LDX.B DP_Mode7TransOriginX+1 : STX.W $211F
    LDX.B DP_Mode7TransOriginY : STX.W $2120
    LDX.B DP_Mode7TransOriginY+1 : STX.W $2120
    RTS


;;; $933A: Update OAM & CGRAM ;;;
UpdateOAM_CGRAM:
    LDA.W #$0400 : STA.W $4300
    LDA.W #OAMLow : STA.W $4302
    LDX.B #$00 : STX.W $4304
    LDA.W #$0220 : STA.W $4305 : STZ.W $2102
    LDA.W #$2200 : STA.W $4310
    LDA.W #Palettes : STA.W $4312
    LDX.B #Palettes>>16 : STX.W $4314
    LDA.W #$0200 : STA.W $4315
    LDX.B #$00 : STX.W $2121
    LDX.B #$03 : STX.W $420B
    RTS


;;; $9376: Transfer Samus tiles to VRAM ;;;
TransferSamusTilesToVRAM:
; Samus tiles definition format:
;     aaaaaa nnnn NNNN
; where:
;     a: Source address
;     n: Part 1 size, n = 0 means 10000h bytes are transferred
;     N: Part 2 size, N = 0 means no bytes are transferred
    PHB
    LDX.B #$92 : PHX : PLB
    LDX.B #$02
    LDY.B #$80 : STY.W $2115
    LDY.W SamusTiles_TopHalfFlag : BEQ .bottom
    LDY.B #$02
    LDA.W SamusTiles_TopHalfTilesDef : STA.B DP_SamusTilesDefinition
    LDA.W #$6000 : STA.W $2116
    LDA.W #$1801 : STA.W $4310
    LDA.B (DP_SamusTilesDefinition) : STA.W $4312 : STA.B DP_Temp14
    LDA.B (DP_SamusTilesDefinition),Y : STA.W $4314
    INY
    LDA.B (DP_SamusTilesDefinition),Y : STA.W $4315
    CLC : ADC.B DP_Temp14 : STA.B DP_Temp14
    INY #2
    STX.W $420B
    LDA.W #$6100 : STA.W $2116
    LDA.B DP_Temp14 : STA.W $4312
    LDA.B (DP_SamusTilesDefinition),Y : BEQ .bottom
    STA.W $4315
    STX.W $420B

  .bottom:
    LDY.W SamusTiles_BottomHalfFlag : BEQ .return
    LDY.B #$02
    LDA.W SamusTiles_BottomHalfTilesDef : STA.B DP_SamusTilesDefinition
    LDA.W #$6080 : STA.W $2116
    LDA.W #$1801 : STA.W $4310
    LDA.B (DP_SamusTilesDefinition) : STA.W $4312 : STA.B DP_Temp14
    LDA.B (DP_SamusTilesDefinition),Y : STA.W $4314
    INY
    LDA.B (DP_SamusTilesDefinition),Y : STA.W $4315
    CLC : ADC.B DP_Temp14 : STA.B DP_Temp14
    INY #2
    STX.W $420B
    LDA.W #$6180 : STA.W $2116
    LDA.B DP_Temp14 : STA.W $4312
    LDA.B (DP_SamusTilesDefinition),Y : BEQ .return
    STA.W $4315
    STX.W $420B

  .return:
    PLB
    RTS


;;; $9416: Process animated tiles object VRAM transfers ;;;
ProcessAnimatedTilesObjectVRAMTransfers:
    PHB
    LDX.B #$87 : PHX : PLB
    LDA.W AnimatedTilesObject_Enable : BPL .return
    LDX.B #$0A

  .loop:
    LDA.W AnimatedTilesObject_IDs,X : BEQ .next
    LDA.W AnimatedTilesObject_SrcAddr,X : BEQ .next
    STA.W $4302
    LDY.B #$87 : STY.W $4304
    LDA.W #$1801 : STA.W $4300
    LDA.W AnimatedTilesObject_Sizes,X : STA.W $4305
    LDA.W AnimatedTilesObject_VRAMAddr,X : STA.W $2116
    LDY.B #$80 : STY.W $2115
    LDY.B #$01 : STY.W $420B
    STZ.W AnimatedTilesObject_SrcAddr,X

  .next:
    DEX #2 : BPL .loop

  .return:
    PLB
    RTS


;;; $9459: Read controller input. Also a debug branch ;;;
ReadControllerInput:
; This is executed at the end of NMI because auto-joypad read is only guaranteed to be executed at some point in the middle of the first scanline of v-blank,
; and then we need to wait ~3 scanlines for the joypad to finish reading
    PHP
    SEP #$20

  .wait:
    LDA.W $4212 : AND.B #$01 : BNE .wait
    REP #$20
    LDA.W $4218 : STA.B DP_Controller1Input
    EOR.B DP_Controller1Prev : AND.B DP_Controller1Input : STA.B DP_Controller1New : STA.B DP_FakeController1New
    LDA.B DP_Controller1Input : BEQ .unheld
    CMP.B DP_Controller1Prev : BNE .unheld
    DEC.B DP_Controller1AutoPressTimer : BNE .heldEnd
    LDA.B DP_Controller1Input : STA.B DP_FakeController1New
    LDA.B DP_AutoPressSubsequentDelay : STA.B DP_Controller1AutoPressTimer
    BRA .heldEnd

  .unheld:
    LDA.B DP_AutoPressInitialDelay : STA.B DP_Controller1AutoPressTimer

  .heldEnd:
    LDA.B DP_Controller1Input : STA.B DP_Controller1Prev
    LDA.W Debug_Enable : BNE .debug
    PLP
    RTL

  .debug:
    LDA.W $421A : STA.B DP_Controller2Input
    EOR.B DP_Controller2Prev : AND.B DP_Controller2Input : STA.B DP_Controller2New : STA.B DP_FakeController2New
    LDA.B DP_Controller2Input : BEQ .unheld2
    CMP.B DP_Controller2Prev : BNE .unheld2
    DEC.B DP_Controller2AutoPressTimer : BNE .held2End
    LDA.B DP_Controller2Input : STA.B DP_FakeController2New
    LDA.B DP_AutoPressSubsequentDelay : STA.B DP_Controller2AutoPressTimer
    BRA .held2End

  .unheld2:
    LDA.B DP_AutoPressInitialDelay : STA.B DP_Controller2AutoPressTimer

  .held2End:
    LDA.B DP_Controller2Input : STA.B DP_Controller2Prev
    LDA.W APU_UploadingFlag : BNE .checkDebug
    LDA.B DP_Controller1Input : CMP.W #$3030 : BNE .checkDebug
    STZ.W DisableSounds
    JMP SoftReset

  .checkDebug:
    LDA.W Debug_Enable : BNE .debugEnabled
    STZ.W Debug_InputL : STZ.W Debug_InputR
    LDA.W #$FFEF : TRB.B DP_Controller2Input : TRB.B DP_Controller2New
    PLP
    RTL

  .debugEnabled:
    STZ.W Debug_InputL : STZ.W Debug_InputR
    BIT.W Debug_Options : BVC .debugInputEnabled
    JMP .return

  .debugInputEnabled:
    LDA.B DP_Controller1Input : AND.W #$2020 : CMP.W #$2020 : BNE .checkSelectR
    LDA.B DP_Controller1New : STA.W Debug_InputL
    STZ.B DP_Controller1Input : STZ.B DP_Controller1New

  .checkSelectR:
    LDA.B DP_Controller1Input : AND.W #$2010 : CMP.W #$2010 : BNE .checkToggleHUD
    LDA.B DP_Controller1New : STA.W Debug_InputR
    LDA.W #$E0F0 ; >_<
    STZ.B DP_Controller1Input : STZ.B DP_Controller1New

  .checkToggleHUD:
    LDA.W Debug_InputR : BIT.W #$0080 : BEQ .checkAmmoSwap
    LDA.B DP_IRQAutoJoy : EOR.W #$0030 : STA.B DP_IRQAutoJoy

  .checkAmmoSwap:
    LDA.W Debug_InputR : BIT.W #$8000 : BEQ .swapEnd
    LDA.W Debug_Options : EOR.W #$8000 : STA.W Debug_Options : BPL .swapAmmo
    LDA.W Missiles : STA.W Debug_MissileSwap
    LDA.W SuperMissiles : STA.W Debug_SuperMissileSwap
    LDA.W PowerBombs : STA.W Debug_PowerBombSwap
    STZ.W Missiles : STZ.W SuperMissiles : STZ.W PowerBombs
    BRA .swapEnd

  .swapAmmo:
    LDA.W Debug_MissileSwap : STA.W Missiles
    LDA.W Debug_SuperMissileSwap : STA.W SuperMissiles
    LDA.W Debug_PowerBombSwap : STA.W PowerBombs

  .swapEnd:
    LDA.W Debug_InputR : BIT.W #$0040 : BEQ .return
    LDA.W Debug_Options : EOR.W #$2000 : STA.W Debug_Options

  .return:
    PLP
    RTL


;;; $9583: NMI ;;;
NMI:
    REP #$30
    JML .bank80

  .bank80:
    PHB : PHD : PHA : PHX : PHY
    PHK : PLB
    LDA.W #$0000 : TCD
    SEP #$10
    LDX.W $4210
    LDX.W NMI_Request : BEQ .lag
    JSR UpdateOAM_CGRAM
    JSR TransferSamusTilesToVRAM
    JSR ProcessAnimatedTilesObjectVRAMTransfers
    JSR Update_IO_Registers
    LDX.B #$00

  .handleHDMAQueue:
    LDA.W HDMAObject_ChannelBitflags,X : BEQ .next
    LDY.W HDMAObject_ChannelIndicesBanks,X
    LDA.W HDMAObject_TablePointers,X : STA.W $4302,Y

  .next:
    INX #2 : CPX.B #$0C : BNE .handleHDMAQueue
    LDX.B DP_BGModeSize : CPX.B #$07 : BEQ .mode7Enabled
    LDX.B DP_FakeBGModeSize : CPX.B #$07 : BNE .mode7Disabled

  .mode7Enabled:
    JSL HandleMode7Transfers

  .mode7Disabled:
    JSL HandleVRAMWriteTable_ScrollingDMAs
    JSL HandleVRAMReadTable
    SEP #$10 : REP #$20
    LDX.B DP_HDMAEnable : STX.W $420C
    JSL ReadControllerInput
    LDX.B #$00 : STX.W NMI_Request : STX.W NMI_LagCounter
    LDX.W NMI_8bitFrameCounter : INX : STX.W NMI_8bitFrameCounter
    INC.W NMI_FrameCounter

  .return:
    REP #$30
    INC.W NMI_Counter
    PLY : PLX : PLA : PLD : PLB
    RTI

  .lag:
    LDX.W NMI_LagCounter : INX : STX.W NMI_LagCounter
    LDX.W NMI_LagCounter : CPX.W NMI_MaximumLag : BCC .return
    STX.W NMI_MaximumLag
    BRA .return


;;; $9616: Interrupt command pointers ;;;
InterruptCommandPointers:
    dw Interrupt_Cmd0
    dw Interrupt_Cmd2_DisableHVCounterInterrupts
    dw Interrupt_Cmd4_MainGameplay_BeginHUDDrawing
    dw Interrupt_Cmd6_MainGameplay_EndHUDDrawing
    dw Interrupt_Cmd8_StartDoorTransition_BeginHUDDrawing
    dw Interrupt_CmdA_StartDoorTransition_EndHUDDrawing
    dw Interrupt_CmdC_Draygon_BeginHUDDrawing
    dw Interrupt_CmdE_Draygon_EndHUDDrawing
    dw Interrupt_Cmd10_VerticalDoorTransition_BeginHUDDrawing
    dw Interrupt_Cmd12_VerticalDoorTransition_EndHUDDrawing
    dw Interrupt_Cmd14_VerticalDoorTransition_EndDrawing
    dw Interrupt_Cmd16_HorizontalDoorTransition_BeginHUDDrawing
    dw Interrupt_Cmd18_HorizontalDoorTransition_EndHUDDrawing
    dw Interrupt_Cmd1A_HorizontalDoorTransition_EndDrawing


;;; $9632: Execute door transition VRAM update ;;;
ExecuteDoorTransitionVRAMUpdate:
; Called by:
;     $9771: Interrupt command 12h - vertical door transition - end HUD drawing
;     $980A: Interrupt command 1Ah - horizontal door transition - end drawing
    SEP #$20
    LDA.B #$80 : STA.W $2100
    LDX.W DoorTransitionVRAM_Dest : STX.W $2116
    LDX.W #$1801 : STX.W $4310
    LDX.W DoorTransitionVRAM_Src : STX.W $4312
    LDA.W DoorTransitionVRAM_Src+2 : STA.W $4314
    LDX.W DoorTransitionVRAM_Size : STX.W $4315
    LDA.B #$80 : STA.W $2115
    LDA.B #$02 : STA.W $420B
    LDA.B #$80 : TRB.W DoorTransitionVRAM_Flag+1
    LDA.B #$0F : STA.W $2100
    REP #$20
    RTS


;;; $966E: Interrupt command 0 - nothing ;;;
Interrupt_Cmd0:
;; Returns:
;;     A: Interrupt command
;;     X: IRQ h-counter target
;;     Y: IRQ v-counter target
    LDA.B DP_NextIRQCmd : BEQ .returnZero
    STZ.B DP_NextIRQCmd
    BRA .return

  .returnZero:
    LDA.W #$0000

  .return:
    LDX.W #$0000
    LDY.W #$0000
    RTS


;;; $9680: Interrupt command 2 - disable h/v-counter interrupts ;;;
Interrupt_Cmd2_DisableHVCounterInterrupts:
;; Returns:
;;     A: Interrupt command
;;     X: IRQ h-counter target
;;     Y: IRQ v-counter target
    LDA.W #$0030 : TRB.B DP_IRQAutoJoy
    LDA.W #$0000 : TAX : TAY
    RTS


;;; $968B: Interrupt command 4 - main gameplay - begin HUD drawing ;;;
Interrupt_Cmd4_MainGameplay_BeginHUDDrawing:
;; Returns:
;;     A: Interrupt command
;;     X: IRQ h-counter target
;;     Y: IRQ v-counter target
    SEP #$20
    LDA.B #$5A : STA.W $2109
    STZ.W $2130 : STZ.W $2131
    LDA.B #$04 : STA.W $212C
    REP #$20
    LDA.W #$0006
    LDY.W #$001F
    LDX.W #$0098
    RTS


;;; $96A9: Interrupt command 6 - main gameplay - end HUD drawing ;;;
Interrupt_Cmd6_MainGameplay_EndHUDDrawing:
;; Returns:
;;     A: Interrupt command
;;     X: IRQ h-counter target
;;     Y: IRQ v-counter target
    SEP #$20
    LDA.B DP_GameplayColorMathA : STA.W $2130
    LDA.B DP_GameplayColorMathB : STA.W $2131
    LDA.B DP_GameplayBG1TilemapAddrSize : STA.W $2109
    LDA.B DP_GameplayMainScreenLayers : STA.W $212C
    REP #$20
    LDA.B DP_NextIRQCmd : BEQ .setCommand4
    STZ.B DP_NextIRQCmd
    BRA .return

  .setCommand4:
    LDA.W #$0004

  .return:
    LDY.W #$0000
    LDX.W #$0098
    RTS


;;; $96D3: Interrupt command 8 - start of door transition - begin HUD drawing ;;;
Interrupt_Cmd8_StartDoorTransition_BeginHUDDrawing:
;; Returns:
;;     A: Interrupt command
;;     X: IRQ h-counter target
;;     Y: IRQ v-counter target
    SEP #$20
    LDA.B #$5A : STA.W $2109
    LDA.B #$04 : STA.W $212C
    STZ.W $2130 : STZ.W $2131
    REP #$20
    LDA.W #$000A
    LDY.W #$001F
    LDX.W #$0098
    RTS


;;; $96F1: Interrupt command Ah - start of door transition - end HUD drawing ;;;
Interrupt_CmdA_StartDoorTransition_EndHUDDrawing:
;; Returns:
;;     A: Interrupt command
;;     X: IRQ h-counter target
;;     Y: IRQ v-counter target
    SEP #$20
    LDA.W CREBitset : ORA.W PreviousCREBitset : BIT.B #$01 : BEQ .BG1Sprites
    LDA.B #$10
    BRA .sprites

  .BG1Sprites:
    LDA.B #$11

  .sprites:
    STA.W $212C
    REP #$20
    LDA.B DP_NextIRQCmd : BEQ .command8
    STZ.B DP_NextIRQCmd
    BRA .return

  .command8:
    LDA.W #$0008

  .return:
    LDY.W #$0000
    LDX.W #$0098
    RTS


;;; $971A: Interrupt command Ch - Draygon's room - begin HUD drawing ;;;
Interrupt_CmdC_Draygon_BeginHUDDrawing:
;; Returns:
;;     A: Interrupt command
;;     X: IRQ h-counter target
;;     Y: IRQ v-counter target

; Compared to interrupt command 4, this one doesn't set BG3 tilemap base address and size
    SEP #$20
    LDA.B #$04 : STA.W $212C
    STZ.W $2130 : STZ.W $2131
    REP #$20
    LDA.W #$000E
    LDY.W #$001F
    LDX.W #$0098
    RTS


;;; $9733: Interrupt command Eh - Draygon's room - end HUD drawing ;;;
Interrupt_CmdE_Draygon_EndHUDDrawing:
;; Returns:
;;     A: Interrupt command
;;     X: IRQ h-counter target
;;     Y: IRQ v-counter target

; Compared to interrupt command 6, this one doesn't set the main screen layers
    SEP #$20
    LDA.B DP_GameplayBG1TilemapAddrSize : STA.W $2109
    LDA.B DP_GameplayColorMathA : STA.W $2130
    LDA.B DP_GameplayColorMathB : STA.W $2131
    REP #$20
    LDA.B DP_NextIRQCmd : BEQ .commandC
    STZ.B DP_NextIRQCmd
    BRA .return

  .commandC:
    LDA.W #$000C

  .return:
    LDY.W #$0000
    LDX.W #$0098
    RTS


;;; $9758: Interrupt command 10h - vertical door transition - begin HUD drawing ;;;
Interrupt_Cmd10_VerticalDoorTransition_BeginHUDDrawing:
;; Returns:
;;     A: Interrupt command
;;     X: IRQ h-counter target
;;     Y: IRQ v-counter target
    SEP #$20
    LDA.B #$04 : STA.W $212C
    STZ.W $2130 : STZ.W $2131
    REP #$20
    LDA.W #$0012
    LDY.W #$001F
    LDX.W #$0098
    RTS


;;; $9771: Interrupt command 12h - vertical door transition - end HUD drawing ;;;
Interrupt_Cmd12_VerticalDoorTransition_EndHUDDrawing:
;; Returns:
;;     A: Interrupt command
;;     X: IRQ h-counter target
;;     Y: IRQ v-counter target

; The call to $80:AE4E does a non-trivial amount of work, not a particularly sensible thing to do in an interrupt
; Of note:
;     Multiplication registers are clobbered (by $A9DE/$AB78)
;     Samus position is modified (by $AE7E/$AEC2/$AF02/$AF89)
;     Layer 1 position is modified (by $AE4E)
;     BG1/2 scroll is modified (by $A37B)

; $82:E91C (set closing PLM instruction list if coloured doorcap is present) actually takes the precaution of disabling IRQ to do its multiplication,
; I think just about every other routine that runs during door transition is susceptible to seemingly random multiplication errors due to this interrupt command
    SEP #$20
    LDA.W CREBitset : ORA.W PreviousCREBitset : BIT.B #$01 : BEQ .BG1Sprites
    LDA.B #$10
    BRA .sprites

  .BG1Sprites:
    LDA.B #$11

  .sprites:
    STA.W $212C
    STZ.W $2130 : STZ.W $2131
    REP #$20
    LDX.W DoorTransitionVRAM_Flag : BPL .scrolling
    JSR ExecuteDoorTransitionVRAMUpdate

  .scrolling:
    LDA.W DoorTransitionFinishScrolling : BMI .return
    JSL DoorTransitionScrolling

  .return:
    LDA.W #$0014
    LDY.W #$00D8
    LDX.W #$0098
    RTS


;;; $97A9: Interrupt command 14h - vertical door transition - end drawing ;;;
Interrupt_Cmd14_VerticalDoorTransition_EndDrawing:
;; Returns:
;;     A: Interrupt command
;;     X: IRQ h-counter target
;;     Y: IRQ v-counter target
    LDA.B DP_NextIRQCmd : BEQ .command10
    STZ.B DP_NextIRQCmd
    BRA .return

  .command10:
    LDA.W #$0010

  .return:
    LDY.W #$0000
    LDX.W #$0098
    STZ.W NMI_Request : INC.W NMI_Request ; >.<
    RTS


;;; $97C1: Interrupt command 16h - horizontal door transition - begin HUD drawing ;;;
Interrupt_Cmd16_HorizontalDoorTransition_BeginHUDDrawing:
;; Returns:
;;     A: Interrupt command
;;     X: IRQ h-counter target
;;     Y: IRQ v-counter target
    SEP #$20
    LDA.B #$04 : STA.W $212C
    STZ.W $2130 : STZ.W $2131
    REP #$20
    LDA.W #$0018
    LDY.W #$001F
    LDX.W #$0098
    RTS


;;; $97DA: Interrupt command 18h - horizontal door transition - end HUD drawing ;;;
Interrupt_Cmd18_HorizontalDoorTransition_EndHUDDrawing:
;; Returns:
;;     A: Interrupt command
;;     X: IRQ h-counter target
;;     Y: IRQ v-counter target

; The call to $80:AE4E does a non-trivial amount of work, not a particularly sensible thing to do in an interrupt
; Of note:
;     Multiplication registers are clobbered (by $A9DE/$AB78)
;     Samus position is modified (by $AE7E/$AEC2/$AF02/$AF89)
;     Layer 1 position is modified (by $AE4E)
;     BG1/2 scroll is modified (by $A37B)

; $82:E91C (set closing PLM instruction list if coloured doorcap is present) actually takes the precaution of disabling IRQ to do its multiplication,
; I think just about every other routine that runs during door transition is susceptible to seemingly random multiplication errors due to this interrupt command
    SEP #$20
    LDA.W CREBitset : ORA.W PreviousCREBitset : BIT.B #$01 : BEQ .BG1Sprites
    LDA.B #$10
    BRA .sprites

  .BG1Sprites:
    LDA.B #$11

  .sprites:
    STA.W $212C
    STZ.W $2130 : STZ.W $2131
    REP #$20
    LDA.W DoorTransitionFinishScrolling : BMI .return
    JSL DoorTransitionScrolling

  .return:
    LDA.W #$001A
    LDY.W #$00A0
    LDX.W #$0098
    RTS


;;; $980A: Interrupt command 1Ah - horizontal door transition - end drawing ;;;
Interrupt_Cmd1A_HorizontalDoorTransition_EndDrawing:
;; Returns:
;;     A: Interrupt command
;;     X: IRQ h-counter target
;;     Y: IRQ v-counter target
    LDX.W DoorTransitionVRAM_Flag : BPL .nextCommand
    JSR ExecuteDoorTransitionVRAMUpdate

  .nextCommand:
    LDA.B DP_NextIRQCmd : BEQ .command16
    STZ.B DP_NextIRQCmd
    BRA .return

  .command16:
    LDA.W #$0016

  .return:
    LDY.W #$0000
    LDX.W #$0098
    STZ.W NMI_Request : INC.W NMI_Request ; >.<
    RTS


;;; $982A: Enable h/v-counter interrupts ;;;
EnableHVCounterInterrupts:
; Used to enable HUD drawing when starting/resuming gameplay
    PHP
    REP #$30
    LDA.W #$0000 : STA.W $4209
    LDA.W #$0098 : STA.W $4207
    LDA.W #$0030 : TSB.B DP_IRQAutoJoy
    PLP
    CLI
    RTL


;;; $9841: Enable h/v-counter interrupts now ;;;
EnableHVCounterInterruptsNow:
; Used to enable HUD drawing and door transition scrolling in door transition code
    PHP
    REP #$30
    LDA.W #$0000 : STA.W $4209
    LDA.W #$0098 : STA.W $4207
    LDA.W #$0030 : TSB.B DP_IRQAutoJoy
    SEP #$20
    LDA.B DP_IRQAutoJoy : STA.W $4200
    PLP
    CLI
    RTL


;;; $985F: Disable h/v-counter interrupts ;;;
DisableHVCounterInterrupts:
; Used to disable HUD drawing when ending gameplay
    PHP
    REP #$30
    LDA.W #$0030 : TRB.B DP_IRQAutoJoy
    PLP
    SEI
    RTL


;;; $986A: IRQ ;;;
IRQ:
; The first instruction of the routine called by the JSR (e.g. $966E) is executed 79 dots later than the IRQ h-counter target
; All of the (non-trivial) interrupt commands set IRQ h-counter = 98h, so that's 98h + 79 = 231 dots into the drawing period of the current scanline
; Also note that the IRQ timing is a bit loose. For the h-counter target 98h,
; I've seen the IRQ fire at all different points in the range 95h..A3h on different frames (according to Mesen-S event viewer)
    REP #$30
    JML .bank80

  .bank80:
    PHB : PHA : PHX : PHY
    PHK : PLB
    LDA.W $4211
    LDX.B DP_IRQCmd
    JSR.W (InterruptCommandPointers,X)
    STA.B DP_IRQCmd
    STY.W $4209
    STX.W $4207
    PLY : PLX : PLA : PLB
    RTI


;;; $988B: HUD tilemaps ;;;
Tilemap_HUD:
  .topRow:
; Never changed
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F
    dw $2C0F,$2C0F,$2C1D,$2C1D,$2C1D,$2C1D,$2C1D,$2C1C

  .rows123:
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F
    dw $2C0F,$2C0F,$2C12,$2C12,$2C23,$2C12,$2C12,$2C1E

    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F
    dw $2C0F,$2C0F,$2822,$2822,$2823,$2813,$2C14,$2C1E

    dw $2C0F,$2C0B,$2C0C,$2C0D,$2C32,$2C0F,$2C09,$2C0F
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F
    dw $2C0F,$2C0F,$2C12,$2C12,$A824,$2815,$2C16,$2C1E

  .autoReserve:
    dw $3C33,$3C46
    dw $3C47,$3C48
    dw $BC33,$BC46

  .emptyAutoReserve:
    dw $2C33,$2C46
    dw $2C47,$2C48
    dw $AC33,$AC46

  .missiles:
    dw $344B,$3449,$744B
    dw $344C,$344A,$744C

  .superMissiles:
    dw $3434,$7434
    dw $3435,$7435

  .powerBombs:
    dw $3436,$7436
    dw $3437,$7437

  .grapple:
    dw $3438,$7438
    dw $3439,$7439

  .xray:
    dw $343A,$743A
    dw $343B,$743B


;;; $99CF: Add missiles to HUD tilemap ;;;
AddMissilesToHUDTilemap:
; Called by:
;     $9A79: Initialise HUD
;     $84:89A9: Instruction - collect [[Y]] ammo missile tank
;     $91:E355: Debug. Handle debug mode select + L + B
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.L HUDTilemap_Row1Missiles : AND.W #$03FF : CMP.W #$000F : BNE .return
    LDA.W Tilemap_HUD_missiles : STA.L HUDTilemap_Row1Missiles
    LDA.W Tilemap_HUD_missiles+2 : STA.L HUDTilemap_Row1Missiles+2
    LDA.W Tilemap_HUD_missiles+4 : STA.L HUDTilemap_Row1Missiles+4
    LDA.W Tilemap_HUD_missiles+6 : STA.L HUDTilemap_Row2Missiles
    LDA.W Tilemap_HUD_missiles+8 : STA.L HUDTilemap_Row2Missiles+2
    LDA.W Tilemap_HUD_missiles+$A : STA.L HUDTilemap_Row2Missiles+4

  .return:
    PLB : PLP
    RTL


;;; $9A0E: Add super missiles to HUD tilemap ;;;
AddSuperMissilesToHUDTilemap:
; Called by:
;     $9A79: Initialise HUD
;     $84:89D2: Instruction - collect [[Y]] ammo super missile tank
;     $91:E355: Debug. Handle debug mode select + L + B
    PHP : PHX : PHY : PHB
    PHK : PLB
    REP #$30
    LDY.W #Tilemap_HUD_superMissiles
    LDX.W #$001C
    BRA Write2x2TileIconToHUDTilemap


;;; $9A1E: Add power bombs to HUD tilemap ;;;
AddPowerBombsToHUDTilemap:
; Called by:
;     $9A79: Initialise HUD
;     $84:89FB: Instruction - collect [[Y]] ammo power bomb tank
;     $91:E355: Debug. Handle debug mode select + L + B
    PHP : PHX : PHY : PHB
    PHK : PLB
    REP #$30
    LDY.W #Tilemap_HUD_powerBombs
    LDX.W #$0022
    BRA Write2x2TileIconToHUDTilemap


;;; $9A2E: Add grapple to HUD tilemap ;;;
AddGrappleToHUDTilemap:
; Called by:
;     $9A79: Initialise HUD
;     $84:891A: Instruction - pick up equipment [[Y]], add grapple to HUD and display grapple message box
;     $91:E355: Debug. Handle debug mode select + L + B
    PHP : PHX : PHY : PHB
    PHK : PLB
    REP #$30
    LDY.W #Tilemap_HUD_grapple
    LDX.W #$0028
    BRA Write2x2TileIconToHUDTilemap


;;; $9A3E: Add x-ray to HUD tilemap ;;;
AddXrayToHUDTilemap:
; Called by:
;     $9A79: Initialise HUD
;     $84:8941: Instruction - pick up equipment [[Y]], add x-ray to HUD and display x-ray message box
;     $91:E355: Debug. Handle debug mode select + L + B
    PHP : PHX : PHY : PHB
    PHK : PLB
    REP #$30
    LDY.W #Tilemap_HUD_xray
    LDX.W #$002E
; fallthrough to Write2x2TileIconToHUDTilemap


;;; $9A4C: Write 2x2 tile icon to HUD tilemap ;;;
Write2x2TileIconToHUDTilemap:
;; Parameters:
;;     X: HUD tilemap index
;;     Y: Source address

; Expects a pushed DB, Y, X and PSR
    LDA.L HUDTilemap,X : AND.W #$03FF : CMP.W #$000F : BNE .return
    LDA.W $0000,Y : STA.L HUDTilemap,X
    LDA.W $0002,Y : STA.L HUDTilemap+2,X
    LDA.W $0004,Y : STA.L HUDTilemap_Row2,X
    LDA.W $0006,Y : STA.L HUDTilemap_Row2+2,X

  .return:
    PLB : PLY : PLX : PLP
    RTL


;;; $9A79: Initialise HUD (HUD routine when game is loading) ;;;
InitialiseHUD_GameLoading:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W #$5800 : STA.W $2116
    LDA.W #$0080 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl Tilemap_HUD_topRow
    dw $0040
    SEP #$20
    LDA.B #$02 : STA.W $420B
    REP #$20
    LDX.W #$0000

  .loopRows123:
    LDA.W Tilemap_HUD_rows123,X : STA.L HUDTilemap,X
    INX #2 : CPX.W #$00C0 : BNE .loopRows123
    LDA.W EquippedItems : BIT.W #$8000 : BEQ .grapple
    JSL AddXrayToHUDTilemap

  .grapple:
    LDA.W EquippedItems : BIT.W #$4000 : BEQ .missiles
    JSL AddGrappleToHUDTilemap

  .missiles:
    LDA.W MaxMissiles : BEQ .superMissiles
    JSL AddMissilesToHUDTilemap

  .superMissiles:
    LDA.W MaxSuperMissiles : BEQ .powerBombs
    JSL AddSuperMissilesToHUDTilemap

  .powerBombs:
    LDA.W MaxPowerBombs : BEQ .previous
    JSL AddPowerBombsToHUDTilemap

  .previous:
    STZ.W PreviousEnergy : STZ.W PreviousMissiles : STZ.W PreviousSuperMissiles : STZ.W PreviousPowerBombs
    STZ.W PreviousHUDItemIndex
    JSL Initialise_Minimap_broken
    LDA.W #Tilemap_HUDDigits_ammo : STA.B DP_Temp00
    LDA.W #Tilemap_HUDDigits_ammo>>16 : STA.B DP_Temp02
    LDA.W MaxMissiles : BEQ .maxSuperMissiles
    LDA.W Missiles
    LDX.W #$0094
    JSR DrawThreeHUDDigits

  .maxSuperMissiles:
    LDA.W MaxSuperMissiles : BEQ .maxPowerBombs
    LDX.W #$009C
    LDA.W SuperMissiles
    JSR DrawTwoHUDDigits

  .maxPowerBombs:
    LDA.W MaxPowerBombs : BEQ .highlight
    LDA.W PowerBombs
    LDX.W #$00A2
    JSR DrawTwoHUDDigits

  .highlight:
    LDA.W SelectedHUDItem
    LDX.W #$1000
    JSR ToggleHUDItemHighlight
    LDA.W PreviousHUDItemIndex
    LDX.W #$1400
    JSR ToggleHUDItemHighlight
    JSL HandleHUDTilemap_PausedAndRunning
    PLB : PLP
    RTL


;;; $9B44: Handle HUD tilemap (HUD routine when game is paused/running) ;;;
HandleHUDTilemap_PausedAndRunning:
    PHP : PHB
    PHK : PLB
    SEP #$20
    STZ.B $02
    REP #$30
    LDA.W ReserveTankMode : CMP.W #$0001 : BNE .handleSamusHealth
    LDY.W #Tilemap_HUD_autoReserve
    LDA.W ReserveEnergy : BNE .drawAutoReserve
    LDY.W #Tilemap_HUD_emptyAutoReserve

  .drawAutoReserve:
    LDA.W $0000,Y : STA.L HUDTilemap_Row1AutoReserve
    LDA.W $0002,Y : STA.L HUDTilemap_Row1AutoReserve+2
    LDA.W $0004,Y : STA.L HUDTilemap_Row2AutoReserve
    LDA.W $0006,Y : STA.L HUDTilemap_Row2AutoReserve+2
    LDA.W $0008,Y : STA.L HUDTilemap_Row3AutoReserve
    LDA.W $000A,Y : STA.L HUDTilemap_Row3AutoReserve+2

  .handleSamusHealth:
    LDA.W Energy : CMP.W PreviousEnergy : BEQ .handleSamusMissiles
    STA.W PreviousEnergy
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
    REP #$30
    LDY.W #$0000
    LDA.W $4214 : INC : STA.B DP_Temp16

  .loopEtanks:
    DEC.B DP_Temp16 : BEQ .drawEtanksDigits
    LDX.W #$3430
    LDA.B DP_Temp14 : BEQ .drawEtanks
    DEC.B DP_Temp14
    LDX.W #$2831

  .drawEtanks:
    TXA
    LDX.W .etankIconOffsets,Y
    STA.L HUDTilemap,X
    INY #2 : CPY.W #$001C : BMI .loopEtanks

  .drawEtanksDigits:
    LDA.W #Tilemap_HUDDigits_health : STA.B DP_Temp00
    LDX.W #$008C
    LDA.B DP_Temp12
    JSR DrawTwoHUDDigits

  .handleSamusMissiles:
    LDA.W #Tilemap_HUDDigits_ammo : STA.B DP_Temp00
    LDA.W MaxMissiles : BEQ .handleSuperMissiles
    LDA.W Missiles : CMP.W PreviousMissiles : BEQ .handleSuperMissiles
    STA.W PreviousMissiles
    LDX.W #$0094
    JSR DrawThreeHUDDigits

  .handleSuperMissiles:
    LDA.W MaxSuperMissiles : BEQ .handlePowerBombs
    LDA.W SuperMissiles : CMP.W PreviousSuperMissiles : BEQ .handlePowerBombs
    STA.W PreviousSuperMissiles
    LDX.W #$009C
    LDA.W Debug_Options : BIT.W #$1F40 : BNE .debugSuperMissiles
    LDA.W PreviousSuperMissiles
    JSR DrawTwoHUDDigits
    BRA .handlePowerBombs

  .debugSuperMissiles:
    LDA.W PreviousSuperMissiles
    JSR DrawThreeHUDDigits

  .handlePowerBombs:
    LDA.W MaxPowerBombs : BEQ .handleHighlighter
    LDA.W PowerBombs : CMP.W PreviousPowerBombs : BEQ .handleHighlighter
    STA.W PreviousPowerBombs
    LDX.W #$00A2
    JSR DrawTwoHUDDigits

  .handleHighlighter:
; Plays click sound unless spin/wall jumping, grappling or X-raying
    LDA.W SelectedHUDItem : CMP.W PreviousHUDItemIndex : BEQ .handleAutoCancel
    LDX.W #$1000
    JSR ToggleHUDItemHighlight
    LDA.W PreviousHUDItemIndex
    LDX.W #$1400
    JSR ToggleHUDItemHighlight
    LDA.W SelectedHUDItem : STA.W PreviousHUDItemIndex
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0003 : BEQ .handleAutoCancel
    CMP.W #$0014 : BEQ .handleAutoCancel
    LDA.W GrappleBeam_Function : CMP.W #GrappleBeamFunction_Inactive : BNE .handleAutoCancel
    LDA.W TimeIsFrozenFlag : BNE .handleAutoCancel
    LDA.W #$0039
    JSL QueueSound_Lib1_Max6

  .handleAutoCancel:
; Handle auto-cancel highlighter flash
; Note that the 8-bit frame counter used here is set to 0 by door transition,
; which usually causes the flash cycle to reset
    LDX.W #$1400
    LDA.W NMI_8bitFrameCounter : BIT.W #$0010 : BEQ .highlight
    LDX.W #$1000

  .highlight:
    LDA.W AutoCancelHUDItemIndex
    JSR ToggleHUDItemHighlight
    LDX.W VRAMWriteStack
    LDA.W #$00C0 : STA.B VRAMWrite.size,X
    INX #2
    LDA.W #HUDTilemap : STA.B VRAMWrite.size,X
    INX #2
    LDA.W #HUDTilemap>>16 : STA.B VRAMWrite.size,X
    INX
    LDA.W #$5820 : STA.B VRAMWrite.size,X
    INX #2 : STX.W VRAMWriteStack
    PLB : PLP
    RTL

  .etankIconOffsets:
; Energy tank icon tilemap offsets
    dw $0042,$0044,$0046,$0048,$004A,$004C,$004E                         ; bottom (first) row
    dw $0002,$0004,$0006,$0008,$000A,$000C,$000E                         ; top (second) row


;;; $9CEA: Toggle HUD item highlight ;;;
ToggleHUDItemHighlight:
;; Parameters:
;;     A: HUD item index
;;     X: Tilemap palette bits (palette index * 400h)

; Palette 4 (X = 1000h) is used for the highlighted palette, otherwise palette 5 (X = 1400h) is used
; This routine assumes missiles are 3 tiles wide and all other icons are 2 tiles wide
    STX.W HUDItemTilemapPaletteBits
    DEC : BMI .return
    ASL : TAY
    LDX.W .HUDItemOffsets,Y
    LDA.L HUDTilemap,X : CMP.W #$2C0F : BEQ .topRightMiddle
    AND.W #$E3FF : ORA.W HUDItemTilemapPaletteBits : STA.L HUDTilemap,X

  .topRightMiddle:
    LDA.L HUDTilemap+2,X : CMP.W #$2C0F : BEQ .bottomLeft
    AND.W #$E3FF : ORA.W HUDItemTilemapPaletteBits : STA.L HUDTilemap+2,X

  .bottomLeft:
    LDA.L HUDTilemap_Row2,X : CMP.W #$2C0F : BEQ .bottomRightMiddle
    AND.W #$E3FF : ORA.W HUDItemTilemapPaletteBits : STA.L HUDTilemap_Row2,X

  .bottomRightMiddle:
    LDA.L HUDTilemap_Row2+2,X : CMP.W #$2C0F : BEQ .checkY
    AND.W #$E3FF : ORA.W HUDItemTilemapPaletteBits : STA.L HUDTilemap_Row2+2,X

  .checkY:
    CPY.W #$0000 : BEQ .topRight
    RTS

  .topRight:
    LDA.L HUDTilemap+4,X : CMP.W #$2C0F : BEQ .bottomRight
    AND.W #$E3FF : ORA.W HUDItemTilemapPaletteBits : STA.L HUDTilemap+4,X

  .bottomRight:
    LDA.L HUDTilemap_Row2+4,X : CMP.W #$2C0F : BEQ .return
    AND.W #$E3FF : ORA.W HUDItemTilemapPaletteBits : STA.L HUDTilemap_Row2+4,X

  .return:
    RTS

  .HUDItemOffsets:
; HUD item tilemap offsets
    dw $0014 ; Missiles
    dw $001C ; Super missiles
    dw $0022 ; Power bombs
    dw $0028 ; Grapple beam
    dw $002E ; X-ray


;;; $9D78: Draw three HUD digits ;;;
DrawThreeHUDDigits:
;; Parameters:
;;     A: Number to draw
;;     X: HUD tilemap index
;;     $00: Long pointer to digits tilemap
    STA.W $4204
    SEP #$20
    LDA.B #$64 : STA.W $4206
    PHA : PLA : PHA : PLA
    REP #$20
    LDA.W $4214 : ASL : TAY
    LDA.B [DP_Temp00],Y : STA.L HUDTilemap,X
    INX #2
    LDA.W $4216


;;; $9D98: Draw two HUD digits ;;;
DrawTwoHUDDigits:
;; Parameters:
;;     A: Number to draw
;;     X: HUD tilemap index
;;     $00: Long pointer to digits tilemap
    STA.W $4204
    SEP #$20
    LDA.B #$0A : STA.W $4206
    PHA : PLA : PHA : PLA
    REP #$20
    LDA.W $4214 : ASL : TAY
    LDA.B [DP_Temp00],Y : STA.L HUDTilemap,X
    LDA.W $4216 : ASL : TAY
    LDA.B [DP_Temp00],Y : STA.L HUDTilemap+2,X
    RTS


;;; $9DBF: HUD digits tilemap ;;;
Tilemap_HUDDigits:
; Starting with zero
  .health:
;       0     1     2     3     4     5     6     7     8     9
    dw $2C09,$2C00,$2C01,$2C02,$2C03,$2C04,$2C05,$2C06,$2C07,$2C08
  .ammo:
;       0     1     2     3     4     5     6     7     8     9
    dw $2C09,$2C00,$2C01,$2C02,$2C03,$2C04,$2C05,$2C06,$2C07,$2C08


;;; $9DE7: Process timer ;;;
ProcessTimer:
;; Returns:
;;     Carry: Set if timer has reached zero, otherwise clear

; Called by:
;     $90:E0E6: Timer / Samus hack handler - handle timer
;     $90:E12E: Timer / Samus hack handler - push Samus out of Ceres Ridley's way
;     $90:E1C8: Timer / Samus hack handler - pushing Samus out of Ceres Ridley's way
    PHB
    PHK : PLB
    PHX : PHY
    LDA.W TimerStatus : AND.W #$00FF : ASL : TAX
    JSR.W (.pointers,X)
    PLY : PLX : PLB
    RTL

  .pointers:
    dw ProcessTimer_Inactive
    dw ProcessTimer_CeresStart
    dw ProcessTimer_MotherBrainStart
    dw ProcessTimer_InitialDelay
    dw ProcessTimer_RunningMovementDelayed
    dw ProcessTimer_RunningMovingIntoPlace
    dw ProcessTimer_RunningMovingIntoPlace_return


;;; $9E09: Process timer - Ceres start ;;;
ProcessTimer_CeresStart:
;; Returns:
;;     Carry: Clear (timer not reached zero)
    JSL ClearTimerRAM
    LDA.W #$0100
    JSL SetTimer
    LDA.W #$8003 : STA.W TimerStatus


;;; $9E1A: Clear carry. Process timer - inactive ;;;
ProcessTimer_Inactive:
;; Returns:
;;     Carry: Clear (timer not reached zero)
    CLC
    RTS


;;; $9E1C: Process timer - Mother Brain start ;;;
ProcessTimer_MotherBrainStart:
;; Returns:
;;     Carry: Clear (timer not reached zero)
    JSL ClearTimerRAM
    LDA.W #$0300
    JSL SetTimer
    LDA.W #$8003 : STA.W TimerStatus
    CLC
    RTS


;;; $9E2F: Process timer - initial delay ;;;
ProcessTimer_InitialDelay:
;; Returns:
;;     Carry: Clear (timer not reached zero)
    SEP #$20
    INC.W TimerXSubPosition
    LDA.W TimerXSubPosition : CMP.B #$10 : BCC .return
    INC.W TimerStatus

  .return:
    REP #$21
    RTS


;;; $9E41: Process timer - timer running, movement delayed ;;;
ProcessTimer_RunningMovementDelayed:
;; Returns:
;;     Carry: Set if timer has reached zero, otherwise clear
    SEP #$20
    INC.W TimerXSubPosition
    LDA.W TimerXSubPosition : CMP.B #$60 : BCC .return
    STZ.W TimerXSubPosition
    INC.W TimerStatus

  .return:
    REP #$20
    JMP DecrementTimer


;;; $9E58: Process timer - timer running, moving into place ;;;
ProcessTimer_RunningMovingIntoPlace:
;; Returns:
;;     Carry: Set if timer has reached zero, otherwise clear
    LDY.W #$0000
    LDA.W #$00E0 : CLC : ADC.W TimerXSubPosition : CMP.W #$DC00 : BCC .XinPosition
    INY
    LDA.W #$DC00

  .XinPosition:
    STA.W TimerXSubPosition
    LDA.W #$FF3F : CLC : ADC.W TimerYSubPosition : CMP.W #$3000 : BCS .YinPosition
    INY
    LDA.W #$3000

  .YinPosition:
    STA.W TimerYSubPosition
    CPY.W #$0002 : BNE ProcessTimer_RunningMovingIntoPlace_return
    INC.W TimerStatus


;;; $9E89: Process timer - timer running, moved into place ;;;
ProcessTimer_RunningMovingIntoPlace_return:
;; Returns:
;;     Carry: Set if timer has reached zero, otherwise clear
    JMP DecrementTimer


;;; $9E8C: Timer = [A high] minutes, [A low] seconds ;;;
SetTimer:
; Called by:
;     $9E09 with A = 100h: Process timer - Ceres start
;     $9E1C with A = 300h: Process timer - Mother Brain start
    STZ.W TimerCentiseconds
    STA.W TimerSeconds
    RTL


;;; $9E93: Clear timer RAM ;;;
ClearTimerRAM:
    LDA.W #$8000 : STA.W TimerXSubPosition
    LDA.W #$8000 : STA.W TimerYSubPosition
    STZ.W TimerCentiseconds : STZ.W TimerSeconds : STZ.W TimerStatus
    RTL


;;; $9EA9: Decrement timer ;;;
DecrementTimer:
;; Returns:
;;     Carry: Set if timer has reached zero, otherwise clear
    SEP #$39 ; Set carry and decimal
    LDA.W NMI_FrameCounter : AND.B #$7F : TAX
    LDA.W TimerCentiseconds : SBC.W .centiseconds,X : STA.W TimerCentiseconds : BCS .checkExpired
    LDA.W TimerSeconds : SBC.B #$00 : STA.W TimerSeconds : BCS .checkExpired
    LDA.W TimerMinutes : SBC.B #$00 : STA.W TimerMinutes : BCC .clearTimer
    LDA.B #$59 : STA.W TimerSeconds
    BRA .checkExpired

  .clearTimer:
    STZ.W TimerCentiseconds : STZ.W TimerSeconds : STZ.W TimerMinutes

  .checkExpired:
    REP #$39 ; decimal + carry set
    LDA.W TimerCentiseconds : ORA.W TimerSeconds : BNE .return
    SEC

  .return:
    RTS

  .centiseconds:
; Timer centisecond decrements (43 1s and 85 2s)
    db $01,$02,$02,$01,$02,$02,$01,$02,$02,$01,$02,$02,$02,$01,$02,$02
    db $01,$02,$02,$01,$02,$02,$01,$02,$01,$02,$02,$01,$02,$02,$01,$02
    db $01,$02,$02,$01,$02,$02,$01,$02,$02,$01,$02,$02,$02,$01,$02,$02
    db $01,$02,$02,$01,$02,$02,$01,$02,$01,$02,$02,$01,$02,$02,$01,$02
    db $01,$02,$02,$01,$02,$02,$01,$02,$02,$01,$02,$02,$02,$01,$02,$02
    db $01,$02,$02,$01,$02,$02,$01,$02,$01,$02,$02,$01,$02,$02,$01,$02
    db $01,$02,$02,$01,$02,$02,$01,$02,$02,$01,$02,$02,$02,$01,$02,$02
    db $01,$02,$02,$01,$02,$02,$01,$02,$02,$01,$02,$02,$02,$01,$02,$02


;;; $9F6C: Draw timer ;;;
DrawTimer:
; Called by:
;     $82:8367: Game state 20h (made it to Ceres elevator)
;     $82:8388: Game state 21h (blackout from Ceres)
;     $82:E1B7: Game state Ah (loading next room)
;     $82:E288: Game state Bh (loading next room)
;     $90:E0E6: Timer / Samus hack handler - handle timer
;     $90:E114: Timer / Samus hack handler - draw timer
;     $90:E12E: Timer / Samus hack handler - push Samus out of Ceres Ridley's way
;     $90:E1C8: Timer / Samus hack handler - pushing Samus out of Ceres Ridley's way
    PHB
    PHK : PLB
    LDY.W #Spritemap_Timer_TIME
    LDA.W #$0000
    JSR DrawTimerSpritemap
    LDA.W TimerMinutes
    LDX.W #$FFE4
    JSR DrawTwoTimerDigits
    LDA.W TimerSeconds
    LDX.W #$FFFC
    JSR DrawTwoTimerDigits
    LDA.W TimerCentiseconds
    LDX.W #$0014
    JSR DrawTwoTimerDigits
    PLB
    RTL


;;; $9F95: Draw two timer digits ;;;
DrawTwoTimerDigits:
;; Parameters:
;;     DB: Spritemap bank
;;     A: Timer value
;;     X: X position offset
    PHX : PHA
    AND.W #$00F0 : LSR #3 : TAX
    LDY.W TimerDigitsSpritemapPointers,X
    LDA.B $03,S
    JSR DrawTimerSpritemap
    PLA : AND.W #$000F : ASL : TAX
    LDY.W TimerDigitsSpritemapPointers,X
    PLA : ADC.W #$0008


;;; $9FB3: Draw timer spritemap ;;;
DrawTimerSpritemap:
;; Parameters:
;;     A: X position offset
;;     DB:Y: Spritemap pointer
    STA.B $14
    LDA.W TimerXSubPosition : XBA : AND.W #$00FF
    CLC : ADC.B DP_Temp14 : STA.B DP_Temp14
    LDA.W TimerYSubPosition : XBA : AND.W #$00FF : STA.B DP_Temp12
    LDA.W #$0A00 : STA.B DP_Temp16
    JSL AddSpritemapToOAM
    RTS


;;; $9FD4: Timer spritemap data ;;;
TimerDigitsSpritemapPointers:
; Timer digits spritemap pointers
    dw Spritemap_TimerDigits_0
    dw Spritemap_TimerDigits_1
    dw Spritemap_TimerDigits_2
    dw Spritemap_TimerDigits_3
    dw Spritemap_TimerDigits_4
    dw Spritemap_TimerDigits_5
    dw Spritemap_TimerDigits_6
    dw Spritemap_TimerDigits_7
    dw Spritemap_TimerDigits_8
    dw Spritemap_TimerDigits_9

; Timer digits spritemaps
Spritemap_TimerDigits_0:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $1EA)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $1E0)

Spritemap_TimerDigits_1:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $1EB)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $1E1)

Spritemap_TimerDigits_2:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $1EC)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $1E2)

Spritemap_TimerDigits_3:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $1ED)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $1E3)

Spritemap_TimerDigits_4:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $1EE)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $1E4)

Spritemap_TimerDigits_5:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $1EF)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $1E5)

Spritemap_TimerDigits_6:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $1F0)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $1E6)

Spritemap_TimerDigits_7:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $1F1)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $1E7)

Spritemap_TimerDigits_8:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $1F2)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $1E8)

Spritemap_TimerDigits_9:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $1F3)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $1E9)

; Timer TIME spritemap
Spritemap_Timer_TIME:
    dw $0005
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 5, $1F8)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 3, 5, $1F7)
    %spritemapEntry(0, $1E0, $F0, 0, 0, 3, 5, $1F6)
    %spritemapEntry(0, $008, $F8, 0, 0, 3, 5, $1F5)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 5, $1F4)


;;; $A07B: Start gameplay ;;;
StartGameplay:
; Called by:
;     $82:8000: Game state 6/1Fh/28h (loading game data / set up new game / load demo game data)
    PHP : PHB
    PHK : PLB
    REP #$30
    SEI
    STZ.W $420B
    STZ.W ScrollingSkyFinishedHook
    STZ.W MusicDataIndex : STZ.W MusicTrackIndex
    STZ.W TimerStatus
    JSL ResetSoundQueues
    LDA.W #$FFFF : STA.W DisableSounds
    JSL DisableNMI
    JSL DisableHVCounterInterrupts
    JSL Load_Destination_Room
    JSR HandleMusicQueueFor20Frames
    JSL Clear_AnimatedTilesObjects
    JSL Wait_End_VBlank_Clear_HDMA
    JSL Initialise_Special_Effects_for_New_Room
    JSL Clear_PLMs
    JSL Clear_Enemy_Projectiles
    JSL Clear_PaletteFXObjects
    JSL Update_Beam_Tiles_and_Palette
    JSL Load_Target_Colors_for_Common_SpritesBeamsFlashingEnemies
    JSL Load_Enemies
    JSL Queue_Room_Music_Data
    JSR HandleMusicQueueFor20Frames
    JSL Update_Music_Track_Index
    JSL RTL_82E113
    JSL ClearBG2Tilemap
    JSL LoadLevelData_CRE_TileTable_ScrollData_PLMs_DoorASM_RoomASM
    JSL Load_FX_Header
    JSL LoadLibraryBackground_LoadingPausing
    JSR CalculateLayer2XPosition
    JSR CalculateLayer2YPosition
    LDA.W Layer2XPosition : STA.W BG2XOffset
    LDA.W Layer2YPosition : STA.W BG2YOffset
    JSR CalculateBGScrolls
    JSL DisplayViewablePartOfRoom
    JSL EnableNMI
    LDA.B DP_RoomLoadIRQCmd : BNE .setNextInterrupt
    LDA.W #$0004

  .setNextInterrupt:
    STA.B DP_NextIRQCmd
    JSL EnableHVCounterInterrupts
    JSR HandleMusicQueueFor20Frames
    JSL Spawn_Hardcoded_PLM
    db $08,$08
    dw PLMEntries_enableSoundsIn20Frames_F0FramesIfCeres
    LDA.W #DoorTransitionFunction_FadeInTheScreen_and_RunEnemies_Finish : STA.W DoorTransitionFunction
    PLB : PLP
    RTL


;;; $A12B: Handle music queue for 20 frames ;;;
HandleMusicQueueFor20Frames:
; Called by:
;     StartGameplay
    PHP
    SEP #$30
    JSL EnableNMI
    LDX.B #$14

  .loop:
    PHX : PHP
    JSL HandleMusicQueue
    JSL WaitForNMI
    PLP : PLX
    DEX : BNE .loop
    JSL DisableNMI
    PLP
    RTS


;;; $A149: Resume gameplay ;;;
ResumeGameplay:
; Called by:
;     $82:9367: Game state 11h (unpausing, loading normal gameplay)
    PHP : PHB
    PHK : PLB
    REP #$30
    SEI ; >.< REP #$34
    STZ.W $420B
    JSL DisableNMI
    JSL DisableHVCounterInterrupts
    JSL Load_CRETiles_TilesetTiles_and_TilesetPalette_DB_8F
    JSL LoadLibraryBackground_LoadingPausing
    JSL DisplayViewablePartOfRoom
    JSL Load_Room_PLM_Graphics
    JSL EnableNMI
    JSL EnableHVCounterInterrupts
    PLB : PLP
    RTL


;;; $A176: Display the viewable part of the room ;;;
DisplayViewablePartOfRoom:
; Called by:
;     $A07B: Start gameplay
;     $A149: Resume gameplay

; Draws the 17x16 block area starting at:
;     ([layer 1 X position], [layer 1 Y position]) for BG1 level data
;     ([layer 2 X position], [layer 2 Y position]) for BG2 level data
;     ([BG1 X position], [BG1 Y position]) for BG1 VRAM position
;     ([BG2 X position], [BG2 Y position]) for BG2 VRAM position

; Expects force blank to be enabled!
    PHP
    SEP #$20
    LDA.B DP_BG1TilemapAddrSize : SEC : SBC.B DP_BG2TilemapAddrSize
    XBA
    REP #$20
    AND.W #$F800 : STA.W SizeOfBG2
    JSR Calculate_BGScroll_LayerPositionBlocks
    LDX.W #$0000

  .loop:
    PHX
    LDA.W Layer1XBlock : STA.W BlocksToUpdateXBlock
    LDA.W Layer1YBlock : STA.W BlocksToUpdateYBlock
    LDA.W BG1XBlock : STA.W VRAMBlocksToUpdateXBlock
    LDA.W BG1YBlock : STA.W VRAMBlocksToUpdateYBlock
    JSR UpdateLevelDataColumn
    LDA.W Layer2ScrollX : LSR : BCS .increment
    LDA.W Layer2XBlock : STA.W BlocksToUpdateXBlock
    LDA.W Layer2YBlock : STA.W BlocksToUpdateYBlock
    LDA.W BG2XBlock : STA.W VRAMBlocksToUpdateXBlock
    LDA.W BG2YBlock : STA.W VRAMBlocksToUpdateYBlock
    JSR UpdateBackgroundDataColumn

  .increment:
    JSL HandleVRAMWriteTable_ScrollingDMAs
    PLX
    INC.W Layer1XBlock : INC.W BG1XBlock
    INC.W Layer2XBlock : INC.W BG2XBlock
    INX : CPX.W #$0011 : BNE .loop
    PLP
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $A1E3: Unused. Queue clearing of BG2 tilemap ;;;
UNUSED_QueueClearingOfBG2Tilemap_80A1E3:
    LDX.W #$0FFE
    LDA.W #$0338

  .loop:
    STA.L BG2Tilemap,X
    DEX #2 : BPL .loop
    LDX.W VRAMWriteStack
    LDA.W #$1000 : STA.B VRAMWrite.size,X
    LDA.W #$4000 : STA.B VRAMWrite.src,X
    LDA.W #$007E : STA.B VRAMWrite.src+2,X
    LDA.W #$4800 : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A211: Queue clearing of FX tilemap ;;;
QueueClearingOfFXTilemap:
; Called by:
;     $82:8CEF: Game state Dh (pausing, loading pause menu)
    LDX.W #$0EFE
    LDA.W #$184E

  .loop:
    STA.L BG2Tilemap,X
    DEX #2 : BPL .loop
    LDX.W VRAMWriteStack
    LDA.W #$0F00 : STA.B VRAMWrite.size,X
    LDA.W #$4000 : STA.B VRAMWrite.src,X
    LDA.W #$007E : STA.B VRAMWrite.src+2,X
    LDA.W #$5880 : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    RTL


;;; $A23F: Clear BG2 tilemap ;;;
ClearBG2Tilemap:
; Called by:
;     $A07B: Start gameplay
;     $82:EA56: Load library background - command Ah: clear BG2 tilemap
;     $82:EA5E: Load library background - command Ch: clear Kraid's layer 2

; Looks like $A27A is supposed to be LDA #$A29B
    PHP
    REP #$20
    LDA.W #$4800 : STA.W $2116
    LDA.W #$1808 : STA.W $4310
    LDA.W #.addr : STA.W $4312
    LDA.W #$0080 : STA.W $4314
    LDA.W #$0800 : STA.W $4315
    SEP #$20
    LDA.B #$00 : STA.W $2115
    LDA.B #$02 : STA.W $420B
    REP #$20
    LDA.W #$4800 : STA.W $2116
    LDA.W #$1908 : STA.W $4310
    LDA.W #.addr : STA.W $4312
    LDA.W #$0080 : STA.W $4314
    LDA.W #$0800 : STA.W $4315
    SEP #$20
    LDA.B #$80 : STA.W $2115
    LDA.B #$02 : STA.W $420B
    PLP
    RTL

  .addr:
    dw $0338


;;; $A29C: Clear FX tilemap ;;;
ClearFXTilemap:
; Called by:
;     $82:E97C: Load library background
;     $82:EA4E: Load library background - command 6: clear FX tilemap
    PHP
    REP #$20
    LDA.W #$5880 : STA.W $2116
    LDA.W #$1808 : STA.W $4310
    LDA.W #.addr : STA.W $4312
    LDA.W #$0080 : STA.W $4314
    LDA.W #$0780 : STA.W $4315
    SEP #$20
    LDA.B #$00 : STA.W $2115
    LDA.B #$02 : STA.W $420B
    REP #$20
    LDA.W #$5880 : STA.W $2116
    LDA.W #$1908 : STA.W $4310
    LDA.W #.addr+1 : STA.W $4312
    LDA.W #$0080 : STA.W $4314
    LDA.W #$0780 : STA.W $4315
    SEP #$20
    LDA.B #$80 : STA.W $2115
    LDA.B #$02 : STA.W $420B
    PLP
    RTL

  .addr:
    dw $184E


;;; $A2F9: Calculate layer 2 X position ;;;
CalculateLayer2XPosition:
;; Returns:
;;     Carry: Clear if BG2 needs to be scrolled
;;     A: Layer 2 X position

; Called by:
;     $A07B: Start gameplay
;     $A3AB: Calculate layer 2 position and BG scrolls and update BG graphics when scrolling
;     $AD4A: Door transition scrolling setup - right
;     $AD74: Door transition scrolling setup - left
;     $AD9E: Door transition scrolling setup - down
;     $ADC8: Door transition scrolling setup - up

; If [layer 2 scroll X] = 0:
;     Layer 2 X position = [layer 1 X position]
; Else if [layer 2 scroll X] = 1:
;     Carry is set (layer 2 X position unchanged)
; Else:
;     Layer 2 X position = [layer 1 X position] * ([layer 2 scroll X] >> 1) / 80h
    PHP
    LDY.W Layer1XPosition
    SEP #$20
    LDA.W Layer2ScrollX : BEQ .scrollReturn
    CMP.B #$01 : BEQ .return
    AND.B #$FE : STA.W $4202
    LDA.W Layer1XPosition : STA.W $4203
    STZ.W VRAMOffsetBlocksToUpdate+1
    PHA : PLA
    LDA.W $4217 : STA.W VRAMOffsetBlocksToUpdate
    LDA.W Layer1XPosition+1 : STA.W $4203
    REP #$20
    LDA.W VRAMOffsetBlocksToUpdate : CLC : ADC.W $4216 : TAY

  .scrollReturn:
    REP #$20
    TYA : STA.W Layer2XPosition
    PLP
    CLC
    RTS

  .return:
    PLP
    SEC
    RTS


;;; $A33A: Calculate layer 2 Y position ;;;
CalculateLayer2YPosition:
;; Returns:
;;     Carry: Clear if BG2 needs to be scrolled
;;     A: Layer 2 Y position

; Called by:
;     $A07B: Start gameplay
;     $A3AB: Calculate layer 2 position and BG scrolls and update BG graphics when scrolling
;     $AD4A: Door transition scrolling setup - right
;     $AD74: Door transition scrolling setup - left
;     $AD9E: Door transition scrolling setup - down
;     $ADC8: Door transition scrolling setup - up

; If [layer 2 scroll Y] = 0:
;     Layer 2 Y position = [layer 1 Y position]
; Else if [layer 2 scroll Y] = 1:
;     Carry is set (layer 2 Y position unchanged)
; Else:
;     Layer 2 Y position = [layer 1 Y position] * ([layer 2 scroll Y] >> 1) / 80h
    PHP
    LDY.W Layer1YPosition
    SEP #$20
    LDA.W Layer2ScrollY : BEQ .scrollReturn
    CMP.B #$01 : BEQ .return
    AND.B #$FE : STA.W $4202
    LDA.W Layer1YPosition : STA.W $4203
    STZ.W $0934
    PHA : PLA
    LDA.W $4217 : STA.W PositionOfScrollBoundary
    LDA.W Layer1YPosition+1 : STA.W $4203
    REP #$20
    LDA.W PositionOfScrollBoundary : CLC : ADC.W $4216 : TAY

  .scrollReturn:
    REP #$20
    TYA : STA.W Layer2YPosition
    PLP
    CLC
    RTS

  .return:
    PLP
    SEC
    RTS


;;; $A37B: Calculate BG scrolls ;;;
CalculateBGScrolls:
; Called by:
;     $A07B: Start gameplay
;     $A3A0: Calculate BG scrolls and update BG graphics when scrolling (door transition)
    LDA.W Layer1XPosition : CLC : ADC.W Layer2ScrollY+1 : STA.B DP_BG1XScroll
    LDA.W Layer1YPosition : CLC : ADC.W BG1YOffset : STA.B DP_BG1YScroll
    LDA.W Layer2XPosition : CLC : ADC.W BG2XOffset : STA.B DP_BG2XScroll
    LDA.W Layer2YPosition : CLC : ADC.W BG2YOffset : STA.B DP_BG2YScroll
    RTS


;;; $A3A0: Calculate BG scrolls and update BG graphics when scrolling ;;;
CalculateBGScrolls_UpdateBGGraphics_WhenScrolling:
; Called by:
;     $AE7E: Door transition scrolling - right
;     $AEC2: Door transition scrolling - left
;     $AF02: Door transition scrolling - down
;     $AF89: Door transition scrolling - up
    PHP : PHB
    PHK : PLB
    REP #$30
    JSR CalculateBGScrolls
    BRA UpdateBGGraphics_WhenScrolling


;;; $A3AB: Calculate layer 2 position and BG scrolls and update BG graphics when scrolling ;;;
Calc_Layer2Position_BGScrolls_UpdateBGGraphics_WhenScrolling:
; Called by
;     $82:8B44: Game state 8 (main gameplay)
;     $82:E310: Door transition function - scroll screen to alignment
;     $82:E675: Unused. Door transition function
    LDA.W TimeIsFrozenFlag : BEQ .continue
    RTL

  .continue:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W Layer1XPosition : CLC : ADC.W Layer2ScrollY+1 : STA.B DP_BG1XScroll
    LDA.W Layer1YPosition : CLC : ADC.W BG1YOffset : STA.B DP_BG1YScroll
    JSR CalculateLayer2XPosition
    BCS .layer2Y
    CLC : ADC.W BG2XOffset : STA.B DP_BG2XScroll

  .layer2Y:
    JSR CalculateLayer2YPosition
    BCS UpdateBGGraphics_WhenScrolling
    CLC : ADC.W BG2YOffset : STA.B DP_BG2YScroll
; fallthrough to UpdateBGGraphics_WhenScrolling


;;; $A3DF: Update BG graphics when scrolling ;;;
UpdateBGGraphics_WhenScrolling:
; Called by:
;     $A3A0: Calculate BG scrolls and update BG graphics when scrolling
;     $A3AB: Calculate layer 2 position and BG scrolls and update BG graphics when scrolling

; Calculates new BG and layer positions, calls the update level/background data row/column functions and updates the previous layer 1/2 X/Y block values
; Expects a pushed DB and PSR
    REP #$20
    JSR Calculate_BGScroll_LayerPositionBlocks
    LDX.W #$0000
    LDA.W Layer1XBlock : CMP.W PreviousLayer1XBlock : BEQ .layer1HorizontalEnd
    STA.W PreviousLayer1XBlock
    BMI .updateLayer1
    LDX.W #$0010

  .updateLayer1:
    TXA : CLC : ADC.W Layer1XBlock : STA.W BlocksToUpdateXBlock
    TXA : CLC : ADC.W BG1XBlock : STA.W VRAMBlocksToUpdateXBlock
    LDA.W Layer1YBlock : STA.W BlocksToUpdateYBlock
    LDA.W BG1YBlock : STA.W VRAMBlocksToUpdateYBlock
    JSR UpdateLevelDataColumn

  .layer1HorizontalEnd:
    LDA.W Layer2ScrollX : LSR : BCS .layer2HorizontalEnd
    LDX.W #$0000
    LDA.W Layer2XBlock : CMP.W PreviousLayer2XBlock : BEQ .layer2HorizontalEnd
    STA.W PreviousLayer2XBlock
    BMI .updateLayer2
    LDX.W #$0010

  .updateLayer2:
    TXA : CLC : ADC.W Layer2XBlock : STA.W BlocksToUpdateXBlock
    TXA : CLC : ADC.W BG2XBlock : STA.W VRAMBlocksToUpdateXBlock
    LDA.W Layer2YBlock : STA.W BlocksToUpdateYBlock
    LDA.W BG2YBlock : STA.W VRAMBlocksToUpdateYBlock
    JSR UpdateBackgroundDataColumn

  .layer2HorizontalEnd:
    LDX.W #$0001
    LDA.W Layer1YBlock : CMP.W PreviousLayer1YBlock : BEQ .layer1VerticalEnd
    STA.W PreviousLayer1YBlock
    BMI +
    LDX.W #$000F

+   TXA : CLC : ADC.W Layer1YBlock : STA.W BlocksToUpdateYBlock
    TXA : CLC : ADC.W BG1YBlock : STA.W VRAMBlocksToUpdateYBlock
    LDA.W Layer1XBlock : STA.W BlocksToUpdateXBlock
    LDA.W BG1XBlock : STA.W VRAMBlocksToUpdateXBlock
    JSR UpdateLevelDataRow

  .layer1VerticalEnd:
    LDA.W Layer2ScrollY : LSR : BCS .return
    LDX.W #$0001
    LDA.W Layer2YBlock : CMP.W PreviousLayer2YBlock : BEQ .return
    STA.W PreviousLayer2YBlock
    BMI .finish
    LDX.W #$000F

  .finish:
    TXA : CLC : ADC.W Layer2YBlock : STA.W BlocksToUpdateYBlock
    TXA : CLC : ADC.W BG2YBlock : STA.W VRAMBlocksToUpdateYBlock
    LDA.W Layer2XBlock : STA.W BlocksToUpdateXBlock
    LDA.W BG2XBlock : STA.W VRAMBlocksToUpdateXBlock
    JSR UpdateBackgroundDataRow

  .return:
    PLB : PLP
    RTL


;;; $A4BB: Calculate BG scroll and layer position blocks ;;;
Calculate_BGScroll_LayerPositionBlocks:
; Called by:
;     $A176: Display the viewable part of the room
;     $A3DF: Update BG graphics when scrolling
;     $AD1D: Draw top row of screen for upwards door transition
;     $AD4A: Door transition scrolling setup - right
;     $AD74: Door transition scrolling setup - left
;     $AD9E: Door transition scrolling setup - down
;     $ADC8: Door transition scrolling setup - up
;     $AF02: Door transition scrolling - down
;     $AF89: Door transition scrolling - up
    LDA.B DP_BG1XScroll : LSR #4 : STA.W BG1XBlock
    LDA.B DP_BG2XScroll : LSR #4 : STA.W BG2XBlock
    LDA.W Layer1XPosition : LSR #4 : BIT.W #$0800 : BEQ +
    ORA.W #$F000

+   STA.W Layer1XBlock
    LDA.W Layer2XPosition : LSR #4 : BIT.W #$0800 : BEQ +
    ORA.W #$F000

+   STA.W Layer2XBlock
    LDA.B DP_BG1YScroll : LSR #4 : STA.W BG1YBlock
    LDA.B DP_BG2YScroll : LSR #4 : STA.W BG2YBlock
    LDA.W Layer1YPosition : LSR #4 : BIT.W #$0800 : BEQ +
    ORA.W #$F000

+   STA.W Layer1YBlock
    LDA.W Layer2YPosition : LSR #4 : BIT.W #$0800 : BEQ +
    ORA.W #$F000

+   STA.W Layer2YBlock
    RTS


;;; $A528: Handle scroll zones - horizontal autoscrolling ;;;
HandleScrollZones_HorizontalAutoscrolling:
; Called by:
;     $90:94EC: Main scrolling routine
;     $90:95A0: Handle horizontal scrolling

; If time frozen:
;     Return
;
; Layer 1 X position = clamp([layer 1 X position], 0, (room width in pixels) - 100h)
;
; If layer 1 position + 1/2 scroll down's scroll = red:
; {
;     PositionOfScrollBoundary = position of right scroll boundary
;     ProposedScrolledLayer1XPosition = [layer 1 X position] + [camera X speed] + 2
;     Layer 1 X position = min(ProposedScrolledLayer1XPosition, PositionOfScrollBoundary)
;     If ProposedScrolledLayer1XPosition < PositionOfScrollBoundary and layer 1 position + 1/2 scroll down + 1 scroll right's scroll = red:
;         Round layer 1 X position to left scroll boundary
; }
; Else if layer 1 position + 1/2 scroll down + 1 scroll right's scroll = red:
; {
;     PositionOfScrollBoundary = position of left scroll boundary
;     ProposedScrolledLayer1XPosition = [layer 1 X position] - [camera X speed] - 2
;     Layer 1 X position = max(ProposedScrolledLayer1XPosition, PositionOfScrollBoundary)
;     If ProposedScrolledLayer1XPosition >= PositionOfScrollBoundary and layer 1 position + 1/2 scroll down's scroll = red:
;         Layer 1 X position = ProposedScrolledLayer1XPosition rounded to right scroll boundary
; }
    PHP
    PHB
    SEP #$20
    LDA.W TimeIsFrozenFlag : ORA.W TimeIsFrozenFlag+1 : BEQ +
    JMP .return


+   LDA.B #$8F : PHA : PLB
    REP #$30
    LDA.W Layer1XPosition : STA.W ProposedScrolledLayer1XPosition : BPL +
    STZ.W Layer1XPosition

+   LDA.W RoomWidthScrolls : DEC : XBA : CMP.W Layer1XPosition : BCS +
    STA.W Layer1XPosition

+   LDA.W Layer1YPosition : CLC : ADC.W #$0080 : XBA
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthScrolls : STA.W $4203
    REP #$20
    LDA.W Layer1XPosition+1 : AND.W #$00FF : CLC : ADC.W $4216 : TAX
    LDA.L Scrolls,X : AND.W #$00FF : BNE .unboundedFromLeft
    LDA.W Layer1XPosition : AND.W #$FF00 : CLC : ADC.W #$0100 : STA.W PositionOfScrollBoundary
    LDA.W ProposedScrolledLayer1XPosition : CLC : ADC.W CameraXSpeed : ADC.W #$0002
    CMP.W PositionOfScrollBoundary : BCS .reachedRightScrollBoundary
    STA.W ProposedScrolledLayer1XPosition
    LDA.W Layer1YPosition : CLC : ADC.W #$0080 : XBA
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthScrolls : STA.W $4203
    REP #$20
    LDA.W BackgroundDataLoopCounter+1 : INC : AND.W #$00FF : CLC : ADC.W $4216 : TAX
    LDA.L Scrolls,X : AND.W #$00FF : BNE .returnLayer1X
    LDA.W ProposedScrolledLayer1XPosition : AND.W #$FF00
    BRA +

  .returnLayer1X:
    LDA.W ProposedScrolledLayer1XPosition
    BRA +

  .reachedRightScrollBoundary:
    LDA.W PositionOfScrollBoundary
    BRA +

  .unboundedFromLeft:
    INX
    LDA.L Scrolls,X : AND.W #$00FF : BNE .return
    LDA.W Layer1XPosition : AND.W #$FF00 : STA.W PositionOfScrollBoundary
    LDA.W ProposedScrolledLayer1XPosition : SEC : SBC.W CameraXSpeed : SBC.W #$0002
    CMP.W PositionOfScrollBoundary : BMI .reachedLeftScrollBoundary
    STA.W ProposedScrolledLayer1XPosition
    LDA.W Layer1YPosition : CLC : ADC.W #$0080 : XBA
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthScrolls : STA.W $4203
    REP #$20
    LDA.W BackgroundDataLoopCounter+1 : AND.W #$00FF : CLC : ADC.W $4216 : TAX
    LDA.L Scrolls,X : AND.W #$00FF : BNE .return0939
    LDA.W ProposedScrolledLayer1XPosition : AND.W #$FF00 : CLC : ADC.W #$0100
    BRA +

  .return0939:
    LDA.W ProposedScrolledLayer1XPosition
    BRA +

  .reachedLeftScrollBoundary:
    LDA.W PositionOfScrollBoundary

+   STA.W Layer1XPosition

  .return:
    PLB : PLP
    RTL


;;; $A641: Handle scroll zones - scrolling right ;;;
HandleScrollZones_ScrollingRight:
; Called by:
;     $90:95A0: Handle horizontal scrolling
    PHP : PHB
    SEP #$20
    LDA.B #$8F : PHA : PLB
    REP #$30
    LDA.W Layer1XPosition : STA.W ProposedScrolledLayer1XPosition
    LDA.W $0B0A : CMP.W Layer1XPosition : BPL +
    LDA.W $0B0A : STA.W Layer1XPosition
    STZ.W $090F

+   LDA.W RoomWidthScrolls : DEC : XBA : CMP.W Layer1XPosition : BCS +
    STA.W Layer1XPosition
    BRA .return

+   LDA.W Layer1YPosition : CLC : ADC.W #$0080 : XBA
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthScrolls : STA.W $4203
    REP #$20
    LDA.W Layer1XPosition+1 : AND.W #$00FF : SEC : ADC.W $4216 : TAX
    LDA.L Scrolls,X : AND.W #$00FF : BNE .return
    LDA.W Layer1XPosition : AND.W #$FF00 : STA.W PositionOfScrollBoundary
    LDA.W ProposedScrolledLayer1XPosition : SEC : SBC.W CameraXSpeed : SBC.W #$0002
    CMP.W PositionOfScrollBoundary : BPL +
    LDA.W PositionOfScrollBoundary

+   STA.W Layer1XPosition

  .return:
    PLB : PLP
    RTL


;;; $A6BB: Handle scroll zones - scrolling left ;;;
HandleScrollZones_ScrollingLeft:
; Called by:
;     $90:95A0: Handle horizontal scrolling
    PHP : PHB
    SEP #$20
    LDA.B #$8F : PHA : PLB
    REP #$30
    LDA.W Layer1XPosition : STA.W ProposedScrolledLayer1XPosition : CMP.W $0B0A : BPL +
    LDA.W $0B0A : STA.W Layer1XPosition
    STZ.W $090F

+   LDA.W Layer1XPosition : BPL +
    STZ.W Layer1XPosition
    BRA .return

+   LDA.W Layer1YPosition : CLC : ADC.W #$0080 : XBA
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthScrolls : STA.W $4203
    REP #$20
    LDA.W Layer1XPosition+1 : AND.W #$00FF : CLC : ADC.W $4216 : TAX
    LDA.L Scrolls,X : AND.W #$00FF : BNE .return
    LDA.W Layer1XPosition : AND.W #$FF00 : CLC : ADC.W #$0100 : STA.W PositionOfScrollBoundary
    LDA.W ProposedScrolledLayer1XPosition : CLC : ADC.W CameraXSpeed : ADC.W #$0002
    CMP.W PositionOfScrollBoundary : BCC +
    LDA.W PositionOfScrollBoundary

+   STA.W Layer1XPosition

  .return:
    PLB : PLP
    RTL


;;; $A731: Handle scroll zones - vertical autoscrolling ;;;
HandleScrollZones_VerticalAutoscrolling:
; Called by:
;     $90:94EC: Main scrolling routine
;     $90:964F: Handle vertical scrolling

; If time frozen:
;     Return
;
; If layer 1 position + 1/2 scroll right's scroll = blue:
;     PositionOfScrollBoundary = 0
; Else
;     PositionOfScrollBoundary = 1Fh
;
; Layer 1 Y position = clamp([layer 1 Y position], 0, (room height in pixels) - 100h + PositionOfScrollBoundary)
;
; If layer 1 position + 1/2 scroll right's scroll = red:
; {
;     XBlockOfVRAMBlocksToUpdate = position of bottom scroll boundary
;     ProposedScrolledLayer1XPosition = [layer 1 Y position] + [camera Y speed] + 2
;     Layer 1 X position = min(ProposedScrolledLayer1XPosition, XBlockOfVRAMBlocksToUpdate)
;     If ProposedScrolledLayer1XPosition < XBlockOfVRAMBlocksToUpdate and layer 1 position + 1/2 scroll right + 1 scroll down's scroll = red:
;         Round layer 1 Y position to top scroll boundary
; }
; Else if layer 1 position + 1/2 scroll right + 1 scroll down's scroll = red:
; {
;     $0937 = position of top scroll boundary + PositionOfScrollBoundary
;     If [$0937] < [layer 1 Y position]:
;     {
;         ProposedScrolledLayer1XPosition = [layer 1 Y position] - [camera Y speed] - 2
;         Layer 1 Y position = max(ProposedScrolledLayer1XPosition, [$0937])
;         If ProposedScrolledLayer1XPosition >= [$0937] and layer 1 position + 1/2 scroll right's scroll = red:
;             Layer 1 Y position = ProposedScrolledLayer1XPosition rounded to right bottom boundary
;     }
; }
    PHP : PHB
    SEP #$20
    LDA.W TimeIsFrozenFlag : ORA.W TimeIsFrozenFlag+1 : BEQ +
    JMP .return

+   LDA.B #$8F : PHA : PLB
    REP #$30
    LDY.W #$0000
    SEP #$20
    LDA.W Layer1YPosition+1 : STA.W $4202
    LDA.W RoomWidthScrolls : STA.W $4203
    REP #$20
    LDA.W Layer1XPosition : CLC : ADC.W #$0080 : XBA
    AND.W #$00FF : CLC : ADC.W $4216 : STA.B $14
    TAX
    LDA.L Scrolls,X : AND.W #$00FF : CMP.W #$0001 : BEQ +
    LDY.W #$001F

+   STY.W PositionOfScrollBoundary
    LDA.W Layer1YPosition : STA.W ProposedScrolledLayer1XPosition : BPL +
    STZ.W Layer1YPosition

+   LDA.W RoomHeightScrolls : DEC : XBA : CLC : ADC.W PositionOfScrollBoundary
    CMP.W Layer1YPosition : BCS +
    STA.W Layer1YPosition

+   SEP #$20
    LDA.W Layer1YPosition+1 : STA.W $4202
    LDA.W RoomWidthScrolls : STA.W $4203
    REP #$20
    LDA.W Layer1XPosition : CLC : ADC.W #$0080 : XBA
    AND.W #$00FF : CLC : ADC.W $4216 : TAX
    LDA.L Scrolls,X : AND.W #$00FF : BNE .unboundedFromAbove
    LDA.W Layer1YPosition : AND.W #$FF00 : CLC : ADC.W #$0100 : STA.W XBlockOfVRAMBlocksToUpdate
    LDA.W ProposedScrolledLayer1XPosition : CLC : ADC.W CameraYSpeed : ADC.W #$0002
    CMP.W XBlockOfVRAMBlocksToUpdate : BCS .reachedBottomScrollBoundary
    STA.W ProposedScrolledLayer1XPosition
    SEP #$20
    LDA.W BackgroundDataLoopCounter+1 : INC : STA.W $4202
    LDA.W RoomWidthScrolls : STA.W $4203
    REP #$20
    LDA.W Layer1XPosition : CLC : ADC.W #$0080 : XBA
    AND.W #$00FF : CLC : ADC.W $4216 : TAX
    LDA.L Scrolls,X : AND.W #$00FF : BNE +
    LDA.W ProposedScrolledLayer1XPosition : AND.W #$FF00
    BRA .returnLayer1Y

+   LDA.W ProposedScrolledLayer1XPosition
    BRA .returnLayer1Y

  .reachedBottomScrollBoundary:
    LDA.W XBlockOfVRAMBlocksToUpdate
    BRA .returnLayer1Y

  .unboundedFromAbove:
    TXA : CLC : ADC.W RoomWidthScrolls : TAX
    LDA.L Scrolls,X : AND.W #$00FF : BNE .return
    LDA.W Layer1YPosition : AND.W #$FF00 : CLC : ADC.W PositionOfScrollBoundary : STA.W UpperScrollPosition
    CMP.W Layer1YPosition : BCS .return
    LDA.W ProposedScrolledLayer1XPosition : SEC : SBC.W CameraYSpeed : SBC.W #$0002
    CMP.W UpperScrollPosition : BMI .reachedTopScrollBoundary
    STA.W ProposedScrolledLayer1XPosition
    SEP #$20
    LDA.W BackgroundDataLoopCounter+1 : STA.W $4202
    LDA.W RoomWidthScrolls : STA.W $4203
    REP #$20
    LDA.W Layer1XPosition : CLC : ADC.W #$0080 : XBA
    AND.W #$00FF : CLC : ADC.W $4216 : TAX
    LDA.L Scrolls,X : AND.W #$00FF : BNE .returnProposedLayer1X
    LDA.W ProposedScrolledLayer1XPosition : AND.W #$FF00 : CLC : ADC.W #$0100
    BRA .returnLayer1Y

  .returnProposedLayer1X:
    LDA.W ProposedScrolledLayer1XPosition
    BRA .returnLayer1Y

  .reachedTopScrollBoundary:
    LDA.W UpperScrollPosition

  .returnLayer1Y:
    STA.W Layer1YPosition

  .return:
    PLB : PLP
    RTL


;;; $A893: Handle scroll zones - scrolling down ;;;
HandleScrollZones_ScrollingDown:
; Called by:
;     $90:964F: Handle vertical scrolling
    PHP : PHB
    SEP #$20
    LDA.B #$8F : PHA : PLB
    REP #$30
    LDA.W Layer1YPosition : STA.W ProposedScrolledLayer1XPosition
    LDY.W #$0000
    SEP #$20
    LDA.W Layer1YPosition+1 : STA.W $4202
    LDA.W RoomWidthScrolls : STA.W $4203
    REP #$20
    LDA.W Layer1XPosition : CLC : ADC.W #$0080 : XBA
    AND.W #$00FF : CLC : ADC.W $4216 : STA.B DP_Temp14
    TAX
    LDA.L Scrolls,X : AND.W #$00FF : CMP.W #$0001 : BEQ +
    LDY.W #$001F

+   STY.W PositionOfScrollBoundary
    LDA.W IdealLayer1YPosition : CMP.W Layer1YPosition : BPL +
    LDA.W IdealLayer1YPosition : STA.W Layer1YPosition
    STZ.W Layer1YSubPosition

+   LDA.W RoomHeightScrolls : DEC : XBA
    CLC : ADC.W PositionOfScrollBoundary : STA.W RoomHeightInPixels
    CMP.W Layer1YPosition : BCC .setLayer1Y
    LDA.B DP_Temp14 : CLC : ADC.W RoomWidthScrolls : TAX
    LDA.L Scrolls,X : AND.W #$00FF : BNE .return
    LDA.W Layer1YPosition : AND.W #$FF00 : CLC : ADC.W PositionOfScrollBoundary : STA.W UpperScrollPosition
    CMP.W Layer1YPosition : BCS .return

  .setLayer1Y:
    LDA.W ProposedScrolledLayer1XPosition : SEC : SBC.W CameraYSpeed : SBC.W #$0002
    CMP.W UpperScrollPosition : BPL +
    LDA.W UpperScrollPosition

+   STA.W Layer1YPosition

  .return:
    PLB : PLP
    RTL


;;; $A936: Handle scroll zones - scrolling up ;;;
HandleScrollZones_ScrollingUp:
; Called by:
;     $90:964F: Handle vertical scrolling
    PHP : PHB
    SEP #$20
    LDA.B #$8F : PHA : PLB
    REP #$30
    LDA.W Layer1YPosition : STA.W ProposedScrolledLayer1XPosition : CMP.W IdealLayer1YPosition : BPL +
    LDA.W IdealLayer1YPosition : STA.W Layer1YPosition
    STZ.W Layer1YSubPosition

+   LDA.W Layer1YPosition : BPL +
    STZ.W Layer1YPosition
    BRA .return

+   SEP #$20
    LDA.W Layer1YPosition+1 : STA.W $4202
    LDA.W RoomWidthScrolls : STA.W $4203
    REP #$20
    LDA.W Layer1XPosition : CLC : ADC.W #$0080 : XBA
    AND.W #$00FF : CLC : ADC.W $4216 : TAX
    LDA.L Scrolls,X : AND.W #$00FF : BNE .return
    LDA.W Layer1YPosition : AND.W #$FF00 : CLC : ADC.W #$0100 : STA.W PositionOfScrollBoundary
    LDA.W ProposedScrolledLayer1XPosition : CLC : ADC.W CameraYSpeed : ADC.W #$0002
    CMP.W PositionOfScrollBoundary : BCC +
    LDA.W PositionOfScrollBoundary

+   STA.W Layer1YPosition

  .return:
    PLB : PLP
    RTL


;;; $A9AC: Debug layer 1 position save/loading ;;;
Debug_Layer1Position_Saving_Loading:
    LDA.B DP_Controller2New : AND.W #$0040 : BEQ +
    INC.W Debug_Layer1PositionFlag

+   LDA.W Debug_Layer1PositionFlag : LSR : BCC +
    LDA.W Debug_Layer1X : STA.W Layer1XPosition
    LDA.W Debug_Layer1Y : STA.W Layer1YPosition
    RTL


+   LDA.W Layer1XPosition : STA.W Debug_Layer1X
    LDA.W Layer1YPosition : STA.W Debug_Layer1Y
    RTL


;;; $A9D6: Update background data column ;;;
UpdateBackgroundDataColumn:
; Called by:
;     $A176: Display the viewable part of the room
;     $A3DF: Update BG graphics when scrolling
    LDX.W #$001C
    BRA UpdateLevelBackgroundDataColumn


;;; $A9DB: Update level data column ;;;
UpdateLevelDataColumn:
; Called by:
;     $A176: Display the viewable part of the room
;     $A3DF: Update BG graphics when scrolling
    LDX.W #$0000
; fallthrough to UpdateLevelBackgroundDataColumn


;;; $A9DE: Update level/background data column ;;;
UpdateLevelBackgroundDataColumn:
;; Parameters:
;;     X: WRAM offset. 0 for level data, 1Ch for background data. See BG1Col_unwrappedTilemapVRAMUpdateSize in RAM map

; Called by:
;     $A9D6: Update background data column
;     $A9DB: Update level data column

; VRAM is allocated 32x16 blocks (64x32 VRAM blocks) of space (2 screens)
; The visible part of the room spans 16x14 blocks
; Suppose we have a 2x2 screen room, that's 32x32 blocks (64x64 VRAM blocks)
; Suppose the room was loaded from the top-left and has been scrolled to position (8,8) (in blocks)
; Initially the memory layout of the level data and VRAM mirror each other (broadly speaking)
; As the screen is being scrolled down, rows of blocks are loaded and placed after the end of where the previous last row of blocks is
; Note that the previous top row of blocks isn't erased and the VRAM data isn't "moved up" in memory, the BG1/BG2 scroll registers are incremented instead
; If the bottom of the VRAM has been reached, the blocks are loaded to the top of VRAM instead, so there's a pacman-esque wrapping behaviour

; When loading a new column of data (due to scrolling horizontally), the column will have to be loaded in two parts (if the visible screen is vertically wrapped in VRAM)
; The first part is the top of the visible screen corresponding to the bottom part in VRAM
; The second part is the remaining bottom part of the visible screen corresponding to the wrapped top part in VRAM

; The diagram below is attempting to show this correspondence graphically, each character is 2x2 blocks (4x4 VRAM blocks)
; # blocks are whatever off-screen blocks
; O blocks are whatever on-screen blocks
; * blocks are the blocks that are being loaded by this routine
; @ blocks (in VRAM) are whatever garbage that exists in VRAM because the screen hasn't been scrolled far enough right

;             Level data            =>              VRAM
;   0 1 2 3 4 5 6 7 8 9 A B C D E F    0 1 2 3 4 5 6 7 8 9 A B C D E F
; 0 # # # # # # # # # # # # # # # #    # # # # O O O * O O O O @ @ @ @ \
; 1 # # # # # # # # # # # # # # # #    # # # # O O O * O O O O @ @ @ @ } The bottom section of the visible screen
; 2 # # # # # # # # # # # # # # # #    # # # # O O O O O O O O @ @ @ @ /
; 3 # # # # # # # # # # # # # # # #    # # # # # # # # # # # # @ @ @ @ <-- The row above the visible part of the screen
; 4 # # # # O O O O O O O O # # # #    # # # # O O O O O O O O @ @ @ @ \
; 5 # # # # O O O O O O O O # # # #    # # # # O O O O O O O O @ @ @ @ |
; 6 # # # # O O O * O O O O # # # #    # # # # O O O * O O O O @ @ @ @ } The top section of the visible screen
; 7 # # # # O O O * O O O O # # # #    # # # # O O O * O O O O @ @ @ @ /
; 8 # # # # O O O * O O O O # # # #
; 9 # # # # O O O * O O O O # # # #
; A # # # # O O O O O O O O # # # #
; B # # # # # # # # # # # # # # # #
; C # # # # # # # # # # # # # # # #
; D # # # # # # # # # # # # # # # #
; E # # # # # # # # # # # # # # # #
; F # # # # # # # # # # # # # # # #
    LDA.W Mode7Flag : BEQ +
    RTS

+   PHP
    SEP #$20
    LDA.W RoomWidthBlocks : STA.W $4202
    LDA.W BlocksToUpdateYBlock : STA.W $4203
    PHB
    REP #$30
    LDA.W BlocksToUpdateXBlock : CLC : ADC.W $4216
    ASL : CLC : ADC.W #$0002 : TXY : BEQ +
    CLC : ADC.W #CustomBackground-2

+   STA.B DP_BlocksToUpdate
    LDA.W #CustomBackground>>16 : STA.B DP_BlocksToUpdate+2
    LDA.W VRAMBlocksToUpdateYBlock : ASL #2 : AND.W #$003C : STA.W BG1Col_wrappedTilemapVRAMUpdateSize,X
    EOR.W #$003F : INC : STA.W BG1Col_unwrappedTilemapVRAMUpdateSize,X
    SEP #$20
    LDA.W VRAMBlocksToUpdateYBlock : AND.B #$0F : STA.W $4202
    LDA.B #$40 : STA.W $4203
    REP #$20
    LDA.W VRAMBlocksToUpdateXBlock : AND.W #$001F : STA.W XBlockOfVRAMBlocksToUpdate
    ASL : CLC : ADC.W $4216 : STA.W PositionOfScrollBoundary
    LDA.W #$5000
    LDY.W XBlockOfVRAMBlocksToUpdate : CPY.W #$0010 : BCC +
    LDA.W #$53E0

+   TXY : BEQ +
    SEC : SBC.W SizeOfBG2

+   STA.W VRAMTilemapScreenBaseAddr
    CLC : ADC.W PositionOfScrollBoundary : STA.W BG1Col_unwrappedTilemapVRAMUpdateDest,X
    LDA.W VRAMTilemapScreenBaseAddr : CLC : ADC.W XBlockOfVRAMBlocksToUpdate
    ADC.W XBlockOfVRAMBlocksToUpdate : STA.W BG1Col_wrappedTilemapVRAMUpdateDest,X
    LDA.W #BG1ColumnUpdateTilemapLeftHalves
    LDY.W #$0000
    CPX.W #$0000 : BEQ +
    LDA.W #BG2ColumnUpdateTilemapLeftHalves
    LDY.W #$0108

+   CLC : ADC.W BG1Col_unwrappedTilemapVRAMUpdateSize,X : STA.W BG1Col_wrappedTilemapVRAMUpdateLeftHalvesSrc,X
    CLC : ADC.W #$0040 : STA.W BG1Col_wrappedTilemapVRAMUpdateRightHalvesSrc,X
    STY.W VRAMTilemapScreenBaseAddr
    SEP #$20
    LDA.B #BG1ColumnUpdateTilemapLeftHalves>>16 : PHA : PLB
    REP #$20
    PHX
    LDY.W #$0000
    LDA.W #$0010 : STA.W ProposedScrolledLayer1XPosition

  .loop:
    LDA.B [DP_BlocksToUpdate],Y : STA.W BackgroundBlockToUpdate
    AND.W #$03FF : ASL #3 : TAX
    PHY
    LDY.W VRAMTilemapScreenBaseAddr
    LDA.W BackgroundBlockToUpdate : AND.W #$0C00 : BNE +
    LDA.W TileTable_topLeft,X : STA.W BG1ColumnUpdateTilemapLeftHalves,Y
    LDA.W TileTable_topRight,X : STA.W BG1ColumnUpdateTilemapRightHalves,Y
    LDA.W TileTable_bottomLeft,X : STA.W BG1ColumnUpdateTilemapLeftHalves+2,Y
    LDA.W TileTable_bottomRight,X : STA.W BG1ColumnUpdateTilemapRightHalves+2,Y
    JMP .next

+   CMP.W #$0400 : BNE +
    LDA.W TileTable_topRight,X : EOR.W #$4000 : STA.W BG1ColumnUpdateTilemapLeftHalves,Y
    LDA.W TileTable_topLeft,X : EOR.W #$4000 : STA.W BG1ColumnUpdateTilemapRightHalves,Y
    LDA.W TileTable_bottomRight,X : EOR.W #$4000 : STA.W BG1ColumnUpdateTilemapLeftHalves+2,Y
    LDA.W TileTable_bottomLeft,X : EOR.W #$4000 : STA.W BG1ColumnUpdateTilemapRightHalves+2,Y
    BRA .next

+   CMP.W #$0800 : BNE +
    LDA.W TileTable_bottomLeft,X : EOR.W #$8000 : STA.W BG1ColumnUpdateTilemapLeftHalves,Y
    LDA.W TileTable_bottomRight,X : EOR.W #$8000 : STA.W BG1ColumnUpdateTilemapRightHalves,Y
    LDA.W TileTable_topLeft,X : EOR.W #$8000 : STA.W BG1ColumnUpdateTilemapLeftHalves+2,Y
    LDA.W TileTable_topRight,X : EOR.W #$8000 : STA.W BG1ColumnUpdateTilemapRightHalves+2,Y
    BRA .next

+   LDA.W TileTable_bottomRight,X : EOR.W #$C000 : STA.W BG1ColumnUpdateTilemapLeftHalves,Y
    LDA.W TileTable_bottomLeft,X : EOR.W #$C000 : STA.W BG1ColumnUpdateTilemapRightHalves,Y
    LDA.W TileTable_topRight,X : EOR.W #$C000 : STA.W BG1ColumnUpdateTilemapLeftHalves+2,Y
    LDA.W TileTable_topLeft,X : EOR.W #$C000 : STA.W BG1ColumnUpdateTilemapRightHalves+2,Y

  .next:
    INY #4
    STY.W VRAMTilemapScreenBaseAddr
    PLA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAY
    DEC.W ProposedScrolledLayer1XPosition : BEQ .return
    JMP .loop

  .return:
    PLX
    INC.W BG1Col_updateVRAMTilemapFlag,X
    PLB : PLP
    RTS


;;; $AB70: Update background data row ;;;
UpdateBackgroundDataRow:
; Called by:
;     $A3DF: Update BG graphics when scrolling
    LDX.W #$001C
    BRA UpdateBackgroundLevelDataRow


;;; $AB75: Update level data row ;;;
UpdateLevelDataRow:
; Called by:
;     $A3DF: Update BG graphics when scrolling
    LDX.W #$0000
; fallthrough to UpdateBackgroundLevelDataRow


;;; $AB78: Update level/background data row ;;;
UpdateBackgroundLevelDataRow:
;; Parameters:
;;     X: WRAM offset. 0 for level data, 1Ch for background data. See BG1Row_unwrappedTilemapVRAMUpdateSize in RAM map

; Called by:
;     $AB70: Update background data row
;     $AB75: Update level data row
    LDA.W Mode7Flag : BEQ +
    RTS

+   PHP
    SEP #$20
    LDA.W RoomWidthBlocks : STA.W $4202
    LDA.W BlocksToUpdateYBlock : STA.W $4203
    PHB
    REP #$30
    LDA.W BlocksToUpdateXBlock : CLC : ADC.W $4216
    ASL : CLC : ADC.W #$0002
    TXY : BEQ +
    CLC : ADC.W #CustomBackground-2

+   STA.B DP_BlocksToUpdate
    LDA.W #CustomBackground>>16 : STA.B DP_BlocksToUpdate+2
    LDA.W VRAMBlocksToUpdateXBlock : AND.W #$000F : STA.W PositionOfScrollBoundary
    LDA.W #$0010 : SEC : SBC.W PositionOfScrollBoundary : ASL #2 : STA.W BG1Row_unwrappedTilemapVRAMUpdateSize,X
    LDA.W PositionOfScrollBoundary : INC : ASL #2 : STA.W BG1Row_wrappedTilemapVRAMUpdateSize,X
    SEP #$20
    LDA.W VRAMBlocksToUpdateYBlock : AND.B #$0F : STA.W $4202
    LDA.B #$40 : STA.W $4203
    REP #$20
    LDA.W VRAMBlocksToUpdateXBlock : AND.W #$001F : STA.W XBlockOfVRAMBlocksToUpdate
    ASL : CLC : ADC.W $4216 : STA.W PositionOfScrollBoundary
    LDA.W #$5400 : STA.W VRAMTilemapScreenBaseAddr
    LDA.W #$5000
    LDY.W XBlockOfVRAMBlocksToUpdate : CPY.W #$0010 : BCC +
    LDA.W #$5000 : STA.W VRAMTilemapScreenBaseAddr
    LDA.W #$53E0

+   TXY : BEQ +
    SEC : SBC.W SizeOfBG2

+   CLC : ADC.W PositionOfScrollBoundary : STA.W BG1Row_unwrappedTilemapVRAMUpdateDest,X
    LDA.W VRAMTilemapScreenBaseAddr
    TXY : BEQ +
    SEC : SBC.W SizeOfBG2

+   CLC : ADC.W $4216 : STA.W BG1Row_wrappedTilemapVRAMUpdateDest,X
    LDA.W #BG1RowUpdateTilemapTopHalves
    LDY.W #$0000
    CPX.W #$0000 : BEQ +
    LDA.W #BG2RowUpdateTilemapTopHalves
    LDY.W #$0108

+   CLC : ADC.W BG1Row_unwrappedTilemapVRAMUpdateSize,X : STA.W BG1Row_wrappedTilemapVRAMUpdateLeftHalvesSrc,X
    CLC : ADC.W #$0044 : STA.W BG1Row_wrappedTilemapVRAMUpdateRightHalvesSrc,X
    STY.W VRAMTilemapScreenBaseAddr
    SEP #$20
    LDA.B #TileTable>>16 : PHA : PLB
    REP #$20
    PHX
    LDY.W #$0000
    LDA.W #$0011 : STA.W ProposedScrolledLayer1XPosition

  .loop:
    LDA.B [DP_BlocksToUpdate],Y : STA.W BackgroundBlockToUpdate
    AND.W #$03FF : ASL #3 : TAX
    PHY
    LDY.W VRAMTilemapScreenBaseAddr
    LDA.W BackgroundBlockToUpdate : AND.W #$0C00 : BNE +
    LDA.W TileTable_topLeft,X : STA.W BG1RowUpdateTilemapTopHalves,Y
    LDA.W TileTable_topRight,X : STA.W BG1RowUpdateTilemapTopHalves+2,Y
    LDA.W TileTable_bottomLeft,X : STA.W BG1RowUpdateTilemapBottomHalves,Y
    LDA.W TileTable_bottomRight,X : STA.W BG1RowUpdateTilemapBottomHalves+2,Y
    JMP .next

+   CMP.W #$0400 : BNE +
    LDA.W TileTable_topRight,X : EOR.W #$4000 : STA.W BG1RowUpdateTilemapTopHalves,Y
    LDA.W TileTable_topLeft,X : EOR.W #$4000 : STA.W BG1RowUpdateTilemapTopHalves+2,Y
    LDA.W TileTable_bottomRight,X : EOR.W #$4000 : STA.W BG1RowUpdateTilemapBottomHalves,Y
    LDA.W TileTable_bottomLeft,X : EOR.W #$4000 : STA.W BG1RowUpdateTilemapBottomHalves+2,Y
    BRA .next

+   CMP.W #$0800 : BNE +
    LDA.W TileTable_bottomLeft,X : EOR.W #$8000 : STA.W BG1RowUpdateTilemapTopHalves,Y
    LDA.W TileTable_bottomRight,X : EOR.W #$8000 : STA.W BG1RowUpdateTilemapTopHalves+2,Y
    LDA.W TileTable_topLeft,X : EOR.W #$8000 : STA.W BG1RowUpdateTilemapBottomHalves,Y
    LDA.W TileTable_topRight,X : EOR.W #$8000 : STA.W BG1RowUpdateTilemapBottomHalves+2,Y
    BRA .next

+   LDA.W TileTable_bottomRight,X : EOR.W #$C000 : STA.W BG1RowUpdateTilemapTopHalves,Y
    LDA.W TileTable_bottomLeft,X : EOR.W #$C000 : STA.W BG1RowUpdateTilemapTopHalves+2,Y
    LDA.W TileTable_topRight,X : EOR.W #$C000 : STA.W BG1RowUpdateTilemapBottomHalves,Y
    LDA.W TileTable_topLeft,X : EOR.W #$C000 : STA.W BG1RowUpdateTilemapBottomHalves+2,Y

  .next:
    INY #4 : STY.W VRAMTilemapScreenBaseAddr
    PLY : INY #2
    DEC.W ProposedScrolledLayer1XPosition : BEQ .return
    JMP .loop

  .return:
    PLX
    INC.W BG1Row_updateVRAMTilemapFlag,X
    PLB : PLP
    RTS


;;; $AD1D: Draw top row of screen for upwards door transition ;;;
DrawTopRowOfScreenForUpwardsDoorTransition:
; Called by:
;     $82:E353: Door transition function - fix doors moving up

; See DoorTransitionScrolling_Up
    STZ.W DoorTransitionFrameCounter
    JSR Calculate_BGScroll_LayerPositionBlocks
    JSR UpdatePreviousLayerBlocks
    INC.W PreviousLayer1YBlock : INC.W PreviousLayer2YBlock
    JSR DoorTransitionScrolling_Up
    RTL


;;; $AD30: Door transition scrolling setup ;;;
DoorTransitionScrollingSetup:
; Called by:
;     $82:E38E: Door transition function - set up scrolling
    REP #$30
    LDA.W DoorDestinationXPosition : STA.W Layer1XPosition
    LDA.W DoorDestinationYPosition : STA.W Layer1YPosition
    LDA.W DoorDirection : AND.W #$0003 : ASL : TAX
    JSR.W (Door_Transition_Scrolling_Setup_Pointers,X)
    RTL


;;; $AD4A: Door transition scrolling setup - right ;;;
DoorTransitionScrollingSetup_Right:
    JSR CalculateLayer2XPosition
    SEC : SBC.W #$0100 : STA.W Layer2XPosition
    JSR CalculateLayer2YPosition
    LDA.W Layer1XPosition : SEC : SBC.W #$0100 : STA.W Layer1XPosition
    JSR UpdateBGScrollOffsets
    JSR Calculate_BGScroll_LayerPositionBlocks
    JSR UpdatePreviousLayerBlocks
    DEC.W PreviousLayer1XBlock : DEC.W PreviousLayer2XBlock
    JSR DoorTransitionScrolling_Right
    RTS


;;; $AD74: Door transition scrolling setup - left ;;;
DoorTransitionScrollingSetup_Left:
    JSR CalculateLayer2XPosition
    CLC : ADC.W #$0100 : STA.W Layer2XPosition
    JSR CalculateLayer2YPosition
    LDA.W Layer1XPosition : CLC : ADC.W #$0100 : STA.W Layer1XPosition
    JSR UpdateBGScrollOffsets
    JSR Calculate_BGScroll_LayerPositionBlocks
    JSR UpdatePreviousLayerBlocks
    INC.W PreviousLayer1XBlock : INC.W PreviousLayer2XBlock
    JSR DoorTransitionScrolling_Left
    RTS


;;; $AD9E: Door transition scrolling setup - down ;;;
DoorTransitionScrollingSetup_Down:
    JSR CalculateLayer2XPosition
    JSR CalculateLayer2YPosition
    SEC : SBC.W #$00E0 : STA.W Layer2YPosition
    LDA.W Layer1YPosition : SEC : SBC.W #$00E0 : STA.W Layer1YPosition
    JSR UpdateBGScrollOffsets
    JSR Calculate_BGScroll_LayerPositionBlocks
    JSR UpdatePreviousLayerBlocks
    DEC.W PreviousLayer1YBlock : DEC.W PreviousLayer2YBlock
    JSR DoorTransitionScrolling_Down
    RTS


;;; $ADC8: Door transition scrolling setup - up ;;;
DoorTransitionScrollingSetup_Up:
    JSR CalculateLayer2XPosition
    LDA.W Layer1YPosition : PHA
    CLC : ADC.W #$001F : STA.W Layer1YPosition
    JSR CalculateLayer2YPosition
    CLC : ADC.W #$00E0 : STA.W Layer2YPosition
    PLA : CLC : ADC.W #$0100 : STA.W Layer1YPosition
    JSR UpdateBGScrollOffsets
    LDA.W DoorDestinationYPosition : CLC : ADC.W #$0020 : STA.W DoorDestinationYPosition
    JSR Calculate_BGScroll_LayerPositionBlocks
    JSR UpdatePreviousLayerBlocks
    INC.W PreviousLayer1YBlock : INC.W PreviousLayer2YBlock
    DEC.W Layer1YPosition
    JSR DoorTransitionScrolling_Up
    RTS


;;; $AE08: Pointers to door transition scrolling setup code ;;;
Door_Transition_Scrolling_Setup_Pointers:
    dw DoorTransitionScrollingSetup_Right
    dw DoorTransitionScrollingSetup_Left
    dw DoorTransitionScrollingSetup_Down
    dw DoorTransitionScrollingSetup_Up


;;; $AE10: Update previous layer blocks ;;;
UpdatePreviousLayerBlocks:
    LDA.W Layer1XBlock : STA.W PreviousLayer1XBlock
    LDA.W Layer2XBlock : STA.W PreviousLayer2XBlock
    LDA.W Layer1YBlock : STA.W PreviousLayer1YBlock
    LDA.W Layer2YBlock : STA.W PreviousLayer2YBlock
    RTS


;;; $AE29: Update BG scroll offsets ;;;
UpdateBGScrollOffsets:
; Called by:
;     $AD4A: Door transition scrolling setup - right
;     $AD74: Door transition scrolling setup - left
;     $AD9E: Door transition scrolling setup - down
;     $ADC8: Door transition scrolling setup - up
    LDA.B DP_BG1XScroll : SEC : SBC.W Layer1XPosition : STA.W Layer2ScrollY+1
    LDA.B DP_BG1YScroll : SEC : SBC.W Layer1YPosition : STA.W BG1YOffset
    LDA.B DP_BG2XScroll : SEC : SBC.W Layer1XPosition : STA.W BG2XOffset
    LDA.B DP_BG2YScroll : SEC : SBC.W Layer1YPosition : STA.W BG2YOffset
    RTS


;;; $AE4E: Door transition scrolling ;;;
DoorTransitionScrolling:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W DoorDirection : AND.W #$0003 : ASL : TAX
    JSR.W (.pointers,X)
    BCC .return
    LDA.W DoorDestinationXPosition : STA.W Layer1XPosition
    LDA.W DoorDestinationYPosition : STA.W Layer1YPosition
    LDA.W #$8000 : TSB.W DoorTransitionFinishScrolling

  .return:
    PLB : PLP
    RTL

  .pointers:
    dw DoorTransitionScrolling_Right
    dw DoorTransitionScrolling_Left
    dw DoorTransitionScrolling_Down
    dw DoorTransitionScrolling_Up


;;; $AE7E: Door transition scrolling - right ;;;
DoorTransitionScrolling_Right:
;; Returns:
;;     Carry: Set if finished scrolling, clear otherwise
    LDX.W DoorTransitionFrameCounter : PHX
    LDA.W SamusXSubPosition : CLC : ADC.W SamusSubSpeedDuringDoorTransition : STA.W SamusXSubPosition
    LDA.W SamusXPosition : ADC.W SamusSpeedDuringDoorTransition : STA.W SamusXPosition : STA.W SamusPreviousXPosition
    LDA.W Layer1XPosition : CLC : ADC.W #$0004 : STA.W Layer1XPosition
    LDA.W Layer2XPosition : CLC : ADC.W #$0004 : STA.W Layer2XPosition
    JSL CalculateBGScrolls_UpdateBGGraphics_WhenScrolling
    PLX : INX : STX.W DoorTransitionFrameCounter : CPX.W #$0040 : BNE +
    JSL CalculateBGScrolls_UpdateBGGraphics_WhenScrolling
    SEC
    RTS

+   CLC
    RTS


;;; $AEC2: Door transition scrolling - left ;;;
DoorTransitionScrolling_Left:
;; Returns:
;;     Carry: Set if finished scrolling, clear otherwise
    LDX.W DoorTransitionFrameCounter : PHX
    LDA.W SamusXSubPosition : SEC : SBC.W SamusSubSpeedDuringDoorTransition : STA.W SamusXSubPosition
    LDA.W SamusXPosition : SBC.W SamusSpeedDuringDoorTransition : STA.W SamusXPosition : STA.W SamusPreviousXPosition
    LDA.W Layer1XPosition : SEC : SBC.W #$0004 : STA.W Layer1XPosition
    LDA.W Layer2XPosition : SEC : SBC.W #$0004 : STA.W Layer2XPosition
    JSL CalculateBGScrolls_UpdateBGGraphics_WhenScrolling
    PLX : INX : STX.W DoorTransitionFrameCounter : CPX.W #$0040 : BNE +
    SEC
    RTS

+   CLC
    RTS


;;; $AF02: Door transition scrolling - down ;;;
DoorTransitionScrolling_Down:
;; Returns:
;;     Carry: Set if finished scrolling, clear otherwise

; Spends 1 frame drawing the top row of the new room
; Then spends 38h frames doing the scrolling (38h frames * 4px/frame = 224px)

; The reason the top row of the new room isn't drawn by scrolling is that vertical scrolling loads one row ahead below the screen
; In other words, there's always a tilemap row loaded that's fully off-screen below the visible tilemap
; So prior to the door transition when the camera is scrolled to the edge of a scroll,
; it has already loaded the row below the door into the tilemap (which is garbage if the door was at a room boundary)
; Any further scrolling would work on the assumption that row has been loaded already, and that row is the top row of the destination room

; tldr: need to redraw the top row to replace the garbage
    LDX.W DoorTransitionFrameCounter : PHX : BNE +
    LDA.B DP_BG1YScroll : PHA
    LDA.B DP_BG2YScroll : PHA
    LDA.W Layer1YPosition : PHA
    SEC : SBC.W #$000F : STA.W Layer1YPosition
    LDA.W Layer2YPosition : PHA
    SEC : SBC.W #$000F : STA.W Layer2YPosition
    JSR Calculate_BGScroll_LayerPositionBlocks
    JSR UpdatePreviousLayerBlocks
    DEC.W PreviousLayer1YBlock : DEC.W PreviousLayer2YBlock
    JSL CalculateBGScrolls_UpdateBGGraphics_WhenScrolling
    PLA : STA.W Layer2YPosition
    PLA : STA.W Layer1YPosition
    PLA : STA.B DP_BG2YScroll
    PLA : STA.B DP_BG1YScroll
    BRA .finish

+   CPX.W #$0039 : BCS .finish
    LDA.W SamusYSubPosition : CLC : ADC.W SamusSubSpeedDuringDoorTransition : STA.W SamusYSubPosition
    LDA.W SamusYPosition : ADC.W SamusSpeedDuringDoorTransition : STA.W SamusYPosition : STA.W SamusPreviousYPosition
    LDA.W Layer1YPosition : CLC : ADC.W #$0004 : STA.W Layer1YPosition
    LDA.W Layer2YPosition : CLC : ADC.W #$0004 : STA.W Layer2YPosition
    JSL CalculateBGScrolls_UpdateBGGraphics_WhenScrolling

  .finish:
    PLX : INX : STX.W DoorTransitionFrameCounter : CPX.W #$0039 : BCC +
    JSL CalculateBGScrolls_UpdateBGGraphics_WhenScrolling
    SEC
    RTS

+   CLC
    RTS


;;; $AF89: Door transition scrolling - up ;;;
DoorTransitionScrolling_Up:
;; Returns:
;;     Carry: Set if finished scrolling, clear otherwise

; This routine - unlike the other three door transition directions - is called once prior to the destination room being loaded (via $AD1D)
; The reason for this is to load the tilemap for the top row of the scroll, which hasn't yet been loaded by the scrolling routine
; After the destination room has been loaded and the screen starts scrolling, on frames 1..4 don't call the scrolling routine,
; as that would load the tilemap according to the destination room, which would be the row below the scroll you're going to (likely garbage)
; Of course there doesn't need to be any updates due to scrolling because the row was already loaded manually on frame 0
; Then scrolling as per usual for the remaining 34h frames (38h frames * 4px/frame = 224px)

; tldr: need to load top row and not overwrite that row in the next room
; I'm fairly sure all of this could have been avoided if the vertical scrolling tilemap did updates to rows 0..Fh instead of 1..Fh (see $80:A45E)
    LDX.W DoorTransitionFrameCounter : PHX : BNE +
    LDA.B DP_BG1YScroll : PHA
    LDA.B DP_BG2YScroll : PHA
    LDA.W Layer1YPosition : PHA
    SEC : SBC.W #$0010 : STA.W Layer1YPosition
    LDA.W Layer2YPosition : PHA
    SEC : SBC.W #$0010 : STA.W Layer2YPosition
    JSR Calculate_BGScroll_LayerPositionBlocks
    JSR UpdatePreviousLayerBlocks
    INC.W PreviousLayer1YBlock : INC.W PreviousLayer2YBlock
    JSL CalculateBGScrolls_UpdateBGGraphics_WhenScrolling
    PLA : STA.W Layer2YPosition
    PLA : STA.W Layer1YPosition
    PLA : STA.B DP_BG2YScroll
    PLA : STA.B DP_BG1YScroll
    BRA .done

+   LDA.W SamusYSubPosition : SEC : SBC.W SamusSubSpeedDuringDoorTransition : STA.W SamusYSubPosition
    LDA.W SamusYPosition : SBC.W SamusSpeedDuringDoorTransition : STA.W SamusYPosition : STA.W SamusPreviousYPosition
    LDA.W Layer1YPosition : SEC : SBC.W #$0004 : STA.W Layer1YPosition
    LDA.W Layer2YPosition : SEC : SBC.W #$0004 : STA.W Layer2YPosition
    CPX.W #$0005 : BCS +
    LDA.W Layer1XPosition : CLC : ADC.W Layer2ScrollY+1 : STA.B DP_BG1XScroll
    LDA.W Layer1YPosition : CLC : ADC.W BG1YOffset : STA.B DP_BG1YScroll
    LDA.W Layer2XPosition : CLC : ADC.W BG2XOffset : STA.B DP_BG2XScroll
    LDA.W Layer2YPosition : CLC : ADC.W BG2YOffset : STA.B DP_BG2YScroll
    BRA .done

+   JSL CalculateBGScrolls_UpdateBGGraphics_WhenScrolling

  .done:
    PLX : INX : STX.W DoorTransitionFrameCounter : CPX.W #$0039 : BNE +
    SEC
    RTS

+   CLC
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $B032: Unused. Set up rotating mode 7 background ;;;
UNUSED_SetupRotatingMode7Background_80B032:
; Uses data from $98 that doesn't exist anymore
    LDA.W #$0001 : STA.W Mode7Flag
    LDA.W Mode7Flag : BNE + ; >_<
    SEC ; dead code
    RTL

+   JSL SetForceBlankAndWaitForNMI
    LDA.W #$0080 : STA.W $2115
    STZ.W $2116
    LDA.W #$1900 : STA.W $4310
    LDA.W #$8000 : STA.W $4312
    LDA.W #$4000 : STA.W $4315
    SEP #$20
    LDA.B #$98 : STA.W $4314
    LDA.B #$02 : STA.W $420B
    STZ.W $2115 : STZ.W $2116 : STZ.W $2117
    LDX.W #$4000

  .loopClearLowBytes:
    STZ.W $2118
    DEX : BNE .loopClearLowBytes
    LDY.W #$0000 : TYX

  .loop:
    STY.W $2116
    PHY
    LDY.W #$0020

  .innerLoop:
    LDA.L $98C000,X : STA.W $2118 ; data doesn't exist in final release?
    INX
    DEY : BNE .innerLoop
    REP #$20
    PLA : CLC : ADC.W #$0080 : TAY
    SEP #$20
    CPX.W #$0400 : BNE .loop
    LDA.B #$07 : STA.B DP_BGModeSize
    REP #$20
    LDA.W #$0100 : STA.B DP_Mode7TransMatrixA
    STZ.B DP_Mode7TransMatrixB : STZ.B DP_Mode7TransMatrixC : STA.B DP_Mode7TransMatrixD
    LDA.W #$0080 : STA.B DP_Mode7TransOriginX : STA.B DP_Mode7TransOriginY
    STZ.W UnusedMode7RotationAngle
    JSL ClearForceBlankAndWaitForNMI
    SEC
    RTL


;;; $B0C2: Unused. Configure mode 7 rotation matrix ;;;
UNUSED_ConfigureMode7RotationMatrix_80B0C2:
    PHP
    REP #$30
    LDA.W Mode7Flag : BEQ .return
    LDA.W NMI_FrameCounter : AND.W #$0007 : BNE .return
    LDA.W UnusedMode7RotationAngle : AND.W #$00FF : ASL : TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.B DP_Mode7TransMatrixB
    EOR.W #$FFFF : INC : STA.B DP_Mode7TransMatrixC
    LDA.W UnusedMode7RotationAngle : CLC : ADC.W #$0040 : AND.W #$00FF : ASL : TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.B DP_Mode7TransMatrixA : STA.B DP_Mode7TransMatrixD
    INC.W UnusedMode7RotationAngle

  .return:
    PLP
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B119: Decompression - variable destination ;;;
Decompression_HardcodedDestination:
;; Parameters:
;;     $47: Source address (3 bytes)
;;     $4C: Destination address (3 bytes)

; Source may overflow bank, target may NOT
    LDA.B $02,S : STA.B DP_ReturnParam+1
    LDA.B $01,S : STA.B DP_ReturnParam
    CLC : ADC.W #$0003 : STA.B $01,S
    LDY.W #$0001
    LDA.B [DP_ReturnParam],Y : STA.B DP_DecompDest
    INY
    LDA.B [DP_ReturnParam],Y : STA.B DP_DecompDest+1
; fallthrough to Decompression_VariableDestination


;;; $B119: Decompression - variable destination ;;;
Decompression_VariableDestination:
;; Parameters:
;;     $47: Source address (3 bytes)
;;     $4C: Destination address (3 bytes)

; Source may overflow bank, target may NOT
    PHP : PHB
    SEP #$20 : REP #$10
    LDA.B DP_DecompSrc+2 : PHA : PLB
    STZ.B DP_DecompDictCopyBit+1
    LDY.W #$0000

  .loopMain:
    PHX
    LDX.B DP_DecompSrc
    LDA.W $0000,X
    INX : BNE +
    JSR SourceBankOverflowCorrection

+   STX.B DP_DecompSrc
    PLX
    STA.B DP_DecompVar
    CMP.B #$FF : BNE +
    PLB : PLP
    RTL

+   AND.B #$E0 : CMP.B #$E0 : BNE .pushCommandBits
    LDA.B DP_DecompVar : ASL #3 : AND.B #$E0 : PHA
    LDA.B DP_DecompVar : AND.B #$03
    XBA
    PHX
    LDX.B DP_DecompSrc
    LDA.W $0000,X
    INX : BNE +
    JSR SourceBankOverflowCorrection

+   STX.B DP_DecompSrc
    PLX
    BRA +

  .pushCommandBits:
    PHA
    LDA.B #$00 : XBA
    LDA.B DP_DecompVar : AND.B #$1F

+   TAX : INX
    PLA : CMP.B #$00 : BPL +
    JMP .dictionaryVariant

+   CMP.B #$20 : BEQ .byteFill
    CMP.B #$40 : BEQ .wordFill
    CMP.B #$60 : BEQ .incrementingFill

  .loopDirectCopy:
    ; Command 0: Direct copy
    PHX
    LDX.B DP_DecompSrc
    LDA.W $0000,X
    INX : BNE +
    JSR SourceBankOverflowCorrection

+   STX.B DP_DecompSrc
    PLX
    STA.B [DP_DecompDest],Y
    INY
    DEX : BNE .loopDirectCopy
    BEQ .loopMain

  .byteFill:
    ; Command 1: Byte fill
    PHX
    LDX.B DP_DecompSrc
    LDA.W $0000,X
    INX : BNE +
    JSR SourceBankOverflowCorrection

+   STX.B DP_DecompSrc
    PLX

  .loopByteFill:
    STA.B [DP_DecompDest],Y
    INY
    DEX : BNE .loopByteFill
    JMP .loopMain

  .wordFill:
    ; Command 2: Word fill
    PHX
    LDX.B DP_DecompSrc
    LDA.W $0000,X
    INX : BNE +
    JSR SourceBankOverflowCorrection

+   STX.B DP_DecompSrc
    PLX
    STA.B DP_DecompVar
    PHX
    LDX.B DP_DecompSrc
    LDA.W $0000,X
    INX : BNE +
    JSR SourceBankOverflowCorrection

+   STX.B DP_DecompSrc
    PLX
    STA.B DP_DecompVar+1

  .loopWordFill:
    LDA.B DP_DecompVar : STA.B [DP_DecompDest],Y
    INY
    DEX : BEQ .goto_loopMain
    LDA.B DP_DecompVar+1 : STA.B [DP_DecompDest],Y
    INY
    DEX : BNE .loopWordFill

  .goto_loopMain:
    JMP .loopMain

  .incrementingFill:
    ; Command 3: Incrementing fill
    PHX
    LDX.B DP_DecompSrc
    LDA.W $0000,X
    INX : BNE +
    JSR SourceBankOverflowCorrection

+   STX.B DP_DecompSrc
    PLX

  .loopIncrementingFill:
    STA.B [DP_DecompDest],Y
    INC
    INY
    DEX : BNE .loopIncrementingFill
    JMP .loopMain

  .dictionaryVariant:
    ; Commands 4..7:
    CMP.B #$C0 : BCS .slidingDictionary
    ; Command 4 and 5: dictionary copy and inverted dictionary copy
    AND.B #$20 : STA.B DP_DecompDictCopyBit
    PHX
    LDX.B DP_DecompSrc
    LDA.W $0000,X
    INX : BNE +
    JSR SourceBankOverflowCorrection

+   STX.B DP_DecompSrc
    PLX
    STA.B DP_DecompVar
    PHX
    LDX.B DP_DecompSrc
    LDA.W $0000,X
    INX : BNE +
    JSR SourceBankOverflowCorrection

+   STX.B DP_DecompSrc
    PLX
    STA.B DP_DecompVar+1

  .dictionaryCopy:
    SEP #$20

  .loopDictionaryCopy:
    PHX : PHY
    LDY.B DP_DecompVar
    LDA.B [DP_DecompDest],Y
    INY : STY.B DP_DecompVar
    PLY
    LDX.B DP_DecompDictCopyBit : BEQ +
    EOR.B #$FF

+   STA.B [DP_DecompDest],Y
    INY
    PLX : DEX : BNE .loopDictionaryCopy
    JMP .loopMain

  .slidingDictionary:
; Command 6 and 7: sliding dictionary copy and inverted sliding dictionary copy
    AND.B #$20 : STA.B DP_DecompDictCopyBit
    PHX
    LDX.B DP_DecompSrc
    LDA.W $0000,X
    INX : BNE +
    JSR SourceBankOverflowCorrection

+   STX.B DP_DecompSrc
    PLX
    STA.B DP_DecompVar
    STZ.B DP_DecompVar+1
    REP #$20
    TYA : SEC : SBC.B DP_DecompVar : STA.B DP_DecompVar
    BRA .dictionaryCopy


;;; $B266: Source bank overflow correction ;;;
SourceBankOverflowCorrection:
;; Parameters:
;;     DB: Source bank
;; Returns:
;;     X: $8000
;;     DB: Incremented source bank
    LDX.W #$8000
    PHA
    PHB : PLA : INC : PHA : PLB
    PLA
    RTS


;;; $B271: Decompression to VRAM ;;;
DecompressionToVRAM:
;; Parameters:
;;     $47: Source address (3 bytes)
;;     $4C: Destination VRAM address * 2 (2 bytes) (must not be odd)

; VRAM destination address $2116 and VRAM increment mode $2115 must be set by the caller (ready for 16-bit access)!
    PHP : PHB
    REP #$10 : SEP #$20
    LDA.B DP_DecompSrc+2 : PHA : PLB
    STZ.B DP_DecompDictCopyBit+1
    LDY.B DP_DecompDest

  .loopMain:
    PHX
    LDX.B DP_DecompSrc
    LDA.W $0000,X
    INX : BNE +
    JSR SourceBankOverflowCorrection

+   STX.B DP_DecompSrc
    PLX
    STA.B DP_DecompVar
    CMP.B #$FF : BNE +
    PLB : PLP
    RTL

+   AND.B #$E0 : CMP.B #$E0 : BNE .pushCommandBits
    LDA.B DP_DecompVar
    ASL #3 : AND.B #$E0
    PHA
    LDA.B DP_DecompVar : AND.B #$03 : XBA
    PHX
    LDX.B DP_DecompSrc
    LDA.W $0000,X
    INX : BNE +
    JSR SourceBankOverflowCorrection

+   STX.B DP_DecompSrc
    PLX
    BRA +

  .pushCommandBits:
    PHA
    LDA.B #$00 : XBA
    LDA.B DP_DecompVar : AND.B #$1F

+   TAX : INX
    PLA : CMP.B #$00 : BPL +
    JMP .dictionaryVariant

+   CMP.B #$20 : BEQ .byteFill
    CMP.B #$40 : BEQ .wordFill
    CMP.B #$60 : BNE .loopDirectCopy
    JMP .incrementingFill

  .loopDirectCopy:
    ; Command 0: Direct copy
    PHX
    LDX.B DP_DecompSrc
    LDA.W $0000,X
    INX : BNE +
    JSR SourceBankOverflowCorrection

+   STX.B DP_DecompSrc
    PLX
    PHA
    TYA : LSR
    PLA
    BCS .VRAMDataWriteLow
    STA.L $002118
    BRA .VRAMDataWriteHigh

  .VRAMDataWriteLow:
    STA.L $002119

  .VRAMDataWriteHigh:
    INY
    DEX : BNE .loopDirectCopy
    JMP .loopMain

  .byteFill:
; Command 1: Byte fill
    PHX
    LDX.B DP_DecompSrc
    LDA.W $0000,X
    INX : BNE +
    JSR SourceBankOverflowCorrection

+   STX.B DP_DecompSrc
    PLX

  .loopByteFill:
    PHA
    TYA : LSR
    PLA
    BCS ..writeHigh
    STA.L $002118
    BRA ..writeLow

  ..writeHigh:
    STA.L $002119

  ..writeLow:
    INY
    DEX : BNE .loopByteFill
    JMP .loopMain

  .wordFill:
    ; Command 2: Word fill
    PHX
    LDX.B DP_DecompSrc
    LDA.W $0000,X
    INX : BNE +
    JSR SourceBankOverflowCorrection

+   STX.B DP_DecompSrc
    PLX
    STA.B DP_DecompVar
    PHX
    LDX.B DP_DecompSrc
    LDA.W $0000,X
    INX : BNE +
    JSR SourceBankOverflowCorrection

+   STX.B DP_DecompSrc
    PLX
    STA.B DP_DecompVar+1

  .loopWordFill:
    LDA.B DP_DecompVar
    PHA
    TYA : LSR
    PLA
    BCS ..writeHigh
    STA.L $002118
    BRA ..writeLow

  ..writeHigh:
    STA.L $002119

  ..writeLow:
    INY
    DEX : BEQ .goto_loopMain
    LDA.B DP_DecompVar+1 : PHA
    TYA : LSR
    PLA
    BCS ..writeHigh2
    STA.L $002118
    BRA .writeLow2

  ..writeHigh2:
    STA.L $002119

  .writeLow2:
    INY
    DEX : BNE .loopWordFill

  .goto_loopMain:
    JMP .loopMain

  .incrementingFill:
    ; Command 3: Incrementing fill
    PHX
    LDX.B DP_DecompSrc
    LDA.W $0000,X
    INX : BNE +
    JSR SourceBankOverflowCorrection

+   STX.B DP_DecompSrc
    PLX

  .loopIncrementingFill:
    PHA
    TYA : LSR
    PLA
    BCS ..writeHigh
    STA.L $002118
    BRA ..writeLow

  ..writeHigh:
    STA.L $002119

  ..writeLow:
    INY
    INC
    DEX : BNE .loopIncrementingFill
    JMP .loopMain

  .dictionaryVariant:
    ; Commands 4..7:
    CMP.B #$C0 : BCS .slidingDictionary
    ; Command 4 and 5: dictionary copy and inverted dictionary copy
    AND.B #$20 : STA.B DP_DecompDictCopyBit
    PHX
    LDX.B DP_DecompSrc
    LDA.W $0000,X
    INX : BNE +
    JSR SourceBankOverflowCorrection

+   STX.B DP_DecompSrc
    PLX
    STA.B DP_DecompVar
    PHX
    LDX.B DP_DecompSrc
    LDA.W $0000,X
    INX : BNE +
    JSR SourceBankOverflowCorrection

+   STX.B DP_DecompSrc
    PLX
    STA.B DP_DecompVar+1
    REP #$20
    LDA.B DP_DecompDest : CLC : ADC.B DP_DecompVar : STA.B DP_DecompVar

  .loopDictionaryCopy:
    PHX
    REP #$20
    LDA.B DP_DecompVar : LSR : STA.L $002116
    LDA.L $002139 : LDA.L $002139 : BCC +
    XBA

+   INC.B DP_DecompVar
    SEP #$20
    LDX.B DP_DecompDictCopyBit : BEQ +
    EOR.B #$FF

+   PHA
    REP #$20
    TYA : LSR : STA.L $002116
    SEP #$20
    PLA : PHA
    TYA : LSR
    PLA
    BCS ..writeHigh
    STA.L $002118
    BRA ..writeLow

  ..writeHigh:
    STA.L $002119

  ..writeLow:
    INY
    PLX : DEX : BNE .loopDictionaryCopy
    JMP .loopMain

  .slidingDictionary:
    ; Command 6 and 7: sliding dictionary copy and inverted sliding dictionary copy
    AND.B #$20 : STA.B DP_DecompDictCopyBit
    PHX
    LDX.B DP_DecompSrc
    LDA.W $0000,X
    INX : BNE +
    JSR SourceBankOverflowCorrection

+   STX.B DP_DecompSrc
    PLX
    STA.B DP_DecompVar
    STZ.B DP_DecompVar+1
    REP #$20
    TYA : SEC : SBC.B DP_DecompVar : STA.B DP_DecompVar
    BRA .loopDictionaryCopy


;;; $B437: Tilemap - failed NTSC/PAL check ;;;
Tilemap_FailedRegionCheck:
; ' THIS GAME PAK IS NOT DESIGINED '
; ' FOR YOUR SUPER FAMICOM OR      '
; ' SUPER NES.            NINTENDO '
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
    dw $000F,$007D,$0071,$0072,$007C,$000F,$0070,$006A
    dw $0076,$006E,$000F,$0079,$006A,$0074,$000F,$0072
    dw $007C,$000F,$0077,$0078,$007D,$000F,$006D,$006E
    dw $007C,$0072,$0070,$0072,$0077,$006E,$006D,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$002B,$002D,$000D,$000E,$000D,$000F
    dw $000E,$000A,$0026,$0022,$000C,$0000,$0026,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$006F,$0078,$007B,$000F,$0082,$0078,$007E
    dw $007B,$000F,$003B,$0010,$0038,$001E,$003A,$000F
    dw $001F,$001A,$0036,$0011,$001C,$0010,$0036,$000F
    dw $0078,$007B,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$002B,$002D,$000D,$000E,$000D,$000F,$0027
    dw $000E,$002B,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$003B,$0010,$0038,$001E,$003A,$000F,$0037
    dw $001E,$003B,$0088,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$0077
    dw $0072,$0077,$007D,$006E,$0077,$006D,$0078,$000F
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


;;; $BC37: Tilemap - failed SRAM mapping check ;;;
Tilemap_FailedSRAMMappingCheck:
; '            WARNING             '
; '                                '
; ' IT IS A SERIOUS CRIME TO COPY  '
; ' VIDEO GAMES.      18 USC 2319. '
; ' PLEASE REFER TO YOUR NINTENDO  '
; ' GAME INSTRUCTION BOOKLET FOR   '
; ' FURTHER INFORMATION.           '
; '--------------------------------'
; '                                '
; '             警  告               '
; '     ビデオゲームのコピーは法律で禁じられています。    '
; '     詳しくは取扱説明書を参照してください。        '

; (warning)
; (game copying is prohibited by law.)
; (for further information, please consult your user's manual.)
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$002F,$000A,$000D,$0027
    dw $0022,$0027,$000C,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$003F,$001A,$003A,$0037
    dw $0011,$0037,$0030,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$0072,$007D,$000F,$0072,$007C,$000F,$006A
    dw $000F,$007C,$006E,$007B,$0072,$0078,$007E,$007C
    dw $000F,$006C,$007B,$0072,$0076,$006E,$000F,$007D
    dw $0078,$000F,$006C,$0078,$0079,$0082,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$007F,$0072,$006D,$006E,$0078,$000F,$0070
    dw $006A,$0076,$006E,$007C,$0088,$000F,$000F,$000F
    dw $000F,$000F,$000F,$0061,$0068,$000F,$007E,$007C
    dw $006C,$000F,$0062,$0063,$0061,$0069,$0088,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$0079,$0075,$006E,$006A,$007C,$006E,$000F
    dw $007B,$006E,$006F,$006E,$007B,$000F,$007D,$0078
    dw $000F,$0082,$0078,$007E,$007B,$000F,$0077,$0072
    dw $0077,$007D,$006E,$0077,$006D,$0078,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$0070,$006A,$0076,$006E,$000F,$0072,$0077
    dw $007C,$007D,$007B,$007E,$006C,$007D,$0072,$0078
    dw $0077,$000F,$006B,$0078,$0078,$0074,$0075,$006E
    dw $007D,$000F,$006F,$0078,$007B,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$006F,$007E,$007B,$007D,$0071,$006E,$007B
    dw $000F,$0072,$0077,$006F,$0078,$007B,$0076,$006A
    dw $007D,$0072,$0078,$0077,$0088,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $0056,$0056,$0056,$0056,$0056,$0056,$0056,$0056
    dw $0056,$0056,$0056,$0056,$0056,$0056,$0056,$0056
    dw $0056,$0056,$0056,$0056,$0056,$0056,$0056,$0056
    dw $0056,$0056,$0056,$0056,$0056,$0056,$0056,$0056
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$0168,$000F,$000F
    dw $0169,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$0178,$000F,$000F
    dw $0179,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$008E,$00C8,$00D6
    dw $0106,$000F,$0119,$018F,$00F0,$008D,$000F,$0161
    dw $016A,$016B,$0126,$016C,$017E,$0180,$0181,$0182
    dw $0183,$0184,$0185,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$008F,$00E4,$00E6
    dw $010F,$0056,$0129,$019F,$0100,$008F,$0056,$0171
    dw $017A,$017B,$0192,$017C,$017D,$0190,$0191,$0192
    dw $0193,$0194,$0195,$017F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$0051,$016D,$0186
    dw $0161,$0187,$0188,$0189,$018A,$018B,$018C,$018D
    dw $018E,$016D,$0182,$0186,$00E3,$0110,$0183,$000F
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F
    dw $000F,$000F,$000F,$000F,$000F,$0043,$017D,$0196
    dw $0171,$0197,$0198,$0199,$019A,$019B,$019C,$019D
    dw $019E,$017D,$0192,$0196,$00EB,$0120,$0193,$017F
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


;;; $C437: Load from load station ;;;
LoadFromLoadStation:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W #$0001 : STA.W SaveStationLockoutFlag
    LDA.W AreaIndex : ASL : TAX
    LDA.W LoadStationIndex : ASL : STA.B DP_Temp12
    ASL : CLC : ADC.B DP_Temp12 : ADC.W LoadStationIndex
    ASL : CLC : ADC.W LoadStationListPointers,X : TAX
    LDA.W $0000,X : STA.W RoomPointer
    LDA.W $0002,X : STA.W DoorPointer
    LDA.W $0004,X : STA.W DoorBTS
    LDA.W $0006,X : STA.W Layer1XPosition : STA.W Layer2ScrollY+1
    LDA.W $0008,X : STA.W Layer1YPosition : STA.W BG1YOffset
    LDA.W $000A,X : CLC : ADC.W Layer1YPosition : STA.W SamusYPosition : STA.W SamusPreviousYPosition
    LDA.W Layer1XPosition : CLC : ADC.W #$0080 : ADC.W $000C,X : STA.W SamusXPosition : STA.W SamusPreviousXPosition
    STZ.B DP_BG1XScroll : STZ.B DP_BG1YScroll
    SEP #$20
    LDA.B #$8F : PHA : PLB
    LDX.W RoomPointer
    LDA.W $0001,X : STA.W AreaIndex
    STZ.W DisableMinimap
    PLB : PLP
    RTL


;;; $C4B5: Load station lists ;;;
LoadStationListPointers:
; Pointers to each area's load station list
    dw LoadStations_Crateria
    dw LoadStations_Brinstar
    dw LoadStations_Norfair
    dw LoadStations_WreckedShip
    dw LoadStations_Maridia
    dw LoadStations_Tourian
    dw LoadStations_Ceres
    dw LoadStations_Debug


; Load station lists are indexed by LoadStationIndex
; Indices 0..7 are the only ones that can be used by save stations (gunship save station uses 0)
; Indices 8..Fh are elevators, selectable by the debug file select map if they've been used before (if elevator doors mark them as used)
; Indices 10h+ are debug load points, except for Crateria's index 12h, which is used for the gunship landing sequence,
; these debug load points are unconditionally selectable in the debug file select map

;        _________________________ Room pointer
;        _________________________ Door pointer
;        _________________________ Door BTS
;       |      ___________________ Screen X position
;       |     |      _____________ Screen Y position
;       |     |     |      _______ Samus Y offset (relative to screen top)
;       |     |     |     |      _ Samus X offset (relative to screen center)
;       |     |     |     |     |
LoadStations_Crateria:
; 0: Landing site (from Crateria mainstreet)
    dw RoomHeader_LandingSite
    dw Door_Parlor_1
    dw $0000,$0400,$0400,$0040,$0000

    dw RoomHeader_CrateriaSave
; 1: Crateria save station (from Crateria mainstreet)
    dw Door_Parlor_5
    dw $0000,$0000,$0000,$0098,$FFE0

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

; 8: Crateria -> Maridia elevator (from Post Crateria maze yellow door)
    dw RoomHeader_ForgottenHighwayElev
    dw Door_ForgottenHighwayElbow_1
    dw $0000,$0000,$0000,$00A8,$0000

; 9: Crateria -> Red Brinstar elevator (from Pre moat room)
    dw RoomHeader_RedBinstarElev
    dw Door_CrateriaKihunter_2
    dw $0000,$0000,$0000,$00A8,$0000

; Ah: Crateria -> Blue Brinstar elevator (from Old Mother Brain room)
    dw RoomHeader_ElevToBlueBrinstar
    dw Door_Pit_1
    dw $0000,$0000,$0000,$0088,$0000

; Bh: Crateria -> Green Brinstar elevator (from West Crateria kago hall)
    dw RoomHeader_GreenBrinstarElev
    dw Door_LowerMushrooms_1
    dw $0000,$0000,$0000,$0088,$0000

; Ch: Tourian entrance (from Pre Tourian hall)
    dw RoomHeader_Statues
    dw Door_StatuesHallway_1
    dw $0000,$0000,$0100,$0098,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

; 10h: Landing site (from Crateria mainstreet)
    dw RoomHeader_LandingSite
    dw Door_Parlor_1
    dw $0000,$0400,$0400,$0040,$0000

; 11h: Wrecked Ship back door (from East Crateria kago shaft)
    dw RoomHeader_EastOcean
    dw Door_ForgottenHighwayKagos_0
    dw $0000,$0000,$0400,$0095,$0000

; 12h: Gunship landing sequence (landing site from landing site)
    dw RoomHeader_LandingSite
    dw Door_LandingSite_LandingCutscene
    dw $0000,$0400,$0000,$0080,$0000


LoadStations_Brinstar:
; 0: Pre Spore Spawn save station (from Charge beam room)
    dw RoomHeader_BigPinkSaveRoom
    dw Door_BigPink_4
    dw $0000,$0000,$0000,$0098,$FFE0

; 1: Green Brinstar mainstreet save station (from Green Brinstar mainstreet)
    dw RoomHeader_GreenBrinstarSave
    dw Door_GreenBrinstarMainShaft_A
    dw $0000,$0000,$0000,$0098,$FFE0

; 2: Brinstar false floor save station (from Brinstar false floor spike hall)
    dw RoomHeader_EtecoonSave
    dw Door_EtecoonETank_3
    dw $0000,$0000,$0000,$0098,$FFE0

; 3: Kraid save station (from Kraid kihunter hall)
    dw RoomHeader_WarehouseSave
    dw Door_WarehouseKihunter_2
    dw $0000,$0000,$0000,$0098,$0000

; 4: Red Brinstar save station (from Red Brinstar -> Crateria elevator)
    dw RoomHeader_RedBrinstarSave
    dw Door_Caterpillar_6
    dw $0000,$0000,$0000,$0098,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

; 8: Green Brinstar mainstreet (from Pre Brinstar map room hall)
    dw RoomHeader_GreenBrinstarMainShaft
    dw Door_BrinstarPreMap_1
    dw $0001,$0000,$0200,$00A8,$0000

; 9: Morph ball room (from Brinstar diagonal room)
    dw RoomHeader_MorphBall
    dw Door_GreenHillZone_1
    dw $0000,$0500,$0200,$00A8,$0000

; Ah: Red Brinstar -> Crateria elevator (from Red Brinstar damage boost hall)
    dw RoomHeader_Caterpillar
    dw Door_Hellway_1
    dw $0000,$0000,$0200,$00A8,$0000

; Bh: Kraid's lair entrance (from n00b tube east)
    dw RoomHeader_WarehouseEntrance
    dw Door_EastTunnel_1
    dw $0000,$0000,$0000,$0088,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

; 10h: Green Brinstar mainstreet (from Pre Brinstar map room hall)
    dw RoomHeader_GreenBrinstarMainShaft
    dw Door_BrinstarPreMap_1
    dw $0001,$0000,$0200,$00A8,$0000

; 11h: Pre Kraid room (from Kraid)
    dw RoomHeader_KraidEyeDoor
    dw Door_Kraid_0
    dw $0000,$0000,$0100,$0080,$0000

; 12h: Charge beam room (from Brinstar false wall super-sidehopper power bomb room)
    dw RoomHeader_BigPink
    dw Door_PinkBrinstarPowerBombs_0
    dw $0000,$0300,$0000,$0080,$0000


LoadStations_Norfair:
; 0: Post Crocomire save station (from Post Crocomire room)
    dw RoomHeader_PostCrocSave
    dw Door_PostCrocFarming_3
    dw $0000,$0000,$0000,$0098,$0000

; 1: Bubble Norfair save station (from Bubble Norfair mainstreet)
    dw RoomHeader_BubbleMountainSave
    dw Door_BubbleMountain_6
    dw $0000,$0000,$0000,$0098,$FFE0

; 2: Rock Norfair save station (from Norfair speed blockade hall)
    dw RoomHeader_FrogSave
    dw Door_FrogSpeedway_0
    dw $0000,$0000,$0000,$0098,$0000

; 3: Pre Crocomire save station (from Norfair slope)
    dw RoomHeader_CrocomireSave
    dw Door_CrocomireSpeedway_2
    dw $0000,$0000,$0000,$0098,$0000

; 4: Pre Lower Norfair save station (from Norfair -> Lower Norfair elevator)
    dw RoomHeader_LNElevSave
    dw Door_LowerNorfairElev_3
    dw $0000,$0000,$0000,$0098,$FFE0

; 5: Lower Norfair save station (from Lower Norfair kihunter shaft)
    dw RoomHeader_LNSave
    dw Door_RedKihunterShaft_3
    dw $0000,$0000,$0000,$0098,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

; 8: Norfair mainstreet (from first hot room)
    dw RoomHeader_BusinessCenter
    dw Door_CathedralEntrance_0
    dw $0000,$0000,$0200,$00A8,$0000

; 9: Norfair -> Lower Norfair elevator (from Lower Norfair entrance)
    dw RoomHeader_LowerNorfairElev
    dw Door_LavaDive_1
    dw $0000,$0000,$0000,$0088,$0000

; Ah: Lower Norfair mainstreet (from Golden chozo statue lava lake)
    dw RoomHeader_MainHall
    dw Door_AcidStatue_1
    dw $0000,$0400,$0200,$0088,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

; 10h: Norfair mainstreet (from Ice beam mockball hall)
    dw RoomHeader_BusinessCenter
    dw Door_IceBeamGate_2
    dw $0002,$0000,$0200,$00A8,$0000

; 11h: Norfair slope (from Crocomire)
    dw RoomHeader_CrocomireSpeedway
    dw Door_Crocomire_1
    dw $0001,$0C00,$0200,$00A0,$0000

; 12h: Pre Ridley hall (from Lower Norfair holtz room)
    dw RoomHeader_LNFarming
    dw Door_Plowerhouse_0
    dw $0000,$0000,$0000,$00A0,$0000

; 13h: Post Crocomire room (from Post Crocomire power bombs room)
    dw RoomHeader_PostCrocFarming
    dw Door_PostCrocPowerBombs_0
    dw $0000,$0000,$0000,$00B5,$0000

; 14h: Lower Norfair mainstreet (from Golden chozo statue lava lake)
    dw RoomHeader_MainHall
    dw Door_AcidStatue_1
    dw $0001,$0500,$0200,$0035,$0000

; 15h: Golden Torizo (from Lower Norfair energy station)
    dw RoomHeader_GoldenTorizo
    dw Door_GTEnergyRefill_0
    dw $0000,$0200,$0200,$0000,$0000

; 16h: Golden Torizo (from Golden chozo statue lava lake)
    dw RoomHeader_GoldenTorizo
    dw Door_AcidStatue_0
    dw $0000,$0000,$0000,$0080,$0000


LoadStations_WreckedShip:
; 0: Wrecked Ship save station (from Wrecked Ship mainstreet)
    dw RoomHeader_WreckedShipSave
    dw Door_WreckedShipMainShaft_6
    dw $0000,$0000,$0000,$0098,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

; 10h: Wrecked Ship entrance treadmill (from Wrecked Ship mainstreet)
    dw RoomHeader_WreckedShipEntrance
    dw Door_WreckedShipMainShaft_0
    dw $0001,$0000,$0000,$0080,$0000

; 11h: Pre Phantoon hall (from Wrecked Ship map station)
    dw RoomHeader_Basement
    dw Door_WreckedShipMap_0
    dw $0000,$0400,$0000,$0080,$0000


LoadStations_Maridia:
; 0: n00b tube save station (from n00b tube)
    dw RoomHeader_GlassTunnelSave
    dw Door_GlassTunnel_3
    dw $0000,$0000,$0000,$0098,$0000

; 1: Maridia save station (from Maridia -> Crateria elevator)
    dw RoomHeader_ForgottenHighwaySave
    dw Door_MaridiaElev_1
    dw $0000,$0000,$0000,$0098,$0000

; 2: Snail room save station (from Snail room)
    dw RoomHeader_AqueductSave
    dw Door_Aqueduct_5
    dw $0000,$0000,$0000,$0098,$FFE0

; 3: Draygon save station (from Maridia grapple room)
    dw RoomHeader_DraygonSave
    dw Door_Colosseum_1
    dw $0000,$0000,$0000,$0098,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

; 8: Maridia -> Crateria elevator (from Sandy Maridia thin platform hall)
    dw RoomHeader_MaridiaElev
    dw Door_ThreadTheNeedle_1
    dw $0000,$0000,$0200,$00A8,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

; 10h: Sandy Maridia unused passage to Sandy Maridia mainstreet (from Sandy Maridia memu room)
    dw RoomHeader_PseudoPlasmaSpark
    dw Door_NWestMaridiaBug_1
    dw $0001,$0000,$0000,$00D0,$0000

; 11h: Pre Draygon room (from ?)
    dw RoomHeader_ThePrecious
    dw Door_ThePrecious_MaridiaLoad11
    dw $0000,$0000,$0200,$0080,$0000

; 12h: Mochtroid room (from Snail room)
    dw RoomHeader_BotwoonHallway
    dw Door_Aqueduct_3
    dw $0000,$0300,$0000,$0080,$0000

; 13h: Elevatube south (from Sand falls west)
    dw RoomHeader_Oasis
    dw Door_WestSandHall_1
    dw $0000,$0000,$0100,$0080,$0000


LoadStations_Tourian:
; 0: Pre Mother Brain save station trap (from Pre Mother Brain shaft)
    dw RoomHeader_MotherBrainSave
    dw Door_RinkaShaft_1
    dw $0000,$0000,$0000,$0098,$FFE0

; 1: Tourian save station (from Tourian -> Crateria elevator)
    dw RoomHeader_UpperTourianSave
    dw Door_TourianFirst_3
    dw $0000,$0000,$0000,$0098,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

; 8: Tourian -> Crateria elevator (from Metroid room 1)
    dw RoomHeader_TourianFirst
    dw Door_Metroids1_0
    dw $0000,$0000,$0200,$00A8,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

    dw $0000
    dw $0000
    dw $0000,$0400,$0400,$00B0,$0000

; 10h: Pre Mother Brain shaft (from Tourian eye-door room)
    dw RoomHeader_RinkaShaft
    dw Door_TourianEyeDoor_1
    dw $0000,$0000,$0200,$0080,$0000

; 11h: Pre Mother Brain shaft (from Shitroid room)
    dw RoomHeader_RinkaShaft
    dw Door_BigBoy_0
    dw $0000,$0000,$0000,$0080,$0000


LoadStations_Ceres:
; Ceres elevator shaft (from Ceres pre elevator hall)
    dw RoomHeader_CeresElev
    dw Door_FallingTile_0
    dw $0000,$0000,$0000,$0048,$0000

    dw RoomHeader_CeresElev
    dw Door_FallingTile_0
    dw $0000,$0000,$0000,$0040,$0000

    dw RoomHeader_CeresElev
    dw Door_FallingTile_0
    dw $0000,$0000,$0000,$0040,$0000

    dw RoomHeader_CeresElev
    dw Door_FallingTile_0
    dw $0000,$0000,$0000,$0040,$0000

    dw RoomHeader_CeresElev
    dw Door_FallingTile_0
    dw $0000,$0000,$0000,$0040,$0000

    dw RoomHeader_CeresElev
    dw Door_FallingTile_0
    dw $0000,$0000,$0000,$0040,$0000

    dw RoomHeader_CeresElev
    dw Door_FallingTile_0
    dw $0000,$0000,$0000,$0040,$0000

    dw RoomHeader_CeresElev
    dw Door_FallingTile_0
    dw $0000,$0000,$0000,$0040,$0000

    dw RoomHeader_CeresElev
    dw Door_FallingTile_0
    dw $0000,$0000,$0000,$0040,$0000

    dw RoomHeader_CeresElev
    dw Door_FallingTile_0
    dw $0000,$0000,$0000,$0040,$0000

    dw RoomHeader_CeresElev
    dw Door_FallingTile_0
    dw $0000,$0000,$0000,$0040,$0000

    dw RoomHeader_CeresElev
    dw Door_FallingTile_0
    dw $0000,$0000,$0000,$0040,$0000

    dw RoomHeader_CeresElev
    dw Door_FallingTile_0
    dw $0000,$0000,$0000,$0040,$0000

    dw RoomHeader_CeresElev
    dw Door_FallingTile_0
    dw $0000,$0000,$0000,$0040,$0000

    dw RoomHeader_CeresElev
    dw Door_FallingTile_0
    dw $0000,$0000,$0000,$0040,$0000

    dw RoomHeader_CeresElev
    dw Door_FallingTile_0
    dw $0000,$0000,$0000,$0040,$0000

    dw RoomHeader_CeresElev
    dw Door_FallingTile_0
    dw $0000,$0000,$0000,$0040,$0000


LoadStations_Debug:
; Debug room (from ?)
    dw RoomHeader_Debug
    dw UNUSED_Door_Debug_0_83ABC4
    dw $0000,$0000,$0000,$00B0,$0000

    dw RoomHeader_Debug
    dw UNUSED_Door_Debug_0_83ABC4
    dw $0000,$0000,$0000,$00B0,$0000

    dw RoomHeader_Debug
    dw UNUSED_Door_Debug_0_83ABC4
    dw $0000,$0000,$0000,$00B0,$0000

    dw RoomHeader_Debug
    dw UNUSED_Door_Debug_0_83ABC4
    dw $0000,$0000,$0000,$00B0,$0000

    dw RoomHeader_Debug
    dw UNUSED_Door_Debug_0_83ABC4
    dw $0000,$0000,$0000,$00B0,$0000

    dw RoomHeader_Debug
    dw UNUSED_Door_Debug_0_83ABC4
    dw $0000,$0000,$0000,$00B0,$0000

    dw RoomHeader_Debug
    dw UNUSED_Door_Debug_0_83ABC4
    dw $0000,$0000,$0000,$00B0,$0000

    dw RoomHeader_Debug
    dw UNUSED_Door_Debug_0_83ABC4
    dw $0000,$0000,$0000,$00B0,$0000

    dw RoomHeader_Debug
    dw UNUSED_Door_Debug_0_83ABC4
    dw $0000,$0000,$0000,$00B0,$0000

    dw RoomHeader_Debug
    dw UNUSED_Door_Debug_0_83ABC4
    dw $0000,$0000,$0000,$00B0,$0000

    dw RoomHeader_Debug
    dw UNUSED_Door_Debug_0_83ABC4
    dw $0000,$0000,$0000,$00B0,$0000

    dw RoomHeader_Debug
    dw UNUSED_Door_Debug_0_83ABC4
    dw $0000,$0000,$0000,$00B0,$0000

    dw RoomHeader_Debug
    dw UNUSED_Door_Debug_0_83ABC4
    dw $0000,$0000,$0000,$00B0,$0000

    dw RoomHeader_Debug
    dw UNUSED_Door_Debug_0_83ABC4
    dw $0000,$0000,$0000,$00B0,$0000

    dw RoomHeader_Debug
    dw UNUSED_Door_Debug_0_83ABC4
    dw $0000,$0000,$0000,$00B0,$0000

    dw RoomHeader_Debug
    dw UNUSED_Door_Debug_0_83ABC4
    dw $0000,$0000,$0000,$00B0,$0000

    dw RoomHeader_Debug
    dw UNUSED_Door_Debug_0_83ABC4
    dw $0000,$0000,$0000,$00B0,$0000


;;; $CD07: Debug. Set debug elevators as used ;;;
SetDebugElevatorAsUsed:
; Called if an elevator door has (elevator properties) & Fh != 0, which is never true, so this routine is unused/debug
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W AreaIndex : ASL : TAX
    LDA.W ElevatorDoorProperties : AND.W #$000F : DEC : ASL #2
    CLC : ADC.W .elevatorBits,X : TAY
    LDA.W #$0000
    SEP #$20
    LDA.W $0000,Y : TAX
    LDA.W $0001,Y : ORA.L SRAMMirror_UsedSaveStationsElevators,X : STA.L SRAMMirror_UsedSaveStationsElevators,X
    LDA.W $0002,Y : TAX
    LDA.W $0003,Y : ORA.L SRAMMirror_UsedSaveStationsElevators,X : STA.L SRAMMirror_UsedSaveStationsElevators,X
    PLB : PLP
    RTL

  .elevatorBits:
    dw ..crateria
    dw ..brinstar
    dw ..norfair
    dw ..wreckedShip
    dw ..maridia
    dw ..tourian

;        _____________ Source area index
;       |    _________ Source bit
;       |   |    _____ Destination area index
;       |   |   |    _ Destination bit
;       |   |   |   |
  ..crateria:
; Crateria elevator bits
    db $01,$01,$09,$01
    db $01,$02,$03,$04
    db $01,$04,$03,$02
    db $01,$08,$03,$01
    db $01,$10,$0B,$01

  ..brinstar:
; Brinstar elevator bits
    db $03,$01,$01,$08
    db $03,$02,$01,$04
    db $03,$04,$01,$02
    db $03,$08,$05,$01

  ..norfair:
; Norfair elevator bits
    db $05,$01,$03,$08
    db $05,$02,$05,$04
    db $05,$04,$05,$02

  ..maridia:
; Maridia elevator bits
    db $09,$01,$01,$01

  ..tourian:
; Tourian elevator bits
    db $0B,$01,$01,$10

  ..wreckedShip:
; Wrecked Ship elevator bits
    db $00,$00,$00,$00


Freespace_Bank80_CD8E:
; $2F32 bytes


warnpc $80FFC0
ORG $80FFC0
ROM_HEADER:
    db "Super Metroid        "

  .ROMSpeed_MapMode:
; ROM speed and map mode: FastROM, LoROM
    db $30

  .chipset:
; Chipset: ROM + RAM + SRAM
    db $02

  .ROMSize:
; ROM size: 400000h bytes = 4 MiB
    db $0C

  .SRAMSize:
; SRAM size: 2000h bytes = 8 KiB
    db $03

  .country:
; Country code: Japan
    db $00

  .developer:
; Developer code: Nintendo
    db $01

  .version:
; Version number
    db $00

  .complement:
; Checksum complement
    dw $0720

  .checksum:
; Checksum
    dw $F8DF

; Native interrupt vectors
    dw Crash_Handler
    dw Crash_Handler

Native_COP:
    dw Crash_Handler

Native_BRK:
    dw Crash_Handler

Native_ABORT:
    dw Crash_Handler

Native_NMI:
    dw NMI

Native_RESET:
    dw Crash_Handler

Native_IRQ:
    dw IRQ

; Emulation interrupt vectors
    dw Crash_Handler
    dw Crash_Handler

Emulation_COP:
    dw Crash_Handler

Emulation_BRK:
    dw Crash_Handler

Emulation_ABORT:
    dw Crash_Handler

Emulation_NMI:
    dw Crash_Handler

Emulation_RESET:
    dw Boot

Emulation_IRQBRK:
    dw Crash_Handler
