
org $8B8000


;;; $8000: Set up PPU for title sequence ;;;
Setup_PPU_TitleSequence:
; No idea why pause menu variables are being cleared here
    PHP
    SEP #$30
    LDA.B #$80 : STA.W $2100 : STA.B DP_Brightness
    LDA.B #$03 : STA.W $2101 : STA.B DP_SpriteSizeAddr
    LDA.B #$07 : STA.W $2105 : STA.B DP_BGModeSize
    LDA.B #$80 : STA.W $211A : STA.B DP_Mode7Settings
    LDA.B #$00 : STA.B DP_BG1TilemapAddrSize : STA.W $2107
    STZ.B DP_BG2TilemapAddrSize : STZ.W $2108
    STZ.B DP_BG3TilemapAddrSize : STZ.W $2109
    STZ.B DP_BG4TilemapAddrSize : STZ.W $210A
    STZ.B DP_BGTilesAddr : STZ.W $210B
    STZ.B DP_BGTilesAddr+1 : STZ.W $210C
    LDA.B #$10 : STA.W $212C : STA.B DP_MainScreenLayers
    STZ.W $212D : STZ.B DP_SubScreenLayers
    STZ.W $212E : STZ.B DP_WindowAreaMainScreen
    STZ.W $2115
    STZ.W $2130 : STZ.B DP_NextGameplayColorMathA
    STZ.W $2131 : STZ.B DP_NextGameplayColorMathB
    LDA.B #$E0 : STA.W $2132
    LDA.B #$00 : STA.W $2133 : STA.B DP_DisplayResolution
    REP #$30
    LDA.W #$0000
    LDX.W #$3000
    LDY.W #$07FE
    JSL WriteYBytesOfATo_7E0000_X_16bit
    STZ.W OAMStack : STZ.W MenuOptionIndex
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    STZ.W PauseMenu_ButtonPressedHighlightTimer : STZ.W PauseMenu_HighlightAnimationTimer
    STZ.W PauseMenu_ItemSelectorAnimationTimer : STZ.W PauseMenu_ReserveTankAnimationTimer
    STZ.W PauseMenu_UnusedAnimationTimer0731 : STZ.W PauseMenu_UnusedAnimationTimer073D
    STZ.W PauseMenu_HighlightAnimationFrame : STZ.W PauseMenu_ItemSelectorAnimationFrame
    STZ.W PauseMenu_ReserveTankAnimationFrame : STZ.W PauseMenu_UnusedAnimationFrame
    STZ.W PauseMenu_ShoulderButtonPressedHighlight : STZ.W PauseMenu_ButtonLabelMode
    STZ.W PauseMenu_EquipmentScreenCategoryIndex : STZ.W PauseMenu_ReserveTankSoundDelayCounter
    STZ.W PauseMenu_UnusedAnimationMode
    STZ.W ReserveEnergy : STZ.W ReserveMissiles
    STZ.W Mode7TransformationAngle
    LDA.W #$0100 : STA.W Mode7TransformationZoomLevel
    STZ.W CinematicBG1_XSubPosition : STZ.W CinematicBG1_XPosition
    STZ.W CinematicBG1_YSubPosition : STZ.W CinematicBG1_YPosition
    STZ.W CinematicBG1_XSubSpeed : STZ.W CinematicBG1_XSpeed
    STZ.W CinematicBG1_YSubSpeed : STZ.W CinematicBG1_YSpeed
    PLP
    RTS


;;; $80DA: Set up PPU for intro ;;;
Setup_PPU_Intro:
    PHP
    SEP #$30
    LDA.B #$80 : STA.W $2100 : STA.B DP_Brightness
    LDA.B #$03 : STA.W $2101 : STA.B DP_SpriteSizeAddr
    LDA.B #$09 : STA.W $2105 : STA.B DP_BGModeSize
    LDA.B #$00 : STA.W $211A : STA.B DP_Mode7Settings
    LDA.B #$50 : STA.B DP_BG1TilemapAddrSize : STA.W $2107
    LDA.B #$48 : STA.B DP_BG2TilemapAddrSize : STA.W $2108
    LDA.B #$4C : STA.B DP_BG3TilemapAddrSize : STA.W $2109
    STZ.B DP_BG4TilemapAddrSize : STZ.W $210A
    STZ.B DP_BGTilesAddr : STZ.W $210B
    LDA.B #$04 : STA.B DP_BGTilesAddr+1 : STA.W $210C
    LDA.B #$04 : STA.W $212C : STA.B DP_MainScreenLayers
    STZ.W $212D : STZ.B DP_SubScreenLayers
    STZ.W $212E : STZ.B DP_WindowAreaMainScreen
    STZ.W $2115
    STZ.W $2130 : STZ.B DP_NextGameplayColorMathA
    STZ.W $2131 : STZ.B DP_NextGameplayColorMathB
    LDA.B #$E0 : STA.W $2132
    LDA.B #$00 : STA.W $2133 : STA.B DP_DisplayResolution
    STZ.B DP_ColorMathA : STZ.B DP_ColorMathB
    LDA.B #$20 : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.B #$40 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor2
    STZ.B DP_Mosaic
    REP #$30
    LDA.W #$002F
    LDX.W #$3000
    LDY.W #$07FE
    JSL WriteYBytesOfATo_7E0000_X_16bit
    STZ.W OAMStack : STZ.W Mode7TransformationAngle
    LDA.W #$0100 : STA.W Mode7TransformationZoomLevel
    STZ.W CinematicBG1_XSubPosition : STZ.W CinematicBG1_XPosition
    STZ.W CinematicBG1_YSubPosition : STZ.W CinematicBG1_YPosition
    STZ.W CinematicBG1_XSubSpeed : STZ.W CinematicBG1_XSpeed
    STZ.W CinematicBG1_YSubSpeed : STZ.W CinematicBG1_YSpeed
    STZ.W LayerBlending_DefaultConfig
    STZ.B DP_BG2XScroll : STZ.B DP_BG2YScroll
    STZ.B DP_BG3XScroll : STZ.B DP_BG3YScroll
    PLP
    RTS


;;; $819B: Set up PPU for Ceres cutscene ;;;
Setup_PPU_CeresCutscene:
    PHP
    SEP #$30
    LDA.B #$80 : STA.W $2100 : STA.B DP_Brightness
    LDA.B #$03 : STA.W $2101 : STA.B DP_SpriteSizeAddr
    LDA.B #$07 : STA.W $2105 : STA.B DP_BGModeSize
    LDA.B #$80 : STA.W $211A : STA.B DP_Mode7Settings
    LDA.B #$00 : STA.B DP_BG1TilemapAddrSize : STA.W $2107
    STZ.B DP_BG2TilemapAddrSize : STZ.W $2108
    STZ.B DP_BG3TilemapAddrSize : STZ.W $2109
    STZ.B DP_BG4TilemapAddrSize : STZ.W $210A
    STZ.B DP_BGTilesAddr : STZ.W $210B
    STZ.B DP_BGTilesAddr+1 : STZ.W $210C
    LDA.B #$11 : STA.W $212C : STA.B DP_MainScreenLayers
    LDA.B #$00 : STA.W $212D : STA.B DP_SubScreenLayers
    STZ.W $212E : STZ.B DP_WindowAreaMainScreen
    STZ.W $2115
    STZ.W $2130 : STZ.B DP_NextGameplayColorMathA
    STZ.W $2131 : STZ.B DP_NextGameplayColorMathB
    LDA.B #$E0 : STA.W $2132
    STZ.B DP_ColorMathA : STZ.B DP_ColorMathB
    LDA.B #$20 : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.B #$40 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor2
    STZ.B DP_Mosaic
    REP #$30
    STZ.W CinematicBG1_XSubPosition : STZ.W CinematicBG1_XPosition
    STZ.W CinematicBG1_YSubPosition : STZ.W CinematicBG1_YPosition
    STZ.W CinematicBG1_XSubSpeed : STZ.W CinematicBG1_XSpeed
    STZ.W CinematicBG1_YSubSpeed : STZ.W CinematicBG1_YSpeed
    STZ.W LayerBlending_DefaultConfig
    PLP
    RTS


;;; $8230: Set up PPU for Samus goes to Zebes cutscene ;;;
Setup_PPU_SamusGoesToZebesCutscene:
    PHP
    SEP #$30
    LDA.B #$80 : STA.W $2100 : STA.B DP_Brightness
    LDA.B #$03 : STA.W $2101 : STA.B DP_SpriteSizeAddr
    LDA.B #$01 : STA.W $2105 : STA.B DP_BGModeSize
    LDA.B #$00 : STA.W $211A : STA.B DP_Mode7Settings
    LDA.B #$5C : STA.B DP_BG1TilemapAddrSize : STA.W $2107
    STZ.B DP_BG2TilemapAddrSize : STZ.W $2108
    STZ.B DP_BG3TilemapAddrSize : STZ.W $2109
    STZ.B DP_BG4TilemapAddrSize : STZ.W $210A
    LDA.B #$06 : STA.B DP_BGTilesAddr : STA.W $210B
    STZ.B DP_BGTilesAddr+1 : STZ.W $210C
    LDA.B #$11 : STA.W $212C : STA.B DP_MainScreenLayers
    STZ.W $212D : STZ.B DP_SubScreenLayers
    STZ.B DP_WindowMaskBG12 : STZ.B DP_WindowMaskBG34
    STZ.B DP_WindowMaskSprite
    STZ.B DP_WindowAreaMainScreen : STZ.B DP_WindowAreaSubScreen
    STZ.B DP_ColorMathA : STZ.B DP_ColorMathB
    REP #$30
    STZ.B DP_BG1XScroll : STZ.B DP_BG1YScroll
    PLP
    RTS


;;; $8293: Set up PPU for Zebes destruction ;;;
Setup_PPU_ZebesDestruction:
    PHP
    SEP #$30
    LDA.B #$80 : STA.W $2100 : STA.B DP_Brightness
    LDA.B #$A3 : STA.W $2101 : STA.B DP_SpriteSizeAddr
    LDA.B #$07 : STA.W $2105 : STA.B DP_BGModeSize
    LDA.B #$00 : STA.W $211A : STA.B DP_Mode7Settings
    LDA.B #$00 : STA.B DP_BG1TilemapAddrSize : STA.W $2107
    STZ.B DP_BG2TilemapAddrSize : STZ.W $2108
    STZ.B DP_BG3TilemapAddrSize : STZ.W $2109
    STZ.B DP_BG4TilemapAddrSize : STZ.W $210A
    STZ.B DP_BGTilesAddr : STZ.W $210B
    STZ.B DP_BGTilesAddr+1 : STZ.W $210C
    LDA.B #$11 : STA.W $212C : STA.B DP_MainScreenLayers
    STZ.W $212D : STZ.B DP_SubScreenLayers
    STZ.W $212E : STZ.B DP_WindowAreaMainScreen
    STZ.W $2115 : STZ.W $2130
    STZ.B DP_NextGameplayColorMathA : STZ.W $2131
    STZ.B DP_NextGameplayColorMathB
    STZ.B DP_ColorMathA : STZ.B DP_ColorMathB
    LDA.B #$E0 : STA.W $2132
    LDA.B #$00 : STA.W $2133 : STA.B DP_DisplayResolution
    LDA.B #$20 : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.B #$40 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor2
    REP #$30
    STZ.W OAMStack
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    STZ.W Mode7TransformationAngle
    LDA.W #$0100 : STA.W Mode7TransformationZoomLevel
    STZ.W CinematicBG1_XSubPosition : STZ.W CinematicBG1_XPosition
    STZ.W CinematicBG1_YSubPosition : STZ.W CinematicBG1_YPosition
    STZ.W CinematicBG1_XSubSpeed : STZ.W CinematicBG1_XSpeed
    STZ.W CinematicBG1_YSubSpeed : STZ.W CinematicBG1_YSpeed
    PLP
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $833A: Unused. Set up PPU for Zebes destruction space view ;;;
UNUSED_Setup_PPU_ZebesDestructionSpaceView_8B833A:
; Corresponds to the PPU setup done at $DA64 as part of
;     $DA1A: Cinematic function - ending - Zebes destruction scene 2 - cross-fade to space view
    PHP
    SEP #$30
    LDA.B #$80 : STA.W $2100 : STA.B DP_Brightness
    LDA.B #$02 : STA.W $2101 : STA.B DP_SpriteSizeAddr
    LDA.B #$01 : STA.W $2105 : STA.B DP_BGModeSize
    STZ.W $211A : STZ.B DP_Mode7Settings
    LDA.B #$70 : STA.B DP_BG1TilemapAddrSize : STA.W $2107
    LDA.B #$78 : STA.B DP_BG2TilemapAddrSize : STA.W $2108
    STZ.B DP_BG3TilemapAddrSize : STZ.W $2109
    STZ.B DP_BG4TilemapAddrSize : STZ.W $210A
    LDA.B #$44 : STA.B DP_BGTilesAddr : STA.W $210B
    STZ.B DP_BGTilesAddr+1 : STZ.W $210C
    LDA.B #$10 : STA.W $212C : STA.B DP_MainScreenLayers
    STZ.W $212D : STZ.B DP_SubScreenLayers
    STZ.W $212E : STZ.B DP_WindowAreaMainScreen
    STZ.W $2115
    STZ.W $2130 : STZ.B DP_NextGameplayColorMathA
    STZ.W $2131 : STZ.B DP_NextGameplayColorMathB
    LDA.B #$E0 : STA.W $2132
    STZ.B DP_ColorMathA : STZ.B DP_ColorMathB
    LDA.B #$20 : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.B #$40 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor2
    STZ.B DP_Mosaic
    REP #$30
    STZ.W CinematicBG1_XSubPosition : STZ.W CinematicBG1_XPosition
    STZ.W CinematicBG1_YSubPosition : STZ.W CinematicBG1_YPosition
    STZ.W CinematicBG1_XSubSpeed : STZ.W CinematicBG1_XSpeed
    STZ.W CinematicBG1_YSubSpeed : STZ.W CinematicBG1_YSpeed
    STZ.W LayerBlending_DefaultConfig
    STZ.B DP_BG2XScroll : STZ.B DP_BG2YScroll
    PLP
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $83D3: Set up PPU for credits ;;;
Setup_PPU_Credits:
    PHP
    SEP #$30
    LDA.B #$80 : STA.W $2100 : STA.B DP_Brightness
    LDA.B #$00 : STA.W $2101 : STA.B DP_SpriteSizeAddr
    LDA.B #$01 : STA.W $2105 : STA.B DP_BGModeSize
    LDA.B #$00 : STA.W $211A : STA.B DP_Mode7Settings
    LDA.B #$48 : STA.B DP_BG1TilemapAddrSize : STA.W $2107
    LDA.B #$4C : STA.B DP_BG2TilemapAddrSize : STA.W $2108
    LDA.B #$24 : STA.B DP_BG3TilemapAddrSize : STA.W $2109
    STZ.B DP_BG4TilemapAddrSize : STZ.W $210A
    LDA.B #$54 : STA.B DP_BGTilesAddr : STA.W $210B
    LDA.B #$02 : STA.B DP_BGTilesAddr+1 : STA.W $210C
    LDA.B #$01 : STA.W $212C : STA.B DP_MainScreenLayers
    STZ.W $212D : STZ.B DP_SubScreenLayers
    STZ.B DP_WindowMaskBG12 : STZ.B DP_WindowMaskBG34
    STZ.B DP_WindowMaskSprite
    STZ.B DP_WindowAreaMainScreen : STZ.B DP_WindowAreaSubScreen
    STZ.B DP_ColorMathA : STZ.B DP_ColorMathB
    LDA.B #$20 : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.B #$40 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor2
    REP #$30
    STZ.W OAMStack
    LDA.W #$0100 : STA.W $211B : STA.B DP_Mode7TransMatrixA
    STZ.W $211C : STZ.B DP_Mode7TransMatrixB
    STZ.W $211D : STZ.B DP_Mode7TransMatrixC
    STA.W $211E : STA.B DP_Mode7TransMatrixD
    LDA.W #$0080 : STA.W $211F : STA.B DP_Mode7TransOriginX
    STA.W $2120 : STA.B DP_Mode7TransOriginY
    STZ.W Mode7TransformationAngle
    LDA.W #$0001 : STA.W Mode7TransformationZoomLevel
    STZ.B DP_BG1XScroll : STZ.B DP_BG1YScroll
    STZ.B DP_BG2XScroll : STZ.B DP_BG2YScroll
    STZ.W CinematicBG1_XSubPosition : STZ.W CinematicBG1_XPosition
    STZ.W CinematicBG1_YSubPosition : STZ.W CinematicBG1_YPosition
    PLP
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8488: Unused. Debug. Modify mode 7 transformation and BG1 position with controller ;;;
UNUSED_ModifyMode7TransformAndBG1PosWithController_8B8488:
    PHP
    REP #$30
    LDA.B DP_Controller1Input : BIT.W #$0200 : BEQ .checkRight
    LDA.W CinematicBG1_XPosition : CLC : ADC.W #$0002 : STA.W CinematicBG1_XPosition

  .checkRight:
    LDA.B DP_Controller1Input : BIT.W #$0100 : BEQ .checkUp
    LDA.W CinematicBG1_XPosition : SEC : SBC.W #$0002 : STA.W CinematicBG1_XPosition

  .checkUp:
    LDA.B DP_Controller1Input : BIT.W #$0800 : BEQ .checkDown
    LDA.W CinematicBG1_YPosition : CLC
    ADC.W #$0002 : STA.W CinematicBG1_YPosition

  .checkDown:
    LDA.B DP_Controller1Input : BIT.W #$0400 : BEQ .checkLR
    LDA.W CinematicBG1_YPosition : SEC : SBC.W #$0002 : STA.W CinematicBG1_YPosition

  .checkLR:
    LDA.B DP_Controller1Input : BIT.W #$0010 : BNE .pressingR
    BIT.W #$0020 : BEQ .checkB
    LDA.W Mode7TransformationAngle : DEC : AND.W #$00FF : STA.W Mode7TransformationAngle
    BRA .checkB

  .pressingR:
    LDA.W Mode7TransformationAngle : INC : AND.W #$00FF : STA.W Mode7TransformationAngle

  .checkB:
    LDA.B DP_Controller1Input : BIT.W #$8000 : BNE .zoomOut
    BIT.W #$0040 : BNE .zoomIn
    PLP
    RTS

  .zoomOut:
    LDA.W Mode7TransformationZoomLevel : CMP.W #$7000 : BPL .return
    INC : STA.W Mode7TransformationZoomLevel
    BRA .return

  .zoomIn:
    LDA.W Mode7TransformationZoomLevel : BEQ .return
    DEC : STA.W Mode7TransformationZoomLevel

  .return:
    PLP
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8518: Handle mode 7 transformation matrix and BG1 position - no rotation ;;;
HandleMode7TransformMatrixAndBG1Position_NoRotation:
    PHP
    REP #$30
    LDA.W Mode7TransformationZoomLevel : STA.B DP_Mode7TransMatrixA : STA.B DP_Mode7TransMatrixD
    STZ.B DP_Mode7TransMatrixB : STZ.B DP_Mode7TransMatrixC
    LDA.W CinematicBG1_XPosition : STA.B DP_BG1XScroll
    LDA.W CinematicBG1_YPosition : STA.B DP_BG1YScroll
    PLP
    RTS


;;; $8532: Handle mode 7 transformation matrix and BG1 position ;;;
HandleMode7TransformMatrixAndBG1Position:
    PHP
    REP #$30
    LDA.W Mode7TransformationAngle : CLC : ADC.W #$0040 : AND.W #$00FF : ASL : TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.B DP_Temp26
    LDA.W Mode7TransformationZoomLevel : STA.B DP_Temp28
    JSR Multiplication_16bitSigned_8B858F
    SEP #$20
    LDA.B DP_Temp2A : XBA : LDA.B DP_Temp2D
    REP #$20
    STA.B DP_Mode7TransMatrixA : STA.B DP_Mode7TransMatrixD
    LDA.W Mode7TransformationAngle : AND.W #$00FF : ASL : TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.B DP_Temp26
    LDA.W Mode7TransformationZoomLevel : STA.B DP_Temp28
    JSR Multiplication_16bitSigned_8B858F
    SEP #$20
    LDA.B DP_Temp2A : XBA : LDA.B DP_Temp2D
    REP #$20
    STA.B DP_Mode7TransMatrixB
    EOR.W #$FFFF : INC : STA.B DP_Mode7TransMatrixC
    LDA.W CinematicBG1_XPosition : STA.B DP_BG1XScroll
    LDA.W CinematicBG1_YPosition : STA.B DP_BG1YScroll
    PLP
    RTS


;;; $858F: $2A.$2C = ±[$26] * ±[$28] / 10000h (16-bit signed multiplication) ;;;
Multiplication_16bitSigned_8B858F:
;; Parameters:
;;     $26: Multiplicand
;;     $28: Multiplicand
;; Returns:
;;     $2A.$2C: Product / 10000h
    PHP
    REP #$30
    LDA.B DP_Temp26 : BPL .leftPositive
    EOR.W #$FFFF : INC : STA.B DP_Temp26
    LDA.B DP_Temp28 : BMI +
    JSR Multiplication_16bitUnsigned_8B85EE
    LDA.B DP_Temp2C : EOR.W #$FFFF : CLC : ADC.W #$0001 : STA.B DP_Temp2C
    LDA.B DP_Temp2A : EOR.W #$FFFF : ADC.W #$0000 : STA.B DP_Temp2A
    PLP
    RTS

+   EOR.W #$FFFF : INC : STA.B DP_Temp28
    JSR Multiplication_16bitUnsigned_8B85EE
    PLP
    RTS

  .leftPositiveRightNegative:
    EOR.W #$FFFF : INC : STA.B DP_Temp28
    JSR Multiplication_16bitUnsigned_8B85EE
    LDA.B DP_Temp2C : EOR.W #$FFFF : CLC : ADC.W #$0001 : STA.B DP_Temp2C
    LDA.B DP_Temp2A : EOR.W #$FFFF : ADC.W #$0000 : STA.B DP_Temp2A
    PLP
    RTS

  .leftPositive:
    LDA.B DP_Temp28 : BMI .leftPositiveRightNegative
    JSR Multiplication_16bitUnsigned_8B85EE
    PLP
    RTS


;;; $85EE: $2A.$2C = [$26] * [$28] / 10000h (16-bit unsigned multiplication) ;;;
Multiplication_16bitUnsigned_8B85EE:
;; Parameters:
;;     $26: Multiplicand
;;     $28: Multiplicand
;; Returns:
;;     $2A.$2C: Product / 10000h

; Exactly 1204/1232 master cycles (88%/90% of a scanline).

; Compared to $80:82D6, this routine is a bit slower (144/172 master cycles slower),
; but produces correct results in all cases

; Let:
;     $26 = a + b * 100h
;     $28 = c + d * 100h
    PHP
    SEP #$30
    LDA.B DP_Temp26 : STA.W $4202
    LDA.B DP_Temp28 : STA.W $4203
    NOP #3
    LDA.W $4216 : STA.B DP_Temp2C
    LDA.W $4217 : STA.B DP_Temp2D
    LDA.B DP_Temp27 : STA.W $4202
    LDA.B DP_Temp28 : STA.W $4203
    NOP #3
    LDA.W $4216 : STA.B DP_Temp2E
    LDA.W $4217 : STA.B DP_Temp2F
    LDA.B DP_Temp26 : STA.W $4202
    LDA.B DP_Temp29 : STA.W $4203
    NOP #3
    LDA.W $4216 : STA.B DP_Temp30
    LDA.W $4217 : STA.B DP_Temp31
    LDA.B DP_Temp27 : STA.W $4202
    LDA.B DP_Temp29 : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : STA.B DP_Temp2A
    LDA.B DP_Temp2E : CLC : ADC.B DP_Temp30 : STA.B DP_Temp2E
    SEP #$20
    LDA.B DP_Temp2E : CLC : ADC.B DP_Temp2D : STA.B DP_Temp2D
    LDA.B DP_Temp2F : ADC.B DP_Temp2A : STA.B DP_Temp2A : BCC .return
    INC.B DP_Temp2B

  .return:
    PLP
    RTS


;;; $8666: Handle fading in ;;;
Handle_Fading_In_from_Bank8B:
    JSL HandleFadingIn
    RTS


;;; $866B: Activate title sequence blue light ;;;
Activate_TileSequence_BlueLight:
    PHP
    SEP #$20
    STZ.B DP_ColorMathA
    LDA.B #$81 : STA.B DP_ColorMathB
    LDA.B #$38 : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.B #$58 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor2
    PLP
    RTS


;;; $8682: Deactivate title sequence blue light ;;;
Deactivate_TileSequence_BlueLight:
    PHP
    SEP #$20
    STZ.B DP_ColorMathA : STZ.B DP_ColorMathB
    LDA.B #$20 : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.B #$40 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor2
    PLP
    RTS


;;; $8697: Debug. Display version info ;;;
Debug_DisplayVersionInfo:
; Removing the RTS and the title screen shows:
;     'Ver.02.02.21.30  00' on NTSC
;     'Ver.03.30.10.00  00' on PAL

; Last byte there is the game header version number
; Also displays an 'S' if audio is disabled by $80:8008
    RTS

    PHP
    REP #$30
    LDX.W OAMStack
    LDY.W #$0000

  .loopVersionString:
    LDA.W .versionStringOAMEntryXpos,Y : AND.W #$00FF : STA.W OAMLow,X
    LDA.W #$00CC : STA.W OAMLow+1,X
    PHY
    LDA.W Debug_VersionString,Y : AND.W #$00FF : BEQ .done
    CMP.W #$002E : BEQ .decimalPoint
    SEC : SBC.W #$0030 : ASL : TAY
    LDA.W .versionStringOAMEntryTileNumbersAttributes,Y : STA.W OAMLow+2,X
    BRA .next

  .decimalPoint:
    LDA.W #$39F3 : STA.W OAMLow+2,X

  .next:
    PLY
    TXA : CLC : ADC.W #$0004 : TAX
    INY
    BRA .loopVersionString

  .done:
    PLY
    STX.W OAMStack
    LDA.L DebugConst_DisableAudio : BEQ .versionNumber
    LDA.W #$00B4 : STA.W OAMLow,X
    LDA.W #$00C4 : STA.W OAMLow+1,X
    LDA.W #$39E2 : STA.W OAMLow+2,X
    TXA : CLC : ADC.W #$0004 : TAX

  .versionNumber:
    LDA.L ROM_HEADER_version&$00FFFF : PHA
    AND.W #$000F : ASL : STA.B DP_Temp12
    PLA : AND.W #$00F0 : LSR #3 : TAY
    LDA.W #$00E8 : STA.W OAMLow,X
    LDA.W #$00CC : STA.W OAMLow+1,X
    LDA.W .versionStringOAMEntryTileNumbersAttributes,Y : STA.W OAMLow+2,X
    LDA.W #$00F0 : STA.W OAMLow+4,X
    LDA.W #$00CC : STA.W OAMLow+5,X
    LDY.B DP_Temp12
    LDA.W .versionStringOAMEntryTileNumbersAttributes,Y : STA.W OAMLow+6,X
    TXA : CLC : ADC.W #$0008 : TAX
    LDY.W #$0000

  .loopVer:
    LDA.W .VerOAMEntryXpos,Y : STA.W OAMLow,X
    LDA.W #$00CC : STA.W OAMLow+1,X
    LDA.W .VerOAMEntryTileNumbersAttributes,Y : STA.W OAMLow+2,X
    TXA : CLC : ADC.W #$0004 : TAX
    INY #2 : CPY.W #$0006 : BMI .loopVer
    STX.W OAMStack
    PLP
    RTS

  .versionStringOAMEntryXpos:
; Version string OAM entry X positions
    db $80,$88,$90,$98,$A0,$A8,$B0,$B8,$C0,$C8,$D0,$D8,$E0,$E8,$F0,$F8

  .VerOAMEntryXpos:
; 'Ver.' OAM entry X positions
    dw $0074,$006C,$0064

  .VerOAMEntryTileNumbersAttributes:
; 'Ver.' OAM entry tile numbers and attributes
    dw $31F2,$31F1,$31F0

  .versionStringOAMEntryTileNumbersAttributes:
; Version string ('0123456789ABCDEF') OAM entry tile numbers and attributes
    dw $39F4,$39F5,$39F6,$39F7,$39F8,$39F9,$39FA,$39FB
    dw $39FC,$39FD,$39D0,$39D1,$39D2,$39D3,$39D4,$39D5


;;; $87A0: Update 32x30 cinematic BG tilemap ;;;
CinematicBGObjects_Update32x30CinematicBGTilemap:
; If not mode 7:
;     Queue transfer of 780h bytes from $7E:3000 to VRAM CinematicBGObject_VRAMAddr
    PHP
    REP #$30
    LDA.B DP_BGModeSize : AND.W #$00FF : CMP.W #$0007 : BEQ .return
    LDX.W VRAMWriteStack
    LDA.W #$0780 : STA.B VRAMWrite.size,X
    INX #2
    LDA.W #$3000 : STA.B VRAMWrite.size,X
    INX #2
    SEP #$20
    LDA.B #$7E : STA.B VRAMWrite.size,X
    REP #$20
    INX
    LDA.W CinematicBGObject_VRAMAddr : STA.B VRAMWrite.size,X
    INX #2 : STX.W VRAMWriteStack

  .return:
    PLP
    RTS


;;; $87D3: Update Samus eyes tilemap ;;;
CinematicBGObjects_UpdateSamusEyesTilemap:
; If not mode 7:
;     Queue transfer of $7E:3B40..BF to VRAM $49A0..DF (BG2 tilemap rows Dh/Eh)
    PHP
    REP #$30
    LDA.B DP_BGModeSize : AND.W #$00FF : CMP.W #$0007 : BEQ .return
    LDX.W VRAMWriteStack
    LDA.W #$0080 : STA.B VRAMWrite.size,X
    INX #2
    LDA.W #$3B40 : STA.B VRAMWrite.size,X
    INX #2
    SEP #$20
    LDA.B #$7E : STA.B VRAMWrite.size,X
    REP #$20
    INX
    LDA.W #$49A0 : STA.B VRAMWrite.size,X
    INX #2 : STX.W VRAMWriteStack

  .return:
    PLP
    RTS


;;; $8806: Update 32x32 cinematic BG tilemap ;;;
CinematicBGObjects_Update32x32CinematicBGTilemap:
; If not mode 7:
;     Queue transfer of 800h bytes from $7E:3000 to VRAM CinematicBGObject_VRAMAddr
    PHP
    REP #$30
    LDA.B DP_BGModeSize : AND.W #$00FF : CMP.W #$0007 : BEQ .return
    LDX.W VRAMWriteStack
    LDA.W #$0800 : STA.B VRAMWrite.size,X
    INX #2
    LDA.W #$3000 : STA.B VRAMWrite.size,X
    INX #2
    SEP #$20
    LDA.B #$7E : STA.B VRAMWrite.size,X
    REP #$20
    INX
    LDA.W CinematicBGObject_VRAMAddr : STA.B VRAMWrite.size,X
    INX #2 : STX.W VRAMWriteStack

  .return:
    PLP
    RTS


;;; $8839: Process cinematic BG object indirect instruction ;;;
CinematicBGObjects_ProcessIndirectInstruction:
;; Parameters:
;;     X: Cinematic BG object index
    PHP
    REP #$30
    PHX : PHY
    LDY.W CinematicBGObject_IndirectInstructionPointers,X
    LDA.W $0000,Y : STA.B DP_Temp1C
    JMP.W (DP_Temp1C)


;;; $8849: Indirect instruction function - nothing ;;;
IndirectInstructionFunction_Nothing:
; Expects pushed Y, X and PSR
; Used by dummy instruction used for delay
    PLY : PLX : PLP
    RTS


;;; $884D: Indirect instruction function - draw text character [[Y] + 4] ;;;
IndirectInstructionFunction_DrawTextCharacter:
;; Parameters:
;;     X: Cinematic BG object index
;;     Y: Pointer to instruction

; Expects pushed Y, X and PSR
; Only one tile can be specified
; Draws character, updates caret position (based on next instruction) and plays intro text click
; Cinematic sprite object Fh is the intro text caret here
    LDA.W CinematicSpriteObject_IntroTextClickFlag : BNE .toggleFlag
    LDA.W #$0001 : STA.W CinematicSpriteObject_IntroTextClickFlag
    BRA .drawText

  .toggleFlag:
    STZ.W CinematicSpriteObject_IntroTextClickFlag

  .drawText:
    JSR Spawn_TextGlowObject
    PHY
    LDY.W CinematicBGObject_InstListPointers,X
    LDX.W #$001E
    LDA.W $0006,Y : BMI .pointer
    LDA.W $0008,Y : AND.W #$00FF : ASL #3 : STA.W CinematicSpriteObject_XPositions,X
    LDA.W $0009,Y : AND.W #$00FF : ASL #3 : SEC : SBC.W #$0008 : STA.W CinematicSpriteObject_YPositions,X
    BRA .merge

  .pointer:
    LDA.W #$0008 : STA.W CinematicSpriteObject_XPositions,X
    LDA.W $0003,Y : AND.W #$00FF : INC #2 : ASL #3 : SEC : SBC.W #$0008 : STA.W CinematicSpriteObject_YPositions,X

  .merge:
    LDA.W $0004,Y : CMP.W #IndirectInstructions_IntroText_Space : BEQ .fallthrough
    LDA.W CinematicSpriteObject_IntroTextClickFlag : BEQ .fallthrough
    LDA.W #$000D
    JSL QueueSound_Lib3_Max6

  .fallthrough:
    PLY
; fallthrough to IndirectInstructionFunction_DrawTextToTilemap


;;; $88B7: Indirect instruction function - draw the [[Y] + 3] x [[Y] + 2] region with tilemap values at [Y] + 4 to text tilemap ;;;
IndirectInstructionFunction_DrawTextToTilemap:
;; Parameters:
;;     X: Cinematic BG object index
;;     Y: Pointer to instruction

; Expects pushed Y, X and PSR
; Used for space colony label in intro and in the ending sequence
    JSR CinematicBGObjects_X_16_TilemapOffsetForTile_12_13
    LDA.W $0002,Y : AND.W #$00FF : STA.W DP_Temp12 : STA.W DP_Temp18
    LDA.W $0003,Y : AND.W #$00FF : STA.W DP_Temp14

  .loop:
    LDA.W $0004,Y : STA.L CinematicBGTilemap_TopMarginInitialJapanText,X
    INY #2
    INX #2
    DEC.W DP_Temp12 : BEQ +
    BRA .loop

+   LDA.W DP_Temp18 : STA.W DP_Temp12
    DEC.W DP_Temp14 : BEQ .return
    LDA.W DP_Temp16 : CLC : ADC.W #$0040 : STA.W DP_Temp16
    TAX
    BRA .loop

  .return:
    PLY : PLX : PLP
    RTS


;;; $88FD: Indirect instruction function - draw the [[Y] + 3] x [[Y] + 2] region with tilemap values at [Y] + 4 to BG2 ;;;
IndirectInstructionFunction_DrawSamusEyesToTilemap:
;; Parameters:
;;     X: Cinematic BG object index
;;     Y: Pointer to instruction

; Expects pushed Y, X and PSR
; Used for Samus eyes during the intro
    JSR CinematicBGObjects_X_16_TilemapOffsetForTile_12_13
    LDA.W $0002,Y : AND.W #$00FF : STA.W DP_Temp12 : STA.W DP_Temp18
    LDA.W $0003,Y : AND.W #$00FF : STA.W DP_Temp14

  .loops:
    LDA.W $0004,Y : STA.L CinematicBGTilemap,X
    INY #2
    INX #2
    DEC.W DP_Temp12 : BEQ +
    BRA .loops

+   LDA.W DP_Temp18 : STA.W DP_Temp12
    DEC.W DP_Temp14 : BEQ .return
    LDA.W DP_Temp16 : CLC : ADC.W #$0040 : STA.W DP_Temp16
    TAX
    BRA .loops

  .return:
    PLY : PLX : PLP
    RTS


;;; $8943: X = $16 = tilemap offset for tile ([$12], [$13]) ;;;
CinematicBGObjects_X_16_TilemapOffsetForTile_12_13:
;; Parameters:
;;     $12: Tile X
;;     $13: Tile Y
;; Returns:
;;     X/$16: Tilemap offset (in octets). ([$13] * 20h + [$12]) * 2
    LDA.W DP_Temp12 : AND.W #$00FF : ASL : STA.W DP_Temp14
    SEP #$20
    LDA.B #$40 : STA.W $4202
    LDA.W DP_Temp13 : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : CLC : ADC.W DP_Temp14 : STA.W DP_Temp16
    TAX
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $896B: Unused. Indirect instruction function - draw the [[Y] + 3] x [[Y] + 2] region with tilemap values at [Y] + 4 to mode 7 tilemap ;;;
UNUSED_CinematicBGObjects_IndirectInstructionFunction_8B896B:
;; Parameters:
;;     X: Cinematic BG object index
;;     Y: Pointer to instruction

; Expects pushed Y, X and PSR
    JSR UNUSED_CinematicBGObjects_Mode7TilemapOffsetForTile_8B8A2C
    LDA.W $0002,Y : AND.W #$00FF : STA.W DP_Temp12
    LDA.W $0003,Y : AND.W #$00FF : STA.W DP_Temp14
    TYA : CLC : ADC.W #$0004 : TAY
    LDX.W Mode7Stack

  .loop:
    LDA.W #$0080 : STA.W Mode7Transfer.control,X
    TYA : STA.W Mode7Transfer.src,X
    LDA.W #$008B : STA.W Mode7Transfer.src+2,X
    LDA.W DP_Temp12 : STA.W Mode7Transfer.size,X
    LDA.W DP_Temp16 : STA.W Mode7Transfer.dest,X
    LDA.W #$0000 : STA.W Mode7Transfer.inc,X
    TXA : CLC : ADC.W #$0009 : TAX
    TYA : CLC : ADC.W DP_Temp12 : TAY
    LDA.W DP_Temp16 : CLC : ADC.W #$0080 : STA.W DP_Temp16
    DEC.W DP_Temp14 : BEQ .return
    BRA .loop

  .return:
    STX.W Mode7Stack
    PLY : PLX : PLP
    RTS


;;; $89CF: Unused. Indirect instruction function - draw the [[Y] + 3] x [[Y] + 2] region with column-major tilemap values at [Y] + 4 to mode 7 tilemap ;;;
UNUSED_CinematicBGObjects_IndirectInstructionFunction_8B89CF:
;; Parameters:
;;     X: Cinematic BG object index
;;     Y: Pointer to instruction

; Expects pushed Y, X and PSR
    JSR UNUSED_CinematicBGObjects_Mode7TilemapOffsetForTile_8B8A2C
    LDA.W $0002,Y : AND.W #$00FF : STA.W DP_Temp12
    LDA.W $0003,Y : AND.W #$00FF : STA.W DP_Temp14
    TYA : CLC : ADC.W #$0004 : TAY
    LDX.W Mode7Stack

  .loop:
    LDA.W #$0080 : STA.W Mode7Transfer.control,X
    TYA : STA.W Mode7Transfer.src,X
    LDA.W #$008B : STA.W Mode7Transfer.src+2,X
    LDA.W DP_Temp14 : STA.W Mode7Transfer.size,X
    LDA.W DP_Temp16 : STA.W Mode7Transfer.dest,X
    LDA.W #$0002 : STA.W Mode7Transfer.inc,X
    TXA : CLC : ADC.W #$0009 : TAX
    TYA : CLC : ADC.W DP_Temp14 : TAY
    INC.W DP_Temp16
    DEC.W DP_Temp12 : BEQ .return
    BRA .loop

  .return:
    STX.W Mode7Stack
    PLY : PLX : PLP
    RTS


;;; $8A2C: Unused. $16 = mode 7 tilemap offset for tile ([$12], [$13]) ;;;
UNUSED_CinematicBGObjects_Mode7TilemapOffsetForTile_8B8A2C:
;; Parameters:
;;     $12: Tile X
;;     $13: Tile Y
;; Returns:
;;     $16: Tilemap offset (in octets). [$13] * 80h + [$12]

; Uses the multiplication registers for some reason
; Only called by unused routines
    LDA.W DP_Temp12 : AND.W #$00FF : STA.W DP_Temp14
    SEP #$20
    LDA.B #$80 : STA.W $4202
    LDA.W DP_Temp13 : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : CLC : ADC.W DP_Temp14 : STA.W DP_Temp16
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8A52: Calculate position of Samus in rotating elevator room ;;;
Calculate_SamusPosition_InRotatingElevatorRoom:
; Calculates
;     p = p_0 + M⁻¹ (p - p_0)
; where
;     p: Samus position (as a column vector)
;     p_0: Mode 7 transformation origin (as a column vector)
;     M⁻¹: Inverse of the mode 7 transformation matrix

; Given that M is the clockwise rotation matrix of some angle t (see $89:ACC3):
;     M = ( cos(t), sin(t))
;         (-sin(t), cos(t))
; this expands to:
;     x = x_0 + (x - x_0) * cos(t) - (y - y_0) * sin(t)
;     y = y_0 + (x - x_0) * sin(t) + (y - y_0) * cos(t)
; where
;     x,y: Samus position
;     x_0,y_0: Mode 7 transformation origin
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W SamusXPosition : SEC : SBC.B DP_Mode7TransOriginX : STA.B DP_Temp22
    LDA.B DP_Mode7TransOriginY : SEC : SBC.W SamusYPosition : STA.B DP_Temp24
    LDA.B DP_Temp22 : STA.B DP_Temp26
    LDA.B DP_Mode7TransMatrixA : STA.B DP_Temp28
    JSR Multiplication_16bitSigned_8B858F
    SEP #$20
    LDA.B DP_Temp2A : XBA : LDA.B DP_Temp2D
    REP #$20
    STA.B DP_Temp1A
    LDA.B DP_Mode7TransMatrixB : STA.B DP_Temp26
    LDA.B DP_Temp24 : STA.B DP_Temp28
    JSR Multiplication_16bitSigned_8B858F
    SEP #$20
    LDA.B DP_Temp2A : XBA : LDA.B DP_Temp2D
    REP #$20
    CLC : ADC.B DP_Temp1A : STA.B DP_Temp1A
    LDA.B DP_Mode7TransOriginX : CLC
    ADC.B DP_Temp1A : STA.W SamusXPosition
    LDA.B DP_Mode7TransMatrixC : STA.B DP_Temp26
    LDA.B DP_Temp22 : STA.B DP_Temp28
    JSR Multiplication_16bitSigned_8B858F
    SEP #$20
    LDA.B DP_Temp2A : XBA : LDA.B DP_Temp2D
    REP #$20
    STA.B DP_Temp1A
    LDA.B DP_Mode7TransMatrixA : STA.B DP_Temp26
    LDA.B DP_Temp24 : STA.B DP_Temp28
    JSR Multiplication_16bitSigned_8B858F
    SEP #$20
    LDA.B DP_Temp2A : XBA : LDA.B DP_Temp2D
    REP #$20
    CLC : ADC.B DP_Temp1A : STA.B DP_Temp1A
    LDA.B DP_Mode7TransOriginY : SEC : SBC.B DP_Temp1A : STA.W SamusYPosition
    PLB : PLP
    RTL


;;; $8AD9: Calculate position of projectile in rotating elevator room ;;;
Calculate_ProjectilePosition_InRotatingElevatorRoom:
;; Parameters:
;;     X: Projectile index
;; Returns:
;      $12: Y position on screen
;      $14: X position on screen
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W SamusProjectile_XPositions,X : SEC : SBC.B DP_Mode7TransOriginX : STA.B DP_Temp22
    LDA.B DP_Mode7TransOriginY : SEC : SBC.W SamusProjectile_YPositions,X : STA.B DP_Temp24
    LDA.B DP_Temp22 : STA.B DP_Temp26
    LDA.B DP_Mode7TransMatrixA : STA.B DP_Temp28
    JSR Multiplication_16bitSigned_8B858F
    SEP #$20
    LDA.B DP_Temp2A : XBA : LDA.B DP_Temp2D
    REP #$20
    STA.B DP_Temp1A
    LDA.B DP_Mode7TransMatrixB : STA.B DP_Temp26
    LDA.B DP_Temp24 : STA.B DP_Temp28
    JSR Multiplication_16bitSigned_8B858F
    SEP #$20
    LDA.B DP_Temp2A : XBA : LDA.B DP_Temp2D
    REP #$20
    CLC : ADC.B DP_Temp1A : STA.B DP_Temp1A
    LDA.B DP_Mode7TransOriginX : CLC : ADC.B DP_Temp1A
    SEC : SBC.W Layer1XPosition : STA.B DP_Temp14
    LDA.B DP_Mode7TransMatrixC : STA.B DP_Temp26
    LDA.B DP_Temp22 : STA.B DP_Temp28
    JSR Multiplication_16bitSigned_8B858F
    SEP #$20
    LDA.B DP_Temp2A : XBA : LDA.B DP_Temp2D
    REP #$20
    STA.B DP_Temp1A
    LDA.B DP_Mode7TransMatrixA : STA.B DP_Temp26
    LDA.B DP_Temp24 : STA.B DP_Temp28
    JSR Multiplication_16bitSigned_8B858F
    SEP #$20
    LDA.B DP_Temp2A : XBA : LDA.B DP_Temp2D
    REP #$20
    CLC : ADC.B DP_Temp1A : STA.B DP_Temp1A
    LDA.B DP_Mode7TransOriginY : SEC : SBC.B DP_Temp1A
    SEC : SBC.W Layer1YPosition : STA.B DP_Temp12
    PLB : PLP
    RTL


;;; $8B66: Calculate position of Ceres steam in rotating elevator room ;;;
Calculate_CeresSteamPosition_InRotatingElevatorRoom:
;; Parameters:
;      $12: X position
;      $14: Y position
;; Returns:
;      $12: X position
;      $14: Y position

; This should be the only one of these functions, the others could just call this one >_<;
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.B DP_Temp12 : SEC : SBC.B DP_Mode7TransOriginX : STA.B DP_Temp22
    LDA.B DP_Mode7TransOriginY : SEC : SBC.B DP_Temp14 : STA.B DP_Temp24
    LDA.B DP_Temp22 : STA.B DP_Temp26
    LDA.B DP_Mode7TransMatrixA : STA.B DP_Temp28
    JSR Multiplication_16bitSigned_8B858F
    SEP #$20
    LDA.B DP_Temp2A : XBA : LDA.B DP_Temp2D
    REP #$20
    STA.B DP_Temp1A
    LDA.B DP_Mode7TransMatrixB : STA.B DP_Temp26
    LDA.B DP_Temp24 : STA.B DP_Temp28
    JSR Multiplication_16bitSigned_8B858F
    SEP #$20
    LDA.B DP_Temp2A : XBA : LDA.B DP_Temp2D
    REP #$20
    CLC : ADC.B DP_Temp1A : STA.B DP_Temp1A
    LDA.B DP_Mode7TransOriginX : CLC : ADC.B DP_Temp1A : STA.B DP_Temp12
    LDA.B DP_Mode7TransMatrixC : STA.B DP_Temp26
    LDA.B DP_Temp22 : STA.B DP_Temp28
    JSR Multiplication_16bitSigned_8B858F
    SEP #$20
    LDA.B DP_Temp2A : XBA : LDA.B DP_Temp2D
    REP #$20
    STA.B DP_Temp1A
    LDA.B DP_Mode7TransMatrixA : STA.B DP_Temp26
    LDA.B DP_Temp24 : STA.B DP_Temp28
    JSR Multiplication_16bitSigned_8B858F
    SEP #$20
    LDA.B DP_Temp2A : XBA : LDA.B DP_Temp2D
    REP #$20
    CLC : ADC.B DP_Temp1A : STA.B DP_Temp1A
    LDA.B DP_Mode7TransOriginY : SEC : SBC.B DP_Temp1A : STA.B DP_Temp14
    PLB : PLP
    RTL


;;; $8BE9: Copy current palettes to fading palettes ;;;
PaletteCrossFading_CopyCurrentPalettesToFadingPalettes:
; Temporarily changes DB to $7F for absolutely no reason!
    PHP : PHB
    SEP #$30
    LDA.B #$7F : PHA : PLB
    REP #$30
    LDY.W #$0100
    LDX.W #$0000

  .loop:
    LDA.L Palettes,X : STA.L FadingPalettes_Initial,X
    INX #2
    DEY : BNE .loop
    PLB : PLP
    RTS


;;; $8C09: Decompose palette data for fading ;;;
PaletteCrossFading_DecomposePaletteDataForFading:
    PHP : PHB
    SEP #$30
    LDA.B #$7F : PHA : PLB
    REP #$30
    LDX.W #$0000
    LDY.W #$0100

  .loop:
    LDA.L FadingPalettes_Initial,X : STA.B DP_Temp12
    AND.W #$001F : XBA : STA.L FadingPalettes_Red,X
    XBA : ASL #3 : STA.L FadingPalettes_DeltaRed,X
    LDA.B DP_Temp12 : AND.W #$03E0 : ASL #3 : STA.L FadingPalettes_Green,X
    XBA : ASL #3 : STA.L FadingPalettes_DeltaGreen,X
    LDA.B DP_Temp12 : AND.W #$7C00 : LSR #2 : STA.L FadingPalettes_Blue,X
    XBA : ASL #3 : STA.L FadingPalettes_DeltaBlue,X
    INX #2
    DEY : BNE .loop
    PLB : PLP
    RTS


;;; $8C5E: Clear [Y] colours starting from colour index [X] ;;;
PaletteCrossFading_ClearYColorsStartingFromColorIndexX:
;; Parameters:
;;     X: Colour index
;;     Y: Number of colours
    PHP : PHB
    SEP #$20
    LDA.B #$7F : PHA : PLB
    REP #$30

  .loop:
    LDA.W #$0000 : STA.L FadingPalettes_Initial,X
    STA.L FadingPalettes_Red,X : STA.L FadingPalettes_Green,X : STA.L FadingPalettes_Blue,X
    INX #2
    DEY : BNE .loop
    PLB : PLP
    RTS


;;; $8C83: Fade out [Y] colours starting from colour index [X] ;;;
PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX:
;; Parameters:
;;     X: Colour index
;;     Y: Number of colours
    PHP

  .loop:
    LDA.L FadingPalettes_Red,X : SEC : SBC.L FadingPalettes_DeltaRed,X : STA.L FadingPalettes_Red,X
    LDA.L FadingPalettes_Green,X : SEC : SBC.L FadingPalettes_DeltaGreen,X : STA.L FadingPalettes_Green,X
    LDA.L FadingPalettes_Blue,X : SEC : SBC.L FadingPalettes_DeltaBlue,X : STA.L FadingPalettes_Blue,X
    INX #2
    DEY : BNE .loop
    PLP
    RTS


;;; $8CB2: Fade in [Y] colours starting from colour index [X] ;;;
PaletteCrossFading_FadeInYColorsStartingFromColorIndexX:
;; Parameters:
;;     X: Colour index
;;     Y: Number of colours
    PHP

  .loop:
    LDA.L FadingPalettes_Red,X : CLC : ADC.L FadingPalettes_DeltaRed,X : AND.W #$1FFF : STA.L FadingPalettes_Red,X
    LDA.L FadingPalettes_Green,X : CLC : ADC.L FadingPalettes_DeltaGreen,X : AND.W #$1FFF : STA.L FadingPalettes_Green,X
    LDA.L FadingPalettes_Blue,X : CLC : ADC.L FadingPalettes_DeltaBlue,X : AND.W #$1FFF : STA.L FadingPalettes_Blue,X
    INX #2
    DEY : BNE .loop
    PLP
    RTS


;;; $8CEA: Compose fading palettes ;;;
PaletteCrossFading_ComposeFadingPalettes:
    PHP
    LDX.W #$0000
    LDY.W #$0100

  .loop:
    LDA.L FadingPalettes_Red,X : XBA : AND.W #$001F : STA.B DP_Temp12
    LDA.L FadingPalettes_Green,X : LSR #3 : AND.W #$03E0 : ORA.B DP_Temp12 : STA.B DP_Temp12
    LDA.L FadingPalettes_Blue,X : ASL #2 : AND.W #$7C00 : ORA.B DP_Temp12 : STA.L FadingPalettes,X : STA.L Palettes,X
    INX #2
    DEY : BNE .loop
    PLP
    RTS


;;; $8D23: Load Japanese intro text tiles ;;;
LoadJapanTextIntroTiles:
;; Parameters:
;;     Y: Pointer to Japanese intro text data

; Format:
;     dddd,nnnn
;     tttt,bbbb
;     tttt,bbbb
;     ...
; where
;     d: Japanese text tiles destination offset ($7E:4000/4300 + d)
;     n: Number of characters
;     t: Top Japanese text tiles source offset ($7F:A000 + t)
;     b: Bottom Japanese text tiles source offset ($7F:A000 + b)
    PHP
    REP #$30
    PHX
    LDA.W $0000,Y : TAX
    LDA.W $0002,Y : STA.B DP_Temp12

  .loop:
    LDA.W $0004,Y : STA.B DP_Temp16
    PHY
    LDA.W #IntroFont2Tiles : CLC : ADC.B DP_Temp16 : TAY
    PHB
    PEA.W IntroFont2Tiles>>8&$FF00 : PLB : PLB
    LDA.W $0000,Y : STA.L IntroBG3JapanTextTiles,X
    LDA.W $0002,Y : STA.L IntroBG3JapanTextTiles+2,X
    LDA.W $0004,Y : STA.L IntroBG3JapanTextTiles+4,X
    LDA.W $0006,Y : STA.L IntroBG3JapanTextTiles+6,X
    LDA.W $0008,Y : STA.L IntroBG3JapanTextTiles+8,X
    LDA.W $000A,Y : STA.L IntroBG3JapanTextTiles+$A,X
    LDA.W $000C,Y : STA.L IntroBG3JapanTextTiles+$C,X
    LDA.W $000E,Y : STA.L IntroBG3JapanTextTiles+$E,X
    PLB : PLY
    LDA.W $0006,Y : STA.B DP_Temp16
    TXA : CLC : ADC.W #$0300 : TAX
    PHY
    LDA.W #IntroFont2Tiles : CLC : ADC.B DP_Temp16 : TAY
    PHB
    PEA.W IntroFont2Tiles>>8&$FF00 : PLB : PLB
    LDA.W $0000,Y : STA.L IntroBG3JapanTextTiles,X
    LDA.W $0002,Y : STA.L IntroBG3JapanTextTiles+2,X
    LDA.W $0004,Y : STA.L IntroBG3JapanTextTiles+4,X
    LDA.W $0006,Y : STA.L IntroBG3JapanTextTiles+6,X
    LDA.W $0008,Y : STA.L IntroBG3JapanTextTiles+8,X
    LDA.W $000A,Y : STA.L IntroBG3JapanTextTiles+$A,X
    LDA.W $000C,Y : STA.L IntroBG3JapanTextTiles+$C,X
    LDA.W $000E,Y : STA.L IntroBG3JapanTextTiles+$E,X
    PLB : PLY
    TXA : SEC : SBC.W #$02F0 : TAX
    TYA : CLC : ADC.W #$0004 : TAY
    DEC.B DP_Temp12 : BEQ .return
    JMP .loop

  .return:
    PLX : PLP
    RTS


;;; $8DE6: Transfer Japanese text tiles to VRAM ;;;
TransferJapanTextTilesToVRAM:
; Queue transfer of $7E:4000..45FF to VRAM $4180..447F
    PHX
    LDX.W VRAMWriteStack
    LDA.W #$0600 : STA.B VRAMWrite.size,X
    INX #2
    LDA.W #IntroBG3JapanTextTiles : STA.B VRAMWrite.size,X
    INX #2
    SEP #$20
    LDA.B #IntroBG3JapanTextTiles>>16 : STA.B VRAMWrite.size,X
    REP #$20
    INX
    LDA.W #$4180 : STA.B VRAMWrite.size,X
    INX #2 : STX.W VRAMWriteStack
    PLX
    RTS


;;; $8E0D: Handle Samus during intro ;;;
HandleSamusDuringIntro:
    LDA.W IntroSamusDisplayFlag : BEQ .return
    JSL SamusCurrentStateHandler
    JSL SamusNewStateHandler
    LDA.W SamusInvincibilityTimer : BEQ .handleKnockback
    DEC : STA.W SamusInvincibilityTimer

  .handleKnockback:
    LDA.W SamusKnockbackTimer : BEQ .return
    DEC : STA.W SamusKnockbackTimer

  .return:
    RTS


;;; $8E2D: Draw intro sprites ;;;
DrawIntroSprites:
    LDA.W IntroSamusDisplayFlag : BEQ .noSamus
    BMI .samusPriority
    JSR Draw_CinematicSpriteObjects_IntroTitleSequence
    JSL DrawSamusAndProjectiles
    JSL DrawProjectiles
    BRA .return

  .samusPriority:
    JSL DrawSamusAndProjectiles
    JSL DrawProjectiles
    JSR Draw_CinematicSpriteObjects_IntroTitleSequence
    BRA .return

  .noSamus:
    JSR Draw_CinematicSpriteObjects_IntroTitleSequence

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8E52: Unused. Calculate X/Y components of radius [A] angle [Y] ;;;
UNUSED_CalculateXYComponentsOfRadiusAAngleY_8B8E52:
;; Parameters:
;;     A: Radius
;;     Y: Angle * 2. Origin = up, positive direction = clockwise
;; Returns:
;;     $14: X component of radius
;;     $16: Y component of radius

; Clone of $86:9BA2
    PHP
    REP #$30
    PHX
    STA.B DP_Temp18
    TYA : STA.B DP_Temp1A
    CMP.W #$0080 : BPL +
    ASL : TAX
    JSR UNUSED_Math_8B8EA3
    BRA .storeXComponent

+   SEC : SBC.W #$0080 : AND.W #$00FF : ASL : TAX
    JSR UNUSED_Math_8B8EA3
    EOR.W #$FFFF : INC

  .storeXComponent:
    STA.B DP_Temp14
    LDA.B DP_Temp1A : SEC : SBC.W #$0040 : AND.W #$00FF : CMP.W #$0080 : BPL +
    ASL : TAX
    JSR UNUSED_Math_8B8EA3
    BRA .storeYComponent

+   SEC : SBC.W #$0080 : AND.W #$00FF : ASL : TAX
    JSR UNUSED_Math_8B8EA3
    EOR.W #$FFFF : INC

  .storeYComponent:
    STA.B DP_Temp16
    PLX : PLP
    RTS


;;; $8EA3: A = [$18] * sin([X] / 2 * pi / 80h) ;;;
UNUSED_Math_8B8EA3:
;; Parameters:
;;     X: Angle * 2
;;     $18: Radius
;; Returns:
;;     A: Sine component

; Clone of $86:9BF3
; Only called by above unused routine
    SEP #$20
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.W $4202
    LDA.B DP_Temp18 : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : XBA : AND.W #$00FF : STA.B DP_Temp12
    SEP #$20
    LDA.L SineCosineTables_8bitSine_SignExtended+1,X : STA.W $4202
    LDA.B DP_Temp18 : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : CLC : ADC.B DP_Temp12
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8ED9: Move unused sprites off-screen ;;;
MoveUnusedSpritesOffScreen:
; Move unused sprites to X = 180h
; Uses one hell of an unrolled loop
; TODO: this might be buggy for [OAM stack pointer] = 1FCh
    PHP
    REP #$30
    LDA.W OAMStack : CMP.W #$0200 : BPL .return
    LSR #2 : PHA
    AND.W #$0007 : ASL : TAY
    PLA : LSR #2 : TAX
    LDA.W OAMHigh,X : ORA.W .Xpos,Y : STA.W OAMHigh,X
    CPX.W #$001E : BPL .setXpos
    INX #2

  .loop:
    LDA.W #$5555 : STA.W OAMHigh,X
    INX #2 : CPX.W #$0020 : BMI .loop

  .setXpos:
    LDA.W OAMStack : LSR : STA.B DP_Temp12
    LSR : ADC.B DP_Temp12 : CLC : ADC.W #.moveAllSprites : STA.B DP_Temp12
    LDA.W #$0080
    SEP #$30
    JMP.W (DP_Temp12)

  .return:
    PLP
    RTS

  .Xpos:
    dw $5555 ; Sprites 0..7 high X position bits
    dw $5554 ; Sprites 1..7 high X position bits
    dw $5550 ; Sprites 2..7 high X position bits
    dw $5540 ; Sprites 3..7 high X position bits
    dw $5500 ; Sprites 4..7 high X position bits
    dw $5400 ; Sprites 5..7 high X position bits
    dw $5000 ; Sprites 6..7 high X position bits
    dw $4000 ; Sprites 7 high X position bit

  .moveAllSprites:
    STA.W OAMLow : STA.W OAMLow+4 : STA.W OAMLow+8 : STA.W OAMLow+$C
    STA.W OAMLow+$10 : STA.W OAMLow+$14 : STA.W OAMLow+$18 : STA.W OAMLow+$1C
    STA.W OAMLow+$20 : STA.W OAMLow+$24 : STA.W OAMLow+$28 : STA.W OAMLow+$2C
    STA.W OAMLow+$30 : STA.W OAMLow+$34 : STA.W OAMLow+$38 : STA.W OAMLow+$3C
    STA.W OAMLow+$40 : STA.W OAMLow+$44 : STA.W OAMLow+$48 : STA.W OAMLow+$4C
    STA.W OAMLow+$50 : STA.W OAMLow+$54 : STA.W OAMLow+$58 : STA.W OAMLow+$5C
    STA.W OAMLow+$60 : STA.W OAMLow+$64 : STA.W OAMLow+$68 : STA.W OAMLow+$6C
    STA.W OAMLow+$70 : STA.W OAMLow+$74 : STA.W OAMLow+$78 : STA.W OAMLow+$7C
    STA.W OAMLow+$80 : STA.W OAMLow+$84 : STA.W OAMLow+$88 : STA.W OAMLow+$8C
    STA.W OAMLow+$90 : STA.W OAMLow+$94 : STA.W OAMLow+$98 : STA.W OAMLow+$9C
    STA.W OAMLow+$A0 : STA.W OAMLow+$A4 : STA.W OAMLow+$A8 : STA.W OAMLow+$AC
    STA.W OAMLow+$B0 : STA.W OAMLow+$B4 : STA.W OAMLow+$B8 : STA.W OAMLow+$BC
    STA.W OAMLow+$C0 : STA.W OAMLow+$C4 : STA.W OAMLow+$C8 : STA.W OAMLow+$CC
    STA.W OAMLow+$D0 : STA.W OAMLow+$D4 : STA.W OAMLow+$D8 : STA.W OAMLow+$DC
    STA.W OAMLow+$E0 : STA.W OAMLow+$E4 : STA.W OAMLow+$E8 : STA.W OAMLow+$EC
    STA.W OAMLow+$F0 : STA.W OAMLow+$F4 : STA.W OAMLow+$F8 : STA.W OAMLow+$FC
    STA.W OAMLow+$100 : STA.W OAMLow+$104 : STA.W OAMLow+$108 : STA.W OAMLow+$10C
    STA.W OAMLow+$110 : STA.W OAMLow+$114 : STA.W OAMLow+$118 : STA.W OAMLow+$11C
    STA.W OAMLow+$120 : STA.W OAMLow+$124 : STA.W OAMLow+$128 : STA.W OAMLow+$12C
    STA.W OAMLow+$130 : STA.W OAMLow+$134 : STA.W OAMLow+$138 : STA.W OAMLow+$13C
    STA.W OAMLow+$140 : STA.W OAMLow+$144 : STA.W OAMLow+$148 : STA.W OAMLow+$14C
    STA.W OAMLow+$150 : STA.W OAMLow+$154 : STA.W OAMLow+$158 : STA.W OAMLow+$15C
    STA.W OAMLow+$160 : STA.W OAMLow+$164 : STA.W OAMLow+$168 : STA.W OAMLow+$16C
    STA.W OAMLow+$170 : STA.W OAMLow+$174 : STA.W OAMLow+$178 : STA.W OAMLow+$17C
    STA.W OAMLow+$180 : STA.W OAMLow+$184 : STA.W OAMLow+$188 : STA.W OAMLow+$18C
    STA.W OAMLow+$190 : STA.W OAMLow+$194 : STA.W OAMLow+$198 : STA.W OAMLow+$19C
    STA.W OAMLow+$1A0 : STA.W OAMLow+$1A4 : STA.W OAMLow+$1A8 : STA.W OAMLow+$1AC
    STA.W OAMLow+$1B0 : STA.W OAMLow+$1B4 : STA.W OAMLow+$1B8 : STA.W OAMLow+$1BC
    STA.W OAMLow+$1C0 : STA.W OAMLow+$1C4 : STA.W OAMLow+$1C8 : STA.W OAMLow+$1CC
    STA.W OAMLow+$1D0 : STA.W OAMLow+$1D4 : STA.W OAMLow+$1D8 : STA.W OAMLow+$1DC
    STA.W OAMLow+$1E0 : STA.W OAMLow+$1E4 : STA.W OAMLow+$1E8 : STA.W OAMLow+$1EC
    STA.W OAMLow+$1F0 : STA.W OAMLow+$1F4 : STA.W OAMLow+$1F8 : STA.W OAMLow+$1FC
    PLP
    RTS


;;; $90B8: Advance fast screen fade out ;;;
AdvanceFastScreenFadeOut:
;; Returns:
;;     Carry: Set if reached zero brightness, otherwise clear

; Screen darkens at rate [screen fade counter] / Fh per frame
    PHP
    SEP #$30
    LDA.B DP_Brightness : AND.B #$0F : BEQ .return
    SEC : SBC.W ScreenFadeCounter : BEQ .forcedBlank
    BMI .forcedBlank
    STA.B DP_Brightness
    PLP
    CLC
    RTS

  .forcedBlank:
    LDA.B #$80 : STA.B DP_Brightness

  .return:
    PLP
    SEC
    RTS


;;; $90D5: Advance slow screen fade out ;;;
AdvanceSlowScreenFadeOut:
;; Returns:
;;     Carry: Set if reached zero brightness, otherwise clear

; Screen darkens at rate 1/Fh per [screen fade counter] frames
    PHP
    SEP #$30
    DEC.W ScreenFadeDelay : BEQ .checkBrightness
    BPL .returnFading

  .checkBrightness:
    LDA.B DP_Brightness : AND.B #$0F : BEQ .done
    DEC : BEQ .zeroBrightness
    STA.B DP_Brightness
    LDA.W ScreenFadeCounter : STA.W ScreenFadeDelay

  .returnFading:
    PLP
    CLC
    RTS

  .zeroBrightness:
    LDA.B #$80 : STA.B DP_Brightness
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter

  .done:
    PLP
    SEC
    RTS


;;; $9100: Advance fast screen fade in ;;;
AdvanceFastScreenFadeIn:
;; Returns:
;;     Carry: Set if reached max brightness, otherwise clear

; Screen brightens at rate [screen fade counter] / Fh per frame
    PHP
    SEP #$30
    LDA.B DP_Brightness : CLC : ADC.W ScreenFadeCounter
    AND.B #$1F : CMP.B #$0F : BPL .disableForcedBlank
    STA.B DP_Brightness
    PLP
    CLC
    RTS

  .disableForcedBlank:
    LDA.B #$0F : STA.B DP_Brightness
    PLP
    SEC
    RTS


;;; $911B: Advance slow screen fade in ;;;
AdvanceSlowScreenFadeIn:
;; Returns:
;;     Carry: Set if reached max brightness, otherwise clear

; Screen brightens at rate 1/Fh per [screen fade counter] frames
    PHP
    SEP #$30
    DEC.W ScreenFadeDelay : BEQ .checkBrightness
    BPL .fading

  .checkBrightness:
    LDA.B DP_Brightness : INC : AND.B #$1F : CMP.B #$0F : BPL .maxBrightness
    STA.B DP_Brightness
    LDA.W ScreenFadeCounter : STA.W ScreenFadeDelay

  .fading:
    PLP
    CLC
    RTS

  .maxBrightness:
    LDA.B #$0F : STA.B DP_Brightness
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    PLP
    SEC
    RTS


;;; $9146: Initialise IO registers and display Nintendo logo ;;;
Initialise_IO_Registers_and_Display_Nintendo_Logo:
    PHP : PHB
    PHK : PLB
    SEP #$30
    LDA.B #$8F : STA.W $2100 : STA.B DP_Brightness
    REP #$30
    STZ.W OAMStack
    JSL ClearHighOAM
    JSL Finalise_OAM
    STZ.W SamusTiles_TopHalfFlag : STZ.W SamusTiles_TopHalfTilesDef : STZ.W SamusTiles_BottomHalfTilesDef
    SEP #$20
    LDA.B #$01 : STA.W $4200 : STA.B DP_IRQAutoJoy
    STZ.W $4201 : STZ.W $4202 : STZ.W $4203 : STZ.W $4204
    STZ.W $4205 : STZ.W $4206 : STZ.W $4207 : STZ.W $4208
    STZ.W $4209 : STZ.W $420A : STZ.W $420B : STZ.W $420C
    STZ.B DP_HDMAEnable
    LDA.B #$01 : STA.W $420D : STA.B DP_ROMAccessSpeed
    LDA.B #$03 : STA.W $2101 : STA.B DP_SpriteSizeAddr
    STZ.W $2102 : STZ.B DP_OAMAddrPrio
    LDA.B #$80 : STA.W $2103 : STA.B DP_OAMAddrPrio+1
    STZ.W $2104 : STZ.W $2104
    LDA.B #$01 : STA.W $2105 : STA.B DP_BGModeSize
    STZ.W $2106 : STZ.B DP_Mosaic
    STZ.W $2107 : STZ.B DP_BG1TilemapAddrSize
    STZ.W $2108 : STZ.B DP_BG2TilemapAddrSize
    STZ.W $2109 : STZ.B DP_BG3TilemapAddrSize
    STZ.W $210A : STZ.B DP_BG4TilemapAddrSize
    STZ.W $210B : STZ.B DP_BGTilesAddr
    STZ.W $210C : STZ.B DP_BGTilesAddr+1
    STZ.W $210D : STZ.W $210D
    STZ.W $210E : STZ.W $210E
    STZ.W $210F : STZ.W $210F
    STZ.W $2110 : STZ.W $2110
    STZ.W $2111 : STZ.W $2111
    STZ.W $2112 : STZ.W $2112
    STZ.W $2113 : STZ.W $2113
    STZ.W $2114 : STZ.W $2114
    STZ.W $2115
    STZ.W $211A : STZ.B DP_Mode7Settings
    STZ.W $211B : STZ.W $211C
    STZ.W $211D : STZ.W $211E
    STZ.W $211F : STZ.W $2120
    STZ.W $2123 : STZ.B DP_WindowMaskBG12
    STZ.W $2124 : STZ.B DP_WindowMaskBG34
    STZ.W $2125 : STZ.B DP_WindowMaskSprite
    STZ.W $2126 : STZ.B DP_Window1Left
    STZ.W $2127 : STZ.B DP_Window1Right
    STZ.W $2128 : STZ.B DP_Window2Left
    STZ.W $2129 : STZ.B DP_Window2Right
    STZ.W $212A : STZ.B DP_Window12BGMaskLogic
    STZ.W $212B : STZ.B DP_Window12SpriteMaskLogic
    LDA.B #$10 : STA.W $212C : STA.B DP_MainScreenLayers
    STZ.W $212E : STZ.B DP_WindowAreaMainScreen
    STZ.W $212D : STZ.B DP_SubScreenLayers
    STZ.W $212F : STZ.B DP_WindowAreaSubScreen
    STZ.W $2130 : STZ.B DP_NextGameplayColorMathA
    STZ.W $2131 : STZ.B DP_NextGameplayColorMathB
    LDA.B #$E0 : STA.W $2132
    LDA.B #$20 : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.B #$40 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor2
    LDA.B #$00 : STA.W $2133 : STA.B DP_DisplayResolution
    REP #$20
    LDA.W #Tiles_Title_Sprite>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Title_Sprite : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl TitleSpriteTiles
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$60 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl TitleSpriteTiles
    dw $4000
    LDA.B #$02 : STA.W $420B
    LDA.B #$80 : STA.B DP_Brightness
    REP #$30
    LDX.W #$0000

  .loop:
    LDA.L Palettes_TitleScreen,X : STA.L Palettes,X
    INX #2 : CPX.W #$0200 : BMI .loop
    JSL EnableNMI
    LDA.W #$0001 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter

  .fadeIn:
    JSL ClearHighOAM
    STZ.W OAMStack
    JSR AddNintendoBootLogoSpritemapToOAM
    JSR AdvanceFastScreenFadeIn
    BCS .maxBrightness
    JSL Finalise_OAM
    JSL WaitForNMI
    BRA .fadeIn

  .maxBrightness:
    JSL Finalise_OAM
    JSL WaitForNMI
    LDA.W #$0078 : STA.W GameOptionsMenuIndex

  .loopNintendoLogo:
    JSL ClearHighOAM
    STZ.W OAMStack
    JSR AddNintendoBootLogoSpritemapToOAM
    DEC.W GameOptionsMenuIndex : BEQ .timerExpired
    JSL Finalise_OAM
    JSL WaitForNMI
    BRA .loopNintendoLogo

  .timerExpired:
    JSL Finalise_OAM
    JSL WaitForNMI
    LDA.W #$0001 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter

  .loopFadeOut:
    JSL ClearHighOAM
    STZ.W OAMStack
    JSR AddNintendoBootLogoSpritemapToOAM
    JSR AdvanceFastScreenFadeOut
    BCS .zeroBrightness
    JSL Finalise_OAM
    JSL WaitForNMI
    BRA .loopFadeOut

  .zeroBrightness:
    JSL Finalise_OAM
    JSL WaitForNMI
    SEP #$30
    LDA.B #$8F : STA.W $2100 : STA.B DP_Brightness
    REP #$30
    PLB : PLP
    RTL


;;; $936B: Add Nintendo boot logo spritemap to OAM ;;;
AddNintendoBootLogoSpritemapToOAM:
    PHP
    REP #$30
    PHB
    PEA.W TitleSequenceSpritemaps_NintendoBootLogo>>8&$FF00 : PLB : PLB
    LDY.W #TitleSequenceSpritemaps_NintendoBootLogo
    STZ.B DP_Temp16
    LDA.W #$0080 : STA.B DP_Temp14
    LDA.W #$0070 : STA.B DP_Temp12
    JSL AddSpritemapToOAM
    PLB : PLP
    RTS


;;; $938A: Spawn cinematic sprite object [Y] ;;;
Spawn_CinematicSpriteObject_Y:
;; Parameters:
;;     A: Initialisation parameter
;;     Y: Pointer to cinematic sprite object definition
    PHP
    REP #$30
    PHX
    STA.W CinematicSpriteObject_InitParam
    TYX
    LDY.W #$001E

  .loop:
    LDA.W CinematicSpriteObject_InstListPointers,Y : BEQ SpawnCinematicSpriteObject_XToIndexY
    DEY #2 : BPL .loop
    PLX : PLP
    SEC
    RTS


;;; $93A2: Spawn cinematic sprite object [Y] to index [$12] ;;;
Spawn_CinematicSpriteObject_YToIndex12:
;; Parameters:
;;     A: Initialisation parameter
;;     Y: Pointer to cinematic sprite object definition
;;     $12: Cinematic sprite object index
    PHP
    REP #$30
    PHX
    STA.W CinematicSpriteObject_InitParam
    TYX
    LDY.B DP_Temp12
; fallthrough to SpawnCinematicSpriteObject_XToIndexY


;;; $93AC: Spawn cinematic sprite object [X] to index [Y] ;;;
SpawnCinematicSpriteObject_XToIndexY:
;; Parameters:
;;     X: Pointer to cinematic sprite object definition
;;     Y: Cinematic sprite object index
    REP #$30
    LDA.W $0002,X : STA.W CinematicSpriteObject_PreInstructions,Y
    LDA.W $0004,X : STA.W CinematicSpriteObject_InstListPointers,Y
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,Y
    LDA.W #$0000 : STA.W CinematicSpriteObject_SpritemapPointers,Y
    LDA.W #$0000 : STA.W CinematicSpriteObject_Timers,Y
    STA.W CinematicSpriteObject_XSubPosition,Y : STA.W CinematicSpriteObject_YSubPosition,Y
    JSR.W ($0000,X)
    PLX : PLP
    CLC
    RTS


;;; $93D9: RTS ;;;
RTS_8B93D9:
    RTS


;;; $93DA: Clear cinematic sprite objects ;;;
Clear_CinematicSpriteObjects:
    PHP
    REP #$30
    LDX.W #$001E
    LDA.W #$0000

  .loop:
    STA.W CinematicSpriteObject_InstListPointers,X : STA.W CinematicSpriteObject_SpritemapPointers,X
    DEX #2 : BPL .loop
    PLP
    RTS


;;; $93EF: Handle cinematic sprite objects ;;;
Handle_CinematicSpriteObjects:
    PHP
    REP #$30
    LDX.W #$001E

  .loop:
    STX.W CinematicSpriteObject_Index
    LDA.W CinematicSpriteObject_InstListPointers,X : BEQ .next
    JSR Process_CinematicSpriteObjects_InstList
    LDX.W CinematicSpriteObject_Index

  .next:
    DEX #2 : BPL .loop
    PLP
    RTS


;;; $9409: Process cinematic sprite object instruction list ;;;
Process_CinematicSpriteObjects_InstList:
;; Parameters:
;;     X: Cinematic sprite object index

; Some instructions (e.g. sleep) pop the return address pushed to the stack by $9420 to return out of *this* routine
; (marked "terminate processing cinematic sprite object")
    JSR.W (CinematicSpriteObject_PreInstructions,X)
    LDX.W CinematicSpriteObject_Index
    DEC.W CinematicSpriteObject_InstructionTimers,X : BNE .return
    LDY.W CinematicSpriteObject_InstListPointers,X

  .loop:
    LDA.W $0000,Y : BPL +
    STA.B DP_Temp12
    INY #2
    PEA .loop-1
    JMP.W (DP_Temp12)

+   STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W $0002,Y : STA.W CinematicSpriteObject_SpritemapPointers,X
    TYA : CLC : ADC.W #$0004 : STA.W CinematicSpriteObject_InstListPointers,X

  .return:
    RTS


;;; $9438: Instruction - delete ;;;
CinematicSpriteObject_Instruction_Delete:
;; Parameters:
;;     X: Cinematic sprite object index
    REP #$30
    STZ.W CinematicSpriteObject_SpritemapPointers,X : STZ.W CinematicSpriteObject_InstListPointers,X
    PLA
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $9442: Unused. Instruction - sleep ;;;
UNUSED_CinematicSpriteObject_Instruction_Sleep_8B9442:
;; Parameters:
;;     X: Cinematic sprite object index
;;     Y: Pointer to after this instruction
    REP #$30
    DEY #2
    TYA : STA.W CinematicSpriteObject_InstListPointers,X
    PLA
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $944C: Instruction - pre-instruction = [[Y]] ;;;
CinematicSpriteObject_Instruction_PreInstructionY:
;; Parameters:
;;     X: Cinematic sprite object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    REP #$30
    LDA.W $0000,Y : STA.W CinematicSpriteObject_PreInstructions,X
    INY #2
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $9457: Unused. Instruction - clear pre-instruction ;;;
UNUSED_CinematicSpriteObject_Inst_ClearPreInstruction_8B9457:
;; Parameters:
;;     X: Cinematic sprite object index
    REP #$30
    LDA.W #.return : STA.W CinematicSpriteObject_PreInstructions,X

  .return:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9460: Unused. Instruction - call external function [[Y]] ;;;
CinematicSpriteObject_Inst_CallExternalFunctionY_8B9460:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    REP #$30
    LDA.W $0000,Y : STA.W DP_Temp12
    LDA.W $0001,Y : STA.W DP_Temp13
    PHY
    JSL .externalFunction
    PLY
    LDX.W CinematicSpriteObject_Index
    INY #3
    RTS

  .externalFunction:
    JML.W [DP_Temp12]


;;; $947E: Unused. Instruction - call external function [[Y]] with A = [[Y] + 3] ;;;
CinematicSpriteObject_Inst_CallExternalFunctionYWithA_8B947E:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    REP #$30
    LDA.W $0000,Y : STA.W DP_Temp12
    LDA.W $0001,Y : STA.W DP_Temp13
    LDA.W $0003,Y
    PHY
    JSL .externalFunction
    PLY
    LDX.W CinematicSpriteObject_Index
    TYA : CLC : ADC.W #$0005 : TAY
    RTS

  .externalFunction:
    JML.W [DP_Temp12]


if !FEATURE_KEEP_UNREFERENCED
;;; $94A2: Unused. Instruction - go to [Y] + ±[[Y]] ;;;
UNUSED_CinematicSpriteObject_Inst_GotoY_8B94A2:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    REP #$30
    STY.W DP_Temp12
    DEY
    LDA.W $0000,Y : XBA : BMI .highByte
    AND.W #$00FF
    BRA +

  .highByte:
    ORA.W #$FF00

+   CLC : ADC.W DP_Temp12 : TAY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $94BC: Instruction - go to [[Y]] ;;;
CinematicSpriteObject_Instruction_GotoY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    REP #$30
    LDA.W $0000,Y : TAY
    RTS


;;; $94C3: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
CinematicSpriteObject_Inst_DecrementTimer_GotoYIfNonZero:
;; Parameters:
;;     X: Cinematic sprite object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    REP #$30
    DEC.W CinematicSpriteObject_Timers,X : BNE CinematicSpriteObject_Instruction_GotoY
    INY #2
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $94CD: Unused. Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
UNUSED_CinematicSpriteObject_Inst_DecTimer_GotoY_8B94CD:
;; Parameters:
;;     X: Cinematic sprite object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    REP #$30
    DEC.W CinematicSpriteObject_Timers,X : BNE UNUSED_CinematicSpriteObject_Inst_GotoY_8B94A2
    INY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $94D6: Instruction - timer = [[Y]] ;;;
CinematicSpriteObject_Instruction_TimerInY:
;; Parameters:
;;     X: Cinematic sprite object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    REP #$30
    LDA.W $0000,Y : STA.W CinematicSpriteObject_Timers,X
    INY #2
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $94E1: Unused. RTS ;;;
UNUSED_REP30RTS_8B94E1:
    REP #$30
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $94E4: Spawn mode 7 object ;;;
Spawn_Mode7Objects:
;; Parameters:
;;     A: Initialisation parameter. Never actually used by anything
;;     Y: Pointer to mode 7 object definition
    PHP
    REP #$30
    PHX
    STA.W neverRead19B3
    TYX
    LDY.W #$0002

  .loop:
    LDA.W Mode7Object_InstListPointers,Y : BEQ .spawn
    DEY #2 : BPL .loop
    PLX : PLP
    SEC
    RTS

  .spawn:
    REP #$30
    LDA.W $0002,X : STA.W Mode7Object_PreInstructions,Y
    LDA.W $0004,X : STA.W Mode7Object_InstListPointers,Y
    LDA.W #$0001 : STA.W Mode7Object_InstructionTimers,Y
    LDA.W #$0000 : STA.W Mode7Object_Timers,Y
    JSR.W ($0000,X)
    PLX : PLP
    CLC
    RTS


;;; $951D: Handle mode 7 objects ;;;
Handle_Mode7Objects:
    PHP
    REP #$30
    LDX.W #$0002

  .loop:
    STX.W Mode7Object_Index
    LDA.W Mode7Object_InstListPointers,X : BEQ .next
    JSR Process_Mode7Objects_InstList
    LDX.W Mode7Object_Index

  .next:
    DEX #2 : BPL .loop
    PLP
    RTS


;;; $9537: Process mode 7 object instruction list ;;;
Process_Mode7Objects_InstList:
;; Parameters:
;;     X: Mode 7 object index

; The sleep instruction pops the return address pushed to the stack by $954E to return out of *this* routine
; (marked "terminate processing mode 7 object")
    JSR.W (Mode7Object_PreInstructions,X)
    LDX.W Mode7Object_Index
    DEC.W Mode7Object_InstructionTimers,X : BNE .return
    LDY.W Mode7Object_InstListPointers,X

  .loop:
    LDA.W $0000,Y : BPL .timer
    STA.B DP_Temp12
    INY #2
    PEA .loop-1
    JMP.W (DP_Temp12)

  .timer:
    STA.W Mode7Object_InstructionTimers,X
    PHY : PHX
    LDX.W $0002,Y
    JSL QueueMode7Transfers
    PLX : PLY
    TYA : CLC : ADC.W #$0004 : STA.W Mode7Object_InstListPointers,X

  .return:
    RTS


;;; $956B: Instruction - delete ;;;
Mode7Objects_Instruction_Delete:
;; Parameters:
;;     X: Mode 7 object index
    REP #$30
    STZ.W Mode7Object_InstListPointers,X
    PLA
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $9572: Unused. Instruction - pre-instruction = [[Y]] ;;;
UNUSED_Mode7Objects_Instruction_PreInstructionY_8B9572:
    REP #$30
    LDA.W $0000,Y : STA.W Mode7Object_PreInstructions,X
    INY #2
    RTS


;;; $957D: Unused. Instruction - clear pre-instruction ;;;
UNUSED_Mode7Objects_Instruction_ClearPreInstruction_8B957D:
    REP #$30
    LDA.W #.return : STA.W Mode7Object_PreInstructions,X

  .return:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9586: Instruction - go to [[Y]] ;;;
Mode7Objects_Instruction_GotoY:
    REP #$30
    LDA.W $0000,Y : TAY
    RTS


;;; $958D: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Mode7Objects_Instruction_DecrementTimer_GotoYIfNonZero:
    REP #$30
    DEC.W Mode7Object_Timers,X : BNE Mode7Objects_Instruction_GotoY
    INY #2
    RTS


;;; $9597: Instruction - timer = [[Y]] ;;;
Mode7Objects_Instruction_TimerInY:
    REP #$30
    LDA.W $0000,Y : STA.W Mode7Object_Timers,X
    INY #2
    RTS


;;; $95A2: Enable cinematic BG objects ;;;
Enable_CinematicBGObjects:
    PHP
    REP #$30
    LDA.W #$8000 : TSB.W CinematicBGObject_Enable
    PLP
    RTL


;;; $95AD: Disable cinematic BG objects ;;;
Disable_CinematicBGObjects:
    PHP
    REP #$30
    LDA.W #$8000 : TRB.W CinematicBGObject_Enable
    PLP
    RTL


;;; $95B8: Enable cinematic BG tilemap updates ;;;
Enable_CinematicBGTilemap_Updates:
    PHP
    REP #$30
    LDA.W #$8000 : TSB.W CinematicBGObject_TilemapUpdateFlag
    PLP
    RTL


;;; $95C3: Disable cinematic BG tilemap updates ;;;
Disable_CinematicBGTilemap_Updates:
    PHP
    REP #$30
    LDA.W #$8000 : TRB.W CinematicBGObject_TilemapUpdateFlag
    PLP
    RTL


;;; $95CE: Clear cinematic BG objects, cinematic BG tilemap = [A] ;;;
Clear_CinematicBGObjects_CinematicBGTilemap:
    PHP
    REP #$30
    PHX
    LDX.W #$07FE

  .loopTilemap:
    STA.L CinematicBGTilemap_TopMarginInitialJapanText,X
    DEX #2 : BPL .loopTilemap
    LDX.W #$0006

  .loopObjects:
    STZ.W CinematicBGObject_IndirectInstructionPointers,X : STZ.W CinematicBGObject_InstListPointers,X
    DEX #2 : BPL .loopObjects
    STZ.W CinematicSpriteObject_IntroTextClickFlag
    PLX : PLP
    RTL


;;; $95F0: Spawn cinematic BG object ;;;
Spawn_CinematicBGObject:
    PHP
    REP #$30
    PHX
    STA.W CinematicBGObject_VRAMAddr
    TYX
    LDY.W #$0006

  .loop:
    LDA.W CinematicBGObject_InstListPointers,Y : BEQ .spawn
    DEY #2 : BPL .loop
    PLX : PLP
    SEC
    RTS

  .spawn:
    REP #$30
    LDA.W $0002,X : STA.W CinematicBGObject_PreInstructions,Y
    LDA.W $0004,X : STA.W CinematicBGObject_InstListPointers,Y
    LDA.W #$0001 : STA.W CinematicBGObject_InstructionTimers,Y
    LDA.W #$0000 : STA.W CinematicBGObject_IndirectInstructionPointers,Y
    LDA.W #$0000 : STA.W CinematicBGObject_Timers,Y
    JSR.W ($0000,X)
    PLX : PLP
    CLC
    RTS


;;; $962F: Handle cinematic BG objects ;;;
Handle_CinematicBGObjects:
    PHP
    REP #$30
    BIT.W CinematicBGObject_Enable : BPL .return
    LDX.W #$0006

  .loop:
    STX.W CinematicBGObject_Index
    LDA.W CinematicBGObject_InstListPointers,X : BEQ .next
    JSR Process_CinematicBGObject_InstList
    LDX.W CinematicBGObject_Index

  .next:
    DEX #2 : BPL .loop
    BIT.W CinematicBGObject_TilemapUpdateFlag : BPL .updateEyes
    JSR CinematicBGObjects_Update32x30CinematicBGTilemap

  .updateEyes:
    JSR CinematicBGObjects_UpdateSamusEyesTilemap

  .return:
    PLP
    RTS


;;; $9659: Process cinematic BG object instruction list ;;;
Process_CinematicBGObject_InstList:
;; Parameter:
;;     X: Cinematic BG object index

; Some instructions (e.g. sleep) pop the return address pushed to the stack by $9676 and bank to return out of *this* routine
; (marked "terminate processing cinematic BG object")
    JSR.W (CinematicBGObject_PreInstructions,X)
    PHB
    PEA.W CinematicBGObjectInstLists>>8&$FF00 : PLB : PLB
    LDX.W CinematicBGObject_Index
    DEC.W CinematicBGObject_InstructionTimers,X : BNE .return
    LDY.W CinematicBGObject_InstListPointers,X

  .loop:
    LDA.W $0000,Y : BPL .timer
    STA.B DP_Temp12
    INY #2
    PEA .loop-1
    JMP.W (DP_Temp12)

  .timer:
    STA.W CinematicBGObject_InstructionTimers,X
    LDA.W $0002,Y : STA.W DP_Temp12
    LDA.W $0004,Y : STA.W CinematicBGObject_IndirectInstructionPointers,X
    JSR CinematicBGObjects_ProcessIndirectInstruction
    TYA : CLC : ADC.W #$0006 : STA.W CinematicBGObject_InstListPointers,X

  .return:
    PLB
    RTS


;;; $9698: Instruction - delete ;;;
CinematicBGObject_Instruction_Delete:
    REP #$30
    STZ.W CinematicBGObject_IndirectInstructionPointers,X : STZ.W CinematicBGObject_InstListPointers,X
    PLA : PLB
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $96A3: Unused. Instruction - sleep ;;;
UNUSED_CinematicBGObject_Instruction_Sleep_8B96A3:
    REP #$30
    DEY #2 : TYA : STA.W CinematicBGObject_InstListPointers,X
    PLA : PLB
    RTS


;;; $96AE: Unused. Instruction - pre-instruction = [[Y]] ;;;
UNUSED_CinematicBGObject_Instruction_PreInstructionY_8B96AE:
    REP #$30
    LDA.W $0000,Y : STA.W CinematicBGObject_PreInstructions,X
    INY #2
    RTS


;;; $96B9: Unused. Instruction - clear pre-instruction ;;;
UNUSED_CinematicBGObject_Inst_ClearPreInstruction_8B96B9:
    REP #$30
    LDA.W #.return : STA.W CinematicBGObject_PreInstructions,X

  .return:
    RTS


;;; $96C2: Unused. Instruction - call external function [[Y]] ;;;
UNUSED_CinematicBGObjects_Inst_CallExternalFunction_8B96C2:
    REP #$30
    LDA.W $0000,Y : STA.W DP_Temp12
    LDA.W $0001,Y : STA.W DP_Temp13
    PHY
    JSL .externalFunction
    PLY
    LDX.W CinematicBGObject_Index
    INY #3
    RTS

  .externalFunction:
    JML.W [DP_Temp12]


;;; $96E0: Unused. Instruction - call external function [[Y]] with A = [[Y] + 3] ;;;
UNUSED_CinematicBGObjects_Inst_CallExternalFunction_8B96E0:
    REP #$30
    LDA.W $0000,Y : STA.W DP_Temp12
    LDA.W $0001,Y : STA.W DP_Temp13
    LDA.W $0003,Y
    PHY
    JSL .externalFunction
    PLY
    LDX.W CinematicBGObject_Index
    TYA : CLC : ADC.W #$0005 : TAY
    RTS

  .externalFunction:
    JML.W [DP_Temp12]


;;; $9704: Unused. Instruction - go to [Y] + ±[[Y]] ;;;
UNUSED_CinematicBGObjects_Inst_GotoY_8B9704:
    REP #$30
    STY.W DP_Temp12
    DEY
    LDA.W $0000,Y : XBA : BMI .highByte
    AND.W #$00FF
    BRA +

  .highByte:
    ORA.W #$FF00

+   CLC : ADC.W DP_Temp12 : TAY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $971E: Instruction - go to [[Y]] ;;;
CinematicBGObject_Instruction_GotoY:
    REP #$30
    LDA.W $0000,Y : TAY
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $9725: Unused. Instruction - decrement timer and go to [[Y]] if non-zero ;;;
UNUSED_CinematicBGObjects_Inst_DecrementTimer_GotoY_8B9724:
    REP #$30
    DEC.W CinematicBGObject_Timers,X : BNE CinematicBGObject_Instruction_GotoY
    INY #2
    RTS


;;; $972F: Unused. Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
UNUSED_CinematicBGObjects_Inst_DecrementTimer_GotoY_8B972F:
    REP #$30
    DEC.W CinematicBGObject_Timers,X : BNE UNUSED_CinematicBGObjects_Inst_GotoY_8B9704
    INY
    RTS


;;; $9738: Unused. Instruction - timer = [[Y]] ;;;
UNUSED_CinematicBGObjects_Inst_TimerInY_8B9738:
    REP #$30
    LDA.W $0000,Y : STA.W CinematicBGObject_Timers,X
    INY #2
    RTS


;;; $9743: Unused. RTS ;;;
UNUSED_REP30RTS_8B9743:
    REP #$30
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9746: Draw cinematic sprite objects - intro/title sequence ;;;
Draw_CinematicSpriteObjects_IntroTitleSequence:
    PHP
    REP #$30
    PHB
    LDX.W #$001E

  .loop:
    LDA.W CinematicSpriteObject_SpritemapPointers,X : BEQ .next
    PEA.W CinematicBGObjectInstLists>>8 : PLB : PLB
    LDY.W CinematicSpriteObject_SpritemapPointers,X
    LDA.W CinematicSpriteObject_PaletteIndices,X : STA.B DP_Temp16
    LDA.W CinematicSpriteObject_XPositions,X : SEC : SBC.W Layer1XPosition : STA.B DP_Temp14
    LDA.W CinematicSpriteObject_YPositions,X : SEC : SBC.W Layer1YPosition : STA.B DP_Temp12
    BIT.W #$FF00 : BNE +
    CLC : ADC.W #$0080 : CMP.W #$01FF : BCS .next
    JSL AddSpritemapToOAM
    BRA .next

+   CLC : ADC.W #$0080 : CMP.W #$01FF : BCS .next
    JSL AddSpritemapToOAM_Offscreen

  .next:
    DEX #2 : BPL .loop
    PLB : PLP
    RTS


;;; $9799: Draw cinematic sprite objects - ending/credits ;;;
Draw_CinematicSpriteObjects_EndingCredits:
    PHP
    REP #$30
    PHB
    LDX.W #$001E

  .loop:
    LDA.W CinematicSpriteObject_SpritemapPointers,X : BEQ .next
    PEA.W CinematicBGObjectInstLists>>8 : PLB : PLB
    LDY.W CinematicSpriteObject_SpritemapPointers,X
    LDA.W CinematicSpriteObject_PaletteIndices,X : STA.B DP_Temp16
    LDA.W CinematicSpriteObject_XPositions,X : SEC : SBC.W Layer1XPosition : STA.B DP_Temp14
    LDA.W CinematicSpriteObject_YPositions,X : SEC : SBC.W Layer1YPosition : STA.B DP_Temp12
    BIT.W #$FF00 : BNE +
    CLC : ADC.W #$0080 : CMP.W #$01FF : BCS .next
    JSL AddSpritemapToOAM
    BRA .next

+   CLC : ADC.W #$0080 : CMP.W #$01FF : BCS .next
    JSL AddSpritemapToOAM_Offscreen

  .next:
    DEX #2 : BPL .loop
    PLB
    LDA.W CinematicFunction : CMP.W #CinematicFunc_Ending_ZebesDestruction2_CrossFade_FadingIn : BPL .return
    JSR MoveUnusedSpritesOffScreen

  .return:
    PLP
    RTS


;;; $97F7: Spawn text glow object ;;;
Spawn_TextGlowObject:
    PHX
    LDX.W #$000E

  .loop:
    LDA.W TextGlowObject_IndirectInstructionPointers,X : BEQ .spawn
    DEX #2 : BPL .loop
    PLX
    RTS

  .spawn:
    TYA : STA.W TextGlowObject_IndirectInstructionPointers,X
    LDA.W #$0001 : STA.W TextGlowObject_Timers,X
    LDA.B DP_Temp12 : AND.W #$00FF : STA.W TextGlowObject_XPositions,X
    LDA.B DP_Temp13 : AND.W #$00FF : STA.W TextGlowObject_YPositions,X
    LDA.W #$0000 : STA.W TextGlowObject_PaletteIndices,X
    PLX
    RTS


;;; $9828: Handle text glow objects ;;;
Handle_TextGlowObject:
    PHP
    REP #$30
    PHB
    PEA.W IndirectInstructions>>8 : PLB : PLB
    LDX.W #$000E

  .loop:
    STX.W TextGlowObject_Index
    LDA.W TextGlowObject_IndirectInstructionPointers,X : BEQ .next
    JSR Process_TextGlowObject
    LDX.W TextGlowObject_Index

  .next:
    DEX #2 : BPL .loop
    PLB : PLP
    RTS


;;; $9849: Process text glow object ;;;
Process_TextGlowObject:
    LDX.W TextGlowObject_Index
    DEC.W TextGlowObject_Timers,X : BEQ +
    RTS

+   LDA.W TextGlowObject_PaletteIndices,X : STA.B DP_Temp1C
    LDY.W TextGlowObject_IndirectInstructionPointers,X
    LDA.W TextGlowObject_XPositions,X : AND.W #$00FF : ASL : STA.W DP_Temp14
    SEP #$20
    LDA.B #$40 : STA.W $4202
    LDA.W TextGlowObject_YPositions,X : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : CLC : ADC.W DP_Temp14 : STA.W DP_Temp16
    TAX
    LDA.W $0002,Y : AND.W #$00FF : STA.W DP_Temp12 : STA.W DP_Temp18
    LDA.W $0003,Y : AND.W #$00FF : STA.W DP_Temp14

  .loop:
    LDA.L CinematicBGTilemap_TopMarginInitialJapanText,X : AND.W #$E3FF : ORA.B DP_Temp1C : STA.L CinematicBGTilemap_TopMarginInitialJapanText,X
    INY #2
    INX #2
    DEC.W DP_Temp12 : BEQ +
    BRA .loop

+   LDA.W DP_Temp18 : STA.W DP_Temp12
    DEC.W DP_Temp14 : BEQ +
    LDA.W DP_Temp16 : CLC : ADC.W #$0040 : STA.W DP_Temp16
    TAX
    BRA .loop

+   LDX.W TextGlowObject_Index
    LDA.W TextGlowObject_PaletteIndices,X : CMP.W #$0C00 : BEQ .return
    CLC : ADC.W #$0400 : STA.W TextGlowObject_PaletteIndices,X
    LDA.W #$0005 : STA.W TextGlowObject_Timers,X
    RTS

  .return:
    STZ.W TextGlowObject_IndirectInstructionPointers,X
    RTS


;;; $98E3: Enable credits object ;;;
Enable_CreditsObject:
    PHP
    REP #$30
    LDA.W #$8000 : TSB.W CreditsObject_Enable
    PLP
    RTS


;;; $98EE: Disable credits object ;;;
Disable_CreditsObject:
    PHP
    REP #$30
    LDA.W #$8000 : TRB.W CreditsObject_Enable
    PLP
    RTS


;;; $98F9: Clear credits object, cinematic BG tilemap = [A] ;;;
Clear_CreditsObject_CinematicBGTilemapInA:
    PHP
    REP #$30
    PHX
    LDX.W #$07FE

  .loop:
    STA.L CinematicBGTilemap_TopMarginInitialJapanText,X
    DEX #2 : BPL .loop
    LDA.W #$0000 : STA.W CreditsObject_CinematicBGTilemapRowIndex
    STZ.W TextGlowObject_IndirectInstructionPointers : STZ.W CreditsObject_InstructionTimer
    STZ.W CreditsObject_Timer : STZ.W CreditsObject_PreInstruction
    LDA.W #$4800 : STA.W CinematicBGObject_VRAMAddr
    STZ.W CreditsObject_LastCreditsUpdateYPosition
    STZ.W CinematicBG1_XSubPosition : STZ.W CinematicBG1_XPosition
    STZ.W CinematicBG1_YSubPosition : STZ.W CinematicBG1_YPosition
    PLX : PLP
    RTS


;;; $9932: Spawn credits object ;;;
Spawn_CreditsObject:
    PHP
    REP #$30
    PHX
    TYX
    LDA.W $0002,X : STA.W CreditsObject_PreInstruction
    LDA.W $0004,X : STA.W TextGlowObject_IndirectInstructionPointers
    LDA.W #$0001 : STA.W CreditsObject_InstructionTimer
    LDA.W #$0000 : STA.W CreditsObject_Timer
    JSR.W ($0000,X)
    PLX : PLP
    RTS


;;; $9955: Handle credits object ;;;
Handle_CreditsObject:
    PHP
    REP #$30
    BIT.W CreditsObject_Enable : BPL .return
    LDA.W TextGlowObject_IndirectInstructionPointers : BEQ .updateTilemap
    JSR Process_CreditsObject_InstList

  .updateTilemap:
    JSR CinematicBGObjects_Update32x32CinematicBGTilemap

  .return:
    PLP
    RTS


;;; $996A: Process credits object instruction list ;;;
Process_CreditsObject_InstList:
; The delete instruction pops the return address pushed to the stack by $99A4 and bank to return out of *this* routine
; (marked "terminate processing credits object")
    LDX.W #$0000
    JSR.W (CreditsObject_PreInstruction,X)
    PHB
    PEA.W CreditsInstLists>>8 : PLB : PLB
    LDA.W CinematicBG1_YSubPosition : CLC : ADC.W #$8000 : STA.W CinematicBG1_YSubPosition
    LDA.W CinematicBG1_YPosition : ADC.W #$0000 : STA.W CinematicBG1_YPosition
    SEC : SBC.W CreditsObject_LastCreditsUpdateYPosition : CMP.W #$0008 : BMI .return
    LDA.W CinematicBG1_YPosition : STA.W CreditsObject_LastCreditsUpdateYPosition
    LDY.W TextGlowObject_IndirectInstructionPointers

  .loop:
    LDA.W $0000,Y : BPL .copyRow
    STA.B DP_Temp12
    INY #2
    PEA .loop-1
    JMP.W (DP_Temp12)

  .copyRow:
    JSR Copy_CreditsRow_ToCinematicBGTilemap
    LDA.W CreditsObject_CinematicBGTilemapRowIndex : INC : AND.W #$001F : STA.W CreditsObject_CinematicBGTilemapRowIndex
    TYA : CLC : ADC.W #$0004 : STA.W TextGlowObject_IndirectInstructionPointers

  .return:
    PLB
    RTS


;;; $99C1: Copy credits row to cinematic BG tilemap ;;;
Copy_CreditsRow_ToCinematicBGTilemap:
; Copy 40h bytes from $7F:0000 + [[Y] + 2] to $7E:3000 + CreditsObject_CinematicBGTilemapRowIndex * 40h
    PHP
    REP #$30
    LDA.W #$7F00 : STA.B DP_Temp01
    STZ.B DP_Temp00
    PHY
    SEP #$20
    LDA.B #$40 : STA.W $4202
    LDA.W CreditsObject_CinematicBGTilemapRowIndex : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : TAX
    LDA.W #$001F : STA.W DP_Temp14
    LDA.W $0002,Y : TAY

  .loop:
    LDA.B [DP_Temp00],Y : STA.L CinematicBGTilemap_TopMarginInitialJapanText,X
    INX #2
    INY #2
    DEC.W DP_Temp14 : BPL .loop
    PLY : PLP
    RTS


;;; $99FE: Instruction - delete ;;;
Instruction_CreditsObject_Delete:
    REP #$30
    STZ.W TextGlowObject_IndirectInstructionPointers
    PLA : PLB
    RTS


;;; $9A06: Instruction - go to [[Y]] ;;;
Instruction_CreditsObject_GotoY:
    REP #$30
    LDA.W $0000,Y : TAY
    RTS


;;; $9A0D: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero:
    REP #$30
    DEC.W CreditsObject_Timer : BNE Instruction_CreditsObject_GotoY
    INY #2
    RTS


;;; $9A17: Instruction - timer = [[Y]] ;;;
Instruction_CreditsObject_TimerInY:
    REP #$30
    LDA.W $0000,Y : STA.W CreditsObject_Timer
    INY #2
    RTS


;;; $9A22: Game state 1 - title sequence ;;;
GameState1_TitleSequence:
    PHP : PHB
    PHK : PLB
    REP #$30
    PEA .manualReturn-1
    JMP.W (CinematicFunction)

  .manualReturn:
    JSR Handle_CinematicSpriteObjects
    JSR Handle_Mode7Objects
    JSL PaletteFXObject_Handler
    JSR Draw_CinematicSpriteObjects_IntroTitleSequence
    JSR SkipToTitleScreenCheck
    JSR SkipToTitleScreenHandler
    JSR HandleMode7TransformMatrixAndBG1Position_NoRotation
    PLB : PLP
    RTL


;;; $9A47: RTS ;;;
RTS_8B9A47:
    RTS


;;; $9A48: Skip to title screen check ;;;
SkipToTitleScreenCheck:
    LDA.W CinematicFunction : CMP.W #RTS_8B9F28 : BPL .return
    LDA.B DP_Controller1New : BIT.W #$9080 : BEQ .return
    LDA.W SkipToTitleScreenIndex : BNE .return
    LDA.W #$0001 : STA.W SkipToTitleScreenIndex
    STZ.W ScreenFadeDelay
    LDA.W #$0002 : STA.W ScreenFadeCounter

  .return:
    RTS


;;; $9A6C: Skip to title screen handler ;;;
SkipToTitleScreenHandler:
    PHP
    REP #$30
    LDA.W SkipToTitleScreenIndex : BEQ .return
    ASL : TAX
    JSR.W (.pointers,X)

  .return:
    PLP
    RTS

  .pointers:
    dw $0000
    dw SkipToTitleScreenHandler_1_FadeOut
    dw SkipToTitleScreenHandler_2_PrepareTitleScreen
    dw SkipToTitleScreenHandler_3_FadeIn


;;; $9A83: Skip to title screen handler - 1 (fade out) ;;;
SkipToTitleScreenHandler_1_FadeOut:
    JSR AdvanceFastScreenFadeOut
    BCC .return
    LDA.W #$0002 : STA.W SkipToTitleScreenIndex
    LDA.W #RTS_8B9F28 : STA.W CinematicFunction
    LDA.W #$0006
    JSL QueueMusicDataOrTrack_8FrameDelay

  .return:
    RTS


;;; $9A9C: Skip to title screen handler - 2 (prepare title screen) ;;;
SkipToTitleScreenHandler_2_PrepareTitleScreen:
    JSR Clear_CinematicSpriteObjects
    LDY.W #CinematicSpriteObjectDefinitions_TitleSequence_SuperMetroidLogoImmediate
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_TitleSequence_NintendoCopyrightImmediate
    JSR Spawn_CinematicSpriteObject_Y
    STZ.W ScreenFadeDelay
    LDA.W #$0002 : STA.W ScreenFadeCounter
    LDA.W #$0100 : STA.W Mode7TransformationZoomLevel
    STZ.W CinematicBG1_XPosition : STZ.W CinematicBG1_XSubPosition
    STZ.W CinematicBG1_YPosition : STZ.W CinematicBG1_YSubPosition
    STZ.W CinematicBG1_XSpeed : STZ.W CinematicBG1_XSubSpeed
    STZ.W CinematicBG1_YSpeed : STZ.W CinematicBG1_YSubSpeed
    LDA.W #$0003 : STA.W SkipToTitleScreenIndex
    LDX.W #$0100

  .loop:
    LDA.L Palettes_TitleScreen,X : STA.L Palettes,X
    INX #2 : CPX.W #$0200 : BMI .loop
    LDA.W #$7FFF : STA.L Palettes_SpriteP4C9
    LDA.W #$7D80 : STA.L Palettes_SpriteP4CA
    JSL Clear_PaletteFXObjects
    LDY.W #PaletteFXObjects_TitleScreenBabyMetroidTubeLight
    JSL Spawn_PaletteFXObject
    LDY.W #PaletteFXObjects_TitleScreenFlickeringDisplays
    JSL Spawn_PaletteFXObject
    JSR Deactivate_TileSequence_BlueLight
    SEP #$20
    LDA.B #$11 : STA.B DP_MainScreenLayers
    REP #$20
    JSL Spawn_TitleSequenceGradient_HDMAObjects
    RTS


;;; $9B1A: Initialisation function - cinematic sprite object $A119 (Super Metroid title logo - immediate) ;;;
InitFunction_CinematicSpriteObject_SuperMetroidLogoImmediate:
    LDA.W #$0080 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0030 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0400 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $9B2D: Initialisation function - cinematic sprite object $A11F (unused. Nintendo boot logo - immediate) ;;;
InitFunction_CinematicSpriteObject_UnusedNintendoBootLogoImm:
    LDA.W #$0080 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0051 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0000 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9B40: Initialisation function - cinematic sprite object $A125 (Nintendo copyright - immediate) ;;;
InitFunc_CinematicSpriteObject_NintendoCopyrightImmediate:
    LDA.W #$0080 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$00C4 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0800 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $9B53: Skip to title screen handler - 3 (fade in) ;;;
SkipToTitleScreenHandler_3_FadeIn:
    JSR AdvanceFastScreenFadeIn
    BCC .return
    STZ.W SkipToTitleScreenIndex
    LDA.W #$0384 : STA.W DemoTimer
    LDA.W #CinematicFunction_TitleScreen : STA.W CinematicFunction

  .return:
    RTS


;;; $9B68: Cinematic function - title sequence - setup ;;;
CinematicFunction_LoadTitleSequence:
    JSL Load_Title_Sequence_Graphics
    LDA.W #$FF03
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #RTS_8B9A47 : STA.W CinematicFunction
    LDY.W #CinematicSpriteObjectDefinitions_TitleSequence_1994ScrollingText
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0005
    JSL QueueMusicDataOrTrack_8FrameDelay
    RTS


;;; $9B87: Load title sequence graphics ;;;
Load_Title_Sequence_Graphics:
; Called by:
;     $9B68: Cinematic function - title sequence - setup
;     $82:85FB: Game state 2Ch (transition from demo)
    PHP : PHB
    PHK : PLB
    REP #$30
    JSR Setup_PPU_TitleSequence
    STZ.B DP_IRQCmd : STZ.B DP_NextIRQCmd
    LDX.W #$0000

  .loopTitleScreenPalette:
    LDA.L Palettes_TitleScreen,X : STA.L Palettes,X
    INX #2 : CPX.W #$0200 : BMI .loopTitleScreenPalette
    LDA.W #Tiles_Title_Background_Mode7>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Title_Background_Mode7 : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl TitleBackgroundMode7Tiles
    LDA.W #Title_Mode7_Tilemap>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Title_Mode7_Tilemap : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl TitleMode7Tilemap
    LDA.W #Tiles_Title_Sprite>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Title_Sprite : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl TitleSpriteTiles
    LDA.W #Tiles_Baby_Metroid_Mode7>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Baby_Metroid_Mode7 : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl TitleBabyMetroidTiles
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$00 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$00,$19
    dl TitleBackgroundMode7Tiles
    dw $4000
    LDA.B #$02 : STA.W $420B
    REP #$10
    STZ.W $2115 : STZ.W $2116 : STZ.W $2117
    LDX.W #$4000
    LDA.B #$FF

  .loop:
    STA.W $2118
    DEX : BNE .loop
    SEP #$10
    LDA.B #$00 : STA.W $2116
    LDA.B #$00 : STA.W $2117
    LDA.B #$00 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$00,$18
    dl TitleMode7Tilemap
    dw $1000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$60 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl TitleSpriteTiles
    dw $4000
    LDA.B #$02 : STA.W $420B
    REP #$30
    LDA.W #$0100 : STA.W $211B
    STA.B DP_Mode7TransMatrixA
    STZ.W $211C : STZ.B DP_Mode7TransMatrixB
    STZ.W $211D : STZ.B DP_Mode7TransMatrixC
    STA.W $211E : STA.B DP_Mode7TransMatrixD
    LDA.W #$0080
    STA.W $211F : STA.B DP_Mode7TransOriginX
    STA.W $2120 : STA.B DP_Mode7TransOriginY
    JSL EnableNMI
    LDA.W #$0001 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter
    JSL Enable_HDMAObjects
    JSL Enable_PaletteFXObjects
    LDA.W #$0000 : STA.W LayerBlending_DefaultConfig
    LDY.W #PaletteFXObjects_TitleScreenBabyMetroidTubeLight
    JSL Spawn_PaletteFXObject
    LDY.W #PaletteFXObjects_TitleScreenFlickeringDisplays
    JSL Spawn_PaletteFXObject
    LDY.W #Mode7Object_TitleSequenceBabyMetroid
    JSR Spawn_Mode7Objects
    PLB : PLP
    RTL


;;; $9CBC: Initialisation function - cinematic sprite object $A0EF ('1994' scrolling text) ;;;
InitFunc_CinematicSpriteObject_1994ScrollingText:
    LDA.W #$0081 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0070 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0200 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $9CCF: Pre-instruction - cinematic sprite object $A0EF ('1994' scrolling text) ;;;
PreInstruction_CinematicSpriteObject_1994ScrollingText:
    SEP #$20
    LDA.B #$0F : STA.B DP_Brightness
    REP #$20
    LDA.W #RTS_8B93D9 : STA.W CinematicSpriteObject_PreInstructions,X
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $9CDE: Unused. REP #$20 ;;;
UNUSED_REP20RTS_8B9CDE:
    REP #$20
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9CE1: Instruction - trigger title sequence scene 0 ;;;
Instruction_TriggerTitleSequenceScene0:
    SEP #$20
    LDA.B #$11 : STA.B DP_MainScreenLayers
    REP #$20
    LDA.W #CinematicFunction_TitleSequenceScene0_PanningLeft_Lower : STA.W CinematicFunction
    LDA.W #$0048 : STA.W Mode7TransformationZoomLevel
    LDA.W #$013B : STA.W CinematicBG1_XPosition
    STZ.W CinematicBG1_XSubPosition
    LDA.W #$00E1 : STA.W CinematicBG1_YPosition
    STZ.W CinematicBG1_YSubPosition
    LDA.W #$FFFE : STA.W CinematicBG1_XSpeed
    LDA.W #$8000 : STA.W CinematicBG1_XSubSpeed
    JSR Activate_TileSequence_BlueLight
    RTS


;;; $9D17: Cinematic function - title sequence - scene 0 - panning left - lower ;;;
CinematicFunction_TitleSequenceScene0_PanningLeft_Lower:
    LDA.W CinematicBG1_XSubPosition : CLC : ADC.W CinematicBG1_XSubSpeed : STA.W CinematicBG1_XSubPosition
    LDA.W CinematicBG1_XPosition : ADC.W CinematicBG1_XSpeed : STA.W CinematicBG1_XPosition
    CMP.W #$FFF9 : BPL .titleScreenCheck
    SEP #$20
    LDA.B #$10 : STA.B DP_MainScreenLayers
    REP #$20
    LDA.W #RTS_8B9A47 : STA.W CinematicFunction
    LDY.W #CinematicSpriteObjectDefinitions_TitleSequence_NintendoScrollingText
    JSR Spawn_CinematicSpriteObject_Y
    JSR Deactivate_TileSequence_BlueLight

  .titleScreenCheck:
    JSR SkipToTitleScreenCheck
    RTS


;;; $9D4A: Initialisation function - cinematic sprite object $A0F5 ('NINTENDO' scrolling text) ;;;
InitFunc_CinematicSpriteObject_NintendoScrollingText:
    LDA.W #$0081 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0070 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0200 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $9D5D: Instruction - trigger title sequence scene 1 ;;;
Instruction_TriggerTitleSequenceScene1:
    SEP #$20
    LDA.B #$11 : STA.B DP_MainScreenLayers
    REP #$20
    LDA.W #CinematicFunction_TitleSequenceScene1_PanningLeft_Upper : STA.W CinematicFunction
    LDA.W #$0060 : STA.W Mode7TransformationZoomLevel
    LDA.W #$002C : STA.W CinematicBG1_XPosition
    STZ.W CinematicBG1_XSubPosition
    LDA.W #$FF65 : STA.W CinematicBG1_YPosition
    STZ.W CinematicBG1_YSubPosition
    LDA.W #$FFFE : STA.W CinematicBG1_XSpeed
    LDA.W #$8000 : STA.W CinematicBG1_XSubSpeed
    RTS


;;; $9D90: Cinematic function - title sequence - scene 1 - panning left - upper ;;;
CinematicFunction_TitleSequenceScene1_PanningLeft_Upper:
    LDA.W CinematicBG1_XSubPosition : CLC : ADC.W CinematicBG1_XSubSpeed : STA.W CinematicBG1_XSubPosition
    LDA.W CinematicBG1_XPosition : ADC.W CinematicBG1_XSpeed : STA.W CinematicBG1_XPosition
    CMP.W #$FF50 : BPL .titleScreenCheck
    SEP #$20
    LDA.B #$10 : STA.B DP_MainScreenLayers
    REP #$20
    LDA.W #RTS_8B9A47 : STA.W CinematicFunction
    LDY.W #CinematicSpriteObjectDefinitions_TitleSequence_PresentsScrollingText
    JSR Spawn_CinematicSpriteObject_Y
    JSR Deactivate_TileSequence_BlueLight

  .titleScreenCheck:
    JSR SkipToTitleScreenCheck
    RTS


;;; $9DC3: Initialisation function - cinematic sprite object $A0FB ('PRESENTS' scrolling text) ;;;
InitFunc_CinematicSpriteObject_PresentsScrollingText:
    LDA.W #$0081 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0070 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0200 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $9DD6: Instruction - trigger title sequence scene 2 ;;;
Instruction_TriggerTitleSequenceScene2:
    SEP #$20
    LDA.B #$11 : STA.B DP_MainScreenLayers
    REP #$20
    LDA.W #CinematicFunction_TitleSequenceScene2_PanningDown : STA.W CinematicFunction
    LDA.W #$0060 : STA.W Mode7TransformationZoomLevel
    LDA.W #$FF4F : STA.W CinematicBG1_XPosition
    STZ.W CinematicBG1_XSubPosition
    LDA.W #$FF60 : STA.W CinematicBG1_YPosition
    STZ.W CinematicBG1_YSubPosition : STZ.W CinematicBG1_XSpeed : STZ.W CinematicBG1_XSubSpeed
    LDA.W #$0001 : STA.W CinematicBG1_YSpeed
    LDA.W #$8000 : STA.W CinematicBG1_YSubSpeed
    JSR Activate_TileSequence_BlueLight
    RTS


;;; $9E12: Cinematic function - title sequence - scene 2 - panning down ;;;
CinematicFunction_TitleSequenceScene2_PanningDown:
    LDA.W CinematicBG1_YSubPosition : CLC : ADC.W CinematicBG1_YSubSpeed : STA.W CinematicBG1_YSubPosition
    LDA.W CinematicBG1_YPosition : ADC.W CinematicBG1_YSpeed : STA.W CinematicBG1_YPosition
    CMP.W #$00A3 : BMI .titleScreenCheck
    SEP #$20
    LDA.B #$10 : STA.B DP_MainScreenLayers
    REP #$20
    LDA.W #RTS_8B9A47 : STA.W CinematicFunction
    LDY.W #CinematicSpriteObjectDefinitions_TitleSequence_Metroid3ScrollingText
    JSR Spawn_CinematicSpriteObject_Y
    JSR Deactivate_TileSequence_BlueLight

  .titleScreenCheck:
    JSR SkipToTitleScreenCheck
    RTS


;;; $9E45: Initialisation function - cinematic sprite object $A101 ('METROID 3' scrolling text) ;;;
InitFunc_CinematicSpriteObject_Metroid3ScrollingText:
    LDA.W #$0081 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0070 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0200 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $9E58: Instruction - trigger title sequence scene 3 ;;;
Instruction_TriggerTitleSequenceScene3:
    SEP #$20
    LDA.B #$11 : STA.B DP_MainScreenLayers
    REP #$20
    LDA.W #CinematicFunction_TitleSequenceScene3_ZoomingOut : STA.W CinematicFunction
    LDA.W #$0043 : STA.W Mode7TransformationZoomLevel
    STZ.W CinematicBG1_XPosition : STZ.W CinematicBG1_XSubPosition
    STZ.W CinematicBG1_YPosition : STZ.W CinematicBG1_YSubPosition
    STZ.W CinematicBG1_XSpeed : STZ.W CinematicBG1_XSubSpeed
    STZ.W CinematicBG1_YSpeed : STZ.W CinematicBG1_YSubSpeed
    PHY
    JSL Spawn_TitleSequenceGradient_HDMAObjects
    PLY
    RTS


;;; $9E8B: Cinematic function - title sequence - scene 3 - zooming out ;;;
CinematicFunction_TitleSequenceScene3_ZoomingOut:
    LDA.W NMI_FrameCounter : BIT.W #$0001 : BNE .return
    LDA.W Mode7TransformationZoomLevel : CMP.W #$0100 : BPL .finish
    INC : STA.W Mode7TransformationZoomLevel

  .return:
    RTS

  .finish:
    LDA.W #$0100 : STA.W Mode7TransformationZoomLevel
    LDA.W #RTS_8B9F28 : STA.W CinematicFunction
    LDY.W #CinematicSpriteObjectDefinitions_TitleSequence_SuperMetroidTitleLogo_FadeIn
    JSR Spawn_CinematicSpriteObject_Y
    RTS


;;; $9EB3: Initialisation function - cinematic sprite object $A107 (Super Metroid title logo - fade in) ;;;
InitFunc_CinematicSpriteObject_SuperMetroidTitleLogo_FadeIn:
    LDA.W #$0080 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0030 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0400 : STA.W CinematicSpriteObject_PaletteIndices,Y
    LDY.W #PaletteFXObjects_FadeInSuperMetroidTitleLogo
    JSL Spawn_PaletteFXObject
    RTS


;;; $9ECD: Instruction - fade in Nintendo copyright ;;;
Instruction_FadeInNintendoCopyright:
    PHY
    LDY.W #CinematicSpriteObjectDefinitions_TitleSequence_NintendoCopyright_FadeIn
    JSR Spawn_CinematicSpriteObject_Y
    PLY
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $9ED6: Initialisation function - cinematic sprite object $A10D (unused. Nintendo boot logo - fade in) ;;;
InitFunc_CinematicSpriteObject_UnusedNintendoBootLogo_FadeIn:
    LDA.W #$0080 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0051 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0200 : STA.W CinematicSpriteObject_PaletteIndices,Y
    LDY.W #PaletteFXObjects_FadeInNintendoBootLogoForUnusedCode
    JSL Spawn_PaletteFXObject
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9EF0: Instruction - use palette 0 and fade in Nintendo copyright ;;;
Instruction_UsePalette0_FadeInNintendoCopyright:
    LDA.W #$0000 : STA.W CinematicSpriteObject_PaletteIndices,X
    PHY
    LDY.W #CinematicSpriteObjectDefinitions_TitleSequence_NintendoCopyright_FadeIn
    JSR Spawn_CinematicSpriteObject_Y
    PLY
    RTS


;;; $9EFF: Initialisation function - cinematic sprite object $A113 (Nintendo copyright - fade in) ;;;
InitFunc_CinematicSpriteObject_NintendoCopyright_FadeIn:
    LDA.W #$0080 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$00C4 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0800 : STA.W CinematicSpriteObject_PaletteIndices,Y
    LDY.W #PaletteFXObjects_FadeInNintendoCopyright
    JSL Spawn_PaletteFXObject
    RTS


;;; $9F19: Instruction - start demo countdown ;;;
Instruction_StartDemoCountdown:
    PHY
    LDA.W #$0384 : STA.W DemoTimer
    LDA.W #CinematicFunction_TitleScreen : STA.W CinematicFunction
    PLY
    RTS


;;; $9F28: RTS ;;;
RTS_8B9F28:
    RTS


;;; $9F29: Cinematic function - title sequence - title screen ;;;
CinematicFunction_TitleScreen:
    DEC.W DemoTimer : BEQ .demo
    BPL .notDemo

  .demo:
    LDA.W #CinematicFunction_TransitionToDemos : STA.W CinematicFunction
    BRA .transition

  .notDemo:
    LDA.B DP_Controller1New : BIT.W #$9080 : BEQ .merge
    LDA.W #CinematicFunction_TransitionToFileSelectMenu : STA.W CinematicFunction

  .transition:
    LDA.W #$0002 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter

  .merge:
    JSR Debug_DisplayVersionInfo
    RTS


;;; $9F52: Cinematic function - title sequence - transition to file select menu ;;;
CinematicFunction_TransitionToFileSelectMenu:
    JSR Debug_DisplayVersionInfo
    JSR AdvanceSlowScreenFadeOut
    BCC .return
    JSL EnableNMI
    SEP #$20
    LDA.B #$01 : STA.B DP_BGModeSize
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    STZ.B DP_BG2XScroll : STZ.B DP_BG3XScroll
    STZ.B DP_BG2YScroll : STZ.B DP_BG3YScroll
    STZ.W Mode7TransformationAngle
    LDA.W #CinematicFunction_LoadTitleSequence : STA.W CinematicFunction
    JSL Disable_PaletteFXObjects
    JSL Clear_PaletteFXObjects
    LDA.W #MessageBoxIndex : DEC #2 : SEC : SBC.W #Mode7TransformationAngle : TAX

  .loopClearNonGameplayRAM:
    STZ.W Mode7TransformationAngle,X
    DEX #2 : BPL .loopClearNonGameplayRAM
    LDX.W #$01FE
    LDA.W #$0000

  .loopClearGradient:
    STA.L TitleScreenGradientColorMathSubScreenBackdropColorHDMATable,X
    DEX #2 : BPL .loopClearGradient
    LDA.W #$0004 : STA.W GameState
    STZ.W GameOptionsMenuIndex

  .return:
    RTS


;;; $9FAE: Cinematic function - title sequence - transition to demos ;;;
CinematicFunction_TransitionToDemos:
    JSR Debug_DisplayVersionInfo
    JSR AdvanceSlowScreenFadeOut
    BCC .return
    JSL EnableNMI
    SEP #$20
    LDA.B #$01 : STA.B DP_BGModeSize
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    STZ.B DP_BG2XScroll : STZ.B DP_BG3XScroll
    STZ.B DP_BG2YScroll : STZ.B DP_BG3YScroll
    STZ.W Mode7TransformationAngle
    LDA.W #CinematicFunction_LoadTitleSequence : STA.W CinematicFunction
    JSL Disable_PaletteFXObjects
    JSL Clear_PaletteFXObjects
    LDA.W #MessageBoxIndex : DEC #2 : SEC : SBC.W #Mode7TransformationAngle : TAX

  .loopClearNonGameplayRAM:
    STZ.W Mode7TransformationAngle,X
    DEX #2 : BPL .loopClearNonGameplayRAM
    LDX.W #$01FE
    LDA.W #$0000

  .loopClearGradient:
    STA.L TitleScreenGradientColorMathSubScreenBackdropColorHDMATable,X
    DEX #2 : BPL .loopClearGradient
    LDA.W #$0028 : STA.W GameState
    STZ.W DemoScene

  .return:
    RTS


;;; $A00A: Configure title screen gradient HDMA table ;;;
Configure_TitleScreen_GradientHDMATable:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W Mode7TransformationZoomLevel : AND.W #$00F0 : LSR #3 : TAX
    LDA.L TitleSequenceHDMATables,X : TAY
    PHB
    PEA.W TitleSequenceHDMATables>>8&$FF00 : PLB : PLB
    LDX.W #$0000

  .loop:
    LDA.W $0000,Y : STA.L TitleScreenGradientColorMathSubScreenBackdropColorHDMATable,X
    BEQ .return
    INY #2
    INX #2
    BRA .loop

  .return:
    PLB : PLB : PLP
    RTL


;;; $A03B: RTL ;;;
RTL_8BA03B:
    RTL


;;; $A03C: RTL ;;;
RTL_8BA03C:
    RTL


;;; $A03D: Instruction list - cinematic sprite object $A0EF ('1994' scrolling text) ;;;
InstList_CinematicSpriteObject_1994ScrollingText:
    dw $003C,$0000
    dw $0008,TitleSequenceSpritemaps_1
    dw $0008,TitleSequenceSpritemaps_19
    dw $0008,TitleSequenceSpritemaps_199
    dw $002D,TitleSequenceSpritemaps_1994
    dw Instruction_TriggerTitleSequenceScene0
    dw CinematicSpriteObject_Instruction_Delete


;;; $A055: Instruction list - cinematic sprite object $A0F5 ('NINTENDO' scrolling text) ;;;
InstList_CinematicSpriteObject_NintendoScrollingText:
    dw $0008,TitleSequenceSpritemaps_N
    dw $0008,TitleSequenceSpritemaps_NI
    dw $0008,TitleSequenceSpritemaps_NIN
    dw $0008,TitleSequenceSpritemaps_NINT
    dw $0008,TitleSequenceSpritemaps_NINTE
    dw $0008,TitleSequenceSpritemaps_NINTEN
    dw $0008,TitleSequenceSpritemaps_NINTEND
    dw $002D,TitleSequenceSpritemaps_NINTENDO
    dw Instruction_TriggerTitleSequenceScene1
    dw CinematicSpriteObject_Instruction_Delete


;;; $A079: Instruction list - cinematic sprite object $A0FB ('PRESENTS' scrolling text) ;;;
InstList_CinematicSpriteObject_PresentsScrollingText:
    dw $0008,TitleSequenceSpritemaps_P
    dw $0008,TitleSequenceSpritemaps_PR
    dw $0008,TitleSequenceSpritemaps_PRE
    dw $0008,TitleSequenceSpritemaps_PRES
    dw $0008,TitleSequenceSpritemaps_PRESE
    dw $0008,TitleSequenceSpritemaps_PRESEN
    dw $0008,TitleSequenceSpritemaps_PRESENT
    dw $002D,TitleSequenceSpritemaps_PRESENTS
    dw Instruction_TriggerTitleSequenceScene2
    dw CinematicSpriteObject_Instruction_Delete


;;; $A09D: Instruction list - cinematic sprite object $A101 ('METROID 3' scrolling text) ;;;
InstList_CinematicSpriteObject_Metroid3ScrollingText:
    dw $0008,TitleSequenceSpritemaps_M
    dw $0008,TitleSequenceSpritemaps_ME
    dw $0008,TitleSequenceSpritemaps_MET
    dw $0008,TitleSequenceSpritemaps_METR
    dw $0008,TitleSequenceSpritemaps_METRO
    dw $0008,TitleSequenceSpritemaps_METROI
    dw $0008,TitleSequenceSpritemaps_METROID
    dw $0008,TitleSequenceSpritemaps_METROID_
    dw $0078,TitleSequenceSpritemaps_METROID3
    dw Instruction_TriggerTitleSequenceScene3
    dw CinematicSpriteObject_Instruction_Delete


;;; $A0C5: Instruction list - cinematic sprite object $A107 (Super Metroid title logo - fade in) ;;;
InstList_CinematicSpriteObject_SuperMetroidTitleLogo_FadeIn:
    dw $0020,TitleSequenceSpritemaps_SuperMetroidTitleLogo
    dw Instruction_FadeInNintendoCopyright


;;; $A0CB: Instruction list - cinematic sprite object $A119 (Super Metroid title logo - immediate) ;;;
InstList_CinematicSpriteObject_SuperMetroidTitleLogo_Immediate:
    dw $0001,TitleSequenceSpritemaps_SuperMetroidTitleLogo
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_SuperMetroidTitleLogo_Immediate


if !FEATURE_KEEP_UNREFERENCED
;;; $A0D3: Instruction list - cinematic sprite object $A10D (unused. Nintendo boot logo - fade in) ;;;
InstList_CinematicSpriteObject_UnusedNintendoBootLogo_FadeIn:
    dw $0020,TitleSequenceSpritemaps_NintendoBootLogo
    dw Instruction_UsePalette0_FadeInNintendoCopyright


;;; $A0D9: Instruction list - cinematic sprite object $A11F (unused. Nintendo boot logo - immediate) ;;;
InstList_CinematicSpriteObject_UnusedNintendoBootLogo_Immediate:
    dw $0001,TitleSequenceSpritemaps_NintendoBootLogo
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_UnusedNintendoBootLogo_Immediate
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A0E1: Instruction list - cinematic sprite object $A113 (Nintendo copyright - fade in) ;;;
InstList_CinematicSpriteObject_NintendoCopyright_FadeIn:
    dw $0020,TitleSequenceSpritemaps_NintendoCopyright
    dw Instruction_StartDemoCountdown


;;; $A0E7: Instruction list - cinematic sprite object $A125 (Nintendo copyright - immediate) ;;;
InstList_CinematicSpriteObject_NintendoCopyright_Immediate:
    dw $0001,TitleSequenceSpritemaps_NintendoCopyright
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_NintendoCopyright_Immediate


;;; $A0EF: Cinematic sprite object definitions - title sequence ;;;
CinematicSpriteObjectDefinitions_TitleSequence:
  .1994ScrollingText:
    dw InitFunc_CinematicSpriteObject_1994ScrollingText                  ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_1994ScrollingText            ; Pre-instruction
    dw InstList_CinematicSpriteObject_1994ScrollingText                  ; Instruction list
  .NintendoScrollingText:
    dw InitFunc_CinematicSpriteObject_NintendoScrollingText              ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_NintendoScrollingText              ; Instruction list
  .PresentsScrollingText:
    dw InitFunc_CinematicSpriteObject_PresentsScrollingText              ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_PresentsScrollingText              ; Instruction list
  .Metroid3ScrollingText:
    dw InitFunc_CinematicSpriteObject_Metroid3ScrollingText              ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_Metroid3ScrollingText              ; Instruction list
  .SuperMetroidTitleLogo_FadeIn:
    dw InitFunc_CinematicSpriteObject_SuperMetroidTitleLogo_FadeIn       ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_SuperMetroidTitleLogo_FadeIn       ; Instruction list
if !FEATURE_KEEP_UNREFERENCED
  .UnusedNintendoBootLogo_FadeIn:
    dw InitFunc_CinematicSpriteObject_UnusedNintendoBootLogo_FadeIn      ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_UnusedNintendoBootLogo_FadeIn      ; Instruction list
endif ; !FEATURE_KEEP_UNREFERENCED
  .NintendoCopyright_FadeIn:
    dw InitFunc_CinematicSpriteObject_NintendoCopyright_FadeIn           ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_NintendoCopyright_FadeIn           ; Instruction list
  .SuperMetroidLogoImmediate:
    dw InitFunction_CinematicSpriteObject_SuperMetroidLogoImmediate      ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_SuperMetroidTitleLogo_Immediate    ; Instruction list
if !FEATURE_KEEP_UNREFERENCED
  .UnusedNintendoBootLogoImm:
    dw InitFunction_CinematicSpriteObject_UnusedNintendoBootLogoImm      ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_UnusedNintendoBootLogo_Immediate   ; Instruction list
endif ; !FEATURE_KEEP_UNREFERENCED
  .NintendoCopyrightImmediate:
    dw InitFunc_CinematicSpriteObject_NintendoCopyrightImmediate         ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_NintendoCopyright_Immediate        ; Instruction list


;;; $A12B: Mode 7 object instruction list - title sequence baby metroid ;;;
Mode7Object_InstList_TitleSequenceBabyMetroid_0:
    dw Instruction_LoadBabyMetroid_Colors0
    dw Mode7Objects_Instruction_TimerInY,$0002

Mode7Object_InstList_TitleSequenceBabyMetroid_1:
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_0
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_2
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw Mode7Objects_Instruction_DecrementTimer_GotoYIfNonZero
    dw Mode7Object_InstList_TitleSequenceBabyMetroid_1
    dw Instruction_PlayBabyMetroid_Cry1
    dw Instruction_LoadBabyMetroid_Colors1
    dw $0006,Mode7TransferData_TitleSequenceBabyMetroid_0
    dw Instruction_LoadBabyMetroid_Colors2
    dw $0005,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw Instruction_LoadBabyMetroid_Colors3
    dw $0004,Mode7TransferData_TitleSequenceBabyMetroid_2
    dw Instruction_LoadBabyMetroid_Colors2
    dw $0003,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw Instruction_LoadBabyMetroid_Colors1
    dw $0002,Mode7TransferData_TitleSequenceBabyMetroid_0
    dw Instruction_LoadBabyMetroid_Colors2
    dw $0003,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw Instruction_LoadBabyMetroid_Colors3
    dw $0004,Mode7TransferData_TitleSequenceBabyMetroid_2
    dw Instruction_LoadBabyMetroid_Colors2
    dw $0005,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw Instruction_LoadBabyMetroid_Colors1
    dw $0006,Mode7TransferData_TitleSequenceBabyMetroid_0
    dw Instruction_LoadBabyMetroid_Colors2
    dw $0007,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw Instruction_LoadBabyMetroid_Colors3
    dw $0008,Mode7TransferData_TitleSequenceBabyMetroid_2
    dw Instruction_LoadBabyMetroid_Colors2
    dw $0009,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw Instruction_LoadBabyMetroid_Colors0
    dw Mode7Objects_Instruction_TimerInY,$0004

Mode7Object_InstList_TitleSequenceBabyMetroid_2:
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_0
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_2
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw Mode7Objects_Instruction_DecrementTimer_GotoYIfNonZero
    dw Mode7Object_InstList_TitleSequenceBabyMetroid_2
    dw Instruction_PlayBabyMetroid_Cry2
    dw Instruction_LoadBabyMetroid_Colors1
    dw $0006,Mode7TransferData_TitleSequenceBabyMetroid_0
    dw Instruction_LoadBabyMetroid_Colors2
    dw $0005,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw Instruction_LoadBabyMetroid_Colors3
    dw $0004,Mode7TransferData_TitleSequenceBabyMetroid_2
    dw Instruction_LoadBabyMetroid_Colors2
    dw $0003,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw Instruction_LoadBabyMetroid_Colors1
    dw $0002,Mode7TransferData_TitleSequenceBabyMetroid_0
    dw Instruction_LoadBabyMetroid_Colors2
    dw $0003,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw Instruction_LoadBabyMetroid_Colors3
    dw $0004,Mode7TransferData_TitleSequenceBabyMetroid_2
    dw Instruction_LoadBabyMetroid_Colors2
    dw $0005,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw Instruction_LoadBabyMetroid_Colors1
    dw $0006,Mode7TransferData_TitleSequenceBabyMetroid_0
    dw Instruction_LoadBabyMetroid_Colors2
    dw $0007,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw Instruction_LoadBabyMetroid_Colors3
    dw $0008,Mode7TransferData_TitleSequenceBabyMetroid_2
    dw Instruction_LoadBabyMetroid_Colors2
    dw $0009,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw Instruction_LoadBabyMetroid_Colors0
    dw Mode7Objects_Instruction_TimerInY
    dw $0003

Mode7Object_InstList_TitleSequenceBabyMetroid_3:
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_0
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_2
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw Mode7Objects_Instruction_DecrementTimer_GotoYIfNonZero
    dw Mode7Object_InstList_TitleSequenceBabyMetroid_3
    dw Instruction_PlayBabyMetroid_Cry3
    dw Instruction_LoadBabyMetroid_Colors1
    dw $0006,Mode7TransferData_TitleSequenceBabyMetroid_0
    dw Instruction_LoadBabyMetroid_Colors2
    dw $0005,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw Instruction_LoadBabyMetroid_Colors3
    dw $0004,Mode7TransferData_TitleSequenceBabyMetroid_2
    dw Instruction_LoadBabyMetroid_Colors2
    dw $0003,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw Instruction_LoadBabyMetroid_Colors1
    dw $0002,Mode7TransferData_TitleSequenceBabyMetroid_0
    dw Instruction_LoadBabyMetroid_Colors2
    dw $0003,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw Instruction_LoadBabyMetroid_Colors3
    dw $0004,Mode7TransferData_TitleSequenceBabyMetroid_2
    dw Instruction_LoadBabyMetroid_Colors2
    dw $0005,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw Instruction_LoadBabyMetroid_Colors1
    dw $0006,Mode7TransferData_TitleSequenceBabyMetroid_0
    dw Instruction_LoadBabyMetroid_Colors2
    dw $0007,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw Instruction_LoadBabyMetroid_Colors3
    dw $0008,Mode7TransferData_TitleSequenceBabyMetroid_2
    dw Instruction_LoadBabyMetroid_Colors2
    dw $0009,Mode7TransferData_TitleSequenceBabyMetroid_1
    dw Mode7Objects_Instruction_GotoY
    dw Mode7Object_InstList_TitleSequenceBabyMetroid_0


;;; $A25B: Instruction - play baby metroid cry 1 ;;;
Instruction_PlayBabyMetroid_Cry1:
    LDA.W #$0023
    JSL QueueSound_Lib3_Max6
    RTS


;;; $A263: Instruction - play baby metroid cry 2 ;;;
Instruction_PlayBabyMetroid_Cry2:
    LDA.W #$0026
    JSL QueueSound_Lib3_Max6
    RTS


;;; $A26B: Instruction - play baby metroid cry 3 ;;;
Instruction_PlayBabyMetroid_Cry3:
    LDA.W #$0027
    JSL QueueSound_Lib3_Max6
    RTS


;;; $A273: Instruction - load baby metroid colours 0 ;;;
Instruction_LoadBabyMetroid_Colors0:
; BG palette colours 30h..3Fh = [$A2B7..D6]
    PHX
    LDX.W #$001E

  .loop:
    LDA.W TitleSequenceBabyMetroid_Colors_0,X : STA.L Palettes_BG12P3,X
    DEX #2 : BPL .loop
    PLX
    RTS


;;; $A284: Instruction - load baby metroid colours 1 ;;;
Instruction_LoadBabyMetroid_Colors1:
; BG palette colours 30h..3Fh = [$A2D7..F6]
    PHX
    LDX.W #$001E

  .loop:
    LDA.W TitleSequenceBabyMetroid_Colors_1,X : STA.L Palettes_BG12P3,X
    DEX #2 : BPL .loop
    PLX
    RTS


;;; $A295: Instruction - load baby metroid colours 2 ;;;
Instruction_LoadBabyMetroid_Colors2:
; BG palette colours 30h..3Fh = [$A2F7..A316]
    PHX
    LDX.W #$001E

  .loop:
    LDA.W TitleSequenceBabyMetroid_Colors_2,X : STA.L Palettes_BG12P3,X
    DEX #2 : BPL .loop
    PLX
    RTS


;;; $A2A6: Instruction - load baby metroid colours 3 ;;;
Instruction_LoadBabyMetroid_Colors3:
; BG palette colours 30h..3Fh = [$A317..36]
    PHX
    LDX.W #$001E

  .loop:
    LDA.W TitleSequenceBabyMetroid_Colors_3,X : STA.L Palettes_BG12P3,X
    DEX #2 : BPL .loop
    PLX
    RTS


;;; $A2B7: Title sequence baby metroid colours ;;;
; Game over baby metroid palettes are in bank $82
TitleSequenceBabyMetroid_Colors_0:
    db $00,$10,$F5,$6B,$41,$2E,$A1,$2D,$01,$2D,$5F,$5E,$3F,$18,$14,$10
    db $0A,$08,$04,$04,$9F,$4F,$D8,$3E,$12,$2E,$70,$6F,$FF,$7F,$E0,$5E

TitleSequenceBabyMetroid_Colors_1:
    db $00,$38,$F5,$6B,$E1,$06,$41,$06,$A1,$05,$5F,$5E,$3F,$18,$14,$10
    db $0A,$08,$04,$04,$9F,$4F,$D8,$3E,$12,$2E,$70,$6F,$FF,$7F,$E0,$5E

TitleSequenceBabyMetroid_Colors_2:
    db $00,$38,$F8,$77,$44,$13,$A4,$12,$04,$12,$BF,$6A,$9F,$24,$77,$1C
    db $6D,$14,$67,$10,$FF,$5B,$38,$4B,$72,$3A,$D3,$7B,$FF,$7F,$43,$6B

TitleSequenceBabyMetroid_Colors_3:
    db $00,$38,$FB,$7F,$A7,$1F,$07,$1F,$67,$1E,$1F,$77,$FF,$30,$DA,$28
    db $D0,$20,$CA,$1C,$FF,$67,$9B,$57,$D5,$46,$D6,$7B,$FF,$7F,$A6,$77


;;; $A337: Mode 7 transfer data - title sequence baby metroid ;;;
Mode7TransferData_TitleSequenceBabyMetroid_0:
    db $C0                                                               ; Control. C0h = write to VRAM tiles
    dl TitleBabyMetroidTiles                                             ; Source address
    dw $0100,$3800                                                       ; Size, Destination address (VRAM)
    db $80,$00                                                           ; VRAM address increment mode

Mode7TransferData_TitleSequenceBabyMetroid_1:
    db $C0                                                               ; Control. C0h = write to VRAM tiles
    dl TitleBabyMetroidTiles+$100                                        ; Source address
    dw $0100,$3800                                                       ; Size, Destination address (VRAM)
    db $80,$00                                                           ; VRAM address increment mode

Mode7TransferData_TitleSequenceBabyMetroid_2:
    db $C0                                                               ; Control. C0h = write to VRAM tiles
    dl TitleBabyMetroidTiles+$200                                        ; Source address
    dw $0100,$3800                                                       ; Size, Destination address (VRAM)
    db $80,$00                                                           ; VRAM address increment mode


;;; $A355: Mode 7 object - title sequence baby metroid ;;;
Mode7Object_TitleSequenceBabyMetroid:
    dw RTS_8B93D9
    dw RTS_8B93D9
    dw Mode7Object_InstList_TitleSequenceBabyMetroid_0


;;; $A35B: Game state 1Eh/22h/25h (intro / Ceres goes boom, Samus goes to Zebes / Ceres goes boom with Samus) ;;;
GameState_1E_22_25_Intro_CeresGoesBoom_SamusGoesToZebes_8B:
    PHP : PHB
    PHK : PLB
    REP #$30
    PEA .manualReturn-1
    JMP.W (CinematicFunction)

  .manualReturn:
    LDA.W CinematicSpriteObject_FrameCounter : BMI +
    INC : STA.W CinematicSpriteObject_FrameCounter

+   INC.W CinematicFrameCounter
    JSR HandleSamusDuringIntro
    JSR Handle_CinematicSpriteObjects
    JSR Handle_Mode7Objects
    JSR Handle_CinematicBGObjects
    JSR Handle_TextGlowObject
    JSL PaletteFXObject_Handler
    JSR DrawIntroSprites
    JSR HandleMode7TransformMatrixAndBG1Position
    PLB : PLP
    RTL


;;; $A38F: RTS ;;;
RTS_8BA38F:
    RTS


;;; $A390: RTS. Cinematic function - page 6 drawn ;;;
RTS_8BA390:
    RTS


;;; $A391: Cinematic function - nothing ;;;
CinematicFunction_Nothing:
; RTS_BackgroundFLickeringEffect has an RTS'd out background flickering effect
    JSR RTS_BackgroundFLickeringEffect
    RTS


;;; $A395: Cinematic function - intro - initial ;;;
CinematicFunction_Intro_Initial:
    JSR Setup_PPU_Intro
    STZ.B DP_IRQCmd : STZ.B DP_NextIRQCmd
    STZ.W AreaIndex
    LDA.W #$0010 : STA.W RoomWidthBlocks : STA.W RoomHeightBlocks
    JSL InitializeSamus
    JSL Update_Beam_Tiles_and_Palette
    LDA.W #$0384 : STA.W MaxMissiles : STA.W Missiles
    STZ.W IntroSamusDisplayFlag
    LDA.W #SamusDrawingHandler_Default : STA.W DrawingHandler
    JSR Reset_Button_Assignments_to_Default
    STZ.W SamusInvincibilityTimer : STZ.W SamusKnockbackTimer
    LDA.W #MessageBoxIndex : DEC #2 : SEC : SBC.W #Mode7TransformationAngle : TAX

  .loopClearNonGameplayRAM:
    STZ.W Mode7TransformationAngle,X
    DEX #2 : BPL .loopClearNonGameplayRAM
    LDX.W #$0000

  .loopPalettes:
    LDA.L Palettes_Intro,X : STA.L Palettes,X
    INX #2 : CPX.W #$0200 : BMI .loopPalettes
    LDA.W #Tiles_Intro_BG1_BG2>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Intro_BG1_BG2 : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl IntroBackgroundTiles
    LDA.W #Tiles_Font1_BG3>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Font1_BG3 : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl IntroFont1Tiles
    LDA.W #Intro_BG2_SamusHead_Tilemap>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Intro_BG2_SamusHead_Tilemap : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl IntroBG2SamusHeadTilemap
    LDA.W #Intro_BG1_MotherBrainsRoom_Tilemap>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Intro_BG1_MotherBrainsRoom_Tilemap : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl IntroBG1MotherBrainsRoomTilemap
    LDA.W #Tiles_Intro_Sprite>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Intro_Sprite : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl IntroSpriteTiles
    LDA.W #Intro_BG3_TheLastMetroidIsInCaptivity_Tilemap>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Intro_BG3_TheLastMetroidIsInCaptivity_Tilemap : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl IntroBG3TheLastMetroidTilemap
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$00 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl IntroBackgroundTiles
    dw $8000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$40 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl IntroFont1Tiles
    dw $0900
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$48 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl IntroBG2SamusHeadTilemap
    dw $0800
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$4C : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl IntroBG3TheLastMetroidTilemap
    dw $0800
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$50 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl IntroBG1MotherBrainsRoomTilemap
    dw $2000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$60 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl Tiles_Standard_Sprite_0
    dw $2000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$6E : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl IntroSpriteTiles
    dw $2400
    LDA.B #$02 : STA.W $420B
    REP #$30
    LDA.W #Tiles_Font2_BG3>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Font2_BG3 : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl IntroFont2Tiles
    JSL EnableNMI
    LDA.W #$0003 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter
    JSL Enable_HDMAObjects
    JSL Clear_PaletteFXObjects
    JSL Enable_PaletteFXObjects
    STZ.W DoorPointer
    STZ.W Layer1XPosition : STZ.W Layer1YPosition
    STZ.W CinematicSpriteObject_IntroJapanTextTimer
    LDX.W #$07FE

  .loopSamusHead:
    LDA.L IntroBG2SamusHeadTilemap,X : STA.L CinematicBGTilemap,X
    DEX #2 : BPL .loopSamusHead
    LDX.W #$00FE

  .loopJapanText:
    LDA.L InitialIntroJapanTextTilemap,X : STA.L CinematicBGTilemap_TopMarginInitialJapanText,X
    DEX #2 : BPL .loopJapanText
    LDA.W #$FFFF : STA.W CinematicSpriteObject_FrameCounter
    LDA.W #CinematicFunction_Intro_WaitForMusicQueue_FadeIn : STA.W CinematicFunction
    LDA.W #$0000
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$FF3F
    JSL QueueMusicDataOrTrack_8FrameDelay
    RTS


;;; $A5A7: Cinematic function - intro - wait for music queue and fade in ;;;
CinematicFunction_Intro_WaitForMusicQueue_FadeIn:
    JSL CheckIfMusicIsQueued
    BCS .return
    LDA.W #CinematicFunction_Intro_HandleDrawingInitialJapanText_Wait60f : STA.W CinematicFunction
    LDA.W #$0002 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter

  .return:
    RTS


;;; $A5BD: Cinematic function - intro - handle drawing initial Japanese text and wait 60 frames ;;;
CinematicFunction_Intro_HandleDrawingInitialJapanText_Wait60f:
    JSR AdvanceSlowScreenFadeIn
    BCC .return
    LDA.W #CinematicFunction_Intro_PlayTheLastMetroidMusicFor200Frames : STA.W CinematicFunction
    LDA.W #$003C : STA.W CinematicFunctionTimer
    LDA.W JapanText : BEQ .return
    LDX.W VRAMWriteStack
    LDA.W #$0100 : STA.B VRAMWrite.size,X
    INX #2
    LDA.W #CinematicBGTilemap_TopMarginInitialJapanText : STA.B VRAMWrite.size,X
    INX #2
    SEP #$20
    LDA.B #CinematicBGTilemap_TopMarginInitialJapanText>>16 : STA.B VRAMWrite.size,X
    REP #$20
    INX
    LDA.W #$4EE0 : STA.B VRAMWrite.size,X
    INX #2 : STX.W VRAMWriteStack

  .return:
    RTS


;;; $A5F8: Cinematic function - intro - play "the last Metroid is in captivity" music for 200 frames ;;;
CinematicFunction_Intro_PlayTheLastMetroidMusicFor200Frames:
    DEC.W CinematicFunctionTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #CinematicFunction_Intro_PlayGalaxyIsAtPeaceMusic : STA.W CinematicFunction
    LDA.W #$00C8 : STA.W CinematicFunctionTimer
    LDA.W #$0005
    JSL QueueMusicDataOrTrack_8FrameDelay

  .return:
    RTS


;;; $A613: Cinematic function - intro - queue "the galaxy is at peace" music ;;;
CinematicFunction_Intro_PlayGalaxyIsAtPeaceMusic:
    DEC.W CinematicFunctionTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #$0000
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$FF42
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$0005
    LDY.W #$000E
    JSL QueueMusicDataOrTrack_YFrameDelay
    LDA.W #CinematicFunction_Intro_WaitForMusicQueue_WaitFor240Frames : STA.W CinematicFunction

  .return:
    RTS


;;; $A639: Cinematic function - intro - wait for music queue and wait 240 frames ;;;
CinematicFunction_Intro_WaitForMusicQueue_WaitFor240Frames:
    JSL CheckIfMusicIsQueued
    BCS .return
    LDA.W #CinematicFunction_Intro_FadeOut : STA.W CinematicFunction
    LDA.W #$00F0 : STA.W CinematicFunctionTimer

  .return:
    RTS


;;; $A64C: Cinematic function - intro - fade out ;;;
CinematicFunction_Intro_FadeOut:
    DEC.W CinematicFunctionTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #CinematicFunction_Intro_WaitForFadeOut : STA.W CinematicFunction
    LDA.W #$0002 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter

  .return:
    RTS


;;; $A663: Cinematic function - intro - wait for fade out ;;;
CinematicFunction_Intro_WaitForFadeOut:
    JSR AdvanceSlowScreenFadeOut
    BCC .return
    LDA.W #CinematicFunction_Intro_SetupIntroTextPage1 : STA.W CinematicFunction

  .return:
    RTS


;;; $A66F: Cinematic function - intro - set up intro text page 1 ;;;
CinematicFunction_Intro_SetupIntroTextPage1:
    REP #$30
    JSR BlankOut_JapanText_Tiles
    SEP #$30
    LDA.B #$80 : STA.W $2116
    LDA.B #$41 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl IntroBG3JapanTextTiles
    dw $0600
    LDA.B #$02 : STA.W $420B
    LDA.B #$16 : STA.W $212C : STA.B DP_MainScreenLayers
    REP #$30
    LDA.W #$002F
    JSL Clear_CinematicBGObjects_CinematicBGTilemap
    JSL Enable_CinematicBGObjects
    JSL Enable_CinematicBGTilemap_Updates
    LDA.W #$4C00 : STA.W CinematicBGObject_VRAMAddr
    LDX.W #$00FE
    LDA.W #$3C29

  .loopTopBottomMargins:
    STA.L CinematicBGTilemap_TopMarginInitialJapanText,X : STA.L CinematicBGTilemap_BottomMargin,X
    DEX #2 : BPL .loopTopBottomMargins
    LDX.W #$0600
    LDY.W #$0000

  .loopJapanTextTilemap:
    LDA.W .IntroJapanTextTilemap,Y : STA.L CinematicBGTilemap_TopMarginInitialJapanText,X
    INY #2
    INX #2 : CPX.W #$0700 : BMI .loopJapanTextTilemap
    LDA.W #$1C29 : STA.L CinematicBGTilemap_BottomMargin+$1E : STA.L CinematicBGTilemap_BottomMargin+$20
    LDY.W #CinematicSpriteObjectDefinitions_IntroTextCaret
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$007F : STA.W CinematicFunctionTimer
    LDY.W #CinematicSpriteObjectDefinitions_SamusBlinking
    LDA.W #$4C00
    JSR Spawn_CinematicBGObject
    LDA.W #$0008 : STA.W CinematicBG1_YPosition
    STA.B DP_BG2YScroll : STA.B DP_BG3YScroll
    JSR Clear_EnglishText_Tilemap
    JSR RestIntroTextCaret
    LDA.W #$0000
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$FF36
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$0005
    LDY.W #$000E
    JSL QueueMusicDataOrTrack_YFrameDelay
    LDA.W #CineFunc_Intro_WaitForMusicQueue_FadeIn_SpawnIntroTextPage1 : STA.W CinematicFunction
    RTS

  .IntroJapanTextTilemap:
    dw $3C29,$3C29,$3C29,$3C29,$3030,$3031,$3032,$3033
    dw $3034,$3035,$3036,$3037,$3038,$3039,$303A,$303B
    dw $303C,$303D,$303E,$303F,$3040,$3041,$3042,$3043
    dw $3044,$3045,$3046,$3047,$3C29,$3C29,$3C29,$3C29
    dw $3C29,$3C29,$3C29,$3C29,$3060,$3061,$3062,$3063
    dw $3064,$3065,$3066,$3067,$3068,$3069,$306A,$306B
    dw $306C,$306D,$306E,$306F,$3070,$3071,$3072,$3073
    dw $3074,$3075,$3076,$3077,$3C29,$3C29,$3C29,$3C29
    dw $3C29,$3C29,$3C29,$3C29,$3048,$3049,$304A,$304B
    dw $304C,$304D,$304E,$304F,$3050,$3051,$3052,$3053
    dw $3054,$3055,$3056,$3057,$3058,$3059,$305A,$305B
    dw $305C,$305D,$305E,$305F,$3C29,$3C29,$3C29,$3C29
    dw $3C29,$3C29,$3C29,$3C29,$3078,$3079,$307A,$307B
    dw $307C,$307D,$307E,$307F,$3080,$3081,$3082,$3083
    dw $3084,$3085,$3086,$3087,$3088,$3089,$308A,$308B
    dw $308C,$308D,$308E,$308F,$3C29,$3C29,$3C29,$3C29


;;; $A82B: Cinematic function - intro - wait for music queue, fade in and spawn intro text page 1 ;;;
CineFunc_Intro_WaitForMusicQueue_FadeIn_SpawnIntroTextPage1:
    JSL CheckIfMusicIsQueued
    BCS .return
    LDA.W #CinematicFunction_Intro_WaitForFadeIn : STA.W CinematicFunction
    LDA.W #$0002 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter
    LDY.W #CinematicSpriteObjectDefinitions_IntroTextPage1
    LDA.W #$4C00
    JSR Spawn_CinematicBGObject

  .return:
    RTS


;;; $A84A: Cinematic function - intro - wait for fade in ;;;
CinematicFunction_Intro_WaitForFadeIn:
    JSR AdvanceSlowScreenFadeIn
    BCC .return
    LDA.W #CinematicFunction_Nothing : STA.W CinematicFunction

  .return:
    RTS


;;; $A856: Clear English text tilemap ;;;
Clear_EnglishText_Tilemap:
; $7E:3100..35FF = 002Fh
    PHX
    LDX.W #$0100
    LDA.W #$002F

  .loop:
    STA.L CinematicBGTilemap_EnglishTextRegion-$100,X
    INX #2 : CPX.W #$0600 : BMI .loop
    PLX
    RTS


;;; $A86A: Blank out Japanese text tiles ;;;
BlankOut_JapanText_Tiles:
    PHP
    REP #$30
    PHX : PHY
    LDX.W #$0000

  .loop:
    LDA.L IntroFont1Tiles+$290 : STA.L IntroBG3JapanTextTiles,X
    LDA.L IntroFont1Tiles+$292 : STA.L IntroBG3JapanTextTiles+2,X
    LDA.L IntroFont1Tiles+$294 : STA.L IntroBG3JapanTextTiles+4,X
    LDA.L IntroFont1Tiles+$296 : STA.L IntroBG3JapanTextTiles+6,X
    LDA.L IntroFont1Tiles+$298 : STA.L IntroBG3JapanTextTiles+8,X
    LDA.L IntroFont1Tiles+$29A : STA.L IntroBG3JapanTextTiles+$A,X
    LDA.L IntroFont1Tiles+$29C : STA.L IntroBG3JapanTextTiles+$C,X
    LDA.L IntroFont1Tiles+$29E : STA.L IntroBG3JapanTextTiles+$E,X
    TXA : CLC : ADC.W #$0010 : TAX
    CPX.W #$0600 : BMI .loop
    PLY : PLX : PLP
    RTS


;;; $A8C1: Initialisation function - cinematic sprite object $CE6D (intro text caret) ;;;
InitFunction_CinematicSpriteObject_IntroTextCaret:
    LDA.W #$0008 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0018 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0C00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $A8D4: RTS. Pre-instruction - cinematic sprite object $CE6D (intro text caret) ;;;
RTS_8BA8D4:
    RTS


;;; $A8D5: Initialisation function - cinematic sprite object $CE5B (metroid egg) ;;;
InitFunction_CinematicSpriteObject_MetroidEgg:
    LDA.W #$0070 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$009B : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0E00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $A8E8: Pre-instruction - cinematic sprite object $CE5B (metroid egg) ;;;
PreInstruction_CinematicSpriteObject_MetroidEgg:
    LDA.W SamusXPosition : CMP.W #$00A9 : BPL .return
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_MetroidEggHatching_0 : STA.W CinematicSpriteObject_InstListPointers,X
    LDA.W #RTS_8B93D9 : STA.W CinematicSpriteObject_PreInstructions,X

  .return:
    RTS


;;; $A903: Pre-instruction - metroid egg - delete after cross-fade ;;;
PreInstruction_MetroidEgg_DeleteAfterCrossFade:
; Used by cinematic sprite object $CE5B (metroid egg)
    LDA.W IntroCrossFadeTimer : BNE .return
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_CinematicSpriteObject_Delete : STA.W CinematicSpriteObject_InstListPointers,X
    STZ.W IntroSamusDisplayFlag

  .return:
    RTS


;;; $A918: Instruction - spawn metroid egg particles ;;;
Instruction_SpawnMetroidEggParticles:
    PHY
    LDA.W #$0000
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEggParticle1
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0001
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEggParticle2
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0002
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEggParticle3
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0003
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEggParticle4
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0004
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEggParticle5
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0005
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEggParticle6
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$000B
    JSL QueueSound_Lib2_Max6
    PLY
    RTS


;;; $A958: Initialisation function - cinematic sprite object $CECD/$CED3/$CED9/$CEDF/$CEE5/$CEEB (metroid egg particle) ;;;
InitFunction_CinematicSpriteObject_MetroidEggParticles:
    LDA.W CinematicSpriteObject_InitParam : STA.W CinematicSpriteObject_Timers,Y
    ASL #2 : TAX
    LDA.W .Xposition,X : CLC : ADC.W #$0010 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W .Yposition,X : CLC : ADC.W #$003B : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0E00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS

;        _________ X position - 10h
;       |      ___ Y position - 3Bh
;       |     |
  .Xposition:
    dw $005C
  .Yposition:
    dw       $0058
    dw $0063,$0058
    dw $0059,$005D
    dw $0060,$005B
    dw $0066,$005E
    dw $0063,$0060


;;; $A994: Pre-instruction - cinematic sprite object $CECD/$CED3/$CED9/$CEDF/$CEE5/$CEEB (metroid egg particle) ;;;
PreInstruction_CinematicSpriteObject_MetroidEggParticle:
    LDA.W CinematicSpriteObject_Timers,X : AND.W #$00FF : ASL #2 : TAY
    LDA.W CinematicSpriteObject_XSubPosition,X : CLC : ADC.W .Xvelocities+2,Y : STA.W CinematicSpriteObject_XSubPosition,X
    LDA.W CinematicSpriteObject_XPositions,X : ADC.W .Xvelocities,Y : STA.W CinematicSpriteObject_XPositions,X
    LDA.W CinematicSpriteObject_Timers,X : XBA : AND.W #$00FF : ASL #2 : TAY
    LDA.W CinematicSpriteObject_YSubPosition,X : CLC : ADC.W .Yvelocities+2,Y : STA.W CinematicSpriteObject_YSubPosition,X
    LDA.W CinematicSpriteObject_YPositions,X : ADC.W .Yvelocities,Y : STA.W CinematicSpriteObject_YPositions,X
    CMP.W #$00A8 : BMI .lessThanA8
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_CinematicSpriteObject_Delete : STA.W CinematicSpriteObject_InstListPointers,X
    RTS

  .lessThanA8:
    LDA.W CinematicSpriteObject_Timers,X : CLC : ADC.W #$0100 : STA.W CinematicSpriteObject_Timers,X
    RTS


  .Xvelocities:
; Indexed by [cinematic sprite object index] * 4
    dw $FFFF,$4000, $0000,$4000, $FFFF,$8000, $FFFF,$2000
    dw $0000,$8000, $0000,$2000

  .Yvelocities:
; Indexed by [cinematic sprite object index] * 4
    dw $FFFE,$0000, $FFFE,$C000, $FFFE,$A000, $FFFE,$8000
    dw $FFFE,$6000, $FFFE,$4000, $FFFE,$2000, $FFFF,$0000
    dw $FFFF,$C000, $FFFF,$A000, $FFFF,$8000, $FFFF,$6000
    dw $FFFF,$4000, $FFFF,$2000, $0000,$0000, $0000,$2000
    dw $0000,$4000, $0000,$6000, $0000,$8000, $0000,$A000
    dw $0000,$C000, $0000,$E000, $0001,$0000, $0001,$2000
    dw $0001,$4000, $0001,$6000, $0001,$8000, $0001,$A000
    dw $0001,$C000, $0001,$E000, $0002,$0000, $0002,$2000
    dw $0002,$4000, $0002,$6000, $0002,$8000, $0002,$A000
    dw $0002,$C000, $0002,$E000


;;; $AA9A: Initialisation function - cinematic sprite object $CEF1 (metroid egg slime drops) ;;;
InitFunction_CinematicSpriteObject_MetroidEggSlimeDrops:
    LDA.W CinematicSpriteObject_InitParam : STA.W CinematicSpriteObject_Timers,Y
    LDA.W CinematicSpriteObject_XPositions+$1A : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W CinematicSpriteObject_YPositions+$1A : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0E00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $AAB3: Pre-instruction - cinematic sprite object $CEF1 (metroid egg slime drops) ;;;
PreInstruction_CinematicSpriteObject_MetroidEggSlimeDrops:
    LDA.W CinematicSpriteObject_Timers,X : AND.W #$00FF : ASL #2 : TAY
    LDA.W CinematicSpriteObject_XSubPosition,X : CLC : ADC.W .Xvelocities+2,Y : STA.W CinematicSpriteObject_XSubPosition,X
    LDA.W CinematicSpriteObject_XPositions,X : ADC.W .Xvelocities,Y : STA.W CinematicSpriteObject_XPositions,X
    LDA.W CinematicSpriteObject_Timers,X : BIT.W #$0001 : BNE .nonZero
    XBA : AND.W #$00FF : ASL #2 : TAY
    LDA.W CinematicSpriteObject_YSubPosition,X : CLC : ADC.W .YvelocitiesEven+2,Y : STA.W CinematicSpriteObject_YSubPosition,X
    LDA.W CinematicSpriteObject_YPositions,X : ADC.W .YvelocitiesEven,Y : STA.W CinematicSpriteObject_YPositions,X
    CMP.W #$00A8 : BMI .notHitGround
    BRA +

  .nonZero:
    XBA : AND.W #$00FF : ASL #2 : TAY
    LDA.W CinematicSpriteObject_YSubPosition,X : CLC : ADC.W .YvelocitiesOdd+2,Y : STA.W CinematicSpriteObject_YSubPosition,X
    LDA.W CinematicSpriteObject_YPositions,X : ADC.W .YvelocitiesOdd,Y : STA.W CinematicSpriteObject_YPositions,X
    CMP.W #$00A8 : BMI .notHitGround

+   LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_MetroidEggParticle_HitGround : STA.W CinematicSpriteObject_InstListPointers,X
    LDA.W #RTS_8B93D9 : STA.W CinematicSpriteObject_PreInstructions,X
    RTS

  .notHitGround:
    LDA.W CinematicSpriteObject_Timers,X : CLC : ADC.W #$0100 : STA.W CinematicSpriteObject_Timers,X
    RTS

  .Xvelocities:
; Indexed by [cinematic sprite object index] * 4
    dw $FFFF,$0000, $FFFF,$8000, $0001,$0000, $0000,$8000
    dw $FFFF,$8000

  .YvelocitiesOdd:
; for odd index slime drops. Indexed by [cinematic sprite object counter] * 4
    dw $FFFE,$0000, $FFFE,$C000, $FFFE,$A000, $FFFE,$8000
    dw $FFFE,$6000, $FFFE,$4000, $FFFE,$2000, $FFFF,$0000
    dw $FFFF,$C000, $FFFF,$A000, $FFFF,$8000, $FFFF,$6000
    dw $FFFF,$4000, $FFFF,$2000, $0000,$0000, $0000,$2000
    dw $0000,$4000, $0000,$6000, $0000,$8000, $0000,$A000
    dw $0000,$C000, $0000,$E000, $0001,$0000, $0001,$2000
    dw $0001,$4000, $0001,$6000, $0001,$8000, $0001,$A000
    dw $0001,$C000, $0001,$E000, $0002,$0000, $0002,$2000
    dw $0002,$4000, $0002,$6000, $0002,$8000, $0002,$A000
    dw $0002,$C000, $0002,$E000, $0003,$0000, $0003,$2000
    dw $0003,$4000, $0003,$6000, $0003,$8000, $0003,$A000
    dw $0003,$C000, $0003,$E000, $0004,$0000, $0004,$2000
    dw $0004,$4000, $0004,$6000, $0004,$8000, $0004,$A000
    dw $0004,$C000, $0004,$E000, $0005,$0000, $0005,$2000
    dw $0005,$4000, $0005,$6000, $0005,$8000, $0005,$A000
    dw $0005,$C000, $0005,$E000

  .YvelocitiesEven:
;  for even index slime drops. Indexed by [cinematic sprite object counter] * 4
    dw $FFFD,$0000, $FFFD,$C000, $FFFD,$A000, $FFFD,$8000
    dw $FFFD,$6000, $FFFD,$4000, $FFFD,$2000, $FFFE,$0000
    dw $FFFE,$C000, $FFFE,$A000, $FFFE,$8000, $FFFE,$6000
    dw $FFFE,$4000, $FFFE,$2000, $FFFF,$0000, $FFFF,$C000
    dw $FFFF,$A000, $FFFF,$8000, $FFFF,$6000, $FFFF,$4000
    dw $FFFF,$2000, $0000,$0000, $0000,$2000, $0000,$4000
    dw $0000,$6000, $0000,$8000, $0000,$A000, $0000,$C000
    dw $0000,$E000, $0001,$0000, $0001,$2000, $0001,$4000
    dw $0001,$6000, $0001,$8000, $0001,$A000, $0001,$C000
    dw $0001,$E000, $0002,$0000, $0002,$2000, $0002,$4000
    dw $0002,$6000, $0002,$8000, $0002,$A000, $0002,$C000
    dw $0002,$E000, $0003,$0000, $0003,$2000, $0003,$4000
    dw $0003,$6000, $0003,$8000, $0003,$A000, $0003,$C000
    dw $0003,$E000, $0004,$0000, $0004,$2000, $0004,$4000
    dw $0004,$6000, $0004,$8000, $0004,$A000, $0004,$C000
    dw $0004,$E000, $0005,$0000, $0005,$2000, $0005,$4000
    dw $0005,$6000, $0005,$8000, $0005,$A000, $0005,$C000
    dw $0005,$E000


;;; $AD55: Initialisation function - cinematic sprite object $CE61 (baby metroid being delivered) ;;;
InitFunction_CinematicSpriteObject_BabyMetroidBeingDelivered:
    LDA.W #$0054 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$008B : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0C00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $AD68: Pre-instruction - cinematic sprite object $CE61 (baby metroid being delivered) ;;;
PreInst_CinematicSpriteObject_BabyMetroidBeingDelivered:
    LDA.W IntroCrossFadeTimer : BNE .crossFading
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_CinematicSpriteObject_Delete : STA.W CinematicSpriteObject_InstListPointers,X
    RTS

  .crossFading:
    LDA.W CinematicFunctionTimer : BIT.W #$0003 : BNE .return
    LDA.W CinematicBG1_XPosition : BEQ .return
    DEC : STA.W CinematicBG1_XPosition
    LDA.W CinematicSpriteObject_XPositions,X : INC : STA.W CinematicSpriteObject_XPositions,X

  .return:
    RTS


;;; $AD93: Initialisation function - cinematic sprite object $CE67 (baby metroid being examined) ;;;
InitFunction_CinematicSpriteObject_BabyMetroidBeingExamined:
    LDA.W #$0070 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$006F : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0C00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $ADA6: Pre-instruction - cinematic sprite object $CE67 (baby metroid being examined) ;;;
PreInst_CinematicSpriteObject_BabyMetroidBeingExamined:
    LDA.W IntroCrossFadeTimer : BNE .crossFading
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_CinematicSpriteObject_Delete : STA.W CinematicSpriteObject_InstListPointers,X
    RTS

  .crossFading:
    LDA.W CinematicFunctionTimer : BIT.W #$0003 : BNE .return
    LDA.W CinematicBG1_YPosition : CMP.W #$0008 : BPL .return
    INC : STA.W CinematicBG1_YPosition
    LDA.W CinematicSpriteObject_YPositions,X : DEC : STA.W CinematicSpriteObject_YPositions,X

  .return:
    RTS


;;; $ADD4: Instruction - set caret to blink ;;;
Instruction_SetCaretToBlink:
    LDA.W #InstList_IntroTextCaret_Blink : STA.W CinematicSpriteObject_InstListPointers+$1E
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers+$1E
    RTS


;;; $ADE1: Place intro text caret off-screen ;;;
PlaceIntroTextCaretOffScreen:
    LDA.W #$0008 : STA.W CinematicSpriteObject_XPositions+$1E
    LDA.W #$00F8 : STA.W CinematicSpriteObject_YPositions+$1E
    RTS


;;; $ADEE: Reset intro text caret ;;;
RestIntroTextCaret:
    LDA.W #$0008 : STA.W CinematicSpriteObject_XPositions+$1E
    LDA.W #$0018 : STA.W CinematicSpriteObject_YPositions+$1E
    LDA.W #InstList_CinematicSpriteObject_IntroTextCaret : STA.W CinematicSpriteObject_InstListPointers+$1E
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers+$1E
    RTS


;;; $AE07: Initialisation function - cinematic sprite object $CE73 (intro Japanese text next-page arrow) ;;;
InitFunc_CinematicSpriteObject_IntroJapanTextNextPageArrow:
    LDA.W #$0080 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$00D8 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0C00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $AE1A: Pre-instruction - cinematic sprite object $CE73 (intro Japanese text next-page arrow) ;;;
PreInst_CinematicSpriteObject_IntroJapanTextNextPageArrow:
    LDA.W CinematicSpriteObject_IntroJapanTextTimer : CMP.W #$003B : BNE +
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_IntroJapanTextNextPageArrow_Blink : STA.W CinematicSpriteObject_InstListPointers,X

+   LDA.W IntroCrossFadeTimer : CMP.W #$007F : BNE .return
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_CinematicSpriteObject_Delete : STA.W CinematicSpriteObject_InstListPointers,X

  .return:
    RTS


;;; $AE43: Instruction - handle creating Japanese text - page 1 ;;;
Instruction_HandleCreatingJapanText_Page1:
    STZ.W CinematicSpriteObject_IntroTextClickFlag
    LDA.W JapanText : BEQ .return
    PHB
    PEA Mode7Objects_IntroJapanText_Page1>>8&$FF00 : PLB : PLB
    PHY
    LDY.W #Mode7Objects_IntroJapanText_Page1
    JSR Spawn_Mode7Objects
    PLY
    PLB

  .return:
    RTS


;;; $AE5B: Instruction - spawn blinking markers and wait for input - page 1 ;;;
Instruction_SpawnBlinkingMarkers_WaitForInput_Page1:
    JSR Instruction_SetCaretToBlink
    LDA.W JapanText : BEQ .waitForInput
    PHB
    PEA CinematicSpriteObjectDefinitions_IntroJapanTextNextPageArrow>>8&$FF00 : PLB : PLB
    PHY
    LDY.W #CinematicSpriteObjectDefinitions_IntroJapanTextNextPageArrow
    JSR Spawn_CinematicSpriteObject_Y
    PLY
    PLB

  .waitForInput:
    LDA.W #CinematicFunction_Intro_WaitForInput_SetupMotherBrainFight : STA.W CinematicFunction
    RTS


;;; $AE79: Instruction - handle creating Japanese text - page 2 ;;;
Instruction_HandleCreatingJapanText_Page2:
    STZ.W CinematicSpriteObject_IntroTextClickFlag
    LDA.W JapanText : BEQ .return
    PHB
    PEA Mode7Objects_IntroJapanText_Page2_Subpage1>>8&$FF00 : PLB : PLB
    PHY
    LDY.W #Mode7Objects_IntroJapanText_Page2_Subpage1
    JSR Spawn_Mode7Objects
    PLY
    PLB

  .return:
    RTS


;;; $AE91: Instruction - spawn blinking markers and wait for input - page 2 ;;;
Instruction_SpawnBlinkingMarkers_WaitForInput_Page2:
    JSR Instruction_SetCaretToBlink
    LDA.W JapanText : BEQ .noJapanText
    PHB
    PEA Mode7Objects_IntroJapanText_Page2_Subpage2>>8&$FF00 : PLB : PLB
    PHY
    LDY.W #CinematicSpriteObjectDefinitions_IntroJapanTextNextPageArrow
    JSR Spawn_CinematicSpriteObject_Y
    PLY : PHY
    LDY.W #Mode7Objects_IntroJapanText_Page2_Subpage2
    JSR Spawn_Mode7Objects
    PLY : PLB
    RTS

  .noJapanText:
    LDA.W #CinematicFunc_Intro_WaitForInput_SetupBabyMetroidDiscovery : STA.W CinematicFunction
    RTS


;;; $AEB8: Cinematic function - intro - wait for input and set up old Mother Brain fight ;;;
CinematicFunction_Intro_WaitForInput_SetupMotherBrainFight:
    LDA.W CinematicSpriteObject_IntroJapanTextTimer : BEQ .timerExpired
    DEC : STA.W CinematicSpriteObject_IntroJapanTextTimer
    RTS

  .timerExpired:
    LDA.B DP_Controller1New : BNE .newInputs
    RTS

  .newInputs:
    SEP #$20
    LDA.B #$50 : STA.B DP_BG1TilemapAddrSize
    REP #$20
    LDA.W #$0002 : STA.W Pose
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    LDA.W PreviousPose : STA.W LastDifferentPose
    LDA.W PreviousPoseXDirection : STA.W LastDifferentPoseXDirection
    LDA.W Pose : STA.W PreviousPose
    LDA.W PoseXDirection : STA.W PreviousPoseXDirection
    LDA.W #$009B : STA.W SamusXPosition : STA.W SamusPreviousXPosition
    LDA.W #$0073 : STA.W SamusYPosition : STA.W SamusPreviousYPosition
    STZ.W CinematicBG1_XPosition
    LDA.W #$007F : STA.W IntroCrossFadeTimer
    LDY.W #CinematicSpriteObjectDefinitions_IntroMotherBrain
    STZ.B DP_Temp12
    JSR Spawn_CinematicSpriteObject_YToIndex12
    LDY.W #CinematicSpriteObjectDefinitions_RinkaSpawner
    JSR Spawn_CinematicSpriteObject_Y
    LDX.W #$0000

  .loopLevelData:
    LDA.L LevelData_OldMotherBrainRoomFromCutscene,X : STA.L LevelData,X
    INX #2 : CPX.W #$01C0 : BMI .loopLevelData
    LDX.W #$0000
    LDA.W #$0000

  .loopBTS:
    STA.L BTS,X
    INX #2 : CPX.W #$0200 : BMI .loopBTS
    LDA.W #$0001 : STA.W SelectedHUDItem
    LDA.W #SamusCurrentStateHandler_Demo : STA.W CurrentStateHandler
    LDA.W #SamusNewStateHandler_IntroDemo : STA.W NewStateHandler
    JSL Clear_DemoInput_RAM
    JSL Enable_DemoInput
    LDY.W #DemoInputObjects_Intro_OldMotherBrainFight
    JSL Load_DemoInputObject
    LDA.W #$FFFF : STA.W IntroSamusDisplayFlag
    JMP Setup_Intro_CrossFade_Into_SamusGameplay

    RTS


;;; $AF6C: Cinematic function - intro - wait for input and set up baby metroid discovery ;;;
CinematicFunc_Intro_WaitForInput_SetupBabyMetroidDiscovery:
    LDA.W CinematicSpriteObject_IntroJapanTextTimer : BEQ .timerExpired
    DEC : STA.W CinematicSpriteObject_IntroJapanTextTimer
    RTS

  .timerExpired:
    LDA.B DP_Controller1New : BNE .newInputs
    RTS

  .newInputs:
    SEP #$20
    LDA.B #$54 : STA.B DP_BG1TilemapAddrSize
    REP #$20
    LDA.W #$0020 : STA.W RoomWidthBlocks
    LDA.W #$0010 : STA.W RoomHeightBlocks
    LDA.W #$0002 : STA.W Pose
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    LDA.W PreviousPose : STA.W LastDifferentPose
    LDA.W PreviousPoseXDirection : STA.W LastDifferentPoseXDirection
    LDA.W Pose : STA.W PreviousPose
    LDA.W PoseXDirection : STA.W PreviousPoseXDirection
    LDA.W #$0178 : STA.W SamusXPosition : STA.W SamusPreviousXPosition
    LDA.W #$0093 : STA.W SamusYPosition : STA.W SamusPreviousYPosition
    STZ.W CinematicBG1_XPosition
    LDA.W #$007F : STA.W IntroCrossFadeTimer
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEgg
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_ConfusedBabyMetroid
    JSR Spawn_CinematicSpriteObject_Y
    STZ.W CinematicSpriteObject_FrameCounter
    LDX.W #$0000

  .loopLevelData:
    LDA.L LevelData_RoomWithBabyMetroidHatchingFromCutscene,X : STA.L LevelData,X
    INX #2 : CPX.W #$0300 : BMI .loopLevelData
    STZ.W SelectedHUDItem
    LDA.W #SamusCurrentStateHandler_Demo : STA.W CurrentStateHandler
    LDA.W #SamusNewStateHandler_IntroDemo : STA.W NewStateHandler
    JSL Clear_DemoInput_RAM
    JSL Enable_DemoInput
    LDY.W #DemoInputObjects_Intro_BabyMetroidDiscovery
    JSL Load_DemoInputObject
    LDA.W #$0001 : STA.W IntroSamusDisplayFlag
    BRA Setup_Intro_CrossFade_Into_SamusGameplay

    RTS


;;; $B018: Set up intro cross-fade into Samus gameplay ;;;
Setup_Intro_CrossFade_Into_SamusGameplay:
    SEP #$20
    LDA.B #$06 : STA.B DP_MainScreenLayers
    LDA.B #$11 : STA.B DP_SubScreenLayers
    LDA.B #$02 : STA.B DP_ColorMathA
    STZ.B DP_ColorMathB
    JSL SpawnIntroCutsceneCrossFade_HDMAObject
    REP #$20
    JSR PlaceIntroTextCaretOffScreen
    LDA.W #CinematicFunction_Intro_CrossFadeToSamusGameplay : STA.W CinematicFunction
    LDX.W #$0000

  .loopPalettes:
    LDA.L Palettes_Intro,X : STA.L FadingPalettes_Initial,X
    INX #2 : CPX.W #$0200 : BMI .loopPalettes
    JSR PaletteCrossFading_DecomposePaletteDataForFading
    LDX.W #$0028
    LDY.W #$0003
    JSR PaletteCrossFading_ClearYColorsStartingFromColorIndexX
    LDX.W #$00E0
    LDY.W #$0010
    JSR PaletteCrossFading_ClearYColorsStartingFromColorIndexX
    LDX.W #$0180
    LDY.W #$0020
    JSR PaletteCrossFading_ClearYColorsStartingFromColorIndexX
    LDX.W #$01E0
    LDY.W #$0010
    JSR PaletteCrossFading_ClearYColorsStartingFromColorIndexX
    JSR PaletteCrossFading_ComposeFadingPalettes
    RTS


;;; $B074: Instruction - handle creating Japanese text - page 3 ;;;
Instruction_HandleCreatingJapanText_Page3:
    STZ.W CinematicSpriteObject_IntroTextClickFlag
    LDA.W JapanText : BEQ .return
    PHB
    PEA Mode7Objects_IntroJapanText_Page3_Subpage1>>8&$FF00 : PLB : PLB
    PHY
    LDY.W #Mode7Objects_IntroJapanText_Page3_Subpage1
    JSR Spawn_Mode7Objects
    PLY
    PLB

  .return:
    RTS


;;; $B08C: Instruction - spawn blinking markers and wait for input - page 3 ;;;
Instruction_SpawnBlinkingMarkers_WaitForInput_Page3:
    JSR Instruction_SetCaretToBlink
    LDA.W JapanText : BEQ .waitForInput
    PHB
    PEA Mode7Objects_IntroJapanText_Page3_Subpage2>>8&$FF00 : PLB : PLB
    PHY
    LDY.W #CinematicSpriteObjectDefinitions_IntroJapanTextNextPageArrow
    JSR Spawn_CinematicSpriteObject_Y
    PLY : PHY
    LDY.W #Mode7Objects_IntroJapanText_Page3_Subpage2
    JSR Spawn_Mode7Objects
    PLY : PLB
    RTS

  .waitForInput:
    LDA.W #CinematicFunc_Intro_WaitForInput_SetupBabyMetroidDelivery
    STA.W CinematicFunction
    RTS


;;; $B0B3: Instruction - handle creating Japanese text - page 4 ;;;
Instruction_HandleCreatingJapanText_Page4:
    STZ.W CinematicSpriteObject_IntroTextClickFlag
    LDA.W JapanText : BEQ .return
    PHB
    PEA Mode7Objects_IntroJapanText_Page4_Subpage1>>8&$FF00 : PLB : PLB
    PHY
    LDY.W #Mode7Objects_IntroJapanText_Page4_Subpage1
    JSR Spawn_Mode7Objects
    PLY
    PLB

  .return:
    RTS


;;; $B0CB: Instruction - spawn blinking markers and wait for input - page 4 ;;;
Instruction_SpawnBlinkingMarkers_WaitForInput_Page4:
    JSR Instruction_SetCaretToBlink
    LDA.W JapanText : BEQ .waitForInput
    PHB
    PEA Mode7Objects_IntroJapanText_Page4_Subpage2>>8&$FF00 : PLB : PLB
    PHY
    LDY.W #CinematicSpriteObjectDefinitions_IntroJapanTextNextPageArrow
    JSR Spawn_CinematicSpriteObject_Y
    PLY : PHY
    LDY.W #Mode7Objects_IntroJapanText_Page4_Subpage2
    JSR Spawn_Mode7Objects
    PLY : PLB
    RTS

  .waitForInput:
    LDA.W #CinematicFunc_Intro_WaitForInput_SetupBabyMetroidExamined : STA.W CinematicFunction
    RTS


;;; $B0F2: Cinematic function - intro - wait for input and set up baby metroid being delivered ;;;
CinematicFunc_Intro_WaitForInput_SetupBabyMetroidDelivery:
    LDA.W CinematicSpriteObject_IntroJapanTextTimer : BEQ .timerExpired
    DEC : STA.W CinematicSpriteObject_IntroJapanTextTimer
    RTS

  .timerExpired:
    LDA.B DP_Controller1New : BEQ .return
    SEP #$20
    LDA.B #$58 : STA.B DP_BG1TilemapAddrSize
    REP #$20
    LDA.W #$0020 : STA.W CinematicBG1_XPosition
    LDA.W #$0008 : STA.W CinematicBG1_YPosition
    LDA.W #$007F : STA.W IntroCrossFadeTimer
    LDY.W #CinematicSpriteObjectDefinitions_BabyMetroidBeingDelivered
    JSR Spawn_CinematicSpriteObject_Y
    BRA SetupIntroCrossFadeIntoScientistCutscene

  .return:
    RTS


;;; $B123: Cinematic function - intro - wait for input and set up baby metroid being examined ;;;
CinematicFunc_Intro_WaitForInput_SetupBabyMetroidExamined:
    LDA.W CinematicSpriteObject_IntroJapanTextTimer : BEQ .timerExpired
    DEC : STA.W CinematicSpriteObject_IntroJapanTextTimer
    RTS

  .timerExpired:
    LDA.B DP_Controller1New : BEQ .return
    SEP #$20
    LDA.B #$5C : STA.B DP_BG1TilemapAddrSize
    REP #$20
    STZ.W CinematicBG1_XPosition
    LDA.W #$FFE8 : STA.W CinematicBG1_YPosition
    LDA.W #$007F : STA.W IntroCrossFadeTimer
    LDY.W #CinematicSpriteObjectDefinitions_BabyMetroidBeingExamined
    JSR Spawn_CinematicSpriteObject_Y
    BRA SetupIntroCrossFadeIntoScientistCutscene

  .return:
    RTS


;;; $B151: Set up intro cross-fade into scientist cutscene ;;;
SetupIntroCrossFadeIntoScientistCutscene:
    SEP #$20
    LDA.B #$06 : STA.B DP_MainScreenLayers
    LDA.B #$11 : STA.B DP_SubScreenLayers
    LDA.B #$02 : STA.B DP_ColorMathA
    STZ.B DP_ColorMathB
    JSL SpawnIntroCutsceneCrossFade_HDMAObject
    REP #$20
    JSR PlaceIntroTextCaretOffScreen
    LDA.W #CinematicFunction_Intro_CrossFadeToScientistCutscene : STA.W CinematicFunction
    LDX.W #$0000

  .loop:
    LDA.L Palettes_Intro,X : STA.L FadingPalettes_Initial,X
    INX #2 : CPX.W #$0200 : BMI .loop
    JSR PaletteCrossFading_DecomposePaletteDataForFading
    LDX.W #$0040
    LDY.W #$0010
    JSR PaletteCrossFading_ClearYColorsStartingFromColorIndexX
    LDX.W #$01C0
    LDY.W #$0009
    JSR PaletteCrossFading_ClearYColorsStartingFromColorIndexX
    JSR PaletteCrossFading_ComposeFadingPalettes
    RTS


;;; $B19B: Instruction - handle creating Japanese text - page 5 ;;;
Instruction_HandleCreatingJapanText_Page5:
    STZ.W CinematicSpriteObject_IntroTextClickFlag
    LDA.W JapanText : BEQ .return
    PHB
    PEA Mode7Objects_IntroJaanText_Page5_Subpage1>>8&$FF00 : PLB : PLB
    PHY
    LDY.W #Mode7Objects_IntroJaanText_Page5_Subpage1
    JSR Spawn_Mode7Objects
    PLY
    PLB

  .return:
    RTS


;;; $B1B3: Instruction - spawn blinking markers and wait for input - page 5 ;;;
Instruction_SpawnBlinkingMarkers_WaitForInput_Page5:
    JSR Instruction_SetCaretToBlink
    LDA.W JapanText : BEQ .waitForInput
    PHB
    PEA Mode7Objects_IntroJapanText_Page5_Subpage2>>8&$FF00 : PLB : PLB
    PHY
    LDY.W #CinematicSpriteObjectDefinitions_IntroJapanTextNextPageArrow
    JSR Spawn_CinematicSpriteObject_Y
    PLY : PHY
    LDY.W #Mode7Objects_IntroJapanText_Page5_Subpage2
    JSR Spawn_Mode7Objects
    PLY : PLB
    RTS

  .waitForInput:
    LDA.W #CinematicFunction_Intro_WaitForInput_ClearText : STA.W CinematicFunction
    RTS


;;; $B1DA: Cinematic function - intro - wait for input and clear text ;;;
CinematicFunction_Intro_WaitForInput_ClearText:
    JSR RTS_BackgroundFLickeringEffect
    LDA.W CinematicSpriteObject_IntroJapanTextTimer : BEQ .timerExpired
    DEC : STA.W CinematicSpriteObject_IntroJapanTextTimer
    RTS

  .timerExpired:
    LDA.B DP_Controller1New : BEQ .return
    LDA.W #$007F : STA.W IntroCrossFadeTimer
    LDA.W JapanText : BEQ CinematicFunction_Intro_Page6
    LDA.W #CinematicFunction_Intro_Page6 : STA.W CinematicFunction
    JSL Disable_CinematicBGTilemap_Updates
    JSR BlankOut_JapanText_Tiles
    JSR TransferJapanTextTilesToVRAM

  .return:
    RTS


;;; $B207: Cinematic function - intro - page 6 ;;;
CinematicFunction_Intro_Page6:
    JSL Enable_CinematicBGTilemap_Updates
    JSR Clear_EnglishText_Tilemap
    LDY.W #CinematicSpriteObjectDefinitions_IntroTextPage6
    LDA.W #$4C00
    JSR Spawn_CinematicBGObject
    LDA.W #RTS_8BA390 : STA.W CinematicFunction
    JSR RestIntroTextCaret
    LDA.W #$0000
    JSL QueueMusicDataOrTrack_8FrameDelay
    RTS


;;; $B228: Instruction - handle creating Japanese text - page 6 ;;;
Instruction_HandleCreatingJapanText_Page6:
    STZ.W CinematicSpriteObject_IntroTextClickFlag
    LDA.W JapanText : BEQ .return
    PHB
    PEA Mode7Objects_IntroJapanText_Page6>>8&$FF00 : PLB : PLB
    PHY
    LDY.W #Mode7Objects_IntroJapanText_Page6
    JSR Spawn_Mode7Objects
    PLY
    PLB

  .return:
    RTS


;;; $B240: Instruction - finish intro ;;;
Instruction_FinishIntro:
    LDA.W #CinematicFunction_Intro_Finish : STA.W CinematicFunction
    LDA.W #$0001 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter
    RTS


;;; $B250: Cinematic function - intro - cross-fade to Samus gameplay ;;;
CinematicFunction_Intro_CrossFadeToSamusGameplay:
; Cinematic function timer for this routine is set all the way up at $A6F0
    LDA.W CinematicFunctionTimer : BIT.W #$0003 : BNE .decTimer
    LDX.W #$0000
    LDY.W #$0014
    JSR PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX
    LDX.W #$0060
    LDY.W #$0010
    JSR PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX
    LDX.W #$01D2
    LDY.W #$0006
    JSR PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX
    LDX.W #$0028
    LDY.W #$0003
    JSR PaletteCrossFading_FadeInYColorsStartingFromColorIndexX
    LDX.W #$00E0
    LDY.W #$0010
    JSR PaletteCrossFading_FadeInYColorsStartingFromColorIndexX
    LDX.W #$0180
    LDY.W #$0020
    JSR PaletteCrossFading_FadeInYColorsStartingFromColorIndexX
    LDX.W #$01E0
    LDY.W #$0010
    JSR PaletteCrossFading_FadeInYColorsStartingFromColorIndexX
    JSR PaletteCrossFading_ComposeFadingPalettes

  .decTimer:
    DEC.W CinematicFunctionTimer : BPL .return
    SEP #$20
    LDA.B #$15 : STA.B DP_MainScreenLayers
    STZ.B DP_SubScreenLayers : STZ.B DP_ColorMathA
    REP #$20
    LDX.W #$0100
    LDA.W #$002F

  .loop:
    STA.L CinematicBGTilemap_TopMarginInitialJapanText,X
    INX #2 : CPX.W #$0600 : BMI .loop
    JSR BlankOut_JapanText_Tiles
    LDA.W #CinematicFunction_Nothing : STA.W CinematicFunction
    LDA.W IntroSamusDisplayFlag : BPL .return
    LDY.W #PaletteFXObjects_OldMotherBrainFightBackgroundLights
    JSL Spawn_PaletteFXObject

  .return:
    RTS


;;; $B2D2: Cinematic function - intro - cross-fade to scientist cutscene ;;;
CinematicFunction_Intro_CrossFadeToScientistCutscene:
    LDA.W CinematicFunctionTimer : BIT.W #$0003 : BNE .decTimer
    LDX.W #$0000
    LDY.W #$0014
    JSR PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX
    LDX.W #$0060
    LDY.W #$0010
    JSR PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX
    LDX.W #$01D2
    LDY.W #$0006
    JSR PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX
    LDX.W #$0040
    LDY.W #$0010
    JSR PaletteCrossFading_FadeInYColorsStartingFromColorIndexX
    LDX.W #$01C0
    LDY.W #$0009
    JSR PaletteCrossFading_FadeInYColorsStartingFromColorIndexX
    JSR PaletteCrossFading_ComposeFadingPalettes

  .decTimer:
    DEC.W CinematicFunctionTimer : BPL .return
    SEP #$20
    LDA.B #$15 : STA.B DP_MainScreenLayers
    STZ.B DP_SubScreenLayers : STZ.B DP_ColorMathA
    REP #$20
    LDX.W #$0100
    LDA.W #$002F

  .loopEnglishText:
    STA.L CinematicBGTilemap_TopMarginInitialJapanText,X
    INX #2 : CPX.W #$0600 : BMI .loopEnglishText
    JSR BlankOut_JapanText_Tiles
    LDA.W #CinematicFunction_Nothing : STA.W CinematicFunction

  .return:
    RTS


;;; $B336: Instruction - start intro page 2 ;;;
Instruction_StartIntroPage2:
    LDA.W #CinematicFunction_Intro_Page2 : STA.W CinematicFunction
    BRA ClearJapanTextTiles_DisableCinematicBGTilemapUpdates


;;; $B33E: Instruction - start intro page 3 ;;;
Instruction_StartIntroPage3:
    LDA.W #CinematicFunction_Intro_Page3 : STA.W CinematicFunction
    BRA ClearJapanTextTiles_DisableCinematicBGTilemapUpdates


;;; $B346: Instruction - start intro page 4 ;;;
Instruction_StartIntroPage4:
    LDA.W #CinematicFunction_Intro_Page4 : STA.W CinematicFunction
    BRA ClearJapanTextTiles_DisableCinematicBGTilemapUpdates


;;; $B34E: Instruction - start intro page 5 ;;;
Instruction_StartIntroPage5:
    LDA.W #CinematicFunction_Intro_Page5 : STA.W CinematicFunction
; fallthrough to ClearJapanTextTiles_DisableCinematicBGTilemapUpdates


;;; $B354: Clear Japanese text tiles and disable cinematic BG tilemap updates ;;;
ClearJapanTextTiles_DisableCinematicBGTilemapUpdates:
    JSL Disable_CinematicBGTilemap_Updates
    JSR BlankOut_JapanText_Tiles
    JSR TransferJapanTextTilesToVRAM
    RTS


;;; $B35F: Cinematic function - intro - page 2 ;;;
CinematicFunction_Intro_Page2:
    LDY.W #CinematicSpriteObjectDefinitions_IntroTextPage2
    LDA.W #$4C00
    JSR Spawn_CinematicBGObject
    LDA.W #CinematicFunction_Intro_CrossFadeFromSamusGameplay : STA.W CinematicFunction
    BRA Setup_Intro_CrossFade_Into_Text


;;; $B370: Cinematic function - intro - page 3 ;;;
CinematicFunction_Intro_Page3:
    LDY.W #CinematicSpriteObjectDefinitions_IntroTextPage3
    LDA.W #$4C00
    JSR Spawn_CinematicBGObject
    LDA.W #CinematicFunction_Intro_CrossFadeFromSamusGameplay : STA.W CinematicFunction
    BRA Setup_Intro_CrossFade_Into_Text


;;; $B381: Cinematic function - intro - page 4 ;;;
CinematicFunction_Intro_Page4:
    LDY.W #CinematicSpriteObjectDefinitions_IntroTextPage4
    LDA.W #$4C00
    JSR Spawn_CinematicBGObject
    LDA.W #CinematicFunction_Intro_CrossFadeFromScientistCutscene : STA.W CinematicFunction
    BRA Setup_Intro_CrossFade_Into_Text


;;; $B392: Cinematic function - intro - page 5 ;;;
CinematicFunction_Intro_Page5:
    LDY.W #CinematicSpriteObjectDefinitions_IntroTextPage5
    LDA.W #$4C00
    JSR Spawn_CinematicBGObject
    LDA.W #CinematicFunction_Intro_CrossFadeFromScientistCutscene : STA.W CinematicFunction
; fallthrough to Setup_Intro_CrossFade_Into_Text


;;; $B3A1: Set up intro cross-fade into text ;;;
Setup_Intro_CrossFade_Into_Text:
    SEP #$20
    LDA.B #$06 : STA.B DP_MainScreenLayers
    LDA.B #$11 : STA.B DP_SubScreenLayers
    LDA.B #$02 : STA.B DP_ColorMathA
    STZ.B DP_ColorMathB
    REP #$20
    LDX.W #$0000

  .loopPalettes:
    LDA.L Palettes_Intro,X : STA.L FadingPalettes_Initial,X
    INX #2 : CPX.W #$0200 : BMI .loopPalettes
    JSR PaletteCrossFading_DecomposePaletteDataForFading
    LDX.W #$0000
    LDY.W #$0010
    JSR PaletteCrossFading_ClearYColorsStartingFromColorIndexX
    LDX.W #$0060
    LDY.W #$0010
    JSR PaletteCrossFading_ClearYColorsStartingFromColorIndexX
    LDX.W #$01D2
    LDY.W #$0006
    JSR PaletteCrossFading_ClearYColorsStartingFromColorIndexX
    JSR PaletteCrossFading_ComposeFadingPalettes
    LDA.W #$007F : STA.W CinematicFunctionTimer
    JSL Enable_CinematicBGTilemap_Updates
    JSR RestIntroTextCaret
    RTS


;;; $B3F4: Cinematic function - intro - cross-fade from Samus gameplay ;;;
CinematicFunction_Intro_CrossFadeFromSamusGameplay:
    LDA.W IntroCrossFadeTimer : BIT.W #$0003 : BNE .decTimer
    LDX.W #$0000
    LDY.W #$0010
    JSR PaletteCrossFading_FadeInYColorsStartingFromColorIndexX
    LDX.W #$0060
    LDY.W #$0010
    JSR PaletteCrossFading_FadeInYColorsStartingFromColorIndexX
    LDX.W #$01D2
    LDY.W #$0006
    JSR PaletteCrossFading_FadeInYColorsStartingFromColorIndexX
    LDX.W #$0028
    LDY.W #$0003
    JSR PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX
    LDX.W #$00E0
    LDY.W #$0010
    JSR PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX
    LDX.W #$0180
    LDY.W #$0020
    JSR PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX
    LDX.W #$01E0
    LDY.W #$0010
    JSR PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX
    JSR PaletteCrossFading_ComposeFadingPalettes

  .decTimer:
    DEC.W IntroCrossFadeTimer : BPL .return
    SEP #$20
    LDA.B #$16 : STA.B DP_MainScreenLayers
    STZ.B DP_SubScreenLayers : STZ.B DP_ColorMathA : STZ.B DP_ColorMathB
    REP #$20
    LDA.W #CinematicFunction_Nothing : STA.W CinematicFunction

  .return:
    RTS


;;; $B458: Cinematic function - intro - cross-fade from scientist cutscene ;;;
CinematicFunction_Intro_CrossFadeFromScientistCutscene:
    LDA.W IntroCrossFadeTimer : BIT.W #$0003 : BNE .decTimer
    LDX.W #$0000
    LDY.W #$0010
    JSR PaletteCrossFading_FadeInYColorsStartingFromColorIndexX
    LDX.W #$0060
    LDY.W #$0010
    JSR PaletteCrossFading_FadeInYColorsStartingFromColorIndexX
    LDX.W #$01D2
    LDY.W #$0006
    JSR PaletteCrossFading_FadeInYColorsStartingFromColorIndexX
    LDX.W #$0040
    LDY.W #$0010
    JSR PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX
    LDX.W #$01C0
    LDY.W #$0009
    JSR PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX
    JSR PaletteCrossFading_ComposeFadingPalettes

  .decTimer:
    DEC.W IntroCrossFadeTimer : BPL .return
    SEP #$20
    LDA.B #$16 : STA.B DP_MainScreenLayers
    STZ.B DP_SubScreenLayers : STZ.B DP_ColorMathA : STZ.B DP_ColorMathB
    REP #$20
    LDX.W #$0000

  .loopPalettes:
    LDA.L Palettes_Intro_CrossFade,X : STA.L Palettes_SpriteP6,X
    INX #2 : CPX.W #$000E : BMI .loopPalettes
    LDA.W #CinematicFunction_Nothing : STA.W CinematicFunction

  .return:
    RTS


;;; $B4BC: Pre-instruction - cinematic BG object $CF63 (Samus blinking) ;;;
PreInstruction_CinematicBGObject_SamusBlinking:
; Switches Samus blinking pattern on page 6 to deadpan stare
    LDA.W CinematicFunction : CMP.W #CinematicFunction_Intro_Page6 : BEQ .notPage6
    CMP.W #RTS_8BA390 : BNE .return

  .notPage6:
    LDA.W #CinematicBGObjectInstLists_SamusBlinkingPage6 : STA.W CinematicBGObject_InstListPointers,X
    LDA.W #$0001 : STA.W CinematicBGObject_InstructionTimers,X
    LDA.W #RTS_8B93D9 : STA.W CinematicBGObject_PreInstructions,X

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $B4DC: Unused ;;;
UNUSED_CinematicBGObject_8BB4DC:
;; Parameters:
;;     X: Cinematic BG object index
    LDA.W CinematicSpriteObject_InstListPointers+$1E : CMP.W #InstList_IntroTextCaret_Blink : BMI .return
    LDA.W #$0001 : STA.W CinematicBGObject_InstructionTimers,X

  .return:
    RTS


;;; $B4EB: Unused. Instruction - load Japanese intro text - non-existent ;;;
UNUSED_Instruction_LoadIntroJapanText_NonExistent:
; Used by UNUSED_Mode7Objects_8BD43D
    PHY
    JSL Disable_CinematicBGTilemap_Updates
    LDA.L Palettes_Intro_nonExistentIntroText1 : STA.L Palettes_BG3P4HighlightedHUDItemBackgroundOutline
    LDA.L Palettes_Intro_nonExistentIntroText2 : STA.L Palettes_BG3P4HighlightedHUDItemBackground
    LDA.L Palettes_Intro_nonExistentIntroText3 : STA.L Palettes_BG3P4HighlightedHUDItemOutline
    LDY.W #InstList_Mode7Object_Page1
    JSR LoadJapanTextIntroTiles
    LDY.W #InstList_Mode7Object_Page1
    JSR LoadJapanTextIntroTiles
    JSR TransferJapanTextTilesToVRAM
    PLY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B519: Instruction - enable cinematic BG tilemap updates ;;;
Instruction_EnableCinematicBGTilemapUpdates:
    JSL Enable_CinematicBGTilemap_Updates
    RTS


;;; $B51E: Instruction - load Japanese intro text - page 1 ;;;
Instruction_LoadIntroJapanTextPage1:
    PHY
    JSL Disable_CinematicBGTilemap_Updates
    LDA.L Palettes_Intro_nonExistentIntroText1 : STA.L Palettes_BG3P4HighlightedHUDItemBackgroundOutline
    LDA.L Palettes_Intro_nonExistentIntroText2 : STA.L Palettes_BG3P4HighlightedHUDItemBackground
    LDA.L Palettes_Intro_nonExistentIntroText3 : STA.L Palettes_BG3P4HighlightedHUDItemOutline
    JSR BlankOut_JapanText_Tiles
    LDY.W #IntroJapanTextData_Page1_TopLine
    JSR LoadJapanTextIntroTiles
    LDY.W #IntroJapanTextData_Page1_BottomLine
    JSR LoadJapanTextIntroTiles
    JSR TransferJapanTextTilesToVRAM
    PLY
    RTS


;;; $B54F: Instruction - enable cinematic BG tilemap updates ;;;
Instruction_EnableCinematicBGTilemapUpdates_duplicate:
    JSL Enable_CinematicBGTilemap_Updates
    RTS


;;; $B554: Instruction - load Japanese intro text - page 2 - subpage 1 ;;;
Instruction_LoadIntroJapanTextPage2_Subpage1:
    PHY
    JSL Disable_CinematicBGTilemap_Updates
    LDA.L Palettes_Intro_nonExistentIntroText1 : STA.L Palettes_BG3P4HighlightedHUDItemBackgroundOutline
    LDA.L Palettes_Intro_nonExistentIntroText2 : STA.L Palettes_BG3P4HighlightedHUDItemBackground
    LDA.L Palettes_Intro_nonExistentIntroText3 : STA.L Palettes_BG3P4HighlightedHUDItemOutline
    JSR BlankOut_JapanText_Tiles
    LDY.W #IntroJapanTextData_Page2_Subpage1_TopLine
    JSR LoadJapanTextIntroTiles
    LDY.W #IntroJapanTextData_Page2_Subpage1_BottomLine
    JSR LoadJapanTextIntroTiles
    JSR TransferJapanTextTilesToVRAM
    PLY
    RTS


;;; $B585: Pre-instruction - mode 7 object $D40D (page 2 - subpage 2) ;;;
Instruction_LoadIntroJapanTextPage2_Subpage2:
    LDA.B DP_Controller1New
    BEQ .return
    LDA.W #InstList_EnableCinematicBGTilemapUpdates_Page2DoneInput : STA.W Mode7Object_InstListPointers,X
    LDA.W #$0001 : STA.W Mode7Object_InstructionTimers,X
    LDA.W #RTS_8B93D9 : STA.W Mode7Object_PreInstructions,X
    JSL Disable_CinematicBGTilemap_Updates
    JSR BlankOut_JapanText_Tiles
    LDY.W #IntroJapanTextData_Page2_Subpage2_TopLine
    JSR LoadJapanTextIntroTiles
    LDY.W #IntroJapanTextData_Page2_Subpage2_BottomLine
    JSR LoadJapanTextIntroTiles
    JSR TransferJapanTextTilesToVRAM
    LDA.W #$003C : STA.W CinematicSpriteObject_IntroJapanTextTimer

  .return:
    RTS


;;; $B5B8: Instruction - enable cinematic BG tilemap updates and page 2 done input ;;;
Instruction_EnableCinematicBGTilemapUpdates_Page2DoneInput:
    JSL Enable_CinematicBGTilemap_Updates
    LDA.W #CinematicFunc_Intro_WaitForInput_SetupBabyMetroidDiscovery : STA.W CinematicFunction
    RTS


;;; $B5C3: Instruction - load Japanese intro text - page 3 - subpage 1 ;;;
Instruction_LoadIntroJapanTextPage3_Subpage1:
    PHY
    JSL Disable_CinematicBGTilemap_Updates
    LDA.L Palettes_Intro_nonExistentIntroText1 : STA.L Palettes_BG3P4HighlightedHUDItemBackgroundOutline
    LDA.L Palettes_Intro_nonExistentIntroText2 : STA.L Palettes_BG3P4HighlightedHUDItemBackground
    LDA.L Palettes_Intro_nonExistentIntroText3 : STA.L Palettes_BG3P4HighlightedHUDItemOutline
    JSR BlankOut_JapanText_Tiles
    LDY.W #IntroJapanTextData_Page3_Subpage1
    JSR LoadJapanTextIntroTiles
    JSR TransferJapanTextTilesToVRAM
    PLY
    RTS


;;; $B5EE: Pre-instruction - mode 7 object $D419 (page 3 - subpage 2) ;;;
PreInstruction_LoadIntroJapanTextPage3_Subpage2:
    LDA.B DP_Controller1New : BEQ .return
    LDA.W #InstList_EnableCinematicBGTilemapUpdates_Page3DoneInput : STA.W Mode7Object_InstListPointers,X
    LDA.W #$0001 : STA.W Mode7Object_InstructionTimers,X
    LDA.W #RTS_8B93D9 : STA.W Mode7Object_PreInstructions,X
    JSL Disable_CinematicBGTilemap_Updates
    JSR BlankOut_JapanText_Tiles
    LDY.W #IntroJapanTextData_Page3_Subpage2
    JSR LoadJapanTextIntroTiles
    JSR TransferJapanTextTilesToVRAM
    LDA.W #$003C : STA.W CinematicSpriteObject_IntroJapanTextTimer

  .return:
    RTS


;;; $B61B: Instruction - enable cinematic BG tilemap updates and page 3 done input ;;;
Instruction_EnableCinematicBGTilemapUpdates_Page3DoneInput:
    JSL Enable_CinematicBGTilemap_Updates
    LDA.W #CinematicFunc_Intro_WaitForInput_SetupBabyMetroidDelivery : STA.W CinematicFunction
    RTS


;;; $B626: Instruction - load Japanese intro text - page 4 - subpage 1 ;;;
Instruction_LoadIntroJapanTextPage4_Subpage1:
    PHY
    JSL Disable_CinematicBGTilemap_Updates
    LDA.L Palettes_Intro_nonExistentIntroText1 : STA.L Palettes_BG3P4HighlightedHUDItemBackgroundOutline
    LDA.L Palettes_Intro_nonExistentIntroText2 : STA.L Palettes_BG3P4HighlightedHUDItemBackground
    LDA.L Palettes_Intro_nonExistentIntroText3 : STA.L Palettes_BG3P4HighlightedHUDItemOutline
    JSR BlankOut_JapanText_Tiles
    LDY.W #IntroJapanTextData_Page4_Subpage1_TopLine
    JSR LoadJapanTextIntroTiles
    LDY.W #IntroJapanTextData_Page4_Subpage1_BottomLine
    JSR LoadJapanTextIntroTiles
    JSR TransferJapanTextTilesToVRAM
    PLY
    RTS


;;; $B657: Pre-instruction - mode 7 object $D425 (page 4 - subpage 2) ;;;
PreInstruction_LoadIntroJapanTextPage4_Subpage2:
    LDA.B DP_Controller1New : BEQ .return
    LDA.W #InstList_EnableCinematicBGTilemapUpdates_Page4DoneInput : STA.W Mode7Object_InstListPointers,X
    LDA.W #$0001 : STA.W Mode7Object_InstructionTimers,X
    LDA.W #RTS_8B93D9 : STA.W Mode7Object_PreInstructions,X
    JSL Disable_CinematicBGTilemap_Updates
    JSR BlankOut_JapanText_Tiles
    LDY.W #IntroJapanTextData_Page4_Subpage2_TopLine
    JSR LoadJapanTextIntroTiles
    LDY.W #IntroJapanTextData_Page4_Subpage2_BottomLine
    JSR LoadJapanTextIntroTiles
    JSR TransferJapanTextTilesToVRAM
    LDA.W #$003C : STA.W CinematicSpriteObject_IntroJapanTextTimer

  .return:
    RTS


;;; $B68A: Instruction - enable cinematic BG tilemap updates and page 4 done input ;;;
Instruction_EnableCinematicBGTilemapUpdates_Page4DoneInput:
    JSL Enable_CinematicBGTilemap_Updates
    LDA.W #CinematicFunc_Intro_WaitForInput_SetupBabyMetroidExamined : STA.W CinematicFunction
    RTS


;;; $B695: Instruction - load Japanese intro text - page 5 - subpage 1 ;;;
Instruction_LoadIntroJapanTextPage5_Subpage1:
    PHY
    JSL Disable_CinematicBGTilemap_Updates
    LDA.L Palettes_Intro_nonExistentIntroText1 : STA.L Palettes_BG3P4HighlightedHUDItemBackgroundOutline
    LDA.L Palettes_Intro_nonExistentIntroText2 : STA.L Palettes_BG3P4HighlightedHUDItemBackground
    LDA.L Palettes_Intro_nonExistentIntroText3 : STA.L Palettes_BG3P4HighlightedHUDItemOutline
    JSR BlankOut_JapanText_Tiles
    LDY.W #IntroJapanTextData_Page5_Subpage1
    JSR LoadJapanTextIntroTiles
    JSR TransferJapanTextTilesToVRAM
    PLY
    RTS


;;; $B6C0: Pre-instruction - mode 7 object $D431 (page 5 - subpage 2) ;;;
PreInstruction_LoadIntroJapanTextPage5_Subpage2:
    LDA.B DP_Controller1New : BEQ .return
    LDA.W #InstList_EnableCinematicBGTilemapUpdates_Page5DoneInput : STA.W Mode7Object_InstListPointers,X
    LDA.W #$0001 : STA.W Mode7Object_InstructionTimers,X
    LDA.W #RTS_8B93D9 : STA.W Mode7Object_PreInstructions,X
    JSL Disable_CinematicBGTilemap_Updates
    JSR BlankOut_JapanText_Tiles
    LDY.W #IntroJapanTextData_Page5_Subpage2
    JSR LoadJapanTextIntroTiles
    JSR TransferJapanTextTilesToVRAM
    LDA.W #$003C : STA.W CinematicSpriteObject_IntroJapanTextTimer

  .return:
    RTS


;;; $B6ED: Instruction - enable cinematic BG tilemap updates and page 5 done input ;;;
Instruction_EnableCinematicBGTilemapUpdates_Page5DoneInput:
    JSL Enable_CinematicBGTilemap_Updates
    LDA.W #CinematicFunction_Intro_WaitForInput_ClearText : STA.W CinematicFunction
    RTS


;;; $B6F8: Instruction - load Japanese intro text - page 6 ;;;
Instruction_LoadIntroJapanTextPage6:
    PHY
    JSL Disable_CinematicBGTilemap_Updates
    JSR BlankOut_JapanText_Tiles
    LDY.W #IntroJapanTextData_Page6
    JSR LoadJapanTextIntroTiles
    JSR TransferJapanTextTilesToVRAM
    PLY
    RTS


;;; $B70B: Instruction - enable cinematic BG tilemap updates ;;;
Instruction_EnableCinematicBGTilemapUpdates_duplicate_again:
    JSL Enable_CinematicBGTilemap_Updates
    RTS


;;; $B710: RTS. Unused background flickering effect ;;;
RTS_BackgroundFLickeringEffect:
    RTS

    LDA.W NMI_FrameCounter : BIT.W #$0001 : BEQ .enableBG2
    SEP #$20
    LDA.B DP_MainScreenLayers : AND.B #$FD : STA.B DP_MainScreenLayers
    REP #$20
    RTS

  .enableBG2:
    SEP #$20
    LDA.B DP_MainScreenLayers : ORA.B #$02 : STA.B DP_MainScreenLayers
    REP #$20
    RTS


;;; $B72F: Cinematic function - intro - finish ;;;
CinematicFunction_Intro_Finish:
    JSL HandleFadingOut
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$80 : BNE .return
    JSL EnableNMI
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    STZ.B DP_BG2XScroll : STZ.B DP_BG3XScroll
    STZ.B DP_BG2YScroll : STZ.B DP_BG3YScroll
    STZ.W Mode7TransformationAngle
    LDA.W #MessageBoxIndex : DEC #2 : SEC : SBC.W #Mode7TransformationAngle : TAX

  .loop:
    STZ.W Mode7TransformationAngle,X
    DEX #2 : BPL .loop
    LDA.W #CinematicFunction_FlyToCeres_Initial : STA.W CinematicFunction
    JSR Recover_Previous_Button_Assignments
    STZ.W MaxMissiles : STZ.W Missiles

  .return:
    RTS


;;; $B773: Initialisation function - cinematic sprite object $CE55 (intro Mother Brain) ;;;
InitFunction_CinematicSpriteObject_IntroMotherBrain:
    LDA.W #$0038 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$006F : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0E00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $B786: Pre-instruction - cinematic sprite object $CE55 (intro Mother Brain) ;;;
PreInstruction_CinematicSpriteObject_IntroMotherBrain:
    JSR IntroMotherBrain_HurtFlashHandling
    LDY.W #$0008

  .loop:
    LDA.W SamusProjectile_Types,Y : AND.W #$0FFF : CMP.W #$0100 : BEQ .missile
    DEY #2 : BPL .loop
    RTS

  .missile:
    LDA.W SamusProjectile_XPositions,Y : CMP.W #$0054 : BPL .return
    PHX
    TYX
    JSL Kill_Projectile
    PLX
    LDA.W #$0008 : STA.W CinematicSpriteObject_XSubPosition,X
    LDA.W CinematicSpriteObject_Timers,X : INC : STA.W CinematicSpriteObject_Timers,X
    CMP.W #$0004 : BNE .return
    STZ.W CinematicSpriteObject_Timers,X
    LDA.W #PreInstruction_IntroMotherBrain_Exploding : STA.W CinematicSpriteObject_PreInstructions,X
    LDA.W #$0000
    LDY.W #CinematicSpriteObjectDefs_IntroMotherBrainExplosion_Small
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0001
    LDY.W #CinematicSpriteObjectDefs_IntroMotherBrainExplosion_Small
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0002
    LDY.W #CinematicSpriteObjectDefs_IntroMotherBrainExplosion_Small
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0000
    LDY.W #CinematicSpriteObjectDefs_IntroMotherBrainExplosion_Big
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0001
    LDY.W #CinematicSpriteObjectDefs_IntroMotherBrainExplosion_Big
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0002
    LDY.W #CinematicSpriteObjectDefs_IntroMotherBrainExplosion_Big
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0003
    LDY.W #CinematicSpriteObjectDefs_IntroMotherBrainExplosion_Big
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0004
    LDY.W #CinematicSpriteObjectDefs_IntroMotherBrainExplosion_Big
    JSR Spawn_CinematicSpriteObject_Y

  .return:
    RTS


;;; $B80F: Pre-instruction - intro Mother Brain - exploding ;;;
PreInstruction_IntroMotherBrain_Exploding:
    JSR IntroMotherBrain_HurtFlashHandling
    JSR IntroMotherBrain_ScreenShaking
    LDA.W CinematicSpriteObject_Timers,X : INC : STA.W CinematicSpriteObject_Timers,X
    CMP.W #$0080 : BMI .return
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_IntroMotherBrain_StartPage2_0 : STA.W CinematicSpriteObject_InstListPointers,X

  .return:
    RTS


;;; $B82E: Pre-instruction - intro Mother Brain - cross-fading ;;;
PreInstruction_IntroMotherBrain_CrossFading:
    JSR IntroMotherBrain_ScreenShaking
    LDA.W IntroCrossFadeTimer : BNE .return
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_CinematicSpriteObject_Delete : STA.W CinematicSpriteObject_InstListPointers,X
    STZ.W IntroSamusDisplayFlag

  .return:
    RTS


;;; $B846: Intro Mother Brain hurt flash handling ;;;
IntroMotherBrain_HurtFlashHandling:
    LDA.W CinematicSpriteObject_XSubPosition,X : BEQ .return
    BIT.W #$0001 : BNE +
    PHX
    LDX.W #$001E
    LDA.W #$7FFF

  .loopWhitePalette:
    STA.L Palettes_SpriteP7,X
    DEX #2 : BPL .loopWhitePalette
    PLX
    BRA .decFlashTimer

+   PHX
    LDX.W #$001E

  .loopPalette:
    LDA.L Palettes_Intro_MotherBrain,X : STA.L Palettes_SpriteP7,X
    DEX #2 : BPL .loopPalette
    PLX

  .decFlashTimer:
    DEC.W CinematicSpriteObject_XSubPosition,X

  .return:
    RTS


;;; $B877: Intro Mother Brain screen shaking ;;;
IntroMotherBrain_ScreenShaking:
    LDA.W CinematicFrameCounter : BIT.W #$0001 : BNE .subtract4
    LDA.W CinematicBG1_YPosition : CLC : ADC.W #$0004 : STA.W CinematicBG1_YPosition
    BRA .return

  .subtract4:
    LDA.W CinematicBG1_YPosition : SEC : SBC.W #$0004 : STA.W CinematicBG1_YPosition

  .return:
    RTS


;;; $B896: Initialisation function - cinematic sprite object $CF21 (intro rinka) ;;;
InitFunction_CinematicSpriteObject_IntroRinka:
    LDA.W CinematicSpriteObject_InitParam : STA.W CinematicSpriteObject_Timers,Y
    ASL : TAX
    LDA.W .Xposition,X : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W .Yposition,X : SEC : SBC.W #$0008 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0E00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS

  .Xposition:
    dw $0070,$00C0,$0080,$00E8

  .Yposition:
    dw $0050,$0040,$0038,$0058


;;; $B8C5: Instruction - start moving (intro rinka) ;;;
Instruction_StartMoving_IntroRinka:
    LDA.W CinematicSpriteObject_Timers,X : BNE .missesSamus
    LDA.W #PreInstruction_IntroRinka_Moving_HitsSamus : STA.W CinematicSpriteObject_PreInstructions,X
    RTS

  .missesSamus:
    LDA.W #PreInstruction_IntroRinka_Moving_MissesSamus : STA.W CinematicSpriteObject_PreInstructions,X
    RTS


;;; $B8D8: Pre-instruction - intro rinka - moving - hits Samus ;;;
PreInstruction_IntroRinka_Moving_HitsSamus:
; Cinematic sprite object 0 here is intro Mother Brain
    LDA.W CinematicSpriteObject_XSubPosition,X : CLC : ADC.W #$8000 : STA.W CinematicSpriteObject_XSubPosition,X
    LDA.W CinematicSpriteObject_XPositions,X : ADC.W #$0000 : STA.W CinematicSpriteObject_XPositions,X
    LDA.W CinematicSpriteObject_YSubPosition,X : CLC : ADC.W #$8000 : STA.W CinematicSpriteObject_YSubPosition,X
    LDA.W CinematicSpriteObject_YPositions,X : ADC.W #$0000 : STA.W CinematicSpriteObject_YPositions,X
    LDA.W SamusXPosition : SEC : SBC.W #$0005 : STA.B DP_Temp12
    LDA.W CinematicSpriteObject_XPositions,X : CLC : ADC.W #$0008 : CMP.B DP_Temp12 : BMI .exploding
    LDA.W #$000B : STA.W SamusInvincibilityTimer
    LDA.W #$000B : STA.W SamusKnockbackTimer
    LDA.W #$0001 : STA.W KnockbackXDirection
    BRA .delete

  .exploding:
    LDA.W CinematicSpriteObject_PreInstructions : CMP.W #PreInstruction_IntroMotherBrain_Exploding : BNE .return

  .delete:
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_CinematicSpriteObject_Delete : STA.W CinematicSpriteObject_InstListPointers,X

  .return:
    RTS


;;; $B93B: Pre-instruction - intro rinka - moving - misses Samus ;;;
PreInstruction_IntroRinka_Moving_MissesSamus:
; Cinematic sprite object 0 here is intro Mother Brain
    LDA.W CinematicSpriteObject_Timers,X : ASL : TAY
    LDA.W CinematicSpriteObject_XSubPosition,X : CLC : ADC.W #$8000 : STA.W CinematicSpriteObject_XSubPosition,X
    LDA.W CinematicSpriteObject_XPositions,X : ADC.W .Xvelocities,Y : STA.W CinematicSpriteObject_XPositions,X
    LDA.W CinematicSpriteObject_YSubPosition,X : CLC : ADC.W #$8000 : STA.W CinematicSpriteObject_YSubPosition,X
    LDA.W CinematicSpriteObject_YPositions,X : ADC.W #$0000 : STA.W CinematicSpriteObject_YPositions,X
    CMP.W #$0010 : BMI .delete
    CMP.W #$00D0 : BPL .delete
    LDA.W CinematicSpriteObject_PreInstructions : CMP.W #PreInstruction_IntroMotherBrain_Exploding : BNE .return

  .delete:
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_CinematicSpriteObject_Delete : STA.W CinematicSpriteObject_InstListPointers,X

  .return:
    RTS

  .Xvelocities:
; X velocities - 0.8000h
    dw $0000,$FFFF,$0000,$FFFF


;;; $B98D: Initialisation function - cinematic sprite object $CF15 (intro Mother Brain explosion - big) ;;;
InitFunc_CinematicSpriteObject_IntroMotherBrainExplosion_Big:
    LDA.W CinematicSpriteObject_InitParam : STA.W CinematicSpriteObject_Timers,Y
    ASL : TAX
    LDA.W #$0038 : CLC : ADC.W .Xposition,X : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$006F : CLC : ADC.W .Yposition,X : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W .instructionTimer,X : STA.W CinematicSpriteObject_InstructionTimers,Y
    LDA.W #$0A00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS

  .Xposition:
    dw $0000,$0010,$FFF0,$FFF8,$0008

  .Yposition:
    dw $0000,$FFF0,$0008,$FFF0,$0008

  .instructionTimer:
    dw $0001,$0010,$0020,$0030,$0040


;;; $B9D4: Initialisation function - cinematic sprite object $CF1B (intro Mother Brain explosion - small) ;;;
InitFunc_CineSpriteObject_IntroMotherBrainExplosion_Small:
    LDA.W CinematicSpriteObject_InitParam : STA.W CinematicSpriteObject_Timers,Y
    ASL : TAX
    LDA.W #$0038 : CLC : ADC.W .Xposition,X : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$006F : CLC : ADC.W .Yposition,X : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W .instructionTimer,X : STA.W CinematicSpriteObject_InstructionTimers,Y
    LDA.W #$0A00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS

  .Xposition:
    dw $0010,$FFF0,$FFF0

  .Yposition:
    dw $0000,$0004,$FFF8

  .instructionTimer:
    dw $0001,$0008,$0010


;;; $BA0F: Pre-instruction - cinematic sprite object $CF15/$CF1B (intro Mother Brain explosion) ;;;
PreInst_CinematicSpriteObject_IntroMotherBrainExplosion:
    LDA.W IntroCrossFadeTimer : BNE .return
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_CinematicSpriteObject_Delete : STA.W CinematicSpriteObject_InstListPointers,X

  .return:
    RTS


;;; $BA21: Instruction - spawn intro rinkas 0/1 ;;;
Instruction_Spawn_IntroRinkas_0_1:
    PHY
    LDA.W #$0000
    LDY.W #CinematicSpriteObjectDefinitions_IntroRinka
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0001
    LDY.W #CinematicSpriteObjectDefinitions_IntroRinka
    JSR Spawn_CinematicSpriteObject_Y
    PLY
    RTS


;;; $BA36: Instruction - spawn intro rinkas 2/3 ;;;
Instruction_Spawn_IntroRinkas_2_3:
    PHY
    LDA.W #$0002
    LDY.W #CinematicSpriteObjectDefinitions_IntroRinka
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0003
    LDY.W #CinematicSpriteObjectDefinitions_IntroRinka
    JSR Spawn_CinematicSpriteObject_Y
    PLY
    RTS


;;; $BA4B: Initialisation function - cinematic sprite object $CE79 (confused baby metroid) ;;;
InitFunction_CinematicSpriteObject_ConfusedBabyMetroid:
    LDA.W #$0070 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$009B : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0E00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $BA5E: Pre-instruction - cinematic sprite object $CE79 (confused baby metroid) ;;;
PreInstruction_CinematicSpriteObject_ConfusedBabyMetroid:
; Cinematic sprite object ([X] + 1) here is metroid egg
    LDA.W CinematicSpriteObject_InstListPointers+2,X : CMP.W #InstList_MetroidEggHatching_2 : BMI .return
    LDA.W #PreInstruction_ConfusedBabyMetroid_Hatched : STA.W CinematicSpriteObject_PreInstructions,X
    STZ.W neverRead1A4D : STZ.W IntroBabyMetroidYVelocity

  .return:
    RTS


;;; $BA73: Pre-instruction - confused baby metroid - hatched ;;;
PreInstruction_ConfusedBabyMetroid_Hatched:
    LDA.W CinematicSpriteObject_YPositions,X : CMP.W #$0091 : BNE +
    LDA.W #$0000
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEggSlimeDrops
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0001
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEggSlimeDrops
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0002
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEggSlimeDrops
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0003
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEggSlimeDrops
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0023
    JSL QueueSound_Lib3_Max6

+   LDA.W SamusYPosition : SEC : SBC.W #$0020 : CMP.W CinematicSpriteObject_YPositions,X : BMI +
    LDA.W IntroBabyMetroidYVelocity : CMP.W #$0220 : BPL .setYVelocity
    CLC : ADC.W #$0020 : STA.W IntroBabyMetroidYVelocity
    BRA .setYVelocity

+   LDA.W IntroBabyMetroidYVelocity : CMP.W #$FDE1 : BMI .setYVelocity
    SEC : SBC.W #$0020 : STA.W IntroBabyMetroidYVelocity

  .setYVelocity:
    LDA.W IntroBabyMetroidYVelocity : XBA : PHA
    AND.W #$FF00 : STA.B DP_Temp14
    PLA : AND.W #$00FF : BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp12
    LDA.W CinematicSpriteObject_YSubPosition,X : CLC : ADC.B DP_Temp14 : STA.W CinematicSpriteObject_YSubPosition,X
    LDA.W CinematicSpriteObject_YPositions,X : ADC.B DP_Temp12 : STA.W CinematicSpriteObject_YPositions,X
    LDA.W IntroBabyMetroidYVelocity : BMI .return
    LDA.W #$0080 : STA.W IntroBabyMetroidIdleTimer
    LDA.W #PreInstruction_ConfusedBabyMetroid_Idling : STA.W CinematicSpriteObject_PreInstructions,X

  .return:
    RTS


;;; $BB0D: Pre-instruction - confused baby metroid - idling ;;;
PreInstruction_ConfusedBabyMetroid_Idling:
    DEC.W IntroBabyMetroidIdleTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #PreInstruction_ConfusedBabyMetroid_Dancing : STA.W CinematicSpriteObject_PreInstructions,X
    STZ.W IntroBabyMetroidIdleTimer : STZ.W IntroBabyMetroidYVelocity
    STZ.W CinematicSpriteObject_Timers,X

  .return:
    RTS


;;; $BB24: Pre-instruction - confused baby metroid - dancing ;;;
PreInstruction_ConfusedBabyMetroid_Dancing:
    LDA.W IntroCrossFadeTimer : BNE .timerExpired
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_CinematicSpriteObject_Delete : STA.W CinematicSpriteObject_InstListPointers,X
    STZ.W IntroSamusDisplayFlag
    RTS

  .timerExpired:
    LDA.W CinematicSpriteObject_Timers,X : CMP.W #$0080 : BPL +
    INC : STA.W CinematicSpriteObject_Timers,X
    BIT.W #$003F : BNE +
    LDA.W #$0023
    JSL QueueSound_Lib3_Max6

+   LDA.W SamusXPosition : CMP.W CinematicSpriteObject_XPositions,X : BMI .checkXposition
    LDA.W IntroBabyMetroidXVelocity : CMP.W #$0280 : BPL +
    CLC : ADC.W #$0020 : STA.W IntroBabyMetroidXVelocity
    BRA +

  .checkXposition:
    LDA.W IntroBabyMetroidXVelocity : CMP.W #$FD81 : BMI +
    SEC : SBC.W #$0020 : STA.W IntroBabyMetroidXVelocity

+   LDA.W IntroBabyMetroidXVelocity : XBA : PHA
    AND.W #$FF00 : STA.B DP_Temp14
    PLA : AND.W #$00FF : BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp12
    BPL .positive
    LDA.W #$0001 : STA.W IntroSamusDisplayFlag
    BRA .setXposition

  .positive:
    LDA.W #$FFFF : STA.W IntroSamusDisplayFlag

  .setXposition:
    LDA.W CinematicSpriteObject_XSubPosition,X : CLC : ADC.B DP_Temp14 : STA.W CinematicSpriteObject_XSubPosition,X
    LDA.W CinematicSpriteObject_XPositions,X : ADC.B DP_Temp12 : STA.W CinematicSpriteObject_XPositions,X
    LDA.W SamusYPosition : SEC : SBC.W #$0008 : CMP.W CinematicSpriteObject_YPositions,X : BMI .checkY
    LDA.W IntroBabyMetroidYVelocity : CMP.W #$0220 : BPL .setYvelocity
    CLC : ADC.W #$0020 : STA.W IntroBabyMetroidYVelocity
    BRA .setYvelocity

  .checkY:
    LDA.W IntroBabyMetroidYVelocity : CMP.W #$FDE1 : BMI .setYvelocity
    SEC : SBC.W #$0020 : STA.W IntroBabyMetroidYVelocity

  .setYvelocity:
    LDA.W IntroBabyMetroidYVelocity : XBA : PHA
    AND.W #$FF00 : STA.B DP_Temp14
    PLA : AND.W #$00FF : BIT.W #$0080 : BEQ .setYposition
    ORA.W #$FF00

  .setYposition:
    STA.B DP_Temp12
    LDA.W CinematicSpriteObject_YSubPosition,X : CLC : ADC.B DP_Temp14 : STA.W CinematicSpriteObject_YSubPosition,X
    LDA.W CinematicSpriteObject_YPositions,X : ADC.B DP_Temp12 : STA.W CinematicSpriteObject_YPositions,X
    RTS


;;; $BC08: Reset button assignments to default ;;;
Reset_Button_Assignments_to_Default:
    LDA.W #$0800 : STA.W UpBinding
    LDA.W #$0400 : STA.W DownBinding
    LDA.W #$0200 : STA.W LeftBinding
    LDA.W #$0100 : STA.W RightBinding
    LDA.W ShotBinding : STA.W BackupControllerBindingsDemo
    LDA.W JumpBinding : STA.W BackupControllerBindingsDemo+2
    LDA.W DashBinding : STA.W BackupControllerBindingsDemo+4
    LDA.W ItemCancelBinding : STA.W BackupControllerBindingsDemo+6
    LDA.W ItemSelectBinding : STA.W BackupControllerBindingsDemo+8
    LDA.W AimDownBinding : STA.W BackupControllerBindingsDemo+$A
    LDA.W AimUpBinding : STA.W BackupControllerBindingsDemo+$C
    LDA.W #$0040 : STA.W ShotBinding
    LDA.W #$0080 : STA.W JumpBinding
    LDA.W #$8000 : STA.W DashBinding
    LDA.W #$4000 : STA.W ItemCancelBinding
    LDA.W #$2000 : STA.W ItemSelectBinding
    LDA.W #$0020 : STA.W AimDownBinding
    LDA.W #$0010 : STA.W AimUpBinding
    RTS


;;; $BC75: Recover previous button assignments ;;;
Recover_Previous_Button_Assignments:
    LDA.W BackupControllerBindingsDemo : STA.W ShotBinding
    LDA.W BackupControllerBindingsDemo+2 : STA.W JumpBinding
    LDA.W BackupControllerBindingsDemo+4 : STA.W DashBinding
    LDA.W BackupControllerBindingsDemo+6 : STA.W ItemCancelBinding
    LDA.W BackupControllerBindingsDemo+8 : STA.W ItemSelectBinding
    LDA.W BackupControllerBindingsDemo+$A : STA.W AimDownBinding
    LDA.W BackupControllerBindingsDemo+$C : STA.W AimUpBinding
    RTS


;;; $BCA0: Cinematic function - fly to Ceres - initial ;;;
CinematicFunction_FlyToCeres_Initial:
    JSR Setup_PPU_CeresCutscene
    JSR Clear_CinematicSpriteObjects
    STZ.B DP_IRQCmd : STZ.B DP_NextIRQCmd
    LDX.W #$0000

  .loopPalettes:
    LDA.L Palettes_SpaceGunshipCeres,X : STA.L Palettes,X
    INX #2 : CPX.W #$0200 : BMI .loopPalettes
    LDA.W #Tiles_Gunship_Ceres_Mode7>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Gunship_Ceres_Mode7 : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl CeresGunshipMode7Tiles
    LDA.W #Gunship_Ceres_Tilemap>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Gunship_Ceres_Tilemap : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl CeresCutsceneTilemap_ShipFront
    LDA.W #Tiles_Space_Ceres>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Space_Ceres : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl SpaceCeresTiles
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$00 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$00,$19
    dl CeresGunshipMode7Tiles
    dw $4000
    LDA.B #$02 : STA.W $420B
    REP #$10
    STZ.W $2115 : STZ.W $2116 : STZ.W $2117
    LDX.W #$4000
    LDA.B #$8C

  .loop:
    STA.W $2118
    DEX : BNE .loop
    SEP #$10
    LDA.B #$00 : STA.W $2116
    LDA.B #$00 : STA.W $2117
    LDA.B #$00 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$00,$18
    dl CeresCutsceneTilemap_ShipFront
    dw $0300
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$60 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl SpaceCeresTiles
    dw $4000
    LDA.B #$02 : STA.W $420B
    REP #$30
    LDA.W #$0100 : STA.W $211B : STA.B DP_Mode7TransMatrixA
    STZ.W $211C : STZ.B DP_Mode7TransMatrixB
    STZ.W $211D : STZ.B DP_Mode7TransMatrixC
    STA.W $211E : STA.B DP_Mode7TransMatrixD
    LDA.W #$0038 : STA.W $211F : STA.B DP_Mode7TransOriginX
    LDA.W #$0018 : STA.W $2120 : STA.B DP_Mode7TransOriginY
    LDA.W #$FFB8 : STA.W CinematicBG1_XPosition
    LDA.W #$FF98 : STA.W CinematicBG1_YPosition
    LDA.W #$00E0 : STA.W Mode7TransformationAngle
    LDA.W #$0200 : STA.W Mode7TransformationZoomLevel
    JSL Clear_PaletteFXObjects
    JSL Enable_PaletteFXObjects
    LDA.W #$0000
    JSL Clear_CinematicBGObjects_CinematicBGTilemap
    LDA.W #$5C00 : STA.W CinematicBGObject_VRAMAddr
    JSL EnableNMI
    LDY.W #CinematicSpriteObjectDefinitions_CeresStars
    LDA.W #$0000
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #CinematicFunction_FlyToCeres_WaitForMusicQueue_EnableDisplay : STA.W CinematicFunction
    LDA.W #$FF2D
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$0005
    LDY.W #$000E
    JSL QueueMusicDataOrTrack_YFrameDelay
    RTS


;;; $BDE4: Cinematic function - fly to Ceres - wait for music queue and enable display ;;;
CinematicFunction_FlyToCeres_WaitForMusicQueue_EnableDisplay:
    JSL CheckIfMusicIsQueued
    BCS .return
    SEP #$20
    LDA.B #$0F : STA.B DP_Brightness
    REP #$20
    LDA.W #CinematicFunction_FlyToCeres_FlyingIntoCamera : STA.W CinematicFunction

  .return:
    RTS


;;; $BDF9: Cinematic function - fly to Ceres - flying into camera ;;;
CinematicFunction_FlyToCeres_FlyingIntoCamera:
    LDA.W Mode7TransformationZoomLevel : CMP.W #$0020 : BMI .zoomLessThan20
    SEC : SBC.W #$0010 : STA.W Mode7TransformationZoomLevel
    RTS

  .zoomLessThan20:
    SEP #$20
    STZ.B DP_ColorMathA
    LDA.B #$31 : STA.B DP_ColorMathB
    LDA.B #$3F : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.B #$5F : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$9F : STA.B DP_ColorMathSubScreenBackdropColor2
    REP #$20
    JSR Clear_CinematicSpriteObjects
    LDX.W #.transferData
    JSL QueueMode7Transfers
    LDA.W #$FFE0 : STA.W CinematicBG1_XPosition
    LDA.W #$FF80 : STA.W CinematicBG1_YPosition
    LDA.W #$0020 : STA.W Mode7TransformationAngle
    LDY.W #CinematicSpriteObjectDefs_CeresExplosionLargeAsteroids
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_CeresUnderAttack
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_CeresSmallAsteroids
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_CeresPurpleSpaceVortex
    LDA.W #$0001
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_CeresStars
    LDA.W #$0001
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #CinematicFunction_FlyToCeres_FlyingIntoCeres : STA.W CinematicFunction
    LDY.W #PaletteFXObjects_CutsceneGunshipEngineFlicker
    JSL Spawn_PaletteFXObject
    LDY.W #PaletteFXObjects_CutsceneCeresNavigationLights_SpriteCeres
    JSL Spawn_PaletteFXObject
    RTS

  .transferData:
; Mode 7 transfers data - back of gunship
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl CeresCutsceneTilemap_ShipBack                                     ; Source address
    dw $0300,$0000                                                       ; Size, Destination address (VRAM)
    db $00, $00                                                          ; VRAM address increment mode


;;; $BE7E: Initialisation function - cinematic sprite object $CF0F (Ceres stars) ;;;
InitFunction_CinematicSpriteObject_CeresStars:
    LDA.W CinematicSpriteObject_InitParam : BNE .nonZero
    LDA.W #$FC00 : STA.W CinematicSpriteObject_Timers,Y
    LDA.W #$0070 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0057 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0800 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS

  .nonZero:
    LDA.W #PreInstruction_CinematicSpriteObject_CeresPurpleSpaceVortex : STA.W CinematicSpriteObject_PreInstructions,Y
    LDA.W #$FFE0 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0057 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0800 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $BEB5: Pre-instruction - cinematic sprite object $CF0F (Ceres stars) ;;;
PreInstruction_CinematicSpriteObject_CeresStars:
    LDA.W CinematicFunction : CMP.W #CinematicFunction_FlyToCeres_FlyingIntoCamera : BEQ .flyingIntoCamera
    RTS

  .flyingIntoCamera:
    LDA.W CinematicSpriteObject_Timers,X : CLC : ADC.W #$0080 : STA.W CinematicSpriteObject_Timers,X
    XBA : PHA
    AND.W #$FF00 : STA.B DP_Temp14
    PLA : AND.W #$00FF : BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp12
    LDA.W CinematicSpriteObject_YSubPosition,X : CLC : ADC.B DP_Temp14 : STA.W CinematicSpriteObject_YSubPosition,X
    LDA.W CinematicSpriteObject_YPositions,X : ADC.B DP_Temp12 : STA.W CinematicSpriteObject_YPositions,X
    LDA.W CinematicSpriteObject_XSubPosition,X : CLC : ADC.B DP_Temp14 : STA.W CinematicSpriteObject_XSubPosition,X
    LDA.W CinematicSpriteObject_XPositions,X : ADC.B DP_Temp12 : STA.W CinematicSpriteObject_XPositions,X
    LDA.W CinematicBG1_XSubPosition : CLC : ADC.B DP_Temp14 : STA.W CinematicBG1_XSubPosition
    LDA.W CinematicBG1_XPosition : ADC.B DP_Temp12 : STA.W CinematicBG1_XPosition
    LDA.W CinematicBG1_YSubPosition : CLC : ADC.B DP_Temp14 : STA.W CinematicBG1_YSubPosition
    LDA.W CinematicBG1_YPosition : ADC.B DP_Temp12 : STA.W CinematicBG1_YPosition
    RTS


;;; $BF22: Initialisation function - cinematic sprite object $CF39 (Ceres explosion large asteroids) ;;;
InitFunc_CinematicSpriteObject_CeresExplosionLargeAsteroids:
    LDA.W #$0050 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$009F : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0800 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $BF35: Pre-instruction - cinematic sprite object $CF39 (Ceres explosion large asteroids) ;;;
PreInst_CinematicSpriteObject_CeresExplosionLargeAsteroids:
    LDA.W CinematicSpriteObject_XSubPosition,X : CLC : ADC.W #$4000 : STA.W CinematicSpriteObject_XSubPosition,X
    LDA.W CinematicSpriteObject_XPositions,X : ADC.W #$0000 : AND.W #$01FF : STA.W CinematicSpriteObject_XPositions,X
    RTS


;;; $BF4C: Initialisation function - cinematic sprite object $CE85 (Ceres under attack) ;;;
InitFunction_CinematicSpriteObject_CeresUnderAttack:
    LDA.W #$0074 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$00A0 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0C00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $BF5F: Pre-instruction - cinematic sprite object $CE85 (Ceres under attack) ;;;
PreInstruction_CinematicSpriteObject_CeresUnderAttack:
    LDA.W CinematicSpriteObject_XSubPosition,X : CLC : ADC.W #$1000 : STA.W CinematicSpriteObject_XSubPosition,X
    LDA.W CinematicSpriteObject_XPositions,X : ADC.W #$0000 : AND.W #$01FF : STA.W CinematicSpriteObject_XPositions,X
    RTS


;;; $BF76: Initialisation function - cinematic sprite object $CE8B (Ceres small asteroids) ;;;
InitFunction_CinematicSpriteObject_CeresSmallAsteroid:
    LDA.W #$0080 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0060 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0800 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $BF89: Pre-instruction - cinematic sprite object $CE8B (Ceres small asteroids) ;;;
PreInstruction_CinematicSpriteObject_CeresSmallAsteroid:
    LDA.W CinematicSpriteObject_XSubPosition,X : CLC : ADC.W #$0800 : STA.W CinematicSpriteObject_XSubPosition,X
    LDA.W CinematicSpriteObject_XPositions,X : ADC.W #$0000 : AND.W #$01FF : STA.W CinematicSpriteObject_XPositions,X
    RTS


;;; $BFA0: Initialisation function - cinematic sprite object $CE91 (Ceres purple space vortex) ;;;
InitFunction_CinematicSpriteObject_CeresPurpleSpaceVortex:
    LDA.W CinematicSpriteObject_InitParam : BNE .nonZero
    LDA.W #$0070 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #RTS_8BBFD9 : STA.W CinematicSpriteObject_PreInstructions,Y
    BRA +

  .nonZero:
    LDA.W #$00E0 : STA.W CinematicSpriteObject_XPositions,Y

+   LDA.W #$0057 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0800 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $BFC6: Pre-instruction - cinematic sprite object $CE91 (Ceres purple space vortex) ;;;
PreInstruction_CinematicSpriteObject_CeresPurpleSpaceVortex:
    LDA.W CinematicSpriteObject_XSubPosition,X : SEC : SBC.W #$2000 : STA.W CinematicSpriteObject_XSubPosition,X
    LDA.W CinematicSpriteObject_XPositions,X : SBC.W #$0000 : STA.W CinematicSpriteObject_XPositions,X
; fallthrough to RTS_8BBFD9


RTS_8BBFD9:
    RTS


;;; $BFDA: Cinematic function - fly to Ceres - flying into Ceres ;;;
CinematicFunction_FlyToCeres_FlyingIntoCeres:
    SEP #$20
    LDA.B DP_ColorMathSubScreenBackdropColor0 : SEC : SBC.B #$01 : STA.B DP_ColorMathSubScreenBackdropColor0
    CMP.B #$20 : BPL .color1
    LDA.B #$20 : STA.B DP_ColorMathSubScreenBackdropColor0

  .color1:
    LDA.B DP_ColorMathSubScreenBackdropColor1 : SEC : SBC.B #$01 : STA.B DP_ColorMathSubScreenBackdropColor1
    CMP.B #$40 : BPL .color2
    LDA.B #$40 : STA.B DP_ColorMathSubScreenBackdropColor1

  .color2:
    LDA.B DP_ColorMathSubScreenBackdropColor2 : SEC : SBC.B #$01 : STA.B DP_ColorMathSubScreenBackdropColor2
    CMP.B #$80 : BPL .zoomLessThanC00
    LDA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor2

  .zoomLessThanC00:
    REP #$20
    LDA.W CinematicBG1_XSubPosition : SEC : SBC.W #$2000 : STA.W CinematicBG1_XSubPosition
    LDA.W CinematicBG1_XPosition : SBC.W #$0000 : STA.W CinematicBG1_XPosition
    LDA.W Mode7TransformationZoomLevel : CMP.W #$0C00 : BPL .zoomLessThan2000
    CLC : ADC.W #$0010 : STA.W Mode7TransformationZoomLevel
    RTS

  .zoomLessThan2000:
    LDA.W Mode7TransformationZoomLevel : CMP.W #$2000 : BPL +
    CLC : ADC.W #$0020 : STA.W Mode7TransformationZoomLevel
    RTS

+   SEP #$20
    LDA.B #$11 : STA.B DP_MainScreenLayers
    LDA.B #$01 : STA.B DP_BGModeSize
    LDA.B #$00 : STA.B DP_Mode7Settings
    LDA.B #$5C : STA.B DP_BG1TilemapAddrSize
    LDA.B #$06 : STA.B DP_BGTilesAddr
    REP #$20
    LDA.W #$0100 : STA.W Mode7TransformationZoomLevel
    STZ.W Mode7TransformationAngle
    STZ.W CinematicBG1_XSubPosition : STZ.W CinematicBG1_XPosition
    STZ.W CinematicBG1_YSubPosition : STZ.W CinematicBG1_YPosition
    JSL Enable_CinematicBGObjects
    JSL Enable_CinematicBGTilemap_Updates
    LDY.W #CinematicSpriteObjectDefinitions_SpaceColony
    LDA.W #$5C00
    JSR Spawn_CinematicBGObject
    LDA.W #RTS_8BA38F : STA.W CinematicFunction
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $C083: Initialisation function - cinematic sprite object $CE97 (unused. Space colony text) ;;;
UNUSED_InitFunc_CinematicSpriteObject_SpaceColonyText_8BC083:
    LDA.W #$007C : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$00BA : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0000 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C096: Instruction - skip next instruction if English text ;;;
Instruction_SkipNextInstructionIfEnglishText:
    LDA.W JapanText : BNE .return
    TYA : CLC : ADC.W #$0006 : TAY

  .return:
    RTS


;;; $C0A2: Instruction - finish fly to Ceres ;;;
Instruction_FinishFlyToCeres:
    LDA.W #CinematicFunction_FlyToCeres_Finish : STA.W CinematicFunction
    LDA.W #$0001 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $C0B2: Initialisation function - cinematic sprite object $CE9D (unused. Space colony Japanese text) ;;;
UNUSED_InitFunc_CineSpriteObject_SpaceColonyJapanText_8BC0B2:
    LDA.W #$007C : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$00CC : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0000 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C0C5: Cinematic function - fly to Ceres - finish ;;;
CinematicFunction_FlyToCeres_Finish:
    JSL HandleFadingOut
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$80 : BNE .return
    JSL EnableNMI
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    STZ.B DP_BG2XScroll : STZ.B DP_BG3XScroll
    STZ.B DP_BG2YScroll : STZ.B DP_BG3YScroll
    STZ.W Mode7TransformationAngle
    LDA.W #MessageBoxIndex : DEC #2 : SEC : SBC.W #Mode7TransformationAngle : TAX

  .loop:
    STZ.W Mode7TransformationAngle,X
    DEX #2 : BPL .loop
    LDA.W #CinematicFunction_FlyToCeres_StartGameAtCeres : STA.W CinematicFunction

  .return:
    RTS


;;; $C100: Cinematic function - fly to Ceres - start game at Ceres ;;;
CinematicFunction_FlyToCeres_StartGameAtCeres:
    LDA.W #$001F : STA.L SRAMMirror_LoadingGameState : STA.W GameState
    LDA.W #$0006 : STA.W AreaIndex
    STZ.W LoadStationIndex
    LDA.W SaveSlotSelected
    JSL SaveToSRAM
    RTS


;;; $C11B: Cinematic function - Ceres goes boom - initial ;;;
CinematicFunction_CeresGoesBoom_Initial:
    LDX.W #$0008

  .wait:
    JSL WaitForNMI
    DEX : BPL .wait
    JSR Setup_PPU_CeresCutscene
    LDA.W #MessageBoxIndex : DEC #2 : SEC : SBC.W #Mode7TransformationAngle
    TAX

  .loop:
    STZ.W Mode7TransformationAngle,X
    DEX #2 : BPL .loop
    STZ.W DoorPointer : STZ.W Layer1XPosition : STZ.W Layer1YPosition
    LDX.W #$0000

  .loopPalettes:
    LDA.L Palettes_SpaceGunshipCeres,X : STA.L Palettes,X
    INX #2 : CPX.W #$0200 : BMI .loopPalettes
    LDA.W #Tiles_Gunship_Ceres_Mode7>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Gunship_Ceres_Mode7 : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl CeresGunshipMode7Tiles
    LDA.W #Gunship_Ceres_Tilemap>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Gunship_Ceres_Tilemap : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl CeresCutsceneTilemap_ShipFront
    LDA.W #Tiles_Space_Ceres>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Space_Ceres : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl SpaceCeresTiles
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$00 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$00,$19
    dl CeresGunshipMode7Tiles
    dw $4000
    LDA.B #$02 : STA.W $420B
    REP #$10
    STZ.W $2115 : STZ.W $2116 : STZ.W $2117
    LDX.W #$4000
    LDA.B #$8C

  .loopVRAM:
    STA.W $2118
    DEX : BNE .loopVRAM
    SEP #$10
    LDA.B #$00 : STA.W $2116
    LDA.B #$00 : STA.W $2117
    LDA.B #$00 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$00,$18
    dl CeresCutsceneTilemap_Ceres
    dw $0600
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$60 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl SpaceCeresTiles
    dw $4000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$60 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl Tiles_Standard_Sprite_0
    dw $1A00
    LDA.B #$02 : STA.W $420B
    REP #$30
    LDA.W #$0100 : STA.W $211B : STA.B DP_Mode7TransMatrixA
    STZ.W $211C : STZ.B DP_Mode7TransMatrixB
    STZ.W $211D : STZ.B DP_Mode7TransMatrixC
    STA.W $211E : STA.B DP_Mode7TransMatrixD
    LDA.W #$0034 : STA.W $211F : STA.B DP_Mode7TransOriginX
    LDA.W #$0030 : STA.W $2120 : STA.B DP_Mode7TransOriginY
    LDA.W #$FFD4 : STA.W CinematicBG1_XPosition
    LDA.W #$FF90 : STA.W CinematicBG1_YPosition
    STZ.W Mode7TransformationAngle
    LDA.W #$0100 : STA.W Mode7TransformationZoomLevel
    JSL Disable_HDMAObjects
    JSL Wait_End_VBlank_Clear_HDMA
    JSL Clear_PaletteFXObjects
    JSL Enable_PaletteFXObjects
    LDA.W #$002F
    JSL Clear_CinematicBGObjects_CinematicBGTilemap
    LDA.W #$0000 : STA.W CinematicBGObject_VRAMAddr
    LDY.W #CinematicSpriteObjectDefs_CeresUnderAttackLargeAsteroids
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_CeresSmallAsteroids
    LDA.W #$0002 : STA.B DP_Temp12
    JSR Spawn_CinematicSpriteObject_YToIndex12
    LDY.W #CinematicSpriteObjectDefinitions_CeresPurpleSpaceVortex
    STZ.B DP_Temp12
    LDA.W #$0000
    JSR Spawn_CinematicSpriteObject_YToIndex12
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosionSpawner
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #PaletteFXObjects_CutsceneCeresNavigationLights_BGCeres
    JSL Spawn_PaletteFXObject
    JSL EnableNMI
    LDA.W #$0001 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter
    LDA.W #CinematicFunction_CeresGoesBoom_WaitForMusicQueue : STA.W CinematicFunction
    LDA.W #$0000
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$FF2D
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W GameState : CMP.W #$0025 : BNE .notState25
    LDA.W #$0008
    LDY.W #$000E
    JSL QueueMusicDataOrTrack_YFrameDelay
    RTS

  .notState25:
    LDA.W #$0007
    LDY.W #$000E
    JSL QueueMusicDataOrTrack_YFrameDelay
    RTS


;;; $C2E4: Cinematic function - Ceres goes boom - wait for music queue ;;;
CinematicFunction_CeresGoesBoom_WaitForMusicQueue:
    JSL CheckIfMusicIsQueued
    BCS .return
    LDA.W #CinematicFunction_CeresGoesBoom_SmallCeresExplosion_FadingIn : STA.W CinematicFunction

  .return:
    RTS


;;; $C2F1: Cinematic function - Ceres goes boom - small Ceres explosions - fading in ;;;
CinematicFunction_CeresGoesBoom_SmallCeresExplosion_FadingIn:
    LDA.W CinematicBG1_YSubPosition : CLC : ADC.W #$1000 : STA.W CinematicBG1_YSubPosition
    LDA.W CinematicBG1_YPosition : ADC.W #$0000 : STA.W CinematicBG1_YPosition
    LDA.W CinematicBG1_XSubPosition : SEC : SBC.W #$4000 : STA.W CinematicBG1_XSubPosition
    LDA.W CinematicBG1_XPosition : SBC.W #$0000 : STA.W CinematicBG1_XPosition
    LDA.W Mode7TransformationZoomLevel : CLC : ADC.W #$0001 : STA.W Mode7TransformationZoomLevel
    JSL HandleFadingIn
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$0F : BNE .return
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    LDA.W #CinematicFunction_CeresGoesBoom_CeresExplosions : STA.W CinematicFunction
    LDA.W #$0001 : STA.W CinematicFunctionTimer
    STZ.W IntroCrossFadeTimer

  .return:
    RTS


;;; $C345: Cinematic function - Ceres goes boom - Ceres explosions ;;;
CinematicFunction_CeresGoesBoom_CeresExplosions:
    LDA.W CinematicBG1_YSubPosition : CLC : ADC.W #$1000 : STA.W CinematicBG1_YSubPosition
    LDA.W CinematicBG1_YPosition : ADC.W #$0000 : STA.W CinematicBG1_YPosition
    LDA.W CinematicBG1_XSubPosition : SEC : SBC.W #$4000 : STA.W CinematicBG1_XSubPosition
    LDA.W CinematicBG1_XPosition : SBC.W #$0000 : STA.W CinematicBG1_XPosition
    LDA.W Mode7TransformationZoomLevel : CMP.W #$0280 : BPL +
    CLC : ADC.W #$0001 : STA.W Mode7TransformationZoomLevel
    RTS

+   LDA.W CinematicBG1_XPosition : EOR.W #$FFFF : INC
    CLC : ADC.B DP_Mode7TransOriginX : STA.W SamusProjectile_PowerBombExplosionXPosition
    LDA.W CinematicBG1_YPosition : EOR.W #$FFFF : INC
    CLC : ADC.B DP_Mode7TransOriginY : STA.W SamusProjectile_PowerBombExplosionYPosition
    PHX : PHY : PHP : PHB
    JSL Enable_HDMAObjects
    JSL Spawn_PowerBombExplosion
    PLB : PLP : PLY : PLX
    SEP #$20
    LDA.B #$10 : STA.B DP_ColorMathA
    LDA.B #$37 : STA.B DP_ColorMathB
    REP #$20
    LDA.W #$0300 : STA.W Mode7TransformationZoomLevel
    LDA.W #$0000
    LDY.W #CinematicSpriteObjectDefinitions_CeresFinalExplosion
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W GameState : CMP.W #$0025 : BNE .notState25
    LDX.W #.mode7TransferData_clearCeresUpperHalf
    JSL QueueMode7Transfers
    BRA .clearCeresLowerHalf

  .notState25:
    LDX.W #.mode7TransferData_frontOfGunship
    JSL QueueMode7Transfers

  .clearCeresLowerHalf:
    LDX.W #.mode7TransferData_clearCeresLowerHalf
    JSL QueueMode7Transfers
    LDA.W #CinematicFunction_CeresGoesBoom_GunshipFlyingAway : STA.W CinematicFunction
    RTS

; Mode 7 transfers data
  .mode7TransferData_frontOfGunship:
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl CeresCutsceneTilemap_ShipFront                                    ; Source address
    dw $0300,$0000                                                       ; Size, Destination address (VRAM)
    db $00, $00                                                          ; VRAM address increment mode

  .mode7TransferData_clearCeresLowerHalf:
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl CeresCutsceneTilemap_ClearTilemap                                 ; Source address
    dw $0300,$0300                                                       ; Size, Destination address (VRAM)
    db $00, $00                                                          ; VRAM address increment mode

  .mode7TransferData_clearCeresUpperHalf:
    db $80                                                               ; Control. 80h = write to VRAM tilemap
    dl CeresCutsceneTilemap_ClearTilemap                                 ; Source address
    dw $0300,$0000                                                       ; Size, Destination address (VRAM)
    db $00, $00                                                          ; VRAM address increment mode


;;; $C404: Instruction - spawn Ceres explosions 1 ;;;
Instruction_SpawnCeresExplosions1:
    PHY
    LDA.W #$0000
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosion1
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0001
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosion1
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0002
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosion1
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0003
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosion1
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0004
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosion1
    JSR Spawn_CinematicSpriteObject_Y
    PLY
    RTS


;;; $C434: Initialisation function - cinematic sprite object $CEBB (Ceres explosion 1) ;;;
InitFunction_CinematicSpriteObject_CeresExplosion1:
    LDA.W CinematicSpriteObject_InitParam : STA.W CinematicSpriteObject_Timers,Y
    ASL : TAX
    LDA.W .timer,X : STA.W CinematicSpriteObject_InstructionTimers,Y
    LDA.W CinematicBG1_XPosition : EOR.W #$FFFF : INC
    CLC : ADC.B DP_Mode7TransOriginX : CLC : ADC.W .Xoffset,X : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W CinematicBG1_YPosition : EOR.W #$FFFF : INC
    CLC : ADC.B DP_Mode7TransOriginY : CLC : ADC.W .Yoffset,X : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0A00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS

  .timer:
    dw $0001,$0010,$0020,$0030,$0040
  .Xoffset:
    dw $0010,$FFF0,$0010,$FFF0,$0000
  .Yoffset:
    dw $FFF0,$0010,$0010,$FFF0,$0000


;;; $C489: Pre-instruction - Ceres explosion spawner - spawn Ceres explosion 2 every Ch frames ;;;
PreInst_CeresExplosionSpawner_SpawnExplosion2EveryCFrames:
    LDA.W CinematicFunction : CMP.W #CinematicFunction_CeresGoesBoom_GunshipFlyingAway : BNE .notGunshipFlyingAway
    LDA.W #RTS_8B93D9 : STA.W CinematicSpriteObject_PreInstructions,X
    RTS

  .notGunshipFlyingAway:
    DEC.W CinematicFunctionTimer : BEQ .spawn
    BPL .return

  .spawn:
    LDA.W CeresExplosion2OffsetIndex
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosion2
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$000C : STA.W CinematicFunctionTimer
    LDA.W CeresExplosion2OffsetIndex : INC : AND.W #$0007 : STA.W CeresExplosion2OffsetIndex

  .return:
    RTS


;;; $C4B9: Initialisation function - cinematic sprite object $CEC1 (Ceres explosion 2) ;;;
InitFunction_CinematicSpriteObject_CeresExplosion2:
    LDA.W CinematicSpriteObject_InitParam : STA.W CinematicSpriteObject_Timers,Y
    ASL #2 : TAX
    LDA.W CinematicBG1_XPosition : EOR.W #$FFFF : INC
    CLC : ADC.B DP_Mode7TransOriginX : CLC : ADC.W .Xoffset,X : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W CinematicBG1_YPosition : EOR.W #$FFFF : INC
    CLC : ADC.B DP_Mode7TransOriginY : CLC : ADC.W .Yoffset,X : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0A00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS

  .Xoffset:
    dw $000E
  .Yoffset:
    dw       $FFF8
    dw $0008,$000C
    dw $FFF0,$000C
    dw $FFF8,$FFF2
    dw $0000,$0000
    dw $0010,$000E
    dw $FFF4,$0004
    dw $FFF8,$FFF0


;;; $C50B: RTS ;;;
RTS_8BC50B:
    RTS


;;; $C50C: Instruction - spawn Ceres explosions 3 ;;;
Instruction_SpawnCeresExplosions3:
    PHY
    LDA.W #$0000
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosion3
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0001
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosion3
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0002
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosion3
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0003
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosion3
    JSR Spawn_CinematicSpriteObject_Y
    PLY
    RTS


;;; $C533: Initialisation function - cinematic sprite object $CEC7 (Ceres explosion 3) ;;;
InitFunction_CinematicSpriteObject_CeresExplosion3:
    LDA.W CinematicSpriteObject_InitParam : STA.W CinematicSpriteObject_Timers,Y
    ASL : TAX
    LDA.W .timer,X : STA.W CinematicSpriteObject_InstructionTimers,Y
    LDA.W CinematicBG1_XPosition : EOR.W #$FFFF : INC
    CLC : ADC.B DP_Mode7TransOriginX : CLC : ADC.W .Xoffset,X : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W CinematicBG1_YPosition : EOR.W #$FFFF : INC
    CLC : ADC.B DP_Mode7TransOriginY : CLC : ADC.W .Yoffset,X : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0A00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS

  .timer:
    dw $0001,$0004,$0008,$0010
  .Xoffset:
    dw $0008,$000C,$FFF8,$FFF4
  .Yoffset:
    dw $FFFC,$0008,$FFF6,$000C


;;; $C582: Pre-instruction - cinematic sprite object $CEBB/$CEC1/$CEC7/$CF2D (Ceres explosion) ;;;
PreInstruction_CinematicSpriteObject_CeresExplosion:
    LDA.W CinematicSpriteObject_YSubPosition,X : SEC : SBC.W #$1000 : STA.W CinematicSpriteObject_YSubPosition,X
    LDA.W CinematicSpriteObject_YPositions,X : SBC.W #$0000 : STA.W CinematicSpriteObject_YPositions,X
    LDA.W CinematicSpriteObject_XSubPosition,X : CLC : ADC.W #$4000 : STA.W CinematicSpriteObject_XSubPosition,X
    LDA.W CinematicSpriteObject_XPositions,X : ADC.W #$0000 : STA.W CinematicSpriteObject_XPositions,X
    RTS


;;; $C5A9: Initialisation function - cinematic sprite object $CF2D (Ceres final explosion) ;;;
InitFunction_CinematicSpriteObject_CeresFinalExplosion:
    LDA.W CinematicBG1_XPosition : EOR.W #$FFFF : INC
    CLC : ADC.B DP_Mode7TransOriginX : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W CinematicBG1_YPosition : EOR.W #$FFFF : INC
    CLC : ADC.B DP_Mode7TransOriginY : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0A00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $C5CA: Cinematic function - Ceres goes boom - gunship flying away ;;;
CinematicFunction_CeresGoesBoom_GunshipFlyingAway:
; This cinematic function is used even if Samus doesn't get away, just with the gunship tilemap unloaded ^_^;
    SEP #$20
    LDA.B #$10 : STA.B DP_ColorMathA
    LDA.B #$37 : STA.B DP_ColorMathB
    REP #$20
    LDA.W CinematicBG1_XSubPosition : CLC : ADC.W #$0000 : STA.W CinematicBG1_XSubPosition
    LDA.W CinematicBG1_XPosition : ADC.W #$0002 : STA.W CinematicBG1_XPosition
    LDA.W Mode7TransformationAngle : DEC : AND.W #$00FF : STA.W Mode7TransformationAngle
    LDA.W Mode7TransformationZoomLevel : CMP.W #$0010 : BMI .zoomLessThan10
    SEC : SBC.W #$0010 : STA.W Mode7TransformationZoomLevel
    RTS

  .zoomLessThan10:
    LDA.W #CinematicFunction_CeresGoesBoom_WaitC0Frames : STA.W CinematicFunction
    LDA.W #$00C0 : STA.W CinematicFunctionTimer
    RTS


;;; $C610: Cinematic function - Ceres goes boom - wait C0h frames ;;;
CinematicFunction_CeresGoesBoom_WaitC0Frames:
    DEC.W CinematicFunctionTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #$0001 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter
    LDA.W #CinematicFunction_CeresGoesBoom_FadeOut : STA.W CinematicFunction

  .return:
    RTS


;;; $C627: Cinematic function - Ceres goes boom - fade out ;;;
CinematicFunction_CeresGoesBoom_FadeOut:
; Similar to $82:8431/DCE0
    JSL HandleFadingOut
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$80 : BNE .return
    JSL EnableNMI
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    LDA.W GameState : CMP.W #$0025 : BEQ .gameState25
    LDA.W #CinematicFunction_FlyToZebes_Initial : STA.W CinematicFunction
    RTS

  .gameState25:
    LDA.W #$0000
    JSL QueueMusicDataOrTrack_8FrameDelay
    STZ.W SelectedHUDItem : STZ.W AutoCancelHUDItemIndex
    STZ.W SamusInvincibilityTimer : STZ.W SamusKnockbackTimer
    JSL Wait_End_VBlank_Clear_HDMA
    JSL DisableHVCounterInterrupts
    STZ.W LayerBlending_DefaultConfig
    SEP #$20
    STZ.B DP_NextGameplayColorMathA : STZ.B DP_NextGameplayColorMathB
    LDA.B #$10 : STA.B DP_MainScreenLayers
    STZ.B DP_SubScreenLayers : STZ.B DP_WindowAreaMainScreen : STZ.B DP_WindowAreaSubScreen
    LDA.B #$09 : STA.B DP_BGModeSize
    REP #$20
    STZ.W GameOptionsMenuIndex : STZ.W PauseMenu_MenuIndex
    LDX.W #$00FE

  .loop:
    STZ.W CinematicSpriteObject_XPositions+$10,X
    DEX #2 : BPL .loop
    LDA.W #$0019 : STA.W GameState

  .return:
    RTS


;;; $C699: Cinematic function - fly to Zebes - initial ;;;
CinematicFunction_FlyToZebes_Initial:
    JSR Setup_PPU_SamusGoesToZebesCutscene
    LDA.W #MessageBoxIndex : DEC #2 : SEC : SBC.W #Mode7TransformationAngle : TAX

  .loop:
    STZ.W Mode7TransformationAngle,X
    DEX #2 : BPL .loop
    LDA.W #Zebes_Tilemap>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Zebes_Tilemap : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl ZebesTilemap
    LDA.W #Tiles_Zebes>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Zebes : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl ZebesTiles
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$00 : STA.W $2117
    LDA.B #$00 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$00,$18
    dl CeresCutsceneTilemap_ShipBack
    dw $0300
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$5C : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl ZebesTilemap
    dw $0800
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$60 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl ZebesTiles
    dw $4000
    LDA.B #$02 : STA.W $420B
    REP #$30
    LDA.W #$0100 : STA.W $211B : STA.B DP_Mode7TransMatrixA
    STZ.W $211C : STZ.B DP_Mode7TransMatrixB
    STZ.W $211D : STZ.B DP_Mode7TransMatrixC
    STA.W $211E : STA.B DP_Mode7TransMatrixD
    LDA.W #$0038 : STA.W $211F : STA.B DP_Mode7TransOriginX
    LDA.W #$0018 : STA.W $2120 : STA.B DP_Mode7TransOriginY
    STZ.W CinematicBG1_XPosition : STZ.W CinematicBG1_YPosition
    STZ.W Mode7TransformationAngle
    LDA.W #$0100 : STA.W Mode7TransformationZoomLevel
    JSL Disable_HDMAObjects
    JSL Wait_End_VBlank_Clear_HDMA
    JSL Clear_PaletteFXObjects
    JSL Enable_PaletteFXObjects
    SEP #$20
    LDA.B #$81 : STA.B DP_Mosaic
    REP #$20
    LDY.W #PaletteFXObjects_CutsceneGunshipEngineFlicker
    JSL Spawn_PaletteFXObject
    LDA.W #CinematicFunction_FlyToZebes_FadingIn : STA.W CinematicFunction
    JSL EnableNMI
    LDA.W #$0001 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter
    RTS


;;; $C79C: Cinematic function - fly to Zebes - fading in ;;;
CinematicFunction_FlyToZebes_FadingIn:
    LDA.W CinematicFrameCounter : BIT.W #$0003 : BNE .fadeIn
    SEP #$20
    LDA.B DP_Mosaic : SEC : SBC.B #$10 : STA.B DP_Mosaic
    REP #$20

  .fadeIn:
    JSL HandleFadingIn
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$0F : BNE .return
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    LDA.W #CinematicFunction_FlyToZebes_MosaicTransition : STA.W CinematicFunction

  .return:
    RTS


;;; $C7CA: Cinematic function - fly to Zebes - mosaic transition ;;;
CinematicFunction_FlyToZebes_MosaicTransition:
    LDA.W CinematicFrameCounter : BIT.W #$0003 : BNE .return
    SEP #$20
    LDA.B DP_Mosaic : SEC : SBC.B #$10 : STA.B DP_Mosaic
    BIT.B #$F0 : BEQ .nonZeroMosaicBlockSize
    REP #$20
    RTS

  .nonZeroMosaicBlockSize:
    SEP #$20
    LDA.B #$07 : STA.B DP_BGModeSize
    LDA.B #$80 : STA.B DP_Mode7Settings
    LDA.B #$00 : STA.B DP_BG1TilemapAddrSize
    STZ.B DP_BGTilesAddr
    LDA.B #$11 : STA.B DP_MainScreenLayers
    REP #$20
    LDA.W #$0080 : STA.W CinematicBG1_XPosition
    LDA.W #$FF98 : STA.W CinematicBG1_YPosition
    LDA.W #$0020 : STA.W Mode7TransformationAngle
    LDA.W #$0100 : STA.W Mode7TransformationZoomLevel
    LDY.W #CinematicSpriteObjectDefinitions_Zebes
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_ZebesStars2
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_ZebesStars3
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_ZebesStars4
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_ZebesStars5
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_PlanetZebesText
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #RTS_8BA38F : STA.W CinematicFunction

  .return:
    RTS


;;; $C83B: Initialisation function - cinematic sprite object $CEA3 (Zebes) ;;;
InitFunction_CinematicSpriteObject_Zebes:
    LDA.W #$0088 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$006F : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0E00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $C84E: Pre-instruction - cinematic sprite object $CEA3 (Zebes) ;;;
PreInstruction_CinematicSpriteObject_Zebes:
    LDA.W CinematicFunction : CMP.W #RTS_8BCADE : BNE .return
    LDA.W #PreInstruction_Zebes_SlideSceneAway : STA.W CinematicSpriteObject_PreInstructions,X

  .return:
    RTS


;;; $C85D: Pre-instruction - Zebes - slide scene away ;;;
PreInstruction_Zebes_SlideSceneAway:
    LDA.W CinematicSpriteObject_Timers,X : CLC : ADC.W #$0040 : STA.W CinematicSpriteObject_Timers,X
    XBA : PHA
    AND.W #$FF00 : STA.B DP_Temp14
    PLA : AND.W #$00FF : STA.B DP_Temp12
    LDA.W CinematicSpriteObject_YSubPosition,X : SEC : SBC.B DP_Temp14 : STA.W CinematicSpriteObject_YSubPosition,X
    LDA.W CinematicSpriteObject_YPositions,X : SBC.B DP_Temp12 : STA.W CinematicSpriteObject_YPositions,X
    CMP.W #$FF80 : BPL .return
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_CinematicSpriteObject_Delete : STA.W CinematicSpriteObject_InstListPointers,X

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $C897: Initialisation function - cinematic sprite object $CEA9 (unused. Zebes stars 1) ;;;
UNUSED_InitFunction_CinematicSpriteObject_ZebesStars1_8BC897:
    LDA.W #$0080 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$007F : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0800 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C8AA: Pre-instruction - cinematic sprite object $CEA9/$CF09 (Zebes stars 5) ;;;
PreInstruction_CinematicSpriteObject_ZebesStars5:
    LDA.W CinematicFunction : CMP.W #RTS_8BCADE : BNE .return
    LDA.W #PreInstruction_ZebesStars5_SlideSceneAway : STA.W CinematicSpriteObject_PreInstructions,X

  .return:
    RTS


;;; $C8B9: Pre-instruction - Zebes stars 5 - slide scene away ;;;
PreInstruction_ZebesStars5_SlideSceneAway:
    LDA.W CinematicSpriteObject_Timers,X : CLC : ADC.W #$0020 : STA.W CinematicSpriteObject_Timers,X
    XBA : PHA
    AND.W #$FF00 : STA.B DP_Temp14
    PLA : AND.W #$00FF : STA.B DP_Temp12
    LDA.W CinematicSpriteObject_YSubPosition,X : SEC : SBC.B DP_Temp14 : STA.W CinematicSpriteObject_YSubPosition,X
    LDA.W CinematicSpriteObject_YPositions,X : SBC.B DP_Temp12 : STA.W CinematicSpriteObject_YPositions,X
    CMP.W #$FF80 : BPL .return
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_CinematicSpriteObject_Delete : STA.W CinematicSpriteObject_InstListPointers,X
    LDA.W #CinematicFunction_FlyToZebes_LoadGameData : STA.W CinematicFunction

  .return:
    RTS


;;; $C8F9: Pre-instruction - cinematic sprite object $CEF7/$CEFD/$CF03 (Zebes stars 2/3/4) ;;;
PreInstruction_CinematicSpriteObject_ZebesStars_2_3_4:
    LDA.W CinematicFunction : CMP.W #RTS_8BCADE : BNE .return
    LDA.W #PreInstruction_ZebesStars_2_3_4_SlideSceneAway : STA.W CinematicSpriteObject_PreInstructions,X

  .return:
    RTS


;;; $C908: Pre-instruction - Zebes stars 2/3/4 - slide scene away ;;;
PreInstruction_ZebesStars_2_3_4_SlideSceneAway:
    LDA.W CinematicSpriteObject_Timers,X : CLC : ADC.W #$0020 : STA.W CinematicSpriteObject_Timers,X
    XBA : PHA
    AND.W #$FF00 : STA.B DP_Temp14
    PLA : AND.W #$00FF : STA.B DP_Temp12
    LDA.W CinematicSpriteObject_YSubPosition,X : SEC : SBC.B DP_Temp14 : STA.W CinematicSpriteObject_YSubPosition,X
    LDA.W CinematicSpriteObject_YPositions,X : SBC.B DP_Temp12 : STA.W CinematicSpriteObject_YPositions,X
    CMP.W #$FF80 : BPL .return
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_CinematicSpriteObject_Delete : STA.W CinematicSpriteObject_InstListPointers,X

  .return:
    RTS


;;; $C942: Initialisation function - cinematic sprite object $CEF7 (Zebes stars 2) ;;;
InitFunction_CinematicSpriteObject_ZebesStars2:
    NOP ; >_<
    LDA.W #$0030 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$002F : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0800 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $C956: Initialisation function - cinematic sprite object $CEFD (Zebes stars 3) ;;;
InitFunction_CinematicSpriteObject_ZebesStars3:
    NOP ; >_<
    LDA.W #$00D0 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$002F : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0800 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $C96A: Initialisation function - cinematic sprite object $CF03 (Zebes stars 4) ;;;
InitFunction_CinematicSpriteObject_ZebesStars4:
    NOP ; >_<
    LDA.W #$0030 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$00CF : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0800 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $C97E: Initialisation function - cinematic sprite object $CF09 (Zebes stars 5) ;;;
InitFunction_CinematicSpriteObject_ZebesStars5:
    NOP ; >_<
    LDA.W #$00D0 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$00CF : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0800 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $C992: Initialisation function - cinematic sprite object $CEAF (Planet Zebes text) ;;;
InitFunction_CinematicSpriteObject_PlanetZebesText:
    LDA.W #$0080 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$00BA : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0000 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $C9A5: Instruction - fade in PLANET ZEBES text ;;;
Instruction_FadeInPlanetZebesText:
    PHY
    LDY.W #PaletteFXObjects_FadeInPlanetZebesText
    JSL Spawn_PaletteFXObject
    PLY
    RTS


;;; $C9AF: Instruction - spawn planet Zebes Japanese text if enabled ;;;
Instruction_SpawnPlanetZebesJapanTextIfNeeded:
    LDA.W JapanText : BEQ .return
    PHY
    LDY.W #CinematicSpriteObjectDefinitions_PlanetZebesJapanText
    JSR Spawn_CinematicSpriteObject_Y
    PLY

  .return:
    RTS


;;; $C9BD: Instruction - fade out PLANET ZEBES text ;;;
Instruction_FadeOutPlanetZebesText:
    PHY
    LDY.W #PaletteFXObjects_FadeOutPlanetZebesText
    JSL Spawn_PaletteFXObject
    PLY
    RTS


;;; $C9C7: Instruction - start flying to Zebes ;;;
Instruction_StartFlyingToZebes:
    LDA.W #$003E : STA.W CinematicBG1_XPosition
    LDA.W #$FF90 : STA.W CinematicBG1_YPosition
    LDA.W #$0020 : STA.W Mode7TransformationAngle
    LDA.W #$0010 : STA.W Mode7TransformationZoomLevel
    LDA.W #CinematicFunction_FlyToZebes_FlyingToZebes_DriftingRight : STA.W CinematicFunction
    RTS


;;; $C9E6: Initialisation function - cinematic sprite object $CEB5 (planet Zebes Japanese text) ;;;
InitFunction_CinematicSpriteObject_PlanetZebesJapanText:
    LDA.W #$0080 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$00CC : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0000 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $C9F9: Cinematic function - fly to Zebes - flying to Zebes - drifting right ;;;
CinematicFunction_FlyToZebes_FlyingToZebes_DriftingRight:
    LDA.W CinematicBG1_YSubPosition : CLC : ADC.W #$2000 : STA.W CinematicBG1_YSubPosition
    LDA.W CinematicBG1_YPosition : ADC.W #$0000 : STA.W CinematicBG1_YPosition
    LDA.W CinematicBG1_XSubPosition : SEC : SBC.W #$8000 : STA.W CinematicBG1_XSubPosition
    LDA.W CinematicBG1_XPosition : SBC.W #$0000 : STA.W CinematicBG1_XPosition
    LDA.W Mode7TransformationZoomLevel : CMP.W #$0480 : BPL .zoomLessThan480
    CLC : ADC.W #$0004 : STA.W Mode7TransformationZoomLevel
    RTS

  .zoomLessThan480:
    LDA.W #CinematicFunction_FlyToZebes_FlyingToZebes_TurningLeft : STA.W CinematicFunction
    RTS


;;; $CA36: Cinematic function - fly to Zebes - flying to Zebes - turning left ;;;
CinematicFunction_FlyToZebes_FlyingToZebes_TurningLeft:
    LDA.W CinematicBG1_YSubPosition : CLC : ADC.W #$2000 : STA.W CinematicBG1_YSubPosition
    LDA.W CinematicBG1_YPosition : ADC.W #$0000 : STA.W CinematicBG1_YPosition
    LDA.W CinematicBG1_XSubPosition : SEC : SBC.W #$8000 : STA.W CinematicBG1_XSubPosition
    LDA.W CinematicBG1_XPosition : SBC.W #$0000 : STA.W CinematicBG1_XPosition
    CMP.W #$FF80 : BMI .finished
    LDA.W Mode7TransformationZoomLevel : CLC : ADC.W #$0010 : STA.W Mode7TransformationZoomLevel
    LDA.W Mode7TransformationAngle : CMP.W #$00E0 : BEQ .return
    SEC : SBC.W #$0001 : AND.W #$00FF : STA.W Mode7TransformationAngle

  .return:
    RTS

  .finished:
    LDA.W #CinematicFunction_FlyToZebes_FlyingToZebes_DriftingLeft : STA.W CinematicFunction
    RTS


;;; $CA85: Cinematic function - fly to Zebes - flying to Zebes - drifting left ;;;
CinematicFunction_FlyToZebes_FlyingToZebes_DriftingLeft:
    LDA.W CinematicBG1_YSubPosition : CLC : ADC.W #$2000 : STA.W CinematicBG1_YSubPosition
    LDA.W CinematicBG1_YPosition : ADC.W #$0000 : STA.W CinematicBG1_YPosition
    LDA.W CinematicBG1_XSubPosition : CLC : ADC.W #$2000 : STA.W CinematicBG1_XSubPosition
    LDA.W CinematicBG1_XPosition : ADC.W #$0000 : STA.W CinematicBG1_XPosition
    LDA.W Mode7TransformationZoomLevel : CMP.W #$2000 : BPL .zoomLessThan2000
    CLC : ADC.W #$0020 : STA.W Mode7TransformationZoomLevel
    RTS

  .zoomLessThan2000:
    SEP #$20
    LDA.B #$10 : STA.B DP_MainScreenLayers
    REP #$20
    LDA.W #CinematicFunction_FlyToZebes_HoldOnSceneFor40Frames : STA.W CinematicFunction
    LDA.W #$0040 : STA.W CinematicFunctionTimer
    RTS


;;; $CAD0: Cinematic function - fly to Zebes - hold on scene for 40h frames ;;;
CinematicFunction_FlyToZebes_HoldOnSceneFor40Frames:
    DEC.W CinematicFunctionTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #RTS_8BCADE : STA.W CinematicFunction

  .return:
    RTS


;;; $CADE: RTS. Cinematic function - fly to Zebes - slide scene away ;;;
RTS_8BCADE:
    RTS


;;; $CADF: Cinematic function - fly to Zebes - load game data ;;;
CinematicFunction_FlyToZebes_LoadGameData:
    SEP #$20
    LDA.B #$80 : STA.B DP_Brightness
    REP #$20
    LDA.W #MessageBoxIndex : DEC #2 : SEC : SBC.W #Mode7TransformationAngle : TAX

  .loop:
    STZ.W Mode7TransformationAngle,X
    DEX #2 : BPL .loop
    LDA.W #$0006 : STA.W GameState
    LDA.W MaxEnergy : STA.W Energy
    RTS


;;; $CB05: Instruction list - cinematic sprite object $CE55 (intro Mother Brain) ;;;
InstList_CinematicSpriteObject_IntroMotherBrain:
    dw $0010,IntroCeresExplosionSpritemaps_MotherBrainFrame1
    dw $0010,IntroCeresExplosionSpritemaps_MotherBrainFrame2
    dw $0010,IntroCeresExplosionSpritemaps_MotherBrainFrame3
    dw $0010,IntroCeresExplosionSpritemaps_MotherBrainFrame2
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_IntroMotherBrain


;;; $CB19: Instruction list - intro Mother Brain - start page 2 ;;;
InstList_IntroMotherBrain_StartPage2_0:
    dw Instruction_StartIntroPage2
    dw CinematicSpriteObject_Instruction_PreInstructionY
    dw PreInstruction_IntroMotherBrain_CrossFading

InstList_IntroMotherBrain_StartPage2_1:
    dw $0010,IntroCeresExplosionSpritemaps_MotherBrainFrame1
    dw $0010,IntroCeresExplosionSpritemaps_MotherBrainFrame2
    dw $0010,IntroCeresExplosionSpritemaps_MotherBrainFrame3
    dw $0010,IntroCeresExplosionSpritemaps_MotherBrainFrame2
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_IntroMotherBrain_StartPage2_1


;;; $CB33: Instruction list - cinematic sprite object $CE5B (metroid egg) ;;;
InstList_CinematicSpriteObject_MetroidEgg:
    dw $0005,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame1
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_MetroidEgg


;;; $CB3B: Instruction list - metroid egg hatching ;;;
InstList_MetroidEggHatching_0:
    dw $0020,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame1
    dw CinematicSpriteObject_Instruction_TimerInY,$0004

InstList_MetroidEggHatching_1:
    dw $0005,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame1
    dw $0005,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame2
    dw $0005,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame1
    dw $0005,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame3
    dw CinematicSpriteObject_Inst_DecrementTimer_GotoYIfNonZero
    dw InstList_MetroidEggHatching_1
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame1
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame4
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame5
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame6
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame7
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame8
    dw $0050,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame9
    dw Instruction_SpawnMetroidEggParticles
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame1

InstList_MetroidEggHatching_2:
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame2
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame3
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame4
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame5
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame6
    dw $0140,IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame7
    dw Instruction_StartIntroPage3
    dw CinematicSpriteObject_Instruction_PreInstructionY
    dw PreInstruction_MetroidEgg_DeleteAfterCrossFade

InstList_MetroidEggHatching_3:
    dw $0050,IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame7
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_MetroidEggHatching_3


;;; $CB9F: Instruction list - cinematic sprite object $CE61 (baby metroid being delivered) ;;;
InstList_CinematicSpriteObject_BabyMetroidBeingDelivered_0:
    dw CinematicSpriteObject_Instruction_TimerInY,$000A

InstList_CinematicSpriteObject_BabyMetroidBeingDelivered_1:
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidDeliveredFrame1
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidDeliveredFrame2
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidDeliveredFrame3
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidDeliveredFrame2
    dw CinematicSpriteObject_Inst_DecrementTimer_GotoYIfNonZero
    dw InstList_CinematicSpriteObject_BabyMetroidBeingDelivered_1
    dw Instruction_StartIntroPage4

InstList_CinematicSpriteObject_BabyMetroidBeingDelivered_2:
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidDeliveredFrame1
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidDeliveredFrame2
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidDeliveredFrame3
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidDeliveredFrame2
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_BabyMetroidBeingDelivered_2


;;; $CBCD: Instruction list - cinematic sprite object $CE67 (baby metroid being examined) ;;;
InstList_CinematicSpriteObject_BabyMetroidBeingExamined_0:
    dw CinematicSpriteObject_Instruction_TimerInY,$000A

InstList_CinematicSpriteObject_BabyMetroidBeingExamined_1:
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidExaminedFrame1
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidExaminedFrame2
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidExaminedFrame3
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidExaminedFrame2
    dw CinematicSpriteObject_Inst_DecrementTimer_GotoYIfNonZero
    dw InstList_CinematicSpriteObject_BabyMetroidBeingExamined_1
    dw Instruction_StartIntroPage5

InstList_CinematicSpriteObject_BabyMetroidBeingExamined_2:
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidExaminedFrame1
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidExaminedFrame2
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidExaminedFrame3
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidExaminedFrame2
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_BabyMetroidBeingExamined_2


;;; $CBFB: Instruction list - cinematic sprite object $CE6D (intro text caret) ;;;
InstList_CinematicSpriteObject_IntroTextCaret:
    dw $0005,IntroCeresExplosionSpritemaps_BlinkingTypewriterBlock
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_IntroTextCaret


;;; $CC03: Instruction list - intro text caret - blink ;;;
InstList_IntroTextCaret_Blink:
    dw $0005,IntroCeresExplosionSpritemaps_BlinkingTypewriterBlock
    dw $0005,$0000
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_IntroTextCaret_Blink


;;; $CC0F: Instruction list - cinematic sprite object $CE73 (intro Japanese text next-page arrow) ;;;
InstList_CinematicSpriteObject_IntroJapanTextNextPageArrow:
    dw $000A,IntroCeresExplosionSpritemaps_JapanTextNextPageArrowFrame1
    dw $000A,IntroCeresExplosionSpritemaps_JapanTextNextPageArrowFrame2
    dw $000A,IntroCeresExplosionSpritemaps_JapanTextNextPageArrowFrame3
    dw $000A,IntroCeresExplosionSpritemaps_JapanTextNextPageArrowFrame2
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_IntroJapanTextNextPageArrow


;;; $CC23: Instruction list - intro Japanese text next-page arrow - blink ;;;
InstList_IntroJapanTextNextPageArrow_Blink:
    dw $003C,$0000
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_IntroJapanTextNextPageArrow


;;; $CC2B: Instruction list - cinematic sprite object $CE79 (confused baby metroid) ;;;
InstList_CinematicSpriteObject_ConfusedBabyMetroid:
    dw $000A,IntroCeresExplosionSpritemaps_ConfusedBabyMetroidFrame1
    dw $000A,IntroCeresExplosionSpritemaps_ConfusedBabyMetroidFrame2
    dw $000A,IntroCeresExplosionSpritemaps_ConfusedBabyMetroidFrame3
    dw $000A,IntroCeresExplosionSpritemaps_ConfusedBabyMetroidFrame2
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_ConfusedBabyMetroid


;;; $CC3F: Instruction list - cinematic sprite object $CE7F (Ceres under attack large asteroids) ;;;
InstList_CinematicSpriteObject_CeresUnderAttackLargeAsteroid:
    dw $000A,SpaceSpritemaps_CeresUnderAttackLargeAsteroids
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_CeresUnderAttackLargeAsteroid


;;; $CC47: Instruction list - cinematic sprite object $CE85 (Ceres under attack) ;;;
InstList_CinematicSpriteObject_CeresUnderAttack:
    dw $000A,SpaceSpritemaps_CeresUnderAttack
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_CeresUnderAttack


;;; $CC4F: Instruction list - cinematic sprite object $CE8B (Ceres small asteroids) ;;;
InstList_CinematicSpriteObject_CeresSmallAsteroids:
    dw $000A,SpaceSpritemaps_CeresSmallAsteroids
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_CeresSmallAsteroids


;;; $CC57: Instruction list - cinematic sprite object $CE91 (Ceres purple space vortex) ;;;
InstList_CinematicSpriteObject_CeresPurpleSpaceVortext:
    dw $0001,SpaceSpritemaps_CeresPurpleVortexFrame1
    dw $0001,SpaceSpritemaps_CeresPurpleVortexFrame2
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_CeresPurpleSpaceVortext


if !FEATURE_KEEP_UNREFERENCED
;;; $CC63: Unused. Instruction list - cinematic sprite object $CE97 (space colony text) ;;;
UNUSED_InstList_CinematicSpriteObject_SpaceColonyText_8BCC63:
; CinematicSpriteObjectDefinitions_SpaceColony is used instead
    dw $0100,$0000
    dw $000A,UNUSED_SpaceSpritemaps_S_8C92AA
    dw $000A,UNUSED_SpaceSpritemaps_SP_8C92B1
    dw $000A,UNUSED_SpaceSpritemaps_SPA_8C92BD
    dw $000A,UNUSED_SpaceSpritemaps_SPAC_8C92CE
    dw $000A,UNUSED_SpaceSpritemaps_SPACE_8C92E4
    dw $000A,UNUSED_SpaceSpritemaps_SPACEC_8C92FF
    dw $000A,UNUSED_SpaceSpritemaps_SPACECO_8C931F
    dw $000A,UNUSED_SpaceSpritemaps_SPACECOL_8C9344
    dw $000A,UNUSED_SpaceSpritemaps_SPACECOLO_9C936E
    dw $000A,UNUSED_SpaceSpritemaps_SPACECOLON_8C939D
    dw $000A,UNUSED_SpaceSpritemaps_SPACECOLONY_8C921F
    dw Instruction_SkipNextInstructionIfEnglishText
    dw $0080,UNUSED_SpaceSpritemaps_SPACECOLONY_8C921F
    dw Instruction_FinishFlyToCeres

UNUSED_InstList_CinematicSpriteObject_SpaceColonyText_8BCC9B:
    dw $0001,UNUSED_SpaceSpritemaps_SPACECOLONY_8C921F
    dw CinematicSpriteObject_Instruction_GotoY
    dw UNUSED_InstList_CinematicSpriteObject_SpaceColonyText_8BCC9B


;;; $CCA3: Unused. Instruction list - cinematic sprite object $CE9D (space colony Japanese text) ;;;
UNUSED_InstList_CineSpriteObject_SpaceColonyJapanText_8BCCA3:
    dw $000A,UNUSED_SpaceSpritemaps_JapanText_SPACECOLONY_8C9258
    dw CinematicSpriteObject_Instruction_GotoY
    dw UNUSED_InstList_CineSpriteObject_SpaceColonyJapanText_8BCCA3
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $CCAB: Instruction list - cinematic sprite object $CEA3 (Zebes) ;;;
InstList_CinematicSpriteObject_Zebes:
    dw $000A,SpaceSpritemaps_Zebes
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_Zebes


if !FEATURE_KEEP_UNREFERENCED
;;; $CCB3: Instruction list - cinematic sprite object $CEA9 (Zebes stars 1) ;;;
InstList_CinematicSpriteObject_ZebesStars1:
    dw $000A,UNUSED_SpaceSpritemaps_ZebesStars1_8C96CB
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_ZebesStars1
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $CCBB: Instruction list - cinematic sprite object $CEAF (planet Zebes text) ;;;
InstList_CinematicSpriteObject_PlanetZebesText:
    dw $0040,$0000
    dw Instruction_FadeInPlanetZebesText
    dw $0020,SpaceSpritemaps_PlanetZebes
    dw Instruction_SpawnPlanetZebesJapanTextIfNeeded
    dw $00C0,SpaceSpritemaps_PlanetZebes
    dw Instruction_FadeOutPlanetZebesText
    dw $0060,SpaceSpritemaps_PlanetZebes
    dw Instruction_StartFlyingToZebes
    dw CinematicSpriteObject_Instruction_Delete


;;; $CCD5: Instruction list - cinematic sprite object $CEB5 (planet Zebes Japanese text) ;;;
InstList_CinematicSpriteObject_PlanetZebesJapanText:
    dw $00C0,SpaceSpritemaps_JapanText_PlanetZebes
    dw CinematicSpriteObject_Instruction_Delete


;;; $CCDB: Instruction list - cinematic sprite object $CEBB (Ceres explosion 1) ;;;
InstList_CinematicSpriteObject_CeresExplosion1:
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame1
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame2
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame3
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame4
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame5
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame6
    dw CinematicSpriteObject_Instruction_Delete


;;; $CCF5: Instruction list - cinematic sprite object $CEC1 (Ceres explosion 2) ;;;
InstList_CinematicSpriteObject_CeresExplosion2_0:
    dw CinematicSpriteObject_Instruction_TimerInY,$0006

InstList_CinematicSpriteObject_CeresExplosion2_1:
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame1
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame2
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame3
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame4
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame5
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame6
    dw $0010,$0000
    dw CinematicSpriteObject_Inst_DecrementTimer_GotoYIfNonZero
    dw InstList_CinematicSpriteObject_CeresExplosion2_1
    dw CinematicSpriteObject_Instruction_Delete


;;; $CD1B: Instruction list - cinematic sprite object $CEC7 (Ceres explosion 3) ;;;
InstList_CinematicSpriteObject_CeresExplosion3_0:
    dw CinematicSpriteObject_Instruction_TimerInY,$0007

InstList_CinematicSpriteObject_CeresExplosion3_1:
    dw $0005,SpaceSpritemaps_CeresExplosionFrame1
    dw $0005,SpaceSpritemaps_CeresExplosionFrame2
    dw $0005,SpaceSpritemaps_CeresExplosionFrame3
    dw $0005,SpaceSpritemaps_CeresExplosionFrame4
    dw $0008,$0000
    dw CinematicSpriteObject_Inst_DecrementTimer_GotoYIfNonZero
    dw InstList_CinematicSpriteObject_CeresExplosion3_1
    dw CinematicSpriteObject_Instruction_Delete


;;; $CD39: Instruction list - cinematic sprite object $CECD (metroid egg particle 1) ;;;
InstList_CinematicSpriteObject_MetroidEggParticle1:
    dw $0001,IntroCeresExplosionSpritemaps_MetroidEggsParticle1
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_MetroidEggParticle1


;;; $CD41: Instruction list - cinematic sprite object $CED3 (metroid egg particle 2) ;;;
InstList_CinematicSpriteObject_MetroidEggParticle2:
    dw $0001,IntroCeresExplosionSpritemaps_MetroidEggsParticle2
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_MetroidEggParticle2


;;; $CD49: Instruction list - cinematic sprite object $CED9 (metroid egg particle 3) ;;;
InstList_CinematicSpriteObject_MetroidEggParticle3:
    dw $0001,IntroCeresExplosionSpritemaps_MetroidEggsParticle3
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_MetroidEggParticle3


;;; $CD51: Instruction list - cinematic sprite object $CEDF (metroid egg particle 4) ;;;
InstList_CinematicSpriteObject_MetroidEggParticle4:
    dw $0001,IntroCeresExplosionSpritemaps_MetroidEggsParticle4
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_MetroidEggParticle4


;;; $CD59: Instruction list - cinematic sprite object $CEE5 (metroid egg particle 5) ;;;
InstList_CinematicSpriteObject_MetroidEggParticle5:
    dw $0001,IntroCeresExplosionSpritemaps_MetroidEggsParticle5
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_MetroidEggParticle5


;;; $CD61: Instruction list - cinematic sprite object $CEEB (metroid egg particle 6) ;;;
InstList_CinematicSpriteObject_MetroidEggParticle6:
    dw $0001,IntroCeresExplosionSpritemaps_MetroidEggsParticle6
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_MetroidEggParticle6


;;; $CD69: Instruction list - cinematic sprite object $CEF1 (metroid egg slime drops) ;;;
InstList_CinematicSpriteObject_MetroidEggSlimeDrops:
    dw $0001,IntroCeresExplosionSpritemaps_MetroidEggsSlimeDropsFrame1
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_MetroidEggSlimeDrops


;;; $CD71: Instruction list - metroid egg slime drops - hit ground ;;;
InstList_MetroidEggParticle_HitGround:
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggsSlimeDropsFrame2
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggsSlimeDropsFrame3
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggsSlimeDropsFrame4
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggsSlimeDropsFrame5
    dw CinematicSpriteObject_Instruction_Delete


;;; $CD83: Instruction list - cinematic sprite object $CEF7 (Zebes stars 2) ;;;
InstList_CinematicSpriteObject_ZebesStars2:
    dw $000A,SpaceSpritemaps_ZebesStars2
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_ZebesStars2


;;; $CD8B: Instruction list - cinematic sprite object $CEFD (Zebes stars 3) ;;;
InstList_CinematicSpriteObject_ZebesStars3:
    dw $000A,SpaceSpritemaps_ZebesStars3
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_ZebesStars3


;;; $CD93: Instruction list - cinematic sprite object $CF03 (Zebes stars 4) ;;;
InstList_CinematicSpriteObject_ZebesStars4:
    dw $000A,SpaceSpritemaps_ZebesStars4
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_ZebesStars4


;;; $CD9B: Instruction list - cinematic sprite object $CF09 (Zebes stars 5) ;;;
InstList_CinematicSpriteObject_ZebesStars5:
    dw $000A,SpaceSpritemaps_ZebesStars5
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_ZebesStars5


;;; $CDA3: Instruction list - cinematic sprite object $CF0F (Ceres stars) ;;;
InstList_CinematicSpriteObject_CeresStars:
    dw $000A,SpaceSpritemaps_CeresStars
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_CeresStars


;;; $CDAB: Instruction list - cinematic sprite object $CF15 (intro Mother Brain explosion - big) ;;;
InstList_CinematicSpriteObject_IntroMotherBrainExplosion_Big:
    dw $0006,SpaceSpritemaps_IntroMotherBrainExplosionBigFrame1
    dw $0006,SpaceSpritemaps_IntroMotherBrainExplosionBigFrame2
    dw $0006,SpaceSpritemaps_IntroMotherBrainExplosionBigFrame3
    dw $0006,SpaceSpritemaps_IntroMotherBrainExplosionBigFrame4
    dw $0006,SpaceSpritemaps_IntroMotherBrainExplosionBigFrame5
    dw $0006,SpaceSpritemaps_IntroMotherBrainExplosionBigFrame6
    dw $0010,$0000
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_IntroMotherBrainExplosion_Big


;;; $CDCB: Instruction list - cinematic sprite object $CF1B (intro Mother Brain explosion - small) ;;;
InstList_CineSpriteObject_IntroMotherBrainExplosion_Small:
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame1
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame2
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame3
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame4
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame5
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame6
    dw $0010,$0000
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CineSpriteObject_IntroMotherBrainExplosion_Small


;;; $CDEB: Instruction list - cinematic sprite object $CF21 (intro rinka) ;;;
InstList_CinematicSpriteObject_IntroRinka_0:
    dw $000A,IntroCeresExplosionSpritemaps_RinkaFrame1
    dw $000A,IntroCeresExplosionSpritemaps_RinkaFrame2
    dw $000A,IntroCeresExplosionSpritemaps_RinkaFrame3
    dw Instruction_StartMoving_IntroRinka

InstList_CinematicSpriteObject_IntroRinka_1:
    dw $000A,IntroCeresExplosionSpritemaps_RinkaFrame2
    dw $000A,IntroCeresExplosionSpritemaps_RinkaFrame1
    dw $000A,IntroCeresExplosionSpritemaps_RinkaFrame2
    dw $000A,IntroCeresExplosionSpritemaps_RinkaFrame3
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_IntroRinka_1


;;; $CE0D: Instruction list - cinematic sprite object $CF27 (rinka spawner) ;;;
InstList_CinematicSpriteObject_RinkaSpawner:
    dw $004A,$0000
    dw Instruction_Spawn_IntroRinkas_0_1
    dw $0080,$0000
    dw Instruction_Spawn_IntroRinkas_2_3
    dw CinematicSpriteObject_Instruction_Delete


;;; $CE1B: Instruction list - cinematic sprite object $CF2D (Ceres final explosion) ;;;
InstList_CinematicSpriteObject_CeresFinalExplosion:
    dw $0005,SpaceSpritemaps_CeresFinalExplosionFrame1
    dw $0005,SpaceSpritemaps_CeresFinalExplosionFrame2
    dw $0005,SpaceSpritemaps_CeresFinalExplosionFrame3
    dw $0005,SpaceSpritemaps_CeresFinalExplosionFrame4
    dw $0005,SpaceSpritemaps_CeresFinalExplosionFrame5
    dw $0005,SpaceSpritemaps_CeresFinalExplosionFrame6
    dw CinematicSpriteObject_Instruction_Delete


;;; $CE35: Instruction list - cinematic sprite object $CF33 (Ceres explosion spawner) ;;;
InstList_CinematicSpriteObject_CeresExplosionSpawner:
    dw $0080,$0000
    dw Instruction_SpawnCeresExplosions1
    dw $0050,$0000
    dw CinematicSpriteObject_Instruction_PreInstructionY
    dw PreInst_CeresExplosionSpawner_SpawnExplosion2EveryCFrames
    dw $0040,$0000
    dw Instruction_SpawnCeresExplosions3
    dw CinematicSpriteObject_Instruction_Delete


;;; $CE4B: Instruction list - cinematic sprite object $CF39 (Ceres explosion large asteroids) ;;;
InstList_CinematicSpriteObject_CeresExplosionLargeAsteroids:
    dw $000A,SpaceSpritemaps_CeresExplosionLargeAsteroids
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_CeresExplosionLargeAsteroids


;;; $CE53: Instruction list - delete ;;;
InstList_CinematicSpriteObject_Delete:
    dw CinematicSpriteObject_Instruction_Delete


;;; $CE55: Cinematic sprite object definitions - intro, Ceres, Zebes ;;;
CinematicSpriteObjectDefinitions_IntroMotherBrain:
    dw InitFunction_CinematicSpriteObject_IntroMotherBrain               ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_IntroMotherBrain             ; Pre-instruction
    dw InstList_CinematicSpriteObject_IntroMotherBrain                   ; Instruction list

CinematicSpriteObjectDefinitions_MetroidEgg:
    dw InitFunction_CinematicSpriteObject_MetroidEgg                     ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_MetroidEgg                   ; Pre-instruction
    dw InstList_CinematicSpriteObject_MetroidEgg                         ; Instruction list

CinematicSpriteObjectDefinitions_BabyMetroidBeingDelivered:
    dw InitFunction_CinematicSpriteObject_BabyMetroidBeingDelivered      ; Initialisation function
    dw PreInst_CinematicSpriteObject_BabyMetroidBeingDelivered           ; Pre-instruction
    dw InstList_CinematicSpriteObject_BabyMetroidBeingDelivered_0        ; Instruction list

CinematicSpriteObjectDefinitions_BabyMetroidBeingExamined:
    dw InitFunction_CinematicSpriteObject_BabyMetroidBeingExamined       ; Initialisation function
    dw PreInst_CinematicSpriteObject_BabyMetroidBeingExamined            ; Pre-instruction
    dw InstList_CinematicSpriteObject_BabyMetroidBeingExamined_0         ; Instruction list

CinematicSpriteObjectDefinitions_IntroTextCaret:
    dw InitFunction_CinematicSpriteObject_IntroTextCaret                 ; Initialisation function
    dw RTS_8BA8D4                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_IntroTextCaret                     ; Instruction list

CinematicSpriteObjectDefinitions_IntroJapanTextNextPageArrow:
    dw InitFunc_CinematicSpriteObject_IntroJapanTextNextPageArrow        ; Initialisation function
    dw PreInst_CinematicSpriteObject_IntroJapanTextNextPageArrow         ; Pre-instruction
    dw InstList_CinematicSpriteObject_IntroJapanTextNextPageArrow        ; Instruction list

CinematicSpriteObjectDefinitions_ConfusedBabyMetroid:
    dw InitFunction_CinematicSpriteObject_ConfusedBabyMetroid            ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_ConfusedBabyMetroid          ; Pre-instruction
    dw InstList_CinematicSpriteObject_ConfusedBabyMetroid                ; Instruction list

CinematicSpriteObjectDefs_CeresUnderAttackLargeAsteroids:
    dw InitFunc_CinematicSpriteObject_CeresExplosionLargeAsteroids       ; Initialisation function
    dw PreInst_CinematicSpriteObject_CeresExplosionLargeAsteroids        ; Pre-instruction
    dw InstList_CinematicSpriteObject_CeresUnderAttackLargeAsteroid      ; Instruction list

CinematicSpriteObjectDefinitions_CeresUnderAttack:
    dw InitFunction_CinematicSpriteObject_CeresUnderAttack               ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_CeresUnderAttack             ; Pre-instruction
    dw InstList_CinematicSpriteObject_CeresUnderAttack                   ; Instruction list

CinematicSpriteObjectDefinitions_CeresSmallAsteroids:
    dw InitFunction_CinematicSpriteObject_CeresSmallAsteroid             ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_CeresSmallAsteroid           ; Pre-instruction
    dw InstList_CinematicSpriteObject_CeresSmallAsteroids                ; Instruction list

CinematicSpriteObjectDefinitions_CeresPurpleSpaceVortex:
    dw InitFunction_CinematicSpriteObject_CeresPurpleSpaceVortex         ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_CeresPurpleSpaceVortex       ; Pre-instruction
    dw InstList_CinematicSpriteObject_CeresPurpleSpaceVortext            ; Instruction list

if !FEATURE_KEEP_UNREFERENCED
UNUSED_CinematicSpriteObjectDefs_SpaceColonyText_8BCE97:
    dw UNUSED_InitFunc_CinematicSpriteObject_SpaceColonyText_8BC083      ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw UNUSED_InstList_CinematicSpriteObject_SpaceColonyText_8BCC63      ; Instruction list

UNUSED_CinematicSpriteObjectDefs_SpaceColonyJapanText_8BCE9D:
    dw UNUSED_InitFunc_CineSpriteObject_SpaceColonyJapanText_8BC0B2      ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw UNUSED_InstList_CineSpriteObject_SpaceColonyJapanText_8BCCA3      ; Instruction list
endif ; !FEATURE_KEEP_UNREFERENCED

CinematicSpriteObjectDefinitions_Zebes:
    dw InitFunction_CinematicSpriteObject_Zebes                          ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_Zebes                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_Zebes                              ; Instruction list

if !FEATURE_KEEP_UNREFERENCED
UNUSED_CinematicSpriteObjectDefinitions_ZebesStars1_8BCEA9:
    dw UNUSED_InitFunction_CinematicSpriteObject_ZebesStars1_8BC897      ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_ZebesStars5                  ; Pre-instruction
    dw InstList_CinematicSpriteObject_ZebesStars1                        ; Instruction list
endif ; !FEATURE_KEEP_UNREFERENCED

CinematicSpriteObjectDefinitions_PlanetZebesText:
    dw InitFunction_CinematicSpriteObject_PlanetZebesText                ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_PlanetZebesText                    ; Instruction list

CinematicSpriteObjectDefinitions_PlanetZebesJapanText:
    dw InitFunction_CinematicSpriteObject_PlanetZebesJapanText           ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_PlanetZebesJapanText               ; Instruction list

CinematicSpriteObjectDefinitions_CeresExplosion1:
    dw InitFunction_CinematicSpriteObject_CeresExplosion1                ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_CeresExplosion               ; Pre-instruction
    dw InstList_CinematicSpriteObject_CeresExplosion1                    ; Instruction list

CinematicSpriteObjectDefinitions_CeresExplosion2:
    dw InitFunction_CinematicSpriteObject_CeresExplosion2                ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_CeresExplosion               ; Pre-instruction
    dw InstList_CinematicSpriteObject_CeresExplosion2_0                  ; Instruction list

CinematicSpriteObjectDefinitions_CeresExplosion3:
    dw InitFunction_CinematicSpriteObject_CeresExplosion3                ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_CeresExplosion               ; Pre-instruction
    dw InstList_CinematicSpriteObject_CeresExplosion3_0                  ; Instruction list

CinematicSpriteObjectDefinitions_MetroidEggParticle1:
    dw InitFunction_CinematicSpriteObject_MetroidEggParticles            ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_MetroidEggParticle           ; Pre-instruction
    dw InstList_CinematicSpriteObject_MetroidEggParticle1                ; Instruction list

CinematicSpriteObjectDefinitions_MetroidEggParticle2:
    dw InitFunction_CinematicSpriteObject_MetroidEggParticles            ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_MetroidEggParticle           ; Pre-instruction
    dw InstList_CinematicSpriteObject_MetroidEggParticle2                ; Instruction list

CinematicSpriteObjectDefinitions_MetroidEggParticle3:
    dw InitFunction_CinematicSpriteObject_MetroidEggParticles            ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_MetroidEggParticle           ; Pre-instruction
    dw InstList_CinematicSpriteObject_MetroidEggParticle3                ; Instruction list

CinematicSpriteObjectDefinitions_MetroidEggParticle4:
    dw InitFunction_CinematicSpriteObject_MetroidEggParticles            ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_MetroidEggParticle           ; Pre-instruction
    dw InstList_CinematicSpriteObject_MetroidEggParticle4                ; Instruction list

CinematicSpriteObjectDefinitions_MetroidEggParticle5:
    dw InitFunction_CinematicSpriteObject_MetroidEggParticles            ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_MetroidEggParticle           ; Pre-instruction
    dw InstList_CinematicSpriteObject_MetroidEggParticle5                ; Instruction list

CinematicSpriteObjectDefinitions_MetroidEggParticle6:
    dw InitFunction_CinematicSpriteObject_MetroidEggParticles            ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_MetroidEggParticle           ; Pre-instruction
    dw InstList_CinematicSpriteObject_MetroidEggParticle6                ; Instruction list

CinematicSpriteObjectDefinitions_MetroidEggSlimeDrops:
    dw InitFunction_CinematicSpriteObject_MetroidEggSlimeDrops           ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_MetroidEggSlimeDrops         ; Pre-instruction
    dw InstList_CinematicSpriteObject_MetroidEggSlimeDrops               ; Instruction list

CinematicSpriteObjectDefinitions_ZebesStars2:
    dw InitFunction_CinematicSpriteObject_ZebesStars2                    ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_ZebesStars_2_3_4             ; Pre-instruction
    dw InstList_CinematicSpriteObject_ZebesStars2                        ; Instruction list

CinematicSpriteObjectDefinitions_ZebesStars3:
    dw InitFunction_CinematicSpriteObject_ZebesStars3                    ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_ZebesStars_2_3_4             ; Pre-instruction
    dw InstList_CinematicSpriteObject_ZebesStars3                        ; Instruction list

CinematicSpriteObjectDefinitions_ZebesStars4:
    dw InitFunction_CinematicSpriteObject_ZebesStars4                    ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_ZebesStars_2_3_4             ; Pre-instruction
    dw InstList_CinematicSpriteObject_ZebesStars4                        ; Instruction list

CinematicSpriteObjectDefinitions_ZebesStars5:
    dw InitFunction_CinematicSpriteObject_ZebesStars5                    ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_ZebesStars5                  ; Pre-instruction
    dw InstList_CinematicSpriteObject_ZebesStars5                        ; Instruction list

CinematicSpriteObjectDefinitions_CeresStars:
    dw InitFunction_CinematicSpriteObject_CeresStars                     ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_CeresStars                   ; Pre-instruction
    dw InstList_CinematicSpriteObject_CeresStars                         ; Instruction list

CinematicSpriteObjectDefs_IntroMotherBrainExplosion_Big:
    dw InitFunc_CinematicSpriteObject_IntroMotherBrainExplosion_Big      ; Initialisation function
    dw PreInst_CinematicSpriteObject_IntroMotherBrainExplosion           ; Pre-instruction
    dw InstList_CinematicSpriteObject_IntroMotherBrainExplosion_Big      ; Instruction list

CinematicSpriteObjectDefs_IntroMotherBrainExplosion_Small:
    dw InitFunc_CineSpriteObject_IntroMotherBrainExplosion_Small         ; Initialisation function
    dw PreInst_CinematicSpriteObject_IntroMotherBrainExplosion           ; Pre-instruction
    dw InstList_CineSpriteObject_IntroMotherBrainExplosion_Small         ; Instruction list

CinematicSpriteObjectDefinitions_IntroRinka:
    dw InitFunction_CinematicSpriteObject_IntroRinka                     ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_IntroRinka_0                       ; Instruction list

CinematicSpriteObjectDefinitions_RinkaSpawner:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_RinkaSpawner                       ; Instruction list

CinematicSpriteObjectDefinitions_CeresFinalExplosion:
    dw InitFunction_CinematicSpriteObject_CeresFinalExplosion            ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_CeresExplosion               ; Pre-instruction
    dw InstList_CinematicSpriteObject_CeresFinalExplosion                ; Instruction list

CinematicSpriteObjectDefinitions_CeresExplosionSpawner:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_CeresExplosionSpawner              ; Instruction list

CinematicSpriteObjectDefs_CeresExplosionLargeAsteroids:
    dw InitFunc_CinematicSpriteObject_CeresExplosionLargeAsteroids       ; Initialisation function
    dw PreInst_CinematicSpriteObject_CeresExplosionLargeAsteroids        ; Pre-instruction
    dw InstList_CinematicSpriteObject_CeresExplosionLargeAsteroids       ; Instruction list


;;; $CF3F: Cinematic BG object definitions - intro, Ceres ;;;
CinematicSpriteObjectDefinitions_IntroTextPage1:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw CinematicBGObjectInstLists_IntroTextPage1                         ; Instruction list (bank $8C)

CinematicSpriteObjectDefinitions_IntroTextPage2:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw CinematicBGObjectInstLists_IntroTextPage2                         ; Instruction list (bank $8C)

CinematicSpriteObjectDefinitions_IntroTextPage3:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw CinematicBGObjectInstLists_IntroTextPage3                         ; Instruction list (bank $8C)

CinematicSpriteObjectDefinitions_IntroTextPage4:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw CinematicBGObjectInstLists_IntroTextPage4                         ; Instruction list (bank $8C)

CinematicSpriteObjectDefinitions_IntroTextPage5:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw CinematicBGObjectInstLists_IntroTextPage5                         ; Instruction list (bank $8C)

CinematicSpriteObjectDefinitions_IntroTextPage6:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw CinematicBGObjectInstLists_IntroTextPage6                         ; Instruction list (bank $8C)

CinematicSpriteObjectDefinitions_SamusBlinking:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw PreInstruction_CinematicBGObject_SamusBlinking                    ; Pre-instruction
    dw CinematicBGObjectInstLists_SamusBlinking                          ; Instruction list (bank $8C)

CinematicSpriteObjectDefinitions_SpaceColony:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw CinematicBGObjectInstLists_SpaceColony                            ; Instruction list (bank $8C)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_CinematicSpriteObjectDefs_IntroTextPage1_8BCF6F:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw CinematicBGObjectInstLists_IntroTextPage1                         ; Instruction list (bank $8C)
endif ; !FEATURE_KEEP_UNREFERENCED


; Format:
;     dddd,nnnn
;     tttt,bbbb
;     tttt,bbbb
;     ...
; where
;     d: Japanese text tiles destination offset ($7E:4000 + d)
;     n: Number of characters
;     t: Top Japanese text tiles source offset ($7F:A000 + t)
;     b: Bottom Japanese text tiles source offset ($7F:A000 + b)

;;; $CF75: Page 1 - top line ;;;
IntroJapanTextData_Page1_TopLine:
; 私が メトロイドの存在を知ったのは (I learnt of the metroids' existence)
    dw $0040,$0011
    dw $0A60,$0B60
    dw $04E0,$0150
    dw $0EF0,$0EF0
    dw $0E00,$0F00
    dw $0E10,$0F10
    dw $0E20,$0F20
    dw $0E30,$0F30
    dw $0F70,$0F10
    dw $0280,$0380
    dw $0C70,$0D70
    dw $0C80,$0D80
    dw $04C0,$05C0
    dw $08E0,$09E0
    dw $0EF0,$0760
    dw $00F0,$01F0
    dw $0280,$0380
    dw $0290,$0390


;;; $CFBD: Page 1 - bottom line ;;;
IntroJapanTextData_Page1_BottomLine:
; 惑星ゼーベスでの戦いの時だった (it was during the battle on planet Zebes)
    dw $01C0,$000F
    dw $0680,$0780
    dw $0690,$0790
    dw $0E80,$0F80
    dw $0650,$0750
    dw $0E40,$0F40
    dw $0E60,$0F60
    dw $04F0,$0320
    dw $0280,$0380
    dw $08F0,$09F0
    dw $0010,$0110
    dw $0280,$0380
    dw $0C90,$0D90
    dw $05E0,$01F0
    dw $0EF0,$0760
    dw $00F0,$01F0


;;; $CFFD: Page 2 - subpage 1 - top line ;;;
IntroJapanTextData_Page2_Subpage1_TopLine:
; その後 私は惑星ＳＲ３８８へ メトロイドを (after that, I, to planet SR388, with the metroid)
    dw $0020,$0015
    dw $00E0,$01E0
    dw $0280,$0380
    dw $0A20,$0B20
    dw $0EF0,$0EF0
    dw $0A60,$0B60
    dw $0290,$0390
    dw $0680,$0780
    dw $0690,$0790
    dw $0660,$07E0
    dw $0670,$0770
    dw $06E0,$07E0
    dw $06F0,$07F0
    dw $06F0,$07F0
    dw $02C0,$03C0
    dw $0EF0,$0EF0
    dw $0E00,$0F00
    dw $0E10,$0F10
    dw $0E20,$0F20
    dw $0E30,$0F30
    dw $0F70,$0F10
    dw $04C0,$05C0


;;; $D055: Page 2 - subpage 1 - bottom line ;;;
IntroJapanTextData_Page2_Subpage1_BottomLine:
; 壊滅させるために向った (headed there to destroy it)
    dw $01A0,$000B
    dw $0A30,$0B30
    dw $0A40,$0B40
    dw $00A0,$01A0
    dw $00D0,$01D0
    dw $0480,$0580
    dw $00F0,$01F0
    dw $0410,$0510
    dw $0250,$0350
    dw $0A50,$0B50
    dw $0EF0,$0760
    dw $00F0,$01F0


;;; $D085: Page 2 - subpage 2 - top line ;;;
IntroJapanTextData_Page2_Subpage2_TopLine:
; そこで 唯一の生き残りであるベビーメトロイド (there, the only baby metroid left alive)
    dw $0010,$0016
    dw $00E0,$01E0
    dw $0090,$0190
    dw $04F0,$0320
    dw $0EF0,$0EF0
    dw $0A70,$0B70
    dw $0A80,$0B80
    dw $0280,$0380
    dw $0A90,$0B90
    dw $0060,$0160
    dw $0AA0,$0BA0
    dw $0470,$0570
    dw $04F0,$0320
    dw $0000,$0100
    dw $0480,$0580
    dw $0E40,$0F40
    dw $0E50,$0F50
    dw $0650,$0750
    dw $0E00,$0F00
    dw $0E10,$0F10
    dw $0E20,$0F20
    dw $0E30,$0F30
    dw $0F70,$0F10


;;; $D0E1: Page 2 - subpage 2 - bottom line ;;;
IntroJapanTextData_Page2_Subpage2_BottomLine:
; を捕獲した (I captured)
    dw $0190,$0005
    dw $04C0,$05C0
    dw $06A0,$07A0
    dw $06B0,$07B0
    dw $00B0,$01B0
    dw $00F0,$01F0


;;; $D0F9: Page 3 - subpage 1 ;;;
IntroJapanTextData_Page3_Subpage1:
; 正確にはベビーメトロイドがついて来たと言うべきだ (rather, I should say the metroid followed me)
    dw $0000,$0018
    dw $06C0,$07C0
    dw $06D0,$07D0
    dw $0250,$0350
    dw $0290,$0390
    dw $0E40,$0F40
    dw $0E50,$0F50
    dw $0650,$0750
    dw $0E00,$0F00
    dw $0E10,$0F10
    dw $0E20,$0F20
    dw $0E30,$0F30
    dw $0F70,$0F10
    dw $04E0,$0150
    dw $0210,$0310
    dw $0010,$0110
    dw $0220,$0320
    dw $0A00,$0B00
    dw $00F0,$01F0
    dw $0230,$0330
    dw $0A10,$0B10
    dw $0020,$0120
    dw $0E40,$0F40
    dw $0060,$0160
    dw $05E0,$01F0


;;; $D15D: Page 3 - subpage 2 ;;;
IntroJapanTextData_Page3_Subpage2:
; 生まれてすぐ目に入った私を母親だと思った様だ (when it was born, it seemed to think that I, whom it immediately noticed, was its mother)
    dw $0010,$0016
    dw $0A90,$0B90
    dw $02E0,$03E0
    dw $0490,$0590
    dw $0220,$0320
    dw $00C0,$01C0
    dw $05F0,$0170
    dw $0AD0,$0BD0
    dw $0250,$0350
    dw $0CB0,$0DB0
    dw $0EF0,$0760
    dw $00F0,$01F0
    dw $0A60,$0B60
    dw $04C0,$05C0
    dw $08A0,$09A0
    dw $08B0,$09B0
    dw $05E0,$01F0
    dw $0230,$0330
    dw $08C0,$09C0
    dw $0EF0,$0760
    dw $00F0,$01F0
    dw $0C50,$0D50
    dw $05E0,$01F0


;;; $D1B9: Page 4 - subpage 1 - top line ;;;
IntroJapanTextData_Page4_Subpage1_TopLine:
; そのベビーメトロイドを私はスペースコロニーの (I went to a space colony with this baby metroid)
    dw $0010,$0016
    dw $00E0,$01E0
    dw $0280,$0380
    dw $0E40,$0F40
    dw $0E50,$0F50
    dw $0650,$0750
    dw $0E00,$0F00
    dw $0E10,$0F10
    dw $0E20,$0F20
    dw $0E30,$0F30
    dw $0F70,$0F10
    dw $04C0,$05C0
    dw $0A60,$0B60
    dw $0290,$0390
    dw $0E60,$0F60
    dw $0E70,$0F40
    dw $0650,$0750
    dw $0E60,$0F60
    dw $0E90,$0F90
    dw $0E20,$0F20
    dw $0EA0,$0FA0
    dw $0650,$0750
    dw $0280,$0380


;;; $D215: Page 4 - subpage 1 - bottom line ;;;
IntroJapanTextData_Page4_Subpage1_BottomLine:
; 宇宙科学アカデミーへと持ち込んだ (the Space Science Academy)
    dw $0190,$0010
    dw $0CE0,$0DE0
    dw $0CF0,$0DF0
    dw $0C20,$0D20
    dw $0C30,$0D30
    dw $0610,$0710
    dw $0620,$0720
    dw $0630,$0730
    dw $0640,$0740
    dw $0650,$0750
    dw $02C0,$03C0
    dw $0230,$0330
    dw $0C60,$0D60
    dw $0200,$0300
    dw $08D0,$09D0
    dw $04D0,$05D0
    dw $05E0,$01F0


;;; $D259: Page 4 - subpage 2 - top line ;;;
IntroJapanTextData_Page4_Subpage2_TopLine:
; メトロイドの優れた特性を宇宙の未来に (with the metroid's amazing special powers, for the future of space)
    dw $0030,$0012
    dw $0E00,$0F00
    dw $0E10,$0F10
    dw $0E20,$0F20
    dw $0E30,$0F30
    dw $0F70,$0F10
    dw $0280,$0380
    dw $0AB0,$0BB0
    dw $0490,$0590
    dw $00F0,$01F0
    dw $0CC0,$0DC0
    dw $0CD0,$0DD0
    dw $04C0,$05C0
    dw $0CE0,$0DE0
    dw $0CF0,$0DF0
    dw $0280,$0380
    dw $0CA0,$0DA0
    dw $0A00,$0B00
    dw $0250,$0350


;;; $D2A5: Page 4 - subpage 2 - bottom line ;;;
IntroJapanTextData_Page4_Subpage2_BottomLine:
; 役立たせるために・・・ (in order to harness it...)
    dw $01B0,$000B
    dw $0800,$0900
    dw $0810,$0910
    dw $00F0,$01F0
    dw $00D0,$01D0
    dw $0480,$0580
    dw $00F0,$01F0
    dw $0410,$0510
    dw $0250,$0350
    dw $0EF0,$0600
    dw $0EF0,$0600
    dw $0EF0,$0600


;;; $D2D5: Page 5 - subpage 1 ;;;
IntroJapanTextData_Page5_Subpage1:
; 研究は順調に進みつつあった (research was continuing smoothly)
    dw $0050,$000D
    dw $0860,$0960
    dw $0870,$0970
    dw $0290,$0390
    dw $0840,$0940
    dw $0850,$0950
    dw $0250,$0350
    dw $0C40,$0D40
    dw $02F0,$03F0
    dw $0210,$0310
    dw $0210,$0310
    dw $0000,$0100
    dw $0EF0,$0760
    dw $00F0,$01F0


;;; $D30D: Page 5 - subpage 2 ;;;
IntroJapanTextData_Page5_Subpage2:
; そんなある日スペースコロニーから突然連絡が入った (one day I got a sudden transmission from the space colony)
    dw $0000,$0018
    dw $00E0,$01E0
    dw $04D0,$05D0
    dw $0240,$0340
    dw $0000,$0100
    dw $0480,$0580
    dw $0AC0,$0BC0
    dw $0E60,$0F60
    dw $0E70,$0F40
    dw $0650,$0750
    dw $0E60,$0F60
    dw $0E90,$0F90
    dw $0E20,$0F20
    dw $0EA0,$0FA0
    dw $0650,$0750
    dw $0050,$0150
    dw $0460,$0560
    dw $0880,$0980
    dw $0890,$0990
    dw $0820,$0920
    dw $0830,$0930
    dw $04E0,$0150
    dw $0CB0,$0DB0
    dw $0EF0,$0760
    dw $00F0,$01F0


;;; $D371: Page 6 ;;;
IntroJapanTextData_Page6:
; 非常事態だ (it's an emergency)
    dw $0090,$0005
    dw $0AE0,$0BE0
    dw $0AF0,$0BF0
    dw $0C00,$0D00
    dw $0C10,$0D10
    dw $05E0,$01F0


;;; $D389: Instruction list - mode 7 object $D401 (page 1) ;;;
InstList_Mode7Object_Page1:
    dw Instruction_LoadIntroJapanTextPage1
    dw $0001,Mode7_Transfer_Data
    dw Instruction_EnableCinematicBGTilemapUpdates_duplicate
    dw Mode7Objects_Instruction_Delete


;;; $D393: Instruction list - mode 7 object $D407 (page 2 - subpage 1) ;;;
InstList_Mode7Object_Page2_Subpage1:
    dw Instruction_LoadIntroJapanTextPage2_Subpage1
    dw $0001,Mode7_Transfer_Data
    dw Instruction_EnableCinematicBGTilemapUpdates_duplicate
    dw Mode7Objects_Instruction_Delete


;;; $D39D: Instruction list - mode 7 object $D40D (page 2 - subpage 2) ;;;
InstList_Mode7Object_Page2_Subpage2:
    dw $0001,Mode7_Transfer_Data
    dw Mode7Objects_Instruction_GotoY
    dw InstList_Mode7Object_Page2_Subpage2


;;; $D3A5: Instruction list - enable cinematic BG tilemap updates and page 2 done input ;;;
InstList_EnableCinematicBGTilemapUpdates_Page2DoneInput:
    dw Instruction_EnableCinematicBGTilemapUpdates_Page2DoneInput
    dw Mode7Objects_Instruction_Delete


;;; $D3A9: Instruction list - mode 7 object $D413 (page 3 - subpage 1) ;;;
InstList_Mode7Object_Page3_Subpage1:
    dw Instruction_LoadIntroJapanTextPage3_Subpage1
    dw $0001,Mode7_Transfer_Data
    dw Instruction_EnableCinematicBGTilemapUpdates_duplicate
    dw Mode7Objects_Instruction_Delete


;;; $D3B3: Instruction list - mode 7 object $D419 (page 3 - subpage 2) ;;;
InstList_Mode7Object_Page3_Subpage2:
    dw $0001,Mode7_Transfer_Data
    dw Mode7Objects_Instruction_GotoY
    dw InstList_Mode7Object_Page3_Subpage2


;;; $D3BB: Instruction list - enable cinematic BG tilemap updates and page 3 done input ;;;
InstList_EnableCinematicBGTilemapUpdates_Page3DoneInput:
    dw Instruction_EnableCinematicBGTilemapUpdates_Page3DoneInput
    dw Mode7Objects_Instruction_Delete


;;; $D3BF: Instruction list - mode 7 object $D41F (page 4 - subpage 1) ;;;
InstList_Mode7Object_Page4_Subpage1:
    dw Instruction_LoadIntroJapanTextPage4_Subpage1
    dw $0001,Mode7_Transfer_Data
    dw Instruction_EnableCinematicBGTilemapUpdates_duplicate
    dw Mode7Objects_Instruction_Delete


;;; $D3C9: Instruction list - mode 7 object $D425 (page 4 - subpage 2) ;;;
InstList_Mode7Object_Page4_Subpage2:
    dw $0001,Mode7_Transfer_Data
    dw Mode7Objects_Instruction_GotoY
    dw InstList_Mode7Object_Page4_Subpage2


;;; $D3D1: Instruction list - enable cinematic BG tilemap updates and page 4 done input ;;;
InstList_EnableCinematicBGTilemapUpdates_Page4DoneInput:
    dw Instruction_EnableCinematicBGTilemapUpdates_Page4DoneInput
    dw Mode7Objects_Instruction_Delete


;;; $D3D5: Instruction list - mode 7 object $D42B (page 5 - subpage 1) ;;;
InstList_Mode7Object_Page5_Subpage1:
    dw Instruction_LoadIntroJapanTextPage5_Subpage1
    dw $0001,Mode7_Transfer_Data
    dw Instruction_EnableCinematicBGTilemapUpdates_duplicate
    dw Mode7Objects_Instruction_Delete


;;; $D3DF: Instruction list - mode 7 object $D431 (page 5 - subpage 2) ;;;
InstList_Mode7Object_Page5_Subpage2:
    dw $0001,Mode7_Transfer_Data
    dw Mode7Objects_Instruction_GotoY
    dw InstList_Mode7Object_Page5_Subpage2


;;; $D3E7: Instruction list - enable cinematic BG tilemap updates and page 5 done input ;;;
InstList_EnableCinematicBGTilemapUpdates_Page5DoneInput:
    dw Instruction_EnableCinematicBGTilemapUpdates_Page5DoneInput
    dw Mode7Objects_Instruction_Delete


;;; $D3EB: Instruction list - mode 7 object $D437 (page 6) ;;;
InstList_Mode7Object_Page6:
    dw Instruction_LoadIntroJapanTextPage6
    dw $0001,Mode7_Transfer_Data
    dw Instruction_EnableCinematicBGTilemapUpdates_duplicate_again
    dw Mode7Objects_Instruction_Delete


if !FEATURE_KEEP_UNREFERENCED
;;; $D3F5: Instruction list - mode 7 object $D43D (unused, broken) ;;;
UNUSED_InstList_Mode7Object_D43D_8BD3F5:
    dw UNUSED_Instruction_LoadIntroJapanText_NonExistent
    dw $0001,Mode7_Transfer_Data
    dw Instruction_EnableCinematicBGTilemapUpdates
    dw Mode7Objects_Instruction_Delete
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D3FF: Mode 7 transfer data - dummy ;;;
Mode7_Transfer_Data:
    db $00,$00


;;; $D401: Mode 7 objects. Japanese intro text ;;;
Mode7Objects_IntroJapanText_Page1:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_Mode7Object_Page1                                        ; Instruction list pointer

Mode7Objects_IntroJapanText_Page2_Subpage1:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_Mode7Object_Page2_Subpage1                               ; Instruction list pointer

Mode7Objects_IntroJapanText_Page2_Subpage2:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw Instruction_LoadIntroJapanTextPage2_Subpage2                      ; Pre-instruction
    dw InstList_Mode7Object_Page2_Subpage2                               ; Instruction list pointer

Mode7Objects_IntroJapanText_Page3_Subpage1:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_Mode7Object_Page3_Subpage1                               ; Instruction list pointer

Mode7Objects_IntroJapanText_Page3_Subpage2:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw PreInstruction_LoadIntroJapanTextPage3_Subpage2                   ; Pre-instruction
    dw InstList_Mode7Object_Page3_Subpage2                               ; Instruction list pointer

Mode7Objects_IntroJapanText_Page4_Subpage1:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_Mode7Object_Page4_Subpage1                               ; Instruction list pointer

Mode7Objects_IntroJapanText_Page4_Subpage2:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw PreInstruction_LoadIntroJapanTextPage4_Subpage2                   ; Pre-instruction
    dw InstList_Mode7Object_Page4_Subpage2                               ; Instruction list pointer

Mode7Objects_IntroJaanText_Page5_Subpage1:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_Mode7Object_Page5_Subpage1                               ; Instruction list pointer

Mode7Objects_IntroJapanText_Page5_Subpage2:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw PreInstruction_LoadIntroJapanTextPage5_Subpage2                   ; Pre-instruction
    dw InstList_Mode7Object_Page5_Subpage2                               ; Instruction list pointer

Mode7Objects_IntroJapanText_Page6:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_Mode7Object_Page6                                        ; Instruction list pointer

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Mode7Objects_8BD43D:
    dw RTS_8B93D9                                                        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw UNUSED_InstList_Mode7Object_D43D_8BD3F5                           ; Instruction list pointer
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D443: Game state 27h (ending and credits) ;;;
GameState27_EndingAndCredits:
    PHP : PHB
    PHK : PLB
    REP #$30
    PEA .manualReturn-1
    JMP.W (CinematicFunction)

  .manualReturn:
    LDA.W CinematicSpriteObject_FrameCounter : BMI .zeroTimer
    INC : STA.W CinematicSpriteObject_FrameCounter

  .zeroTimer:
    INC.W CinematicFrameCounter
    JSR Handle_CinematicSpriteObjects
    JSR HandleFinalScreen_CinematicBGObjects
    JSR Handle_CreditsObject
    JSL PaletteFXObject_Handler
    JSR Draw_CinematicSpriteObjects_EndingCredits
    JSR Handle_ShootingStars
    JSR HandleMode7TransformMatrixAndBG1Position
    PLB : PLP
    RTL


;;; $D474: Handle final screen cinematic BG objects ;;;
HandleFinalScreen_CinematicBGObjects:
; Used for "see you next mission" and item percentage
    LDA.W CinematicFunction : CMP.W #CinematicFunction_PostCredits_FadeFromWhite : BMI .return
    JSR Handle_CinematicBGObjects

  .return:
    RTS


;;; $D480: Cinematic function - ending - setup ;;;
CinematicFunction_Ending_Setup:
    STZ.B DP_IRQCmd : STZ.B DP_NextIRQCmd
    LDX.W #$0008

  .wait8Frames:
    JSL WaitForNMI
    DEX : BPL .wait8Frames
    JSR Setup_PPU_ZebesDestruction
    LDA.W #MessageBoxIndex : DEC #2 : SEC : SBC.W #Mode7TransformationAngle : TAX

  .loopClearRAM:
    STZ.W Mode7TransformationAngle,X
    DEX #2 : BPL .loopClearRAM
    LDX.W #$0000

  .loopPalettes:
    LDA.L Palettes_CloudSpritesInZebesExplosionScene,X : STA.L Palettes,X
    INX #2 : CPX.W #$0200 : BMI .loopPalettes
    LDA.W #Tiles_Zebes_Being_Zoomed_Out_during_Zebes_Explosion_Mode7>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Zebes_Being_Zoomed_Out_during_Zebes_Explosion_Mode7 : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl ZebesExplosionZoomedOutMode7Tiles
    LDA.W #Tiles_Yellow_Clouds_during_Zebes_Explosion>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Yellow_Clouds_during_Zebes_Explosion : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl YellowCloudsZebesExplosionTiles
    LDA.W #InterleavedTilesTilemap_ZebesBeingZoomedOutExplosion_Mode7>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #InterleavedTilesTilemap_ZebesBeingZoomedOutExplosion_Mode7 : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl ZebesBeingZoomedOutExplosionInterleavedTilesTilemap
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$00 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl ZebesBeingZoomedOutExplosionInterleavedTilesTilemap
    dw $4000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$20 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl ZebesBeingZoomedOutExplosionInterleavedTilesTilemap
    dw $4000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$60 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl YellowCloudsZebesExplosionTiles
    dw $4000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$00 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$00,$19
    dl ZebesExplosionZoomedOutMode7Tiles
    dw $4000
    LDA.B #$02 : STA.W $420B
    REP #$30
    LDA.W #Tiles_Zebes_Explosion>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Zebes_Explosion : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl ZebesExplosionTiles
    LDA.W #Tiles_Gunship_Ceres_Mode7>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Gunship_Ceres_Mode7 : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl CeresGunshipMode7Tiles
    LDA.W #Gunship_Ceres_Tilemap>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Gunship_Ceres_Tilemap : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl CeresCutsceneTilemap_ShipFront
    LDX.W #$0300
    LDA.W #$8C8C

  .loopTilemap:
    STA.L CeresCutsceneTilemap_ShipFront,X
    INX #2 : CPX.W #$4000 : BMI .loopTilemap
    LDA.W #Wide_Part_of_Zebes_Explosion_Tilemap>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Wide_Part_of_Zebes_Explosion_Tilemap : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl WidePartOfZebesExplosionTilemap
    LDA.W #Concentric_Wide_Part_of_Zebes_Explosion_Tilemap>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Concentric_Wide_Part_of_Zebes_Explosion_Tilemap : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl ConcentricWidePartOfZebesExplosionTilemap
    LDA.W #Eclipse_of_Zebes_during_Explosion_Tilemap>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Eclipse_of_Zebes_during_Explosion_Tilemap : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl EclipseOfZebesDuringExplosionTilemap
    LDA.W #Blank_BG2_Tilemap>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Blank_BG2_Tilemap : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl EndingBlankTilemap
    LDA.W #Tiles_Font3_Background>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Font3_Background : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl EndingFont3Tiles
    LDA.W #InterleavedTilesTilemap_GreyCloudsDuringZebesExplosion_Mode7>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #InterleavedTilesTilemap_GreyCloudsDuringZebesExplosion_Mode7 : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl FadingPalettes
    LDA.W #InterleavedTilesTilemap_BigZebesDuringZebesExplosion_Mode7>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #InterleavedTilesTilemap_BigZebesDuringZebesExplosion_Mode7 : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl BigZebesDuringZebesExplosionTilemap
    LDA.W #$0100 : STA.W $211B : STA.B DP_Mode7TransMatrixA
    STZ.W $211C : STZ.B DP_Mode7TransMatrixB
    STZ.W $211D : STZ.B DP_Mode7TransMatrixC
    STA.W $211E : STA.B DP_Mode7TransMatrixD
    LDA.W #$0080 : STA.W $211F : STA.B DP_Mode7TransOriginX
    STA.W $2120 : STA.B DP_Mode7TransOriginY
    LDA.W #$0020 : STA.W Mode7TransformationAngle
    LDA.W #$0040 : STA.W Mode7TransformationZoomLevel
    LDA.W #$0000 : STA.W CinematicBG1_XPosition : STA.W CinematicBG1_YPosition
    STZ.W DoorPointer
    STZ.W Layer1XPosition : STZ.W Layer1YPosition
    JSL Clear_PaletteFXObjects
    JSL Enable_PaletteFXObjects
    JSL EnableNMI
    STZ.W CreditsObject_ShootingStarsEnable
    SEP #$20
    LDA.B #$11 : STA.B DP_MainScreenLayers
    LDA.B #$01 : STA.B DP_SubScreenLayers
    LDA.B #$02 : STA.B DP_ColorMathA
    LDA.B #$11 : STA.B DP_ColorMathB
    REP #$20
    LDA.W #$0000
    LDY.W #CinematicSpriteObjectDefinitions_Right
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0000
    LDY.W #CinematicSpriteObjectDefinitions_Left
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0001
    LDY.W #CinematicSpriteObjectDefinitions_Right
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0001
    LDY.W #CinematicSpriteObjectDefinitions_Left
    JSR Spawn_CinematicSpriteObject_Y
    STZ.W ScreenFadeDelay
    LDA.W #$0002 : STA.W ScreenFadeCounter
    LDA.W #CinematicFunction_Ending_WaitForMusicToChange : STA.W CinematicFunction
    LDA.W #$0000
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$FF33
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$0005
    LDY.W #$000E
    JSL QueueMusicDataOrTrack_YFrameDelay
    RTS


;;; $D6D7: Cinematic function - ending - wait for music to change ;;;
CinematicFunction_Ending_WaitForMusicToChange:
    JSL CheckIfMusicIsQueued
    BCS .return
    LDY.W #PaletteFXObjects_ExplodingZebesLava
    JSL Spawn_PaletteFXObject
    LDY.W #PaletteFXObjects_FadeOutExplodingZebesCrust
    JSL Spawn_PaletteFXObject
    LDA.W #CinematicFunc_Ending_ZebesDestruction0_CloudsOnSide_FadingIn : STA.W CinematicFunction

  .return:
    RTS


;;; $D6F2: Cinematic function - ending - Zebes destruction scene 0 - zooming out, clouds on left/right - fading in ;;;
CinematicFunc_Ending_ZebesDestruction0_CloudsOnSide_FadingIn:
    JSR CinematicFunction_Ending_ZebesDestruction0_CloudsOnSide
    JSR AdvanceFastScreenFadeIn
    BCC .return
    LDA.W #CinematicFunction_Ending_ZebesDestruction0_CloudsOnSide : STA.W CinematicFunction

  .return:
    RTS


;;; $D701: Cinematic function - ending - Zebes destruction scene 0 - zooming out, clouds on left/right ;;;
CinematicFunction_Ending_ZebesDestruction0_CloudsOnSide:
    LDA.W CinematicFrameCounter : BIT.W #$0001 : BNE .zoomOut
    LDA.W Mode7TransformationAngle : SEC : SBC.W #$0001 : AND.W #$00FF : STA.W Mode7TransformationAngle

  .zoomOut:
    LDA.W Mode7TransformationZoomLevel : CLC : ADC.W #$0002 : STA.W Mode7TransformationZoomLevel
    CMP.W #$0180 : BMI .return
    JSR AdvanceFastScreenFadeOut
    BCC .return
    LDA.W #CineFunc_Ending_ZebesDestruction1_CloudsOnTopBottom_Setup : STA.W CinematicFunction

  .return:
    RTS


;;; $D731: Cinematic function - ending - Zebes destruction scene 1 - zooming out, clouds on top/bottom - setup ;;;
CineFunc_Ending_ZebesDestruction1_CloudsOnTopBottom_Setup:
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$00 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl GreyCloudsDuringZebesExplosionTilemap
    dw $4000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$20 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl GreyCloudsDuringZebesExplosionTilemap
    dw $4000
    LDA.B #$02 : STA.W $420B
    REP #$30
    LDA.W #Tiles_Grey_Clouds_during_Zebes_Explosion_Mode7>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Grey_Clouds_during_Zebes_Explosion_Mode7 : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl GreyCloudsDuringZebesExplosionTilemap
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$00 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$00,$19
    dl GreyCloudsDuringZebesExplosionTilemap
    dw $4000
    LDA.B #$02 : STA.W $420B
    REP #$30
    JSL Clear_PaletteFXObjects
    JSR Clear_CinematicSpriteObjects
    LDY.W #PaletteFXObjects_FadeOutExplodingZebesGreyClouds
    JSL Spawn_PaletteFXObject
    LDA.W #$0000
    LDY.W #CinematicSpriteObjectDefinitions_YellowClouds_Top_TopHalf
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0000
    LDY.W #CinematicSpriteObjectDefinitions_Top_BottomHalf
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0000
    LDY.W #CinematicSpriteObjectDefinitions_Bottom_TopHalf
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0000
    LDY.W #CinematicSpriteObjectDefinitions_Bottom_BottomHalf
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$0020 : STA.W Mode7TransformationAngle
    LDA.W #$0040 : STA.W Mode7TransformationZoomLevel
    LDA.W #$0000 : STA.W CinematicBG1_XPosition : STA.W CinematicBG1_YPosition
    LDA.W #CineFunc_Ending_ZebesDestruction1_CloudsOnTopBottom_FadingIn : STA.W CinematicFunction
    RTS


;;; $D7F8: Cinematic function - ending - Zebes destruction scene 1 - zooming out, clouds on top/bottom - fading in ;;;
CineFunc_Ending_ZebesDestruction1_CloudsOnTopBottom_FadingIn:
    JSR CinematicFunction_Ending_ZebesDestruction1_CloudsOnTopBottom
    JSR AdvanceFastScreenFadeIn
    BCC .return
    LDA.W #CinematicFunction_Ending_ZebesDestruction1_CloudsOnTopBottom : STA.W CinematicFunction

  .return:
    RTS


;;; $D807: Cinematic function - ending - Zebes destruction scene 1 - zooming out, clouds on top/bottom ;;;
CinematicFunction_Ending_ZebesDestruction1_CloudsOnTopBottom:
    LDA.W CinematicFrameCounter : BIT.W #$0001 : BNE +
    LDA.W Mode7TransformationAngle : SEC : SBC.W #$0001 : AND.W #$00FF : STA.W Mode7TransformationAngle

+   LDA.W Mode7TransformationZoomLevel : CLC : ADC.W #$0003 : STA.W Mode7TransformationZoomLevel
    CMP.W #$0180 : BMI .return
    JSR AdvanceFastScreenFadeOut
    BCC .return
    LDA.W #CinematicFunc_Ending_ZebesDestruction2_CrossFade_Setup : STA.W CinematicFunction

  .return:
    RTS


;;; $D837: Cinematic function - ending - Zebes destruction scene 2 - cross-fade to space view - setup ;;;
CinematicFunc_Ending_ZebesDestruction2_CrossFade_Setup:
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$00 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl BigZebesZebesExplosionTiles
    dw $4000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$20 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl BigZebesZebesExplosionTiles
    dw $4000
    LDA.B #$02 : STA.W $420B
    REP #$30
    LDA.W #Tiles_Big_Zebes_during_Zebes_Explosion>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Big_Zebes_during_Zebes_Explosion : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl BigZebesZebesExplosionTiles
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$00 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$00,$19
    dl BigZebesZebesExplosionTiles
    dw $4000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$40 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl ZebesExplosionTiles
    dw $6000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$70 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl WidePartOfZebesExplosionTilemap
    dw $0800
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$74 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl ConcentricWidePartOfZebesExplosionTilemap
    dw $0800
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$78 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl EclipseOfZebesDuringExplosionTilemap
    dw $0800
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$7C : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl EndingBlankTilemap
    dw $0800
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$50 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl EndingFont3Tiles
    dw $1000
    LDA.B #$02 : STA.W $420B
    LDA.B #$02 : STA.B DP_SpriteSizeAddr
    REP #$30
    JSL Clear_PaletteFXObjects
    JSR Clear_CinematicSpriteObjects
    LDX.W #$0100

  .loopPalettes:
    LDA.L Palettes_ZebesExplosionScene,X : STA.L Palettes,X
    INX #2 : CPX.W #$0200 : BMI .loopPalettes
    LDY.W #CinematicSpriteObjectDefinitions_ExplodingZebes_Zebes
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_ExplodingZebes_Lava
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_ExplodingZebes_PurpleGlow
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_ExplodingZebes_Stars
    JSR Spawn_CinematicSpriteObject_Y
    STZ.W Mode7TransformationAngle
    LDA.W #$0040 : STA.W Mode7TransformationZoomLevel
    LDA.W #$0100 : STA.B DP_Mode7TransMatrixA
    STZ.B DP_Mode7TransMatrixB : STZ.B DP_Mode7TransMatrixC
    STA.B DP_Mode7TransMatrixD
    LDA.W #$0080 : STA.B DP_Mode7TransOriginX : STA.B DP_Mode7TransOriginY
    STZ.W CinematicBG1_XPosition : STZ.W CinematicBG1_YPosition
    SEP #$20
    LDA.B #$01 : STA.B DP_MainScreenLayers
    LDA.B #$10 : STA.B DP_SubScreenLayers
    LDA.B #$02 : STA.B DP_ColorMathA
    LDA.B #$21 : STA.B DP_ColorMathB
    REP #$20
    JSR PaletteCrossFading_CopyCurrentPalettesToFadingPalettes
    JSR PaletteCrossFading_DecomposePaletteDataForFading
    LDX.W #$01A0
    LDY.W #$0010
    JSR PaletteCrossFading_ClearYColorsStartingFromColorIndexX
    LDX.W #$01E0
    LDY.W #$0010
    JSR PaletteCrossFading_ClearYColorsStartingFromColorIndexX
    JSR PaletteCrossFading_ComposeFadingPalettes
    LDA.W #$003F : STA.W CinematicFunctionTimer
    LDA.W #CinematicFunc_Ending_ZebesDestruction2_CrossFade_FadingIn : STA.W CinematicFunction
    RTS


;;; $DA02: Cinematic function - ending - Zebes destruction scene 2 - cross-fade to space view - fading in ;;;
CinematicFunc_Ending_ZebesDestruction2_CrossFade_FadingIn:
    JSR CinematicFunction_Ending_ZebesDestruction2_CrossFade
    JSR AdvanceFastScreenFadeIn
    BCC .return
    LDA.W #$0002 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter
    LDA.W #CinematicFunction_Ending_ZebesDestruction2_CrossFade : STA.W CinematicFunction

  .return:
    RTS


;;; $DA1A: Cinematic function - ending - Zebes destruction scene 2 - cross-fade to space view ;;;
CinematicFunction_Ending_ZebesDestruction2_CrossFade:
    LDA.W Mode7TransformationZoomLevel : CLC : ADC.W #$0004 : STA.W Mode7TransformationZoomLevel
    LDA.W CinematicFunctionTimer : BIT.W #$0001 : BNE .decTimer
    LDX.W #$00E0
    LDY.W #$0010
    JSR PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX
    LDX.W #$01A0
    LDY.W #$0010
    JSR PaletteCrossFading_FadeInYColorsStartingFromColorIndexX
    LDX.W #$01E0
    LDY.W #$0010
    JSR PaletteCrossFading_FadeInYColorsStartingFromColorIndexX
    JSR PaletteCrossFading_ComposeFadingPalettes

  .decTimer:
    DEC.W CinematicFunctionTimer : BMI .setupLoop
    JMP .return

  .setupLoop:
    LDX.W #$0000

  .loopPalettes:
    LDA.L Palettes_ZebesExplosionScene,X : STA.L Palettes,X
    INX #2 : CPX.W #$0100 : BMI .loopPalettes
    SEP #$20
    STZ.B DP_Mode7Settings
    LDA.B #$70 : STA.B DP_BG1TilemapAddrSize
    LDA.B #$78 : STA.B DP_BG2TilemapAddrSize
    STZ.B DP_BG3TilemapAddrSize : STZ.B DP_BG4TilemapAddrSize
    LDA.B #$44 : STA.B DP_BGTilesAddr
    STZ.B DP_BGTilesAddr+1
    LDA.B #$10 : STA.B DP_MainScreenLayers
    STZ.B DP_SubScreenLayers
    STZ.B DP_WindowAreaMainScreen : STZ.B DP_WindowAreaSubScreen
    STZ.B DP_NextGameplayColorMathA : STZ.B DP_NextGameplayColorMathB
    STZ.B DP_ColorMathA : STZ.B DP_ColorMathB
    LDA.B #$E0 : STA.W $2132
    LDA.B #$20 : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.B #$40 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor2
    STZ.B DP_Mosaic
    REP #$20
    STZ.W CinematicBG1_XSubPosition : STZ.W CinematicBG1_XPosition
    STZ.W CinematicBG1_YSubPosition : STZ.W CinematicBG1_YPosition
    STZ.W CinematicBG1_XSubSpeed : STZ.W CinematicBG1_XSpeed
    STZ.W CinematicBG1_YSubSpeed : STZ.W CinematicBG1_YSpeed
    STZ.W LayerBlending_DefaultConfig
    STZ.B DP_BG2XScroll : STZ.B DP_BG2YScroll
    STZ.W ScreenFadeDelay
    LDA.W #$0002 : STA.W ScreenFadeCounter
    LDA.W #CinematicFunc_Ending_SpaceView_LoadGunshipBG : STA.W CinematicFunction
    STZ.W CinematicFunctionTimer

  .return:
    RTS


;;; $DAD3: Cinematic function - ending - space view - load gunship BG ;;;
CinematicFunc_Ending_SpaceView_LoadGunshipBG:
    LDA.W CinematicFunctionTimer : CMP.W #$0008 : BPL .timerGreaterThan7
    ASL : TAX
    LDY.W Mode7Stack
    LDA.W #$00C0 : STA.W Mode7Transfer.control,Y
    LDA.W .sourceAddresses,X : STA.W Mode7Transfer.src,Y
    LDA.W #$007F : STA.W Mode7Transfer.src+2,Y
    LDA.W #$0800 : STA.W Mode7Transfer.size,Y
    LDA.W .destinationAddresses,X : STA.W Mode7Transfer.dest,Y
    LDA.W #$0080 : STA.W Mode7Transfer.inc,Y
    TYA : CLC : ADC.W #$0009 : STA.W Mode7Stack
    BRA +

  .timerGreaterThan7:
    ASL : TAX
    LDY.W Mode7Stack
    LDA.W #$0080 : STA.W Mode7Transfer.control,Y
    LDA.W .sourceAddresses,X : STA.W Mode7Transfer.src,Y
    LDA.W #$007F : STA.W Mode7Transfer.src+2,Y
    LDA.W #$0800 : STA.W Mode7Transfer.size,Y
    LDA.W .destinationAddresses,X : STA.W Mode7Transfer.dest,Y
    LDA.W #$0000 : STA.W Mode7Transfer.inc,Y
    TYA : CLC : ADC.W #$0009 : STA.W Mode7Stack

+   LDA.W CinematicFunctionTimer : INC : STA.W CinematicFunctionTimer
    CMP.W #$0010 : BMI .return
    SEP #$20
    LDA.B #$01 : STA.B DP_BGModeSize
    REP #$20
    STZ.W CinematicFunctionTimer
    LDA.W #RTS_8BDB9D : STA.W CinematicFunction

  .return:
    RTS

  .sourceAddresses:
    dw $0000,$0800,$1000,$1800,$2000,$2800,$3000,$3800 ; Tiles source addresses (bank $7F)
    dw $4000,$4800,$5000,$5800,$6000,$6800,$7000,$7800 ; Tilemap source addresses (bank $7F)
  .destinationAddresses:
    dw $0000,$0800,$1000,$1800,$2000,$2800,$3000,$3800 ; Tiles destination addresses (VRAM)
    dw $0000,$0800,$1000,$1800,$2000,$2800,$3000,$3800 ; Tilemap destination addresses (VRAM)


;;; $DB9D: RTS ;;;
RTS_8BDB9D:
    RTS


;;; $DB9E: Cinematic function - ending - space view - change music ;;;
CinematicFunc_Ending_SpaceView_ChangeMusic:
    DEC.W CinematicFunctionTimer : BEQ .changeMusic
    BPL .return

  .changeMusic:
    LDA.W #$0000
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$FF3C
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$0005
    LDY.W #$000E
    JSL QueueMusicDataOrTrack_YFrameDelay
    LDA.W #CinematicFunc_Ending_SpaceView_GunshipEmergence_Setup : STA.W CinematicFunction

  .return:
    RTS


;;; $DBC4: Cinematic function - ending - space view - gunship emergence - setup ;;;
CinematicFunc_Ending_SpaceView_GunshipEmergence_Setup:
    JSL CheckIfMusicIsQueued
    BCC .noMusicQueued
    RTS

  .noMusicQueued:
    SEP #$20
    LDA.B #$07 : STA.B DP_BGModeSize
    LDA.B #$80 : STA.B DP_Mode7Settings
    LDA.B #$11 : STA.B DP_MainScreenLayers
    STZ.B DP_SubScreenLayers : STZ.B DP_ColorMathA
    LDA.B #$30 : STA.B DP_ColorMathB
    LDA.B #$3F : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.B #$5F : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$9F : STA.B DP_ColorMathSubScreenBackdropColor2
    LDA.B #$00 : STA.B DP_BG1TilemapAddrSize
    LDA.B #$00 : STA.B DP_BGTilesAddr
    REP #$20
    LDA.W #$0000 : STA.L Palettes : STA.L Palettes_BG3P4 : STA.L Palettes_SpriteP0
    LDY.W #PaletteFXObjects_ZebesExplosionPlanetAfterglow
    JSL Spawn_PaletteFXObject
    LDY.W #PaletteFXObjects_GunshipEmergineFromZebesExplosion
    JSL Spawn_PaletteFXObject
    LDA.W #$0038 : STA.B DP_Mode7TransOriginX
    LDA.W #$0018 : STA.B DP_Mode7TransOriginY
    LDA.W #$FFB8 : STA.W CinematicBG1_XPosition
    LDA.W #$FF98 : STA.W CinematicBG1_YPosition
    LDA.W #$0C00 : STA.W Mode7TransformationZoomLevel
    LDA.W #$FF90 : STA.W Mode7TransformationAngle
    LDA.W #$0001 : STA.W CinematicFunctionTimer
    LDA.W #$00C0 : STA.W EndingShipXVelocity
    STZ.W EndingShipShakeIndex
    LDA.W #CinematicFunc_Ending_SpaceView_GunshipEmergence_SpinningFast : STA.W CinematicFunction
    RTS


;;; $DC4C: Fade out Zebes explosion afterglow ;;;
FadeOut_ZebesExplosion_AfterGlow:
    PHP
    REP #$30
    DEC.W CinematicFunctionTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    SEP #$20
    LDA.B DP_ColorMathSubScreenBackdropColor0 : SEC : SBC.B #$01 : STA.B DP_ColorMathSubScreenBackdropColor0
    CMP.B #$20 : BPL .color1
    LDA.B #$20 : STA.B DP_ColorMathSubScreenBackdropColor0

  .color1:
    LDA.B DP_ColorMathSubScreenBackdropColor1 : SEC : SBC.B #$01 : STA.B DP_ColorMathSubScreenBackdropColor1
    CMP.B #$40 : BPL .color2
    LDA.B #$40 : STA.B DP_ColorMathSubScreenBackdropColor1

  .color2:
    LDA.B DP_ColorMathSubScreenBackdropColor2 : SEC : SBC.B #$01 : STA.B DP_ColorMathSubScreenBackdropColor2
    CMP.B #$80 : BPL .checkColors
    LDA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor2

  .checkColors:
    LDA.B DP_ColorMathSubScreenBackdropColor0 : CMP.B #$20 : BNE .setTimer
    LDA.B DP_ColorMathSubScreenBackdropColor1 : CMP.B #$40 : BNE .setTimer
    LDA.B DP_ColorMathSubScreenBackdropColor2 : CMP.B #$80 : BNE .setTimer
    STZ.B DP_ColorMathA : STZ.B DP_ColorMathB

  .setTimer:
    REP #$20
    LDA.W #$0008 : STA.W CinematicFunctionTimer

  .return:
    PLP
    RTS


;;; $DCA5: Cinematic function - ending - space view - gunship emergence - spinning fast ;;;
CinematicFunc_Ending_SpaceView_GunshipEmergence_SpinningFast:
    LDA.W IntroCrossFadeTimer : BEQ .fadeOutAfterGlow
    DEC : STA.W IntroCrossFadeTimer
    BRA .timerExpired

  .fadeOutAfterGlow:
    JSR FadeOut_ZebesExplosion_AfterGlow

  .timerExpired:
    LDA.W Mode7TransformationAngle : SEC : SBC.W #$0004 : AND.W #$00FF : STA.W Mode7TransformationAngle
    LDA.W EndingShipShakeIndex : ASL #2 : TAX
    LDA.W CinematicBG1_XSubPosition : CLC : ADC.W .shakingXVelocities+2,X : STA.W CinematicBG1_XSubPosition
    LDA.W CinematicBG1_XPosition : ADC.W .shakingXVelocities,X : STA.W CinematicBG1_XPosition
    LDA.W EndingShipShakeIndex : INC : AND.W #$000F : STA.W EndingShipShakeIndex
    LDA.W Mode7TransformationZoomLevel : SEC : SBC.W #$0008 : STA.W Mode7TransformationZoomLevel
    CMP.W #$05B0 : BPL .return
    LDA.W #$0001 : STA.W IntroCrossFadeTimer
    STZ.W EndingShipShakeIndex
    LDA.W #CinematicFunc_Ending_SpaceView_GunshipEmergence_SpinningSlow : STA.W CinematicFunction

  .return:
    RTS

  .shakingXVelocities:
    dw $0000,$8000, $0000,$8000, $0000,$8000, $0000,$8000
    dw $FFFF,$8000, $FFFF,$8000, $0000,$8000, $0000,$8000
    dw $0000,$8000, $0000,$8000, $FFFF,$8000, $FFFF,$8000
    dw $0000,$8000, $0000,$8000, $FFFF,$8000, $FFFF,$8000


;;; $DD42: Cinematic function - ending - space view - gunship emergence - spinning slow ;;;
CinematicFunc_Ending_SpaceView_GunshipEmergence_SpinningSlow:
    JSR FadeOut_ZebesExplosion_AfterGlow
    LDA.W Mode7TransformationAngle : CMP.W #$00E0 : BEQ .notE0
    SEC : SBC.W #$0001 : AND.W #$00FF : STA.W Mode7TransformationAngle

  .notE0:
    LDA.W EndingShipShakeIndex : ASL #2 : TAX
    LDA.W CinematicBG1_XSubPosition : CLC : ADC.W .shakingXVelocities+2,X : STA.W CinematicBG1_XSubPosition
    LDA.W CinematicBG1_XPosition : ADC.W .shakingXVelocities,X : STA.W CinematicBG1_XPosition
    LDA.W EndingShipShakeIndex : INC : AND.W #$0007 : STA.W EndingShipShakeIndex
    LDA.W Mode7TransformationZoomLevel : SEC : SBC.W #$0002 : STA.W Mode7TransformationZoomLevel
    CMP.W #$04A0 : BPL .return
    LDA.W #CinematicFunc_Ending_SpaceView_GunshipEmergence_FlyToCamera : STA.W CinematicFunction
    LDA.W #$8000 : STA.W EndingShipShakeIndex
    STZ.W EndingShipXVelocity
    LDA.W #$000F
    JSL CheckIfEvent_inA_HasHappened
    BCC .return
    LDY.W #CinematicSpriteObjectDefinitions_CrittersEscape
    LDA.W #$0004 : STA.B DP_Temp12
    JSR Spawn_CinematicSpriteObject_YToIndex12

  .return:
    RTS

  .shakingXVelocities:
    dw $0001,$0000,$0001,$0000,$0001,$0000,$FFFF,$0000
    dw $FFFF,$0000,$0001,$0000,$0001,$0000,$FFFF,$0000


;;; $DDCD: Cinematic function - ending - space view - gunship emergence - fly into camera ;;;
CinematicFunc_Ending_SpaceView_GunshipEmergence_FlyToCamera:
    JSR FadeOut_ZebesExplosion_AfterGlow
    LDA.W EndingShipXSubVelocity : SEC : SBC.W #$0100 : STA.W EndingShipXSubVelocity
    LDA.W EndingShipXVelocity : SBC.W #$0000 : STA.W EndingShipXVelocity
    LDA.W CinematicBG1_XSubPosition : CLC : ADC.W EndingShipXSubVelocity : STA.W CinematicBG1_XSubPosition
    LDA.W CinematicBG1_XPosition : ADC.W EndingShipXVelocity : STA.W CinematicBG1_XPosition
    LDA.W Mode7TransformationZoomLevel : CMP.W #$0180 : BPL +
    LDA.W CinematicFrameCounter : BIT.W #$0003 : BNE +
    LDA.W Mode7TransformationAngle : CMP.W #$0010 : BEQ +
    CLC : ADC.W #$0002 : AND.W #$00FF : STA.W Mode7TransformationAngle

+   LDA.W Mode7TransformationZoomLevel : CMP.W #$0020 : BMI .zoomLessThan20
    SEC : SBC.W #$0004 : STA.W Mode7TransformationZoomLevel
    RTS

  .zoomLessThan20:
    LDY.W #CinematicSpriteObjectDefinitions_TheOperationWas
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #RTS_8BDE63 : STA.W CinematicFunction
    LDX.W #$001E

  .loopPalette:
    LDA.W .greyGunshipPalette,X : STA.L Palettes_BG12P5,X
    DEX #2 : BPL .loopPalette
    RTS

  .greyGunshipPalette:
    dw $0000,$6F7B,$4A52,$1CE7,$0000,$5AD6,$4A52,$35AD
    dw $2529,$7FFF,$56B5,$294A,$4210,$2D6B,$18C6,$7FFF


;;; $DE63: RTS. Cinematic function - ending - space view - gunship emergence - freeze frame ;;;
RTS_8BDE63:
    RTS


;;; $DE64: Cinematic function - ending - space view - transition to credits ;;;
CinematicFunction_Ending_SpaceView_GunshipEmergence_Credits:
    LDA.W #$0001 : STA.W ScreenFadeCounter
    JSR AdvanceFastScreenFadeOut
    BCC .return
    JSL EnableNMI
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    LDA.W #CinematicFunction_Credits_Setup : STA.W CinematicFunction

  .return:
    RTS


;;; $DE80: Cinematic function - credits - setup ;;;
CinematicFunction_Credits_Setup:
    JSR Setup_PPU_Credits
    JSR Clear_CinematicSpriteObjects
    JSL Clear_PaletteFXObjects
    LDX.W #$0000

  .loopPalettes:
    LDA.L Palettes_Credits,X : STA.L Palettes,X
    INX #2 : CPX.W #$0100 : BMI .loopPalettes
    LDA.W #Tiles_Samus_Waiting_for_Credits_to_End>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Samus_Waiting_for_Credits_to_End : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl CreditsTilemap
    LDA.W #Tiles_PostCredits_SuitlessSamus>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_PostCredits_SuitlessSamus : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl PostCreditsSuitlessSamusTiles
    LDA.W #Tiles_PostCredits_Samus_Shooting_the_Screen>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_PostCredits_Samus_Shooting_the_Screen : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl PostCreditsSamusShootingScreenTiles
    LDA.W #Tiles_Font3_Background>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_Font3_Background : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl CreditsFont3
    LDA.W #Samus_Waiting_for_Credits_to_End_Tilemap>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Samus_Waiting_for_Credits_to_End_Tilemap : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl SamusWaitingForCreditsTilemap
    LDA.W #InterleavedTilesTilemapPostCreditsSamusBeamMode7>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #InterleavedTilesTilemapPostCreditsSamusBeamMode7 : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl PostCreditsSamusBeamInterleavedTilesTilemap
    LDA.W #Tiles_PostCredits_Samus_Transformation_Effect>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_PostCredits_Samus_Transformation_Effect : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl PostCreditsSamusTransformationEffectTiles
    LDA.W #PostCredits_Samus_Transformation_Effect_Tilemap>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #PostCredits_Samus_Transformation_Effect_Tilemap : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl PostCreditsSamusTransformationEffectTilemap
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$20 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl PostCreditsSamusTransformationEffectTiles
    dw $0100
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$24 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl PostCreditsSamusTransformationEffectTilemap
    dw $0800
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$40 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl CreditsFont3
    dw $1000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$60 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl PostCreditsSamusShootingScreenTiles
    dw $4000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$50 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl SamusWaitingForCreditsToEndTiles
    dw $2000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$4C : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl SamusWaitingForCreditsTilemap
    dw $0800
    LDA.B #$02 : STA.W $420B
    REP #$30
    LDA.W #Tiles_PostCredits_SuperMetroid_Icon>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Tiles_PostCredits_SuperMetroid_Icon : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl PostCreditsSuperMetroidIcon_Tiles
    LDA.W #PostCredits_SuperMetroid_Icon_Tilemap>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #PostCredits_SuperMetroid_Icon_Tilemap : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl PostCreditsSuperMetroidIcon_Tilemap
    LDA.W IGTHours : CMP.W #$0003 : BPL .gameTimeOver3
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$00 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl PostCreditsSuitlessSamusTiles
    dw $4000
    LDA.B #$02 : STA.W $420B
    BRA +

  .gameTimeOver3:
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$00 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl SamusWaitingForCreditsToEndTiles
    dw $4000
    LDA.B #$02 : STA.W $420B

+   REP #$30
    LDA.W #$0100 : STA.W $211B : STA.B DP_Mode7TransMatrixA
    STZ.W $211C : STZ.B DP_Mode7TransMatrixB
    STZ.W $211D : STZ.B DP_Mode7TransMatrixC
    STA.W $211E : STA.B DP_Mode7TransMatrixD
    LDA.W #$0068 : STA.W $211F : STA.B DP_Mode7TransOriginX
    LDA.W #$0070 : STA.W $2120 : STA.B DP_Mode7TransOriginY
    LDA.W #$FFF8 : STA.W CinematicBG1_XPosition
    LDA.W #$FFE8 : STA.W CinematicBG1_YPosition
    STZ.W Mode7TransformationAngle
    LDA.W #$0900 : STA.W Mode7TransformationZoomLevel
    JSL EnableNMI
    SEP #$20
    LDA.B #$0F : STA.B DP_Brightness
    REP #$20
    STZ.W Layer1XPosition : STZ.W Layer1YPosition
    JSL Enable_HDMAObjects
    LDX.W #$01FE
    LDA.W #$0000

  .loop:
    STA.L TitleScreenGradientColorMathSubScreenBackdropColorHDMATable,X
    DEX #2 : BPL .loop
    JSR Initialize_ShootingStars
    LDA.W #Credits_Tilemap>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #Credits_Tilemap : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl CreditsTilemap
    LDA.W #$007F
    JSL Clear_CinematicBGObjects_CinematicBGTilemap
    LDA.W #$007F
    JSR Clear_CreditsObject_CinematicBGTilemapInA
    JSR Enable_CreditsObject
    LDA.W #$0003 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter
    LDY.W #CreditsObjectDefinition
    JSR Spawn_CreditsObject
    LDA.W #RTS_8BDB9D : STA.W CinematicFunction
    RTS


;;; $E0F4: Cinematic function - post-credits - blank screen ;;;
CinematicFunction_PostCredits_BlankScreen:
    DEC.W CinematicFunctionTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #CinematicFunction_PostCredits_FadeInShootingStars : STA.W CinematicFunction
    LDA.W #$0078 : STA.W CinematicFunctionTimer
    SEP #$20
    LDA.B #$10 : STA.B DP_MainScreenLayers
    REP #$20

  .return:
    RTS


;;; $E110: Cinematic function - post-credits - fade in shooting stars ;;;
CinematicFunction_PostCredits_FadeInShootingStars:
    JSL HandleFadingIn
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$0F : BEQ .fadedIn
    REP #$20
    RTS

  .fadedIn:
    SEP #$20
    LDA.B #$02 : STA.B DP_MainScreenLayers
    LDA.B #$10 : STA.B DP_SubScreenLayers
    LDA.B #$02 : STA.B DP_ColorMathA
    LDA.B #$22 : STA.B DP_ColorMathB
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    JSR PaletteCrossFading_CopyCurrentPalettesToFadingPalettes
    JSR PaletteCrossFading_DecomposePaletteDataForFading
    LDX.W #$0040
    LDY.W #$0010
    JSR PaletteCrossFading_ClearYColorsStartingFromColorIndexX
    JSR PaletteCrossFading_ComposeFadingPalettes
    LDA.W #$0020 : STA.W CinematicFunctionTimer
    LDA.W #CinematicFunction_PostCredits_FadeInSamus : STA.W CinematicFunction
    RTS


;;; $E158: Cinematic function - post-credits - fade in Samus ;;;
CinematicFunction_PostCredits_FadeInSamus:
    LDX.W #$0040
    LDY.W #$0010
    JSR PaletteCrossFading_FadeInYColorsStartingFromColorIndexX
    JSR PaletteCrossFading_ComposeFadingPalettes
    DEC.W CinematicFunctionTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    SEP #$20
    LDA.B #$12 : STA.B DP_MainScreenLayers
    LDA.B #$04 : STA.B DP_SubScreenLayers
    LDA.B #$02 : STA.B DP_ColorMathA
    LDA.B #$02 : STA.B DP_ColorMathB
    REP #$20
    LDA.W #$00B4 : STA.W CinematicFunctionTimer
    LDA.W #CinematicFunction_PostCredits_WavySamus : STA.W CinematicFunction
    JSL Spawn_WavySamus_HDMAObject

  .return:
    RTS


;;; $E190: Cinematic function - post-credits - wavy Samus ;;;
CinematicFunction_PostCredits_WavySamus:
    LDA.B DP_BG3YScroll : CLC : ADC.W #$0002 : STA.B DP_BG3YScroll
    DEC.W CinematicFunctionTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDX.W #$0000

  .loopTilemap:
    LDA.L Tilemap_PostCredits_DeeRForCe,X : STA.L $7E3240,X
    INX #2 : CPX.W #$0240 : BMI .loopTilemap
    JSR CinematicBGObjects_Update32x32CinematicBGTilemap
    SEP #$20
    LDA.B #$01 : STA.B DP_MainScreenLayers
    STZ.B DP_SubScreenLayers : STZ.B DP_ColorMathA : STZ.B DP_ColorMathB
    REP #$20
    LDA.W #$00B4 : STA.W CinematicFunctionTimer
    LDA.W #CinematicFunction_PostCredits_DeerForce : STA.W CinematicFunction
    STZ.W WavySamus_Enable

  .return:
    RTS


;;; $E1D2: Cinematic function - post-credits - Deer Force ;;;
CinematicFunction_PostCredits_DeerForce:
    DEC.W CinematicFunctionTimer : BEQ .decTimer
    JMP .return

  .decTimer:
    LDA.W #$007F : STA.W CinematicFunctionTimer
    LDA.W IGTHours : CMP.W #$0003 : BMI .bestEnding
    CMP.W #$000A : BMI .mediocreEnding
    LDY.W #CinematicSpriteObjectDefs_SuitedSamus_Idle_Head_Helmet
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_SuitedSamus_Idle_Body
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #CinematicFunction_PostCredits_IdleSamus1 : STA.W CinematicFunction
    SEP #$20
    LDA.B #$10 : STA.B DP_MainScreenLayers
    STZ.B DP_SubScreenLayers : STZ.B DP_ColorMathA : STZ.B DP_ColorMathB
    REP #$20
    BRA .return

  .mediocreEnding:
    JSR PaletteCrossFading_CopyCurrentPalettesToFadingPalettes
    JSR PaletteCrossFading_DecomposePaletteDataForFading
    LDY.W #CinematicSpriteObjectDefinitions_SuitedSamus_Idle_Head
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_SuitedSamus_Idle_Body
    JSR Spawn_CinematicSpriteObject_Y
    LDX.W #$01C0
    LDY.W #$0010
    JSR PaletteCrossFading_ClearYColorsStartingFromColorIndexX
    BRA .notWorstEnding

  .bestEnding:
    JSR PaletteCrossFading_CopyCurrentPalettesToFadingPalettes
    JSR PaletteCrossFading_DecomposePaletteDataForFading
    LDY.W #CinematicSpriteObjectDefinitions_SuitlessSamus_Idle
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_SuitlessSamus_Idle_Legs
    JSR Spawn_CinematicSpriteObject_Y

  .notWorstEnding:
    LDX.W #$01A0
    LDY.W #$0010
    JSR PaletteCrossFading_ClearYColorsStartingFromColorIndexX
    JSR PaletteCrossFading_ComposeFadingPalettes
    SEP #$20
    LDA.B #$02 : STA.B DP_MainScreenLayers
    LDA.B #$10 : STA.B DP_SubScreenLayers
    LDA.B #$02 : STA.B DP_ColorMathA
    LDA.B #$22 : STA.B DP_ColorMathB
    REP #$20
    LDA.W #CinematicFunc_PostCredits_IdleSamus_1_CrossFadeOutSamusSuit : STA.W CinematicFunction

  .return:
    RTS


;;; $E265: Cinematic function - post-credits - idle Samus 1/2 - cross-fade out Samus suit ;;;
CinematicFunc_PostCredits_IdleSamus_1_CrossFadeOutSamusSuit:
    LDA.W CinematicFunctionTimer : BIT.W #$0003 : BNE CinematicFunction_PostCredits_IdleSamus1
    LDX.W #$0040
    LDY.W #$0010
    JSR PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX
    LDA.W IGTHours : CMP.W #$0003 : BMI .lessThan3
    LDX.W #$01C0
    LDY.W #$0010
    JSR PaletteCrossFading_FadeInYColorsStartingFromColorIndexX

  .lessThan3:
    LDX.W #$01A0
    LDY.W #$0010
    JSR PaletteCrossFading_FadeInYColorsStartingFromColorIndexX
    JSR PaletteCrossFading_ComposeFadingPalettes
; fallthrough to CinematicFunction_PostCredits_IdleSamus1


;;; $E293: Cinematic function - post-credits - idle Samus 1/2 ;;;
CinematicFunction_PostCredits_IdleSamus1:
    LDA.W CinematicFunctionTimer : DEC
    STA.W CinematicFunctionTimer
    CMP.W #$0041 : BPL .return
    LDX.W #$023E
    LDA.W #$007F

  .loopTilemap9:
    STA.L $7E3240,X
    DEX #2 : BPL .loopTilemap9
    LDX.W #$0000

  .loopTilemapC:
    LDA.L Tilemap_PostCredits_1994Nintendo,X : STA.L $7E3300,X
    INX #2 : CPX.W #$0080 : BMI .loopTilemapC
    JSR CinematicBGObjects_Update32x32CinematicBGTilemap
    SEP #$20
    LDA.B #$01 : STA.B DP_MainScreenLayers
    STZ.B DP_SubScreenLayers : STZ.B DP_ColorMathA : STZ.B DP_ColorMathB
    REP #$20
    LDA.W #$00B4 : STA.W IntroCrossFadeTimer
    LDA.W #CinematicFunction_PostCredits_1994Nintendo : STA.W CinematicFunction

  .return:
    RTS


;;; $E2DD: Cinematic function - post-credits - 1994 Nintendo ;;;
CinematicFunction_PostCredits_1994Nintendo:
    DEC.W PostCreditsSamusBeamVRAMTransferIndex : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W IGTHours : CMP.W #$0003 : BMI .gameTimeOver10
    CMP.W #$000A : BMI .gameTimeOver10
    LDA.W #CinematicFunction_PostCredits_IdleSamus2 : STA.W CinematicFunction
    BRA .return

  .gameTimeOver10:
    SEP #$20
    LDA.B #$02 : STA.B DP_MainScreenLayers
    LDA.B #$10 : STA.B DP_SubScreenLayers
    LDA.B #$02 : STA.B DP_ColorMathA
    LDA.B #$22 : STA.B DP_ColorMathB
    REP #$20
    LDA.W #CinematicFunc_PostCredits_IdleSamus2_CrossFadeOutSamusSuit : STA.W CinematicFunction

  .return:
    RTS


;;; $E314: Cinematic function - post-credits - idle Samus 2/2 - cross-fade out Samus suit ;;;
CinematicFunc_PostCredits_IdleSamus2_CrossFadeOutSamusSuit:
    LDA.W CinematicFunctionTimer : BIT.W #$0003 : BNE CinematicFunction_PostCredits_IdleSamus2
    LDX.W #$0040
    LDY.W #$0010
    JSR PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX
    LDA.W IGTHours : CMP.W #$0003 : BMI .gameTimeUnder3
    LDX.W #$01C0
    LDY.W #$0010
    JSR PaletteCrossFading_FadeInYColorsStartingFromColorIndexX

  .gameTimeUnder3:
    LDX.W #$01A0
    LDY.W #$0010
    JSR PaletteCrossFading_FadeInYColorsStartingFromColorIndexX
    JSR PaletteCrossFading_ComposeFadingPalettes
; fallthrough to CinematicFunction_PostCredits_IdleSamus2


;;; $E342: Cinematic function - post-credits - idle Samus 2/2 ;;;
CinematicFunction_PostCredits_IdleSamus2:
    DEC.W CinematicFunctionTimer : BPL .return
    SEP #$20
    LDA.B #$10 : STA.B DP_MainScreenLayers
    STZ.B DP_SubScreenLayers : STZ.B DP_ColorMathA : STZ.B DP_ColorMathB
    LDA.B #$07 : STA.B DP_BGModeSize
    LDA.B #$80 : STA.B DP_Mode7Settings
    LDA.B #$00 : STA.B DP_BG1TilemapAddrSize
    STZ.B DP_BGTilesAddr
    REP #$20
    LDA.W #RTS_8BDB9D : STA.W CinematicFunction
    STZ.W PostCreditsSMIconVRAMTransferIndex
    LDA.W IGTHours : CMP.W #$0003 : BMI .bestEnding
    CMP.W #$000A : BMI .mediocreEnding
    LDY.W #CinematicSpriteObjectDefinitions_ThumbsUp_Head_Helmet
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_ThumbsUp_Arm
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_ThumbsUp_Body
    JSR Spawn_CinematicSpriteObject_Y
    BRA .return

  .mediocreEnding:
    LDY.W #CinematicSpriteObjectDefinitions_ThumbsUp_Head
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_ThumbsUp_Arm
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefinitions_ThumbsUp_Body
    JSR Spawn_CinematicSpriteObject_Y
    BRA .return

  .bestEnding:
    LDY.W #CinematicSpriteObjectDefs_SuitlessSamus_LettingHairDown
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefs_SuitlessSamus_LettingHairDown_Legs
    JSR Spawn_CinematicSpriteObject_Y

  .return:
    RTS


;;; $E3AE: Cinematic function - post-credits - Samus shoots screen ;;;
CinematicFunction_PostCredits_SamusShootsScreen:
    LDA.W PostCreditsSMIconVRAMTransferIndex : BEQ .timerExpired
    DEC : STA.W PostCreditsSMIconVRAMTransferIndex
    LDX.W #$0180
    LDY.W #$0010
    JSR PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX
    LDA.W CinematicFunctionTimer : BEQ .timerExpired
    JSR PaletteCrossFading_ComposeFadingPalettes

  .timerExpired:
    LDA.W CinematicFunctionTimer : BEQ .transitionPalette
    DEC : STA.W CinematicFunctionTimer
    BRA +

  .transitionPalette:
    JSR TransitionSamusPaletteToBlack

+   LDA.W Mode7TransformationAngle : SEC : SBC.W #$0008 : AND.W #$00FF : STA.W Mode7TransformationAngle
    LDA.W Mode7TransformationZoomLevel : SEC : SBC.W #$0040 : STA.W Mode7TransformationZoomLevel
    CMP.W #$0018 : BMI .zoomGreaterThan18
    RTS

  .zoomGreaterThan18:
    LDA.W #$0018 : STA.W Mode7TransformationZoomLevel
    LDA.W #CinematicFunction_PostCredits_FadeToWhite : STA.W CinematicFunction
    LDA.W #$00B4 : STA.W CinematicFunctionTimer
    STZ.W PostCreditsSMIconVRAMTransferIndex
    RTS


;;; $E409: Transition Samus palette to black ;;;
TransitionSamusPaletteToBlack:
    LDA.W PostCreditsSamusFadeTimer : BEQ .return
    DEC : STA.W PostCreditsSamusFadeTimer
    LDX.W #$01E0
    LDY.W #$0010
    JSR PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX
    JSR PaletteCrossFading_ComposeFadingPalettes

  .return:
    RTS


;;; $E41F: Transfer post-credits Super Metroid icon to VRAM ;;;
TransferPostCreditsSuperMetroidIconToVRAM:
    LDA.W PostCreditsSamusFadeTimer : BNE .return
    LDA.W PostCreditsSMIconVRAMTransferIndex : CMP.W #$0006 : BMI .loading

  .return:
    RTS

  .loading:
    ASL #3 : TAY
    LDX.W VRAMWriteStack
    LDA.W .size,Y : STA.B VRAMWrite.size,X
    INX #2
    LDA.W .source,Y : STA.B VRAMWrite.size,X
    INX #2
    SEP #$20
    LDA.W .source+2,Y : STA.B VRAMWrite.size,X
    REP #$20
    INX
    LDA.W .destination,Y : STA.B VRAMWrite.size,X
    INX #2 : STX.W VRAMWriteStack
    INC.W PostCreditsSMIconVRAMTransferIndex
    RTS

    ; Item percentage Japanese text
  .size:
    dw $0400
  .source:
    dl ItemPercentageJapanText
    db $00
  .destination:
    dw $4800

    ; Super Metroid icon tiles
    dw $0800
    dl PostCreditsSuperMetroidIcon_Tiles
    db $00
    dw $6000

    dw $0800
    dl PostCreditsSuperMetroidIcon_Tiles+$800
    db $00
    dw $6400

    dw $0800
    dl PostCreditsSuperMetroidIcon_Tiles+$1000
    db $00
    dw $6800

    dw $0800
    dl PostCreditsSuperMetroidIcon_Tiles+$1800
    db $00
    dw $6C00

    ; Super Metroid icon tilemap
    dw $0800
    dl PostCreditsSuperMetroidIcon_Tilemap
    db $00
    dw $5400


;;; $E48A: Cinematic function - post-credits - fade to white ;;;
CinematicFunction_PostCredits_FadeToWhite:
    JSR TransitionSamusPaletteToBlack
    JSR TransferPostCreditsSuperMetroidIconToVRAM
    DEC.W CinematicFunctionTimer : BEQ .timerExpired
    RTS

  .timerExpired:
    SEP #$20
    LDA.B #$01 : STA.B DP_BGModeSize
    LDA.B #$11 : STA.B DP_MainScreenLayers
    STZ.B DP_SubScreenLayers : STZ.B DP_ColorMathA
    LDA.B #$31 : STA.B DP_ColorMathB
    LDA.B #$3F : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.B #$5F : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$9F : STA.B DP_ColorMathSubScreenBackdropColor2
    STZ.B DP_Mode7Settings
    LDA.B #$4E : STA.B DP_BG1TilemapAddrSize
    LDA.B #$54 : STA.B DP_BGTilesAddr
    REP #$20
    LDX.W #$0180

  .loopPalettes:
    LDA.L Palettes_PostCredits,X : STA.L Palettes,X
    INX #2 : CPX.W #$01A0 : BMI .loopPalettes
    STZ.W CinematicBG1_XPosition : STZ.W CinematicBG1_YPosition
    LDA.W #CinematicFunction_PostCredits_FadeFromWhite : STA.W CinematicFunction
    LDA.W #$0020 : STA.W CinematicFunctionTimer
    JSL Enable_CinematicBGObjects
    JSL Enable_CinematicBGTilemap_Updates
    LDA.W #$4C00 : STA.W CinematicBGObject_VRAMAddr
    LDX.W #$007E
    LDA.W #$007F

  .loopTilemap:
    STA.L CinematicBGTilemap_RowsCD,X
    DEX #2 : BPL .loopTilemap
    JSR CinematicBGObjects_Update32x32CinematicBGTilemap
    RTS


;;; $E504: Cinematic function - post-credits - fade from white ;;;
CinematicFunction_PostCredits_FadeFromWhite:
    SEP #$20
    LDA.B DP_ColorMathSubScreenBackdropColor0 : SEC : SBC.B #$01 : STA.B DP_ColorMathSubScreenBackdropColor0
    CMP.B #$20 : BPL +
    LDA.B #$20 : STA.B DP_ColorMathSubScreenBackdropColor0

+   LDA.B DP_ColorMathSubScreenBackdropColor1 : SEC : SBC.B #$01 : STA.B DP_ColorMathSubScreenBackdropColor1
    CMP.B #$40 : BPL +
    LDA.B #$40 : STA.B DP_ColorMathSubScreenBackdropColor1

+   LDA.B DP_ColorMathSubScreenBackdropColor2 : SEC : SBC.B #$01 : STA.B DP_ColorMathSubScreenBackdropColor2
    CMP.B #$80 : BPL +
    LDA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor2

+   REP #$20
    DEC.W CinematicFunctionTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #RTS_8BE7BA : STA.W CinematicFunction
    LDA.W #$5000 : STA.W CinematicBGObject_VRAMAddr
    JSR CinematicBGObjects_Update32x32CinematicBGTilemap
    LDA.W #$0100 : STA.W Layer1XPosition : STA.W Layer1YPosition
    LDY.W #CinematicSpriteObjectDefinitions_SuperMetroidIcon_S_TopHalf
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefs_SuperMetroidIcon_S_BottomHalf
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefs_SuperMetroidIcon_Circle_TopHalf
    JSR Spawn_CinematicSpriteObject_Y
    LDY.W #CinematicSpriteObjectDefs_SuperMetroidIcon_Circle_BottomHalf
    JSR Spawn_CinematicSpriteObject_Y
    LDX.W #$001E
    LDA.W #$0000

  .loopBGPalette:
    STA.L Palettes_BG3P4,X
    DEX #2 : BPL .loopBGPalette
    LDX.W #$001E

  .loopSpirtePalette:
    LDA.L Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_0,X : STA.L Palettes_SpriteP7,X
    DEX #2 : BPL .loopSpirtePalette

  .return:
    RTS


;;; $E58A: Cinematic function - post-credits - grey out Super Metroid icon ;;;
CinematicFunction_PostCredits_GreyOutSuperMetroidIcon:
; Handles palette transition to greyscale of Super Metroid icon
; Fades the SM icon sprite from full colour to black whilst fading the SM icon background from black to grey
; When the transition is done, the sprite no longer needs to be drawn
    PHX : PHY : PHB
    LDA.W CinematicFunctionTimer : ASL #2 : TAX
    LDA.W .spritePalette,X : PHA
    LDA.W .BGPalette,X : TAY
    PEA.W Palettes_EndingSuperMetroidIconFadingToGrey_BG_0>>8&$FF00 : PLB : PLB
    LDX.W #$001E

  .loopBGPalette:
    LDA.W $0000,Y : STA.L Palettes_BG3P4,X
    DEY #2
    DEX #2 : BPL .loopBGPalette
    PLY
    LDX.W #$001E

  .loopSpritePalette:
    LDA.W $0000,Y : STA.L Palettes_SpriteP7,X
    DEY #2
    DEX #2 : BPL .loopSpritePalette
    LDA.W CinematicFunctionTimer : INC : STA.W CinematicFunctionTimer
    CMP.W #$0010 : BMI .return
    LDA.W #RTS_8BE7BA : STA.W CinematicFunction
    JSR Clear_CinematicSpriteObjects
    PLB
    LDY.W #CinematicBGObjectDefinitions_PostCredits_ItemPercentage
    LDA.W #$4C00
    JSR Spawn_CinematicBGObject
    PLY : PLX
    RTS

  .return:
    PLB : PLY : PLX
    RTS

; Pointers to (the last colour of) increasingly grey palettes
  .BGPalette:
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_10 ; These pointers read the list backwards :(
  .spritePalette:
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_1
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_F
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_2
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_E
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_3
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_D
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_4
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_C
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_5
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_B
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_6
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_A
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_7
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_9
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_8
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_8
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_9
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_7
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_A
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_6
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_B
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_5
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_C
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_4
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_D
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_3
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_E
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_2
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_F
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_1
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_10


;;; $E627: Instruction - draw item percentage count ;;;
Instruction_DrawItemPercentageCount:
    PHP : PHB
    PHK : PLB
    REP #$30
    PHX : PHY
    LDX.W #$0008
    STZ.B DP_Temp12

  .loopTanks:
    LDA.W .tankValuesEnergy,X : TAY
    LDA.W $0000,Y : STA.W $4204
    SEP #$20
    LDA.W .tankValuesEnergyDivisor,X : STA.W $4206
    NOP #7
    REP #$20
    LDA.W $4214 : CLC : ADC.B DP_Temp12 : STA.B DP_Temp12
    DEX #2 : BPL .loopTanks
    LDX.W #$0014

  .loopItems:
    LDA.W CollectedItems : BIT.W .itemBits,X : BEQ .nextItem
    INC.B DP_Temp12

  .nextItem:
    DEX #2 : BPL .loopItems
    LDX.W #$0008

  .loopBeams:
    LDA.W CollectedBeams : BIT.W .beamBits,X : BEQ .nextBeam
    INC.B DP_Temp12

  .nextBeam:
    DEX #2 : BPL .loopBeams
    LDA.B DP_Temp12 : STA.W $4204
    SEP #$20
    LDA.B #$0A : STA.W $4206
    NOP #7
    REP #$20
    LDA.W $4214 : STA.W $4204
    LDA.W $4216 : STA.B DP_Temp16
    SEP #$20
    LDA.B #$0A : STA.W $4206
    NOP #7
    REP #$20
    LDA.W $4214 : STA.B DP_Temp12
    LDA.W $4216 : STA.B DP_Temp14
    LDA.B DP_Temp12 : BEQ +
    ASL #2 : TAY
    LDA.W TilemapValuesForDecimalDigits_topHalf,Y : STA.L CinematicBGTilemap_RowsCD+$9C
    LDA.W TilemapValuesForDecimalDigits_bottomHalf,Y : STA.L CinematicBGTilemap_RowsCD+$DC

+   LDA.B DP_Temp14 : BNE +
    LDA.B DP_Temp12 : BEQ .unitsOnly
    LDA.B DP_Temp14

+   ASL #2 : TAY
    LDA.W TilemapValuesForDecimalDigits_topHalf,Y : STA.L CinematicBGTilemap_RowsCD+$9E
    LDA.W TilemapValuesForDecimalDigits_bottomHalf,Y : STA.L CinematicBGTilemap_RowsCD+$DE

  .unitsOnly:
    LDA.B DP_Temp16 : ASL #2 : TAY
    LDA.W TilemapValuesForDecimalDigits_topHalf,Y
    STA.L CinematicBGTilemap_RowsCD+$A0
    LDA.W TilemapValuesForDecimalDigits_bottomHalf,Y
    STA.L CinematicBGTilemap_RowsCD+$E0
    LDA.W #$386A
    STA.L CinematicBGTilemap_RowsCD+$A2
    LDA.W #$387A
    STA.L CinematicBGTilemap_RowsCD+$E2
    PLY : PLX : PLB : PLP
    RTS

; RAM addresses to measure
  .tankValuesEnergy:
    dw MaxEnergy
  .tankValuesReserve:
    dw MaxReserveEnergy
  .tankValuesMissiles:
    dw MaxMissiles
  .tankValuesSuperMissiles:
    dw MaxSuperMissiles
  .tankValuesPowerBombs:
    dw MaxPowerBombs

; Divisors
  .tankValuesEnergyDivisor:
    dw $0064
  .tankValuesReserveDivisor:
    dw $0064
  .tankValuesMissilesDivisor:
    dw $0005
  .tankValuesSuperMissilesDivisor:
    dw $0005
  .tankValuesPowerBombsDivisor:
    dw $0005

  .itemBits:
    dw $0001,$0020,$0004,$1000,$0002,$0008,$0100,$0200
    dw $2000,$4000,$8000

  .beamBits:
    dw $0001,$0002,$0004,$0008,$1000


TilemapValuesForDecimalDigits:
  .topHalf:
    dw $3860
  .bottomHalf:
    dw       $3870 ; 0
    dw $3861,$3871 ; 1
    dw $3862,$3872 ; 2
    dw $3863,$3873 ; 3
    dw $3864,$3874 ; 4
    dw $3865,$3875 ; 5
    dw $3866,$3876 ; 6
    dw $3867,$3877 ; 7
    dw $3868,$3878 ; 8
    dw $3869,$3879 ; 9


;;; $E769: Instruction - draw item percentage Japanese text ;;;
Instruction_DrawItemPercentageJapanText:
    PHX
    LDA.W JapanText : BEQ .return
    LDX.W #$007E

  .loop:
    LDA.L Tilemap_PostCredits_ItemPercentageJapanText,X : STA.L CinematicBGTilemap_Rows17_18,X
    DEX #2 : BPL .loop

  .return:
    PLX
    RTS


;;; $E780: Instruction - clear item percentage Japanese text ;;;
Instruction_ClearItemPercentageJapanText:
    PHX
    LDX.W #$007E
    LDA.W #$007F

  .loop:
    STA.L CinematicBGTilemap_Rows17_18,X
    DEX #2 : BPL .loop
    LDA.W #CinematicFunction_PostCredits_ScrollItemPercentageDown : STA.W CinematicFunction
    PLX
    RTS


;;; $E797: Cinematic function - post-credits - scroll item percentage down ;;;
CinematicFunction_PostCredits_ScrollItemPercentageDown:
; This is the end. Once the cinematic function is set to RTS, the game logic never progresses any further
    LDA.W CinematicBG1_YPosition : SEC : SBC.W #$0002 : STA.W CinematicBG1_YPosition
    CMP.W #$FFB1 : BPL .return
    LDY.W #CinematicBGObjectDefinitions_PostCredits_SeeYouNextMission
    LDA.W #$4C00
    JSR Spawn_CinematicBGObject
    LDA.W #RTS_8BE7BA : STA.W CinematicFunction
    JSL Write_supermetroid_ToSRAM

  .return:
    RTS


;;; $E7BA: RTS ;;;
RTS_8BE7BA:
    RTS


;;; $E7BB: Initialise shooting stars ;;;
Initialize_ShootingStars:
    PHP
    REP #$30
    LDY.W #ShootingStars_StarIndex
    LDX.W #$0000 : STX.B DP_Temp12

  .loop:
    PHX
    TXA : STA.W $0000,Y
    ASL #3 : TAX
    LDA.W #$0000 : STA.W $000C,Y : STA.W $000E,Y
    LDA.W ShootingStar_Table_delay,X : BEQ .zero
    STA.W $000A,Y
    LDA.W $0000,Y : ORA.W #$8000 : STA.W $0000,Y
    BRA +

  .zero:
    LDA.W #$0020 : STA.W $000A,Y

+   PLX
    LDA.W #$0080 : STA.W $0002,Y : STA.W $0006,Y
    LDA.W #$0000 : STA.W $0004,Y : STA.W $0008,Y
    TYA : CLC : ADC.W #$0010 : TAY
    INX : CPX.W #$0028 : BMI .loop
    PLP
    RTS


;;; $E812: Handle shooting stars ;;;
Handle_ShootingStars:
    PHP
    REP #$30
    LDA.W CreditsObject_ShootingStarsEnable : BNE .loopSetup
    PLP
    RTS

  .loopSetup:
    LDA.W #$0028 : STA.B DP_Temp16
    LDY.W #ShootingStars_StarIndex
    BRA .loopProcess

  .delay:
    LDA.W $000A,Y : DEC : STA.W $000A,Y
    BPL .gotoNextProcess
    LDA.W #$0020 : STA.W $000A,Y
    LDA.W $0000,Y : AND.W #$00FF : STA.W $0000,Y

  .gotoNextProcess:
    JMP .nextProcess

  .loopProcess:
    LDA.W $0000,Y : BMI .delay
    PHA
    AND.W #$FF00 : CMP.W #$0400 : BMI .lessThan4
    PLA : AND.W #$00FF : ASL #3 : TAX
    LDA.W $000C,Y : CLC : ADC.W ShootingStar_Table_Xaccel,X
    CLC : ADC.W ShootingStar_Table_Xaccel,X : STA.W $000C,Y
    LDA.W $000E,Y : CLC : ADC.W ShootingStar_Table_Yaccel,X
    CLC : ADC.W ShootingStar_Table_Yaccel,X : STA.W $000E,Y
    BRA +

  .lessThan4:
    PLA : AND.W #$00FF : ASL #3 : TAX
    LDA.W $000C,Y : CLC : ADC.W ShootingStar_Table_Xaccel,X : STA.W $000C,Y
    LDA.W $000E,Y : CLC : ADC.W ShootingStar_Table_Yaccel,X : STA.W $000E,Y

+   LDA.W $000C,Y : PHA
    XBA : AND.W #$00FF : BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp12
    PLA : XBA : AND.W #$FF00 : STA.B DP_Temp14
    LDA.W $0004,Y : CLC : ADC.B DP_Temp14 : STA.W $0004,Y
    LDA.W $0002,Y : ADC.B DP_Temp12 : STA.W $0002,Y
    LDA.W $000E,Y : PHA
    XBA : AND.W #$00FF : BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp12
    PLA : XBA : AND.W #$FF00 : STA.B DP_Temp14
    LDA.W $0008,Y : CLC : ADC.B DP_Temp14 : STA.W $0008,Y
    LDA.W $0006,Y : ADC.B DP_Temp12 : STA.W $0006,Y

  .nextProcess:
    TYA : CLC : ADC.W #$0010 : TAY
    DEC.B DP_Temp16 : BEQ .loopDrawSetup
    JMP .loopProcess

  .loopDrawSetup:
    LDA.W #$0028 : STA.B DP_Temp16
    LDX.W OAMStack
    LDY.W #ShootingStars_StarIndex

  .loopDraw:
    LDA.W $0000,Y : BMI .nextDraw
    LDA.W $0002,Y : BIT.W #$FF00 : BNE .offScreen
    SEC : SBC.W #$0004 : BIT.W #$FF00 : BNE .offScreen
    STA.W OAMLow,X
    LDA.W $0006,Y : BIT.W #$FF00 : BNE .offScreen
    SEC : SBC.W #$0004 : BIT.W #$FF00 : BNE .offScreen
    STA.W OAMLow+1,X
    LDA.W $000A,Y : DEC : STA.W $000A,Y
    BEQ .timerExpired
    BPL .nonZero

  .timerExpired:
    PHX
    LDA.W $0000,Y : PHA
    AND.W #$00FF : ASL #3 : TAX
    LDA.W ShootingStar_Table_timer,X : STA.W $000A,Y
    PLA : CLC : ADC.W #$0200 : STA.W $0000,Y
    PLX

  .nonZero:
    LDA.W $0000,Y : BIT.W #$FF00 : BEQ .nextDraw
    PHY
    XBA : AND.W #$00FF : TAY
    LDA.W .tilemapValues,Y : STA.W OAMLow+2,X
    PLY
    TXA : CLC : ADC.W #$0004 : TAX

  .nextDraw:
    TYA : CLC : ADC.W #$0010 : TAY
    DEC.B DP_Temp16 : BEQ .return
    JMP .loopDraw

  .return:
    STX.W OAMStack
    PLP
    RTS

  .offScreen:
    LDA.W #$0020 : STA.W $000A,Y
    LDA.W #$0080 : STA.W $0002,Y : STA.W $0006,Y
    LDA.W #$0000 : STA.W $0004,Y : STA.W $0008,Y
    STA.W $000C,Y : STA.W $000E,Y
    LDA.W $0000,Y : AND.W #$00FF : STA.W $0000,Y
    JMP .nextDraw

  .tilemapValues:
; Tile number and attributes, indexed by animation frame
    dw $0000,$09F0,$09F1,$09F2,$09F3,$09F3,$09F3,$09F3
    dw $09F3,$09F3,$09F3,$09F3,$09F3,$09F3,$09F3,$09F3
    dw $09F3,$09F3,$09F3,$09F3


;;; $E9CF: Shooting star table ;;;
ShootingStar_Table:
; Indexed by star index
  .Xaccel:
    dw $0010                   ; X acceleration. Unit 1/100h px/frame²
  .Yaccel:
    dw       $FFF0             ; Y acceleration. Unit 1/100h px/frame²
  .timer:
    dw             $0006       ; Animation timer reset value
  .delay:
    dw                   $0008 ; Delay before appearing
    dw $000C,$FFFF,$0006,$0000
    dw $000D,$FFF6,$0006,$0006
    dw $0008,$FFF0,$0006,$0000
    dw $0002,$FFF2,$0006,$0008
    dw $0010,$FFF8,$0006,$0000
    dw $0002,$FFFF,$0F00,$0000
    dw $0001,$FFFE,$0F00,$0000
    dw $0000,$FFFD,$0F00,$0000
    dw $0002,$FFFB,$0020,$0004
    dw $000F,$0010,$0006,$0008
    dw $0002,$0009,$0008,$0000
    dw $000C,$0008,$0006,$0000
    dw $0010,$0004,$0006,$0008
    dw $0008,$000C,$0008,$0000
    dw $0002,$0008,$0008,$0000
    dw $0002,$0004,$0F00,$0000
    dw $0002,$0001,$0F00,$0000
    dw $FFF3,$000D,$0004,$0008
    dw $FFF2,$0008,$0004,$0000
    dw $FFF9,$000E,$0006,$0000
    dw $FFFB,$0010,$0004,$0008
    dw $FFFC,$0005,$0020,$0000
    dw $FFFE,$0003,$0F00,$0000
    dw $FFFE,$0004,$0F00,$0000
    dw $FFFD,$0001,$0F00,$0000
    dw $FFF4,$0002,$0004,$0000
    dw $FFFA,$0005,$0020,$0000
    dw $FFFD,$0008,$0020,$0000
    dw $FFF2,$FFF7,$0004,$0008
    dw $FFF8,$FFF4,$0004,$0000
    dw $FFFA,$FFF2,$0006,$0000
    dw $FFF4,$FFF0,$0004,$0008
    dw $FFF8,$FFFC,$0020,$0000
    dw $FFFD,$FFFA,$0020,$0000
    dw $FFF9,$FFF8,$0020,$0000
    dw $FFFE,$FFFD,$0F00,$0000
    dw $FFFC,$FFFC,$0F00,$0000
    dw $FFF8,$FFFE,$0F00,$0000
    dw $FFF8,$FFFC,$0F00,$0000


;;; $EB0F: Instruction list - cinematic sprite object $EE9D (exploding Zebes - Zebes) ;;;
InstList_CinematicSpriteObjects_ExplodingZebes_Zebes_0:
    dw CinematicSpriteObject_Instruction_TimerInY,$0005

InstList_CinematicSpriteObjects_ExplodingZebes_Zebes_1:
    dw $000D,EndingSequenceSpritemaps_ExplodingPlanetZebesFrame1
    dw $000D,EndingSequenceSpritemaps_ExplodingPlanetZebesFrame2
    dw $000D,EndingSequenceSpritemaps_ExplodingPlanetZebesFrame3
    dw $000D,EndingSequenceSpritemaps_ExplodingPlanetZebesFrame4
    dw CinematicSpriteObject_Inst_DecrementTimer_GotoYIfNonZero
    dw InstList_CinematicSpriteObjects_ExplodingZebes_Zebes_1
    dw Instruction_FadeOutZoomedOutExplodingZebes
    dw $0020,EndingSequenceSpritemaps_ExplodingPlanetZebesFrame5
    dw $0020,EndingSequenceSpritemaps_ExplodingPlanetZebesFrame6
    dw $0020,EndingSequenceSpritemaps_ExplodingPlanetZebesFrame7
    dw $0020,EndingSequenceSpritemaps_ExplodingPlanetZebesFrame8
    dw Instruction_CineSpriteObjectSpawnZebesExplosionSilhouette
    dw CinematicSpriteObject_Instruction_Delete


;;; $EB3D: Instruction list - cinematic sprite object $EEA3 (exploding Zebes - purple glow) ;;;
InstList_CinematicSpriteObjects_ExplodingZebes_PurpleGlow:
    dw $0010,EndingSequenceSpritemaps_ExplodingPlanetZebesGlow
    dw $0010,EndingSequenceSpritemaps_ZebesSupernovaPart1
    dw $0010,EndingSequenceSpritemaps_ZebesSupernovaPart2
    dw $0010,EndingSequenceSpritemaps_ZebesSupernovaPart1
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObjects_ExplodingZebes_PurpleGlow


;;; $EB51: Instruction list - cinematic sprite object $EEA9 (exploding Zebes - stars) ;;;
InstList_CinematicSpriteObjects_ExplodingZebes_Stars:
    dw $0010,EndingSequenceSpritemaps_ZebesBoomStarryBackground
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObjects_ExplodingZebes_Stars


;;; $EB59: Instruction list - cinematic sprite object $EEAF (exploding Zebes - lava) ;;;
InstList_CinematicSpriteObjects_ExplodingZebes_Lava_0:
    dw $009C,$0000

InstList_CinematicSpriteObjects_ExplodingZebes_Lava_1:
    dw $000A,EndingSequenceSpritemaps_ExplodingPlanetZebesCoreFrame1
    dw $000A,EndingSequenceSpritemaps_ExplodingPlanetZebesCoreFrame2
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObjects_ExplodingZebes_Lava_1


;;; $EB69: Instruction list - cinematic sprite object $EEB5 (Zebes explosion - silhouette) ;;;
InstList_CinematicSpriteObjects_ExplodingZebes_Silhouette:
    dw $0008,EndingSequenceSpritemaps_ZebesSupernovaPart3
    dw Instruction_CinematicSpriteObject_StartZebesExplosion
    dw CinematicSpriteObject_Instruction_Delete


;;; $EB71: Instruction list - cinematic sprite object $EEBB (Zebes explosion - stars - right) ;;;
InstList_CinematicSpriteObjects_ExplodingZebes_Stars_Right:
    dw $0090,EndingSequenceSpritemaps_ZebesBoomStarryBackground
    dw Instruction_ZebesExplosionFinale
    dw $014C,EndingSequenceSpritemaps_ZebesBoomStarryBackground
    dw Instruction_EndZebesExplosion
    dw CinematicSpriteObject_Instruction_PreInstructionY
    dw Instruction_CinematicSpriteObject_ZebesExplosion_Stars_Left


;;; $EB81: Instruction list - cinematic sprite object $EEF7 (Zebes explosion - stars - left) ;;;
InstList_CinematicSpriteObjects_ExplodingZebes_Stars_Left:
    dw $0010,EndingSequenceSpritemaps_ZebesBoomStarryBackground
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObjects_ExplodingZebes_Stars_Left


;;; $EB89: Instruction list - cinematic sprite object $EEC1 (Zebes explosion - afterglow) ;;;
InstList_CinematicSpriteObjects_ExplodingZebes_AfterGlow:
    dw $0010,EndingSequenceSpritemaps_ZebesSupernovaPart4
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObjects_ExplodingZebes_AfterGlow


;;; $EB91: Instruction list - cinematic sprite object $EEC7 ('THE OPERATION WAS') ;;;
InstList_CinematicSpriteObjects_TheOperationWas_0:
    dw $0008,EndingSequenceSpritemaps_T
    dw $0008,EndingSequenceSpritemaps_TH
    dw $000F,EndingSequenceSpritemaps_THE
    dw $0008,EndingSequenceSpritemaps_THEO
    dw $0008,EndingSequenceSpritemaps_THEOP
    dw $0008,EndingSequenceSpritemaps_THEOPE
    dw $0008,EndingSequenceSpritemaps_THEOPER
    dw $0008,EndingSequenceSpritemaps_THEOPERA
    dw $0008,EndingSequenceSpritemaps_THEOPERAT
    dw $0008,EndingSequenceSpritemaps_THEOPERATI
    dw $0008,EndingSequenceSpritemaps_THEOPERATIO
    dw $000F,EndingSequenceSpritemaps_THEOPERATION
    dw $0008,EndingSequenceSpritemaps_THEOPERATIONW
    dw $0008,EndingSequenceSpritemaps_THEOPERATIONWA
    dw $000F,EndingSequenceSpritemaps_THEOPERATIONWAS
    dw Instruction_CinematicSpriteObject_SpawnCompletedSuccessfully

InstList_CinematicSpriteObjects_TheOperationWas_1:
    dw $000F,EndingSequenceSpritemaps_THEOPERATIONWAS
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObjects_TheOperationWas_1


;;; $EBD7: Instruction list - cinematic sprite object $EECD ('COMPLETED SUCCESSFULLY') ;;;
InstList_CinematicSpriteObjects_CompletedSuccessfully_0:
    dw $0008,EndingSequenceSpritemaps_C_ompleted
    dw $0008,EndingSequenceSpritemaps_CO
    dw $0008,EndingSequenceSpritemaps_COM
    dw $0008,EndingSequenceSpritemaps_COMP
    dw $0008,EndingSequenceSpritemaps_COMPL
    dw $0008,EndingSequenceSpritemaps_COMPLE
    dw $0008,EndingSequenceSpritemaps_COMPLET
    dw $0008,EndingSequenceSpritemaps_COMPLETE
    dw $000F,EndingSequenceSpritemaps_COMPLETED
    dw $0008,EndingSequenceSpritemaps_COMPLETEDS
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSU
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSUC
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSUCC
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSUCCE
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSUCCES
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSUCCESS
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSUCCESSF
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSUCCESSFU
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSUCCESSFUL
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSUCCESSFULL
    dw $000F,EndingSequenceSpritemaps_COMPLETEDSUCCESSFULLY
    dw Instruction_CinematicSpriteObject_SpawnClearTime

InstList_CinematicSpriteObjects_CompletedSuccessfully_1:
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSUCCESSFULLY
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObjects_CompletedSuccessfully_1


;;; $EC35: Instruction list - cinematic sprite object $EEFD (clear time) ;;;
InstList_CinematicSpriteObjects_ClearTime_0:
    dw $0008,EndingSequenceSpritemaps_C_lear
    dw $0008,EndingSequenceSpritemaps_CL
    dw $0008,EndingSequenceSpritemaps_CLE
    dw $0008,EndingSequenceSpritemaps_CLEA
    dw $000F,EndingSequenceSpritemaps_CLEAR
    dw $0008,EndingSequenceSpritemaps_CLEART
    dw $0008,EndingSequenceSpritemaps_CLEARTI
    dw $0008,EndingSequenceSpritemaps_CLEARTIM
    dw $000F,EndingSequenceSpritemaps_CLEARTIME
    dw Instruction_CineSpriteObject_SpawnClearTime_Hours_TensDigit
    dw $0008,EndingSequenceSpritemaps_CLEARTIME
    dw Instruction_CineSpriteObject_SpawnClearTime_Hours_OnesDigit
    dw $0008,EndingSequenceSpritemaps_CLEARTIME
    dw Instruction_CinematicSpriteObject_SpawnClearTime_Colon
    dw $0008,EndingSequenceSpritemaps_CLEARTIME
    dw Inst_CineSpriteObject_SpawnClearTime_Minutes_TensDigit
    dw $0008,EndingSequenceSpritemaps_CLEARTIME
    dw Inst_CineSpriteObject_SpawnClearTime_Minutes_OnesDigit
    dw $0080,EndingSequenceSpritemaps_CLEARTIME
    dw Instruction_CinematicSpriteObject_TransitionToCredits

InstList_CinematicSpriteObjects_ClearTime_1:
    dw $000F,EndingSequenceSpritemaps_CLEARTIME
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObjects_ClearTime_1


;;; $EC81: Instruction list - clear time digit ;;;
InstList_ClearTimeDigit_0:
    dw $0008,EndingSequenceSpritemaps_0
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_ClearTimeDigit_0

InstList_ClearTimeDigit_1:
    dw $0008,EndingSequenceSpritemaps_1
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_ClearTimeDigit_1

InstList_ClearTimeDigit_2:
    dw $0008,EndingSequenceSpritemaps_2
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_ClearTimeDigit_2

InstList_ClearTimeDigit_3:
    dw $0008,EndingSequenceSpritemaps_3
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_ClearTimeDigit_3

InstList_ClearTimeDigit_4:
    dw $0008,EndingSequenceSpritemaps_4
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_ClearTimeDigit_4

InstList_ClearTimeDigit_5:
    dw $0008,EndingSequenceSpritemaps_5
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_ClearTimeDigit_5

InstList_ClearTimeDigit_6:
    dw $0008,EndingSequenceSpritemaps_6
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_ClearTimeDigit_6

InstList_ClearTimeDigit_7:
    dw $0008,EndingSequenceSpritemaps_7
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_ClearTimeDigit_7

InstList_ClearTimeDigit_8:
    dw $0008,EndingSequenceSpritemaps_8
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_ClearTimeDigit_8

InstList_ClearTimeDigit_9:
    dw $0008,EndingSequenceSpritemaps_9
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_ClearTimeDigit_9


;;; $ECD1: Instruction list - cinematic sprite object $EF0F (clear time - colon) ;;;
InstList_CinematicSpriteObject_ClearTime_Colon:
    dw $0008,EndingSequenceSpritemaps_Colon
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_ClearTime_Colon


;;; $ECD9: Instruction list - cinematic sprite object $EF21 (critters escape) ;;;
InstList_CinematicSpriteObject_CrittersEscape:
    dw $0001,EndingSequenceSpritemaps_CrittersEscapePodFrame1
    dw $0001,EndingSequenceSpritemaps_CrittersEscapePodFrame2
    dw $0001,EndingSequenceSpritemaps_CrittersEscapePodFrame3
    dw $0001,EndingSequenceSpritemaps_CrittersEscapePodFrame4
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_CrittersEscape


;;; $ECED: Instruction list - cinematic sprite object $EED3 (yellow clouds - top - top half) ;;;
InstList_CinematicSpriteObject_YellowClouds_Top_TopHalf:
    dw $0001,EndingSequenceSpritemaps_EndingCutsceneTopCloudsPattern
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_YellowClouds_Top_TopHalf


;;; $ECF5: Instruction list - cinematic sprite object $EED9 (yellow clouds - top - bottom half) ;;;
InstList_CinematicSpriteObject_YellowClouds_Top_BottomHalf:
    dw $0001,EndingSequenceSpritemaps_EndingCutsceneTopCloudsEdge
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_YellowClouds_Top_BottomHalf


;;; $ECFD: Instruction list - cinematic sprite object $EEDF (yellow clouds - bottom - top half) ;;;
InstList_CinematicSpriteObject_YellowClouds_Bottom_TopHalf:
    dw $0001,EndingSequenceSpritemaps_EndingCutsceneBottomCloudsEdge
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_YellowClouds_Bottom_TopHalf


;;; $ED05: Instruction list - cinematic sprite object $EEE5 (yellow clouds - bottom - bottom half) ;;;
InstList_CineSpriteObject_YellowClouds_Bottom_BottomHalf:
    dw $0001,EndingSequenceSpritemaps_EndingCutsceneBottomCloudsPattern
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CineSpriteObject_YellowClouds_Bottom_BottomHalf


;;; $ED0D: Instruction list - cinematic sprite object $EEEB (yellow clouds - right) ;;;
InstList_CinematicSpriteObject_YellowClouds_Right:
    dw $0001,EndingSequenceSpritemaps_EndingCutsceneRightClouds
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_YellowClouds_Right


;;; $ED15: Instruction list - cinematic sprite object $EEF1 (yellow clouds - left) ;;;
InstList_CinematicSpriteObject_YellowClouds_Left:
    dw $0001,EndingSequenceSpritemaps_EndingCutsceneLeftClouds
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_YellowClouds_Left


;;; $ED1D: Instruction list - cinematic sprite object $EF27 (suitless Samus - idle) ;;;
InstList_CinematicSpriteObject_SuitlessSamus_Idle:
    dw $0080,EndingSequenceSpritemaps_SuitlessSamusStandingArmsStraight
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_SuitlessSamus_Idle


;;; $ED25: Instruction list - cinematic sprite object $EF2D (suitless Samus - idle - legs) ;;;
InstList_CinematicSpriteObject_SuitlessSamus_Idle_Legs:
    dw $0080,EndingSequenceSpritemaps_SuitlessSamusLowerBody
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_SuitlessSamus_Idle_Legs


;;; $ED2D: Instruction list - cinematic sprite object $EF33 (suitless Samus - letting hair down) ;;;
InstList_CinematicSpriteObject_SuitlessSamus_LettingHairDown:
    dw $005A,EndingSequenceSpritemaps_SuitlessSamusStandingArmsStraight
    dw $0008,EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame1
    dw $000A,EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame2
    dw $000A,EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame3
    dw $0020,EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame4
    dw $000A,EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame5
    dw $0009,EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame6
    dw $0010,EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame7
    dw $000A,EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame8
    dw $0030,EndingSequenceSpritemaps_SuitlessSamusStanding
    dw Instruction_CinematicSpriteObject_SpawnSuitlessSamusJump
    dw CinematicSpriteObject_Instruction_Delete


;;; $ED59: Instruction list - cinematic sprite object $EF39 (suitless Samus - letting hair down - legs) ;;;
InstList_CineSpriteObject_SuitlessSamus_LettingHairDown_Legs:
    dw $005A,EndingSequenceSpritemaps_SuitlessSamusLowerBody
    dw $0008,EndingSequenceSpritemaps_SuitlessSamusLowerBody
    dw $000A,EndingSequenceSpritemaps_SuitlessSamusLowerBody
    dw $000A,EndingSequenceSpritemaps_SuitlessSamusLowerBody
    dw $0020,EndingSequenceSpritemaps_SuitlessSamusLowerBody
    dw $000A,EndingSequenceSpritemaps_SuitlessSamusLowerBody
    dw $0009,EndingSequenceSpritemaps_SuitlessSamusLowerBody
    dw $0010,EndingSequenceSpritemaps_SuitlessSamusLowerBody
    dw $000A,EndingSequenceSpritemaps_SuitlessSamusLowerBody
    dw CinematicSpriteObject_Instruction_Delete


;;; $ED7F: Instruction list - cinematic sprite object $EF3F (suitless Samus - jump) ;;;
InstList_CinematicSpriteObject_SuitlessSamus_Jump_0:
    dw $0030,EndingSequenceSpritemaps_SuitlessSamusStanding
    dw $000A,EndingSequenceSpritemaps_SuitlessSamusPreparingToJump
    dw Instruction_CinematicSpriteObject_MakeEndingSamusJump
    dw CinematicSpriteObject_Instruction_PreInstructionY
    dw Inst_CineSpriteObject_SpawnSuitlessSamus_LettingHairDown

InstList_CinematicSpriteObject_SuitlessSamus_Jump_1:
    dw $0030,EndingSequenceSpritemaps_SuitlessSamusJumping
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_SuitlessSamus_Jump_1


;;; $ED95: Instruction list - Samus - jump - falling ;;;
InstList_Samus_Jump_Falling:
    dw $000A,EndingSequenceSpritemaps_SamusFalling
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_Samus_Jump_Falling


;;; $ED9D: Instruction list - Samus - jump - landed ;;;
InstList_Samus_Jump_Landed:
    dw $000A,EndingSequenceSpritemaps_SamusLanding
    dw $0010,EndingSequenceSpritemaps_SamusLanded
    dw $0030,EndingSequenceSpritemaps_SamusShooting
    dw Instruction_CinematicSpriteObject_SamusShootsScreen
    dw $0080,EndingSequenceSpritemaps_SamusShooting
    dw CinematicSpriteObject_Instruction_Delete


;;; $EDB1: Instruction list - cinematic sprite object $EF45 (suited Samus - idle - body) ;;;
InstList_CinematicSpriteObject_SuitedSamus_Idle_Body:
    dw $000A,EndingSequenceSpritemaps_LargeSamusFromEndingStanding
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_SuitedSamus_Idle_Body


;;; $EDB9: Instruction list - cinematic sprite object $EF4B (suited Samus - idle - head - with helmet) ;;;
InstList_CinematicSpriteObject_SuitedSamus_Idle_Head_Helmet:
    dw $000A,EndingSequenceSpritemaps_SamusHeadWithHelmetFromEnding
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_SuitedSamus_Idle_Head_Helmet


;;; $EDC1: Instruction list - cinematic sprite object $EF51 (suited Samus - idle - head - without helmet) ;;;
InstList_CinematicSpriteObject_SuitedSamus_Head:
    dw $000A,EndingSequenceSpritemaps_SamusHeadFromEndingFrame1
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_SuitedSamus_Head


;;; $EDC9: Instruction list - cinematic sprite object $EF57 (suited Samus - thumbs up - body) ;;;
InstList_CinematicSpriteObject_SuitedSamus_ThumbsUp_Body:
    dw $0040,EndingSequenceSpritemaps_LargeSamusFromEndingStanding
    dw $0108,EndingSequenceSpritemaps_HeadlessArmlessSuitedSamus
    dw CinematicSpriteObject_Instruction_Delete


;;; $EDD3: Instruction list - cinematic sprite object $EF5D (suited Samus - thumbs up - arm) ;;;
InstList_CinematicSpriteObject_SuitedSamus_ThumbsUp_Arm:
    dw $0040,$0000
    dw $0008,EndingSequenceSpritemaps_SamusArmFromEndingFrame1
    dw $0008,EndingSequenceSpritemaps_SamusArmFromEndingFrame2
    dw $0005,EndingSequenceSpritemaps_SamusArmFromEndingFrame3
    dw $0004,EndingSequenceSpritemaps_SamusArmFromEndingFrame4
    dw $0003,EndingSequenceSpritemaps_SamusArmFromEndingFrame5
    dw $0020,EndingSequenceSpritemaps_SamusArmFromEndingFrame6
    dw $0008,EndingSequenceSpritemaps_SamusArmFromEndingFrame7
    dw $0040,EndingSequenceSpritemaps_SamusArmFromEndingFrame8
    dw $0005,EndingSequenceSpritemaps_SamusArmFromEndingFrame6
    dw $0005,EndingSequenceSpritemaps_SamusArmFromEndingFrame5
    dw $0005,EndingSequenceSpritemaps_SamusArmFromEndingFrame4
    dw $0005,EndingSequenceSpritemaps_SamusArmFromEndingFrame3
    dw $0070,EndingSequenceSpritemaps_SamusArmFromEndingFrame2
    dw Instruction_CinematicSpriteObject_SpawnSuitedSamusJump
    dw CinematicSpriteObject_Instruction_Delete


;;; $EE0F: Instruction list - cinematic sprite object $EF63 (suited Samus - thumbs up - head - with helmet) ;;;
InstList_CineSpriteObject_SuitedSamus_ThumbsUp_Head_Helmet:
    dw $0148,EndingSequenceSpritemaps_SamusHeadWithHelmetFromEnding
    dw CinematicSpriteObject_Instruction_Delete


;;; $EE15: Instruction list - cinematic sprite object $EF69 (suited Samus - thumbs up - head - without helmet) ;;;
InstList_CinematicSpriteObject_SuitedSamus_ThumbsUp_Head:
    dw $0080,EndingSequenceSpritemaps_SamusHeadFromEndingFrame1
    dw $0005,EndingSequenceSpritemaps_SamusHeadFromEndingFrame2
    dw $0005,EndingSequenceSpritemaps_SamusHeadFromEndingFrame3
    dw $00BE,EndingSequenceSpritemaps_SamusHeadFromEndingFrame4
    dw CinematicSpriteObject_Instruction_Delete


;;; $EE27: Instruction list - cinematic sprite object $EF6F (suited Samus - jump - body) ;;;
InstList_CinematicSpriteObject_SuitedSamus_Jump_Body_0:
    dw Instruction_CineSpriteObject_PositionSuitedHeadToPrepareJump
    dw $000A,EndingSequenceSpritemaps_LargeSamusFromEndingPreparingToJump
    dw Instruction_CinematicSpriteObject_PositionSamusHeadToJump
    dw Instruction_CinematicSpriteObject_MakeEndingSamusJump
    dw CinematicSpriteObject_Instruction_PreInstructionY
    dw Inst_CineSpriteObject_SpawnSuitlessSamus_LettingHairDown

InstList_CinematicSpriteObject_SuitedSamus_Jump_Body_1:
    dw $0005,EndingSequenceSpritemaps_LargeSamusFromEndingJumping
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_SuitedSamus_Jump_Body_1


;;; $EE3D: Instruction list - cinematic sprite object $EF75 (suited Samus - jump - head - with helmet) ;;;
InstList_CineSpriteObject_SuitedSamus_Jump_Head_Helmet_0:
    dw $000A,EndingSequenceSpritemaps_LargeSamusHelmetFromEndingFrame1
    dw CinematicSpriteObject_Instruction_PreInstructionY
    dw PreInst_CinematicSpriteObject_SuitedSamus_Jump_Head_Jumping

InstList_CineSpriteObject_SuitedSamus_Jump_Head_Helmet_1:
    dw $0005,EndingSequenceSpritemaps_LargeSamusHelmetFromEndingFrame2
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CineSpriteObject_SuitedSamus_Jump_Head_Helmet_1


;;; $EE4D: Instruction list - cinematic sprite object $EF7B (suited Samus - jump - head - without helmet) ;;;
InstList_CinematicSpriteObject_SuitedSamus_Jump_Head_0:
    dw $000A,EndingSequenceSpritemaps_JumpingSamusHeadFromEnding
    dw CinematicSpriteObject_Instruction_PreInstructionY
    dw PreInst_CinematicSpriteObject_SuitedSamus_Jump_Head_Jumping

InstList_CinematicSpriteObject_SuitedSamus_Jump_Head_1:
    dw $0005,EndingSequenceSpritemaps_JumpingSamusHeadFromEnding
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_SuitedSamus_Jump_Head_1


;;; $EE5D: Instruction list - cinematic sprite object $EF81 (Super Metroid icon - S - top half) ;;;
InstList_CinematicSpriteObject_SuperMetroidIcon_S_TopHalf:
    dw $000A,EndingSequenceSpritemaps_ScrewAttackSymbolUpperPart
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_SuperMetroidIcon_S_TopHalf


;;; $EE65: Instruction list - cinematic sprite object $EF87 (Super Metroid icon - S - bottom half) ;;;
InstList_CinematicSpriteObject_SuperMetroidIcon_S_BottomHalf:
    dw $000A,EndingSequenceSpritemaps_ScrewAttackSymbolLowerPart
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CinematicSpriteObject_SuperMetroidIcon_S_BottomHalf


;;; $EE6D: Instruction list - cinematic sprite object $EF8D (Super Metroid icon - circle - top half) ;;;
InstList_CineSpriteObject_SuperMetroidIcon_Circle_TopHalf_0:
    dw $0060,$0000
    dw $0005,EndingSequenceSpritemaps_ScrewAttackSymbolRightWrapFrame1
    dw $0005,EndingSequenceSpritemaps_ScrewAttackSymbolRightWrapFrame2
    dw $0040,EndingSequenceSpritemaps_ScrewAttackSymbolRightWrapFrame3
    dw Instruction_GreyOutSuperMetroidIcon

InstList_CineSpriteObject_SuperMetroidIcon_Circle_TopHalf_1:
    dw $0005,EndingSequenceSpritemaps_ScrewAttackSymbolRightWrapFrame3
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CineSpriteObject_SuperMetroidIcon_Circle_TopHalf_1


;;; $EE87: Instruction list - cinematic sprite object $EF93 (Super Metroid icon - circle - bottom half) ;;;
InstList_CineSpriteObject_SuperMetroidIcon_Circle_BotHalf_0:
    dw $0060,$0000
    dw $0005,EndingSequenceSpritemaps_ScrewAttackSymbolLeftWrapFrame1
    dw $0005,EndingSequenceSpritemaps_ScrewAttackSymbolLeftWrapFrame2

InstList_CineSpriteObject_SuperMetroidIcon_Circle_BotHalf_1:
    dw $0005,EndingSequenceSpritemaps_ScrewAttackSymbolLeftWrapFrame3
    dw CinematicSpriteObject_Instruction_GotoY
    dw InstList_CineSpriteObject_SuperMetroidIcon_Circle_BotHalf_1


;;; $EE9B: Instruction list - delete ;;;
InstList_CinematicSpriteObject_Delete_duplicate:
    dw CinematicSpriteObject_Instruction_Delete


;;; $EE9D: Cinematic sprite object definitions - ending / post-credits ;;;
CinematicSpriteObjectDefinitions_ExplodingZebes_Zebes:
    dw InitFunction_CinematicSpriteObject_ExplodingZebes_Palette7        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObjects_ExplodingZebes_Zebes_0            ; Instruction list

CinematicSpriteObjectDefinitions_ExplodingZebes_PurpleGlow:
    dw InitFunction_CinematicSpriteObject_ExplodingZebes_Palette7        ; Initialisation function
    dw PreInst_CineSpriteObj_ExplodingZebes_PurpleGlow_Stars_Lava        ; Pre-instruction
    dw InstList_CinematicSpriteObjects_ExplodingZebes_PurpleGlow         ; Instruction list

CinematicSpriteObjectDefinitions_ExplodingZebes_Stars:
    dw InitFunction_CinematicSpriteObject_ExplodingZebes_Palette7        ; Initialisation function
    dw PreInst_CineSpriteObj_ExplodingZebes_PurpleGlow_Stars_Lava        ; Pre-instruction
    dw InstList_CinematicSpriteObjects_ExplodingZebes_Stars              ; Instruction list

CinematicSpriteObjectDefinitions_ExplodingZebes_Lava:
    dw InitFunction_CinematicSpriteObject_ExplodingZebes_Palette5        ; Initialisation function
    dw PreInst_CineSpriteObj_ExplodingZebes_PurpleGlow_Stars_Lava        ; Pre-instruction
    dw InstList_CinematicSpriteObjects_ExplodingZebes_Lava_0             ; Instruction list

CinematicSpriteObjectDefinitions_ZebesExplosion_Silhouette:
    dw InitFunction_CinematicSpriteObject_ExplodingZebes_Palette5        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObjects_ExplodingZebes_Silhouette         ; Instruction list

CinematicSpriteObjectDefinitions_ZebesExplosion_Stars_Right:
    dw InitFunction_CinematicSpriteObject_ExplodingZebes_Palette7        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObjects_ExplodingZebes_Stars_Right        ; Instruction list

CinematicSpriteObjectDefinitions_ZebesExplosion_AfterGlow:
    dw InitFunction_CinematicSpriteObject_ZebesExplosion_AfterGlow       ; Initialisation function
    dw PreInstruction_CineSpriteObject_ZebesExplosion_AfterGlow          ; Pre-instruction
    dw InstList_CinematicSpriteObjects_ExplodingZebes_AfterGlow          ; Instruction list

CinematicSpriteObjectDefinitions_TheOperationWas:
    dw InitFunc_CineSpriteObj_TheOperationWasCompletedSuccessfully       ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_Text                         ; Pre-instruction
    dw InstList_CinematicSpriteObjects_TheOperationWas_0                 ; Instruction list

CinematicSpriteObjectDefinitions_CompletedSuccessfully:
    dw InitFunc_CineSpriteObj_TheOperationWasCompletedSuccessfully       ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_Text                         ; Pre-instruction
    dw InstList_CinematicSpriteObjects_CompletedSuccessfully_0           ; Instruction list

CinematicSpriteObjectDefinitions_YellowClouds_Top_TopHalf:
    dw InitFunction_CinematicSpriteObject_YellowClouds_Top_TopHalf       ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_YellowClouds_Top             ; Pre-instruction
    dw InstList_CinematicSpriteObject_YellowClouds_Top_TopHalf           ; Instruction list

CinematicSpriteObjectDefinitions_Top_BottomHalf:
    dw InitFunction_CineSpriteObject_YellowClouds_Top_BottomHalf         ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_YellowClouds_Top             ; Pre-instruction
    dw InstList_CinematicSpriteObject_YellowClouds_Top_BottomHalf        ; Instruction list

CinematicSpriteObjectDefinitions_Bottom_TopHalf:
    dw InitFunction_CineSpriteObject_YellowClouds_Bottom_TopHalf         ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_YellowClouds_Bottom          ; Pre-instruction
    dw InstList_CinematicSpriteObject_YellowClouds_Bottom_TopHalf        ; Instruction list

CinematicSpriteObjectDefinitions_Bottom_BottomHalf:
    dw InitFunction_CineSpriteObject_YellowClouds_Bottom_BottomHalf      ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_YellowClouds_Bottom          ; Pre-instruction
    dw InstList_CineSpriteObject_YellowClouds_Bottom_BottomHalf          ; Instruction list

CinematicSpriteObjectDefinitions_Right:
    dw InitFunction_CinematicSpriteObject_YellowClouds_Right             ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_YellowClouds_Right           ; Pre-instruction
    dw InstList_CinematicSpriteObject_YellowClouds_Right                 ; Instruction list

CinematicSpriteObjectDefinitions_Left:
    dw InitFunction_CinematicSpriteObject_YellowClouds_Left              ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_YellowClouds_Left            ; Pre-instruction
    dw InstList_CinematicSpriteObject_YellowClouds_Left                  ; Instruction list

CinematicSpriteObjectDefinitions_ZebesExplosion_Stars_Left:
    dw InitFunction_CinematicSpriteObject_ZebesExplosion_Stars_Left      ; Initialisation function
    dw Instruction_CinematicSpriteObject_ZebesExplosion_Stars_Left       ; Pre-instruction
    dw InstList_CinematicSpriteObjects_ExplodingZebes_Stars_Left         ; Instruction list

CinematicSpriteObjectDefinitions_ClearTime:
    dw InitFunction_CinematicSpriteObject_ClearTime                      ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_Text                         ; Pre-instruction
    dw InstList_CinematicSpriteObjects_ClearTime_0                       ; Instruction list

CinematicSpriteObjectDefinitions_ClearTime_Hours_TensDigit:
    dw InitFunction_CinematicSpriteObject_ClearTime_Hours_TensDigit      ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_Text                         ; Pre-instruction
    dw InstList_ClearTimeDigit_0                                         ; Instruction list

CinematicSpriteObjectDefinitions_ClearTime_Hours_OnesDigit:
    dw InitFunction_CinematicSpriteObject_ClearTime_Hours_OnesDigit      ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_Text                         ; Pre-instruction
    dw InstList_ClearTimeDigit_0                                         ; Instruction list

CinematicSpriteObjectDefinitions_ClearTime_Colon:
    dw InitFunction_CinematicSpriteObject_ClearTime_Colon                ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_Text                         ; Pre-instruction
    dw InstList_CinematicSpriteObject_ClearTime_Colon                    ; Instruction list

CinematicSpriteObjectDefinitions_ClearTime_Minutes_TensDigit:
    dw InitFunction_CineSpriteObject_ClearTime_Minutes_TensDigit         ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_Text                         ; Pre-instruction
    dw InstList_ClearTimeDigit_0                                         ; Instruction list

CinematicSpriteObjectDefinitions_ClearTime_Minutes_OnesDigit:
    dw InitFunction_CineSpriteObject_ClearTime_Minutes_OnesDigit         ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_Text                         ; Pre-instruction
    dw InstList_ClearTimeDigit_0                                         ; Instruction list

CinematicSpriteObjectDefinitions_CrittersEscape:
    dw InitFunction_CinematicSpriteObject_CrittersEscape                 ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_CrittersEscape               ; Pre-instruction
    dw InstList_CinematicSpriteObject_CrittersEscape                     ; Instruction list

CinematicSpriteObjectDefinitions_SuitlessSamus_Idle:
    dw InitFunction_CinematicSpriteObject_SuitlessSamus                  ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_Samus_Idle                   ; Pre-instruction
    dw InstList_CinematicSpriteObject_SuitlessSamus_Idle                 ; Instruction list

CinematicSpriteObjectDefinitions_SuitlessSamus_Idle_Legs:
    dw InitFunction_CinematicSpriteObject_SuitlessSamus                  ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_Samus_Idle                   ; Pre-instruction
    dw InstList_CinematicSpriteObject_SuitlessSamus_Idle_Legs            ; Instruction list

CinematicSpriteObjectDefs_SuitlessSamus_LettingHairDown:
    dw InitFunction_CinematicSpriteObject_SuitlessSamus                  ; Initialisation function
    dw RTS_8BF51C                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_SuitlessSamus_LettingHairDown      ; Instruction list

CinematicSpriteObjectDefs_SuitlessSamus_LettingHairDown_Legs:
    dw InitFunction_CinematicSpriteObject_SuitlessSamus                  ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CineSpriteObject_SuitlessSamus_LettingHairDown_Legs      ; Instruction list

CinematicSpriteObjectDefinitions_SuitlessSamus_Jump:
    dw InitFunction_CinematicSpriteObject_SuitlessSamus                  ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_SuitlessSamus_Jump_0               ; Instruction list

CinematicSpriteObjectDefinitions_SuitedSamus_Idle_Body:
    dw InitFunction_CinematicSpriteObject_SuitedSamus_Body_Arm           ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_Samus_Idle                   ; Pre-instruction
    dw InstList_CinematicSpriteObject_SuitedSamus_Idle_Body              ; Instruction list

CinematicSpriteObjectDefs_SuitedSamus_Idle_Head_Helmet:
    dw InitFunction_CinematicSpriteObject_SuitedSamus_Head_Helmet        ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_Samus_Idle                   ; Pre-instruction
    dw InstList_CinematicSpriteObject_SuitedSamus_Idle_Head_Helmet       ; Instruction list

CinematicSpriteObjectDefinitions_SuitedSamus_Idle_Head:
    dw InitFunction_CinematicSpriteObject_SuitedSamus_Head               ; Initialisation function
    dw PreInstruction_CinematicSpriteObject_Samus_Idle                   ; Pre-instruction
    dw InstList_CinematicSpriteObject_SuitedSamus_Head                   ; Instruction list

CinematicSpriteObjectDefinitions_ThumbsUp_Body:
    dw InitFunction_CinematicSpriteObject_SuitedSamus_Body_Arm           ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_SuitedSamus_ThumbsUp_Body          ; Instruction list

CinematicSpriteObjectDefinitions_ThumbsUp_Arm:
    dw InitFunction_CinematicSpriteObject_SuitedSamus_Body_Arm           ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_SuitedSamus_ThumbsUp_Arm           ; Instruction list

CinematicSpriteObjectDefinitions_ThumbsUp_Head_Helmet:
    dw InitFunction_CinematicSpriteObject_SuitedSamus_Head_Helmet        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CineSpriteObject_SuitedSamus_ThumbsUp_Head_Helmet        ; Instruction list

CinematicSpriteObjectDefinitions_ThumbsUp_Head:
    dw InitFunction_CinematicSpriteObject_SuitedSamus_Head               ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_SuitedSamus_ThumbsUp_Head          ; Instruction list

CinematicSpriteObjectDefinitions_Jump_Body:
    dw InitFunction_CinematicSpriteObject_SuitedSamus_Body_Arm           ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_SuitedSamus_Jump_Body_0            ; Instruction list

CinematicSpriteObjectDefinitions_Jump_Head_Helmet:
    dw InitFunction_CinematicSpriteObject_SuitedSamus_Head_Helmet        ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CineSpriteObject_SuitedSamus_Jump_Head_Helmet_0          ; Instruction list

CinematicSpriteObjectDefinitions_Jump_Head:
    dw InitFunction_CinematicSpriteObject_SuitedSamus_Head               ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CinematicSpriteObject_SuitedSamus_Jump_Head_0            ; Instruction list

CinematicSpriteObjectDefinitions_SuperMetroidIcon_S_TopHalf:
    dw InitFunction_CineSpriteObject_SuperMetroidIcon_S_TopHalf          ; Initialisation function
    dw PreInstruction_CineSpriteObject_SuperMetroidIcon_S_TopHalf        ; Pre-instruction
    dw InstList_CinematicSpriteObject_SuperMetroidIcon_S_TopHalf         ; Instruction list

CinematicSpriteObjectDefs_SuperMetroidIcon_S_BottomHalf:
    dw InitFunction_CineSpriteObject_SuperMetroidIcon_S_BottomHalf       ; Initialisation function
    dw Instruction_CineSpriteObject_SuperMetroidIcon_S_BottomHalf        ; Pre-instruction
    dw InstList_CinematicSpriteObject_SuperMetroidIcon_S_BottomHalf      ; Instruction list

CinematicSpriteObjectDefs_SuperMetroidIcon_Circle_TopHalf:
    dw InitFunc_CineSpriteObject_SuperMetroidIcon_Circle_TopHalf         ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CineSpriteObject_SuperMetroidIcon_Circle_TopHalf_0       ; Instruction list

CinematicSpriteObjectDefs_SuperMetroidIcon_Circle_BottomHalf:
    dw InitFunc_CineSpriteObject_SuperMetroidIcon_Circle_BottomHalf      ; Initialisation function
    dw RTS_8B93D9                                                        ; Pre-instruction
    dw InstList_CineSpriteObject_SuperMetroidIcon_Circle_BotHalf_0       ; Instruction list


;;; $EF99: Initialisation function - cinematic sprite object $EF21 (critters escape) ;;;
InitFunction_CinematicSpriteObject_CrittersEscape:
    LDA.W #$0080 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0080 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0E00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    LDA.W #$0104 : STA.W CinematicSpriteObject_Timers,Y
    RTS


;;; $EFB2: Pre-instruction - cinematic sprite object $EF21 (critters escape) ;;;
PreInstruction_CinematicSpriteObject_CrittersEscape:
    LDA.W CinematicSpriteObject_YSubPosition,X : CLC : ADC.W #$0080 : STA.W CinematicSpriteObject_YSubPosition,X
    LDA.W CinematicSpriteObject_YPositions,X : ADC.W #$0000 : STA.W CinematicSpriteObject_YPositions,X
    LDA.W CinematicSpriteObject_XSubPosition,X : CLC : ADC.W #$0000 : STA.W CinematicSpriteObject_XSubPosition,X
    LDA.W CinematicSpriteObject_XPositions,X : ADC.W #$0001 : STA.W CinematicSpriteObject_XPositions,X
    CMP.W #$0110 : BMI .return
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_CinematicSpriteObject_Delete_duplicate : STA.W CinematicSpriteObject_InstListPointers,X

  .return:
    RTS


;;; $EFEA: Initialisation function - cinematic sprite object $EE9D/$EEA3/$EEA9/$EEBB (exploding Zebes - palette 7) ;;;
InitFunction_CinematicSpriteObject_ExplodingZebes_Palette7:
    LDA.W #$0080 : STA.W CinematicSpriteObject_XPositions,Y
; fallthrough to CommonInit_ExplodingZebes_Palette7


;;; $EFF0: Palette 7 exploding Zebes common initialisation ;;;
CommonInit_ExplodingZebes_Palette7:
    LDA.W #$0080 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0E00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $EFFD: Initialisation function - cinematic sprite object $EEF7 (Zebes explosion - stars - left) ;;;
InitFunction_CinematicSpriteObject_ZebesExplosion_Stars_Left:
    LDA.W #$FF80 : STA.W CinematicSpriteObject_XPositions,Y
    BRA CommonInit_ExplodingZebes_Palette7


;;; $F005: Initialisation function - cinematic sprite object $EEAF/$EEB5 (exploding Zebes - palette 5) ;;;
InitFunction_CinematicSpriteObject_ExplodingZebes_Palette5:
    LDA.W #$0080 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0080 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0A00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $F018: Initialisation function - cinematic sprite object $EEC1 (Zebes explosion - afterglow) ;;;
InitFunction_CinematicSpriteObject_ZebesExplosion_AfterGlow:
    LDA.W #$0080 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0080 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0C00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $F02B: Initialisation function - cinematic sprite object $EEC7/$EECD ('THE OPERATION WAS' / 'COMPLETED SUCCESSFULLY') ;;;
InitFunc_CineSpriteObj_TheOperationWasCompletedSuccessfully:
    LDA.W #$0080 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0060 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0400 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $F03E: Initialisation function - cinematic sprite object $EEFD (clear time) ;;;
InitFunction_CinematicSpriteObject_ClearTime:
    LDA.W #$0080 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$00A0 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0200 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $F051: Clear time result common initialisation ;;;
CommonInit_ClearTime:
    LDA.W #$00A0 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0000 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $F05E: Initialisation function - cinematic sprite object $EF03 (clear time - hours - tens digit) ;;;
InitFunction_CinematicSpriteObject_ClearTime_Hours_TensDigit:
    LDA.W EndingClearTime_HoursTens
    JSR CinematicSpriteObject_InstListPointer_PlusA_Times8
    LDA.W #$009C : STA.W CinematicSpriteObject_XPositions,Y
    JMP CommonInit_ClearTime


;;; $F06D: Initialisation function - cinematic sprite object $EF09 (clear time - hours - units digit) ;;;
InitFunction_CinematicSpriteObject_ClearTime_Hours_OnesDigit:
    LDA.W EndingClearTime_HoursUnits
    JSR CinematicSpriteObject_InstListPointer_PlusA_Times8
    LDA.W #$00A4 : STA.W CinematicSpriteObject_XPositions,Y
    JMP CommonInit_ClearTime


;;; $F07C: Initialisation function - cinematic sprite object $EF0F (clear time - colon) ;;;
InitFunction_CinematicSpriteObject_ClearTime_Colon:
    LDA.W #$00AC : STA.W CinematicSpriteObject_XPositions,Y
    JMP CommonInit_ClearTime


;;; $F085: Initialisation function - cinematic sprite object $EF15 (clear time - minutes - tens digit) ;;;
InitFunction_CineSpriteObject_ClearTime_Minutes_TensDigit:
    LDA.W EndingClearTime_MinutesTens
    JSR CinematicSpriteObject_InstListPointer_PlusA_Times8
    LDA.W #$00B4 : STA.W CinematicSpriteObject_XPositions,Y
    JMP CommonInit_ClearTime


;;; $F094: Initialisation function - cinematic sprite object $EF1B (clear time - minutes - units digit) ;;;
InitFunction_CineSpriteObject_ClearTime_Minutes_OnesDigit:
    LDA.W EndingClearTime_MinutesUnits
    JSR CinematicSpriteObject_InstListPointer_PlusA_Times8
    LDA.W #$00BC : STA.W CinematicSpriteObject_XPositions,Y
    JMP CommonInit_ClearTime


;;; $F0A3: Cinematic sprite object instruction list pointer += [A] * 8 ;;;
CinematicSpriteObject_InstListPointer_PlusA_Times8:
    ASL #3 : STA.B DP_Temp12
    LDA.W CinematicSpriteObject_InstListPointers,Y : CLC : ADC.B DP_Temp12 : STA.W CinematicSpriteObject_InstListPointers,Y
    RTS


;;; $F0B2: Initialisation function - cinematic sprite object $EED3 (yellow clouds - top - top half) ;;;
InitFunction_CinematicSpriteObject_YellowClouds_Top_TopHalf:
    LDA.W #$FFA0 : STA.W CinematicSpriteObject_YPositions,Y
; fallthrough to CommonInit_YellowClouds_TopBottom


;;; $F0B8: Top/bottom yellow clouds common initialisation ;;;
CommonInit_YellowClouds_TopBottom:
    LDA.W CinematicSpriteObject_InitParam : BEQ .noInitParam
    LDA.W #$0180 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0A00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    LDA.W CinematicSpriteObject_InstListPointers,Y : CLC : ADC.W #$0004 : STA.W CinematicSpriteObject_InstListPointers,Y
    RTS

  .noInitParam:
    LDA.W #$0080 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0A00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $F0E1: Initialisation function - cinematic sprite object $EED9 (yellow clouds - top - bottom half) ;;;
InitFunction_CineSpriteObject_YellowClouds_Top_BottomHalf:
    LDA.W #$FFE0 : STA.W CinematicSpriteObject_YPositions,Y
    BRA CommonInit_YellowClouds_TopBottom


;;; $F0E9: Initialisation function - cinematic sprite object $EEDF (yellow clouds - bottom - top half) ;;;
InitFunction_CineSpriteObject_YellowClouds_Bottom_TopHalf:
    LDA.W #$0120 : STA.W CinematicSpriteObject_YPositions,Y
    BRA CommonInit_YellowClouds_TopBottom


;;; $F0F1: Initialisation function - cinematic sprite object $EEE5 (yellow clouds - bottom - bottom half) ;;;
InitFunction_CineSpriteObject_YellowClouds_Bottom_BottomHalf:
    LDA.W #$0160 : STA.W CinematicSpriteObject_YPositions,Y
    BRA CommonInit_YellowClouds_TopBottom


;;; $F0F9: Initialisation function - cinematic sprite object $EEEB (yellow clouds - right) ;;;
InitFunction_CinematicSpriteObject_YellowClouds_Right:
    LDA.W #$0140 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W CinematicSpriteObject_InitParam : BEQ .noInitParam
    LDA.W #$01C0 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0A00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS

  .noInitParam:
    LDA.W #$00C0 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0A00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $F11E: Initialisation function - cinematic sprite object $EEF1 (yellow clouds - left) ;;;
InitFunction_CinematicSpriteObject_YellowClouds_Left:
    LDA.W #$FFC0 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W CinematicSpriteObject_InitParam : BEQ .noInitParam
    LDA.W #$FF40 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0A00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS

  .noInitParam:
    LDA.W #$0040 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0A00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $F143: Initialisation function - cinematic sprite object $EF27/$EF2D/$EF33/$EF39/$EF3F (suitless Samus) ;;;
InitFunction_CinematicSpriteObject_SuitlessSamus:
    LDA.W #$0078 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0088 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0A00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $F156: Initialisation function - cinematic sprite object $EF45/$EF57/$EF5D/$EF6F (suited Samus body / arm) ;;;
InitFunction_CinematicSpriteObject_SuitedSamus_Body_Arm:
    LDA.W #$0078 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0098 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0C00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $F169: Initialisation function - cinematic sprite object $EF4B/$EF63/$EF75 (suited Samus head - with helmet) ;;;
InitFunction_CinematicSpriteObject_SuitedSamus_Head_Helmet:
    LDA.W #$007C : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$006C : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0C00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $F17C: Initialisation function - cinematic sprite object $EF51/$EF69/$EF7B (suited Samus head - without helmet) ;;;
InitFunction_CinematicSpriteObject_SuitedSamus_Head:
    LDA.W #$0079 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$006B : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0A00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $F18F: Initialisation function - cinematic sprite object $EF81 (Super Metroid icon - S - top half) ;;;
InitFunction_CineSpriteObject_SuperMetroidIcon_S_TopHalf:
    LDA.W #$0212 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$00E7 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0E00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    LDA.W #$0008 : STA.W CinematicSpriteObject_Timers,Y
    RTS


;;; $F1A8: Initialisation function - cinematic sprite object $EF87 (Super Metroid icon - S - bottom half) ;;;
InitFunction_CineSpriteObject_SuperMetroidIcon_S_BottomHalf:
    LDA.W #$00F6 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0207 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0E00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    LDA.W #$0008 : STA.W CinematicSpriteObject_Timers,Y
    RTS


;;; $F1C1: Initialisation function - cinematic sprite object $EF8D (Super Metroid icon - circle - top half) ;;;
InitFunc_CineSpriteObject_SuperMetroidIcon_Circle_TopHalf:
    LDA.W #$0181 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$016E : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0E00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $F1D4: Initialisation function - cinematic sprite object $EF93 (Super Metroid icon - circle - bottom half) ;;;
InitFunc_CineSpriteObject_SuperMetroidIcon_Circle_BottomHalf:
    LDA.W #$0187 : STA.W CinematicSpriteObject_XPositions,Y
    LDA.W #$0180 : STA.W CinematicSpriteObject_YPositions,Y
    LDA.W #$0E00 : STA.W CinematicSpriteObject_PaletteIndices,Y
    RTS


;;; $F1E7: Pre-instruction - cinematic sprite object $EF81 (Super Metroid icon - S - top half) ;;;
PreInstruction_CineSpriteObject_SuperMetroidIcon_S_TopHalf:
    LDA.W CinematicSpriteObject_YPositions,X : CLC : ADC.W CinematicSpriteObject_Timers,X : STA.W CinematicSpriteObject_YPositions,X
    LDA.W CinematicSpriteObject_XPositions,X : SEC : SBC.W CinematicSpriteObject_Timers,X : STA.W CinematicSpriteObject_XPositions,X
    CMP.W #$018B : BPL +
    LDA.W #$018A : STA.W CinematicSpriteObject_XPositions,X
    LDA.W #$016F : STA.W CinematicSpriteObject_YPositions,X
    LDA.W #RTS_8B93D9 : STA.W CinematicSpriteObject_PreInstructions,X
    PHY
    LDY.W #PaletteFXObjects_PostCreditsSuperMetroidIcon
    JSL Spawn_PaletteFXObject
    PLY
    RTS

+   LDA.W CinematicSpriteObject_Timers,X : CLC : ADC.W #$0002 : STA.W CinematicSpriteObject_Timers,X
    RTS


;;; $F227: Pre-instruction - cinematic sprite object $EF87 (Super Metroid icon - S - bottom half) ;;;
Instruction_CineSpriteObject_SuperMetroidIcon_S_BottomHalf:
    LDA.W CinematicSpriteObject_YPositions,X : SEC : SBC.W CinematicSpriteObject_Timers,X : STA.W CinematicSpriteObject_YPositions,X
    LDA.W CinematicSpriteObject_XPositions,X : CLC : ADC.W CinematicSpriteObject_Timers,X : STA.W CinematicSpriteObject_XPositions,X
    CMP.W #$017E : BMI +
    LDA.W #$017E : STA.W CinematicSpriteObject_XPositions,X
    LDA.W #$017F : STA.W CinematicSpriteObject_YPositions,X
    LDA.W #RTS_8B93D9 : STA.W CinematicSpriteObject_PreInstructions,X
    RTS

+   LDA.W CinematicSpriteObject_Timers,X : CLC : ADC.W #$0002 : STA.W CinematicSpriteObject_Timers,X
    RTS


;;; $F25E: Instruction - grey out Super Metroid icon ;;;
Instruction_GreyOutSuperMetroidIcon:
    SEP #$20
    LDA.B #$03 : STA.B DP_MainScreenLayers
    LDA.B #$10 : STA.B DP_SubScreenLayers
    LDA.B #$02 : STA.B DP_ColorMathA
    LDA.B #$22 : STA.B DP_ColorMathB
    LDA.B #$64 : STA.B DP_BGTilesAddr
    LDA.B #$54 : STA.B DP_BG2TilemapAddrSize
    REP #$20
    STZ.W CinematicFunctionTimer
    LDA.W #CinematicFunction_PostCredits_GreyOutSuperMetroidIcon : STA.W CinematicFunction
    RTS


;;; $F284: Instruction - fade out zoomed out exploding Zebes ;;;
Instruction_FadeOutZoomedOutExplodingZebes:
    PHY
    LDY.W #PaletteFXObjects_FadeOutZoomedOutExplodingZebes
    JSL Spawn_PaletteFXObject
    LDA.W #$0001 : STA.L Palettes_SpriteP7+$1C
    PLY
    RTS


;;; $F295: Instruction - spawn Zebes explosion silhouette cinematic sprite object ;;;
Instruction_CineSpriteObjectSpawnZebesExplosionSilhouette:
    PHY
    LDY.W #CinematicSpriteObjectDefinitions_ZebesExplosion_Silhouette
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W #$7FFF : STA.L Palettes
    PLY
    RTS


;;; $F2A5: Pre-instruction - cinematic sprite object $EEA3/$EEA9/$EEAF (exploding Zebes - purple glow / stars / lava) ;;;
PreInst_CineSpriteObj_ExplodingZebes_PurpleGlow_Stars_Lava:
    LDA.W CinematicSpriteObject_InstListPointers+$1E : BNE .return
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_CinematicSpriteObject_Delete_duplicate : STA.W CinematicSpriteObject_InstListPointers,X

  .return:
    RTS


;;; $F2B7: Instruction - start Zebes explosion ;;;
Instruction_CinematicSpriteObject_StartZebesExplosion:
    PHY
    SEP #$20
    LDA.B #$11 : STA.B DP_MainScreenLayers
    LDA.B #$02 : STA.B DP_SubScreenLayers
    LDA.B #$02 : STA.B DP_ColorMathA
    LDA.B #$11 : STA.B DP_ColorMathB
    LDA.B #$7C : STA.B DP_BG2TilemapAddrSize
    REP #$20
    LDY.W #CinematicSpriteObjectDefinitions_ZebesExplosion_Stars_Right
    STZ.B DP_Temp12
    JSR Spawn_CinematicSpriteObject_YToIndex12
    LDY.W #CinematicSpriteObjectDefinitions_ZebesExplosion_Stars_Left
    LDA.W #$0002 : STA.B DP_Temp12
    JSR Spawn_CinematicSpriteObject_YToIndex12
    LDY.W #PaletteFXObjects_WidePartOfZebesExplosion_Foreground
    JSL Spawn_PaletteFXObject
    LDY.W #PaletteFXObjects_WhiteOutSpaceDuringZebesExplosion
    JSL Spawn_PaletteFXObject
    LDY.W #PaletteFXObjects_WidePartOfZebesExplosion_Background
    JSL Spawn_PaletteFXObject
    PLY
    RTS


;;; $F2FA: Instruction - Zebes explosion finale ;;;
Instruction_ZebesExplosionFinale:
    PHY
    SEP #$20
    LDA.B #$03 : STA.B DP_MainScreenLayers
    LDA.B #$12 : STA.B DP_SubScreenLayers
    LDA.B #$02 : STA.B DP_ColorMathA
    LDA.B #$33 : STA.B DP_ColorMathB
    LDA.B #$74 : STA.B DP_BG1TilemapAddrSize
    LDA.B #$78 : STA.B DP_BG2TilemapAddrSize
    REP #$20
    LDY.W #PaletteFXObjects_ZebesExplosionFinale
    JSL Spawn_PaletteFXObject
    LDY.W #CinematicSpriteObjectDefinitions_ZebesExplosion_AfterGlow
    LDA.W #$0006 : STA.B DP_Temp12
    JSR Spawn_CinematicSpriteObject_YToIndex12
    PLY
    RTS


;;; $F32B: Instruction - end Zebes explosion ;;;
Instruction_EndZebesExplosion:
    PHY
    SEP #$20
    STZ.B DP_MainScreenLayers : STZ.B DP_SubScreenLayers
    REP #$20
    LDA.W #$7FFF : STA.L Palettes : STA.L Palettes_SpriteP0
    PHX
    LDX.W #$001E

  .loop:
    STA.L Palettes_BG3P4,X
    DEX #2 : BPL .loop
    PLX
    LDA.W #CinematicFunc_Ending_SpaceView_ChangeMusic : STA.W CinematicFunction
    LDA.W #$0078 : STA.W CinematicFunctionTimer
    PLY
    RTS


;;; $F35A: Pre-instruction - cinematic sprite object $EEF7 (Zebes explosion - stars - left) ;;;
Instruction_CinematicSpriteObject_ZebesExplosion_Stars_Left:
    LDA.W CinematicFunction : CMP.W #CinematicFunc_Ending_SpaceView_GunshipEmergence_SpinningFast : BNE .return
    LDA.W #PreInst_CineSpriteObject_ZebesExplosion_Stars_Left_Moving : STA.W CinematicSpriteObject_PreInstructions,X
    LDA.W #$4000 : STA.W CinematicSpriteObject_YSubPosition,X
    LDA.W #$0000 : STA.W CinematicSpriteObject_Timers,X

  .return:
    RTS


;;; $F375: Pre-instruction - Zebes explosion - stars - left - moving ;;;
PreInst_CineSpriteObject_ZebesExplosion_Stars_Left_Moving:
    LDA.W CinematicSpriteObject_YSubPosition,X : CLC : ADC.W #$FFE0 : STA.W CinematicSpriteObject_YSubPosition,X
    LDA.W CinematicSpriteObject_Timers,X : ADC.W #$FFFF : STA.W CinematicSpriteObject_Timers,X
    LDA.W CinematicSpriteObject_XSubPosition,X : CLC : ADC.W CinematicSpriteObject_YSubPosition,X : STA.W CinematicSpriteObject_XSubPosition,X
    LDA.W CinematicSpriteObject_XPositions,X : ADC.W CinematicSpriteObject_Timers,X : STA.W CinematicSpriteObject_XPositions,X
; fallthrough to PreInstruction_CineSpriteObject_ZebesExplosion_AfterGlow


;;; $F39B: Pre-instruction - cinematic sprite object $EEC1 (Zebes explosion - afterglow) ;;;
PreInstruction_CineSpriteObject_ZebesExplosion_AfterGlow:
    LDA.W CinematicFunction : CMP.W #RTS_8BDE63 : BNE .return
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_CinematicSpriteObject_Delete_duplicate : STA.W CinematicSpriteObject_InstListPointers,X

  .return:
    RTS


;;; $F3B0: Instruction - spawn 'COMPLETED SUCCESSFULLY' cinematic sprite object ;;;
Instruction_CinematicSpriteObject_SpawnCompletedSuccessfully:
    PHY
    LDY.W #CinematicSpriteObjectDefinitions_CompletedSuccessfully
    JSR Spawn_CinematicSpriteObject_Y
    PLY
    RTS


;;; $F3B9: Pre-instruction - cinematic sprite object $EEC7/$EECD/$EEFD/$EF03/$EF09/$EF0F/$EF15/$EF1B (text) ;;;
PreInstruction_CinematicSpriteObject_Text:
    LDA.W CinematicFunction : CMP.W #CinematicFunction_Credits_Setup : BNE .return
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_CinematicSpriteObject_Delete_duplicate : STA.W CinematicSpriteObject_InstListPointers,X

  .return:
    RTS


;;; $F3CE: Instruction - spawn clear time cinematic sprite object ;;;
Instruction_CinematicSpriteObject_SpawnClearTime:
    PHY
    LDY.W #CinematicSpriteObjectDefinitions_ClearTime
    JSR Spawn_CinematicSpriteObject_Y
    LDA.W IGTHours : STA.W $4204
    SEP #$20
    LDA.B #$0A : STA.W $4206
    NOP #7
    REP #$20
    LDA.W $4214 : STA.W EndingClearTime_HoursTens
    LDA.W $4216 : STA.W EndingClearTime_HoursUnits
    LDA.W IGTMinutes : STA.W $4204
    SEP #$20
    LDA.B #$0A : STA.W $4206
    NOP #7
    REP #$20
    LDA.W $4214 : STA.W EndingClearTime_MinutesTens
    LDA.W $4216 : STA.W EndingClearTime_MinutesUnits
    PLY
    RTS


;;; $F41B: Instruction - spawn clear time hours tens digit cinematic sprite object ;;;
Instruction_CineSpriteObject_SpawnClearTime_Hours_TensDigit:
    PHY
    LDY.W #CinematicSpriteObjectDefinitions_ClearTime_Hours_TensDigit
    JSR Spawn_CinematicSpriteObject_Y
    PLY
    RTS


;;; $F424: Instruction - spawn clear time hours units digit cinematic sprite object ;;;
Instruction_CineSpriteObject_SpawnClearTime_Hours_OnesDigit:
    PHY
    LDY.W #CinematicSpriteObjectDefinitions_ClearTime_Hours_OnesDigit
    JSR Spawn_CinematicSpriteObject_Y
    PLY
    RTS


;;; $F42D: Instruction - spawn clear time colon cinematic sprite object ;;;
Instruction_CinematicSpriteObject_SpawnClearTime_Colon:
    PHY
    LDY.W #CinematicSpriteObjectDefinitions_ClearTime_Colon
    JSR Spawn_CinematicSpriteObject_Y
    PLY
    RTS


;;; $F436: Instruction - spawn clear time minutes tens digit cinematic sprite object ;;;
Inst_CineSpriteObject_SpawnClearTime_Minutes_TensDigit:
    PHY
    LDY.W #CinematicSpriteObjectDefinitions_ClearTime_Minutes_TensDigit
    JSR Spawn_CinematicSpriteObject_Y
    PLY
    RTS


;;; $F43F: Instruction - spawn clear time minutes units digit cinematic sprite object ;;;
Inst_CineSpriteObject_SpawnClearTime_Minutes_OnesDigit:
    PHY
    LDY.W #CinematicSpriteObjectDefinitions_ClearTime_Minutes_OnesDigit
    JSR Spawn_CinematicSpriteObject_Y
    PLY
    RTS


;;; $F448: Instruction - transition to credits ;;;
Instruction_CinematicSpriteObject_TransitionToCredits:
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    LDA.W #CinematicFunction_Ending_SpaceView_GunshipEmergence_Credits : STA.W CinematicFunction
    RTS


;;; $F455: Pre-instruction - cinematic sprite object $EED3/$EED9 (yellow clouds - top) ;;;
PreInstruction_CinematicSpriteObject_YellowClouds_Top:
    LDA.W Mode7TransformationZoomLevel : CMP.W #$00B0 : BPL .return
    LDA.W #PreInstruction_CinematicSpriteObject_YellowClouds_Top_Moving : STA.W CinematicSpriteObject_PreInstructions,X

  .return:
    RTS


;;; $F464: Pre-instruction - yellow clouds - top - moving ;;;
PreInstruction_CinematicSpriteObject_YellowClouds_Top_Moving:
    LDA.W CinematicSpriteObject_YSubPosition,X : CLC : ADC.W #$0000 : STA.W CinematicSpriteObject_YSubPosition,X
    LDA.W CinematicSpriteObject_YPositions,X : ADC.W #$0001 : STA.W CinematicSpriteObject_YPositions,X
    RTS


;;; $F478: Pre-instruction - cinematic sprite object $EEDF/$EEE5 (yellow clouds - bottom) ;;;
PreInstruction_CinematicSpriteObject_YellowClouds_Bottom:
    LDA.W Mode7TransformationZoomLevel : CMP.W #$00B0 : BPL .return
    LDA.W #PreInstruction_CineSpriteObject_YellowClouds_Bottom_Moving : STA.W CinematicSpriteObject_PreInstructions,X

  .return:
    RTS


;;; $F487: Pre-instruction - yellow clouds - bottom - moving ;;;
PreInstruction_CineSpriteObject_YellowClouds_Bottom_Moving:
    LDA.W CinematicSpriteObject_YSubPosition,X : SEC : SBC.W #$0000 : STA.W CinematicSpriteObject_YSubPosition,X
    LDA.W CinematicSpriteObject_YPositions,X : SBC.W #$0001 : STA.W CinematicSpriteObject_YPositions,X
    RTS


;;; $F49B: Pre-instruction - cinematic sprite object $EEEB (yellow clouds - right) ;;;
PreInstruction_CinematicSpriteObject_YellowClouds_Right:
    LDA.W Mode7TransformationZoomLevel : CMP.W #$0060 : BMI .return
    LDA.W #PreInstruction_CineSpriteObject_YellowClouds_Right_Moving : STA.W CinematicSpriteObject_PreInstructions,X

  .return:
    RTS


;;; $F4AA: Pre-instruction - yellow clouds - right - moving ;;;
PreInstruction_CineSpriteObject_YellowClouds_Right_Moving:
    LDA.W CinematicSpriteObject_YSubPosition,X : SEC : SBC.W #$0000 : STA.W CinematicSpriteObject_YSubPosition,X
    LDA.W CinematicSpriteObject_YPositions,X : SBC.W #$0002 : STA.W CinematicSpriteObject_YPositions,X
    LDA.W CinematicSpriteObject_XSubPosition,X : SEC : SBC.W #$0000 : STA.W CinematicSpriteObject_XSubPosition,X
    LDA.W CinematicSpriteObject_XPositions,X : SBC.W #$0001 : STA.W CinematicSpriteObject_XPositions,X
    RTS


;;; $F4D1: Pre-instruction - cinematic sprite object $EEF1 (yellow clouds - left) ;;;
PreInstruction_CinematicSpriteObject_YellowClouds_Left:
    LDA.W Mode7TransformationZoomLevel : CMP.W #$0060 : BMI .return
    LDA.W #PreInstruction_CineSpriteObject_YellowClouds_Left_Moving : STA.W CinematicSpriteObject_PreInstructions,X

  .return:
    RTS


;;; $F4E0: Pre-instruction - yellow clouds - left - moving ;;;
PreInstruction_CineSpriteObject_YellowClouds_Left_Moving:
    LDA.W CinematicSpriteObject_YSubPosition,X : CLC : ADC.W #$0000 : STA.W CinematicSpriteObject_YSubPosition,X
    LDA.W CinematicSpriteObject_YPositions,X : ADC.W #$0002 : STA.W CinematicSpriteObject_YPositions,X
    LDA.W CinematicSpriteObject_XSubPosition,X : CLC : ADC.W #$0000 : STA.W CinematicSpriteObject_XSubPosition,X
    LDA.W CinematicSpriteObject_XPositions,X : ADC.W #$0001 : STA.W CinematicSpriteObject_XPositions,X
    RTS


;;; $F507: Pre-instruction - cinematic sprite object $EF27/$EF2D/$EF45/$EF4B/$EF51 (Samus - idle) ;;;
PreInstruction_CinematicSpriteObject_Samus_Idle:
    LDA.W CinematicFunction : CMP.W #RTS_8BDB9D : BNE .return
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_CinematicSpriteObject_Delete_duplicate : STA.W CinematicSpriteObject_InstListPointers,X

  .return:
    RTS


;;; $F51C: RTS. Pre-instruction - cinematic sprite object $EF33 (suitless Samus - letting hair down) ;;;
RTS_8BF51C:
    RTS


;;; $F51D: Instruction - spawn suitless Samus jump cinematic sprite object ;;;
Instruction_CinematicSpriteObject_SpawnSuitlessSamusJump:
    PHY
    LDY.W #CinematicSpriteObjectDefinitions_SuitlessSamus_Jump
    STZ.B DP_Temp12
    JSR Spawn_CinematicSpriteObject_YToIndex12
    PLY
    RTS


;;; $F528: Pre-instruction - Samus - jump - jumping ;;;
Inst_CineSpriteObject_SpawnSuitlessSamus_LettingHairDown:
    JSR MoveJumpingEndingSamus
    LDA.W CinematicSpriteObject_YPositions,X : CMP.W #$FFB0 : BPL .return
    SEP #$20
    LDA.B #$03 : STA.B DP_SpriteSizeAddr
    REP #$20
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_Samus_Jump_Falling : STA.W CinematicSpriteObject_InstListPointers,X
    LDA.W #PreInstruction_CinematicSpriteObject_Samus_Jump_Falling : STA.W CinematicSpriteObject_PreInstructions,X
    LDA.W #$0C00 : STA.W CinematicSpriteObject_PaletteIndices,X

  .return:
    RTS


;;; $F554: Instruction - spawn suited Samus jump cinematic sprite object ;;;
Instruction_CinematicSpriteObject_SpawnSuitedSamusJump:
    PHY
    LDA.W IGTHours : CMP.W #$000A : BMI .gameTimeUnder10
    LDY.W #CinematicSpriteObjectDefinitions_Jump_Head_Helmet
    LDA.W #$0002 : STA.B DP_Temp12
    JSR Spawn_CinematicSpriteObject_YToIndex12
    BRA +

  .gameTimeUnder10:
    LDY.W #CinematicSpriteObjectDefinitions_Jump_Head
    LDA.W #$0002 : STA.B DP_Temp12
    JSR Spawn_CinematicSpriteObject_YToIndex12

+   LDY.W #CinematicSpriteObjectDefinitions_Jump_Body
    STZ.B DP_Temp12
    JSR Spawn_CinematicSpriteObject_YToIndex12
    PLY
    RTS


;;; $F57F: Pre-instruction - suited Samus - jump - head - jumping ;;;
PreInst_CinematicSpriteObject_SuitedSamus_Jump_Head_Jumping:
    JSR MoveJumpingEndingSamus
    LDA.W CinematicSpriteObject_YPositions,X : CMP.W #$FFB0 : BPL .return
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_CinematicSpriteObject_Delete_duplicate : STA.W CinematicSpriteObject_InstListPointers,X

  .return:
    RTS


;;; $F597: Instruction - position Samus head to prepare jump ;;;
Instruction_CineSpriteObject_PositionSuitedHeadToPrepareJump:
    LDA.W IGTHours : CMP.W #$000A : BMI .gameTimeUnder10
    LDA.W #$0076 : STA.W CinematicSpriteObject_XPositions+2,X
    LDA.W #$0078 : STA.W CinematicSpriteObject_YPositions+2,X
    BRA .return

  .gameTimeUnder10:
    LDA.W #$0078 : STA.W CinematicSpriteObject_XPositions+2,X
    LDA.W #$0078 : STA.W CinematicSpriteObject_YPositions+2,X

  .return:
    RTS


;;; $F5BA: Instruction - position Samus head to jump ;;;
Instruction_CinematicSpriteObject_PositionSamusHeadToJump:
    LDA.W IGTHours : CMP.W #$000A : BMI .gameTimeUnder10
    LDA.W #$0078 : STA.W CinematicSpriteObject_XPositions+2,X
    LDA.W #$0072 : STA.W CinematicSpriteObject_YPositions+2,X
    BRA .return

  .gameTimeUnder10:
    LDA.W #$0079 : STA.W CinematicSpriteObject_XPositions+2,X
    LDA.W #$0074 : STA.W CinematicSpriteObject_YPositions+2,X

  .return:
    RTS


;;; $F5DD: Pre-instruction - Samus - jump - falling ;;;
PreInstruction_CinematicSpriteObject_Samus_Jump_Falling:
    JSR TransferPostCreditsSamusBeamToVRAM
    JSR MoveJumpingEndingSamus
    LDA.W CinematicSpriteObject_YPositions,X : CMP.W #$0088 : BMI .return
    LDA.W #$0088 : STA.W CinematicSpriteObject_YPositions,X
    LDA.W #$0001 : STA.W CinematicSpriteObject_InstructionTimers,X
    LDA.W #InstList_Samus_Jump_Landed : STA.W CinematicSpriteObject_InstListPointers,X
    LDA.W #RTS_8B93D9 : STA.W CinematicSpriteObject_PreInstructions,X

  .return:
    RTS


;;; $F604: Instruction - Samus shoots screen ;;;
Instruction_CinematicSpriteObject_SamusShootsScreen:
    PHX : PHY
    LDA.W #$0E00 : STA.W CinematicSpriteObject_PaletteIndices,X
    LDA.W #CinematicFunction_PostCredits_SamusShootsScreen : STA.W CinematicFunction
    SEP #$20
    LDA.B #$11 : STA.B DP_MainScreenLayers
    LDA.B #$10 : STA.B DP_SubScreenLayers
    LDA.B #$02 : STA.B DP_ColorMathA
    LDA.B #$81 : STA.B DP_ColorMathB
    REP #$20
    LDA.W #$FFFC : STA.W CinematicBG1_XPosition
    LDA.W #$FFF8 : STA.W CinematicBG1_YPosition
    LDA.W #$0010 : STA.W CinematicFunctionTimer
    LDA.W #$0020 : STA.W PostCreditsStarsFadeTimer : STA.W PostCreditsSamusFadeTimer
    JSR PaletteCrossFading_CopyCurrentPalettesToFadingPalettes
    JSR PaletteCrossFading_DecomposePaletteDataForFading
    LDA.W #$0022
    JSL QueueSound
    PLY : PLX
    RTS


;;; $F651: Instruction - make ending Samus jump ;;;
Instruction_CinematicSpriteObject_MakeEndingSamusJump:
    STZ.W SamusYSubSpeed
    LDA.W #$FFF0 : STA.W SamusYSpeed
    RTS


;;; $F65B: Move jumping ending Samus ;;;
MoveJumpingEndingSamus:
    LDA.W SamusYSubSpeed : CLC : ADC.W #$3800 : STA.W SamusYSubSpeed
    LDA.W SamusYSpeed : ADC.W #$0000 : STA.W SamusYSpeed
    LDA.W CinematicSpriteObject_YSubPosition,X : CLC : ADC.W SamusYSubSpeed : STA.W CinematicSpriteObject_YSubPosition,X
    LDA.W CinematicSpriteObject_YPositions,X : ADC.W SamusYSpeed : STA.W CinematicSpriteObject_YPositions,X
    RTS


;;; $F682: Transfer post-credits Samus beam to VRAM ;;;
TransferPostCreditsSamusBeamToVRAM:
    PHX : PHY
    LDA.W PostCreditsSMIconVRAMTransferIndex : CMP.W #$0010 : BPL .return
    ASL : TAY
    LDX.W VRAMWriteStack
    LDA.W #$0800 : STA.B VRAMWrite.size,X
    INX #2
    LDA.W .sourceAddresses,Y : STA.B VRAMWrite.size,X
    INX #2
    SEP #$20
    LDA.B #$7F : STA.B VRAMWrite.size,X
    REP #$20
    INX
    LDA.W .VRAMAddresses,Y : STA.B VRAMWrite.size,X
    INX #2 : STX.W VRAMWriteStack
    INC.W PostCreditsSMIconVRAMTransferIndex

  .return:
    PLY : PLX
    RTS

.sourceAddresses:
    dw $4000,$4800,$5000,$5800,$6000,$6800,$7000,$7800
    dw $8000,$8800,$9000,$9800,$A000,$A800,$B000,$B800

.VRAMAddresses:
    dw $0000,$0400,$0800,$0C00,$1000,$1400,$1800,$1C00
    dw $2000,$2400,$2800,$2C00,$3000,$3400,$3800,$3C00


;;; $F6F8: Credits object definition ;;;
CreditsObjectDefinition:
    dw RTS_8B93D9             ; Initialisation function
    dw RTS_8B93D9             ; Pre-instruction
    dw InstList_Credits_Start ; Instruction list (bank $8C)


;;; $F6FE: Instruction - end credits ;;;
Instruction_EndCredits:
    PHP : PHB
    PHK : PLB
    REP #$30
    PHX : PHY
    JSR Disable_CreditsObject
    LDX.W #$0008

  .loop:
    LDA.L Palettes_PostCredits,X : STA.L Palettes,X
    INX #2 : CPX.W #$0200 : BMI .loop
    SEP #$20
    STZ.B DP_MainScreenLayers
    LDA.B #$80 : STA.B DP_Brightness
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    STZ.W CinematicBG1_YSubPosition : STZ.W CinematicBG1_YPosition
    LDA.W #$0001 : STA.W CreditsObject_ShootingStarsEnable
    LDA.W #CinematicFunction_PostCredits_BlankScreen : STA.W CinematicFunction
    LDA.W #$003C : STA.W CinematicFunctionTimer
    PLY : PLX : PLB : PLP
    RTS


;;; $F748: Cinematic BG object definitions - post-credits ;;;
CinematicBGObjectDefinitions_PostCredits_SeeYouNextMission:
    dw RTS_8B93D9                                          ; Initialisation function
    dw RTS_8B93D9                                          ; Pre-instruction
    dw CinematicBGObjectInstLists_Ending_SeeYouNextMission ; Instruction list (bank $8C)

CinematicBGObjectDefinitions_PostCredits_ItemPercentage:
    dw RTS_8B93D9                                       ; Initialisation function
    dw RTS_8B93D9                                       ; Pre-instruction
    dw CinematicBGObjectInstLists_Ending_ItemPercentage ; Instruction list (bank $8C)


;;; $F754: Debug. Version string ;;;
Debug_VersionString:
    db "02.02.21.30", $00


Freespace_Bank8B_F760:
; $8A0 bytes
