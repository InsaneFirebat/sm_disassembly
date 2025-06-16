
org $858000


;;; $8000: Large message box top/bottom border tilemap ;;;
Large_MessageBox_TopBottomBorder_Tilemap:
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$280F,$280F,$280F,$280F,$280F,$280F,$280F
    dw $280F,$280F,$280F,$280F,$280F,$280F,$280F,$280F
    dw $280F,$280F,$280F,$284E,$284E,$000E,$000E,$000E


;;; $8040: Small message box top/bottom border tilemap ;;;
Small_MessageBox_TopBottomBorder_Tilemap:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E


;;; $8080: Message box routine ;;;
MessageBox_Routine:
; Parameter:
;     A: Message index
;         1: Energy tank
;         2: Missile
;         3: Super missile
;         4: Power bomb
;         5: Grappling beam
;         6: X-ray scope
;         7: Varia suit
;         8: Spring ball
;         9: Morphing ball
;         Ah: Screw attack
;         Bh: Hi-jump boots
;         Ch: Space jump
;         Dh: Speed booster
;         Eh: Charge beam
;         Fh: Ice beam
;         10h: Wave beam
;         11h: Spazer
;         12h: Plasma beam
;         13h: Bomb
;         14h: Map data access completed
;         15h: Energy recharge completed
;         16h: Missile reload completed
;         17h: Would you like to save?
;         18h: Save completed
;         19h: Reserve tank
;         1Ah: Gravity suit
;         1Ch: Would you like to save? (Used by gunship)
; Returns:
;     A: If save confirmation, returns [save confirmation selection] (0: yes, 2: no)

; This routine does not return until the message box has disappeared (~6 seconds)
; This is the only routine in this bank that's externally callable
    PHP : PHB : PHX : PHY
    PHK : PLB
    STA.W MessageBoxIndex
    JSL Cancel_Sound_Effects
    JSR Initialise_PPU_for_MessageBoxes
    JSR Clear_MessageBox_BG3Tilemap
    JSR Initialise_MessageBox
    JSR Play_2_Lag_Frames_of_Music_and_Sound_Effects
    JSR Open_MessageBox
    LDA.W MessageBoxIndex : CMP.W #$001C : BEQ .gunship
    JSR Handle_MessageBox_Interaction
    JSR Close_MessageBox
    JSR Clear_MessageBox_BG3Tilemap
    JSR Restore_PPU
    JSL Queue_Samus_Movement_SoundEffects
    JSR Play_2_Lag_Frames_of_Music_and_Sound_Effects
    JSR MaybeTriggerPauseScreen_or_ReturnSaveConfirmationSelection

  .return:
    PLY : PLX : PLB : PLP
    RTL

  .gunship:
    JSR Handle_MessageBox_Interaction
    JSR Close_MessageBox
    LDA.W SaveConfirmationSelection : CMP.W #$0002 : BEQ .no
    LDA.W #$0018 : STA.W MessageBoxIndex
    JSR Clear_MessageBox_BG3Tilemap
    JSR Play_Saving_Sound_Effect
    JSR Initialise_MessageBox
    JSR Play_2_Lag_Frames_of_Music_and_Sound_Effects
    JSR Open_MessageBox
    JSR Handle_MessageBox_Interaction
    JSR Close_MessageBox

  .no:
    JSR Clear_MessageBox_BG3Tilemap
    JSR Restore_PPU
    JSL Queue_Samus_Movement_SoundEffects
    JSR Play_2_Lag_Frames_of_Music_and_Sound_Effects
    JSR MaybeTriggerPauseScreen_or_ReturnSaveConfirmationSelection
    BRA .return


;;; $80FA: Maybe trigger pause menu or return save confirmation selection ;;;
MaybeTriggerPauseScreen_or_ReturnSaveConfirmationSelection:
    REP #$30
    LDA.W MessageBoxIndex : CMP.W #$0014 : BNE .notMapPause
    LDA.W #$000C : STA.W GameState
    RTS


  .notMapPause:
    CMP.W #$001C : BEQ .saveConfirmationSelection
    CMP.W #$0017 : BNE .return

  .saveConfirmationSelection:
    LDA.W SaveConfirmationSelection

  .return:
    RTS


;;; $8119: Play saving sound effect ;;;
Play_Saving_Sound_Effect:
    REP #$30
    LDA.W #$002E
    JSL QueueSound_Lib1_Max6
    LDA.W #$00A0

  .loop:
    PHA
    JSL HandleMusicQueue
    JSL HandleSounds
    JSR Wait_for_Lag_Frame
    PLA
    DEC : BNE .loop
    RTS


;;; $8136: Wait for lag frame ;;;
Wait_for_Lag_Frame:
    PHP
    SEP #$20
    LDA.W NMI_Counter

  .wait:
    CMP.W NMI_Counter : BEQ .wait
    PLP
    RTS


;;; $8143: Initialise PPU for message boxes ;;;
Initialise_PPU_for_MessageBoxes:
    REP #$20
    STZ.W SaveConfirmationSelection
    JSR Wait_for_Lag_Frame
    SEP #$20
    STZ.W $420C
    LDA.B #$19 : STA.W $2121
    LDA.B #$B1 : STA.W $2122
    LDA.B #$0B : STA.W $2122
    LDA.B #$1F : STA.W $2122
    LDA.B #$00 : STA.W $2122
    LDA.B DP_HDMAEnable : STA.L BackupOfHDMAChannelsDuringMessageBoxes
    LDA.B DP_GameplayBG1TilemapAddrSize : STA.L BackupOfBG3TilemapBaseAddrSizeDuringMessageBoxes
    LDA.B #$58 : STA.B DP_GameplayBG1TilemapAddrSize
    LDA.B #$17 : STA.B DP_GameplayMainScreenLayers
    STZ.B DP_GameplayColorMathA : STZ.B DP_GameplayColorMathB
    LDA.B #$20 : STA.W $2132
    LDA.B #$40 : STA.W $2132
    LDA.B #$80 : STA.W $2132
    LDA.W $2111
    STZ.W $2111 : STZ.W $2111
    LDA.W $2112
    STZ.W $2112 : STZ.W $2112
    REP #$30
    LDX.W #$0080
    LDA.W #$0000

  .loop:
    STA.L MessageBoxBG3YScrollHDMADataTable,X
    DEX #2 : BPL .loop
    JSR Wait_for_Lag_Frame
    REP #$20
    LDA.W #$5880 : STA.W $2116
    LDA.W $2139
    LDA.W #$3981 : STA.W $4310 ;  (8-bit transfer looks wrong, bug?)
    LDA.W #BackupOfVRAMDuringMessageBoxes : STA.W $4312
    LDA.W #BackupOfVRAMDuringMessageBoxes>>16 : STA.W $4314
    LDA.W #$0700 : STA.W $4315
    STZ.W $4317 : STZ.W $4319
    SEP #$20
    LDA.B #$80 : STA.W $2115
    LDA.B #$02 : STA.W $420B
    JSL HandleMusicQueue
    JSL HandleSounds
    RTS


;;; $81F3: Clear message box BG3 tilemap ;;;
Clear_MessageBox_BG3Tilemap:
    REP #$30
    LDX.W #$06FE
    LDA.W .blankTile

  .loop:
    STA.L ClearedMessageBoxBG3Tilemap,X
    DEX #2 : BPL .loop
    JSR Wait_for_Lag_Frame
    LDA.W #$5880 : STA.W $2116
    LDA.W #$1801 : STA.W $4310
    LDA.W #ClearedMessageBoxBG3Tilemap : STA.W $4312
    LDA.W #ClearedMessageBoxBG3Tilemap>>16 : STA.W $4314
    LDA.W #$0700 : STA.W $4315
    STZ.W $4317 : STZ.W $4319
    SEP #$20
    LDA.B #$80 : STA.W $2115
    LDA.B #$02 : STA.W $420B
    JSL HandleMusicQueue
    JSL HandleSounds
    RTS

  .blankTile:
    dw $000E


;;; $8241: Initialise message box ;;;
Initialise_MessageBox:
    REP #$30
    LDA.W MessageBoxIndex : DEC : ASL : STA.B DP_Temp34
    ASL : CLC : ADC.B DP_Temp34 : TAX
    PHX
    JSR.W (MessageDefinitionsPointers_drawInitialMessageBox,X)
    PLX
    JSR.W (MessageDefinitionsPointers_modifyMessageBox,X)
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8258: Unused. REP #$30 ;;;
UNUSED_REP30_858258:
    REP #$30
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $825A: Write large message box tilemap ;;;
Write_Large_MessageBox_Tilemap:
    LDX.W #$0000

  .topBorderLoop:
    LDA.W Large_MessageBox_TopBottomBorder_Tilemap,X
    STA.L MessageBoxTilemap,X
    INX #2 : CPX.W #$0040 : BNE .topBorderLoop
    LDY.W #$0000
    JSR Write_Message_Tilemap
    LDA.W #$0020 : STA.B DP_Temp16
    LDY.W #$0000

  .bottomBorderLoop:
    LDA.W Large_MessageBox_TopBottomBorder_Tilemap,Y : STA.L MessageBoxTilemap,X
    INY #2
    INX #2
    DEC.B DP_Temp16 : BNE .bottomBorderLoop
    RTS


;;; $8289: Write small message box tilemap ;;;
Write_Small_MessageBox_Tilemap:
    LDY.W #$0000
    LDX.W #$0000

  .topBorderLoop:
    LDA.W Small_MessageBox_TopBottomBorder_Tilemap,X : STA.L MessageBoxTilemap,X
    INX #2 : CPX.W #$0040 : BNE .topBorderLoop
    JSR Write_Message_Tilemap
    LDA.W #$0020 : STA.B DP_Temp16
    LDY.W #$0000

  .bottomBorderLoop:
    LDA.W Small_MessageBox_TopBottomBorder_Tilemap,Y : STA.L MessageBoxTilemap,X
    INY #2
    INX #2
    DEC.B DP_Temp16 : BNE .bottomBorderLoop
    RTS


;;; $82B8: Write message tilemap ;;;
Write_Message_Tilemap:
;; Returns:
;;     X: Message box bottom border tilemap index. $7E:3240 + [$869B + ([message box index] - 1 + 1) * 6 + 4] - [$869B + ([message box index] - 1) * 6 + 4]
    JSR Wait_for_Lag_Frame
    JSL HandleMusicQueue
    JSL HandleSounds
    REP #$30
    LDA.W #$0070 : STA.W MessageBoxAnim_BottomHalf
    LDA.W #$007C : STA.W MessageBoxAnim_BottomHalfPlusRadius
    STZ.W MessageBoxAnim_YRadius
    LDX.W #$0000
    LDA.W #$0000

  .zeroLoop:
    STA.L MessageBoxBG3YScrollHDMADataTable,X
    INX #2 : CPX.W #$00E0 : BNE .zeroLoop
    LDA.W MessageBoxIndex : DEC : ASL : STA.B DP_Temp34
    ASL : CLC : ADC.B DP_Temp34 : TAX
    LDA.W MessageDefinitionsPointers_messageTilemap,X : STA.B DP_Temp00
    LDA.W MessageDefinitionsPointers_nextEntryMessageTilemap,X : SEC : SBC.B DP_Temp00 : STA.B DP_Temp09
    LSR : STA.B DP_Temp16
    LDA.B DP_Temp09 : CLC : ADC.W #$0080 : STA.B DP_Temp09
    LDX.W #$0040
    LDY.W #$0000

  .messageLoop:
    LDA.B (DP_Temp00),Y : STA.L MessageBoxTilemap,X
    INX #2
    INY #2
    DEC.B DP_Temp16 : BNE .messageLoop
    RTS


;;; $831E: Set up PPU for active message box ;;;
Setup_PPU_for_Active_MessageBox:
;; Parameters:
;;     $34: BG3 tilemap offset
    JSR Setup_MessageBox_BG3_Yscroll_HDMA
    JSR Wait_for_Lag_Frame
    REP #$20
    LDA.W #$5800 : CLC : ADC.B DP_Temp34 : STA.B DP_Temp34 : STA.W $2116
    LDA.W #$1801 : STA.W $4310
    LDA.W #MessageBoxTilemap : STA.W $4312
    LDA.W #MessageBoxTilemap>>16 : STA.W $4314
    LDA.B DP_Temp09 : STA.W $4315
    STZ.W $4317 : STZ.W $4319
    SEP #$20
    LDA.B #$80 : STA.W $2115
    LDA.B #$02 : STA.W $420B
    JSL HandleMusicQueue
    JSL HandleSounds
    RTS


;;; $8363: Set up message box BG3 Y scroll HDMA ;;;
Setup_MessageBox_BG3_Yscroll_HDMA:
    SEP #$20
    LDA.B #$FF : STA.L MessageBoxBG3YScrollIndirectHDMATable
    LDA.B #$00 : STA.L MessageBoxBG3YScrollIndirectHDMATable+1
    LDA.B #$30 : STA.L MessageBoxBG3YScrollIndirectHDMATable+2
    LDA.B #$E1 : STA.L MessageBoxBG3YScrollIndirectHDMATable+3
    LDA.B #$FE : STA.L MessageBoxBG3YScrollIndirectHDMATable+4
    LDA.B #$30 : STA.L MessageBoxBG3YScrollIndirectHDMATable+5
    LDA.B #$00 : STA.L MessageBoxBG3YScrollIndirectHDMATable+6
    LDA.B #$42 : STA.W $4360
    LDA.B #$12 : STA.W $4361
    LDA.B #MessageBoxBG3YScrollIndirectHDMATable : STA.W $4362 : STA.W $4365
    LDA.B #MessageBoxBG3YScrollIndirectHDMATable>>8 : STA.W $4363 : STA.W $4366
    LDA.B #MessageBoxBG3YScrollIndirectHDMATable>>16 : STA.W $4364 : STA.W $4367
    STZ.W $4368 : STZ.W $4369 : STZ.W $436A
    JSR Write_MessageBox_BG3_Yscroll_HDMA_DataTable
    SEP #$20
    LDA.B #$40 : STA.W $420C
    RTS


;;; $83C5: Draw shoot button and set up PPU for large message box ;;;
DrawShootButton_SetupPPUForLargeMessageBox:
    REP #$30
    LDA.W ShotBinding
    BRA DrawSpecialButton_SetupPPUForLargeMessageBox


;;; $83CC: Draw run button and set up PPU for large message box ;;;
DrawRunButton_SetupPPUForLargeMessageBox:
    REP #$30
    LDA.W DashBinding
; fallthrough to DrawSpecialButton_SetupPPUForLargeMessageBox


;;; $83D1: Draw special button and set up PPU for large message box ;;;
DrawSpecialButton_SetupPPUForLargeMessageBox:
;; Parameters:
;;     A: Button binding
    LDY.W #$0000
    BIT.W #$0080 : BNE .found
    LDY.W #$0002
    BIT.W #$8000 : BNE .found
    LDY.W #$0004
    BIT.W #$0040 : BNE .found
    LDY.W #$0006
    BIT.W #$4000 : BNE .found
    LDY.W #$0008
    BIT.W #$2000 : BNE .found
    LDY.W #$000A
    BIT.W #$0020 : BNE .found
    LDY.W #$000C
    BIT.W #$0010 : BNE .found
    LDY.W #$000E

  .found:
    LDA.W MessageBoxIndex : DEC : ASL : TAX
    LDA.W Special_Button_Tilemap_Offsets,X : TAX
    LDA.W .buttons,Y : STA.L MessageBoxTilemap,X
    LDA.W #$01A0 : STA.B DP_Temp34
    JSR Setup_PPU_for_Active_MessageBox
    RTS

  .buttons:
; Tile numbers for button letters
    dw $28E0 ; A
    dw $3CE1 ; B
    dw $2CF7 ; X
    dw $38F8 ; Y
    dw $38D0 ; Select
    dw $38EB ; L
    dw $38F1 ; R
    dw $284E ; Blank


;;; $8436: Set up PPU for small message box ;;;
Setup_PPU_for_Small_MessageBox:
    REP #$30
    LDA.W #$01C0 : STA.B DP_Temp34
    JSR Setup_PPU_for_Active_MessageBox
    RTS


;;; $8441: Set up PPU for large message box ;;;
Setup_PPU_for_Large_MessageBox:
    REP #$30
    LDA.W #$01A0 : STA.B DP_Temp34
    JSR Setup_PPU_for_Active_MessageBox
    RTS


;;; $844C: Open message box ;;;
Open_MessageBox:
    REP #$30
    STZ.W MessageBoxAnim_YRadius

  .loop:
    JSR Write_MessageBox_BG3_Yscroll_HDMA_DataTable
    LDA.W MessageBoxAnim_YRadius : CLC : ADC.W #$0200 : STA.W MessageBoxAnim_YRadius
    CMP.W #$1800 : BMI .loop
    LDA.W #$1800 : STA.W MessageBoxAnim_YRadius
    JSR Write_MessageBox_BG3_Yscroll_HDMA_DataTable
    RTS


;;; $846D: Handle message box interaction ;;;
Handle_MessageBox_Interaction:
    SEP #$20
    LDA.W MessageBoxIndex : CMP.B #$17 : BEQ .save
    CMP.B #$1C : BEQ .save
    LDX.W #$000A
    LDA.W MessageBoxIndex : CMP.B #$14 : BEQ .lagLoop
    CMP.B #$15 : BEQ .lagLoop
    CMP.B #$16 : BEQ .lagLoop
    CMP.B #$18 : BEQ .lagLoop
    LDX.W #$0168

  .lagLoop:
    JSR Wait_for_Lag_Frame
    PHX
    JSL HandleMusicQueue
    JSL HandleSounds
    PLX : DEX : BNE .lagLoop

  .loopInput:
    LDA.W $4212 : BIT.B #$01 : BNE .loopInput
    LDA.W $4218 : BNE .busyReturn
    LDA.W $4219 : BEQ .loopInput

  .busyReturn:
    RTS

  .save:
    REP #$30
    STZ.W SaveConfirmationSelection

  .saveInput:
    SEP #$30
    LDX.B #$02

  .waitLoop:
    JSR Wait_for_Lag_Frame
    PHX
    JSL HandleMusicQueue
    JSL HandleSounds
    PLX : DEX : BNE .waitLoop
    JSL ReadControllerInput
    REP #$30
    LDA.B DP_Controller1New : BEQ .saveInput
    BIT.W #$0080 : BNE .inputA
    BIT.W #$8000 : BNE .inputB
    BIT.W #$2300 : BEQ .saveInput
    JSR Toggle_Save_Confirmation_Selection
    REP #$30
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    REP #$30
    BRA .saveInput

  .return:
    RTS

  .inputA:
    LDA.W SaveConfirmationSelection : BNE .return
    BRA .return

  .inputB:
    LDA.W #$0002 : STA.W SaveConfirmationSelection
    BRA .return


;;; $8507: Toggle save confirmation selection ;;;
Toggle_Save_Confirmation_Selection:
    LDA.W SaveConfirmationSelection : EOR.W #$0002 : STA.W SaveConfirmationSelection
    LDY.W #$0040
    CMP.W #$0002 : BNE +
    LDY.W #$0080

+   LDX.W #$0100
    LDA.W #$0020 : STA.B DP_Temp34

  .loop:
    LDA.W UNUSED_MessageTilemaps_YES_859581,Y : STA.L MessageBoxTilemap,X
    INX #2
    INY #2
    DEC.B DP_Temp34 : BNE .loop
    JSR Wait_for_Lag_Frame
    REP #$20
    LDA.W #$59A0 : STA.B DP_Temp34
    LDA.B DP_Temp34 : STA.W $2116 ; >_< LDA
    LDA.W #$1801 : STA.W $4310
    LDA.W #MessageBoxTilemap : STA.W $4312
    LDA.W #MessageBoxTilemap>>16 : STA.W $4314
    LDA.W #$0180 : STA.W $4315
    STZ.W $4317 : STZ.W $4319
    SEP #$20
    LDA.B #$80 : STA.W $2115
    LDA.B #$02 : STA.W $420B
    JSL HandleMusicQueue
    JSL HandleSounds
    RTS


;;; $8574: Play 2 lag frames of music and sound effects ;;;
Play_2_Lag_Frames_of_Music_and_Sound_Effects:
    SEP #$30
    LDX.B #$02

  .loop:
    JSR Wait_for_Lag_Frame
    PHX
    JSL HandleMusicQueue
    JSL HandleSounds
    PLX
    DEX : BNE .loop
    RTS


;;; $8589: Close message box ;;;
Close_MessageBox:
    REP #$30

  .loop:
    JSR Write_MessageBox_BG3_Yscroll_HDMA_DataTable
    LDA.W MessageBoxAnim_YRadius : SEC : SBC.W #$0200 : STA.W MessageBoxAnim_YRadius : BPL .loop
    RTS


;;; $859B: Write message box BG3 Y scroll HDMA data table ;;;
Write_MessageBox_BG3_Yscroll_HDMA_DataTable:
; This algorithm implementation is questionable... decrementing/incrementing $05A4..AB doesn't affect the calculations,
; probably an artefact leftover from porting the algorithm of the (unused) expanding and contracting effect ($88:B17F)
; Ideally this code would just do:
;     $7E:30BC..30F7 = -(18h - [message box animation Y radius] / 100h)
;     $7E:30F8..3133 = 18h - [message box animation Y radius] / 100h
;     $7E:3134..31DF = 0

; Given that message box animation Y radius is set to 0 and increased by 200h per frame (for opening the message box, the process happens backwards for closing):
;     The rows between Y positions 5Eh..7Bh are initially scrolled down by 18px, scrolling up 2px per frame
;     The rows between Y positions 7Ch..99h are initially scrolled up by 18px, scrolling down 2px per frame

; So basically the message appears to emerge out of thin air halfway between lines 7Bh and 7Ch
; Note that whilst only 18h pixels of the message are scrolled out on either side, the HDMA is affecting 1Eh lines on either side.
; The large message box actually is larger than 18h * 2 pixels, so the HDMA does make sense;
; the fact hat only 18h pixels are scrolled makes large message boxes abruptly expand at the end (actually quite hard to notice),
; but making the scroll affect more than 18h pixels on small message boxes wouldn't have any visible effect for some frames, causing a (more noticeable) delay
    PHP
    JSR Wait_for_Lag_Frame
    REP #$30
    JSL HandleMusicQueue
    JSL HandleSounds
    LDA.W #$7B00 : SEC : SBC.W MessageBoxAnim_YRadius
    XBA : AND.W #$00FF : STA.W MessageBoxAnim_TopHalfPlusRadius
    LDA.W #$0063 : STA.W MessageBoxAnim_TopHalf
    LDA.W #$7C00 : CLC : ADC.W MessageBoxAnim_YRadius : XBA
    AND.W #$00FF : STA.W MessageBoxAnim_BottomHalfPlusRadius
    LDA.W #$0094 : STA.W MessageBoxAnim_BottomHalf
    LDX.W #$00F6
    LDY.W #$00F8
    LDA.W #$001E : STA.B DP_Temp14

  .loop:
    LDA.W MessageBoxAnim_TopHalf : SEC : SBC.W MessageBoxAnim_TopHalfPlusRadius : STA.L MessageBoxBG3YScrollHDMADataTable,X
    DEC.W MessageBoxAnim_TopHalf
    DEC.W MessageBoxAnim_TopHalfPlusRadius
    DEX #2 : PHX
    TYX
    LDA.W MessageBoxAnim_BottomHalf : SEC : SBC.W MessageBoxAnim_BottomHalfPlusRadius : STA.L MessageBoxBG3YScrollHDMADataTable,X
    PLX
    INC.W MessageBoxAnim_BottomHalf
    INC.W MessageBoxAnim_BottomHalfPlusRadius
    INY #2
    DEC.B DP_Temp14 : BNE .loop
    TYX
    LDA.W #$0000

  .zeroLoop:
    STA.L MessageBoxBG3YScrollHDMADataTable,X
    INX #2 : CPX.W #$01E0 : BMI .zeroLoop
    PLP
    RTS


;;; $861A: Restore PPU ;;;
Restore_PPU:
    REP #$20
    JSR Wait_for_Lag_Frame
    REP #$20
    LDA.W #$5880 : STA.W $2116
    LDA.W #$1801 : STA.W $4310
    LDA.W #BackupOfVRAMDuringMessageBoxes : STA.W $4312
    LDA.W #BackupOfVRAMDuringMessageBoxes>>16 : STA.W $4314
    LDA.W #$0700 : STA.W $4315
    STZ.W $4317 : STZ.W $4319
    SEP #$20
    LDA.B #$80 : STA.W $2115
    LDA.B #$02 : STA.W $420B
    JSR Wait_for_Lag_Frame
    SEP #$20
    LDA.L BackupOfHDMAChannelsDuringMessageBoxes : STA.B DP_HDMAEnable : STA.W $420C
    LDA.L BackupOfBG3TilemapBaseAddrSizeDuringMessageBoxes : STA.B DP_GameplayBG1TilemapAddrSize
    LDA.B DP_MainScreenLayers : STA.B DP_GameplayMainScreenLayers
    LDA.B DP_NextGameplayColorMathA : STA.B DP_GameplayColorMathA
    LDA.B DP_NextGameplayColorMathB : STA.B DP_GameplayColorMathB
    LDA.B #$19 : STA.W $2121
    LDA.L Palettes_BG3P6FXPrimary : STA.W $2122
    LDA.L Palettes_BG3P6FXPrimary+1 : STA.W $2122
    LDA.L Palettes_BG3P6FXSecondary : STA.W $2122
    LDA.L Palettes_BG3P6FXSecondary+1 : STA.W $2122
    JSL HDMAObjectHandler_HandleMusicQueue
    JSL HandleSounds
    RTS


;;; $869B: Message definitions ;;;
MessageDefinitionsPointers:
; Summary of ASM routines:
;     $825A: Write large message box tilemap
;     $8289: Write small message box tilemap

;     $83C5: Draw shoot button and set up PPU for large message box
;     $83CC: Draw run button and set up PPU for large message box
;     $8436: Set up PPU for small message box
;     $8441: Set up PPU for large message box

; In addition to using the correct ASM routines, the message tilemap will have to be the right size;
; *however*, the size of the message tilemap is calculated by subtracting the message tilemap pointer from *the next entry's message tilemap pointer*.
; This is why there are terminator entries (1Bh and 1Dh)
  .modifyMessageBox:
    dw Setup_PPU_for_Small_MessageBox                                    ; 1: Energy tank
  .drawInitialMessageBox:
    dw Write_Small_MessageBox_Tilemap
  .messageTilemap:
    dw MessageTilemaps_energyTank
    dw DrawShootButton_SetupPPUForLargeMessageBox                        ; 2: Missile
    dw Write_Large_MessageBox_Tilemap
  .nextEntryMessageTilemap:
    dw MessageTilemaps_missile
    dw DrawShootButton_SetupPPUForLargeMessageBox                        ; 3: Super missile
    dw Write_Large_MessageBox_Tilemap
    dw MessageTilemaps_superMissile
    dw DrawShootButton_SetupPPUForLargeMessageBox                        ; 4: Power bomb
    dw Write_Large_MessageBox_Tilemap
    dw MessageTilemaps_powerBomb
    dw DrawShootButton_SetupPPUForLargeMessageBox                        ; 5: Grappling beam
    dw Write_Large_MessageBox_Tilemap
    dw MessageTilemaps_grapplingBeam
    dw DrawRunButton_SetupPPUForLargeMessageBox                          ; 6: X-ray scope
    dw Write_Large_MessageBox_Tilemap
    dw MessageTilemaps_xrayScope
    dw Setup_PPU_for_Small_MessageBox                                    ; 7: Varia suit
    dw Write_Small_MessageBox_Tilemap
    dw MessageTilemaps_variaSuit
    dw Setup_PPU_for_Small_MessageBox                                    ; 8: Spring ball
    dw Write_Small_MessageBox_Tilemap
    dw MessageTilemaps_springBall
    dw Setup_PPU_for_Small_MessageBox                                    ; 9: Morphing ball
    dw Write_Small_MessageBox_Tilemap
    dw MessageTilemaps_morphingBall
    dw Setup_PPU_for_Small_MessageBox                                    ; Ah: Screw attack
    dw Write_Small_MessageBox_Tilemap
    dw MessageTilemaps_screwAttack
    dw Setup_PPU_for_Small_MessageBox                                    ; Bh: Hi-jump boots
    dw Write_Small_MessageBox_Tilemap
    dw MessageTilemaps_hiJumpBoots
    dw Setup_PPU_for_Small_MessageBox                                    ; Ch: Space jump
    dw Write_Small_MessageBox_Tilemap
    dw MessageTilemaps_spaceJump
    dw DrawRunButton_SetupPPUForLargeMessageBox                          ; Dh: Speed booster
    dw Write_Large_MessageBox_Tilemap
    dw MessageTilemaps_speedBooster
    dw Setup_PPU_for_Small_MessageBox                                    ; Eh: Charge beam
    dw Write_Small_MessageBox_Tilemap
    dw MessageTilemaps_chargeBeam
    dw Setup_PPU_for_Small_MessageBox                                    ; Fh: Ice beam
    dw Write_Small_MessageBox_Tilemap
    dw MessageTilemaps_iceBeam
    dw Setup_PPU_for_Small_MessageBox                                    ; 10h: Wave beam
    dw Write_Small_MessageBox_Tilemap
    dw MessageTilemaps_waveBeam
    dw Setup_PPU_for_Small_MessageBox                                    ; 11h: Spazer
    dw Write_Small_MessageBox_Tilemap
    dw MessageTilemaps_spazer
    dw Setup_PPU_for_Small_MessageBox                                    ; 12h: Plasma beam
    dw Write_Small_MessageBox_Tilemap
    dw MessageTilemaps_plasmaBeam
    dw DrawShootButton_SetupPPUForLargeMessageBox                        ; 13h: Bomb
    dw Write_Large_MessageBox_Tilemap
    dw MessageTilemaps_bomb
    dw Setup_PPU_for_Small_MessageBox                                    ; 14h: Map data access completed
    dw Write_Small_MessageBox_Tilemap
    dw MessageTilemaps_map
    dw Setup_PPU_for_Small_MessageBox                                    ; 15h: Energy recharge completed
    dw Write_Small_MessageBox_Tilemap
    dw MessageTilemaps_energyRecharge
    dw Setup_PPU_for_Small_MessageBox                                    ; 16h: Missile reload completed
    dw Write_Small_MessageBox_Tilemap
    dw MessageTilemaps_missileReload
    dw Setup_PPU_for_Large_MessageBox                                    ; 17h: Would you like to save?
    dw Write_Small_MessageBox_Tilemap
    dw MessageTilemaps_save
    dw Setup_PPU_for_Small_MessageBox                                    ; 18h: Save completed
    dw Write_Small_MessageBox_Tilemap
    dw MessageTilemaps_saveCompleted
    dw Setup_PPU_for_Small_MessageBox                                    ; 19h: Reserve tank
    dw Write_Small_MessageBox_Tilemap
    dw MessageTilemaps_reserveTank
    dw Setup_PPU_for_Small_MessageBox                                    ; 1Ah: Gravity suit
    dw Write_Small_MessageBox_Tilemap
    dw MessageTilemaps_gravitySuit
    dw Setup_PPU_for_Small_MessageBox                                    ; 1Bh: Terminator
    dw Write_Small_MessageBox_Tilemap
    dw MessageTilemaps_Terminator
    dw Setup_PPU_for_Large_MessageBox                                    ; 1Ch: Would you like to save? (Used by gunship)
    dw Write_Small_MessageBox_Tilemap
    dw MessageTilemaps_save
    dw Setup_PPU_for_Small_MessageBox                                    ; 1Dh: Terminator. (Save completed, unused)
    dw Write_Small_MessageBox_Tilemap
    dw MessageTilemaps_saveCompleted


;;; $8749: Special button tilemap offsets ;;;
Special_Button_Tilemap_Offsets:
    dw $0000 ; 1: Energy tank
    dw $012A ; 2: Missile
    dw $012A ; 3: Super missile
    dw $012C ; 4: Power bomb
    dw $012C ; 5: Grappling beam
    dw $012C ; 6: X-ray scope
    dw $0000 ; 7: Varia suit
    dw $0000 ; 8: Spring ball
    dw $0000 ; 9: Morphing ball
    dw $0000 ; Ah: Screw attack
    dw $0000 ; Bh: Hi-jump boots
    dw $0000 ; Ch: Space jump
    dw $0120 ; Dh: Speed booster
    dw $0000 ; Eh: Charge beam
    dw $0000 ; Fh: Ice beam
    dw $0000 ; 10h: Wave beam
    dw $0000 ; 11h: Spazer
    dw $0000 ; 12h: Plasma beam
    dw $012A ; 13h: Bomb
    dw $0000 ; 14h: Map data access completed
    dw $0000 ; 15h: Energy recharge completed
    dw $0000 ; 16h: Missile reload completed
    dw $0000 ; 17h: Would you like to save?
    dw $0000 ; 18h: Save completed
    dw $0000 ; 19h: Reserve tank
    dw $0000 ; 1Ah: Gravity suit
    dw $0000 ; 1Bh: Dummy


MessageTilemaps:
  .energyTank:
; '    ENERGY TANK    '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E
    dw $284E,$284E,$28E4,$28ED,$28E4,$28F1,$28E6,$28F8
    dw $284E,$28F3,$28E0,$28ED,$28EA,$284E,$284E,$284E
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

  .missile:
; '          MISSILE         '
; '                          '
; '         |miss|                 '
; '  select |ile | & press the A button.  '
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$28EC,$28E8,$28F2
    dw $28F2,$28E8,$28EB,$28E4,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$304B,$3049,$704B,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$284E,$284E,$28B9,$28BA,$28BB
    dw $284E,$304C,$304A,$704C,$284E,$28C8,$284E,$28B0
    dw $28B1,$28B2,$28C0,$28C1,$28D1,$28E0,$28D3,$28B5
    dw $28B6,$28B7,$28CB,$284E,$284E,$000E,$000E,$000E

  .superMissile:
; '      SUPER MISSILE       '
; '                          '
; '         [sup                 '
; '   select er] & press the B button.  '
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$28F2,$28F4,$28EF,$28E4,$28F1,$284E,$28EC
    dw $28E8,$28F2,$28F2,$28E8,$28EB,$28E4,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$3034,$7034,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$284E,$284E,$284E,$28B9,$28BA
    dw $28BB,$284E,$3035,$7035,$284E,$28C8,$284E,$28B0
    dw $28B1,$28B2,$28C0,$28C1,$28D1,$3CE1,$28D3,$28B5
    dw $28B6,$28B7,$28CB,$284E,$284E,$000E,$000E,$000E

  .powerBomb:
; '        POWER BOMB        '
; '                          '
; '       [pow                   '
; ' select er] & set it with the R button. '
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$28EF,$28EE,$28F6,$28E4,$28F1
    dw $284E,$28E1,$28EE,$28EC,$28E1,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E
    dw $3036,$7036,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$284E,$28B9,$28BA,$28BB,$284E
    dw $3037,$7037,$284E,$28C8,$284E,$28C5,$28C6,$28C7
    dw $284E,$28BE,$28BF,$28C0,$28C1,$28D1,$38F1,$28D3
    dw $28B5,$28B6,$28B7,$28CB,$284E,$000E,$000E,$000E

  .grapplingBeam:
; '      GRAPPLING BEAM      '
; '                          '
; '        [gra                   '
; ' select pple] press & hold the Y button. '
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$28E6,$28F1,$28E0,$28EF,$28EF,$28EB,$28E8
    dw $28ED,$28E6,$284E,$28E1,$28E4,$28E0,$28EC,$284E
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E
    dw $3038,$7038,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$284E,$28B9,$28BA,$28BB,$284E
    dw $3039,$7039,$284E,$28B0,$28B1,$28B2,$284E,$28C8
    dw $284E,$28B3,$28B4,$28C0,$28C1,$28D1,$38F8,$28D3
    dw $28B5,$28B6,$28B7,$28CB,$284E,$000E,$000E,$000E

  .xrayScope:
; '        X-RAY SCOPE       '
; '                          '
; '        [x-                   '
; ' select ray] press & hold the X button. '
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$28F7,$28CF,$28F1,$28E0,$28F8
    dw $284E,$28F2,$28E2,$28EE,$28EF,$28E4,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E
    dw $303A,$703A,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$284E,$28B9,$28BA,$28BB,$284E
    dw $303B,$703B,$284E,$28B0,$28B1,$28B2,$284E,$28C8
    dw $284E,$28B3,$28B4,$28C0,$28C1,$28D1,$2CF7,$28D3
    dw $28B5,$28B6,$28B7,$28CB,$284E,$000E,$000E,$000E

  .variaSuit:
; '    VARIA SUIT     '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E
    dw $284E,$284E,$28F5,$28E0,$28F1,$28E8,$28E0,$284E
    dw $28F2,$28F4,$28E8,$28F3,$284E,$284E,$284E,$284E
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

  .springBall:
; '    SPRING BALL    '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E
    dw $284E,$284E,$28F2,$28EF,$28F1,$28E8,$28ED,$28E6
    dw $284E,$28E1,$28E0,$28EB,$28EB,$284E,$284E,$284E
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

  .morphingBall:
; '   MORPHING BALL   '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E
    dw $284E,$28EC,$28EE,$28F1,$28EF,$28E7,$28E8,$28ED
    dw $28E6,$284E,$28E1,$28E0,$28EB,$28EB,$284E,$284E
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

  .screwAttack:
; '   SCREW ATTACK    '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E
    dw $284E,$28F2,$28E2,$28F1,$28E4,$28F6,$284E,$28E0
    dw $28F3,$28F3,$28E0,$28E2,$28EA,$284E,$284E,$284E
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

  .hiJumpBoots:
; '   HI-JUMP BOOTS   '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E
    dw $284E,$28E7,$28E8,$28CF,$28E9,$28F4,$28EC,$28EF
    dw $284E,$28E1,$28EE,$28EE,$28F3,$28F2,$284E,$284E
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

  .spaceJump:
; '    SPACE JUMP     '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E
    dw $284E,$284E,$28F2,$28EF,$28E0,$28E2,$28E4,$284E
    dw $28E9,$28F4,$28EC,$28EF,$284E,$284E,$284E,$284E
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

  .speedBooster:
; '      SPEED BOOSTER       '
; '                          '
; '                          '
; '  press & hold the # button to run. '
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$28F2,$28EF,$28E4,$28E4,$28E3,$284E,$28E1
    dw $28EE,$28EE,$28F2,$28F3,$28E4,$28F1,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$284E,$284E,$28B0,$28B1,$28B2
    dw $284E,$28C8,$284E,$28B3,$28B4,$28C0,$28C1,$28D1
    dw $38D0,$28D3,$28B5,$28B6,$28B7,$284E,$28C2,$284E
    dw $28BC,$28BD,$28CB,$284E,$284E,$000E,$000E,$000E

  .chargeBeam:
; '    CHARGE BEAM    '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E
    dw $284E,$284E,$28E2,$28E7,$28E0,$28F1,$28E6,$28E4
    dw $284E,$28E1,$28E4,$28E0,$28EC,$284E,$284E,$284E
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

  .iceBeam:
; '     ICE BEAM      '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E
    dw $284E,$284E,$284E,$28E8,$28E2,$28E4,$284E,$28E1
    dw $28E4,$28E0,$28EC,$284E,$284E,$284E,$284E,$284E
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

  .waveBeam:
; '     WAVE BEAM     '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E
    dw $284E,$284E,$284E,$28F6,$28E0,$28F5,$28E4,$284E
    dw $28E1,$28E4,$28E0,$28EC,$284E,$284E,$284E,$284E
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

  .spazer:
; '      SPAZER       '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$28F2,$28EF,$28E0,$28F9
    dw $28E4,$28F1,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

  .plasmaBeam:
; '    PLASMA BEAM    '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E
    dw $284E,$284E,$28EF,$28EB,$28E0,$28F2,$28EC,$28E0
    dw $284E,$28E1,$28E4,$28E0,$28EC,$284E,$284E,$284E
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

  .bomb:
; '           BOMB           '
; '  o                       '
; '  T-                      '
; '  |=>O & set it with the L button.  '
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$28E1,$28EE
    dw $28EC,$28E1,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$284E,$284E,$38DC,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$284E,$284E,$3CDD,$3CDF,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$284E,$284E,$3CDE,$3CCC,$38CD
    dw $3CC9,$284E,$28C8,$284E,$28C5,$28C6,$28C7,$284E
    dw $28BE,$28BF,$28C0,$28C1,$28D1,$38EB,$28D3,$28B5
    dw $28B6,$28B7,$28CB,$284E,$284E,$000E,$000E,$000E

  .map:
; '  MAP DATA ACCESS  '
; '                   '
; '    COMPLETED.     '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E
    dw $3CEC,$3CE0,$3CEF,$3C4E,$3CE3,$3CE0,$3CF3,$3CE0
    dw $3C4E,$3CE0,$3CE2,$3CE2,$3CE4,$3CF2,$3CF2,$3C4E
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E
    dw $3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E
    dw $3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E
    dw $3C4E,$3C4E,$3CE2,$3CEE,$3CEC,$3CEF,$3CEB,$3CE4
    dw $3CF3,$3CE4,$3CE3,$3CFA,$3C4E,$3C4E,$3C4E,$3C4E
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

  .energyRecharge:
; '  ENERGY RECHARGE  '
; '                   '
; '    COMPLETED.     '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E
    dw $3CE4,$3CED,$3CE4,$3CF1,$3CE6,$3CF8,$3C4E,$3CF1
    dw $3CE4,$3CE2,$3CE7,$3CE0,$3CF1,$3CE6,$3CE4,$3C4E
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E
    dw $3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E
    dw $3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E
    dw $3C4E,$3C4E,$3CE2,$3CEE,$3CEC,$3CEF,$3CEB,$3CE4
    dw $3CF3,$3CE4,$3CE3,$3CFA,$3C4E,$3C4E,$3C4E,$3C4E
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

  .missileReload:
; '  MISSILE RELOAD   '
; '                   '
; '    COMPLETED.     '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E
    dw $3CEC,$3CE8,$3CF2,$3CF2,$3CE8,$3CEB,$3CE4,$3C4E
    dw $3CF1,$3CE4,$3CEB,$3CEE,$3CE0,$3CE3,$3C4E,$3C4E
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E
    dw $384E,$384E,$384E,$384E,$384E,$384E,$384E,$384E
    dw $384E,$384E,$384E,$384E,$384E,$384E,$3C4E,$3C4E
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E
    dw $384E,$384E,$3CE2,$3CEE,$3CEC,$3CEF,$3CEB,$3CE4
    dw $3CF3,$3CE4,$3CE3,$3CFA,$384E,$384E,$3C4E,$3C4E
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

  .save:
; '  WOULD YOU LIKE   '
; '  TO SAVE?         '
; '                   '
; '  =>YES      NO    '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E
    dw $3CF6,$3CEE,$3CF4,$3CEB,$3CE3,$3C4E,$3CF8,$3CEE
    dw $3CF4,$3C4E,$3CEB,$3CE8,$3CEA,$3CE4,$3C4E,$3C4E
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E
    dw $3CF3,$3CEE,$3C4E,$3CF2,$3CE0,$3CF5,$3CE4,$3CFE
    dw $3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E
    dw $3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E
    dw $3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E
    dw $38CC,$38CD,$3CF8,$3CE4,$3CF2,$3C4E,$3C4E,$3C4E
    dw $3C4E,$3C4E,$3C4E,$2CED,$2CEE,$3C4E,$3C4E,$3C4E
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

  .saveCompleted:
; '  SAVE COMPLETED.  '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E
    dw $3CF2,$3CE0,$3CF5,$3CE4,$3C4E,$3CE2,$3CEE,$3CEC
    dw $3CEF,$3CEB,$3CE4,$3CF3,$3CE4,$3CE3,$3CFA,$3C4E
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

  .reserveTank:
; '   RESERVE TANK    '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E
    dw $284E,$28F1,$28E4,$28F2,$28E4,$28F1,$28F5,$28E4
    dw $284E,$28F3,$28E0,$28ED,$28EA,$284E,$284E,$284E
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

  .gravitySuit:
; '   GRAVITY SUIT    '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E
    dw $284E,$28E6,$28F1,$28E0,$28F5,$28E8,$28F3,$28F8
    dw $284E,$28F2,$28F4,$28E8,$28F3,$284E,$284E,$284E
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

  .Terminator:
    dw $0000

UNUSED_MessageTilemaps_YES_859581:
; '  =>YES      NO    ' (unused)
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E
    dw $38CC,$38CD,$3CF8,$3CE4,$3CF2,$3C4E,$3C4E,$3C4E
    dw $3C4E,$3C4E,$3C4E,$2CED,$2CEE,$3C4E,$3C4E,$3C4E
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

MessageTilemaps_YES:
; '  =>YES      NO    '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E
    dw $38CC,$38CD,$3CF8,$3CE4,$3CF2,$3C4E,$3C4E,$3C4E
    dw $3C4E,$3C4E,$3C4E,$2CED,$2CEE,$3C4E,$3C4E,$3C4E
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

MessageTilemaps_NO:
; '    YES    =>NO    '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E
    dw $3C4E,$3C4E,$2CF8,$2CE4,$2CF2,$3C4E,$3C4E,$3C4E
    dw $3C4E,$38CC,$38CD,$3CED,$3CEE,$3C4E,$3C4E,$3C4E
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E

    dw $0000


Freespace_Bank85_9643:
; DP_MainScreenLayersBD bytes
