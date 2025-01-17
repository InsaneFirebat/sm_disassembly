
org $858000


Large_MessageBox_TopBottomBorder_Tilemap:
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E 
    dw $284E,$280F,$280F,$280F,$280F,$280F,$280F,$280F 
    dw $280F,$280F,$280F,$280F,$280F,$280F,$280F,$280F 
    dw $280F,$280F,$280F,$284E,$284E,$000E,$000E,$000E 

Small_MessageBox_TopBottomBorder_Tilemap:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E 
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E 
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E 
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E 

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
    PHP 
    PHB 
    PHX 
    PHY 
    PHK 
    PLB 
    STA.W $1C1F 
    JSL.L Cancel_Sound_Effects 
    JSR.W Initialise_PPU_for_MessageBoxes 
    JSR.W Clear_MessageBox_BG3Tilemap 
    JSR.W Initialise_MessageBox 
    JSR.W Play_2_Lag_Frames_of_Music_and_Sound_Effects 
    JSR.W Open_MessageBox 
    LDA.W $1C1F 
    CMP.W #$001C 
    BEQ .gunship 
    JSR.W Handle_MessageBox_Interaction 
    JSR.W Close_MessageBox 
    JSR.W Clear_MessageBox_BG3Tilemap 
    JSR.W Restore_PPU 
    JSL.L Queue_Samus_Movement_SoundEffects 
    JSR.W Play_2_Lag_Frames_of_Music_and_Sound_Effects 
    JSR.W MaybeTriggerPauseScreen_or_ReturnSaveConfirmationSelection 

.return:
    PLY 
    PLX 
    PLB 
    PLP 
    RTL 

.gunship:
    JSR.W Handle_MessageBox_Interaction 
    JSR.W Close_MessageBox 
    LDA.W $05F9 
    CMP.W #$0002 
    BEQ .no 
    LDA.W #$0018 : STA.W $1C1F 
    JSR.W Clear_MessageBox_BG3Tilemap 
    JSR.W Play_Saving_Sound_Effect 
    JSR.W Initialise_MessageBox 
    JSR.W Play_2_Lag_Frames_of_Music_and_Sound_Effects 
    JSR.W Open_MessageBox 
    JSR.W Handle_MessageBox_Interaction 
    JSR.W Close_MessageBox 

.no:
    JSR.W Clear_MessageBox_BG3Tilemap 
    JSR.W Restore_PPU 
    JSL.L Queue_Samus_Movement_SoundEffects 
    JSR.W Play_2_Lag_Frames_of_Music_and_Sound_Effects 
    JSR.W MaybeTriggerPauseScreen_or_ReturnSaveConfirmationSelection 
    BRA .return 


MaybeTriggerPauseScreen_or_ReturnSaveConfirmationSelection:
    REP #$30 
    LDA.W $1C1F 
    CMP.W #$0014 
    BNE .notMapPause 
    LDA.W #$000C : STA.W $0998 
    RTS 


.notMapPause:
    CMP.W #$001C 
    BEQ .saveConfirmationSelection 
    CMP.W #$0017 
    BNE .return 

.saveConfirmationSelection:
    LDA.W $05F9 

.return:
    RTS 


Play_Saving_Sound_Effect:
    REP #$30 
    LDA.W #$002E 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W #$00A0 

.loop:
    PHA 
    JSL.L HandleMusicQueue 
    JSL.L HandleSounds 
    JSR.W Wait_for_Lag_Frame 
    PLA 
    DEC A 
    BNE .loop 
    RTS 


Wait_for_Lag_Frame:
    PHP 
    SEP #$20 
    LDA.W $05B8 

.wait:
    CMP.W $05B8 
    BEQ .wait 
    PLP 
    RTS 


Initialise_PPU_for_MessageBoxes:
    REP #$20 
    STZ.W $05F9 
    JSR.W Wait_for_Lag_Frame 
    SEP #$20 
    STZ.W $420C 
    LDA.B #$19 : STA.W $2121 
    LDA.B #$B1 : STA.W $2122 
    LDA.B #$0B : STA.W $2122 
    LDA.B #$1F : STA.W $2122 
    LDA.B #$00 : STA.W $2122 
    LDA.B $85 : STA.L $7E33EA 
    LDA.B $5B : STA.L $7E33EB 
    LDA.B #$58 : STA.B $5B 
    LDA.B #$17 : STA.B $6A 
    STZ.B $70 
    STZ.B $73 
    LDA.B #$20 : STA.W $2132 
    LDA.B #$40 : STA.W $2132 
    LDA.B #$80 : STA.W $2132 
    LDA.W $2111 
    STZ.W $2111 
    STZ.W $2111 
    LDA.W $2112 
    STZ.W $2112 
    STZ.W $2112 
    REP #$30 
    LDX.W #$0080 
    LDA.W #$0000 

.loop:
    STA.L $7E3000,X 
    DEX #2
    BPL .loop 
    JSR.W Wait_for_Lag_Frame 
    REP #$20 
    LDA.W #$5880 : STA.W $2116 
    LDA.W $2139 
    LDA.W #$3981 ;  (8-bit transfer looks wrong, bug?)
    STA.W $4310 
    LDA.W #$4100 : STA.W $4312 
    LDA.W #$007E : STA.W $4314 
    LDA.W #$0700 : STA.W $4315 
    STZ.W $4317 
    STZ.W $4319 
    SEP #$20 
    LDA.B #$80 : STA.W $2115 
    LDA.B #$02 : STA.W $420B 
    JSL.L HandleMusicQueue 
    JSL.L HandleSounds 
    RTS 


Clear_MessageBox_BG3Tilemap:
    REP #$30 
    LDX.W #$06FE 
    LDA.W .blankTile 

.loop:
    STA.L $7E3800,X 
    DEX #2
    BPL .loop 
    JSR.W Wait_for_Lag_Frame 
    LDA.W #$5880 : STA.W $2116 
    LDA.W #$1801 : STA.W $4310 
    LDA.W #$3800 : STA.W $4312 
    LDA.W #$007E : STA.W $4314 
    LDA.W #$0700 : STA.W $4315 
    STZ.W $4317 
    STZ.W $4319 
    SEP #$20 
    LDA.B #$80 : STA.W $2115 
    LDA.B #$02 : STA.W $420B 
    JSL.L HandleMusicQueue 
    JSL.L HandleSounds 
    RTS 


.blankTile:
    dw $000E 

Initialise_MessageBox:
    REP #$30 
    LDA.W $1C1F 
    DEC A 
    ASL A 
    STA.B $34 
    ASL A 
    CLC : ADC.B $34 : TAX 
    PHX 
    JSR.W (MessageDefinitionsPointers_drawInitialMessageBox,X) 
    PLX 
    JSR.W (MessageDefinitionsPointers_modifyMessageBox,X) 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_REP30_858258:
    REP #$30 
endif ; !FEATURE_KEEP_UNREFERENCED

Write_Large_MessageBox_Tilemap:
    LDX.W #$0000 

.topBorderLoop:
    LDA.W Large_MessageBox_TopBottomBorder_Tilemap,X : STA.L $7E3200,X 
    INX #2
    CPX.W #$0040 
    BNE .topBorderLoop 
    LDY.W #$0000 
    JSR.W Write_Message_Tilemap 
    LDA.W #$0020 : STA.B $16 
    LDY.W #$0000 

.bottomBorderLoop:
    LDA.W Large_MessageBox_TopBottomBorder_Tilemap,Y : STA.L $7E3200,X 
    INY #2
    INX #2
    DEC.B $16 
    BNE .bottomBorderLoop 
    RTS 


Write_Small_MessageBox_Tilemap:
    LDY.W #$0000 
    LDX.W #$0000 

.topBorderLoop:
    LDA.W Small_MessageBox_TopBottomBorder_Tilemap,X : STA.L $7E3200,X 
    INX #2
    CPX.W #$0040 
    BNE .topBorderLoop 
    JSR.W Write_Message_Tilemap 
    LDA.W #$0020 : STA.B $16 
    LDY.W #$0000 

.bottomBorderLoop:
    LDA.W Small_MessageBox_TopBottomBorder_Tilemap,Y : STA.L $7E3200,X 
    INY #2
    INX #2
    DEC.B $16 
    BNE .bottomBorderLoop 
    RTS 


Write_Message_Tilemap:
    JSR.W Wait_for_Lag_Frame 
    JSL.L HandleMusicQueue 
    JSL.L HandleSounds 
    REP #$30 
    LDA.W #$0070 : STA.W $05A6 
    LDA.W #$007C : STA.W $05A4 
    STZ.W $05A2 
    LDX.W #$0000 
    LDA.W #$0000 

.zeroLoop:
    STA.L $7E3000,X 
    INX #2
    CPX.W #$00E0 
    BNE .zeroLoop 
    LDA.W $1C1F 
    DEC A 
    ASL A 
    STA.B $34 
    ASL A 
    CLC : ADC.B $34 : TAX 
    LDA.W MessageDefinitionsPointers_messageTilemap,X : STA.B $00 
    LDA.W MessageDefinitionsPointers_nextEntryMessageTilemap,X : SEC : SBC.B $00 : STA.B $09 
    LSR A 
    STA.B $16 
    LDA.B $09 : CLC : ADC.W #$0080 : STA.B $09 
    LDX.W #$0040 
    LDY.W #$0000 

.messageLoop:
    LDA.B ($00),Y : STA.L $7E3200,X 
    INX #2
    INY #2
    DEC.B $16 
    BNE .messageLoop 
    RTS 


Setup_PPU_for_Active_MessageBox:
    JSR.W Setup_MessageBox_BG3_Yscroll_HDMA 
    JSR.W Wait_for_Lag_Frame 
    REP #$20 
    LDA.W #$5800 : CLC : ADC.B $34 : STA.B $34 
    STA.W $2116 
    LDA.W #$1801 : STA.W $4310 
    LDA.W #$3200 : STA.W $4312 
    LDA.W #$007E : STA.W $4314 
    LDA.B $09 : STA.W $4315 
    STZ.W $4317 
    STZ.W $4319 
    SEP #$20 
    LDA.B #$80 : STA.W $2115 
    LDA.B #$02 : STA.W $420B 
    JSL.L HandleMusicQueue 
    JSL.L HandleSounds 
    RTS 


Setup_MessageBox_BG3_Yscroll_HDMA:
    SEP #$20 
    LDA.B #$FF : STA.L $7E3380 
    LDA.B #$00 : STA.L $7E3381 
    LDA.B #$30 : STA.L $7E3382 
    LDA.B #$E1 : STA.L $7E3383 
    LDA.B #$FE : STA.L $7E3384 
    LDA.B #$30 : STA.L $7E3385 
    LDA.B #$00 : STA.L $7E3386 
    LDA.B #$42 : STA.W $4360 
    LDA.B #$12 : STA.W $4361 
    LDA.B #$80 : STA.W $4362 
    STA.W $4365 
    LDA.B #$33 : STA.W $4363 
    STA.W $4366 
    LDA.B #$7E : STA.W $4364 
    STA.W $4367 
    STZ.W $4368 
    STZ.W $4369 
    STZ.W $436A 
    JSR.W Write_MessageBox_BG3_Yscroll_HDMA_DataTable 
    SEP #$20 
    LDA.B #$40 : STA.W $420C 
    RTS 


DrawShootButton_SetupPPUForLargeMessageBox:
    REP #$30 
    LDA.W $09B2 : BRA DrawSpecialButton_SetupPPUForLargeMessageBox 


DrawRunButton_SetupPPUForLargeMessageBox:
    REP #$30 
    LDA.W $09B6 

DrawSpecialButton_SetupPPUForLargeMessageBox:
    LDY.W #$0000 
    BIT.W #$0080 
    BNE .found 
    LDY.W #$0002 
    BIT.W #$8000 
    BNE .found 
    LDY.W #$0004 
    BIT.W #$0040 
    BNE .found 
    LDY.W #$0006 
    BIT.W #$4000 
    BNE .found 
    LDY.W #$0008 
    BIT.W #$2000 
    BNE .found 
    LDY.W #$000A 
    BIT.W #$0020 
    BNE .found 
    LDY.W #$000C 
    BIT.W #$0010 
    BNE .found 
    LDY.W #$000E 

.found:
    LDA.W $1C1F 
    DEC A 
    ASL A 
    TAX 
    LDA.W Special_Button_Tilemap_Offsets,X 
    TAX 
    LDA.W .buttons,Y : STA.L $7E3200,X 
    LDA.W #$01A0 : STA.B $34 
    JSR.W Setup_PPU_for_Active_MessageBox 
    RTS 


.buttons: 
    dw $28E0 ; A
    dw $3CE1 ; B
    dw $2CF7 ; X
    dw $38F8 ; Y
    dw $38D0 ; Select
    dw $38EB ; L
    dw $38F1 ; R
    dw $284E ; Blank

Setup_PPU_for_Small_MessageBox:
    REP #$30 
    LDA.W #$01C0 : STA.B $34 
    JSR.W Setup_PPU_for_Active_MessageBox 
    RTS 


Setup_PPU_for_Large_MessageBox:
    REP #$30 
    LDA.W #$01A0 : STA.B $34 
    JSR.W Setup_PPU_for_Active_MessageBox 
    RTS 


Open_MessageBox:
    REP #$30 
    STZ.W $05A2 

.loop:
    JSR.W Write_MessageBox_BG3_Yscroll_HDMA_DataTable 
    LDA.W $05A2 : CLC : ADC.W #$0200 : STA.W $05A2 
    CMP.W #$1800 
    BMI .loop 
    LDA.W #$1800 : STA.W $05A2 
    JSR.W Write_MessageBox_BG3_Yscroll_HDMA_DataTable 
    RTS 


Handle_MessageBox_Interaction:
    SEP #$20 
    LDA.W $1C1F 
    CMP.B #$17 
    BEQ .save 
    CMP.B #$1C 
    BEQ .save 
    LDX.W #$000A 
    LDA.W $1C1F 
    CMP.B #$14 
    BEQ .lagLoop 
    CMP.B #$15 
    BEQ .lagLoop 
    CMP.B #$16 
    BEQ .lagLoop 
    CMP.B #$18 
    BEQ .lagLoop 
    LDX.W #$0168 

.lagLoop:
    JSR.W Wait_for_Lag_Frame 
    PHX 
    JSL.L HandleMusicQueue 
    JSL.L HandleSounds 
    PLX 
    DEX 
    BNE .lagLoop 

.loopInput:
    LDA.W $4212 
    BIT.B #$01 
    BNE .loopInput 
    LDA.W $4218 : BNE .busyReturn 
    LDA.W $4219 : BEQ .loopInput 

.busyReturn:
    RTS 


.save:
    REP #$30 
    STZ.W $05F9 

.saveInput:
    SEP #$30 
    LDX.B #$02 

.waitLoop:
    JSR.W Wait_for_Lag_Frame 
    PHX 
    JSL.L HandleMusicQueue 
    JSL.L HandleSounds 
    PLX 
    DEX 
    BNE .waitLoop 
    JSL.L ReadControllerInput 
    REP #$30 
    LDA.B $8F : BEQ .saveInput 
    BIT.W #$0080 
    BNE .inputA 
    BIT.W #$8000 
    BNE .inputB 
    BIT.W #$2300 
    BEQ .saveInput 
    JSR.W Toggle_Save_Confirmation_Selection 
    REP #$30 
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 
    REP #$30 
    BRA .saveInput 


.return:
    RTS 


.inputA:
    LDA.W $05F9 : BNE .return 
    BRA .return 


.inputB:
    LDA.W #$0002 : STA.W $05F9 
    BRA .return 


Toggle_Save_Confirmation_Selection:
    LDA.W $05F9 : EOR.W #$0002 : STA.W $05F9 
    LDY.W #$0040 
    CMP.W #$0002 
    BNE + 
    LDY.W #$0080 

  + LDX.W #$0100 
    LDA.W #$0020 : STA.B $34 

.loop:
    LDA.W UNUSED_MessageTilemaps_YES_859581,Y : STA.L $7E3200,X 
    INX #2
    INY #2
    DEC.B $34 
    BNE .loop 
    JSR.W Wait_for_Lag_Frame 
    REP #$20 
    LDA.W #$59A0 : STA.B $34 
    LDA.B $34 ; >_<
    STA.W $2116 
    LDA.W #$1801 : STA.W $4310 
    LDA.W #$3200 : STA.W $4312 
    LDA.W #$007E : STA.W $4314 
    LDA.W #$0180 : STA.W $4315 
    STZ.W $4317 
    STZ.W $4319 
    SEP #$20 
    LDA.B #$80 : STA.W $2115 
    LDA.B #$02 : STA.W $420B 
    JSL.L HandleMusicQueue 
    JSL.L HandleSounds 
    RTS 


Play_2_Lag_Frames_of_Music_and_Sound_Effects:
    SEP #$30 
    LDX.B #$02 

.loop:
    JSR.W Wait_for_Lag_Frame 
    PHX 
    JSL.L HandleMusicQueue 
    JSL.L HandleSounds 
    PLX 
    DEX 
    BNE .loop 
    RTS 


Close_MessageBox:
    REP #$30 

.loop:
    JSR.W Write_MessageBox_BG3_Yscroll_HDMA_DataTable 
    LDA.W $05A2 : SEC : SBC.W #$0200 : STA.W $05A2 
    BPL .loop 
    RTS 


Write_MessageBox_BG3_Yscroll_HDMA_DataTable:
    PHP 
    JSR.W Wait_for_Lag_Frame 
    REP #$30 
    JSL.L HandleMusicQueue 
    JSL.L HandleSounds 
    LDA.W #$7B00 : SEC : SBC.W $05A2 : XBA 
    AND.W #$00FF 
    STA.W $05A8 
    LDA.W #$0063 : STA.W $05AA 
    LDA.W #$7C00 : CLC : ADC.W $05A2 : XBA 
    AND.W #$00FF 
    STA.W $05A4 
    LDA.W #$0094 : STA.W $05A6 
    LDX.W #$00F6 
    LDY.W #$00F8 
    LDA.W #$001E : STA.B $14 

.loop:
    LDA.W $05AA : SEC : SBC.W $05A8 : STA.L $7E3000,X 
    DEC.W $05AA 
    DEC.W $05A8 
    DEX #2
    PHX 
    TYX 
    LDA.W $05A6 : SEC : SBC.W $05A4 : STA.L $7E3000,X 
    PLX 
    INC.W $05A6 
    INC.W $05A4 
    INY #2
    DEC.B $14 
    BNE .loop 
    TYX 
    LDA.W #$0000 

.zeroLoop:
    STA.L $7E3000,X 
    INX #2
    CPX.W #$01E0 
    BMI .zeroLoop 
    PLP 
    RTS 


Restore_PPU:
    REP #$20 
    JSR.W Wait_for_Lag_Frame 
    REP #$20 
    LDA.W #$5880 : STA.W $2116 
    LDA.W #$1801 : STA.W $4310 
    LDA.W #$4100 : STA.W $4312 
    LDA.W #$007E : STA.W $4314 
    LDA.W #$0700 : STA.W $4315 
    STZ.W $4317 
    STZ.W $4319 
    SEP #$20 
    LDA.B #$80 : STA.W $2115 
    LDA.B #$02 : STA.W $420B 
    JSR.W Wait_for_Lag_Frame 
    SEP #$20 
    LDA.L $7E33EA : STA.B $85 
    STA.W $420C 
    LDA.L $7E33EB : STA.B $5B 
    LDA.B $69 : STA.B $6A 
    LDA.B $6E : STA.B $70 
    LDA.B $71 : STA.B $73 
    LDA.B #$19 : STA.W $2121 
    LDA.L $7EC032 : STA.W $2122 
    LDA.L $7EC033 : STA.W $2122 
    LDA.L $7EC034 : STA.W $2122 
    LDA.L $7EC035 : STA.W $2122 
    JSL.L HDMAObjectHandler_HandleMusicQueue 
    JSL.L HandleSounds 
    RTS 


MessageDefinitionsPointers:
  .modifyMessageBox
    dw Setup_PPU_for_Small_MessageBox ; 1: Energy tank
  .drawInitialMessageBox
    dw Write_Small_MessageBox_Tilemap 
  .messageTilemap
    dw MessageTilemaps_energyTank 
    dw DrawShootButton_SetupPPUForLargeMessageBox ; 2: Missile
    dw Write_Large_MessageBox_Tilemap 
  .nextEntryMessageTilemap
    dw MessageTilemaps_missile 
    dw DrawShootButton_SetupPPUForLargeMessageBox ; 3: Super missile
    dw Write_Large_MessageBox_Tilemap 
    dw MessageTilemaps_superMissile 
    dw DrawShootButton_SetupPPUForLargeMessageBox ; 4: Power bomb
    dw Write_Large_MessageBox_Tilemap 
    dw MessageTilemaps_powerBomb 
    dw DrawShootButton_SetupPPUForLargeMessageBox ; 5: Grappling beam
    dw Write_Large_MessageBox_Tilemap 
    dw MessageTilemaps_grapplingBeam 
    dw DrawRunButton_SetupPPUForLargeMessageBox ; 6: X-ray scope
    dw Write_Large_MessageBox_Tilemap 
    dw MessageTilemaps_xrayScope 
    dw Setup_PPU_for_Small_MessageBox ; 7: Varia suit
    dw Write_Small_MessageBox_Tilemap 
    dw MessageTilemaps_variaSuit 
    dw Setup_PPU_for_Small_MessageBox ; 8: Spring ball
    dw Write_Small_MessageBox_Tilemap 
    dw MessageTilemaps_springBall 
    dw Setup_PPU_for_Small_MessageBox ; 9: Morphing ball
    dw Write_Small_MessageBox_Tilemap 
    dw MessageTilemaps_morphingBall 
    dw Setup_PPU_for_Small_MessageBox ; Ah: Screw attack
    dw Write_Small_MessageBox_Tilemap 
    dw MessageTilemaps_screwAttack 
    dw Setup_PPU_for_Small_MessageBox ; Bh: Hi-jump boots
    dw Write_Small_MessageBox_Tilemap 
    dw MessageTilemaps_hiJumpBoots 
    dw Setup_PPU_for_Small_MessageBox ; Ch: Space jump
    dw Write_Small_MessageBox_Tilemap 
    dw MessageTilemaps_spaceJump 
    dw DrawRunButton_SetupPPUForLargeMessageBox ; Dh: Speed booster
    dw Write_Large_MessageBox_Tilemap 
    dw MessageTilemaps_speedBooster 
    dw Setup_PPU_for_Small_MessageBox ; Eh: Charge beam
    dw Write_Small_MessageBox_Tilemap 
    dw MessageTilemaps_chargeBeam 
    dw Setup_PPU_for_Small_MessageBox ; Fh: Ice beam
    dw Write_Small_MessageBox_Tilemap 
    dw MessageTilemaps_iceBeam 
    dw Setup_PPU_for_Small_MessageBox ; 10h: Wave beam
    dw Write_Small_MessageBox_Tilemap 
    dw MessageTilemaps_waveBeam 
    dw Setup_PPU_for_Small_MessageBox ; 11h: Spazer
    dw Write_Small_MessageBox_Tilemap 
    dw MessageTilemaps_spazer 
    dw Setup_PPU_for_Small_MessageBox ; 12h: Plasma beam
    dw Write_Small_MessageBox_Tilemap 
    dw MessageTilemaps_plasmaBeam 
    dw DrawShootButton_SetupPPUForLargeMessageBox ; 13h: Bomb
    dw Write_Large_MessageBox_Tilemap 
    dw MessageTilemaps_bomb 
    dw Setup_PPU_for_Small_MessageBox ; 14h: Map data access completed
    dw Write_Small_MessageBox_Tilemap 
    dw MessageTilemaps_map 
    dw Setup_PPU_for_Small_MessageBox ; 15h: Energy recharge completed
    dw Write_Small_MessageBox_Tilemap 
    dw MessageTilemaps_energyRecharge 
    dw Setup_PPU_for_Small_MessageBox ; 16h: Missile reload completed
    dw Write_Small_MessageBox_Tilemap 
    dw MessageTilemaps_missileReload 
    dw Setup_PPU_for_Large_MessageBox ; 17h: Would you like to save?
    dw Write_Small_MessageBox_Tilemap 
    dw MessageTilemaps_save 
    dw Setup_PPU_for_Small_MessageBox ; 18h: Save completed
    dw Write_Small_MessageBox_Tilemap 
    dw MessageTilemaps_saveCompleted 
    dw Setup_PPU_for_Small_MessageBox ; 19h: Reserve tank
    dw Write_Small_MessageBox_Tilemap 
    dw MessageTilemaps_reserveTank 
    dw Setup_PPU_for_Small_MessageBox ; 1Ah: Gravity suit
    dw Write_Small_MessageBox_Tilemap 
    dw MessageTilemaps_gravitySuit 
    dw Setup_PPU_for_Small_MessageBox ; 1Bh: Terminator
    dw Write_Small_MessageBox_Tilemap 
    dw MessageTilemaps_Terminator 
    dw Setup_PPU_for_Large_MessageBox ; 1Ch: Would you like to save? (Used by gunship)
    dw Write_Small_MessageBox_Tilemap 
    dw MessageTilemaps_save 
    dw Setup_PPU_for_Small_MessageBox ; 1Dh: Terminator. (Save completed, unused)
    dw Write_Small_MessageBox_Tilemap 
    dw MessageTilemaps_saveCompleted 

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
  .energyTank
; '    ENERGY TANK    '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E 
    dw $284E,$284E,$28E4,$28ED,$28E4,$28F1,$28E6,$28F8 
    dw $284E,$28F3,$28E0,$28ED,$28EA,$284E,$284E,$284E 
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E 

  .missile
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

  .superMissile
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

  .powerBomb
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

  .grapplingBeam
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

  .xrayScope
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

  .variaSuit
; '    VARIA SUIT     '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E 
    dw $284E,$284E,$28F5,$28E0,$28F1,$28E8,$28E0,$284E 
    dw $28F2,$28F4,$28E8,$28F3,$284E,$284E,$284E,$284E 
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E 

  .springBall
; '    SPRING BALL    '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E 
    dw $284E,$284E,$28F2,$28EF,$28F1,$28E8,$28ED,$28E6 
    dw $284E,$28E1,$28E0,$28EB,$28EB,$284E,$284E,$284E 
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E 

  .morphingBall
; '   MORPHING BALL   '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E 
    dw $284E,$28EC,$28EE,$28F1,$28EF,$28E7,$28E8,$28ED 
    dw $28E6,$284E,$28E1,$28E0,$28EB,$28EB,$284E,$284E 
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E 

  .screwAttack
; '   SCREW ATTACK    '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E 
    dw $284E,$28F2,$28E2,$28F1,$28E4,$28F6,$284E,$28E0 
    dw $28F3,$28F3,$28E0,$28E2,$28EA,$284E,$284E,$284E 
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E 

  .hiJumpBoots
; '   HI-JUMP BOOTS   '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E 
    dw $284E,$28E7,$28E8,$28CF,$28E9,$28F4,$28EC,$28EF 
    dw $284E,$28E1,$28EE,$28EE,$28F3,$28F2,$284E,$284E 
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E 

  .spaceJump
; '    SPACE JUMP     '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E 
    dw $284E,$284E,$28F2,$28EF,$28E0,$28E2,$28E4,$284E 
    dw $28E9,$28F4,$28EC,$28EF,$284E,$284E,$284E,$284E 
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E 

  .speedBooster
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

  .chargeBeam
; '    CHARGE BEAM    '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E 
    dw $284E,$284E,$28E2,$28E7,$28E0,$28F1,$28E6,$28E4 
    dw $284E,$28E1,$28E4,$28E0,$28EC,$284E,$284E,$284E 
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E 

  .iceBeam
; '     ICE BEAM      '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E 
    dw $284E,$284E,$284E,$28E8,$28E2,$28E4,$284E,$28E1 
    dw $28E4,$28E0,$28EC,$284E,$284E,$284E,$284E,$284E 
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E 

  .waveBeam
; '     WAVE BEAM     '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E 
    dw $284E,$284E,$284E,$28F6,$28E0,$28F5,$28E4,$284E 
    dw $28E1,$28E4,$28E0,$28EC,$284E,$284E,$284E,$284E 
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E 

  .spazer
; '      SPAZER       '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E 
    dw $284E,$284E,$284E,$284E,$28F2,$28EF,$28E0,$28F9 
    dw $28E4,$28F1,$284E,$284E,$284E,$284E,$284E,$284E 
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E 

  .plasmaBeam
; '    PLASMA BEAM    '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E 
    dw $284E,$284E,$28EF,$28EB,$28E0,$28F2,$28EC,$28E0 
    dw $284E,$28E1,$28E4,$28E0,$28EC,$284E,$284E,$284E 
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E 

  .bomb
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

  .map
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

  .energyRecharge
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

  .missileReload
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

  .save
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

  .saveCompleted
; '  SAVE COMPLETED.  '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E 
    dw $3CF2,$3CE0,$3CF5,$3CE4,$3C4E,$3CE2,$3CEE,$3CEC 
    dw $3CEF,$3CEB,$3CE4,$3CF3,$3CE4,$3CE3,$3CFA,$3C4E 
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E 

  .reserveTank
; '   RESERVE TANK    '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E 
    dw $284E,$28F1,$28E4,$28F2,$28E4,$28F1,$28F5,$28E4 
    dw $284E,$28F3,$28E0,$28ED,$28EA,$284E,$284E,$284E 
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E 

  .gravitySuit
; '   GRAVITY SUIT    '
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E 
    dw $284E,$28E6,$28F1,$28E0,$28F5,$28E8,$28F3,$28F8 
    dw $284E,$28F2,$28F4,$28E8,$28F3,$284E,$284E,$284E 
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E 

  .Terminator
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
; $69BD bytes
