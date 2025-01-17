
org $808000


Debug_RegionSRAM:
    dw $0000 ; Skip NTSC/PAL and SRAM mapping check ($85F6)

DebugConst_DemoRecorder:
    dw $0000 ; Demo recorder ($90:E759)

DebugConst_DebugMode:
    dw $0000 ; Debug mode, written to $05D1 on boot

DebugConst_DebugScrolling:
    dw $0000 ; Debug scrolling ($82:8B44: game state 8 - main gameplay)

DebugConst_DisableAudio:
    dw $0000 ; Disable audio ($80:8024)

UploadToAPU_Hardcoded:
    LDA.B $02,S 
    STA.B $04 
    LDA.B $01,S 
    STA.B $03 ; $03 = return address
    CLC 
    ADC.W #$0003 ; adjust return address
    STA.B $01,S 
    LDY.W #$0001 
    LDA.B [$03],Y 
    STA.B $00 
    INY 
    LDA.B [$03],Y 
    STA.B $01 ; $00 = [(return address) + 1] (parameter address)

UploadToAPU_long:
    JSR.W UploadToAPU 
    RTL 


UploadToAPU:
    LDA.L DebugConst_DisableAudio 
    BEQ .upload ; If [DebugConst_DisableAudio] != 0:
    RTS ; Return


.upload:
    PHP 
    PHB 
    REP #$30 
    LDA.W #$FFFF 
    STA.L $000617 ; Set uploading to APU flag
    SEP #$20 
    REP #$10 
    LDA.B #$FF 
    STA.L $002140 ; APU IO 0 = FFh (request APU upload)
    LDY.B $00 ; Y = parameter short address
    LDA.B $02 
    PHA 
    PLB ; Set DB to parameter bank
    REP #$30 
    JSR.W SendAPUData 
    LDA.W #$0000 
    STA.L $000617 ; Clear uploading to APU flag
    PLB 
    PLP 
    RTS 


SendAPUData:
    PHP 
    REP #$30 
    LDA.W #$3000 
    STA.L $000641 

.retry:
    LDA.W #$BBAA 
    CMP.L $002140 
    BEQ .AABB ; Wait until [APU IO 0..1] = AAh BBh
    LDA.L $000641 
    DEC A 
    STA.L $000641 
    BNE .retry 

.crash:
    BRA .crash ; If exceeded 3000h attempts: crash


.AABB:
    SEP #$20 
    LDA.B #$CC ; Kick = CCh
    BRA .processDataBlock 


.uploadDataBlock:
    LDA.W $0000,Y 
    JSR.W IncY_OverflowCheck ; Data = [[Y++]]
    XBA 
    LDA.B #$00 ; Index = 0
    BRA .uploadData 


.loopNextData:
    XBA 
    LDA.W $0000,Y 
    JSR.W IncY_OverflowCheck ; Data = [[Y++]]
    XBA 

.wait:
    CMP.L $002140 
    BNE .wait ; Wait until APU IO 0 echoes
    INC A ; Increment index

.uploadData:
    REP #$20 
    STA.L $002140 ; APU IO 0..1 = [index] [data]
    SEP #$20 
    DEX ; Decrement X (block size)
    BNE .loopNextData ; If [X] != 0: go to .loopNextData

.wait2:
    CMP.L $002140 
    BNE .wait2 ; Wait until APU IO 0 echoes

.inc:
    ADC.B #$03 ; Kick = [index] + 4
    BEQ .inc ; Ensure kick != 0

.processDataBlock:
    PHA 
    REP #$20 
    LDA.W $0000,Y 
    JSR.W IncYTwice_OverflowCheck ; X = [[Y]] (block size)
    TAX ; Y += 2
    LDA.W $0000,Y 
    JSR.W IncYTwice_OverflowCheck ; APU IO 2..3 = [[Y]] (destination address)
    STA.L $002142 ; Y += 2
    SEP #$20 
    CPX.W #$0001 
    LDA.B #$00 
    ROL A ; If block size = 0: APU IO 1 = 0 (EOF), else APU IO 1 = 1 (arbitrary non-zero value)
    STA.L $002141 
    ADC.B #$7F ; Set overflow if block size != 0, else clear overflow
    PLA 
    STA.L $002140 ; APU IO 0 = kick
    PHX 
    LDX.W #$1000 

.wait3:
    DEX ; Wait until APU IO 0 echoes
    BEQ .return ; If exceeded 1000h attempts: return
    CMP.L $002140 
    BNE .wait3 
    PLX 
    BVS .uploadDataBlock ; If block size != 0: go to .uploadDataBlock
    SEP #$20 
    STZ.W $2141 
    STZ.W $2142 ; These stores have no effect (because DB is set to some hirom bank), but there's also no reason to do these stores anyway
    STZ.W $2143 
    PLP 
    RTS ; Return


.return:
    SEP #$20 
    STZ.W $2141 
    STZ.W $2142 
    STZ.W $2143 
    PLX 
    PLP 
    RTS 


IncYTwice_OverflowCheck:
    INY 
    BEQ IncY_OverflowCheck_overflow 

IncY_OverflowCheck:
    INY 
    BEQ IncY_OverflowCheck_overflow 
    RTS 


IncY_OverflowCheck_overflow:
    INC.B $02 ; Increment $02
    PEI.B ($01) 
    PLB ; DB = [$02]
    PLB 
    LDY.W #$8000 ; Y = 8000h
    RTS 


GenerateRandomNumber:
    SEP #$20 
    LDA.W $05E5 
    STA.W $4202 
    LDA.B #$05 
    STA.W $4203 
    NOP ; A = [random number low] * 5
    REP #$20 
    LDA.W $4216 ; A += ([random number high] * 5 + 1) * 100h
    PHA 
    SEP #$20 
    LDA.W $05E6 
    STA.W $4202 
    LDA.B #$05 
    STA.W $4203 
    XBA 
    NOP 
    LDA.W $4216 ; A += ([random number high] * 5 + 1) * 100h
    SEC 
    ADC.B $02,S 
    STA.B $02,S 
    REP #$20 
    PLA 
    ADC.W #$0011 
    STA.W $05E5 ; Random number = [A] + 11h
    RTL 


UpdateHeldInput:
    PHP 
    PHB 
    REP #$30 
    PHX 
    PHK 
    PLB 
    STA.W $05DD ; Timed held input timer reset value = [A]
    LDA.B $8B 
    STA.B $12 
    LDA.B $8F 
    TRB.B $12 
    LDA.B $12 ; If held input != [previous held input]: go to .unheld
    CMP.W $05D9 
    STA.W $05D9 ; Previous held input = held input
    BNE .unheld 
    DEC.W $05DB ; Decrement timed held input timer
    BPL .positive ; If [timed held input timer] >= 0: go to .positive
    STZ.W $05DB ; Timed held input timer = 0
    LDX.W $05DF 
    STX.W $05E3 ; Previous timed held input = [timed held input]
    STA.W $05DF ; Timed held input = [held input]
    BRA .return ; Go to .return


.unheld:
    LDA.W $05DD 
    STA.W $05DB ; Timed held input timer = [timed held input timer reset value]

.positive:
    STZ.W $05DF ; Timed held input = 0

.return:
    LDA.W $05DF 
    EOR.W $05E3 
    AND.W $05DF ; Newly held down timed held input = newly held down timed held input
    STA.W $05E1 
    PLX 
    PLB 
    PLP 
    RTL 


BitIndexToByteIndexAndBitmask:
    TAX 
    BPL .dontCrash 
    db $00 ; BRK with no operand

.dontCrash:
    STZ.W $05E7 
    PHA 
    AND.W #$0007 
    SEC 

.loop:
    ROL.W $05E7 
    DEC A 
    BPL .loop 
    PLA 
    LSR #3
    TAX 
    RTL 


SetBossBitsInAForCurrentArea:
    PHX 
    PHY 
    PHP 
    SEP #$20 
    STA.W $05E7 
    LDX.W $079F 
    LDA.L $7ED828,X 
    ORA.W $05E7 
    STA.L $7ED828,X 
    PLP 
    PLY 
    PLX 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_ClearBossBitsInAForCurrentArea_8081C0:
    PHX 
    PHY 
    PHP 
    SEP #$20 
    EOR.B #$FF 
    STA.W $05E7 
    LDX.W $079F 
    LDA.L $7ED828,X 
    AND.W $05E7 
    STA.L $7ED828,X 
    PLP 
    PLY 
    PLX 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


CheckIfBossBitsForCurrentAreaMatchAnyBitsInA:
    PHX 
    PHY 
    PHP 
    SEP #$20 
    STA.W $05E7 
    LDX.W $079F 
    LDA.L $7ED828,X 
    AND.W $05E7 
    BNE .match 
    PLP 
    PLY 
    PLX 
    CLC 
    RTL 


.match:
    PLP 
    PLY 
    PLX 
    SEC 
    RTL 


MarkEvent_inA:
    PHX 
    PHY 
    PHP 
    REP #$30 
    JSL.L BitIndexToByteIndexAndBitmask 
    LDA.L $7ED820,X 
    ORA.W $05E7 
    STA.L $7ED820,X 
    PLP 
    PLY 
    PLX 
    RTL 


UnmarkEvent_inA:
    PHX 
    PHY 
    PHP 
    REP #$30 
    JSL.L BitIndexToByteIndexAndBitmask 
    LDA.W $05E7 
    EOR.W #$FFFF 
    STA.W $05E7 
    LDA.L $7ED820,X 
    AND.W $05E7 
    STA.L $7ED820,X 
    PLP 
    PLY 
    PLX 
    RTL 


CheckIfEvent_inA_HasHappened:
    PHX 
    PHY 
    PHP 
    REP #$30 
    JSL.L BitIndexToByteIndexAndBitmask 
    LDA.L $7ED820,X 
    AND.W $05E7 
    BNE .marked 
    PLP 
    PLY 
    PLX 
    CLC 
    RTL 


.marked:
    PLP 
    PLY 
    PLX 
    SEC 
    RTL 


Write_supermetroid_ToSRAM:
    PHX 
    LDX.W #$000A 

.loop:
    LDA.L Text_supermetroid,X 
    STA.L $701FE0,X 
    DEX 
    DEX 
    BPL .loop 
    PLX 
    RTL 


CheckForNonCorruptSRAM:
    PHX 
    LDA.W #$0003 
    STA.W $1F59 ; Number of demo sets = 3
    LDA.W #$0000 
    JSL.L LoadFromSRAM ; Load SRAM slot A
    BCC .nonCorrupt ; If not corrupt, go to .nonCorrupt
    LDA.W #$0001 
    JSL.L LoadFromSRAM ; Load SRAM slot B
    BCC .nonCorrupt ; If not corrupt, go to .nonCorrupt
    LDA.W #$0002 
    JSL.L LoadFromSRAM ; Load SRAM slot C
    BCC .nonCorrupt ; If not corrupt, go to .nonCorrupt
    LDX.W #$000A 

.corruptLoop:
    LDA.L Text_madadameyohn,X 
    STA.L $701FE0,X ; $70:1FE0..1FEB = 'madadameyohn' (all SRAM is corrupt)
    DEX 
    DEX 
    BPL .corruptLoop 
    PLX 
    RTL ; Return


.nonCorrupt:
    LDX.W #$000A 

.nonCorruptLoop:
    LDA.L $701FE0,X 
    CMP.L Text_supermetroid,X 
    BNE .return ; If $70:1FE0..1FEB = 'supermetroid':
    DEX 
    DEX 
    BPL .nonCorruptLoop 
    LDA.W #$0004 
    STA.W $1F59 ; Number of demo sets = 4

.return:
    PLX 
    RTL 


Text_madadameyohn:
    db "madadameyohn" ; 'madadameyohn'

Text_supermetroid:
    db "supermetroid" ; 'supermetroid'

WaitUntilTheEndOfAVBlank:
    PHA 
    PHP 
    SEP #$20 

.waitVBlankStart:
    LDA.W $4212 
    BPL .waitVBlankStart ; Wait until v-blank is active

.waitVBlankEnd:
    LDA.W $4212 
    BMI .waitVBlankEnd ; Wait until v-blank has finished
    PLP 
    PLA 
    RTL 


A_Y_16bit_UnsignedMultiplication:
    PHX 
    STA.W $05E9 ; Let $05E9 = a + b * 100h
    STY.W $05EB ; Let $05EB = c + d * 100h
    STZ.W $05F1 
    STZ.W $05F3 ; Result = 0
    SEP #$10 
    LDY.W $05EB 
    STY.W $4202 
    LDY.W $05E9 
    STY.W $4203 
    NOP ; Result = ac
    NOP 
    NOP 
    LDA.W $4216 
    STA.W $05F1 
    LDY.W $05EA 
    STY.W $4203 
    NOP 
    LDA.W $05F2 ; Result += bc * 100h
    CLC 
    ADC.W $4216 
    STA.W $05F2 
    LDY.W $05EC 
    STY.W $4202 
    LDY.W $05E9 
    STY.W $4203 
    NOP ; Result += ad * 100h
    LDA.W $05F2 
    CLC 
    ADC.W $4216 
    STA.W $05F2 
    LDY.W $05EA 
    STY.W $4203 
    NOP 
    NOP 
    LDA.W $05F3 ; Result += bd * 10000h
    CLC 
    ADC.W $4216 
    STA.W $05F3 
    REP #$30 
    PLX 
    RTL 


WaitForNMI:
    PHP 
    PHB 
    PHK 
    PLB 
    SEP #$30 
    LDA.B #$01 
    STA.W $05B4 ; Set NMI request flag

.wait:
    LDA.W $05B4 
    BNE .wait ; Wait until NMI request acknowledged
    PLB 
    PLP 
    RTL 


EnableNMI:
    PHP 
    PHB 
    PHK 
    PLB 
    SEP #$20 
    LDA.B $84 
    ORA.B #$80 
    STA.W $4200 
    STA.B $84 
    PLB 
    PLP 
    RTL 


DisableNMI:
    PHP 
    PHB 
    PHK 
    PLB 
    SEP #$20 
    LDA.B $84 
    AND.B #$7F 
    STA.W $4200 
    STA.B $84 
    PLB 
    PLP 
    RTL 


SetForceBlankAndWaitForNMI:
    PHP 
    PHB 
    PHK 
    PLB 
    SEP #$20 
    LDA.B $51 
    ORA.B #$80 
    STA.B $51 
    JSL.L WaitForNMI 
    PLB 
    PLP 
    RTL 


ClearForceBlankAndWaitForNMI:
    PHP 
    PHB 
    PHK 
    PLB 
    SEP #$20 
    LDA.B $51 
    AND.B #$7F 
    STA.B $51 
    JSL.L WaitForNMI 
    PLB 
    PLP 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_UpdateCGRAM_808395:
    PHP 
    SEP #$10 
    REP #$20 
    LDA.W #$2200 
    STA.W $4310 
    LDA.W #$C000 
    STA.W $4312 
    LDX.B #$7E 
    STX.W $4314 
    LDA.W #$0200 
    STA.W $4315 
    LDX.B #$00 
    STX.W $2121 
    LDX.B #$02 
    STX.W $420B 
    PLP 
    RTL 


UNUSED_WriteYBytesOfATo_000000_X_8bit_8083BD:
    PHP 
    PHB 
    PHK 
    PLB 
    SEP #$20 
    REP #$10 

.loop:
    STA.L $000000,X 
    INX 
    DEY 
    BNE .loop 
    PLB 
    PLP 
    RTL 


UNUSED_WriteYBytesOfATo_000000_X_16bit_8083D0:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 

.loop:
    STA.L $000000,X 
    INX 
    INX 
    DEY 
    DEY 
    BNE .loop 
    PLB 
    PLP 
    RTL 


UNUSED_WriteYBytesOfATo_7E0000_X_8bit_8083E3:
    PHP 
    PHB 
    PHK 
    PLB 
    SEP #$20 
    REP #$10 

.loop:
    STA.L $7E0000,X 
    INX 
    DEY 
    BNE .loop 
    PLB 
    PLP 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


WriteYBytesOfATo_7E0000_X_16bit:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 

.loop:
    STA.L $7E0000,X 
    INX 
    INX 
    DEY 
    DEY 
    BNE .loop 
    PLB 
    PLP 
    RTL 


WriteYBytesOfATo_7F0000_X_16bit:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 

.loop:
    STA.L $7F0000,X 
    INX 
    INX 
    DEY 
    DEY 
    BNE .loop 
    PLB 
    PLP 
    RTL 


Boot:
    SEI ; Disable IRQ
    CLC 
    XCE ; Enable native mode
    JML.L .bank80 ; Execute in bank $80 (FastROM)


.bank80:
    SEP #$20 
    LDA.B #$01 
    STA.W $420D ; Enable FastROM
    STA.B $86 
    REP #$30 
    LDX.W #$1FFF 
    TXS ; Allocate stack memory
    LDA.W #$0000 
    TCD ; Clear direct page
    PHK 
    PLB ; DB = $80
    SEP #$30 
    LDX.B #$04 

.wait3Frames:
    LDA.W $4212 
    BPL .wait3Frames ; Wait the remainder of this frame and 3 more frames (???)

..wait:
    LDA.W $4212 
    BMI ..wait 
    DEX 
    BNE .wait3Frames 
    REP #$30 
    LDX.W #$1FFE 

.loop:
    STZ.W $0000,X 
    DEX ; Clear $0000..1FFF
    DEX 
    BPL .loop 
    JSL.L Initialise_IO_Registers_and_Display_Nintendo_Logo ; Initialise IO registers and display Nintendo logo
    JSL.L UploadToAPU_Hardcoded 
    dl SPC_Engine ; Upload SPC engine to APU
    BRA CommonBootSection ; Go to common boot section


SoftReset:
    SEI ; Disable IRQ
    CLC 
    XCE ; Enable native mode
    REP #$30 
    LDX.W #$1FFF 
    TXS ; Allocate stack memory
    LDA.W #$0000 
    TCD ; Clear direct page
    PHK 
    PLB ; DB = $80
    SEP #$30 
    LDX.B #$04 

.wait:
    LDA.W $4212 
    BPL .wait 

.wait3Frames:
    LDA.W $4212 
    BMI .wait3Frames ; Wait the remainder of this frame and 3 more frames (???)
    DEX 
    BNE .wait 

CommonBootSection:
    SEP #$20 
    LDA.B #$8F 
    STA.W $2100 ; Enable forced blank
    REP #$30 
    PEA.W $7E00 
    PLB 
    PLB 
    LDX.W #$1FFE 

.clearBank7E:
    STZ.W $0000,X 
    STZ.W $2000,X 
    STZ.W $4000,X 
    STZ.W $6000,X 
    STZ.W $8000,X ; Clear bank $7E
    STZ.W $A000,X 
    STZ.W $C000,X 
    STZ.W $E000,X 
    DEX 
    DEX 
    BPL .clearBank7E 
    PHK 
    PLB 
    SEP #$30 
    STZ.W $4200 
    STZ.B $84 ; Disable NMI and auto-joypad read
    LDA.B #$8F 
    STA.B $51 ; Set forced blank
    JSR.W Initialise_CPU_IO_Registers ; Initialise CPU IO registers
    JSR.W InitialisePPURegisters ; Initialise PPU registers
    JSR.W WriteALoadOf_1C2F ; Write a load of 1C2Fh
    SEP #$20 
    STZ.W $0643 
    STZ.W $0644 
    STZ.W $0645 
    STZ.W $0646 
    STZ.W $0647 
    STZ.W $0648 
    STZ.W $0649 
    STZ.W $064A 
    STZ.W $064B 
    STZ.W $064D ; Clear sound queues
    STZ.W $064E 
    STZ.W $064F 
    STZ.W $0650 
    STZ.W $0651 
    STZ.W $0652 
    STZ.W $0656 
    STZ.W $0666 
    STZ.W $0676 
    REP #$20 
    STZ.W $0590 ; OAM stack pointer = 0
    STZ.B $53 ; OAM address = 0
    JSL.L ClearHighOAM ; Clear high OAM
    JSL.L Finalise_OAM ; Finalise OAM
    STZ.W $071D ; Clear Samus tiles transfer flags
    STZ.W $071F ; Samus top half tiles definition = 0
    STZ.W $0721 ; Samus bottom half tiles definition = 0
    JSL.L EnableNMI ; Enable NMI
    REP #$30 
    STZ.W $2140 
    STZ.W $2142 ; Clear APU IO registers (harmless 16-bit write bug)
    SEP #$30 
    LDX.B #$04 

.wait:
    LDA.W $4212 
    BPL .wait 

.wait3Frames:
    LDA.W $4212 
    BMI .wait3Frames ; Wait the remainder of this frame and 3 more frames (???)
    DEX 
    BNE .wait 
    REP #$30 
    LDA.W #$0061 
    STA.W $05E5 ; Seed random number with 61h
    LDA.W #$0000 
    STA.W $063F 
    STA.W $0629 
    STA.W $062B 
    STA.W $062D 
    STA.W $062F ; Clear music queue
    STA.W $0631 
    STA.W $0633 
    STA.W $0635 
    STA.W $0637 
    LDA.L DebugConst_DebugMode 
    STA.W $05D1 ; Mirror debug byte to RAM
    JSR.W NTSC_PAL_SRAM_MappingCheck ; NTSC/PAL and SRAM mapping check
    REP #$30 
    JSL.L CheckForNonCorruptSRAM ; Check for non-corrupt SRAM
    STZ.W $05F5 ; Enable sounds
    STZ.W $0686 ; Sound handler downtime = 0
    JML.L MainGameLoop ; Go to main game loop

    db $00 ; BRK with no operand

Crash_Handler:
    JML.L Crash_Handler ; Crash handler, jump to self


if !FEATURE_KEEP_UNREFERENCED
UNUSED_WaitAFrames_808577:
    PHP 
    PHB 
    PHK 
    PLB 
    SEP #$20 
    STA.W $071C 

.waitNMI:
    JSL.L WaitForNMI 
    DEC.W $071C 
    BNE .waitNMI 
    PLB 
    PLP 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


LoadMirrorOfCurrentAreasMapExplored:
    PHP 
    REP #$30 
    LDA.W $079F 
    XBA 
    TAX 
    LDY.W #$0000 

.loop:
    LDA.L $7ECD52,X 
    STA.W $07F7,Y 
    INX 
    INX 
    INY 
    INY 
    CPY.W #$0100 
    BMI .loop 
    LDX.W $079F 
    LDA.L $7ED908,X 
    AND.W #$00FF 
    STA.W $0789 
    PLP 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Generic_Bitmasks:
    dw $0001,$0002,$0004,$0008,$0010,$0020,$0040,$0080 
endif ; !FEATURE_KEEP_UNREFERENCED

MirrorCurrentAreasMapExplored:
    PHP 
    REP #$30 
    LDA.W $079F 
    XBA 
    TAX 
    LDY.W #$0000 

.loop:
    LDA.W $07F7,Y 
    STA.L $7ECD52,X 
    INX 
    INX 
    INY 
    INY 
    CPY.W #$0100 
    BMI .loop 
    LDA.W $0789 
    BEQ .return 
    LDX.W $079F 
    LDA.L $7ED908,X 
    ORA.W #$00FF 
    STA.L $7ED908,X 

.return:
    PLP 
    RTL 


NTSC_PAL_SRAM_MappingCheck:
    PHP 
    SEP #$30 
    LDA.L Debug_RegionSRAM 
    BEQ .region ; If [$80:8000] != 0:
    JMP.W .return ; Return


.region:
    LDA.L ROM_HEADER_country&$00FFFF 
    CMP.B #$00 ; If country code != Japan:
    BEQ .japan 
    LDA.W $213F 
    BIT.B #$10 ; If PPU set to PAL:
    BEQ .failedRegion 
    JMP.W .SRAMCheck 


.japan:
    LDA.W $213F 
    BIT.B #$10 ; If PPU set to NTSC: go to .SRAMCheck
    BEQ .SRAMCheck 

.failedRegion:
    LDA.B #$8F 
    STA.W $2100 ; Enable forced blank
    STZ.W $4200 ; Disable all interrupts
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$00 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 ; VRAM $0000..1FFF = [$8E:8000..BFFF] (BG1 tiles)
    JSL.L SetupHDMATransfer ; Set up a (H)DMA transfer
    db $01,$01,$18 
    dl Tiles_Menu_BG1_BG2 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$40 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 ; VRAM $4000..47FF = [$80:B437..C436] (BG1 tilemap)
    JSL.L SetupHDMATransfer ; Set up a (H)DMA transfer
    db $01,$01,$18 
    dl Tilemap_FailedRegionCheck 
    dw $1000 
    LDA.B #$02 
    STA.W $420B 
    STZ.W $2121 
    JSL.L SetupHDMATransfer ; Set up a (H)DMA transfer
    db $01,$00,$22 ; CGRAM = [$8E:E400..E5FF] (menu palettes)
    dl Menu_Palettes 
    dw $0200 
    LDA.B #$02 
    STA.W $420B 
    STZ.W $2131 ; Disable colour math
    STZ.W $212D ; Disable subscreen
    LDA.B #$01 
    STA.W $212C ; Main screen layers = BG1
    LDA.B #$0F 
    STA.W $2100 ; Disable forced blank
    LDA.B #$00 
    STA.W $210B ; BG1 tiles base address = $0000
    LDA.B #$40 
    STA.W $2107 ; BG1 tilemap base address = $4000

.gotoCrash:
    BRA .gotoCrash 


.SRAMCheck:
    REP #$30 
    LDX.W #$1FFE 

.backupSRAM:
    LDA.L $700000,X 
    STA.L $7F0000,X ; $7F:0000..1FFF = [$70:0000..1FFF]
    DEX 
    DEX 
    BPL .backupSRAM 
    LDA.W #$0000 
    LDX.W #$1FFE 

.clearSRAM:
    STA.L $700000,X ; Clear $70:0000..1FFF
    DEX 
    DEX 
    BPL .clearSRAM 
    LDA.W #$0000 
    LDX.W #$1FFE 

.writeSRAM:
    STA.L $702000,X 
    INC A ; $70:2000..3FFF = 0..FFFh
    DEX 
    DEX 
    BPL .writeSRAM 
    LDA.W #$0000 
    LDX.W #$1FFE 

.loop:
    CMP.L $700000,X 
    BNE .failedSRAMCheck ; If [$70:0000..1FFF] != 0..FFFh: go to .failedSRAMCheck
    INC A 
    DEX 
    DEX 

.verifySRAM:
    BPL .loop 
    LDX.W #$1FFE 

.restoreSRAM:
    LDA.L $7F0000,X 
    STA.L $700000,X ; $70:0000..1FFF = [$7F:0000..1FFF]
    DEX 
    DEX 
    BPL .restoreSRAM 

.return:
    PLP 
    RTS ; return


.failedSRAMCheck:
    SEP #$20 
    LDA.B #$8F 
    STA.W $2100 ; Enable forced blank
    STZ.W $4200 ; Disable all interrupts
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$00 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 ; VRAM $0000..1FFF = [$8E:8000..BFFF] (BG1 tiles)
    JSL.L SetupHDMATransfer ; Set up a (H)DMA transfer
    db $01,$01,$18 
    dl Tiles_Menu_BG1_BG2 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$40 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 ; VRAM $4000..47FF = [$80:BC37..C436] (BG1 tilemap)
    JSL.L SetupHDMATransfer ; Set up a (H)DMA transfer
    db $01,$01,$18 
    dl Tilemap_FailedSRAMMappingCheck 
    dw $1000 
    LDA.B #$02 
    STA.W $420B 
    STZ.W $2121 
    JSL.L SetupHDMATransfer ; Set up a (H)DMA transfer
    db $01,$00,$22 ; CGRAM = [$8E:E400..E5FF] (menu palettes)
    dl Menu_Palettes 
    dw $0200 
    LDA.B #$02 
    STA.W $420B 
    STZ.W $2131 ; Disable colour math
    STZ.W $212D ; Disable subscreen
    LDA.B #$01 
    STA.W $212C ; Main screen layers = BG1
    LDA.B #$0F 
    STA.W $2100 ; Disable forced blank
    LDA.B #$00 
    STA.W $210B ; BG1 tiles base address = $0000
    LDA.B #$40 
    STA.W $2107 ; BG1 tilemap base address = $4000

.crash:
    BRA .crash ; Crash


Initialise_CPU_IO_Registers:
    LDA.B #$01 
    STA.W $4200 ; Enable auto-joypad read
    STA.B $84 
    STZ.W $4201 ; Joypad programmable IO port = 0
    STZ.W $4202 
    STZ.W $4203 ; Multiplication operands = 0
    STZ.W $4204 
    STZ.W $4205 ; Division operands = 0 (causes harmless division by zero)
    STZ.W $4206 
    STZ.W $4207 
    STZ.W $4208 ; IRQ h-counter target = 0
    STZ.W $4209 
    STZ.W $420A ; IRQ v-counter target = 0
    STZ.W $420B ; Disable all DMA channels
    STZ.W $420C 
    STZ.B $85 ; Disable all HDMA channels
    LDA.B #$01 
    STA.W $420D ; Enable FastROM
    STA.B $86 
    RTS 


InitialisePPURegisters:
    LDA.B #$8F 
    STA.W $2100 ; Enable forced blank
    STA.B $51 
    LDA.B #$03 
    STA.W $2101 ; Sprite tiles base address = $6000, sprite sizes = 8x8 / 16x16
    STA.B $52 
    STZ.W $2102 
    STZ.B $53 
    LDA.B #$80 ; OAM address = $0000, priority sprite index = 0
    STA.W $2103 
    STA.B $54 
    STZ.W $2104 
    STZ.W $2104 ; OAM $0000 = 0
    LDA.B #$09 
    STA.W $2105 ; BG mode = 1 with BG3 priority, BG tile sizes = 8x8
    STA.B $55 
    STZ.W $2106 
    STZ.B $57 ; Disable mosaic
    LDA.B #$40 
    STA.W $2107 ; BG1 tilemap base address = $4000, size = 32x32
    STA.B $58 
    LDA.B #$44 
    STA.W $2108 ; BG2 tilemap base address = $4400, size = 32x32
    STA.B $59 
    LDA.B #$48 
    STA.W $2109 ; BG3 tilemap base address = $4800, size = 32x32
    STA.B $5A 
    LDA.B #$48 ; >.<
    STZ.W $210A 
    STZ.B $5C ; BG4 tilemap base address = $0000, size = 32x32
    LDA.B #$00 
    STA.W $210B 
    STA.B $5D ; BG1/2/4 tiles base address = $0000
    LDA.B #$05 ; BG3 tiles base address = $5000
    STA.W $210C 
    STA.B $5E 
    STZ.W $210D 
    STZ.W $210D ; BG1 X scroll = 0
    STZ.W $210E 
    STZ.W $210E ; BG1 Y scroll = 0
    STZ.W $210F 
    STZ.W $210F ; BG2 X scroll = 0
    STZ.W $2110 
    STZ.W $2110 ; BG2 Y scroll = 0
    STZ.W $2111 
    STZ.W $2111 ; BG3 X scroll = 0
    STZ.W $2112 
    STZ.W $2112 ; BG3 Y scroll = 0
    STZ.W $2113 
    STZ.W $2113 ; BG4 X scroll = 0
    STZ.W $2114 
    STZ.W $2114 ; BG4 Y scroll = 0
    STZ.W $2115 ; VRAM address increment mode = 8-bit
    STZ.W $211A 
    STZ.B $5F ; Mode 7 settings = 0
    STZ.W $211B 
    STZ.W $211C 
    STZ.W $211D ; Mode 7 transformation matrix = {{0, 0}, {0, 0}}
    STZ.W $211E 
    STZ.W $211F ; Mode 7 transformation origin co-ordinate X = 0
    STZ.W $2120 ; Mode 7 transformation origin co-ordinate Y = 0
    LDA.B #$00 
    STA.W $2123 
    STA.B $60 
    LDA.B #$00 
    STA.W $2124 ; Disable all window masks
    STA.B $61 
    STZ.W $2125 
    STZ.B $62 
    LDA.B #$00 
    STA.W $2126 ; Window 1 left position = 0
    STA.B $63 
    LDA.B #$F8 
    STA.W $2127 ; Window 1 right position = F8h
    STA.B $64 
    STZ.W $2128 
    STZ.B $65 ; Window 2 left position = 0
    STZ.W $2129 
    STZ.B $66 ; Window 2 right position = 0
    STZ.W $212A 
    STZ.B $67 
    STZ.W $212B ; Window 1/2 mask logic = OR
    STZ.B $68 
    LDA.B #$11 
    STA.W $212C ; Main screen layers = BG1/sprites
    STA.B $69 
    STA.W $212E 
    STA.B $6C ; Disable BG1/sprites in window area main screen
    LDA.B #$02 
    STA.W $212D ; Subscreen layers = BG2
    STA.B $6B 
    STA.W $212F 
    STA.B $6D ; Disable BG2 in window area subscreen
    LDA.B #$02 
    STA.W $2130 ; Enable colour math subscreen layers
    STA.B $6E 
    LDA.B #$A1 
    STA.W $2131 ; Enable subtractive colour math on BG1/backdrop
    STA.B $71 
    LDA.B #$E0 
    STA.W $2132 
    LDA.B #$E0 ; >.<
    STA.W $2132 
    LDA.B #$80 
    STA.W $2132 
    STA.B $74 
    LDA.B #$40 
    STA.W $2132 ; Colour math subscreen backdrop colour = (0, 0, 0)
    STA.B $75 
    LDA.B #$20 
    STA.W $2132 
    STA.B $76 
    LDA.B #$00 
    STA.W $2133 ; Use standard NTSC resolution
    STA.B $77 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_ClearHighRAM_8088B4:
    REP #$30 
    LDA.W #$0000 
    LDX.W #$2000 
    LDY.W #$E000 ; Clear $7E:2000..FFFF
    JSL.L WriteYBytesOfATo_7E0000_X_16bit 
    LDA.W #$0000 
    TAX 
    LDY.W #$DFFE ; Clear $7F:0000..DFFD
    JSL.L WriteYBytesOfATo_7F0000_X_16bit 
    SEP #$30 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


WriteALoadOf_1C2F:
    REP #$30 
    LDA.W #$1C2F 
    JSL.L Write_800h_Bytes_Of_A_To_7E3000 ; $7E:3000..37FF = 1C2Fh
    LDA.W #$1C2F 
    JSL.L Write_800h_Bytes_Of_A_To_7E4000 ; $7E:4000..47FF = 1C2Fh
    LDA.W #$1C2F 
    JSL.L Write_800h_Bytes_Of_A_To_7E6000 ; $7E:6000..67FF = 1C2Fh
    SEP #$30 
    RTS 


Write_800h_Bytes_Of_A_To_7E3000:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDX.W #$3000 
    LDY.W #$0800 
    JSL.L WriteYBytesOfATo_7E0000_X_16bit 
    PLB 
    PLP 
    RTL 


Write_800h_Bytes_Of_A_To_7E4000:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDX.W #$4000 
    LDY.W #$0800 
    JSL.L WriteYBytesOfATo_7E0000_X_16bit 
    PLB 
    PLP 
    RTL 


Write_800h_Bytes_Of_A_To_7E6000:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDX.W #$6000 
    LDY.W #$0800 
    JSL.L WriteYBytesOfATo_7E0000_X_16bit 
    PLB 
    PLP 
    RTL 


HandleFadingOut:
    PHP 
    REP #$20 
    LDA.W $0725 
    DEC A ; If [screen fade counter] != 0:
    BMI .fadeOut 
    STA.W $0725 ; Decrement screen fade counter
    BRA .return ; Return


.fadeOut:
    LDA.W $0723 
    STA.W $0725 ; Screen fade counter = [screen fade delay]
    SEP #$30 
    LDA.B $51 
    AND.B #$0F ; If (brightness) = 0: return
    BEQ .return 
    DEC A 
    BNE .disableFBlank ; If (brightness) = 1:
    LDA.B #$80 
    STA.B $51 ; Enable forced blank, brightness = 0
    BRA .return ; Return


.disableFBlank:
    STA.B $51 ; Decrement brightness (disable forced blank)

.return:
    PLP 
    RTL 


HandleFadingIn:
    PHP 
    REP #$20 
    LDA.W $0725 
    DEC A ; If [screen fade counter] != 0:
    BMI .fadeIn 
    STA.W $0725 ; Decrement screen fade counter
    BRA .return ; Return


.fadeIn:
    LDA.W $0723 
    STA.W $0725 ; Screen fade counter = [screen fade delay]
    SEP #$30 
    LDA.B $51 
    INC A 
    AND.B #$0F ; If brightness is not max:
    BEQ .return 
    STA.B $51 ; Increment brightness (disable forced blank)

.return:
    PLP 
    RTL 


Finalise_OAM:
    PHP 
    REP #$30 
    LDA.W $0590 
    CMP.W #$0200 
    BPL .clearOAMStackPointer 
    LSR A 
    STA.B $12 
    LSR A 
    ADC.B $12 
    CLC 
    ADC.W #.spriteY00F0 
    STA.B $12 
    LDA.W #$00F0 
    SEP #$30 
    JMP.W ($0012) 


.clearOAMStackPointer:
    STZ.W $0590 
    PLP 
    RTL 


.spriteY00F0:
    STA.W $0371 
    STA.W $0375 
    STA.W $0379 
    STA.W $037D 
    STA.W $0381 
    STA.W $0385 
    STA.W $0389 
    STA.W $038D 
    STA.W $0391 
    STA.W $0395 
    STA.W $0399 
    STA.W $039D 
    STA.W $03A1 
    STA.W $03A5 
    STA.W $03A9 
    STA.W $03AD 
    STA.W $03B1 
    STA.W $03B5 
    STA.W $03B9 
    STA.W $03BD 
    STA.W $03C1 
    STA.W $03C5 
    STA.W $03C9 
    STA.W $03CD 
    STA.W $03D1 
    STA.W $03D5 
    STA.W $03D9 
    STA.W $03DD 
    STA.W $03E1 
    STA.W $03E5 
    STA.W $03E9 
    STA.W $03ED 
    STA.W $03F1 
    STA.W $03F5 
    STA.W $03F9 
    STA.W $03FD 
    STA.W $0401 
    STA.W $0405 
    STA.W $0409 
    STA.W $040D 
    STA.W $0411 
    STA.W $0415 
    STA.W $0419 
    STA.W $041D 
    STA.W $0421 
    STA.W $0425 
    STA.W $0429 
    STA.W $042D 
    STA.W $0431 
    STA.W $0435 
    STA.W $0439 
    STA.W $043D 
    STA.W $0441 
    STA.W $0445 
    STA.W $0449 
    STA.W $044D 
    STA.W $0451 
    STA.W $0455 
    STA.W $0459 
    STA.W $045D 
    STA.W $0461 
    STA.W $0465 
    STA.W $0469 
    STA.W $046D 
    STA.W $0471 
    STA.W $0475 
    STA.W $0479 
    STA.W $047D 
    STA.W $0481 
    STA.W $0485 
    STA.W $0489 
    STA.W $048D 
    STA.W $0491 
    STA.W $0495 
    STA.W $0499 
    STA.W $049D 
    STA.W $04A1 
    STA.W $04A5 
    STA.W $04A9 
    STA.W $04AD 
    STA.W $04B1 
    STA.W $04B5 
    STA.W $04B9 
    STA.W $04BD 
    STA.W $04C1 
    STA.W $04C5 
    STA.W $04C9 
    STA.W $04CD 
    STA.W $04D1 
    STA.W $04D5 
    STA.W $04D9 
    STA.W $04DD 
    STA.W $04E1 
    STA.W $04E5 
    STA.W $04E9 
    STA.W $04ED 
    STA.W $04F1 
    STA.W $04F5 
    STA.W $04F9 
    STA.W $04FD 
    STA.W $0501 
    STA.W $0505 
    STA.W $0509 
    STA.W $050D 
    STA.W $0511 
    STA.W $0515 
    STA.W $0519 
    STA.W $051D 
    STA.W $0521 
    STA.W $0525 
    STA.W $0529 
    STA.W $052D 
    STA.W $0531 
    STA.W $0535 
    STA.W $0539 
    STA.W $053D 
    STA.W $0541 
    STA.W $0545 
    STA.W $0549 
    STA.W $054D 
    STA.W $0551 
    STA.W $0555 
    STA.W $0559 
    STA.W $055D 
    STA.W $0561 
    STA.W $0565 
    STA.W $0569 
    STA.W $056D 
    STZ.W $0590 
    STZ.W $0591 
    PLP 
    RTL 


ClearHighOAM:
    PHP 
    REP #$30 
    STZ.W $0570 
    STZ.W $0572 
    STZ.W $0574 
    STZ.W $0576 
    STZ.W $0578 
    STZ.W $057A 
    STZ.W $057C 
    STZ.W $057E 
    STZ.W $0580 
    STZ.W $0582 
    STZ.W $0584 
    STZ.W $0586 
    STZ.W $0588 
    STZ.W $058A 
    STZ.W $058C 
    STZ.W $058E 
    PLP 
    RTL 


QueueMode7Transfers:
    PHX 
    PHY 
    LDY.W $0334 
    DEX 

.loop:
    BIT.W $0000,X 
    BMI .VRAM 
    BVS .CGRAM 
    STY.W $0334 
    PLY 
    PLX 
    RTL 


.CGRAM:
    LDA.W $0001,X 
    STA.W $02D0,Y 
    LDA.W $0003,X 
    STA.W $02D2,Y 
    LDA.W $0005,X 
    STA.W $02D4,Y 
    LDA.W $0007,X 
    AND.W #$00FF 
    STA.W $02D6,Y 
    TXA 
    CLC 
    ADC.W #$0007 
    TAX 
    TYA 
    CLC 
    ADC.W #$0007 
    TAY 
    BRA .loop 


.VRAM:
    LDA.W $0001,X 
    STA.W $02D0,Y 
    LDA.W $0003,X 
    STA.W $02D2,Y 
    LDA.W $0005,X 
    STA.W $02D4,Y 
    LDA.W $0007,X 
    STA.W $02D6,Y 
    LDA.W $0009,X 
    AND.W #$00FF 
    STA.W $02D8,Y 
    TXA 
    CLC 
    ADC.W #$0009 
    TAX 
    TYA 
    CLC 
    ADC.W #$0009 
    TAY 
    BRA .loop 


HandleMode7Transfers:
    PHP 
    REP #$10 
    LDX.W $0334 
    BEQ .return 
    LDX.W #$02D0 
    JSL.L ProcessMode7Transfers 
    REP #$20 
    STZ.W $02D0 
    STZ.W $0334 

.return:
    PLP 
    RTL 


ProcessMode7Transfers:
    PHP 

.loop:
    SEP #$20 
    LDA.W $0000,X 
    BMI .VRAM 
    ASL A 
    BMI .CGRAM 
    PLP 
    RTL 


.CGRAM:
    LSR A 
    AND.B #$1F 
    STA.W $4310 
    LDY.W $0001,X 
    STY.W $4312 
    LDA.W $0003,X 
    STA.W $4314 
    LDY.W $0004,X 
    STY.W $4315 
    LDA.B #$22 
    STA.W $4311 
    LDA.W $0006,X 
    STA.W $2121 
    LDA.B #$02 
    STA.W $420B 
    REP #$21 ; carry clear
    TXA 
    ADC.W #$0007 
    TAX 
    BRA .loop 


.VRAM:
    ASL A 
    BMI .VRAMTiles 
    LSR A 
    AND.B #$1F 
    STA.W $4310 
    LDY.W $0001,X 
    STY.W $4312 
    LDA.W $0003,X 
    STA.W $4314 
    LDY.W $0004,X 
    STY.W $4315 
    LDA.B #$18 
    STA.W $4311 
    LDY.W $0006,X 
    STY.W $2116 
    LDA.W $0008,X 
    STA.W $2115 
    LDA.B #$02 
    STA.W $420B 
    REP #$21 
    TXA 
    ADC.W #$0009 
    TAX 
    BRA .loop 


.VRAMTiles:
    LSR A 
    AND.B #$1F 
    STA.W $4310 
    LDY.W $0001,X 
    STY.W $4312 
    LDA.W $0003,X 
    STA.W $4314 
    LDY.W $0004,X 
    STY.W $4315 
    LDA.B #$19 
    STA.W $4311 
    LDY.W $0006,X 
    STY.W $2116 
    LDA.W $0008,X 
    STA.W $2115 
    LDA.B #$02 
    STA.W $420B 
    REP #$21 ; clear carry
    TXA 
    ADC.W #$0009 
    TAX 
    JMP.W .loop 


HandleVRAMWriteTable_ScrollingDMAs:
    PHP 
    REP #$30 
    LDX.W $0330 
    BEQ .done 
    STZ.B $D0,X 
    LDA.W #$1801 
    STA.W $4310 
    LDY.W #$0000 

.loop:
    LDA.W $00D0,Y 
    BEQ .done 
    STA.W $4315 
    LDA.W $00D2,Y 
    STA.W $4312 
    LDA.W $00D3,Y 
    STA.W $4313 
    LDA.W #$0080 
    LDX.B $D5,Y 
    BPL .skip 
    INC A 

.skip:
    STA.W $2115 
    STX.W $2116 
    SEP #$20 
    LDA.B #$02 
    STA.W $420B 
    REP #$20 
    TYA 
    CLC 
    ADC.W #$0007 
    TAY 
    BRA .loop 


.done:
    STZ.W $0330 
    SEP #$20 
    REP #$10 
    JSR.W ExecuteHorizontalScrollingDMAs 
    JSR.W ExecuteVerticalScrollingDMAs 
    PLP 
    RTL 


ExecuteHorizontalScrollingDMAs:
    LDA.B #$81 
    STA.W $2115 
    LDA.W $0962 
    BEQ .BG2 
    STZ.W $0962 
    LDY.W $095A 
    STY.W $2116 
    LDX.W #$1801 
    STX.W $4310 
    LDX.W #$C8C8 ; $7EC8C8
    STX.W $4312 
    LDA.B #$7E 
    STA.W $4314 
    LDX.W $0956 
    STX.W $4315 
    LDA.B #$02 
    STA.W $420B 
    INY 
    STY.W $2116 
    STX.W $4315 
    LDX.W #$C908 ; $7EC908
    STX.W $4312 
    LDA.B #$02 
    STA.W $420B 
    LDX.W $095E 
    STX.W $4312 
    LDX.W $0958 
    BEQ .BG2 
    STX.W $4315 
    LDY.W $095C 
    STY.W $2116 
    LDA.B #$02 
    STA.W $420B 
    INY 
    STY.W $2116 
    STX.W $4315 
    LDX.W $0960 
    STX.W $4312 
    LDA.B #$02 
    STA.W $420B 

.BG2:
    LDA.W $097E 
    BEQ .return 
    STZ.W $097E 
    LDY.W $0976 
    STY.W $2116 
    LDX.W #$1801 
    STX.W $4310 
    LDX.W #$C9D0 ; $7EC9D0
    STX.W $4312 
    LDA.B #$7E 
    STA.W $4314 
    LDX.W $0972 
    STX.W $4315 
    LDA.B #$02 
    STA.W $420B 
    INY 
    STY.W $2116 
    STX.W $4315 
    LDX.W #$CA10 ; $7ECA10
    STX.W $4312 
    LDA.B #$02 
    STA.W $420B 
    LDX.W $097A 
    STX.W $4312 
    LDX.W $0974 
    BEQ .return 
    STX.W $4315 
    LDY.W $0978 
    STY.W $2116 
    LDA.B #$02 
    STA.W $420B 
    INY 
    STY.W $2116 
    STX.W $4315 
    LDX.W $097C 
    STX.W $4312 
    LDA.B #$02 
    STA.W $420B 

.return:
    RTS 


ExecuteVerticalScrollingDMAs:
    LDA.B #$80 
    STA.W $2115 
    LDA.W $0970 
    BEQ .BG2 
    STZ.W $0970 
    LDY.W $0968 
    STY.W $2116 
    LDX.W #$1801 
    STX.W $4310 
    LDX.W #$C948 ; $7EC948
    STX.W $4312 
    LDA.B #$7E 
    STA.W $4314 
    LDX.W $0964 
    STX.W $4315 
    LDA.B #$02 
    STA.W $420B 
    REP #$20 
    TYA 
    ORA.W #$0020 
    STA.W $2116 
    SEP #$20 
    STX.W $4315 
    LDX.W #$C98C ; $7E
    STX.W $4312 
    LDA.B #$02 
    STA.W $420B 
    LDX.W $096C 
    STX.W $4312 
    LDX.W $0966 
    BEQ .BG2 
    STX.W $4315 
    LDY.W $096A 
    STY.W $2116 
    LDA.B #$02 
    STA.W $420B 
    REP #$20 
    TYA 
    ORA.W #$0020 
    STA.W $2116 
    SEP #$20 
    STX.W $4315 
    LDX.W $096E 
    STX.W $4312 
    LDA.B #$02 
    STA.W $420B 

.BG2:
    LDA.W $098C 
    BEQ .return 
    STZ.W $098C 
    LDY.W $0984 
    STY.W $2116 
    LDX.W #$1801 
    STX.W $4310 
    LDX.W #$CA50 ; $7E
    STX.W $4312 
    LDA.B #$7E 
    STA.W $4314 
    LDX.W $0980 
    STX.W $4315 
    LDA.B #$02 
    STA.W $420B 
    REP #$20 
    TYA 
    ORA.W #$0020 
    STA.W $2116 
    SEP #$20 
    STX.W $4315 
    LDX.W #$CA94 ; $7E
    STX.W $4312 
    LDA.B #$02 
    STA.W $420B 
    LDX.W $0988 
    STX.W $4312 
    LDX.W $0982 
    BEQ .return 
    STX.W $4315 
    LDY.W $0986 
    STY.W $2116 
    LDA.B #$02 
    STA.W $420B 
    SEP #$02 
    BEQ .continue 

.crash:
    BRA .crash 


.continue:
    REP #$20 
    TYA 
    ORA.W #$0020 
    STA.W $2116 
    SEP #$20 
    STX.W $4315 
    LDX.W $098A 
    STX.W $4312 
    LDA.B #$02 
    STA.W $420B 

.return:
    RTS 


HandleVRAMReadTable:
    PHP 
    SEP #$30 
    LDX.W $0360 
    BNE .readTable 
    PLP 
    RTL 


.readTable:
    STZ.W $0340,X 
    LDX.B #$00 
    LDA.B #$80 
    STA.W $2115 

.loop:
    REP #$20 
    LDA.W $0340,X 
    BEQ .done 
    STA.W $2116 
    LDA.W $2139 
    LDA.W $0342,X 
    STA.W $4310 
    LDA.W $0344,X 
    STA.W $4312 
    LDA.W $0345,X 
    STA.W $4313 
    LDA.W $0347,X 
    STA.W $4315 
    STZ.W $4317 
    STZ.W $4319 
    SEP #$20 
    LDA.B #$02 
    STA.W $420B 
    TXA 
    CLC 
    ADC.B #$09 
    TAX 
    BRA .loop 


.done:
    STZ.W $0360 
    PLP 
    RTL 


CheckIfMusicIsQueued:
    PHP 
    REP #$30 
    PHX 
    LDX.W #$000E 

.loop:
    LDA.W $0629,X 
    BNE .nonZeroTimer 
    DEX 
    DEX 
    BPL .loop 
    PLX 
    PLP 
    CLC 
    RTL 


.nonZeroTimer:
    PLX 
    PLP 
    SEC 
    RTL 


HandleMusicQueue:
    PHP 
    REP #$20 
    DEC.W $063F 
    BMI .negative 
    BEQ .positive 
    PLP 
    RTL 


.positive:
    LDA.W $063D 
    BMI .musicData 
    SEP #$20 
    AND.B #$7F 
    STA.W $07F5 
    STZ.W $07F6 
    STA.W $2140 
    STA.W $064C 
    REP #$20 
    LDA.W #$0008 
    STA.W $0686 
    LDX.W $063B 
    STZ.W $0619,X 
    STZ.W $0629,X 
    INX 
    INX 
    TXA 
    AND.W #$000E 
    STA.W $063B 

.negative:
    LDX.W $063B 
    CPX.W $0639 
    BEQ .clearTimer 
    LDA.W $0619,X 
    STA.W $063D 
    LDA.W $0629,X 
    STA.W $063F 
    PLP 
    RTL 


.clearTimer:
    STZ.W $063F 
    PLP 
    RTL 


.musicData:
    AND.W #$00FF 
    STA.W $07F3 
    TAX 
    SEP #$20 
    LDA.B #$FF 
    STA.W $064C 
    REP #$20 
    LDA.L Music_Pointers,X 
    STA.B $00 
    LDA.L Music_Pointers+1,X 
    STA.B $01 
    JSL.L UploadToAPU_long 
    SEP #$20 
    STZ.W $064C 
    REP #$20 
    LDX.W $063B 
    STZ.W $0619,X 
    STZ.W $0629,X 
    INX 
    INX 
    TXA 
    AND.W #$000E 
    STA.W $063B 
    LDA.W #$0008 
    STA.W $0686 
    PLP 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_QueueMusicDataOrTrack_808FA3:
    PHP 
    REP #$30 
    PHX 
    PHY 
    LDX.W $0639 
    STA.W $0619,X 
    LDA.W #$0010 
    STA.W $0629,X 
    INX 
    INX 
    TXA 
    AND.W #$000E 
    STA.W $0639 
    PLY 
    PLX 
    PLP 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


QueueMusicDataOrTrack_8FrameDelay:
    PHP 
    REP #$30 
    PHX 
    PHY 
    LDX.W $0998 
    CPX.W #$0028 
    BCS .return 
    PHA 
    LDA.W $0639 
    INC A 
    INC A 
    AND.W #$000E 
    TAX 
    PLA 
    CPX.W $063B 
    BEQ .return 
    LDX.W $0639 
    STA.W $0619,X 
    LDA.W #$0008 
    STA.W $0629,X 
    INX 
    INX 
    TXA 
    AND.W #$000E 
    STA.W $0639 

.return:
    PLY 
    PLX 
    PLP 
    RTL 


QueueMusicDataOrTrack_YFrameDelay:
    PHP 
    REP #$30 
    PHX 
    LDX.W $0998 
    CPX.W #$0028 
    BCS .return 
    LDX.W $0639 
    STA.W $0619,X 
    TYA 
    CMP.W #$0008 
    BCS .setTimer 
    LDA.W #$0008 

.setTimer:
    STA.W $0629,X 
    INX 
    INX 
    TXA 
    AND.W #$000E 
    STA.W $0639 

.return:
    PLX 
    PLP 
    RTL 


QueueSound:
    PHX 
    PHY 
    PHP 
    SEP #$30 
    XBA 
    LDA.B #$0F 
    BRA QueueSound_Lib1 


QueueSound_Lib1_Max9:
    PHX 
    PHY 
    PHP 
    SEP #$30 
    XBA 
    LDA.B #$09 
    BRA QueueSound_Lib1 


QueueSound_Lib1_Max3:
    PHX 
    PHY 
    PHP 
    SEP #$30 
    XBA 
    LDA.B #$03 
    BRA QueueSound_Lib1 


QueueSound_Lib1_Max1:
    PHX 
    PHY 
    PHP 
    SEP #$30 
    XBA 
    LDA.B #$01 
    BRA QueueSound_Lib1 


QueueSound_Lib1_Max6:
    PHX 
    PHY 
    PHP 
    SEP #$30 
    XBA 
    LDA.B #$06 

QueueSound_Lib1:
    STA.W $0653 
    LDA.W $0646 
    SEC 
    SBC.W $0643 
    AND.B #$0F 
    CMP.W $0653 
    BCS .return 
    XBA 
    REP #$30 
    LDX.W $05F5 
    BNE .return 
    LDX.W $0998 
    CPX.W #$0028 
    BCS .return 
    LDX.W $0592 
    BMI .return 
    SEP #$30 
    LDY.W $0646 
    TYX 
    INX 
    CPX.B #$10 
    BCC .queueSound 
    LDX.B #$00 

.queueSound:
    CPX.W $0643 
    BEQ .queueFull 
    STA.W $0656,Y 
    STX.W $0646 
    STZ.W $0656,X 

.return:
    PLP 
    PLY 
    PLX 
    RTL 


.queueFull:
    JSR.W NOPRTS_8091A7 
    CMP.W $0656,Y 
    BCS .return 
    STA.W $0656,Y 
    BRA .return 


QueueSound_Lib2_Max15:
    PHX 
    PHY 
    PHP 
    SEP #$30 
    XBA 
    LDA.B #$0F 
    BRA QueueSound_Lib2 


QueueSound_Lib2_Max9:
    PHX 
    PHY 
    PHP 
    SEP #$30 
    XBA 
    LDA.B #$09 
    BRA QueueSound_Lib2 


QueueSound_Lib2_Max3:
    PHX 
    PHY 
    PHP 
    SEP #$30 
    XBA 
    LDA.B #$03 
    BRA QueueSound_Lib2 


QueueSound_Lib2_Max1:
    PHX 
    PHY 
    PHP 
    SEP #$30 
    XBA 
    LDA.B #$01 
    BRA QueueSound_Lib2 


QueueSound_Lib2_Max6:
    PHX 
    PHY 
    PHP 
    SEP #$30 
    XBA 
    LDA.B #$06 

QueueSound_Lib2:
    STA.W $0654 
    LDA.W $0647 
    SEC 
    SBC.W $0644 
    AND.B #$0F 
    CMP.W $0654 
    BCS .return 
    XBA 
    REP #$30 
    LDX.W $05F5 
    BNE .return 
    LDX.W $0998 
    CPX.W #$0028 
    BCS .return 
    LDX.W $0592 
    BMI .return 
    SEP #$30 
    LDY.W $0647 
    TYX 
    INX 
    CPX.B #$10 
    BCC .queueSound 
    LDX.B #$00 

.queueSound:
    CPX.W $0644 
    BEQ .queueFull 
    STA.W $0666,Y 
    STX.W $0647 
    STZ.W $0666,X 

.return:
    PLP 
    PLY 
    PLX 
    RTL 


.queueFull:
    JSR.W NOPRTS_8091A7 
    CMP.W $0666,Y 
    BCS .return 
    STA.W $0666,Y 
    BRA .return 


QueueSound_Lib3_Max15:
    PHX 
    PHY 
    PHP 
    SEP #$30 
    XBA 
    LDA.B #$0F 
    BRA QueueSound_Lib3 


QueueSound_Lib3_Max9:
    PHX 
    PHY 
    PHP 
    SEP #$30 
    XBA 
    LDA.B #$09 
    BRA QueueSound_Lib3 


QueueSound_Lib3_Max3:
    PHX 
    PHY 
    PHP 
    SEP #$30 
    XBA 
    LDA.B #$03 
    BRA QueueSound_Lib3 


QueueSound_Lib3_Max1:
    PHX 
    PHY 
    PHP 
    SEP #$30 
    XBA 
    LDA.B #$01 
    BRA QueueSound_Lib3 


QueueSound_Lib3_Max6:
    PHX 
    PHY 
    PHP 
    SEP #$30 
    XBA 
    LDA.B #$06 

QueueSound_Lib3:
    STA.W $0655 
    LDA.W $0648 
    SEC 
    SBC.W $0645 
    AND.B #$0F 
    CMP.W $0655 
    BCS .return 
    XBA 
    REP #$30 
    LDX.W $05F5 
    BNE .return 
    LDX.W $0998 
    CPX.W #$0028 
    BCS .return 
    LDX.W $0592 
    BMI .return 
    SEP #$30 
    LDY.W $0648 
    TYX 
    INX 
    CPX.B #$10 
    BCC .queueSound 
    LDX.B #$00 

.queueSound:
    CPX.W $0645 
    BEQ .queueFull 
    STA.W $0676,Y 
    STX.W $0648 
    STZ.W $0676,X 

.return:
    PLP 
    PLY 
    PLX 
    RTL 


.queueFull:
    JSR.W NOPRTS_8091A7 
    CMP.W $0676,Y 
    BCS .return 
    STA.W $0676,Y 
    BRA .return 


NOPRTS_8091A7:
    NOP 
    RTS 


SetupHDMATransfer:
    PHP 
    PHB 
    REP #$30 
    LDA.B $04,S 
    PHA 
    PLB 
    PLB 
    LDA.B $03,S 
    TAY 
    LDA.W $0001,Y 
    AND.W #$00FF 
    TAX 
    LDA.L .table,X 
    AND.W #$00FF 
    TAX 
    LDA.W $0002,Y 
    STA.W $4300,X 
    LDA.W $0004,Y 
    STA.W $4302,X 
    LDA.W $0006,Y 
    STA.W $4304,X 
    LDA.W $0007,Y 
    STA.W $4305,X 
    TYA 
    CLC 
    ADC.W #$0008 
    STA.B $03,S 
    PLB 
    PLP 
    RTL 


.table:
    db $00,$10,$20,$30,$40,$50,$60,$70 

Update_IO_Registers:
    LDX.B $84 
    STX.W $4200 
    LDX.B $51 
    STX.W $2100 
    LDX.B $52 
    STX.W $2101 
    LDX.B $55 
    STX.W $2105 
    LDX.B $57 
    STX.W $2106 
    LDX.B $58 
    STX.W $2107 
    LDX.B $59 
    STX.W $2108 
    LDX.B $5A 
    STX.W $2109 
    LDX.B $5C 
    STX.W $210A 
    LDX.B $5D 
    STX.W $210B 
    LDX.B $5E 
    STX.W $210C 
    LDX.B $5F 
    STX.W $211A 
    LDX.B $60 
    STX.W $2123 
    LDX.B $61 
    STX.W $2124 
    LDX.B $62 
    STX.W $2125 
    LDX.B $63 
    STX.W $2126 
    LDX.B $64 
    STX.W $2127 
    LDX.B $65 
    STX.W $2128 
    LDX.B $66 
    STX.W $2129 
    LDX.B $67 
    STX.W $212A 
    LDX.B $68 
    STX.W $212B 
    LDX.B $69 
    STX.B $6A 
    STX.W $212C 
    LDX.B $6C 
    STX.W $212E 
    LDX.B $6B 
    STX.W $212D 
    LDX.B $6D 
    STX.W $212F 
    LDX.B $6F 
    STX.W $2130 
    LDX.B $72 
    STX.W $2131 
    LDX.B $6E 
    STX.B $70 
    LDX.B $71 
    STX.B $73 
    LDX.B $74 
    STX.W $2132 
    LDX.B $75 
    STX.W $2132 
    LDX.B $76 
    STX.W $2132 
    LDX.B $77 
    STX.W $2133 
    LDX.B $B1 
    STX.W $210D 
    LDX.B $B2 
    STX.W $210D 
    LDX.B $B3 
    STX.W $210E 
    LDX.B $B4 
    STX.W $210E 
    LDX.B $B5 
    STX.W $210F 
    LDX.B $B6 
    STX.W $210F 
    LDX.B $B7 
    STX.W $2110 
    LDX.B $B8 
    STX.W $2110 
    LDX.B $B9 
    STX.W $2111 
    LDX.B $BA 
    STX.W $2111 
    LDX.B $BB 
    STX.W $2112 
    LDX.B $BC 
    STX.W $2112 
    LDX.B $BD 
    STX.W $2113 
    LDX.B $BE 
    STX.W $2113 
    LDX.B $BF 
    STX.W $2114 
    LDX.B $C0 
    STX.W $2114 
    LDX.B $56 
    STX.W $07EC 
    LDA.B $55 
    AND.W #$0007 
    CMP.W #$0007 
    BEQ .mode7 
    LDA.B $56 
    AND.W #$0007 
    CMP.W #$0007 
    BEQ .mode7 
    RTS 


.mode7:
    LDX.B $78 
    STX.W $211B 
    LDX.B $79 
    STX.W $211B 
    LDX.B $7A 
    STX.W $211C 
    LDX.B $7B 
    STX.W $211C 
    LDX.B $7C 
    STX.W $211D 
    LDX.B $7D 
    STX.W $211D 
    LDX.B $7E 
    STX.W $211E 
    LDX.B $7F 
    STX.W $211E 
    LDX.B $80 
    STX.W $211F 
    LDX.B $81 
    STX.W $211F 
    LDX.B $82 
    STX.W $2120 
    LDX.B $83 
    STX.W $2120 
    RTS 


UpdateOAM_CGRAM:
    LDA.W #$0400 
    STA.W $4300 
    LDA.W #$0370 
    STA.W $4302 
    LDX.B #$00 
    STX.W $4304 
    LDA.W #$0220 
    STA.W $4305 
    STZ.W $2102 
    LDA.W #$2200 
    STA.W $4310 
    LDA.W #$C000 ; $7E
    STA.W $4312 
    LDX.B #$7E 
    STX.W $4314 
    LDA.W #$0200 
    STA.W $4315 
    LDX.B #$00 
    STX.W $2121 
    LDX.B #$03 
    STX.W $420B 
    RTS 


TransferSamusTilesToVRAM:
    PHB 
    LDX.B #$92 
    PHX 
    PLB 
    LDX.B #$02 
    LDY.B #$80 
    STY.W $2115 
    LDY.W $071D 
    BEQ .bottom 
    LDY.B #$02 
    LDA.W $071F 
    STA.B $3C 
    LDA.W #$6000 
    STA.W $2116 
    LDA.W #$1801 
    STA.W $4310 
    LDA.B ($3C) 
    STA.W $4312 
    STA.B $14 
    LDA.B ($3C),Y 
    STA.W $4314 
    INY 
    LDA.B ($3C),Y 
    STA.W $4315 
    CLC 
    ADC.B $14 
    STA.B $14 
    INY 
    INY 
    STX.W $420B 
    LDA.W #$6100 
    STA.W $2116 
    LDA.B $14 
    STA.W $4312 
    LDA.B ($3C),Y 
    BEQ .bottom 
    STA.W $4315 
    STX.W $420B 

.bottom:
    LDY.W $071E 
    BEQ .return 
    LDY.B #$02 
    LDA.W $0721 
    STA.B $3C 
    LDA.W #$6080 
    STA.W $2116 
    LDA.W #$1801 
    STA.W $4310 
    LDA.B ($3C) 
    STA.W $4312 
    STA.B $14 
    LDA.B ($3C),Y 
    STA.W $4314 
    INY 
    LDA.B ($3C),Y 
    STA.W $4315 
    CLC 
    ADC.B $14 
    STA.B $14 
    INY 
    INY 
    STX.W $420B 
    LDA.W #$6180 
    STA.W $2116 
    LDA.B $14 
    STA.W $4312 
    LDA.B ($3C),Y 
    BEQ .return 
    STA.W $4315 
    STX.W $420B 

.return:
    PLB 
    RTS 


ProcessAnimatedTilesObjectVRAMTransfers:
    PHB 
    LDX.B #$87 
    PHX 
    PLB 
    LDA.W $1EF1 
    BPL .return 
    LDX.B #$0A 

.loop:
    LDA.W $1EF5,X 
    BEQ .next 
    LDA.W $1F25,X 
    BEQ .next 
    STA.W $4302 
    LDY.B #$87 
    STY.W $4304 
    LDA.W #$1801 
    STA.W $4300 
    LDA.W $1F31,X 
    STA.W $4305 
    LDA.W $1F3D,X 
    STA.W $2116 
    LDY.B #$80 
    STY.W $2115 
    LDY.B #$01 
    STY.W $420B 
    STZ.W $1F25,X 

.next:
    DEX 
    DEX 
    BPL .loop 

.return:
    PLB 
    RTS 


ReadControllerInput:
    PHP 
    SEP #$20 

.wait:
    LDA.W $4212 
    AND.B #$01 
    BNE .wait 
    REP #$20 
    LDA.W $4218 
    STA.B $8B 
    EOR.B $97 
    AND.B $8B 
    STA.B $8F 
    STA.B $93 
    LDA.B $8B 
    BEQ .unheld 
    CMP.B $97 
    BNE .unheld 
    DEC.B $A3 
    BNE .heldEnd 
    LDA.B $8B 
    STA.B $93 
    LDA.B $89 
    STA.B $A3 
    BRA .heldEnd 


.unheld:
    LDA.B $87 
    STA.B $A3 

.heldEnd:
    LDA.B $8B 
    STA.B $97 
    LDA.W $05D1 
    BNE .debug 
    PLP 
    RTL 


.debug:
    LDA.W $421A 
    STA.B $8D 
    EOR.B $99 
    AND.B $8D 
    STA.B $91 
    STA.B $95 
    LDA.B $8D 
    BEQ .unheld2 
    CMP.B $99 
    BNE .unheld2 
    DEC.B $A5 
    BNE .held2End 
    LDA.B $8D 
    STA.B $95 
    LDA.B $89 
    STA.B $A5 
    BRA .held2End 


.unheld2:
    LDA.B $87 
    STA.B $A5 

.held2End:
    LDA.B $8D 
    STA.B $99 
    LDA.W $0617 
    BNE .checkDebug 
    LDA.B $8B 
    CMP.W #$3030 
    BNE .checkDebug 
    STZ.W $05F5 
    JMP.W SoftReset 


.checkDebug:
    LDA.W $05D1 
    BNE .debugEnabled 
    STZ.W $05C5 
    STZ.W $05C7 
    LDA.W #$FFEF 
    TRB.B $8D 
    TRB.B $91 
    PLP 
    RTL 


.debugEnabled:
    STZ.W $05C5 
    STZ.W $05C7 
    BIT.W $05CF 
    BVC .debugInputEnabled 
    JMP.W .return 


.debugInputEnabled:
    LDA.B $8B 
    AND.W #$2020 
    CMP.W #$2020 
    BNE .checkSelectR 
    LDA.B $8F 
    STA.W $05C5 
    STZ.B $8B 
    STZ.B $8F 

.checkSelectR:
    LDA.B $8B 
    AND.W #$2010 
    CMP.W #$2010 
    BNE .checkToggleHUD 
    LDA.B $8F 
    STA.W $05C7 
    LDA.W #$E0F0 ; >_<
    STZ.B $8B 
    STZ.B $8F 

.checkToggleHUD:
    LDA.W $05C7 
    BIT.W #$0080 
    BEQ .checkAmmoSwap 
    LDA.B $84 
    EOR.W #$0030 
    STA.B $84 

.checkAmmoSwap:
    LDA.W $05C7 
    BIT.W #$8000 
    BEQ .swapEnd 
    LDA.W $05CF 
    EOR.W #$8000 
    STA.W $05CF 
    BPL .swapAmmo 
    LDA.W $09C6 
    STA.W $05C9 
    LDA.W $09CA 
    STA.W $05CB 
    LDA.W $09CE 
    STA.W $05CD 
    STZ.W $09C6 
    STZ.W $09CA 
    STZ.W $09CE 
    BRA .swapEnd 


.swapAmmo:
    LDA.W $05C9 
    STA.W $09C6 
    LDA.W $05CB 
    STA.W $09CA 
    LDA.W $05CD 
    STA.W $09CE 

.swapEnd:
    LDA.W $05C7 
    BIT.W #$0040 
    BEQ .return 
    LDA.W $05CF 
    EOR.W #$2000 
    STA.W $05CF 

.return:
    PLP 
    RTL 


NMI:
    REP #$30 
    JML.L .bank80 


.bank80:
    PHB 
    PHD 
    PHA 
    PHX 
    PHY 
    PHK 
    PLB 
    LDA.W #$0000 
    TCD 
    SEP #$10 
    LDX.W $4210 
    LDX.W $05B4 
    BEQ .lag 
    JSR.W UpdateOAM_CGRAM 
    JSR.W TransferSamusTilesToVRAM 
    JSR.W ProcessAnimatedTilesObjectVRAMTransfers 
    JSR.W Update_IO_Registers 
    LDX.B #$00 

.handleHDMAQueue:
    LDA.W $18B4,X 
    BEQ .next 
    LDY.W $18C0,X 
    LDA.W $18D8,X 
    STA.W $4302,Y 

.next:
    INX 
    INX 
    CPX.B #$0C 
    BNE .handleHDMAQueue 
    LDX.B $55 
    CPX.B #$07 
    BEQ .mode7Enabled 
    LDX.B $56 
    CPX.B #$07 
    BNE .mode7Disabled 

.mode7Enabled:
    JSL.L HandleMode7Transfers 

.mode7Disabled:
    JSL.L HandleVRAMWriteTable_ScrollingDMAs 
    JSL.L HandleVRAMReadTable 
    SEP #$10 
    REP #$20 
    LDX.B $85 
    STX.W $420C 
    JSL.L ReadControllerInput 
    LDX.B #$00 
    STX.W $05B4 
    STX.W $05BA 
    LDX.W $05B5 
    INX 
    STX.W $05B5 
    INC.W $05B6 

.return:
    REP #$30 
    INC.W $05B8 
    PLY 
    PLX 
    PLA 
    PLD 
    PLB 
    RTI 


.lag:
    LDX.W $05BA 
    INX 
    STX.W $05BA 
    LDX.W $05BA 
    CPX.W $05BB 
    BCC .return 
    STX.W $05BB 
    BRA .return 


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

ExecuteDoorTransitionVRAMUpdate:
    SEP #$20 
    LDA.B #$80 
    STA.W $2100 
    LDX.W $05BE 
    STX.W $2116 
    LDX.W #$1801 
    STX.W $4310 
    LDX.W $05C0 
    STX.W $4312 
    LDA.W $05C2 
    STA.W $4314 
    LDX.W $05C3 
    STX.W $4315 
    LDA.B #$80 
    STA.W $2115 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$80 
    TRB.W $05BD 
    LDA.B #$0F 
    STA.W $2100 
    REP #$20 
    RTS 


Interrupt_Cmd0:
    LDA.B $A7 
    BEQ .returnZero 
    STZ.B $A7 
    BRA .return 


.returnZero:
    LDA.W #$0000 

.return:
    LDX.W #$0000 
    LDY.W #$0000 
    RTS 


Interrupt_Cmd2_DisableHVCounterInterrupts:
    LDA.W #$0030 
    TRB.B $84 
    LDA.W #$0000 
    TAX 
    TAY 
    RTS 


Interrupt_Cmd4_MainGameplay_BeginHUDDrawing:
    SEP #$20 
    LDA.B #$5A 
    STA.W $2109 
    STZ.W $2130 
    STZ.W $2131 
    LDA.B #$04 
    STA.W $212C 
    REP #$20 
    LDA.W #$0006 
    LDY.W #$001F 
    LDX.W #$0098 
    RTS 


Interrupt_Cmd6_MainGameplay_EndHUDDrawing:
    SEP #$20 
    LDA.B $70 
    STA.W $2130 
    LDA.B $73 
    STA.W $2131 
    LDA.B $5B 
    STA.W $2109 
    LDA.B $6A 
    STA.W $212C 
    REP #$20 
    LDA.B $A7 
    BEQ .setCommand4 
    STZ.B $A7 
    BRA .return 


.setCommand4:
    LDA.W #$0004 

.return:
    LDY.W #$0000 
    LDX.W #$0098 
    RTS 


Interrupt_Cmd8_StartDoorTransition_BeginHUDDrawing:
    SEP #$20 
    LDA.B #$5A 
    STA.W $2109 
    LDA.B #$04 
    STA.W $212C 
    STZ.W $2130 
    STZ.W $2131 
    REP #$20 
    LDA.W #$000A 
    LDY.W #$001F 
    LDX.W #$0098 
    RTS 


Interrupt_CmdA_StartDoorTransition_EndHUDDrawing:
    SEP #$20 
    LDA.W $07B3 
    ORA.W $07B1 
    BIT.B #$01 
    BEQ .BG1Sprites 
    LDA.B #$10 
    BRA .sprites 


.BG1Sprites:
    LDA.B #$11 

.sprites:
    STA.W $212C 
    REP #$20 
    LDA.B $A7 
    BEQ .command8 
    STZ.B $A7 
    BRA .return 


.command8:
    LDA.W #$0008 

.return:
    LDY.W #$0000 
    LDX.W #$0098 
    RTS 


Interrupt_CmdC_Draygon_BeginHUDDrawing:
    SEP #$20 
    LDA.B #$04 
    STA.W $212C 
    STZ.W $2130 
    STZ.W $2131 
    REP #$20 
    LDA.W #$000E 
    LDY.W #$001F 
    LDX.W #$0098 
    RTS 


Interrupt_CmdE_Draygon_EndHUDDrawing:
    SEP #$20 
    LDA.B $5B 
    STA.W $2109 
    LDA.B $70 
    STA.W $2130 
    LDA.B $73 
    STA.W $2131 
    REP #$20 
    LDA.B $A7 
    BEQ .commandC 
    STZ.B $A7 
    BRA .return 


.commandC:
    LDA.W #$000C 

.return:
    LDY.W #$0000 
    LDX.W #$0098 
    RTS 


Interrupt_Cmd10_VerticalDoorTransition_BeginHUDDrawing:
    SEP #$20 
    LDA.B #$04 
    STA.W $212C 
    STZ.W $2130 
    STZ.W $2131 
    REP #$20 
    LDA.W #$0012 
    LDY.W #$001F 
    LDX.W #$0098 
    RTS 


Interrupt_Cmd12_VerticalDoorTransition_EndHUDDrawing:
    SEP #$20 
    LDA.W $07B3 
    ORA.W $07B1 
    BIT.B #$01 
    BEQ .BG1Sprites 
    LDA.B #$10 
    BRA .sprites 


.BG1Sprites:
    LDA.B #$11 

.sprites:
    STA.W $212C 
    STZ.W $2130 
    STZ.W $2131 
    REP #$20 
    LDX.W $05BC 
    BPL .scrolling 
    JSR.W ExecuteDoorTransitionVRAMUpdate 

.scrolling:
    LDA.W $0931 
    BMI .return 
    JSL.L DoorTransitionScrolling 

.return:
    LDA.W #$0014 
    LDY.W #$00D8 
    LDX.W #$0098 
    RTS 


Interrupt_Cmd14_VerticalDoorTransition_EndDrawing:
    LDA.B $A7 
    BEQ .command10 
    STZ.B $A7 
    BRA .return 


.command10:
    LDA.W #$0010 

.return:
    LDY.W #$0000 
    LDX.W #$0098 
    STZ.W $05B4 
    INC.W $05B4 
    RTS 


Interrupt_Cmd16_HorizontalDoorTransition_BeginHUDDrawing:
    SEP #$20 
    LDA.B #$04 
    STA.W $212C 
    STZ.W $2130 
    STZ.W $2131 
    REP #$20 
    LDA.W #$0018 
    LDY.W #$001F 
    LDX.W #$0098 
    RTS 


Interrupt_Cmd18_HorizontalDoorTransition_EndHUDDrawing:
    SEP #$20 
    LDA.W $07B3 
    ORA.W $07B1 
    BIT.B #$01 
    BEQ .BG1Sprites 
    LDA.B #$10 
    BRA .sprites 


.BG1Sprites:
    LDA.B #$11 

.sprites:
    STA.W $212C 
    STZ.W $2130 
    STZ.W $2131 
    REP #$20 
    LDA.W $0931 
    BMI .return 
    JSL.L DoorTransitionScrolling 

.return:
    LDA.W #$001A 
    LDY.W #$00A0 
    LDX.W #$0098 
    RTS 


Interrupt_Cmd1A_HorizontalDoorTransition_EndDrawing:
    LDX.W $05BC 
    BPL .nextCommand 
    JSR.W ExecuteDoorTransitionVRAMUpdate 

.nextCommand:
    LDA.B $A7 
    BEQ .command16 
    STZ.B $A7 
    BRA .return 


.command16:
    LDA.W #$0016 

.return:
    LDY.W #$0000 
    LDX.W #$0098 
    STZ.W $05B4 
    INC.W $05B4 
    RTS 


EnableHVCounterInterrupts:
    PHP 
    REP #$30 
    LDA.W #$0000 
    STA.W $4209 
    LDA.W #$0098 
    STA.W $4207 
    LDA.W #$0030 
    TSB.B $84 
    PLP 
    CLI 
    RTL 


EnableHVCounterInterruptsNow:
    PHP 
    REP #$30 
    LDA.W #$0000 
    STA.W $4209 
    LDA.W #$0098 
    STA.W $4207 
    LDA.W #$0030 
    TSB.B $84 
    SEP #$20 
    LDA.B $84 
    STA.W $4200 
    PLP 
    CLI 
    RTL 


DisableHVCounterInterrupts:
    PHP 
    REP #$30 
    LDA.W #$0030 
    TRB.B $84 
    PLP 
    SEI 
    RTL 


IRQ:
    REP #$30 
    JML.L .bank80 


.bank80:
    PHB 
    PHA 
    PHX 
    PHY 
    PHK 
    PLB 
    LDA.W $4211 
    LDX.B $AB 
    JSR.W (InterruptCommandPointers,X) 
    STA.B $AB 
    STY.W $4209 
    STX.W $4207 
    PLY 
    PLX 
    PLA 
    PLB 
    RTI 


Tilemap_HUD:
  .topRow
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F 
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F 
    dw $2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F,$2C0F 
    dw $2C0F,$2C0F,$2C1D,$2C1D,$2C1D,$2C1D,$2C1D,$2C1C 

  .rows123
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

  .autoReserve
    dw $3C33,$3C46 
    dw $3C47,$3C48 
    dw $BC33,$BC46 

  .emptyAutoReserve
    dw $2C33,$2C46 
    dw $2C47,$2C48 
    dw $AC33,$AC46 

  .missiles
    dw $344B,$3449,$744B 
    dw $344C,$344A,$744C 

  .superMissiles
    dw $3434,$7434 
    dw $3435,$7435 

  .powerBombs
    dw $3436,$7436 
    dw $3437,$7437 

  .grapple
    dw $3438,$7438 
    dw $3439,$7439 

  .xray
    dw $343A,$743A 
    dw $343B,$743B 

AddMissilesToHUDTilemap:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.L $7EC61C 
    AND.W #$03FF 
    CMP.W #$000F 
    BNE .return 
    LDA.W Tilemap_HUD_missiles 
    STA.L $7EC61C 
    LDA.W Tilemap_HUD_missiles+2 
    STA.L $7EC61E 
    LDA.W Tilemap_HUD_missiles+4 
    STA.L $7EC620 
    LDA.W Tilemap_HUD_missiles+6 
    STA.L $7EC65C 
    LDA.W Tilemap_HUD_missiles+8 
    STA.L $7EC65E 
    LDA.W Tilemap_HUD_missiles+$A 
    STA.L $7EC660 

.return:
    PLB 
    PLP 
    RTL 


AddSuperMissilesToHUDTilemap:
    PHP 
    PHX 
    PHY 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDY.W #Tilemap_HUD_superMissiles 
    LDX.W #$001C 
    BRA Write2x2TileIconToHUDTilemap 


AddPowerBombsToHUDTilemap:
    PHP 
    PHX 
    PHY 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDY.W #Tilemap_HUD_powerBombs 
    LDX.W #$0022 
    BRA Write2x2TileIconToHUDTilemap 


AddGrappleToHUDTilemap:
    PHP 
    PHX 
    PHY 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDY.W #Tilemap_HUD_grapple 
    LDX.W #$0028 
    BRA Write2x2TileIconToHUDTilemap 


AddXrayToHUDTilemap:
    PHP 
    PHX 
    PHY 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDY.W #Tilemap_HUD_xray 
    LDX.W #$002E 

Write2x2TileIconToHUDTilemap:
    LDA.L $7EC608,X 
    AND.W #$03FF 
    CMP.W #$000F 
    BNE .return 
    LDA.W $0000,Y 
    STA.L $7EC608,X 
    LDA.W $0002,Y 
    STA.L $7EC60A,X 
    LDA.W $0004,Y 
    STA.L $7EC648,X 
    LDA.W $0006,Y 
    STA.L $7EC64A,X 

.return:
    PLB 
    PLY 
    PLX 
    PLP 
    RTL 


InitialiseHUD_GameLoading:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W #$5800 
    STA.W $2116 
    LDA.W #$0080 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl Tilemap_HUD_topRow 
    dw $0040 
    SEP #$20 
    LDA.B #$02 
    STA.W $420B 
    REP #$20 
    LDX.W #$0000 

.loopRows123:
    LDA.W Tilemap_HUD_rows123,X 
    STA.L $7EC608,X 
    INX 
    INX 
    CPX.W #$00C0 
    BNE .loopRows123 
    LDA.W $09A2 
    BIT.W #$8000 
    BEQ .grapple 
    JSL.L AddXrayToHUDTilemap 

.grapple:
    LDA.W $09A2 
    BIT.W #$4000 
    BEQ .missiles 
    JSL.L AddGrappleToHUDTilemap 

.missiles:
    LDA.W $09C8 
    BEQ .superMissiles 
    JSL.L AddMissilesToHUDTilemap 

.superMissiles:
    LDA.W $09CC 
    BEQ .powerBombs 
    JSL.L AddSuperMissilesToHUDTilemap 

.powerBombs:
    LDA.W $09D0 
    BEQ .previous 
    JSL.L AddPowerBombsToHUDTilemap 

.previous:
    STZ.W $0A06 
    STZ.W $0A08 
    STZ.W $0A0A 
    STZ.W $0A0C 
    STZ.W $0A0E 
    JSL.L Initialise_Minimap_broken 
    LDA.W #Tilemap_HUDDigits_ammo 
    STA.B $00 
    LDA.W #$0080 ; bank $80
    STA.B $02 
    LDA.W $09C8 
    BEQ .maxSuperMissiles 
    LDA.W $09C6 
    LDX.W #$0094 
    JSR.W DrawThreeHUDDigits 

.maxSuperMissiles:
    LDA.W $09CC 
    BEQ .maxPowerBombs 
    LDX.W #$009C 
    LDA.W $09CA 
    JSR.W DrawTwoHUDDigits 

.maxPowerBombs:
    LDA.W $09D0 
    BEQ .highlight 
    LDA.W $09CE 
    LDX.W #$00A2 
    JSR.W DrawTwoHUDDigits 

.highlight:
    LDA.W $09D2 
    LDX.W #$1000 
    JSR.W ToggleHUDItemHighlight 
    LDA.W $0A0E 
    LDX.W #$1400 
    JSR.W ToggleHUDItemHighlight 
    JSL.L HandleHUDTilemap_PausedAndRunning 
    PLB 
    PLP 
    RTL 


HandleHUDTilemap_PausedAndRunning:
    PHP 
    PHB 
    PHK 
    PLB 
    SEP #$20 
    STZ.B $02 
    REP #$30 
    LDA.W $09C0 
    CMP.W #$0001 
    BNE .handleSamusHealth 
    LDY.W #Tilemap_HUD_autoReserve 
    LDA.W $09D6 
    BNE .drawAutoReserve 
    LDY.W #Tilemap_HUD_emptyAutoReserve 

.drawAutoReserve:
    LDA.W $0000,Y 
    STA.L $7EC618 
    LDA.W $0002,Y 
    STA.L $7EC61A 
    LDA.W $0004,Y 
    STA.L $7EC658 
    LDA.W $0006,Y 
    STA.L $7EC65A 
    LDA.W $0008,Y 
    STA.L $7EC698 
    LDA.W $000A,Y 
    STA.L $7EC69A 

.handleSamusHealth:
    LDA.W $09C2 
    CMP.W $0A06 
    BEQ .handleSamusMissiles 
    STA.W $0A06 
    LDA.W $09C2 
    STA.W $4204 
    SEP #$20 
    LDA.B #$64 
    STA.W $4206 
    PHA 
    PLA 
    PHA 
    PLA 
    REP #$20 
    LDA.W $4214 
    STA.B $14 
    LDA.W $4216 
    STA.B $12 
    LDA.W $09C4 
    STA.W $4204 
    SEP #$20 
    LDA.B #$64 
    STA.W $4206 
    PHA 
    PLA 
    PHA 
    PLA 
    REP #$30 
    LDY.W #$0000 
    LDA.W $4214 
    INC A 
    STA.B $16 

.loopEtanks:
    DEC.B $16 
    BEQ .drawEtanksDigits 
    LDX.W #$3430 
    LDA.B $14 
    BEQ .drawEtanks 
    DEC.B $14 
    LDX.W #$2831 

.drawEtanks:
    TXA 
    LDX.W .etankIconOffsets,Y 
    STA.L $7EC608,X 
    INY 
    INY 
    CPY.W #$001C 
    BMI .loopEtanks 

.drawEtanksDigits:
    LDA.W #Tilemap_HUDDigits_health 
    STA.B $00 
    LDX.W #$008C 
    LDA.B $12 
    JSR.W DrawTwoHUDDigits 

.handleSamusMissiles:
    LDA.W #Tilemap_HUDDigits_ammo 
    STA.B $00 
    LDA.W $09C8 
    BEQ .handleSuperMissiles 
    LDA.W $09C6 
    CMP.W $0A08 
    BEQ .handleSuperMissiles 
    STA.W $0A08 
    LDX.W #$0094 
    JSR.W DrawThreeHUDDigits 

.handleSuperMissiles:
    LDA.W $09CC 
    BEQ .handlePowerBombs 
    LDA.W $09CA 
    CMP.W $0A0A 
    BEQ .handlePowerBombs 
    STA.W $0A0A 
    LDX.W #$009C 
    LDA.W $05CF 
    BIT.W #$1F40 
    BNE .debugSuperMissiles 
    LDA.W $0A0A 
    JSR.W DrawTwoHUDDigits 
    BRA .handlePowerBombs 


.debugSuperMissiles:
    LDA.W $0A0A 
    JSR.W DrawThreeHUDDigits 

.handlePowerBombs:
    LDA.W $09D0 
    BEQ .handleHighlighter 
    LDA.W $09CE 
    CMP.W $0A0C 
    BEQ .handleHighlighter 
    STA.W $0A0C 
    LDX.W #$00A2 
    JSR.W DrawTwoHUDDigits 

.handleHighlighter:
    LDA.W $09D2 
    CMP.W $0A0E 
    BEQ .handleAutoCancel 
    LDX.W #$1000 
    JSR.W ToggleHUDItemHighlight 
    LDA.W $0A0E 
    LDX.W #$1400 
    JSR.W ToggleHUDItemHighlight 
    LDA.W $09D2 
    STA.W $0A0E 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0003 
    BEQ .handleAutoCancel 
    CMP.W #$0014 
    BEQ .handleAutoCancel 
    LDA.W $0D32 
    CMP.W #GrappleBeamFunction_Inactive 
    BNE .handleAutoCancel 
    LDA.W $0A78 
    BNE .handleAutoCancel 
    LDA.W #$0039 
    JSL.L QueueSound_Lib1_Max6 

.handleAutoCancel:
    LDX.W #$1400 
    LDA.W $05B5 
    BIT.W #$0010 
    BEQ .highlight 
    LDX.W #$1000 

.highlight:
    LDA.W $0A04 
    JSR.W ToggleHUDItemHighlight 
    LDX.W $0330 
    LDA.W #$00C0 
    STA.B $D0,X 
    INX 
    INX 
    LDA.W #$C608 ; $7E
    STA.B $D0,X 
    INX 
    INX 
    LDA.W #$007E 
    STA.B $D0,X 
    INX 
    LDA.W #$5820 
    STA.B $D0,X 
    INX 
    INX 
    STX.W $0330 
    PLB 
    PLP 
    RTL 


.etankIconOffsets:
    dw $0042,$0044,$0046,$0048,$004A,$004C,$004E ; bottom (first) row
    dw $0002,$0004,$0006,$0008,$000A,$000C,$000E ; top (second) row

ToggleHUDItemHighlight:
    STX.W $077C 
    DEC A 
    BMI .return 
    ASL A 
    TAY 
    LDX.W .HUDItemOffsets,Y 
    LDA.L $7EC608,X 
    CMP.W #$2C0F 
    BEQ .topRightMiddle 
    AND.W #$E3FF 
    ORA.W $077C 
    STA.L $7EC608,X 

.topRightMiddle:
    LDA.L $7EC60A,X 
    CMP.W #$2C0F 
    BEQ .bottomLeft 
    AND.W #$E3FF 
    ORA.W $077C 
    STA.L $7EC60A,X 

.bottomLeft:
    LDA.L $7EC648,X 
    CMP.W #$2C0F 
    BEQ .bottomRightMiddle 
    AND.W #$E3FF 
    ORA.W $077C 
    STA.L $7EC648,X 

.bottomRightMiddle:
    LDA.L $7EC64A,X 
    CMP.W #$2C0F 
    BEQ .checkY 
    AND.W #$E3FF 
    ORA.W $077C 
    STA.L $7EC64A,X 

.checkY:
    CPY.W #$0000 
    BEQ .topRight 
    RTS 


.topRight:
    LDA.L $7EC60C,X 
    CMP.W #$2C0F 
    BEQ .bottomRight 
    AND.W #$E3FF 
    ORA.W $077C 
    STA.L $7EC60C,X 

.bottomRight:
    LDA.L $7EC64C,X 
    CMP.W #$2C0F 
    BEQ .return 
    AND.W #$E3FF 
    ORA.W $077C 
    STA.L $7EC64C,X 

.return:
    RTS 

.HUDItemOffsets:
    dw $0014 ; Missiles
    dw $001C ; Super missiles
    dw $0022 ; Power bombs
    dw $0028 ; Grapple beam
    dw $002E ; X-ray

DrawThreeHUDDigits:
    STA.W $4204 
    SEP #$20 
    LDA.B #$64 
    STA.W $4206 
    PHA 
    PLA 
    PHA 
    PLA 
    REP #$20 
    LDA.W $4214 
    ASL A 
    TAY 
    LDA.B [$00],Y 
    STA.L $7EC608,X 
    INX 
    INX 
    LDA.W $4216 

DrawTwoHUDDigits:
    STA.W $4204 
    SEP #$20 
    LDA.B #$0A 
    STA.W $4206 
    PHA 
    PLA 
    PHA 
    PLA 
    REP #$20 
    LDA.W $4214 
    ASL A 
    TAY 
    LDA.B [$00],Y 
    STA.L $7EC608,X 
    LDA.W $4216 
    ASL A 
    TAY 
    LDA.B [$00],Y 
    STA.L $7EC60A,X 
    RTS 


Tilemap_HUDDigits:
  .health
    dw $2C09,$2C00,$2C01,$2C02,$2C03,$2C04,$2C05,$2C06 
    dw $2C07,$2C08 

  .ammo
    dw $2C09,$2C00,$2C01,$2C02,$2C03,$2C04,$2C05,$2C06 
    dw $2C07,$2C08 

ProcessTimer:
    PHB 
    PHK 
    PLB 
    PHX 
    PHY 
    LDA.W $0943 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    PLY 
    PLX 
    PLB 
    RTL 


.pointers:
    dw ProcessTimer_Inactive 
    dw ProcessTimer_CeresStart 
    dw ProcessTimer_MotherBrainStart 
    dw ProcessTimer_InitialDelay 
    dw ProcessTimer_RunningMovementDelayed 
    dw ProcessTimer_RunningMovingIntoPlace 
    dw ProcessTimer_RunningMovingIntoPlace_return 

ProcessTimer_CeresStart:
    JSL.L ClearTimerRAM 
    LDA.W #$0100 
    JSL.L SetTimer 
    LDA.W #$8003 
    STA.W $0943 

ProcessTimer_Inactive:
    CLC 
    RTS 


ProcessTimer_MotherBrainStart:
    JSL.L ClearTimerRAM 
    LDA.W #$0300 
    JSL.L SetTimer 
    LDA.W #$8003 
    STA.W $0943 
    CLC 
    RTS 


ProcessTimer_InitialDelay:
    SEP #$20 
    INC.W $0948 
    LDA.W $0948 
    CMP.B #$10 
    BCC .return 
    INC.W $0943 

.return:
    REP #$21 
    RTS 


ProcessTimer_RunningMovementDelayed:
    SEP #$20 
    INC.W $0948 
    LDA.W $0948 
    CMP.B #$60 
    BCC .return 
    STZ.W $0948 
    INC.W $0943 

.return:
    REP #$20 
    JMP.W DecrementTimer 


ProcessTimer_RunningMovingIntoPlace:
    LDY.W #$0000 
    LDA.W #$00E0 
    CLC 
    ADC.W $0948 
    CMP.W #$DC00 
    BCC .XinPosition 
    INY 
    LDA.W #$DC00 

.XinPosition:
    STA.W $0948 
    LDA.W #$FF3F 
    CLC 
    ADC.W $094A 
    CMP.W #$3000 
    BCS .YinPosition 
    INY 
    LDA.W #$3000 

.YinPosition:
    STA.W $094A 
    CPY.W #$0002 
    BNE ProcessTimer_RunningMovingIntoPlace_return 
    INC.W $0943 

ProcessTimer_RunningMovingIntoPlace_return:
    JMP.W DecrementTimer 


SetTimer:
    STZ.W $0945 
    STA.W $0946 
    RTL 


ClearTimerRAM:
    LDA.W #$8000 
    STA.W $0948 
    LDA.W #$8000 
    STA.W $094A 
    STZ.W $0945 
    STZ.W $0946 
    STZ.W $0943 
    RTL 


DecrementTimer:
    SEP #$39 ; Set carry and decimal
    LDA.W $05B6 
    AND.B #$7F 
    TAX 
    LDA.W $0945 
    SBC.W .centiseconds,X 
    STA.W $0945 
    BCS .checkExpired 
    LDA.W $0946 
    SBC.B #$00 
    STA.W $0946 
    BCS .checkExpired 
    LDA.W $0947 
    SBC.B #$00 
    STA.W $0947 
    BCC .clearTimer 
    LDA.B #$59 
    STA.W $0946 
    BRA .checkExpired 


.clearTimer:
    STZ.W $0945 
    STZ.W $0946 
    STZ.W $0947 

.checkExpired:
    REP #$39 
    LDA.W $0945 
    ORA.W $0946 
    BNE .return 
    SEC 

.return:
    RTS 


.centiseconds:
    db $01,$02,$02,$01,$02,$02,$01,$02,$02,$01,$02,$02,$02,$01,$02,$02 
    db $01,$02,$02,$01,$02,$02,$01,$02,$01,$02,$02,$01,$02,$02,$01,$02 
    db $01,$02,$02,$01,$02,$02,$01,$02,$02,$01,$02,$02,$02,$01,$02,$02 
    db $01,$02,$02,$01,$02,$02,$01,$02,$01,$02,$02,$01,$02,$02,$01,$02 
    db $01,$02,$02,$01,$02,$02,$01,$02,$02,$01,$02,$02,$02,$01,$02,$02 
    db $01,$02,$02,$01,$02,$02,$01,$02,$01,$02,$02,$01,$02,$02,$01,$02 
    db $01,$02,$02,$01,$02,$02,$01,$02,$02,$01,$02,$02,$02,$01,$02,$02 
    db $01,$02,$02,$01,$02,$02,$01,$02,$02,$01,$02,$02,$02,$01,$02,$02 

DrawTimer:
    PHB 
    PHK 
    PLB 
    LDY.W #Spritemap_Timer_TIME 
    LDA.W #$0000 
    JSR.W DrawTimerSpritemap 
    LDA.W $0947 
    LDX.W #$FFE4 
    JSR.W DrawTwoTimerDigits 
    LDA.W $0946 
    LDX.W #$FFFC 
    JSR.W DrawTwoTimerDigits 
    LDA.W $0945 
    LDX.W #$0014 
    JSR.W DrawTwoTimerDigits 
    PLB 
    RTL 


DrawTwoTimerDigits:
    PHX 
    PHA 
    AND.W #$00F0 
    LSR #3
    TAX 
    LDY.W TimerDigitsSpritemapPointers,X 
    LDA.B $03,S 
    JSR.W DrawTimerSpritemap 
    PLA 
    AND.W #$000F 
    ASL A 
    TAX 
    LDY.W TimerDigitsSpritemapPointers,X 
    PLA 
    ADC.W #$0008 

DrawTimerSpritemap:
    STA.B $14 
    LDA.W $0948 
    XBA 
    AND.W #$00FF 
    CLC 
    ADC.B $14 
    STA.B $14 
    LDA.W $094A 
    XBA 
    AND.W #$00FF 
    STA.B $12 
    LDA.W #$0A00 
    STA.B $16 
    JSL.L AddSpritemapToOAM 
    RTS 


TimerDigitsSpritemapPointers:
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

Spritemap_Timer_TIME:
    dw $0005 
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 5, $1F8)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 3, 5, $1F7)
    %spritemapEntry(0, $1E0, $F0, 0, 0, 3, 5, $1F6)
    %spritemapEntry(0, $008, $F8, 0, 0, 3, 5, $1F5)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 5, $1F4)

StartGameplay:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    SEI 
    STZ.W $420B 
    STZ.W $07E9 
    STZ.W $07F3 
    STZ.W $07F5 
    STZ.W $0943 
    JSL.L ResetSoundQueues 
    LDA.W #$FFFF 
    STA.W $05F5 
    JSL.L DisableNMI 
    JSL.L DisableHVCounterInterrupts 
    JSL.L Load_Destination_Room 
    JSR.W HandleMusicQueueFor20Frames 
    JSL.L Clear_AnimatedTilesObjects 
    JSL.L Wait_End_VBlank_Clear_HDMA 
    JSL.L Initialise_Special_Effects_for_New_Room 
    JSL.L Clear_PLMs 
    JSL.L Clear_Enemy_Projectiles 
    JSL.L Clear_PaletteFXObjects 
    JSL.L Update_Beam_Tiles_and_Palette 
    JSL.L Load_Target_Colors_for_Common_SpritesBeamsFlashingEnemies 
    JSL.L Load_Enemies 
    JSL.L Queue_Room_Music_Data 
    JSR.W HandleMusicQueueFor20Frames 
    JSL.L Update_Music_Track_Index 
    JSL.L RTL_82E113 
    JSL.L ClearBG2Tilemap 
    JSL.L LoadLevelData_CRE_TileTable_ScrollData_PLMs_DoorASM_RoomASM 
    JSL.L Load_FX_Header 
    JSL.L LoadLibraryBackground_LoadingPausing 
    JSR.W CalculateLayer2XPosition 
    JSR.W CalculateLayer2YPosition 
    LDA.W $0917 
    STA.W $0921 
    LDA.W $0919 
    STA.W $0923 
    JSR.W CalculateBGScrolls 
    JSL.L DisplayViewablePartOfRoom 
    JSL.L EnableNMI 
    LDA.B $A9 
    BNE .setNextInterrupt 
    LDA.W #$0004 

.setNextInterrupt:
    STA.B $A7 
    JSL.L EnableHVCounterInterrupts 
    JSR.W HandleMusicQueueFor20Frames 
    JSL.L Spawn_Hardcoded_PLM 
    db $08,$08 
    dw PLMEntries_enableSoundsIn20Frames_F0FramesIfCeres 
    LDA.W #DoorTransitionFunction_FadeInTheScreen_and_RunEnemies_Finish 
    STA.W $099C 
    PLB 
    PLP 
    RTL 


HandleMusicQueueFor20Frames:
    PHP 
    SEP #$30 
    JSL.L EnableNMI 
    LDX.B #$14 

.loop:
    PHX 
    PHP 
    JSL.L HandleMusicQueue 
    JSL.L WaitForNMI 
    PLP 
    PLX 
    DEX 
    BNE .loop 
    JSL.L DisableNMI 
    PLP 
    RTS 


ResumeGameplay:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    SEI 
    STZ.W $420B 
    JSL.L DisableNMI 
    JSL.L DisableHVCounterInterrupts 
    JSL.L Load_CRETiles_TilesetTiles_and_TilesetPalette_DB_8F 
    JSL.L LoadLibraryBackground_LoadingPausing 
    JSL.L DisplayViewablePartOfRoom 
    JSL.L Load_Room_PLM_Graphics 
    JSL.L EnableNMI 
    JSL.L EnableHVCounterInterrupts 
    PLB 
    PLP 
    RTL 


DisplayViewablePartOfRoom:
    PHP 
    SEP #$20 
    LDA.B $58 
    SEC 
    SBC.B $59 
    XBA 
    REP #$20 
    AND.W #$F800 
    STA.W $098E 
    JSR.W Calculate_BGScroll_LayerPositionBlocks 
    LDX.W #$0000 

.loop:
    PHX 
    LDA.W $08F7 
    STA.W $0990 
    LDA.W $08F9 
    STA.W $0992 
    LDA.W $0907 
    STA.W $0994 
    LDA.W $0909 
    STA.W $0996 
    JSR.W UpdateLevelDataColumn 
    LDA.W $091B 
    LSR A 
    BCS .increment 
    LDA.W $08FB 
    STA.W $0990 
    LDA.W $08FD 
    STA.W $0992 
    LDA.W $090B 
    STA.W $0994 
    LDA.W $090D 
    STA.W $0996 
    JSR.W UpdateBackgroundDataColumn 

.increment:
    JSL.L HandleVRAMWriteTable_ScrollingDMAs 
    PLX 
    INC.W $08F7 
    INC.W $0907 
    INC.W $08FB 
    INC.W $090B 
    INX 
    CPX.W #$0011 
    BNE .loop 
    PLP 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_QueueClearingOfBG2Tilemap_80A1E3:
    LDX.W #$0FFE 
    LDA.W #$0338 

.loop:
    STA.L $7E4000,X 
    DEX 
    DEX 
    BPL .loop 
    LDX.W $0330 
    LDA.W #$1000 
    STA.B $D0,X 
    LDA.W #$4000 
    STA.B $D2,X 
    LDA.W #$007E 
    STA.B $D4,X 
    LDA.W #$4800 
    STA.B $D5,X 
    TXA 
    CLC 
    ADC.W #$0007 
    STA.W $0330 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


QueueClearingOfFXTilemap:
    LDX.W #$0EFE 
    LDA.W #$184E 

.loop:
    STA.L $7E4000,X 
    DEX 
    DEX 
    BPL .loop 
    LDX.W $0330 
    LDA.W #$0F00 
    STA.B $D0,X 
    LDA.W #$4000 
    STA.B $D2,X 
    LDA.W #$007E 
    STA.B $D4,X 
    LDA.W #$5880 
    STA.B $D5,X 
    TXA 
    CLC 
    ADC.W #$0007 
    STA.W $0330 
    RTL 


ClearBG2Tilemap:
    PHP 
    REP #$20 
    LDA.W #$4800 
    STA.W $2116 
    LDA.W #$1808 
    STA.W $4310 
    LDA.W #.addr 
    STA.W $4312 
    LDA.W #$0080 
    STA.W $4314 
    LDA.W #$0800 
    STA.W $4315 
    SEP #$20 
    LDA.B #$00 
    STA.W $2115 
    LDA.B #$02 
    STA.W $420B 
    REP #$20 
    LDA.W #$4800 
    STA.W $2116 
    LDA.W #$1908 
    STA.W $4310 
    LDA.W #.addr 
    STA.W $4312 
    LDA.W #$0080 
    STA.W $4314 
    LDA.W #$0800 
    STA.W $4315 
    SEP #$20 
    LDA.B #$80 
    STA.W $2115 
    LDA.B #$02 
    STA.W $420B 
    PLP 
    RTL 


.addr:
    dw $0338 

ClearFXTilemap:
    PHP 
    REP #$20 
    LDA.W #$5880 
    STA.W $2116 
    LDA.W #$1808 
    STA.W $4310 
    LDA.W #.addr 
    STA.W $4312 
    LDA.W #$0080 
    STA.W $4314 
    LDA.W #$0780 
    STA.W $4315 
    SEP #$20 
    LDA.B #$00 
    STA.W $2115 
    LDA.B #$02 
    STA.W $420B 
    REP #$20 
    LDA.W #$5880 
    STA.W $2116 
    LDA.W #$1908 
    STA.W $4310 
    LDA.W #.addr+1 
    STA.W $4312 
    LDA.W #$0080 
    STA.W $4314 
    LDA.W #$0780 
    STA.W $4315 
    SEP #$20 
    LDA.B #$80 
    STA.W $2115 
    LDA.B #$02 
    STA.W $420B 
    PLP 
    RTL 


.addr:
    dw $184E 

CalculateLayer2XPosition:
    PHP 
    LDY.W $0911 
    SEP #$20 
    LDA.W $091B 
    BEQ .scrollReturn 
    CMP.B #$01 
    BEQ .return 
    AND.B #$FE 
    STA.W $4202 
    LDA.W $0911 
    STA.W $4203 
    STZ.W $0934 
    PHA 
    PLA 
    LDA.W $4217 
    STA.W $0933 
    LDA.W $0912 
    STA.W $4203 
    REP #$20 
    LDA.W $0933 
    CLC 
    ADC.W $4216 
    TAY 

.scrollReturn:
    REP #$20 
    TYA 
    STA.W $0917 
    PLP 
    CLC 
    RTS 


.return:
    PLP 
    SEC 
    RTS 


CalculateLayer2YPosition:
    PHP 
    LDY.W $0915 
    SEP #$20 
    LDA.W $091C 
    BEQ .scrollReturn 
    CMP.B #$01 
    BEQ .return 
    AND.B #$FE 
    STA.W $4202 
    LDA.W $0915 
    STA.W $4203 
    STZ.W $0934 
    PHA 
    PLA 
    LDA.W $4217 
    STA.W $0933 
    LDA.W $0916 
    STA.W $4203 
    REP #$20 
    LDA.W $0933 
    CLC 
    ADC.W $4216 
    TAY 

.scrollReturn:
    REP #$20 
    TYA 
    STA.W $0919 
    PLP 
    CLC 
    RTS 


.return:
    PLP 
    SEC 
    RTS 


CalculateBGScrolls:
    LDA.W $0911 
    CLC 
    ADC.W $091D 
    STA.B $B1 
    LDA.W $0915 
    CLC 
    ADC.W $091F 
    STA.B $B3 
    LDA.W $0917 
    CLC 
    ADC.W $0921 
    STA.B $B5 
    LDA.W $0919 
    CLC 
    ADC.W $0923 
    STA.B $B7 
    RTS 


CalculateBGScrolls_UpdateBGGraphics_WhenScrolling:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    JSR.W CalculateBGScrolls 
    BRA UpdateBGGraphics_WhenScrolling 


Calc_Layer2Position_BGScrolls_UpdateBGGraphics_WhenScrolling:
    LDA.W $0A78 
    BEQ .continue 
    RTL 


.continue:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0911 
    CLC 
    ADC.W $091D 
    STA.B $B1 
    LDA.W $0915 
    CLC 
    ADC.W $091F 
    STA.B $B3 
    JSR.W CalculateLayer2XPosition 
    BCS .layer2Y 
    CLC 
    ADC.W $0921 
    STA.B $B5 

.layer2Y:
    JSR.W CalculateLayer2YPosition 
    BCS UpdateBGGraphics_WhenScrolling 
    CLC 
    ADC.W $0923 
    STA.B $B7 

UpdateBGGraphics_WhenScrolling:
    REP #$20 
    JSR.W Calculate_BGScroll_LayerPositionBlocks 
    LDX.W #$0000 
    LDA.W $08F7 
    CMP.W $08FF 
    BEQ .layer1HorizontalEnd 
    STA.W $08FF 
    BMI .updateLayer1 
    LDX.W #$0010 

.updateLayer1:
    TXA 
    CLC 
    ADC.W $08F7 
    STA.W $0990 
    TXA 
    CLC 
    ADC.W $0907 
    STA.W $0994 
    LDA.W $08F9 
    STA.W $0992 
    LDA.W $0909 
    STA.W $0996 
    JSR.W UpdateLevelDataColumn 

.layer1HorizontalEnd:
    LDA.W $091B 
    LSR A 
    BCS .layer2HorizontalEnd 
    LDX.W #$0000 
    LDA.W $08FB 
    CMP.W $0903 
    BEQ .layer2HorizontalEnd 
    STA.W $0903 
    BMI .updateLayer2 
    LDX.W #$0010 

.updateLayer2:
    TXA 
    CLC 
    ADC.W $08FB 
    STA.W $0990 
    TXA 
    CLC 
    ADC.W $090B 
    STA.W $0994 
    LDA.W $08FD 
    STA.W $0992 
    LDA.W $090D 
    STA.W $0996 
    JSR.W UpdateBackgroundDataColumn 

.layer2HorizontalEnd:
    LDX.W #$0001 
    LDA.W $08F9 
    CMP.W $0901 
    BEQ .layer1VerticalEnd 
    STA.W $0901 
    BMI + 
    LDX.W #$000F 

  + TXA 
    CLC 
    ADC.W $08F9 
    STA.W $0992 
    TXA 
    CLC 
    ADC.W $0909 
    STA.W $0996 
    LDA.W $08F7 
    STA.W $0990 
    LDA.W $0907 
    STA.W $0994 
    JSR.W UpdateLevelDataRow 

.layer1VerticalEnd:
    LDA.W $091C 
    LSR A 
    BCS .return 
    LDX.W #$0001 
    LDA.W $08FD 
    CMP.W $0905 
    BEQ .return 
    STA.W $0905 
    BMI .finish 
    LDX.W #$000F 

.finish:
    TXA 
    CLC 
    ADC.W $08FD 
    STA.W $0992 
    TXA 
    CLC 
    ADC.W $090D 
    STA.W $0996 
    LDA.W $08FB 
    STA.W $0990 
    LDA.W $090B 
    STA.W $0994 
    JSR.W UpdateBackgroundDataRow 

.return:
    PLB 
    PLP 
    RTL 


Calculate_BGScroll_LayerPositionBlocks:
    LDA.B $B1 
    LSR #4
    STA.W $0907 
    LDA.B $B5 
    LSR #4
    STA.W $090B 
    LDA.W $0911 
    LSR #4
    BIT.W #$0800 
    BEQ + 
    ORA.W #$F000 

  + STA.W $08F7 
    LDA.W $0917 
    LSR #4
    BIT.W #$0800 
    BEQ + 
    ORA.W #$F000 

  + STA.W $08FB 
    LDA.B $B3 
    LSR #4
    STA.W $0909 
    LDA.B $B7 
    LSR #4
    STA.W $090D 
    LDA.W $0915 
    LSR #4
    BIT.W #$0800 
    BEQ + 
    ORA.W #$F000 

  + STA.W $08F9 
    LDA.W $0919 
    LSR #4
    BIT.W #$0800 
    BEQ + 
    ORA.W #$F000 

  + STA.W $08FD 
    RTS 


HandleScrollZones_HorizontalAutoscrolling:
    PHP 
    PHB 
    SEP #$20 
    LDA.W $0A78 
    ORA.W $0A79 
    BEQ + 
    JMP.W .return 


  + LDA.B #$8F 
    PHA 
    PLB 
    REP #$30 
    LDA.W $0911 
    STA.W $0939 
    BPL + 
    STZ.W $0911 

  + LDA.W $07A9 
    DEC A 
    XBA 
    CMP.W $0911 
    BCS + 
    STA.W $0911 

  + LDA.W $0915 
    CLC 
    ADC.W #$0080 
    XBA 
    SEP #$20 
    STA.W $4202 
    LDA.W $07A9 
    STA.W $4203 
    REP #$20 
    LDA.W $0912 
    AND.W #$00FF 
    CLC 
    ADC.W $4216 
    TAX 
    LDA.L $7ECD20,X 
    AND.W #$00FF 
    BNE .unboundedFromLeft 
    LDA.W $0911 
    AND.W #$FF00 
    CLC 
    ADC.W #$0100 
    STA.W $0933 
    LDA.W $0939 
    CLC 
    ADC.W $0DA2 
    ADC.W #$0002 
    CMP.W $0933 
    BCS .reachedRightScrollBoundary 
    STA.W $0939 
    LDA.W $0915 
    CLC 
    ADC.W #$0080 
    XBA 
    SEP #$20 
    STA.W $4202 
    LDA.W $07A9 
    STA.W $4203 
    REP #$20 
    LDA.W $093A 
    INC A 
    AND.W #$00FF 
    CLC 
    ADC.W $4216 
    TAX 
    LDA.L $7ECD20,X 
    AND.W #$00FF 
    BNE .returnLayer1X 
    LDA.W $0939 
    AND.W #$FF00 
    BRA + 


.returnLayer1X:
    LDA.W $0939 
    BRA + 


.reachedRightScrollBoundary:
    LDA.W $0933 
    BRA + 


.unboundedFromLeft:
    INX 
    LDA.L $7ECD20,X 
    AND.W #$00FF 
    BNE .return 
    LDA.W $0911 
    AND.W #$FF00 
    STA.W $0933 
    LDA.W $0939 
    SEC 
    SBC.W $0DA2 
    SBC.W #$0002 
    CMP.W $0933 
    BMI .reachedLeftScrollBoundary 
    STA.W $0939 
    LDA.W $0915 
    CLC 
    ADC.W #$0080 
    XBA 
    SEP #$20 
    STA.W $4202 
    LDA.W $07A9 
    STA.W $4203 
    REP #$20 
    LDA.W $093A 
    AND.W #$00FF 
    CLC 
    ADC.W $4216 
    TAX 
    LDA.L $7ECD20,X 
    AND.W #$00FF 
    BNE .return0939 
    LDA.W $0939 
    AND.W #$FF00 
    CLC 
    ADC.W #$0100 
    BRA + 


.return0939:
    LDA.W $0939 
    BRA + 


.reachedLeftScrollBoundary:
    LDA.W $0933 

  + STA.W $0911 

.return:
    PLB 
    PLP 
    RTL 


HandleScrollZones_ScrollingRight:
    PHP 
    PHB 
    SEP #$20 
    LDA.B #$8F 
    PHA 
    PLB 
    REP #$30 
    LDA.W $0911 
    STA.W $0939 
    LDA.W $0B0A 
    CMP.W $0911 
    BPL + 
    LDA.W $0B0A 
    STA.W $0911 
    STZ.W $090F 

  + LDA.W $07A9 
    DEC A 
    XBA 
    CMP.W $0911 
    BCS + 
    STA.W $0911 
    BRA .return 


  + LDA.W $0915 
    CLC 
    ADC.W #$0080 
    XBA 
    SEP #$20 
    STA.W $4202 
    LDA.W $07A9 
    STA.W $4203 
    REP #$20 
    LDA.W $0912 
    AND.W #$00FF 
    SEC 
    ADC.W $4216 
    TAX 
    LDA.L $7ECD20,X 
    AND.W #$00FF 
    BNE .return 
    LDA.W $0911 
    AND.W #$FF00 
    STA.W $0933 
    LDA.W $0939 
    SEC 
    SBC.W $0DA2 
    SBC.W #$0002 
    CMP.W $0933 
    BPL + 
    LDA.W $0933 

  + STA.W $0911 

.return:
    PLB 
    PLP 
    RTL 


HandleScrollZones_ScrollingLeft:
    PHP 
    PHB 
    SEP #$20 
    LDA.B #$8F 
    PHA 
    PLB 
    REP #$30 
    LDA.W $0911 
    STA.W $0939 
    CMP.W $0B0A 
    BPL + 
    LDA.W $0B0A 
    STA.W $0911 
    STZ.W $090F 

  + LDA.W $0911 
    BPL + 
    STZ.W $0911 
    BRA .return 


  + LDA.W $0915 
    CLC 
    ADC.W #$0080 
    XBA 
    SEP #$20 
    STA.W $4202 
    LDA.W $07A9 
    STA.W $4203 
    REP #$20 
    LDA.W $0912 
    AND.W #$00FF 
    CLC 
    ADC.W $4216 
    TAX 
    LDA.L $7ECD20,X 
    AND.W #$00FF 
    BNE .return 
    LDA.W $0911 
    AND.W #$FF00 
    CLC 
    ADC.W #$0100 
    STA.W $0933 
    LDA.W $0939 
    CLC 
    ADC.W $0DA2 
    ADC.W #$0002 
    CMP.W $0933 
    BCC + 
    LDA.W $0933 

  + STA.W $0911 

.return:
    PLB 
    PLP 
    RTL 


HandleScrollZones_VerticalAutoscrolling:
    PHP 
    PHB 
    SEP #$20 
    LDA.W $0A78 
    ORA.W $0A79 
    BEQ + 
    JMP.W .return 


  + LDA.B #$8F 
    PHA 
    PLB 
    REP #$30 
    LDY.W #$0000 
    SEP #$20 
    LDA.W $0916 
    STA.W $4202 
    LDA.W $07A9 
    STA.W $4203 
    REP #$20 
    LDA.W $0911 
    CLC 
    ADC.W #$0080 
    XBA 
    AND.W #$00FF 
    CLC 
    ADC.W $4216 
    STA.B $14 
    TAX 
    LDA.L $7ECD20,X 
    AND.W #$00FF 
    CMP.W #$0001 
    BEQ + 
    LDY.W #$001F 

  + STY.W $0933 
    LDA.W $0915 
    STA.W $0939 
    BPL + 
    STZ.W $0915 

  + LDA.W $07AB 
    DEC A 
    XBA 
    CLC 
    ADC.W $0933 
    CMP.W $0915 
    BCS + 
    STA.W $0915 

  + SEP #$20 
    LDA.W $0916 
    STA.W $4202 
    LDA.W $07A9 
    STA.W $4203 
    REP #$20 
    LDA.W $0911 
    CLC 
    ADC.W #$0080 
    XBA 
    AND.W #$00FF 
    CLC 
    ADC.W $4216 
    TAX 
    LDA.L $7ECD20,X 
    AND.W #$00FF 
    BNE .unboundedFromAbove 
    LDA.W $0915 
    AND.W #$FF00 
    CLC 
    ADC.W #$0100 
    STA.W $0935 
    LDA.W $0939 
    CLC 
    ADC.W $0DA6 
    ADC.W #$0002 
    CMP.W $0935 
    BCS .reachedBottomScrollBoundary 
    STA.W $0939 
    SEP #$20 
    LDA.W $093A 
    INC A 
    STA.W $4202 
    LDA.W $07A9 
    STA.W $4203 
    REP #$20 
    LDA.W $0911 
    CLC 
    ADC.W #$0080 
    XBA 
    AND.W #$00FF 
    CLC 
    ADC.W $4216 
    TAX 
    LDA.L $7ECD20,X 
    AND.W #$00FF 
    BNE + 
    LDA.W $0939 
    AND.W #$FF00 
    BRA .returnLayer1Y 


  + LDA.W $0939 
    BRA .returnLayer1Y 


.reachedBottomScrollBoundary:
    LDA.W $0935 
    BRA .returnLayer1Y 


.unboundedFromAbove:
    TXA 
    CLC 
    ADC.W $07A9 
    TAX 
    LDA.L $7ECD20,X 
    AND.W #$00FF 
    BNE .return 
    LDA.W $0915 
    AND.W #$FF00 
    CLC 
    ADC.W $0933 
    STA.W $0937 
    CMP.W $0915 
    BCS .return 
    LDA.W $0939 
    SEC 
    SBC.W $0DA6 
    SBC.W #$0002 
    CMP.W $0937 
    BMI .reachedTopScrollBoundary 
    STA.W $0939 
    SEP #$20 
    LDA.W $093A 
    STA.W $4202 
    LDA.W $07A9 
    STA.W $4203 
    REP #$20 
    LDA.W $0911 
    CLC 
    ADC.W #$0080 
    XBA 
    AND.W #$00FF 
    CLC 
    ADC.W $4216 
    TAX 
    LDA.L $7ECD20,X 
    AND.W #$00FF 
    BNE .returnProposedLayer1X 
    LDA.W $0939 
    AND.W #$FF00 
    CLC 
    ADC.W #$0100 
    BRA .returnLayer1Y 


.returnProposedLayer1X:
    LDA.W $0939 
    BRA .returnLayer1Y 


.reachedTopScrollBoundary:
    LDA.W $0937 

.returnLayer1Y:
    STA.W $0915 

.return:
    PLB 
    PLP 
    RTL 


HandleScrollZones_ScrollingDown:
    PHP 
    PHB 
    SEP #$20 
    LDA.B #$8F 
    PHA 
    PLB 
    REP #$30 
    LDA.W $0915 
    STA.W $0939 
    LDY.W #$0000 
    SEP #$20 
    LDA.W $0916 
    STA.W $4202 
    LDA.W $07A9 
    STA.W $4203 
    REP #$20 
    LDA.W $0911 
    CLC 
    ADC.W #$0080 
    XBA 
    AND.W #$00FF 
    CLC 
    ADC.W $4216 
    STA.B $14 
    TAX 
    LDA.L $7ECD20,X 
    AND.W #$00FF 
    CMP.W #$0001 
    BEQ + 
    LDY.W #$001F 

  + STY.W $0933 
    LDA.W $0B0E 
    CMP.W $0915 
    BPL + 
    LDA.W $0B0E 
    STA.W $0915 
    STZ.W $0913 

  + LDA.W $07AB 
    DEC A 
    XBA 
    CLC 
    ADC.W $0933 
    STA.W $0937 
    CMP.W $0915 
    BCC .setLayer1Y 
    LDA.B $14 
    CLC 
    ADC.W $07A9 
    TAX 
    LDA.L $7ECD20,X 
    AND.W #$00FF 
    BNE .return 
    LDA.W $0915 
    AND.W #$FF00 
    CLC 
    ADC.W $0933 
    STA.W $0937 
    CMP.W $0915 
    BCS .return 

.setLayer1Y:
    LDA.W $0939 
    SEC 
    SBC.W $0DA6 
    SBC.W #$0002 
    CMP.W $0937 
    BPL + 
    LDA.W $0937 

  + STA.W $0915 

.return:
    PLB 
    PLP 
    RTL 


HandleScrollZones_ScrollingUp:
    PHP 
    PHB 
    SEP #$20 
    LDA.B #$8F 
    PHA 
    PLB 
    REP #$30 
    LDA.W $0915 
    STA.W $0939 
    CMP.W $0B0E 
    BPL + 
    LDA.W $0B0E 
    STA.W $0915 
    STZ.W $0913 

  + LDA.W $0915 
    BPL + 
    STZ.W $0915 
    BRA .return 


  + SEP #$20 
    LDA.W $0916 
    STA.W $4202 
    LDA.W $07A9 
    STA.W $4203 
    REP #$20 
    LDA.W $0911 
    CLC 
    ADC.W #$0080 
    XBA 
    AND.W #$00FF 
    CLC 
    ADC.W $4216 
    TAX 
    LDA.L $7ECD20,X 
    AND.W #$00FF 
    BNE .return 
    LDA.W $0915 
    AND.W #$FF00 
    CLC 
    ADC.W #$0100 
    STA.W $0933 
    LDA.W $0939 
    CLC 
    ADC.W $0DA6 
    ADC.W #$0002 
    CMP.W $0933 
    BCC + 
    LDA.W $0933 

  + STA.W $0915 

.return:
    PLB 
    PLP 
    RTL 


Debug_Layer1Position_Saving_Loading:
    LDA.B $91 
    AND.W #$0040 
    BEQ + 
    INC.W $05D3 

  + LDA.W $05D3 
    LSR A 
    BCC + 
    LDA.W $05D5 
    STA.W $0911 
    LDA.W $05D7 
    STA.W $0915 
    RTL 


  + LDA.W $0911 
    STA.W $05D5 
    LDA.W $0915 
    STA.W $05D7 
    RTL 


UpdateBackgroundDataColumn:
    LDX.W #$001C 
    BRA UpdateLevelBackgroundDataColumn 


UpdateLevelDataColumn:
    LDX.W #$0000 

UpdateLevelBackgroundDataColumn:
    LDA.W $0783 
    BEQ + 
    RTS 


  + PHP 
    SEP #$20 
    LDA.W $07A5 
    STA.W $4202 
    LDA.W $0992 
    STA.W $4203 
    PHB 
    REP #$30 
    LDA.W $0990 
    CLC 
    ADC.W $4216 
    ASL A 
    CLC 
    ADC.W #$0002 
    TXY 
    BEQ + 
    CLC 
    ADC.W #$9600 ; $7F

  + STA.B $36 
    LDA.W #$007F 
    STA.B $38 
    LDA.W $0996 
    ASL #2
    AND.W #$003C 
    STA.W $0958,X 
    EOR.W #$003F 
    INC A 
    STA.W $0956,X 
    SEP #$20 
    LDA.W $0996 
    AND.B #$0F 
    STA.W $4202 
    LDA.B #$40 
    STA.W $4203 
    REP #$20 
    LDA.W $0994 
    AND.W #$001F 
    STA.W $0935 
    ASL A 
    CLC 
    ADC.W $4216 
    STA.W $0933 
    LDA.W #$5000 
    LDY.W $0935 
    CPY.W #$0010 
    BCC + 
    LDA.W #$53E0 

  + TXY 
    BEQ + 
    SEC 
    SBC.W $098E 

  + STA.W $0937 
    CLC 
    ADC.W $0933 
    STA.W $095A,X 
    LDA.W $0937 
    CLC 
    ADC.W $0935 
    ADC.W $0935 
    STA.W $095C,X 
    LDA.W #$C8C8 ; $7E
    LDY.W #$0000 
    CPX.W #$0000 
    BEQ + 
    LDA.W #$C9D0 ; $7E
    LDY.W #$0108 

  + CLC 
    ADC.W $0956,X 
    STA.W $095E,X 
    CLC 
    ADC.W #$0040 
    STA.W $0960,X 
    STY.W $0937 
    SEP #$20 
    LDA.B #$7E 
    PHA 
    PLB 
    REP #$20 
    PHX 
    LDY.W #$0000 
    LDA.W #$0010 
    STA.W $0939 

.loop:
    LDA.B [$36],Y 
    STA.W $093B 
    AND.W #$03FF 
    ASL #3
    TAX 
    PHY 
    LDY.W $0937 
    LDA.W $093B 
    AND.W #$0C00 
    BNE + 
    LDA.W $A000,X 
    STA.W $C8C8,Y 
    LDA.W $A002,X 
    STA.W $C908,Y 
    LDA.W $A004,X 
    STA.W $C8CA,Y 
    LDA.W $A006,X 
    STA.W $C90A,Y 
    JMP.W .next 


  + CMP.W #$0400 
    BNE + 
    LDA.W $A002,X 
    EOR.W #$4000 
    STA.W $C8C8,Y 
    LDA.W $A000,X 
    EOR.W #$4000 
    STA.W $C908,Y 
    LDA.W $A006,X 
    EOR.W #$4000 
    STA.W $C8CA,Y 
    LDA.W $A004,X 
    EOR.W #$4000 
    STA.W $C90A,Y 
    BRA .next 


  + CMP.W #$0800 
    BNE + 
    LDA.W $A004,X 
    EOR.W #$8000 
    STA.W $C8C8,Y 
    LDA.W $A006,X 
    EOR.W #$8000 
    STA.W $C908,Y 
    LDA.W $A000,X 
    EOR.W #$8000 
    STA.W $C8CA,Y 
    LDA.W $A002,X 
    EOR.W #$8000 
    STA.W $C90A,Y 
    BRA .next 


  + LDA.W $A006,X 
    EOR.W #$C000 
    STA.W $C8C8,Y 
    LDA.W $A004,X 
    EOR.W #$C000 
    STA.W $C908,Y 
    LDA.W $A002,X 
    EOR.W #$C000 
    STA.W $C8CA,Y 
    LDA.W $A000,X 
    EOR.W #$C000 
    STA.W $C90A,Y 

.next:
    INY 
    INY 
    INY 
    INY 
    STY.W $0937 
    PLA 
    CLC 
    ADC.W $07A5 
    ADC.W $07A5 
    TAY 
    DEC.W $0939 
    BEQ .return 
    JMP.W .loop 


.return:
    PLX 
    INC.W $0962,X 
    PLB 
    PLP 
    RTS 


UpdateBackgroundDataRow:
    LDX.W #$001C 
    BRA UpdateBackgroundLevelDataRow 


UpdateLevelDataRow:
    LDX.W #$0000 

UpdateBackgroundLevelDataRow:
    LDA.W $0783 
    BEQ + 
    RTS 


  + PHP 
    SEP #$20 
    LDA.W $07A5 
    STA.W $4202 
    LDA.W $0992 
    STA.W $4203 
    PHB 
    REP #$30 
    LDA.W $0990 
    CLC 
    ADC.W $4216 
    ASL A 
    CLC 
    ADC.W #$0002 
    TXY 
    BEQ + 
    CLC 
    ADC.W #$9600 ; $7F

  + STA.B $36 
    LDA.W #$007F 
    STA.B $38 
    LDA.W $0994 
    AND.W #$000F 
    STA.W $0933 
    LDA.W #$0010 
    SEC 
    SBC.W $0933 
    ASL #2
    STA.W $0964,X 
    LDA.W $0933 
    INC A 
    ASL #2
    STA.W $0966,X 
    SEP #$20 
    LDA.W $0996 
    AND.B #$0F 
    STA.W $4202 
    LDA.B #$40 
    STA.W $4203 
    REP #$20 
    LDA.W $0994 
    AND.W #$001F 
    STA.W $0935 
    ASL A 
    CLC 
    ADC.W $4216 
    STA.W $0933 
    LDA.W #$5400 
    STA.W $0937 
    LDA.W #$5000 
    LDY.W $0935 
    CPY.W #$0010 
    BCC + 
    LDA.W #$5000 
    STA.W $0937 
    LDA.W #$53E0 

  + TXY 
    BEQ + 
    SEC 
    SBC.W $098E 

  + CLC 
    ADC.W $0933 
    STA.W $0968,X 
    LDA.W $0937 
    TXY 
    BEQ + 
    SEC 
    SBC.W $098E 

  + CLC 
    ADC.W $4216 
    STA.W $096A,X 
    LDA.W #$C948 ; $7E
    LDY.W #$0000 
    CPX.W #$0000 
    BEQ + 
    LDA.W #$CA50 ; $7E
    LDY.W #$0108 

  + CLC 
    ADC.W $0964,X 
    STA.W $096C,X 
    CLC 
    ADC.W #$0044 
    STA.W $096E,X 
    STY.W $0937 
    SEP #$20 
    LDA.B #$7E 
    PHA 
    PLB 
    REP #$20 
    PHX 
    LDY.W #$0000 
    LDA.W #$0011 
    STA.W $0939 

.loop:
    LDA.B [$36],Y 
    STA.W $093B 
    AND.W #$03FF 
    ASL #3
    TAX 
    PHY 
    LDY.W $0937 
    LDA.W $093B 
    AND.W #$0C00 
    BNE + 
    LDA.W $A000,X 
    STA.W $C948,Y 
    LDA.W $A002,X 
    STA.W $C94A,Y 
    LDA.W $A004,X 
    STA.W $C98C,Y 
    LDA.W $A006,X 
    STA.W $C98E,Y 
    JMP.W .next 


  + CMP.W #$0400 
    BNE + 
    LDA.W $A002,X 
    EOR.W #$4000 
    STA.W $C948,Y 
    LDA.W $A000,X 
    EOR.W #$4000 
    STA.W $C94A,Y 
    LDA.W $A006,X 
    EOR.W #$4000 
    STA.W $C98C,Y 
    LDA.W $A004,X 
    EOR.W #$4000 
    STA.W $C98E,Y 
    BRA .next 


  + CMP.W #$0800 
    BNE + 
    LDA.W $A004,X 
    EOR.W #$8000 
    STA.W $C948,Y 
    LDA.W $A006,X 
    EOR.W #$8000 
    STA.W $C94A,Y 
    LDA.W $A000,X 
    EOR.W #$8000 
    STA.W $C98C,Y 
    LDA.W $A002,X 
    EOR.W #$8000 
    STA.W $C98E,Y 
    BRA .next 


  + LDA.W $A006,X 
    EOR.W #$C000 
    STA.W $C948,Y 
    LDA.W $A004,X 
    EOR.W #$C000 
    STA.W $C94A,Y 
    LDA.W $A002,X 
    EOR.W #$C000 
    STA.W $C98C,Y 
    LDA.W $A000,X 
    EOR.W #$C000 
    STA.W $C98E,Y 

.next:
    INY 
    INY 
    INY 
    INY 
    STY.W $0937 
    PLY 
    INY 
    INY 
    DEC.W $0939 
    BEQ .return 
    JMP.W .loop 


.return:
    PLX 
    INC.W $0970,X 
    PLB 
    PLP 
    RTS 


DrawTopRowOfScreenForUpwardsDoorTransition:
    STZ.W $0925 
    JSR.W Calculate_BGScroll_LayerPositionBlocks 
    JSR.W UpdatePreviousLayerBlocks 
    INC.W $0901 
    INC.W $0905 
    JSR.W DoorTransitionScrolling_Up 
    RTL 


DoorTransitionScrollingSetup:
    REP #$30 
    LDA.W $0927 
    STA.W $0911 
    LDA.W $0929 
    STA.W $0915 
    LDA.W $0791 
    AND.W #$0003 
    ASL A 
    TAX 
    JSR.W (Door_Transition_Scrolling_Setup_Pointers,X) 
    RTL 


DoorTransitionScrollingSetup_Right:
    JSR.W CalculateLayer2XPosition 
    SEC 
    SBC.W #$0100 
    STA.W $0917 
    JSR.W CalculateLayer2YPosition 
    LDA.W $0911 
    SEC 
    SBC.W #$0100 
    STA.W $0911 
    JSR.W UpdateBGScrollOffsets 
    JSR.W Calculate_BGScroll_LayerPositionBlocks 
    JSR.W UpdatePreviousLayerBlocks 
    DEC.W $08FF 
    DEC.W $0903 
    JSR.W DoorTransitionScrolling_Right 
    RTS 


DoorTransitionScrollingSetup_Left:
    JSR.W CalculateLayer2XPosition 
    CLC 
    ADC.W #$0100 
    STA.W $0917 
    JSR.W CalculateLayer2YPosition 
    LDA.W $0911 
    CLC 
    ADC.W #$0100 
    STA.W $0911 
    JSR.W UpdateBGScrollOffsets 
    JSR.W Calculate_BGScroll_LayerPositionBlocks 
    JSR.W UpdatePreviousLayerBlocks 
    INC.W $08FF 
    INC.W $0903 
    JSR.W DoorTransitionScrolling_Left 
    RTS 


DoorTransitionScrollingSetup_Down:
    JSR.W CalculateLayer2XPosition 
    JSR.W CalculateLayer2YPosition 
    SEC 
    SBC.W #$00E0 
    STA.W $0919 
    LDA.W $0915 
    SEC 
    SBC.W #$00E0 
    STA.W $0915 
    JSR.W UpdateBGScrollOffsets 
    JSR.W Calculate_BGScroll_LayerPositionBlocks 
    JSR.W UpdatePreviousLayerBlocks 
    DEC.W $0901 
    DEC.W $0905 
    JSR.W DoorTransitionScrolling_Down 
    RTS 


DoorTransitionScrollingSetup_Up:
    JSR.W CalculateLayer2XPosition 
    LDA.W $0915 
    PHA 
    CLC 
    ADC.W #$001F 
    STA.W $0915 
    JSR.W CalculateLayer2YPosition 
    CLC 
    ADC.W #$00E0 
    STA.W $0919 
    PLA 
    CLC 
    ADC.W #$0100 
    STA.W $0915 
    JSR.W UpdateBGScrollOffsets 
    LDA.W $0929 
    CLC 
    ADC.W #$0020 
    STA.W $0929 
    JSR.W Calculate_BGScroll_LayerPositionBlocks 
    JSR.W UpdatePreviousLayerBlocks 
    INC.W $0901 
    INC.W $0905 
    DEC.W $0915 
    JSR.W DoorTransitionScrolling_Up 
    RTS 


Door_Transition_Scrolling_Setup_Pointers:
    dw DoorTransitionScrollingSetup_Right 
    dw DoorTransitionScrollingSetup_Left 
    dw DoorTransitionScrollingSetup_Down 
    dw DoorTransitionScrollingSetup_Up 

UpdatePreviousLayerBlocks:
    LDA.W $08F7 
    STA.W $08FF 
    LDA.W $08FB 
    STA.W $0903 
    LDA.W $08F9 
    STA.W $0901 
    LDA.W $08FD 
    STA.W $0905 
    RTS 


UpdateBGScrollOffsets:
    LDA.B $B1 
    SEC 
    SBC.W $0911 
    STA.W $091D 
    LDA.B $B3 
    SEC 
    SBC.W $0915 
    STA.W $091F 
    LDA.B $B5 
    SEC 
    SBC.W $0911 
    STA.W $0921 
    LDA.B $B7 
    SEC 
    SBC.W $0915 
    STA.W $0923 
    RTS 


DoorTransitionScrolling:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0791 
    AND.W #$0003 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    BCC .return 
    LDA.W $0927 
    STA.W $0911 
    LDA.W $0929 
    STA.W $0915 
    LDA.W #$8000 
    TSB.W $0931 

.return:
    PLB 
    PLP 
    RTL 


.pointers:
    dw DoorTransitionScrolling_Right 
    dw DoorTransitionScrolling_Left 
    dw DoorTransitionScrolling_Down 
    dw DoorTransitionScrolling_Up 

DoorTransitionScrolling_Right:
    LDX.W $0925 
    PHX 
    LDA.W $0AF8 
    CLC 
    ADC.W $092B 
    STA.W $0AF8 
    LDA.W $0AF6 
    ADC.W $092D 
    STA.W $0AF6 
    STA.W $0B10 
    LDA.W $0911 
    CLC 
    ADC.W #$0004 
    STA.W $0911 
    LDA.W $0917 
    CLC 
    ADC.W #$0004 
    STA.W $0917 
    JSL.L CalculateBGScrolls_UpdateBGGraphics_WhenScrolling 
    PLX 
    INX 
    STX.W $0925 
    CPX.W #$0040 
    BNE + 
    JSL.L CalculateBGScrolls_UpdateBGGraphics_WhenScrolling 
    SEC 
    RTS 


  + CLC 
    RTS 


DoorTransitionScrolling_Left:
    LDX.W $0925 
    PHX 
    LDA.W $0AF8 
    SEC 
    SBC.W $092B 
    STA.W $0AF8 
    LDA.W $0AF6 
    SBC.W $092D 
    STA.W $0AF6 
    STA.W $0B10 
    LDA.W $0911 
    SEC 
    SBC.W #$0004 
    STA.W $0911 
    LDA.W $0917 
    SEC 
    SBC.W #$0004 
    STA.W $0917 
    JSL.L CalculateBGScrolls_UpdateBGGraphics_WhenScrolling 
    PLX 
    INX 
    STX.W $0925 
    CPX.W #$0040 
    BNE + 
    SEC 
    RTS 


  + CLC 
    RTS 


DoorTransitionScrolling_Down:
    LDX.W $0925 
    PHX 
    BNE + 
    LDA.B $B3 
    PHA 
    LDA.B $B7 
    PHA 
    LDA.W $0915 
    PHA 
    SEC 
    SBC.W #$000F 
    STA.W $0915 
    LDA.W $0919 
    PHA 
    SEC 
    SBC.W #$000F 
    STA.W $0919 
    JSR.W Calculate_BGScroll_LayerPositionBlocks 
    JSR.W UpdatePreviousLayerBlocks 
    DEC.W $0901 
    DEC.W $0905 
    JSL.L CalculateBGScrolls_UpdateBGGraphics_WhenScrolling 
    PLA 
    STA.W $0919 
    PLA 
    STA.W $0915 
    PLA 
    STA.B $B7 
    PLA 
    STA.B $B3 
    BRA .finish 


  + CPX.W #$0039 
    BCS .finish 
    LDA.W $0AFC 
    CLC 
    ADC.W $092B 
    STA.W $0AFC 
    LDA.W $0AFA 
    ADC.W $092D 
    STA.W $0AFA 
    STA.W $0B14 
    LDA.W $0915 
    CLC 
    ADC.W #$0004 
    STA.W $0915 
    LDA.W $0919 
    CLC 
    ADC.W #$0004 
    STA.W $0919 
    JSL.L CalculateBGScrolls_UpdateBGGraphics_WhenScrolling 

.finish:
    PLX 
    INX 
    STX.W $0925 
    CPX.W #$0039 
    BCC + 
    JSL.L CalculateBGScrolls_UpdateBGGraphics_WhenScrolling 
    SEC 
    RTS 


  + CLC 
    RTS 


DoorTransitionScrolling_Up:
    LDX.W $0925 
    PHX 
    BNE + 
    LDA.B $B3 
    PHA 
    LDA.B $B7 
    PHA 
    LDA.W $0915 
    PHA 
    SEC 
    SBC.W #$0010 
    STA.W $0915 
    LDA.W $0919 
    PHA 
    SEC 
    SBC.W #$0010 
    STA.W $0919 
    JSR.W Calculate_BGScroll_LayerPositionBlocks 
    JSR.W UpdatePreviousLayerBlocks 
    INC.W $0901 
    INC.W $0905 
    JSL.L CalculateBGScrolls_UpdateBGGraphics_WhenScrolling 
    PLA 
    STA.W $0919 
    PLA 
    STA.W $0915 
    PLA 
    STA.B $B7 
    PLA 
    STA.B $B3 
    BRA .done 


  + LDA.W $0AFC 
    SEC 
    SBC.W $092B 
    STA.W $0AFC 
    LDA.W $0AFA 
    SBC.W $092D 
    STA.W $0AFA 
    STA.W $0B14 
    LDA.W $0915 
    SEC 
    SBC.W #$0004 
    STA.W $0915 
    LDA.W $0919 
    SEC 
    SBC.W #$0004 
    STA.W $0919 
    CPX.W #$0005 
    BCS + 
    LDA.W $0911 
    CLC 
    ADC.W $091D 
    STA.B $B1 
    LDA.W $0915 
    CLC 
    ADC.W $091F 
    STA.B $B3 
    LDA.W $0917 
    CLC 
    ADC.W $0921 
    STA.B $B5 
    LDA.W $0919 
    CLC 
    ADC.W $0923 
    STA.B $B7 
    BRA .done 


  + JSL.L CalculateBGScrolls_UpdateBGGraphics_WhenScrolling 

.done:
    PLX 
    INX 
    STX.W $0925 
    CPX.W #$0039 
    BNE + 
    SEC 
    RTS 


  + CLC 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_SetupRotatingMode7Background_80B032:
    LDA.W #$0001 
    STA.W $0783 
    LDA.W $0783 ; >_<
    BNE + 
    SEC ; dead code
    RTL 


  + JSL.L SetForceBlankAndWaitForNMI 
    LDA.W #$0080 
    STA.W $2115 
    STZ.W $2116 
    LDA.W #$1900 
    STA.W $4310 
    LDA.W #$8000 
    STA.W $4312 
    LDA.W #$4000 
    STA.W $4315 
    SEP #$20 
    LDA.B #$98 
    STA.W $4314 
    LDA.B #$02 
    STA.W $420B 
    STZ.W $2115 
    STZ.W $2116 
    STZ.W $2117 
    LDX.W #$4000 

.loopClearLowBytes:
    STZ.W $2118 
    DEX 
    BNE .loopClearLowBytes 
    LDY.W #$0000 
    TYX 

.loop:
    STY.W $2116 
    PHY 
    LDY.W #$0020 

.innerLoop:
    LDA.L $98C000,X ; data doesn't exist in final release?
    STA.W $2118 
    INX 
    DEY 
    BNE .innerLoop 
    REP #$20 
    PLA 
    CLC 
    ADC.W #$0080 
    TAY 
    SEP #$20 
    CPX.W #$0400 
    BNE .loop 
    LDA.B #$07 
    STA.B $55 
    REP #$20 
    LDA.W #$0100 
    STA.B $78 
    STZ.B $7A 
    STZ.B $7C 
    STA.B $7E 
    LDA.W #$0080 
    STA.B $80 
    STA.B $82 
    STZ.W $0785 
    JSL.L ClearForceBlankAndWaitForNMI 
    SEC 
    RTL 


UNUSED_ConfigureMode7RotationMatrix_80B0C2:
    PHP 
    REP #$30 
    LDA.W $0783 
    BEQ .return 
    LDA.W $05B6 
    AND.W #$0007 
    BNE .return 
    LDA.W $0785 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X 
    STA.B $7A 
    EOR.W #$FFFF 
    INC A 
    STA.B $7C 
    LDA.W $0785 
    CLC 
    ADC.W #$0040 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X 
    STA.B $78 
    STA.B $7E 
    INC.W $0785 

.return:
    PLP 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Decompression_HardcodedDestination:
    LDA.B $02,S 
    STA.B $45 
    LDA.B $01,S 
    STA.B $44 
    CLC 
    ADC.W #$0003 
    STA.B $01,S 
    LDY.W #$0001 
    LDA.B [$44],Y 
    STA.B $4C 
    INY 
    LDA.B [$44],Y 
    STA.B $4D 

Decompression_VariableDestination:
    PHP 
    PHB 
    SEP #$20 
    REP #$10 
    LDA.B $49 
    PHA 
    PLB 
    STZ.B $50 
    LDY.W #$0000 

.loopMain:
    PHX 
    LDX.B $47 
    LDA.W $0000,X 
    INX 
    BNE + 
    JSR.W SourceBankOverflowCorrection 

  + STX.B $47 
    PLX 
    STA.B $4A 
    CMP.B #$FF 
    BNE + 
    PLB 
    PLP 
    RTL 


  + AND.B #$E0 
    CMP.B #$E0 
    BNE .pushCommandBits 
    LDA.B $4A 
    ASL #3
    AND.B #$E0 
    PHA 
    LDA.B $4A 
    AND.B #$03 
    XBA 
    PHX 
    LDX.B $47 
    LDA.W $0000,X 
    INX 
    BNE + 
    JSR.W SourceBankOverflowCorrection 

  + STX.B $47 
    PLX 
    BRA + 


.pushCommandBits:
    PHA 
    LDA.B #$00 
    XBA 
    LDA.B $4A 
    AND.B #$1F 

  + TAX 
    INX 
    PLA 
    CMP.B #$00 
    BPL + 
    JMP.W .dictionaryVariant 


  + CMP.B #$20 
    BEQ .byteFill 
    CMP.B #$40 
    BEQ .wordFill 
    CMP.B #$60 
    BEQ .incrementingFill 

.loopDirectCopy:
    PHX 
    LDX.B $47 
    LDA.W $0000,X 
    INX 
    BNE + 
    JSR.W SourceBankOverflowCorrection 

  + STX.B $47 
    PLX 
    STA.B [$4C],Y 
    INY 
    DEX 
    BNE .loopDirectCopy 
    BEQ .loopMain 

.byteFill:
    PHX 
    LDX.B $47 
    LDA.W $0000,X 
    INX 
    BNE + 
    JSR.W SourceBankOverflowCorrection 

  + STX.B $47 
    PLX 

.loopByteFill:
    STA.B [$4C],Y 
    INY 
    DEX 
    BNE .loopByteFill 
    JMP.W .loopMain 


.wordFill:
    PHX 
    LDX.B $47 
    LDA.W $0000,X 
    INX 
    BNE + 
    JSR.W SourceBankOverflowCorrection 

  + STX.B $47 
    PLX 
    STA.B $4A 
    PHX 
    LDX.B $47 
    LDA.W $0000,X 
    INX 
    BNE + 
    JSR.W SourceBankOverflowCorrection 

  + STX.B $47 
    PLX 
    STA.B $4B 

.loopWordFill:
    LDA.B $4A 
    STA.B [$4C],Y 
    INY 
    DEX 
    BEQ .goto_loopMain 
    LDA.B $4B 
    STA.B [$4C],Y 
    INY 
    DEX 
    BNE .loopWordFill 

.goto_loopMain:
    JMP.W .loopMain 


.incrementingFill:
    PHX 
    LDX.B $47 
    LDA.W $0000,X 
    INX 
    BNE + 
    JSR.W SourceBankOverflowCorrection 

  + STX.B $47 
    PLX 

.loopIncrementingFill:
    STA.B [$4C],Y 
    INC A 
    INY 
    DEX 
    BNE .loopIncrementingFill 
    JMP.W .loopMain 


.dictionaryVariant:
    CMP.B #$C0 
    BCS .slidingDictionary 
    AND.B #$20 
    STA.B $4F 
    PHX 
    LDX.B $47 
    LDA.W $0000,X 
    INX 
    BNE + 
    JSR.W SourceBankOverflowCorrection 

  + STX.B $47 
    PLX 
    STA.B $4A 
    PHX 
    LDX.B $47 
    LDA.W $0000,X 
    INX 
    BNE + 
    JSR.W SourceBankOverflowCorrection 

  + STX.B $47 
    PLX 
    STA.B $4B 

.dictionaryCopy:
    SEP #$20 

.loopDictionaryCopy:
    PHX 
    PHY 
    LDY.B $4A 
    LDA.B [$4C],Y 
    INY 
    STY.B $4A 
    PLY 
    LDX.B $4F 
    BEQ + 
    EOR.B #$FF 

  + STA.B [$4C],Y 
    INY 
    PLX 
    DEX 
    BNE .loopDictionaryCopy 
    JMP.W .loopMain 


.slidingDictionary:
    AND.B #$20 
    STA.B $4F 
    PHX 
    LDX.B $47 
    LDA.W $0000,X 
    INX 
    BNE + 
    JSR.W SourceBankOverflowCorrection 

  + STX.B $47 
    PLX 
    STA.B $4A 
    STZ.B $4B 
    REP #$20 
    TYA 
    SEC 
    SBC.B $4A 
    STA.B $4A 
    BRA .dictionaryCopy 


SourceBankOverflowCorrection:
    LDX.W #$8000 
    PHA 
    PHB 
    PLA 
    INC A 
    PHA 
    PLB 
    PLA 
    RTS 


DecompressionToVRAM:
    PHP 
    PHB 
    REP #$10 
    SEP #$20 
    LDA.B $49 
    PHA 
    PLB 
    STZ.B $50 
    LDY.B $4C 

.loopMain:
    PHX 
    LDX.B $47 
    LDA.W $0000,X 
    INX 
    BNE + 
    JSR.W SourceBankOverflowCorrection 

  + STX.B $47 
    PLX 
    STA.B $4A 
    CMP.B #$FF 
    BNE + 
    PLB 
    PLP 
    RTL 


  + AND.B #$E0 
    CMP.B #$E0 
    BNE .pushCommandBits 
    LDA.B $4A 
    ASL #3
    AND.B #$E0 
    PHA 
    LDA.B $4A 
    AND.B #$03 
    XBA 
    PHX 
    LDX.B $47 
    LDA.W $0000,X 
    INX 
    BNE + 
    JSR.W SourceBankOverflowCorrection 

  + STX.B $47 
    PLX 
    BRA + 


.pushCommandBits:
    PHA 
    LDA.B #$00 
    XBA 
    LDA.B $4A 
    AND.B #$1F 

  + TAX 
    INX 
    PLA 
    CMP.B #$00 
    BPL + 
    JMP.W .dictionaryVariant 


  + CMP.B #$20 
    BEQ .byteFill 
    CMP.B #$40 
    BEQ .wordFill 
    CMP.B #$60 
    BNE .loopDirectCopy 
    JMP.W .incrementingFill 


.loopDirectCopy:
    PHX 
    LDX.B $47 
    LDA.W $0000,X 
    INX 
    BNE + 
    JSR.W SourceBankOverflowCorrection 

  + STX.B $47 
    PLX 
    PHA 
    TYA 
    LSR A 
    PLA 
    BCS .VRAMDataWriteLow 
    STA.L $002118 
    BRA .VRAMDataWriteHigh 


.VRAMDataWriteLow:
    STA.L $002119 

.VRAMDataWriteHigh:
    INY 
    DEX 
    BNE .loopDirectCopy 
    JMP.W .loopMain 


.byteFill:
    PHX 
    LDX.B $47 
    LDA.W $0000,X 
    INX 
    BNE + 
    JSR.W SourceBankOverflowCorrection 

  + STX.B $47 
    PLX 

.loopByteFill:
    PHA 
    TYA 
    LSR A 
    PLA 
    BCS ..writeHigh 
    STA.L $002118 
    BRA ..writeLow 


..writeHigh:
    STA.L $002119 

..writeLow:
    INY 
    DEX 
    BNE .loopByteFill 
    JMP.W .loopMain 


.wordFill:
    PHX 
    LDX.B $47 
    LDA.W $0000,X 
    INX 
    BNE + 
    JSR.W SourceBankOverflowCorrection 

  + STX.B $47 
    PLX 
    STA.B $4A 
    PHX 
    LDX.B $47 
    LDA.W $0000,X 
    INX 
    BNE + 
    JSR.W SourceBankOverflowCorrection 

  + STX.B $47 
    PLX 
    STA.B $4B 

.loopWordFill:
    LDA.B $4A 
    PHA 
    TYA 
    LSR A 
    PLA 
    BCS ..writeHigh 
    STA.L $002118 
    BRA ..writeLow 


..writeHigh:
    STA.L $002119 

..writeLow:
    INY 
    DEX 
    BEQ .goto_loopMain 
    LDA.B $4B 
    PHA 
    TYA 
    LSR A 
    PLA 
    BCS ..writeHigh2 
    STA.L $002118 
    BRA .writeLow2 


..writeHigh2:
    STA.L $002119 

.writeLow2:
    INY 
    DEX 
    BNE .loopWordFill 

.goto_loopMain:
    JMP.W .loopMain 


.incrementingFill:
    PHX 
    LDX.B $47 
    LDA.W $0000,X 
    INX 
    BNE + 
    JSR.W SourceBankOverflowCorrection 

  + STX.B $47 
    PLX 

.loopIncrementingFill:
    PHA 
    TYA 
    LSR A 
    PLA 
    BCS ..writeHigh 
    STA.L $002118 
    BRA ..writeLow 


..writeHigh:
    STA.L $002119 

..writeLow:
    INY 
    INC A 
    DEX 
    BNE .loopIncrementingFill 
    JMP.W .loopMain 


.dictionaryVariant:
    CMP.B #$C0 
    BCS .slidingDictionary 
    AND.B #$20 
    STA.B $4F 
    PHX 
    LDX.B $47 
    LDA.W $0000,X 
    INX 
    BNE + 
    JSR.W SourceBankOverflowCorrection 

  + STX.B $47 
    PLX 
    STA.B $4A 
    PHX 
    LDX.B $47 
    LDA.W $0000,X 
    INX 
    BNE + 
    JSR.W SourceBankOverflowCorrection 

  + STX.B $47 
    PLX 
    STA.B $4B 
    REP #$20 
    LDA.B $4C 
    CLC 
    ADC.B $4A 
    STA.B $4A 

.loopDictionaryCopy:
    PHX 
    REP #$20 
    LDA.B $4A 
    LSR A 
    STA.L $002116 
    LDA.L $002139 
    LDA.L $002139 
    BCC + 
    XBA 

  + INC.B $4A 
    SEP #$20 
    LDX.B $4F 
    BEQ + 
    EOR.B #$FF 

  + PHA 
    REP #$20 
    TYA 
    LSR A 
    STA.L $002116 
    SEP #$20 
    PLA 
    PHA 
    TYA 
    LSR A 
    PLA 
    BCS ..writeHigh 
    STA.L $002118 
    BRA ..writeLow 


..writeHigh:
    STA.L $002119 

..writeLow:
    INY 
    PLX 
    DEX 
    BNE .loopDictionaryCopy 
    JMP.W .loopMain 


.slidingDictionary:
    AND.B #$20 
    STA.B $4F 
    PHX 
    LDX.B $47 
    LDA.W $0000,X 
    INX 
    BNE + 
    JSR.W SourceBankOverflowCorrection 

  + STX.B $47 
    PLX 
    STA.B $4A 
    STZ.B $4B 
    REP #$20 
    TYA 
    SEC 
    SBC.B $4A 
    STA.B $4A 
    BRA .loopDictionaryCopy 


Tilemap_FailedRegionCheck:
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

Tilemap_FailedSRAMMappingCheck:
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

LoadFromLoadStation:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W #$0001 
    STA.W $1E75 
    LDA.W $079F 
    ASL A 
    TAX 
    LDA.W $078B 
    ASL A 
    STA.B $12 
    ASL A 
    CLC 
    ADC.B $12 
    ADC.W $078B 
    ASL A 
    CLC 
    ADC.W LoadStationListPointers,X 
    TAX 
    LDA.W $0000,X 
    STA.W $079B 
    LDA.W $0002,X 
    STA.W $078D 
    LDA.W $0004,X 
    STA.W $078F 
    LDA.W $0006,X 
    STA.W $0911 
    STA.W $091D 
    LDA.W $0008,X 
    STA.W $0915 
    STA.W $091F 
    LDA.W $000A,X 
    CLC 
    ADC.W $0915 
    STA.W $0AFA 
    STA.W $0B14 
    LDA.W $0911 
    CLC 
    ADC.W #$0080 
    ADC.W $000C,X 
    STA.W $0AF6 
    STA.W $0B10 
    STZ.B $B1 
    STZ.B $B3 
    SEP #$20 
    LDA.B #$8F 
    PHA 
    PLB 
    LDX.W $079B 
    LDA.W $0001,X 
    STA.W $079F 
    STZ.W $05F7 
    PLB 
    PLP 
    RTL 


LoadStationListPointers:
    dw LoadStations_Crateria 
    dw LoadStations_Brinstar 
    dw LoadStations_Norfair 
    dw LoadStations_WreckedShip 
    dw LoadStations_Maridia 
    dw LoadStations_Tourian 
    dw LoadStations_Ceres 
    dw LoadStations_Debug 

LoadStations_Crateria:
    dw RoomHeader_LandingSite 
    dw Door_Parlor_1 
    dw $0000,$0400,$0400,$0040,$0000 

    dw RoomHeader_CrateriaSave 
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

    dw RoomHeader_ForgottenHighwayElev 
    dw Door_ForgottenHighwayElbow_1 
    dw $0000,$0000,$0000,$00A8,$0000 

    dw RoomHeader_RedBinstarElev 
    dw Door_CrateriaKihunter_2 
    dw $0000,$0000,$0000,$00A8,$0000 

    dw RoomHeader_ElevToBlueBrinstar 
    dw Door_Pit_1 
    dw $0000,$0000,$0000,$0088,$0000 

    dw RoomHeader_GreenBrinstarElev 
    dw Door_LowerMushrooms_1 
    dw $0000,$0000,$0000,$0088,$0000 

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

    dw RoomHeader_LandingSite 
    dw Door_Parlor_1 
    dw $0000,$0400,$0400,$0040,$0000 

    dw RoomHeader_EastOcean 
    dw Door_ForgottenHighwayKagos_0 
    dw $0000,$0000,$0400,$0095,$0000 

    dw RoomHeader_LandingSite 
    dw Door_LandingSite_LandingCutscene 
    dw $0000,$0400,$0000,$0080,$0000 


LoadStations_Brinstar:
    dw RoomHeader_BigPinkSaveRoom 
    dw Door_BigPink_4 
    dw $0000,$0000,$0000,$0098,$FFE0 

    dw RoomHeader_GreenBrinstarSave 
    dw Door_GreenBrinstarMainShaft_A 
    dw $0000,$0000,$0000,$0098,$FFE0 

    dw RoomHeader_EtecoonSave 
    dw Door_EtecoonETank_3 
    dw $0000,$0000,$0000,$0098,$FFE0 

    dw RoomHeader_WarehouseSave 
    dw Door_WarehouseKihunter_2 
    dw $0000,$0000,$0000,$0098,$0000 

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

    dw RoomHeader_GreenBrinstarMainShaft 
    dw Door_BrinstarPreMap_1 
    dw $0001,$0000,$0200,$00A8,$0000 

    dw RoomHeader_MorphBall 
    dw Door_GreenHillZone_1 
    dw $0000,$0500,$0200,$00A8,$0000 

    dw RoomHeader_Caterpillar 
    dw Door_Hellway_1 
    dw $0000,$0000,$0200,$00A8,$0000 

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

    dw RoomHeader_GreenBrinstarMainShaft 
    dw Door_BrinstarPreMap_1 
    dw $0001,$0000,$0200,$00A8,$0000 

    dw RoomHeader_KraidEyeDoor 
    dw Door_Kraid_0 
    dw $0000,$0000,$0100,$0080,$0000 

    dw RoomHeader_BigPink 
    dw Door_PinkBrinstarPowerBombs_0 
    dw $0000,$0300,$0000,$0080,$0000 


LoadStations_Norfair:
    dw RoomHeader_PostCrocSave 
    dw Door_PostCrocFarming_3 
    dw $0000,$0000,$0000,$0098,$0000 

    dw RoomHeader_BubbleMountainSave 
    dw Door_BubbleMountain_6 
    dw $0000,$0000,$0000,$0098,$FFE0 

    dw RoomHeader_FrogSave 
    dw Door_FrogSpeedway_0 
    dw $0000,$0000,$0000,$0098,$0000 

    dw RoomHeader_CrocomireSave 
    dw Door_CrocomireSpeedway_2 
    dw $0000,$0000,$0000,$0098,$0000 

    dw RoomHeader_LNElevSave 
    dw Door_LowerNorfairElev_3 
    dw $0000,$0000,$0000,$0098,$FFE0 

    dw RoomHeader_LNSave 
    dw Door_RedKihunterShaft_3 
    dw $0000,$0000,$0000,$0098,$0000 

    dw $0000 
    dw $0000 
    dw $0000,$0400,$0400,$00B0,$0000 

    dw $0000 
    dw $0000 
    dw $0000,$0400,$0400,$00B0,$0000 

    dw RoomHeader_BusinessCenter 
    dw Door_CathedralEntrance_0 
    dw $0000,$0000,$0200,$00A8,$0000 

    dw RoomHeader_LowerNorfairElev 
    dw Door_LavaDive_1 
    dw $0000,$0000,$0000,$0088,$0000 

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

    dw RoomHeader_BusinessCenter 
    dw Door_IceBeamGate_2 
    dw $0002,$0000,$0200,$00A8,$0000 

    dw RoomHeader_CrocomireSpeedway 
    dw Door_Crocomire_1 
    dw $0001,$0C00,$0200,$00A0,$0000 

    dw RoomHeader_LNFarming 
    dw Door_Plowerhouse_0 
    dw $0000,$0000,$0000,$00A0,$0000 

    dw RoomHeader_PostCrocFarming 
    dw Door_PostCrocPowerBombs_0 
    dw $0000,$0000,$0000,$00B5,$0000 

    dw RoomHeader_MainHall 
    dw Door_AcidStatue_1 
    dw $0001,$0500,$0200,$0035,$0000 

    dw RoomHeader_GoldenTorizo 
    dw Door_GTEnergyRefill_0 
    dw $0000,$0200,$0200,$0000,$0000 

    dw RoomHeader_GoldenTorizo 
    dw Door_AcidStatue_0 
    dw $0000,$0000,$0000,$0080,$0000 


LoadStations_WreckedShip:
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

    dw RoomHeader_WreckedShipEntrance 
    dw Door_WreckedShipMainShaft_0 
    dw $0001,$0000,$0000,$0080,$0000 

    dw RoomHeader_Basement 
    dw Door_WreckedShipMap_0 
    dw $0000,$0400,$0000,$0080,$0000 


LoadStations_Maridia:
    dw RoomHeader_GlassTunnelSave 
    dw Door_GlassTunnel_3 
    dw $0000,$0000,$0000,$0098,$0000 

    dw RoomHeader_ForgottenHighwaySave 
    dw Door_MaridiaElev_1 
    dw $0000,$0000,$0000,$0098,$0000 

    dw RoomHeader_AqueductSave 
    dw Door_Aqueduct_5 
    dw $0000,$0000,$0000,$0098,$FFE0 

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

    dw RoomHeader_PseudoPlasmaSpark 
    dw Door_NWestMaridiaBug_1 
    dw $0001,$0000,$0000,$00D0,$0000 

    dw RoomHeader_ThePrecious 
    dw Door_ThePrecious_MaridiaLoad11 
    dw $0000,$0000,$0200,$0080,$0000 

    dw RoomHeader_BotwoonHallway 
    dw Door_Aqueduct_3 
    dw $0000,$0300,$0000,$0080,$0000 

    dw RoomHeader_Oasis 
    dw Door_WestSandHall_1 
    dw $0000,$0000,$0100,$0080,$0000 


LoadStations_Tourian:
    dw RoomHeader_MotherBrainSave 
    dw Door_RinkaShaft_1 
    dw $0000,$0000,$0000,$0098,$FFE0 

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

    dw RoomHeader_RinkaShaft 
    dw Door_TourianEyeDoor_1 
    dw $0000,$0000,$0200,$0080,$0000 

    dw RoomHeader_RinkaShaft 
    dw Door_BigBoy_0 
    dw $0000,$0000,$0000,$0080,$0000 


LoadStations_Ceres:
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


SetDebugElevatorAsUsed:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $079F 
    ASL A 
    TAX 
    LDA.W $0793 
    AND.W #$000F 
    DEC A 
    ASL #2
    CLC 
    ADC.W .elevatorBits,X 
    TAY 
    LDA.W #$0000 
    SEP #$20 
    LDA.W $0000,Y 
    TAX 
    LDA.W $0001,Y 
    ORA.L $7ED8F8,X 
    STA.L $7ED8F8,X 
    LDA.W $0002,Y 
    TAX 
    LDA.W $0003,Y 
    ORA.L $7ED8F8,X 
    STA.L $7ED8F8,X 
    PLB 
    PLP 
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
    db $01,$01,$09,$01 
    db $01,$02,$03,$04
    db $01,$04,$03,$02
    db $01,$08,$03,$01
    db $01,$10,$0B,$01

..brinstar:
    db $03,$01,$01,$08 
    db $03,$02,$01,$04
    db $03,$04,$01,$02
    db $03,$08,$05,$01 

..norfair:
    db $05,$01,$03,$08 
    db $05,$02,$05,$04
    db $05,$04,$05,$02

..maridia:
    db $09,$01,$01,$01 

..tourian:
    db $0B,$01,$01,$10 

..wreckedShip:
    db $00,$00,$00,$00 


Freespace_Bank80_CD8E: 
; $2F32 bytes


warnpc $80FFC0
ORG $80FFC0
ROM_HEADER:
    db "Super Metroid        " 

.ROMSpeed_MapMode:
    db $30 

.chipset:
    db $02 

.ROMSize:
    db $0C 

.SRAMSize:
    db $03 

.country:
    db $00 

.developer:
    db $01 

.version:
    db $00 

.complement:
    dw $0720 

.checksum:
    dw $F8DF 

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
