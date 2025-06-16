
org $888000


;{
; General comments
;{
; Summary of `[$1986] != 0` branch
; |_[$1986]_____|_Main screen layers__|_Subscreen layers____|_Colour math_|_Colour math layers___________|_Y_|_Misc.________________________________
; | 2/Eh/20h    | BG1/BG2/    sprites |         BG3         | Additive    | BG1/BG2    /sprites/backdrop | 0 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | 4           | BG1    /    sprites |         BG3         | Additive    | BG1/BG2    /sprites/backdrop | 0 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | 6           | BG1/BG2/    sprites |         BG3/sprites | Additive    | BG1/BG2/BG3        /backdrop | 0 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | 8           | BG1/BG2/    sprites |         BG3/sprites | Additive    |     BG2            /backdrop | 0 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | Ah          | BG1/BG2/    sprites |         BG3         | Additive    |     BG2    /sprites/backdrop | 0 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | Ch          | BG1/BG2/    sprites |         BG3         | Subtractive |     BG2            /backdrop | 0 | Disable colour math subscreen layers,  disable window masking, enable all layers in window area
; | 10h/12h     | BG1/BG2/    sprites |         BG3         | Additive    | BG1/BG2    /sprites/backdrop | 0 | Enable  colour math subscreen layers,  enable BG3 / colour math window 1 inclusive mask, disable BG3 in window area subscreen
; | 14h/22h     | BG1/BG2/    sprites |         BG3         | Subtractive | BG1/BG2    /sprites/backdrop | 0 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | 16h         | BG1    /    sprites |     BG2/BG3         | Subtractive | BG1        /sprites/backdrop | 4 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | 18h/1Eh/30h |         BG3         | BG1/BG2    /sprites | Additive    |         BG3        /backdrop | 2 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | 1Ah         | BG1    /BG3/sprites |     BG2             | Additive    | BG1    /BG3/sprites/backdrop | 4 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | 1Ch         | BG1    /BG3/sprites |     BG2             | Halved      | BG1    /BG3/sprites          | 0 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | 24h         | BG1/BG2/    sprites |         BG3         | Additive    | BG1/BG2    /sprites/backdrop | 0 | Restrict colour math to inside window, disable BG1/BG2 window 1/2 masking, enable BG3/colour math window 1 inclusive mask, disable BG1/BG2/sprites in window area main screen, disable BG3 in window area subscreen
; | 26h         | BG1/BG2/    sprites |         BG3         | Halved      | BG1/BG2/BG3/sprites/backdrop | 0 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | 28h         | BG1/BG2/    sprites |         BG3         | Subtractive | BG1/BG2    /sprites/backdrop | 0 | Disable colour math subscreen layers,  disable window masking, enable all layers in window area, if [$1987] & 80h = 0: colour math subscreen backdrop colour = (5, 0, 0) (red)
; | 2Ah         | BG1/BG2/    sprites |         BG3         | Subtractive | BG1/BG2    /sprites/backdrop | 0 | Disable colour math subscreen layers,  disable window masking, enable all layers in window area, if [$1987] & 80h = 0: colour math subscreen backdrop colour = (6, 2, 0) (orange)
; | 2Ch         | BG1/BG2/    sprites |         BG3         | Additive    | BG1/BG2    /sprites/backdrop | 0 | Disable colour math subscreen layers,  disable window masking, enable all layers in window area
; | 2Eh         | BG1/BG2/    sprites |         BG3         | Subtractive | BG1/BG2    /sprites/backdrop | 0 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | 32h         | BG1/BG2/    sprites |         BG3         | Subtractive |     BG2    /sprites/backdrop | 0 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | 34h         | BG1/BG2/    sprites |         BG3         | Additive    | BG1/BG2    /sprites/backdrop | 6 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area

; Attempted explanation of each value:
;{
;     Normal: BG1/BG2/sprites are drawn with BG3 added on top
;     2/Eh/20h: Normal

;     4: Normal, but BG2 is disabled
;         Used by Phantoon when hidden

;     6: Normal, but sprites aren't affected by BG3 and sprites are added to BG1/BG2 (instead of hidden)
;         Unused

;     8: Normal, but BG1/sprites aren't affected by BG3 and sprites are added to BG2 (instead of hidden)
;         Used in some power off Wrecked Ship rooms

;     Ah: Normal, but BG1 isn't affected by BG3
;         Used with FX type = spores

;     Ch: Normal, but BG3 is disabled and colour math is subtractive
;         Used with FX type = fireflea

;     10h/12h: Normal, but BG3 is disabled inside window 1
;         Used by morph ball eye and varia/gravity suit pickup

;     14h/22h: Normal, but colour math is subtractive
;         Sometimes use with FX type = water

;     16h: BG1/sprites are drawn after the result of drawing BG2/BG3 is subtracted and Y = 4
;         Sometimes use with FX type = water

;     18h/1Eh/30h: BG3 is drawn with the result of drawing BG1/BG2/sprites added on top and Y = 2
;         Used with FX type = lava / acid / fog / Tourian entrance statue, sometimes use with FX type = water
;         This is equivalent to normal, right? Apparently bypasses sprite colour math limitation(?)

;     1Ah: Normal, but BG2 and BG3 have reversed roles and Y = 4
;         Used by Phantoon when semi-transparent

;     1Ch: Normal, but BG2 and BG3 have reversed roles, colour addition is halved and backdrop is disabled
;         Unused

;     24h: BG1/BG2/sprites are drawn. Within window 1, the backdrop is added on top
;         Used by Mother Brain

;     26h: Normal, but colour addition is halved
;         Unused

;     28h: Normal, but BG3 is disabled, colour math is subtractive, and the backdrop subtracts red if there is no power bomb explosion
;         Used in some default state Crateria rooms, some power off Wrecked Ship rooms, pre plasma beam rooms

;     2Ah: Normal, but BG3 is disabled, colour math is subtractive, and the backdrop subtracts orange if there is no power bomb explosion
;         Used in blue Brinstar rooms, Kraid's lair entrance, n00b tube side rooms, plasma beam room, some sand falls rooms

;     2Ch: Normal, but BG3 is disabled
;         Used by FX type = haze and torizos

;     2Eh: Normal, but colour math is subtractive
;         Unused

;     32h: Normal, but BG1 isn't affected by BG3 and colour math is subtractive
;         Unused

;     34h: Normal, but Y = 6
;         Used by Mother Brain phase 2
;}

; The Y values, power bomb configuration:
;{
;     Normal: BG1/BG2/sprites are drawn with BG3 drawn on top, BG3 is disabled inside window 2
;     Y = 0/2: Normal
;     Y = 4: BG1/sprites are drawn with the result of drawing BG2/BG3 added on top, BG2/BG3 is disabled inside window 2
;     Y = 6: Normal, but BG2 isn't affected by BG3
;}

; $1986: Layer blending configuration
;{
;     Set to [FX A] at the start of the HDMA object handler. See "rooms by FX A.asm"
;     Set to [FX B] by:
;         $B3B0: FX type 2 / 4: lava / acid
;         $C48E: FX type 6 / 26h: water / Tourian entrance statue
;         $D9A1: FX type Ah: rain
;         $DA47: FX type 8: spores
;         $DB36: FX type Ch: fog

;     Set to 4/1Ah by $E449: Phantoon semi-transparency
;     Set to Ch by $B0BC: FX type 24h: fireflea
;     Set to 10h by $E917, $E9E6, $EA3C, $EACB: morph ball eye beam
;     Set to 12h by:
;         $E026: varia suit pickup
;         $E05C: gravity suit pickup
;     Set to 24h by $E767, $E7BC: Mother Brain rainbow beam
;     Set to 2Ch by:
;         $DE18, $DE96: FX type 2Ch: Ceres haze
;         $DD43: Bomb Torizo haze
;}

; $1984: FX layer 3 layer blending configuration (FX B)
;{
;     FX type = spores:                  FX B = Ah
;     FX type = rain:                    FX B = Eh
;     FX type = water:                   FX B = 14h/16h/18h
;     FX type = Tourian entrance statue: FX B = 18h
;     FX type = lava/acid:               FX B = 1Eh
;     FX type = fog:                     FX B = 30h
;}
;}


;;; $8000: Layer blending handler ;;;
LayerBlending_Handler:
    PHP
    SEP #$30
    LDY.B #$00
    LDX.W LayerBlending_Config : BEQ .powerBomb
    JSR Initialize_LayerBlending
    JSR.W (.pointers,X)

  .powerBomb:
    BIT.W LayerBlending_Window2Config : BPL .xrayShowBlocks
    JSR Handle_LayerBlending_PowerBomb
    BRA .return

  .xrayShowBlocks:
    BIT.W LayerBlending_Window2Config : BVC .xrayHideBlocks
    JSR Handle_LayerBlending_Xray_CanShowBlocks
    BRA .return

  .xrayHideBlocks:
    LDA.W LayerBlending_Window2Config : BIT.B #$20 : BEQ .xrayFirefleaRoom
    JSR Handle_LayerBlending_Xray_CantShowBlocks
    BRA .return

  .xrayFirefleaRoom:
    LDA.W LayerBlending_Window2Config : BIT.B #$10 : BEQ .return
    JSR Handle_LayerBlending_Xray_FirefleaRoom
    BRA .return ; >_<

  .return:
    PLP
    RTS

  .pointers:
    dw RTS_888074
    dw RTS_888074
    dw LayerBlending_4_Phantoon
    dw UNUSED_LayerBlending_6_888099
    dw LayerBlending_8_WreckedShipPowerOff
    dw LayerBlending_A_Spores
    dw LayerBlending_C_Fireflea
    dw RTS_8880B7
    dw LayerBlending_10_12_MorphBallEye_SuitPickup
    dw LayerBlending_10_12_MorphBallEye_SuitPickup
    dw LayerBlending_14_22_Water
    dw LayerBlending_16_Water
    dw LayerBlending_18_1E_30_Water_LavaAcid_Fog
    dw LayerBlending_1A_Phantoon
    dw LayerBlending_1C
    dw LayerBlending_18_1E_30_Water_LavaAcid_Fog
    dw RTS_88810C
    dw LayerBlending_14_22_Water
    dw LayerBlending_24_MotherBrain
    dw LayerBlending_26
    dw LayerBlending_28
    dw LayerBlending_2A
    dw LayerBlending_2C
    dw LayerBlending_2E
    dw LayerBlending_18_1E_30_Water_LavaAcid_Fog
    dw UNUSED_LayerBlending_32_88814A
    dw LayerBlending_34


;;; $8074: RTS. Layer blending configuration 0/2 ;;;
RTS_888074:
    RTS


;;; $8075: Initialise layer blending ;;;
Initialize_LayerBlending:
    STZ.B DP_WindowMaskBG12 : STZ.B DP_WindowMaskBG34 : STZ.B DP_WindowMaskSprite
    LDA.B #$13 : STA.B DP_MainScreenLayers
    LDA.B #$04 : STA.B DP_SubScreenLayers
    STZ.B DP_WindowAreaMainScreen : STZ.B DP_WindowAreaSubScreen
    LDA.B #$02 : STA.B DP_NextGameplayColorMathA
    LDA.B #$33 : STA.B DP_NextGameplayColorMathB
    RTS


;;; $8090: Layer blending configuration 4 - Phantoon - hidden (BG2 disabled) ;;;
LayerBlending_4_Phantoon:
    LDA.B #$11 : STA.B DP_MainScreenLayers
    LDA.B #$04 : STA.B DP_SubScreenLayers
    RTS


;;; $8099: Unused. Layer blending configuration 6 - semi-transparent sprites on BG1/BG2 ;;;
UNUSED_LayerBlending_6_888099:
    LDA.B #$14 : STA.B DP_SubScreenLayers
    LDA.B #$27 : STA.B DP_NextGameplayColorMathB
    RTS


;;; $80A2: Layer blending configuration 8 - coven (semi-transparent sprites on BG2) ;;;
LayerBlending_8_WreckedShipPowerOff:
; Used in:
;     Room $CA52, state $CA64. Wrecked Ship attic - default
;     Room $CAF6, state $CB08. Wrecked Ship mainstreet - default
;     Room $CCCB, state $CCDD. Wrecked Ship map station - default
    LDA.B #$14 : STA.B DP_SubScreenLayers
    LDA.B #$22 : STA.B DP_NextGameplayColorMathB
    RTS


;;; $80AB: Layer blending configuration Ah - spores (BG3 hidden by BG1) ;;;
LayerBlending_A_Spores:
; Used with spores
    LDA.B #$32 : STA.B DP_NextGameplayColorMathB
    RTS


;;; $80B0: Layer blending configuration Ch - fireflea (BG3 disabled, BG2 dimmed by subscreen backdrop) ;;;
LayerBlending_C_Fireflea:
; Used with FX type = fireflea
    STZ.B DP_NextGameplayColorMathA
    LDA.B #$A2 : STA.B DP_NextGameplayColorMathB
    RTS


;;; $80B7: RTS. Layer blending configuration Eh - rain ;;;
RTS_8880B7:
    RTS


;;; $80B8: Layer blending configuration 10h/12h - subscreen backdrop window (BG3 disabled, colour math disabled outside window 1) ;;;
LayerBlending_10_12_MorphBallEye_SuitPickup:
; 10h is used by morph ball eye
; 12h is used by varia/gravity suit pickup

; The BG3 hides the subscreen backdrop, so the BG3 window mask is used to reveal the subscreen backdrop inside the window
; The colour math window mask disables the blending of BG3 outside the window (note subscreen backdrop is not affected by windowing and must be hidden by BG3)
    LDA.B #$02 : STA.B DP_WindowMaskBG34
    LDA.B #$20 : STA.B DP_WindowMaskSprite
    LDA.B #$04 : STA.B DP_WindowAreaSubScreen
    RTS


;;; $80C5: Layer blending configuration 14h/22h - water - dimmed by BG3 ;;;
LayerBlending_14_22_Water:
; 14h is sometimes used with FX type = water
; 22h is unused
    LDA.B #$B3 : STA.B DP_NextGameplayColorMathB
    RTS


;;; $80CA: Layer blending configuration 16h - water - background waterfalls (dimmed by BG2/BG3) ;;;
LayerBlending_16_Water:
;; Returns:
;;     Y: Layer blending power bomb configuration

; Used with FX type = water in:
;     Room $D72A. Maridia grapple room
;     Room $D913. Maridia grapple wall shaft
;     Room $DA2B. Maridia cacatac room east
    LDY.B #$04
    LDA.B #$11 : STA.B DP_MainScreenLayers
    LDA.B #$06 : STA.B DP_SubScreenLayers
    LDA.B #$B1 : STA.B DP_NextGameplayColorMathB
    RTS


;;; $80D9: Layer blending configuration 1Ah - Phantoon - semi-transparent (semi-transparent BG2 on BG1) ;;;
LayerBlending_1A_Phantoon:
;; Returns:
;;     Y: Layer blending power bomb configuration
    LDY.B #$04
    LDA.B #$15 : STA.B DP_MainScreenLayers
    LDA.B #$02 : STA.B DP_SubScreenLayers
    LDA.B #$35 : STA.B DP_NextGameplayColorMathB
    RTS


;;; $80E8: Unused. Layer blending configuration 1Ch - semi-transparent BG2 on semi-transparent BG1/BG3/sprites ;;;
LayerBlending_1C:
    LDA.B #$15 : STA.B DP_MainScreenLayers
    LDA.B #$02 : STA.B DP_SubScreenLayers
    LDA.B #$55 : STA.B DP_NextGameplayColorMathB
    RTS


;;; $80F5: Layer blending configuration 18h/1Eh/30h - colour math affects all sprite palettes (semi-transparent BG1/BG2/sprites on BG3) ;;;
LayerBlending_18_1E_30_Water_LavaAcid_Fog:
;; Returns:
;;     Y: Layer blending power bomb configuration

; 18h is sometimes used with FX type = water
; 18h is used with FX type = Tourian entrance statue
; 1Eh is used with FX type = lava/acid
; 30h is used with FX type = fog

; Unsure of the significance of h/v-counter interrupts being disabled...
    LDY.B #$02
    LDA.B DP_IRQAutoJoy : AND.B #$30 : EOR.B #$30 : BNE .return
    LDA.B #$24 : STA.B DP_NextGameplayColorMathB
    LDA.B #$13 : STA.B DP_SubScreenLayers
    LDA.B #$04 : STA.B DP_MainScreenLayers

  .return:
    RTS


;;; $810C: RTS. Layer blending configuration 20h ;;;
RTS_88810C:
    RTS


;;; $810D: Unused. Layer blending configuration 26h - semi-transparent BG3 on semi-transparent BG1/BG2/sprites ;;;
LayerBlending_26:
    LDA.B #$77 : STA.B DP_NextGameplayColorMathB
    RTS


;;; $8112: Layer blending configuration 28h - red desaturation (BG3 disabled, dimmed by red subscreen backdrop) ;;;
LayerBlending_28:
; Used in:
;     Room 92FD, state $9314 ; Crateria mainstreet, default state
;     Room 9A44, state $9A56 ; Crateria bomb block hall, default state
;     Room 9A90, state $9AA2 ; Crateria chozo missile, default state
;     Room C98E, state $C9A0 ; Wrecked Ship spike floor hall, power off
;     Room CC6F, state $CC81 ; Pre Phantoon hall, power off
;     Room D27E ; Plasma beam puyo room
;     Room D387 ; Pre plasma beam shaft
    STZ.B DP_NextGameplayColorMathA
    LDA.B #$B3 : STA.B DP_NextGameplayColorMathB
    BIT.W LayerBlending_Window2Config : BMI .return
    LDA.B #$25 : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.B #$40 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor2

  .return:
    RTS


;;; $812A: Layer blending configuration 2Ah - orange desaturation (BG3 disabled, dimmed by orange subscreen backdrop) ;;;
LayerBlending_2A:
; Used in:
;     Room $97B5, state $97C6. Crateria -> Blue Brinstar elevator - default
;     Room $9E9F, state $9EB1. Morph ball room - default
;     Room $9F11, state $9F23. Old Kraid entrance - default
;     Room $9F64, state $9F76. Blue Brinstar ceiling e-tank hall - default
;     Room $A6A1. Kraid's lair entrance
;     Room $CF54. n00b tube west
;     Room $CF80. n00b tube east
;     Room $D2AA. Plasma beam room
;     Room $D54D. Snail room quicksand fall west
;     Room $D57A. Snail room quicksand fall east
;     Room $D86E. Sandy Maridia quicksand fall
;     Room $D898. Maridia speed blockade quicksand fall
    STZ.B DP_NextGameplayColorMathA
    LDA.B #$B3 : STA.B DP_NextGameplayColorMathB
    BIT.W LayerBlending_Window2Config : BMI .return
    LDA.B #$26 : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.B #$42 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor2

  .return:
    RTS


;;; $8142: Layer blending configuration 2Ch - haze (BG3 disabled) ;;;
LayerBlending_2C:
; Used by FX type = Ceres haze and Bomb Torizo haze
    STZ.B DP_NextGameplayColorMathA
    RTS


;;; $8145: Unused. Layer blending configuration 2Eh - dimmed by BG3 ;;;
LayerBlending_2E:
; Clone of LayerBlending_14_22_Water
    LDA.B #$B3 : STA.B DP_NextGameplayColorMathB
    RTS


;;; $814A: Unused. Layer blending configuration 32h - dimmed by BG3, BG3 hidden by BG1 ;;;
UNUSED_LayerBlending_32_88814A:
    LDA.B #$44 : STA.B DP_SubScreenLayers
    LDA.B #$B2 : STA.B DP_NextGameplayColorMathB
    RTS


;;; $8153: Layer blending configuration 34h - Mother Brain phase 2 (power bomb explosion doesn't affect BG2) ;;;
LayerBlending_34:
;; Returns:
;;     Y: Layer blending power bomb configuration
    LDY.B #$06
    RTS


;;; $8156: Layer blending configuration 24h - Mother Brain rainbow beam (BG3 disabled, colour math disabled outside window 1) ;;;
LayerBlending_24_MotherBrain:
    LDA.B #$00 : STA.B DP_WindowMaskBG12
    LDA.B #$02 : STA.B DP_WindowMaskBG34
    LDA.B #$20 : STA.B DP_WindowMaskSprite
    LDA.B #$13 : STA.B DP_MainScreenLayers
    LDA.B #$04 : STA.B DP_SubScreenLayers
    LDA.B #$13 : STA.B DP_WindowAreaMainScreen
    LDA.B #$04 : STA.B DP_WindowAreaSubScreen
    LDA.B #$10 : STA.B DP_NextGameplayColorMathA
    LDA.B #$33 : STA.B DP_NextGameplayColorMathB
    RTS


;;; $817B: Handle layer blending x-ray - can show blocks ;;;
Handle_LayerBlending_Xray_CanShowBlocks:
; Disable BG1 inside window
; Disable BG2 outside window
; Disable BG3
; Enabled halved colour math outside window
    LDA.B #$C8 : STA.B DP_WindowMaskBG12
    LDA.B #$08 : STA.B DP_WindowMaskBG34
    LDA.B #$80 : STA.B DP_WindowMaskSprite
    LDA.B #$13 : STA.B DP_MainScreenLayers
    LDA.B #$04 : STA.B DP_SubScreenLayers
    LDA.B #$03 : STA.B DP_WindowAreaMainScreen
    LDA.B #$04 : STA.B DP_WindowAreaSubScreen
    LDA.B #$22 : STA.B DP_NextGameplayColorMathA
    LDA.B DP_NextGameplayColorMathB : AND.B #$80 : ORA.B #$73 : STA.B DP_NextGameplayColorMathB
    RTS


;;; $81A4: Handle layer blending x-ray - can't show blocks ;;;
Handle_LayerBlending_Xray_CantShowBlocks:
; Disable BG3
; Enabled halved colour math outside window
; If n00b tube room, disable BG2
    STZ.B DP_WindowMaskBG12
    LDA.B #$08 : STA.B DP_WindowMaskBG34
    LDA.B #$80 : STA.B DP_WindowMaskSprite
    LDA.B #$13 : STA.B DP_MainScreenLayers
    LDA.B #$04 : STA.B DP_SubScreenLayers
    LDA.B #$03 : STA.B DP_WindowAreaMainScreen
    LDA.B #$04 : STA.B DP_WindowAreaSubScreen
    LDA.B #$22 : STA.B DP_NextGameplayColorMathA
    LDA.B DP_NextGameplayColorMathB : AND.B #$80 : ORA.B #$61 : STA.B DP_NextGameplayColorMathB
    REP #$20
    LDA.W RoomPointer : CMP.W #RoomHeader_GlassTunnel
    SEP #$20
    BNE .return
    LDA.B #$11 : STA.B DP_MainScreenLayers

  .return:
    RTS


;;; $81DB: Handle layer blending x-ray - fireflea room ;;;
Handle_LayerBlending_Xray_FirefleaRoom:
; Disable BG3
; Enabled subtractive colour math outside window
    STZ.B DP_WindowMaskBG12
    LDA.B #$08 : STA.B DP_WindowMaskBG34
    LDA.B #$80 : STA.B DP_WindowMaskSprite
    LDA.B #$13 : STA.B DP_MainScreenLayers
    LDA.B #$04 : STZ.B DP_SubScreenLayers
    LDA.B #$03 : STA.B DP_WindowAreaMainScreen
    LDA.B #$04 : STA.B DP_WindowAreaSubScreen
    LDA.B #$20 : STA.B DP_NextGameplayColorMathA
    LDA.B #$B3 : STA.B DP_NextGameplayColorMathB
    RTS


;;; $81FE: Handle layer blending power bomb ;;;
Handle_LayerBlending_PowerBomb:
;; Parameters:
;;     Y: Layer blending power bomb configuration
    REP #$30
    LDA.W RoomPointer : CMP.W #RoomHeader_Statues
    SEP #$30
    BNE +
    LDY.B #$06

+   TYX
    JSR.W (.pointers,X)
    RTS

  .pointers:
    dw Handle_LayerBlending_PowerBomb_0_2
    dw Handle_LayerBlending_PowerBomb_0_2
    dw Handle_LayerBlending_PowerBomb_4
    dw Handle_LayerBlending_PowerBomb_6


;;; $8219: Handle layer blending power bomb configuration 0/2 - normal ;;;
Handle_LayerBlending_PowerBomb_0_2:
    LDA.B #$00 : STA.B DP_WindowMaskBG12
    LDA.B #$08 : STA.B DP_WindowMaskBG34
    LDA.B #$80 : STA.B DP_WindowMaskSprite
    LDA.B #$02 : STA.B DP_NextGameplayColorMathA
    LDA.B #$37 : STA.B DP_NextGameplayColorMathB
    LDA.B #$00 : STA.B DP_WindowAreaMainScreen
    LDA.B #$04 : STA.B DP_WindowAreaSubScreen
    LDA.B #$13 : STA.B DP_MainScreenLayers
    LDA.B #$04 : STA.B DP_SubScreenLayers
    RTS


;;; $823E: Handle layer blending power bomb configuration 4 - BG2 hidden by explosion ;;;
Handle_LayerBlending_PowerBomb_4:
; Used by:
;    Layer blending configuration 16h - water - background waterfalls
;    Layer blending configuration 1Ah - Phantoon - semi-transparent
    LDA.B #$80 : STA.B DP_WindowMaskBG12
    LDA.B #$08 : STA.B DP_WindowMaskBG34
    LDA.B #$80 : STA.B DP_WindowMaskSprite
    LDA.B #$02 : STA.B DP_NextGameplayColorMathA
    LDA.B #$37 : STA.B DP_NextGameplayColorMathB
    LDA.B #$00 : STA.B DP_WindowAreaMainScreen
    LDA.B #$06 : STA.B DP_WindowAreaSubScreen
    LDA.B #$11 : STA.B DP_MainScreenLayers
    LDA.B #$06 : STA.B DP_SubScreenLayers
    RTS


;;; $8263: Handle layer blending power bomb configuration 6 - explosion hidden by BG2 ;;;
Handle_LayerBlending_PowerBomb_6:
; Used by:
;     Layer blending configuration 34h - Mother Brain phase 2

; Compared with config 0/2, this one disables colour math on BG2/BG3
    LDA.B #$00 : STA.B DP_WindowMaskBG12
    LDA.B #$08 : STA.B DP_WindowMaskBG34
    LDA.B #$80 : STA.B DP_WindowMaskSprite
    LDA.B #$02 : STA.B DP_NextGameplayColorMathA
    LDA.B #$31 : STA.B DP_NextGameplayColorMathB
    LDA.B #$00 : STA.B DP_WindowAreaMainScreen
    LDA.B #$04 : STA.B DP_WindowAreaSubScreen
    LDA.B #$13 : STA.B DP_MainScreenLayers
    LDA.B #$04 : STA.B DP_SubScreenLayers
    RTS


;;; $8288: Enable HDMA objects ;;;
Enable_HDMAObjects:
    PHP
    REP #$20
    LDA.W #$8000 : TSB.W HDMAObject_Enable
    PLP
    RTL


;;; $8293: Disable HDMA objects ;;;
Disable_HDMAObjects:
; Power bombs still work
    PHP
    REP #$20
    LDA.W #$8000 : TRB.W HDMAObject_Enable
    PLP
    RTL


;;; $829E: Wait until the end of a v-blank and clear (H)DMA enable flags ;;;
Wait_End_VBlank_Clear_HDMA:
    PHP
    SEP #$20
    JSL WaitUntilTheEndOfAVBlank
    STZ.W $420B : STZ.W $420C
    PLP
; fallthrough to Delete_HDMA_Objects


;;; $82AC: Delete HDMA objects ;;;
Delete_HDMAObjects:
    PHP
    SEP #$20
    STZ.B DP_HDMAEnable
    REP #$30
    PHX
    LDX.W #$000A

  .loop:
    STZ.W HDMAObject_ChannelBitflags,X
    DEX #2 : BPL .loop
    PLX : PLP
    RTL


;;; $82C1: Initialise special effects for new room ;;;
Initialise_Special_Effects_for_New_Room:
; This initial bit regarding earthquake sound effects is strictly for rising acid/lava rooms
    PHP
    REP #$20
    STZ.W EarthquakeSFX_Index : STZ.W EarthquakeSFX_Timer
    LDA.W RoomPointer : CMP.W #RoomHeader_BombTorizo : BEQ .noEarthquakeSFX
    CMP.W #RoomHeader_Climb : BEQ .noEarthquakeSFX
    CMP.W #RoomHeader_Ridley : BEQ .noEarthquakeSFX
    CMP.W #RoomHeader_Pillar : BEQ .noEarthquakeSFX
    CMP.W #RoomHeader_MotherBrain : BEQ .noEarthquakeSFX
    CMP.W #RoomHeader_TourianEscape4 : BEQ .noEarthquakeSFX
    BRA .earthquakeSFX

  .noEarthquakeSFX:
    LDA.W #$FFFF : STA.W EarthquakeSFX_Timer

  .earthquakeSFX:
    STZ.W DisableMinimap
    SEP #$30
    LDX.B #$20

  .loopClearHDMARegisters:
    STZ.W $4300,X
    LDA.B #$13 : STA.W $4301,X
    STZ.W $4302,X : STZ.W $4303,X : STZ.W $4304,X
    STZ.W $4305,X : STZ.W $4306,X : STZ.W $4308,X
    STZ.W $4309,X
    TXA : CLC : ADC.B #$10 : TAX
    CPX.B #$80 : BNE .loopClearHDMARegisters
    REP #$30
    LDA.W #$FFFF
    STZ.W FX_YSubPosition
    STA.W FX_YPosition
    STZ.W FX_LavaAcidYSubPosition
    STA.W FX_LavaAcidYPosition
    LDA.W #$0000 : STA.L HUDBG3XPosition : STA.L HUDBG3YPosition
    STA.L BG3XPosition : STA.L BG3YPosition
    STZ.W Mode7Flag
    STZ.W CameraDistanceIndex
    STZ.W TourianStatueAnimationState : STZ.W TourianStatueFinishedProcessing
    STZ.W EarthquakeTimer
    STZ.W LayerBlending_PhantoonSemiTransparencyFlag
    STZ.W PowerBombExplosionStatus
    STZ.W SamusProjectile_PowerBombFlag : STZ.W SamusProjectile_PowerBombExplosionRadius
    STZ.W FX_TilemapPointer : STZ.W FX_Type
    LDA.W #$8000 : STA.W FX_BaseYSubPosition
    STZ.W FX_BaseYPosition : STZ.W FX_TargetYPosition
    STZ.W FX_YSubVelocity : STZ.W FX_LiquidOptions
    STZ.W FX_Timer : STZ.W FX_TidePhase
    STZ.W FX_YSubOffset : STZ.W FX_YOffset
    LDA.W #$0002 : STA.W LayerBlending_DefaultConfig
    STZ.B DP_BG3XScroll : STZ.B DP_BG3YScroll
    STZ.W Layer2XPosition : STZ.W Layer2YPosition
    STZ.B DP_RoomLoadIRQCmd
    LDA.W #.return>>8&$FF00 : STA.W PauseHook_Pause+1 : STA.W PauseHook_Unpause+1
    LDA.W #.return : STA.W PauseHook_Pause : STA.W PauseHook_Unpause
    SEP #$20
    LDA.B #$F0 : STA.W $2181
    LDA.B #$FF : STA.W $2182
    LDA.B #$01 : STA.W $2183
    STZ.B DP_HDMAEnable
    LDA.B #$20 : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.B #$40 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor2
    STZ.B DP_Mosaic
    LDA.B #$13 : STA.B DP_MainScreenLayers
    STZ.B DP_ColorMathA : STZ.B DP_ColorMathB : STZ.B DP_BGTilesAddr
    LDA.B #$04 : STA.B DP_BGTilesAddr+1
    LDA.B #$49 : STA.B DP_BG2TilemapAddrSize
    LDA.B #$5A : STA.B DP_BG3TilemapAddrSize : STA.B DP_GameplayBG1TilemapAddrSize
    PLP

.return:
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $83E2: Unused. Spawn HDMA object on HDMA channel 2 ;;;
UNUSED_SpawnHDMAObject_Slot0_Channel4_Index20_8883E2:
;; Parameters:
;;     [[S] + 1] + 1: HDMA control
;;     [[S] + 1] + 2: HDMA target
;;     [[S] + 1] + 3: HDMA object instruction list pointer
;; Returns:
;;     Carry: Clear
;;     A: HDMA object index
    PHP : PHB
    REP #$20
    LDA.W #$0400 : STA.B DP_Temp12
    LDA.W #$0020 : STA.B DP_Temp14
    LDX.W #$0000
    JMP SpawnHDMAObject_SlotX_Hardcoded


;;; $83F6: Unused. Spawn HDMA object on HDMA channel 6 ;;;
UNUSED_SpawnHDMAObject_Slot8_Channel40_Index60_8883F6:
;; Parameters:
;;     [[S] + 1] + 1: HDMA control
;;     [[S] + 1] + 2: HDMA target
;;     [[S] + 1] + 3: HDMA object instruction list pointer
;; Returns:
;;     Carry: Clear
;;     A: HDMA object index
    PHP : PHB
    REP #$20
    LDA.W #$4000 : STA.B DP_Temp12
    LDA.W #$0060 : STA.B DP_Temp14
    LDX.W #$0008
    JMP SpawnHDMAObject_SlotX_Hardcoded
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $840A: Spawn HDMA object on HDMA channel 7 ;;;
SpawnHDMAObject_SlotA_Channel80_Index70:
;; Parameters:
;;     [[S] + 1] + 1: HDMA control
;;     [[S] + 1] + 2: HDMA target
;;     [[S] + 1] + 3: HDMA object instruction list pointer
;; Returns:
;;     Carry: Clear
;;     A: HDMA object index

; Called by:
;     $D865: Spawn BG3 scroll HDMA object
    PHP : PHB
    REP #$20
    LDA.W #$8000 : STA.B DP_Temp12
    LDA.W #$0070 : STA.B DP_Temp14
    LDX.W #$000A
; fallthrough to SpawnHDMAObject_SlotX_Hardcoded


;;; $841B: Spawn HDMA object to slot [X] (hardcoded parameters) ;;;
SpawnHDMAObject_SlotX_Hardcoded:
;; Parameters:
;;     X: HDMA object index
;;     [[S] + 1] + 3: HDMA control
;;     [[S] + 1] + 4: HDMA target
;;     [[S] + 1] + 5: HDMA object instruction list pointer
;;     $13: HDMA object channel bitflag
;;     $14: HDMA object channel index
;; Returns:
;;     Carry: Clear
;;     A: HDMA object index

; Must have DB and P pushed
    SEP #$20
    LDA.B $05,S : PHA : PLB
    XBA
    LDA.B #$00
    REP #$30
    STA.B DP_Temp18
    LDA.B $03,S : TAY
    INY
    CLC : ADC.W #$0004 : STA.B $03,S
    JMP Spawn_HDMAObject_to_Slot_X


;;; $8435: Spawn HDMA object ;;;
Spawn_HDMAObject:
;; Parameters:
;;     [[S] + 1] + 1: HDMA control
;;         v = ri000ttt
;;         r: Read data
;;         i: Indirect HDMA table
;;         t: Transfer type
;;             0: 8-bit
;;             1: 16-bit / two 8-bit units
;;             2: 16-bit for write-twice registers / two 8-bit units to same register
;;             3: Two 16-bit units for two write-twice registers
;;             4: Two 16-bit units / four 8-bit units
;;     [[S] + 1] + 2: HDMA target. Common targets:
;;         $0D: BG1 X scroll (16-bit, write-twice)
;;         $0E: BG1 Y scroll (16-bit, write-twice)
;;         $0F: BG2 X scroll (16-bit, write-twice)
;;         $10: BG2 Y scroll (16-bit, write-twice)
;;         $11: BG3 X scroll (16-bit, write-twice)
;;         $12: BG3 Y scroll (16-bit, write-twice)
;;         $26: Window 1 left position (8-bit)
;;         $27: Window 1 right position (8-bit)
;;         $28: Window 2 left position (8-bit)
;;         $29: Window 2 right position (8-bit)
;;         $32: Colour math subscreen backdrop colour (8-bit, sometimes used with write-twice)
;;     [[S] + 1] + 3: HDMA object instruction list pointer

;; Returns:
;;     Carry: Clear if HDMA object was spawned. Set if HDMA array full
;;     A: HDMA object index (80h if HDMA array full)
    PHP : PHB
    SEP #$20
    LDA.B $05,S : PHA : PLB
    XBA
    LDA.B #$00
    REP #$30
    STA.B DP_Temp18
    LDA.B $03,S : TAY
    INY
    CLC : ADC.W #$0004 : STA.B $03,S
    LDA.W #$0400 : STA.B DP_Temp12
    LDA.W #$0020 : STA.B DP_Temp14
    LDX.W #$0000

  .loop:
    LDA.W HDMAObject_ChannelBitflags,X : BEQ Spawn_HDMAObject_to_Slot_X
    ASL.B DP_Temp12 : BCS .returnFullArray
    LDA.B DP_Temp14 : CLC : ADC.W #$0010 : STA.B DP_Temp14
    INX #2 : CPX.W #$000C : BNE .loop

  .returnFullArray:
    PLB : PLP
    SEC
    RTL


;;; $8477: Spawn HDMA object to slot [X] (variable parameters) ;;;
Spawn_HDMAObject_to_Slot_X:
;; Parameters:
;;     X: HDMA object index
;;     Y: Return address + 1
;;     [Y] + 0: HDMA control
;;     [Y] + 1: HDMA target
;;     [Y] + 2: HDMA object instruction list pointer
;;     $13: HDMA object channel bitflag
;;     $14: HDMA object channel index
;;     $19: HDMA object bank
;; Returns:
;;     Carry: Clear
;;     A: HDMA object index

; Must have DB and P pushed
    LDA.W #.return : STA.W HDMAObject_PreInstructions,X
    LDA.W #$0088 : STA.W HDMAObject_PreInstructionBanks,X
    LDA.W $0002,Y : STA.W HDMAObject_InstListPointers,X
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X
    STZ.W HDMAObject_Timers,X : STZ.W HDMAObject_Var0,X
    STZ.W HDMAObject_Var1,X : STZ.W HDMAObject_Var2,X : STZ.W HDMAObject_Var3,X
    LDA.B DP_Temp12 : XBA : STA.W HDMAObject_ChannelBitflags,X
    LDA.B DP_Temp14 : ORA.B DP_Temp18 : STA.W HDMAObject_ChannelIndicesBanks,X
    PHX
    LDX.B DP_Temp14
    LDA.W $0000,Y : STA.W $4300,X
    PLA : PLB : PLP
    CLC

  .return:
    RTL


;;; $84B9: HDMA object handler (also handle music queue) ;;;
HDMAObjectHandler_HandleMusicQueue:
; Also spawns power bombs that were set as pending due to Samus dying(?) or auto reserve tanks activating
; Also calls the layer blending handler
; Seriously, why is the music queue handler called here... >_<;
    PHP : PHB
    REP #$30
    JSL HandleMusicQueue
    LDA.W TimeIsFrozenFlag : BNE +
    BIT.W PowerBombExplosionStatus : BVC +
    LDA.W #$8000 : STA.W PowerBombExplosionStatus
    JSL Spawn_HDMAObject
    db $40,$28
    dw InstList_PowerBombExplosion_Window2_LeftPosition
    JSL Spawn_HDMAObject
    db $40,$29
    dw InstList_PowerBombExplosion_Window2_RightPosition

+   PHK : PLB
    REP #$30
    LDA.W LayerBlending_DefaultConfig : STA.W LayerBlending_Config
    BIT.W HDMAObject_Enable : BPL .return
    SEP #$30
    LDX.B #$00 : STX.B DP_HDMAEnable : STX.W HDMAObject_Index+1

  .loop:
    STX.W HDMAObject_Index
    LDA.W HDMAObject_ChannelBitflags,X : BEQ .next
    ORA.B DP_HDMAEnable : STA.B DP_HDMAEnable
    JSR HDMAObject_Instruction_Handler
    LDX.W HDMAObject_Index

  .next:
    INX #2 : CPX.B #$0C : BNE .loop
    JSR LayerBlending_Handler
    PLB : PLP
    RTL

; Nothing points here, devs might have misplaced their destination label for the HDMA objects disabled branch ($84EE)
    STZ.B DP_HDMAEnable ; dead code

  .return:
    PLB : PLP
    RTL


;;; $851C: HDMA object instruction handler ;;;
HDMAObject_Instruction_Handler:
;; Parameter:
;;     X: HDMA object index

; Some instructions (e.g. sleep) pop the return address pushed to the stack by $854F to return out of *this* routine
; (marked "terminate processing HDMA object")
    REP #$20
    LDA.W HDMAObject_PreInstructions,X : STA.B DP_Temp12
    LDA.W HDMAObject_PreInstructionBanks,X : STA.B DP_Temp14
    PHK : PEA .manualReturn-1
    JML.W [DP_Temp12]

  .manualReturn:
    SEP #$10 : REP #$20
    LDX.W HDMAObject_Index
    DEC.W HDMAObject_InstructionTimers,X : BNE .return
    LDY.W HDMAObject_ChannelIndicesBanks+1,X : PHY
    PLB
    LDA.W HDMAObject_InstListPointers,X
    REP #$10
    TAY

  .loop:
    LDA.W $0000,Y : BPL .timer
    STA.B DP_Temp12
    INY #2
    PEA .loop-1
    JMP.W (DP_Temp12)

  .timer:
    STA.W HDMAObject_InstructionTimers,X
    TYA : CLC : ADC.W #$0004 : STA.W HDMAObject_InstListPointers,X
    LDA.W $0002,Y : STA.W HDMAObject_TablePointers,X

  .return:
    SEP #$30
    RTS


;;; $8569: Instruction - delete ;;;
Instruction_HDMAObject_Delete:
;; Parameter:
;;     X: HDMA object index
    STZ.W HDMAObject_ChannelBitflags,X
    PLA
    SEP #$30
    RTS


;;; $8570: Instruction - pre-instruction = [[Y]] ;;;
Instruction_HDMAObject_PreInstructionInY:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : STA.W HDMAObject_PreInstructions,X
    SEP #$20
    LDA.W $0002,Y : STA.W HDMAObject_PreInstructionBanks,X
    REP #$20
    INY #3
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8584: Unused. Instruction - clear pre-instruction ;;;
UNUSED_Instruction_HDMAObject_ClearPreInstruction_888584:
;; Parameters:
;;     X: HDMA object index
    LDA.W #.return : STA.W HDMAObject_PreInstructions,X

  .return:
    RTS


;;; $858B: Unused. Instruction - call function [[Y]] ;;;
UNUSED_Instruction_HDMAObject_CallFunctionY_88858B:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : STA.B DP_Temp12
    PHX : PHY
    PEA .return-1
    JMP.W (DP_Temp12)

  .return:
    PLY : PLX
    INY #2
    RTS


;;; $859D: Unused. Instruction - call function [[Y]] with A = [[Y] + 2] ;;;
UNUSED_Instruction_HDMAObject_CallFunctionYWithA_88859D:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : STA.B DP_Temp12
    LDA.W $0002,Y
    PHX : PHY
    PEA .return-1
    JMP.W (DP_Temp12)

  .return:
    PLY : PLX
    INY #4
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $85B4: Instruction - call external function [[Y]] ;;;
Instruction_HDMAObject_CallExternalFunctionInY:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : STA.B DP_Temp12
    LDA.W $0001,Y : STA.B DP_Temp13
    PHX : PHY
    JSL .externalFunction
    PLY : PLX
    INY #3
    RTS

  .externalFunction:
    JML.W [DP_Temp12]


if !FEATURE_KEEP_UNREFERENCED
;;; $85CD: Unused. Instruction - call external function [[Y]] with A = [[Y] + 3] ;;;
UNUSED_Instruction_HDMAObject_CallExternalFuncYWithA_8885CD:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : STA.B DP_Temp12
    LDA.W $0001,Y : STA.B DP_Temp13
    LDA.W $0003,Y
    PHX : PHY
    JSL .externalFunction
    PLY : PLX
    TYA : CLC : ADC.W #$0005 : TAY
    RTS

  .externalFunction:
    JML.W [DP_Temp12]
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $85EC: Instruction - go to [[Y]] ;;;
Instruction_HDMAObject_GotoY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : TAY
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $85F1: Unused. Instruction - go to [Y] + ±[[Y]] ;;;
UNUSED_Instruction_HDMAObject_GotoY_Y_8885F1:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    STY.B DP_Temp12
    DEY
    LDA.W $0000,Y : XBA : BMI .highByte
    AND.W #$00FF
    BRA +

  .highByte:
    ORA.W #$FF00

+   CLC : ADC.B DP_Temp12 : TAY
    RTS


;;; $8607: Unused. Instruction - decrement timer and go to [[Y]] if non-zero ;;;
UNUSED_Instruction_HDMAObject_DecTimer_GotoY_IfNonZero_888607:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    DEC.W HDMAObject_Timers,X : BNE Instruction_HDMAObject_GotoY
    INY #2
    RTS


;;; $860F: Unused. Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
UNUSED_Instruction_HDMAObject_DecTimer_GotoYIfNonZero_88860F:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    DEC.W HDMAObject_Timers,X : BNE UNUSED_Instruction_HDMAObject_GotoY_Y_8885F1
    INY
    RTS


;;; $8616: Unused. Instruction - timer = [[Y]] ;;;
UNUSED_Instruction_HDMAObject_TimerInY_888616:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    SEP #$20
    LDA.W $0000,Y : STA.W HDMAObject_Timers,X
    REP #$20
    INY
    RTS


;;; $8622: Unused. Instruction - HDMA control = [[Y]] ;;;
UNUSED_Instruction_HDMAObject_HDMAControlInY_888622:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHX
    LDA.W HDMAObject_ChannelIndicesBanks,X : AND.W #$00FF : TAX
    SEP #$20
    LDA.W $0000,Y : STA.W $4300,X
    REP #$20
    PLX
    INY
    RTS


;;; $8637: Unused. Instruction - HDMA target = [[Y]] ;;;
UNUSED_Instruction_HDMAObject_HDMATargetInY:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHX
    LDA.W HDMAObject_ChannelIndicesBanks,X : AND.W #$00FF : TAX
    SEP #$20
    LDA.W $0000,Y : STA.W $4301,X
    REP #$20
    PLX
    INY
    RTS


;;; $864C: Unused. Instruction - HDMA table pointer = [[Y]] ;;;
UNUSED_Instruction_HDMAObject_HDMATablePointerInY_88864C:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : STA.W HDMAObject_TablePointers,X
    INY #2
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8655: Instruction - HDMA table bank = [[Y]] ;;;
Instruction_HDMAObject_HDMATableBank:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHX
    LDA.W HDMAObject_ChannelIndicesBanks,X : AND.W #$00FF : TAX
    SEP #$20
    LDA.W $0000,Y : STA.W $4304,X
    REP #$20
    PLX
    INY
    RTS


;;; $866A: Instruction - indirect HDMA data bank = [[Y]] ;;;
Instruction_HDMAObject_IndirectHDMATableBank:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHX
    LDA.W HDMAObject_ChannelIndicesBanks,X : AND.W #$00FF : TAX
    SEP #$20
    LDA.W $0000,Y : STA.W $4307,X
    REP #$20
    PLX
    INY
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $867F: Unused. Instruction - skip next instruction ;;;
UNUSED_Instruction_HDMAObject_SkipNextInstruction_88867F:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to after this instruction
;; Returns:
;;     Y: Pointer to next instruction
    INY #2
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8682: Instruction - sleep ;;;
Instruction_HDMAObject_Sleep:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to after this instruction
    DEY #2
    TYA : STA.W HDMAObject_InstListPointers,X
    PLA
    SEP #$30
    RTS


;;; $868C: Raise/lower FX ;;;
RaiseOrLower_FX:
;; Returns:
;;     Carry: set if reached target position, clear otherwise
    LDA.W FX_TargetYPosition : BMI .returnCarrySet
    STZ.B DP_Temp16 : STZ.B DP_Temp18
    LDA.W FX_YSubVelocity : BPL .lower
    DEC.B DP_Temp18
    STA.B DP_Temp17
    LDA.W FX_BaseYSubPosition : CLC : ADC.B DP_Temp16 : STA.W FX_BaseYSubPosition
    LDA.W FX_BaseYPosition : ADC.B DP_Temp18 : BPL +
    LDA.W #$0000

+   STA.W FX_BaseYPosition
    LDA.W FX_TargetYPosition : CMP.W FX_BaseYPosition : BCC .return
    STA.W FX_BaseYPosition
    STZ.W FX_BaseYSubPosition

  .return:
    RTS

  .lower:
    STA.B DP_Temp17
    LDA.W FX_BaseYSubPosition : CLC : ADC.B DP_Temp16 : STA.W FX_BaseYSubPosition
    LDA.W FX_BaseYPosition : ADC.B DP_Temp18 : BPL +
    LDA.W #$FFFF

+   STA.W FX_BaseYPosition
    LDA.W FX_TargetYPosition : CMP.W FX_BaseYPosition : BCS .returnCarryClear
    STA.W FX_BaseYPosition
    STZ.W FX_BaseYSubPosition
    SEC
    RTS

  .returnCarryClear:
    CLC
    RTS

  .returnCarrySet:
    SEC
    RTS


;;; $86EF: Pre-instruction - x-ray - main ;;;
PreInstruction_Xray_Main:
    PHP
    REP #$30
    LDX.W #$1000
    LDA.W FX_Type : CMP.W #$0024 : BEQ +
    LDX.W #$2000
    JSL CheckIfXrayShouldShowAnyBlocks
    BEQ +
    LDX.W #$4000
    LDA.W #$0027 : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.W #$0047 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.W #$0087 : STA.B DP_ColorMathSubScreenBackdropColor2

+   TXA : TSB.W LayerBlending_Config
    LDA.W Xray_State : ASL : TAX
    JSR.W (.pointers,X)
    PLP
    RTL

  .pointers:
    dw HandleXrayScope_State0_NoBeam
    dw HandleXrayScope_State1_BeamIsWidening
    dw HandleXrayScope_State2_FullBeam
    dw HandleXrayScope_State3_DeactivateBeam_RestoreBG2_FirstHalf
    dw HandleXrayScope_State4_DeactivateBeam_RestoreBG2_SecondHalf
    dw HandleXrayScope_State5_DeactivateBeam_Finish


;;; $8732: Handle x-ray scope - x-ray state = 0 (no beam) ;;;
HandleXrayScope_State0_NoBeam:
    PHP
    REP #$30
    LDA.B DP_Controller1Input : BIT.W DashBinding : BNE .calculateHDMATable
    LDA.W #$0003 : STA.W Xray_State
    BRA .return

  .calculateHDMATable:
    JSR Calculate_Xray_HDMADataTable
    LDA.W Xray_State : INC : STA.W Xray_State
    JSR RTS_888753

  .return:
    PLP
    RTS


;;; $8753: RTS ;;;
RTS_888753:
    RTS


;;; $8754: Handle x-ray scope - x-ray state = 1 (beam is widening) ;;;
HandleXrayScope_State1_BeamIsWidening:
    PHP
    REP #$30
    LDA.B DP_Controller1Input : BIT.W DashBinding : BNE +
    LDA.W #$0003 : STA.W Xray_State
    BRA .return

+   JSR RTS_888753
    REP #$20
    LDA.W Xray_AngularSubWidthDelta : CLC : ADC.W #$0800 : STA.W Xray_AngularSubWidthDelta
    LDA.W Xray_AngularWidthDelta : ADC.W #$0000 : STA.W Xray_AngularWidthDelta
    LDA.W Xray_AngularSubWidth : CLC : ADC.W Xray_AngularSubWidthDelta : STA.W Xray_AngularSubWidth
    LDA.W Xray_AngularWidth : ADC.W Xray_AngularWidthDelta : STA.W Xray_AngularWidth
    CMP.W #$000B : BMI .calculateHDMATable
    STZ.W Xray_AngularSubWidth
    LDA.W #$000A : STA.W Xray_AngularWidth
    LDA.W Xray_State : INC : STA.W Xray_State

  .calculateHDMATable:
    JSR Calculate_Xray_HDMADataTable

  .return:
    PLP
    RTS


;;; $87AB: Handle x-ray scope - x-ray state = 2 (full beam) ;;;
HandleXrayScope_State2_FullBeam:
    PHP
    REP #$30
    LDA.B DP_Controller1Input : BIT.W DashBinding : BEQ .state3
    JSR HandleMovingXray_UpDown
    JSR Calculate_Xray_HDMADataTable
    JSR RTS_888753
    PLP
    RTS

  .state3:
    INC.W Xray_State
    PLP
    RTS


;;; $87C5: Handle moving x-ray up/down ;;;
HandleMovingXray_UpDown:
    PHP
    REP #$30
    LDA.B DP_Controller1Input : BIT.W UpBinding : BNE .up
    BIT.W DownBinding : BNE .down
    BRA .return

  .up:
    JSR MoveXray_Up
    BRA .return

  .down:
    JSR MoveXray_Down

  .return:
    PLP
    RTS


;;; $87E0: Move x-ray up ;;;
MoveXray_Up:
    PHP
    REP #$30
    LDA.W Xray_Angle : CMP.W #$0080 : BPL .facingLeft
    SEC : SBC.W Xray_AngularWidth : BEQ .return
    BMI .setAngularWidth
    LDA.W Xray_Angle : SEC : SBC.W #$0001 : STA.W Xray_Angle
    SBC.W Xray_AngularWidth : BPL .return

  .setAngularWidth:
    LDA.W Xray_AngularWidth : STA.W Xray_Angle
    BRA .return

  .facingLeft:
    CLC : ADC.W Xray_AngularWidth : CMP.W #$0100 : BEQ .return
    BPL .max100
    LDA.W Xray_Angle : CLC : ADC.W #$0001 : STA.W Xray_Angle
    ADC.W Xray_AngularWidth : CMP.W #$0100 : BEQ .return
    BMI .return

  .max100:
    LDA.W #$0100 : SEC : SBC.W Xray_AngularWidth : STA.W Xray_Angle

  .return:
    PLP
    RTS


;;; $8835: Move x-ray down ;;;
MoveXray_Down:
    PHP
    REP #$30
    LDA.W Xray_Angle : CMP.W #$0080 : BPL .facingLeft
    CLC : ADC.W Xray_AngularWidth : CMP.W #$0080 : BEQ .return
    BPL .setAngularWidth
    LDA.W Xray_Angle : CLC : ADC.W #$0001 : STA.W Xray_Angle
    ADC.W Xray_AngularWidth : CMP.W #$0080 : BEQ .return
    BMI .return

  .setAngularWidth:
    LDA.W #$0080 : SEC : SBC.W Xray_AngularWidth : STA.W Xray_Angle
    BRA .return

  .facingLeft:
    SEC : SBC.W Xray_AngularWidth : CMP.W #$0080 : BEQ .return
    BMI +
    LDA.W Xray_Angle : SEC : SBC.W #$0001 : STA.W Xray_Angle
    SBC.W Xray_AngularWidth : CMP.W #$0080 : BEQ .return
    BPL .return

+   LDA.W #$0080 : CLC : ADC.W Xray_AngularWidth : STA.W Xray_Angle

  .return:
    PLP
    RTS


;;; $8896: Calculate x-ray HDMA data table ;;;
Calculate_Xray_HDMADataTable:
    PHP
    REP #$30
    LDA.W #XrayWindow2HDMADataTable>>8&$FF00 : STA.B DP_Temp01
    LDA.W #XrayWindow2HDMADataTable : STA.B DP_Temp00
    LDA.W Xray_Angle : STA.B DP_Temp12
    LDA.W Xray_AngularWidth : STA.B DP_Temp14
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W SamusXPosition : SEC : SBC.W Layer1XPosition
    CLC : ADC.W #$0003 : TAX
    BRA .checkMovement

  .facingLeft:
    LDA.W SamusXPosition : SEC : SBC.W Layer1XPosition : SBC.W #$0003 : TAX

  .checkMovement:
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0005 : BEQ .crouching
    LDA.W SamusYPosition : SEC : SBC.W Layer1YPosition : SBC.W #$0010 : TAY
    BRA .checkScreenPosition

  .crouching:
    LDA.W SamusYPosition : SEC : SBC.W Layer1YPosition : SBC.W #$000C : TAY

  .checkScreenPosition:
    CPX.W #$0000 : BMI .leftOfScreen
    CPX.W #$0100 : BMI .onScreen
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0008 : BEQ .offScreen
    BRA .onScreenFromOffScreen

  .leftOfScreen:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .offScreen
    BRA .onScreenFromOffScreen

  .onScreen:
    JSL Calc_Xray_HDMADataTable_OnScreen
    PLP
    RTS

  .onScreenFromOffScreen:
    JSL Calc_Xray_HDMADataTable_OffScreen
    PLP
    RTS

  .offScreen:
    LDX.W #$01FE
    LDA.W #$00FF

  .loop:
    STA.L XrayWindow2HDMADataTable,X
    DEX #2 : BPL .loop
    PLP
    RTS


;;; $8934: Handle x-ray scope - x-ray state = 3 (deactivate beam - restore BG2 - first half) ;;;
HandleXrayScope_State3_DeactivateBeam_RestoreBG2_FirstHalf:
    PHP
    REP #$30
    LDA.W #$0001 : STA.W Xray_IndirectHDMATable
    LDA.W #XrayWindow2HDMADataTable : STA.W Xray_IndirectHDMATable+1
    STZ.W Xray_IndirectHDMATable+3 : STZ.W Xray_IndirectHDMATable+4
    STZ.W Xray_IndirectHDMATable+6 : STZ.W Xray_IndirectHDMATable+8
    LDA.W #$00FF : STA.L XrayWindow2HDMADataTable
    LDX.W #$1000
    LDA.W FX_Type : CMP.W #$0024 : BEQ +
    LDX.W #$2000
    JSL CheckIfXrayShouldShowAnyBlocks
    BEQ +
    LDX.W #$4000

+   TXA : TSB.W LayerBlending_Config
    LDA.W #$0000 : STA.L Palettes
    LDX.W HDMAObject_Index
    LDA.W HDMAObject_Var0,X : STA.B DP_BG2XScroll
    LDA.W HDMAObject_Var1,X : STA.B DP_BG2YScroll
    SEP #$20
    LDA.W HDMAObject_Var2,X : STA.B DP_BG2TilemapAddrSize
    REP #$20
    LDX.W VRAMWriteStack : CPX.W #$00F0 : BPL .return
    LDA.W #$0800 : STA.B VRAMWrite.size,X
    LDA.W #XrayTilemaps_BackupBG2 : STA.B VRAMWrite.src,X
    LDA.W #XrayTilemaps_BackupBG2>>16 : STA.B VRAMWrite.src+2,X
    LDA.B DP_BG2TilemapAddrSize : AND.W #$00FC : XBA : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    INC.W Xray_State

  .return:
    PLP
    RTS


;;; $89BA: Handle x-ray scope - x-ray state = 4 (deactivate beam - restore BG2 - second half) ;;;
HandleXrayScope_State4_DeactivateBeam_RestoreBG2_SecondHalf:
    PHP
    REP #$30
    LDX.W #$1000
    LDA.W FX_Type : CMP.W #$0024 : BEQ +
    LDX.W #$2000
    JSL CheckIfXrayShouldShowAnyBlocks
    BEQ +
    LDX.W #$4000

+   TXA : TSB.W LayerBlending_Config
    LDX.W VRAMWriteStack : CPX.W #$00F0 : BPL .return
    LDA.W #$0800 : STA.B VRAMWrite.size,X
    LDA.W #XrayTilemaps_BackupBG2+$800 : STA.B VRAMWrite.src,X
    LDA.W #XrayTilemaps_BackupBG2>>16 : STA.B VRAMWrite.src+2,X
    LDA.B DP_BG2TilemapAddrSize : AND.W #$00FC : XBA
    CLC : ADC.W #$0400 : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    INC.W Xray_State

  .return:
    PLP
    RTS


;;; $8A08: Handle x-ray scope - x-ray state = 5 (deactivate beam - finish) ;;;
HandleXrayScope_State5_DeactivateBeam_Finish:
    PHP
    REP #$30
    LDX.W #$1000
    LDA.W FX_Type : CMP.W #$0024 : BEQ +
    LDX.W #$2000
    JSL CheckIfXrayShouldShowAnyBlocks
    BEQ +
    LDX.W #$4000

+   TXA : TSB.W LayerBlending_Config
    LDA.W TimeIsFrozenFlag : BNE .timeIsFrozen
    PLP
    RTS

  .timeIsFrozen:
    STZ.W TimeIsFrozenFlag : STZ.W Xray_State
    STZ.W Xray_AngularWidthDelta : STZ.W Xray_AngularSubWidthDelta
    STZ.W Xray_Angle : STZ.W Xray_AngularWidth : STZ.W Xray_AngularSubWidth
    LDA.W #$0001 : STA.W Xray_IndirectHDMATable
    LDA.W #XrayWindow2HDMADataTable : STA.W Xray_IndirectHDMATable+1
    STZ.W Xray_IndirectHDMATable+3 : STZ.W Xray_IndirectHDMATable+4
    STZ.W Xray_IndirectHDMATable+6 : STZ.W Xray_IndirectHDMATable+8
    JSL Set_NonXray_SamusPose
    LDX.W HDMAObject_Index
    STZ.W HDMAObject_ChannelBitflags,X
    LDA.W #$000A
    JSL QueueSound_Lib1_Max6
    SEP #$20
    LDA.W FX_Type : CMP.B #$24 : BEQ +
    LDA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor2
    LDA.B #$40 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$20 : STA.B DP_ColorMathSubScreenBackdropColor0

+   LDA.B #XrayWindow2HDMADataTable>>16 : STA.B DP_Temp02
    REP #$20
    LDA.W #XrayWindow2HDMADataTable : STA.B DP_Temp00
    LDY.W #$01FE
    LDA.W #$00FF

  .loop:
    STA.B [DP_Temp00],Y
    DEY #2 : BPL .loop
    LDA.W AutoCancelHUDItemIndex : BEQ .return
    STZ.W SelectedHUDItem : STZ.W AutoCancelHUDItemIndex

  .return:
    PLP
    RTS


;;; $8AA4: Spawn power bomb explosion ;;;
Spawn_PowerBombExplosion:
    LDA.W TimeIsFrozenFlag : BNE .pending
    LDA.W #$0001
    JSL QueueSound
    LDA.W #$8000 : STA.W PowerBombExplosionStatus
    JSL Spawn_HDMAObject
    db $40,$28
    dw InstList_PowerBombExplosion_Window2_LeftPosition
    JSL Spawn_HDMAObject
    db $40,$29
    dw InstList_PowerBombExplosion_Window2_RightPosition
    RTL

  .pending:
    LDA.W #$4000 : STA.W PowerBombExplosionStatus
    RTL


;;; $8ACE: Instruction list - power bomb explosion window 2 left position ;;;
InstList_PowerBombExplosion_Window2_LeftPosition:
    dw Instruction_HDMAObject_HDMATableBank : db $89
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl PowerBombExplosion_Setup1_PreExplosion_White
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_PowerBombExplosion_1_PreExplosion_White
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl PowerBombExplosion_Setup2_PreExplosion_Yellow
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_PowerBombExplosion_2_PreExplosion_Yellow
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl PowerBombExplosion_Setup3_Explosion_Yellow
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_PowerBombExplosion_3_Explosion_Yellow
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl PowerBombExplosion_Setup4_Explosion_White
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_PowerBombExplosion_4_Explosion_White
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_PowerBombExplosion_5_AfterGlow
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl PowerBombExplosion_ClearnUp_TryCrystalFlash
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_Delete


;;; $8B14: Power bomb explosion - stage 1 setup (pre-explosion - white) ;;;
PowerBombExplosion_Setup1_PreExplosion_White:
    SEP #$20
    LDA.B #$FF : STA.L OffScreenPowerBombExplosionWindow2LeftHDMADataTable
    LDA.B #$00 : STA.L OffScreenPowerBombExplosionWindow2RightHDMADataTable
    REP #$20
    LDA.W #$0400 : STA.W SamusProjectile_PowerBombPreExplosionFlashRadius
    LDA.L PowerBomb_PreExplosion_InitialRadiusSpeed : STA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed
    RTL


;;; $8B32: Power bomb explosion - stage 2 setup (pre-explosion - yellow) ;;;
PowerBombExplosion_Setup2_PreExplosion_Yellow:
    LDA.W #PowerBomb_PreExplosion_ShapeDefinitionTables_PreScaled : STA.W SamusProjectile_PreScaledPowerBombExplosionShapeDefPointer
    RTL


;;; $8B39: Power bomb explosion - stage 3 setup (explosion - yellow) ;;;
PowerBombExplosion_Setup3_Explosion_Yellow:
    LDA.W #$0400 : STA.W SamusProjectile_PowerBombExplosionRadius
    LDA.L PowerBombExplosion_InitialRadiusSpeed : STA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed
    RTL


;;; $8B47: Power bomb explosion - stage 4 setup (explosion - white) ;;;
PowerBombExplosion_Setup4_Explosion_White:
    LDA.W #PowerBomb_Explosion_ShapeDefinitionTiles_PreScaled : STA.W SamusProjectile_PreScaledPowerBombExplosionShapeDefPointer
    RTL


;;; $8B4E: Power bomb explosion - clean up and try crystal flash ;;;
PowerBombExplosion_ClearnUp_TryCrystalFlash:
;; Parameters:
;;     X: HDMA object index
    LDA.W SamusXPosition : CMP.W SamusProjectile_PowerBombExplosionXPosition : BNE .clearPBFlag
    LDA.W SamusYPosition : CMP.W SamusProjectile_PowerBombExplosionYPosition : BNE .clearPBFlag
    PHX
    JSL CrystalFlash
    PLX
    BCC .crystalFlashing

  .clearPBFlag:
    STZ.W SamusProjectile_PowerBombFlag

  .crystalFlashing:
    STZ.W PowerBombExplosionStatus
    STZ.W HDMAObject_ChannelBitflags,X : STZ.W HDMAObject_ChannelBitflags+2,X
    STZ.W SamusProjectile_PowerBombPreExplosionFlashRadius : STZ.W SamusProjectile_PowerBombExplosionRadius
    LDA.W #$001E
    JSL Run_Samus_Command
    RTL


;;; $8B80: Instruction list - power bomb explosion window 2 right position ;;;
InstList_PowerBombExplosion_Window2_RightPosition:
    dw Instruction_HDMAObject_HDMATableBank : db $89
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_PowerBombExplosion_SetLayerBlendingWindow2
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_Delete


;;; $8B8F: Pre-instruction - power bomb explosion - set layer blending window 2 configuration ;;;
PreInstruction_PowerBombExplosion_SetLayerBlendingWindow2:
; Used by InstList_PowerBombExplosion_Window2_RightPosition
    LDA.W #$8000 : TSB.W LayerBlending_Config
    RTL


;;; $8B96: Power bomb stage 5 HDMA object timer ;;;
PowerBomb_Stage5_HDMAObjectTimer:
    dw $0003


;;; $8B98: Pre-instruction - power bomb explosion - stage 5 - after-glow ;;;
PreInstruction_PowerBombExplosion_5_AfterGlow:
;; Parameters:
;;     X: HDMA object index
    LDA.W PowerBombExplosionStatus : BMI .exploding
    RTL

  .exploding:
    DEC.W HDMAObject_Timers,X : BPL .return
    SEP #$20
    DEC.W HDMAObject_Var3,X : BEQ .wake
    LDA.W DP_ColorMathSubScreenBackdropColor0 : AND.B #$1F : BEQ .green
    DEC : ORA.B #$20 : STA.W DP_ColorMathSubScreenBackdropColor0

  .green:
    LDA.W DP_ColorMathSubScreenBackdropColor1 : AND.B #$1F : BEQ .blue
    DEC : ORA.B #$40 : STA.W DP_ColorMathSubScreenBackdropColor1

  .blue:
    LDA.W DP_ColorMathSubScreenBackdropColor2 : AND.B #$1F : BEQ .setTimer
    DEC : ORA.B #$80 : STA.W DP_ColorMathSubScreenBackdropColor2

  .setTimer:
    LDA.L PowerBomb_Stage5_HDMAObjectTimer : STA.W HDMAObject_Timers,X
    REP #$20

  .return:
    RTL

  .wake:
    REP #$20
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X
    INC.W HDMAObject_InstListPointers,X : INC.W HDMAObject_InstListPointers,X
    RTL


;;; $8BEA: Calculate power bomb explosion HDMA data tables - pre-scaled - power bomb is left of screen ;;;
Calc_PowerBombExplo_HDMADataTables_PreScaled_LeftOfScreen:
;; Parameters:
;;     X: 0. Power bomb explosion HDMA data table index
;;     Y: Pre-scaled power bomb explosion shape definition pointer

; Called by:
;     $8EB2: Pre-instruction - power bomb explosion - stage 4 - explosion - white
;     $91A8: Pre-instruction - power bomb explosion - stage 2 - pre-explosion - yellow
    LDA.W SamusProjectile_PowerBombPositionOnScreen : CLC : ADC.W $0000,Y : BCS +
    LDA.B #$00 : STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    INC : STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    BRA .next

+   STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    LDA.B #$00 : STA.L PowerBombExplosionWindow2LeftHDMADataTable,X

  .next:
    INY
    INX : CPX.W #$00C0 : BNE Calc_PowerBombExplo_HDMADataTables_PreScaled_LeftOfScreen
    RTS


;;; $8C12: Calculate power bomb explosion HDMA data tables - pre-scaled - power bomb is on screen ;;;
Calculate_PowerBombExplo_HDMADataTables_PreScaled_OnScreen:
;; Parameters:
;;     X: 0. Power bomb explosion HDMA data table index
;;     Y: Pre-scaled power bomb explosion shape definition pointer

; Called by:
;     $8EB2: Pre-instruction - power bomb explosion - stage 4 - explosion - white
;     $91A8: Pre-instruction - power bomb explosion - stage 2 - pre-explosion - yellow
    LDA.W $0000,Y : BEQ .return
    CLC : ADC.W SamusProjectile_PowerBombPositionOnScreen : BCC +
    LDA.B #$FF

+   STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    LDA.W SamusProjectile_PowerBombPositionOnScreen : SEC : SBC.W $0000,Y : BCS .storeTable
    LDA.B #$00

  .storeTable:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    INY
    INX : CPX.W #$00C0 : BNE Calculate_PowerBombExplo_HDMADataTables_PreScaled_OnScreen

  .return:
    RTS


;;; $8C3A: Calculate power bomb explosion HDMA data tables - pre-scaled - power bomb is right of screen ;;;
Calc_PowerBombExplo_HDMADataTables_PreScaled_RightOfScreen:
;; Parameters:
;;     X: 0. Power bomb explosion HDMA data table index
;;     Y: Pre-scaled power bomb explosion shape definition pointer

; Called by:
;     $8EB2: Pre-instruction - power bomb explosion - stage 4 - explosion - white
;     $91A8: Pre-instruction - power bomb explosion - stage 2 - pre-explosion - yellow
    LDA.W SamusProjectile_PowerBombPositionOnScreen : SEC : SBC.W $0000,Y : BCC +
    LDA.B #$FF : STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    DEC : STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    BRA .next

+   STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    LDA.B #$FF : STA.L PowerBombExplosionWindow2RightHDMADataTable,X

  .next:
    INY
    INX : CPX.W #$00C0 : BNE Calc_PowerBombExplo_HDMADataTables_PreScaled_RightOfScreen
    RTS


;;; $8C62: Calculate power bomb explosion HDMA object table pointers ;;;
Calculate_PowerBombExplosion_HDMADataTablePointers:
;; Parameters:
;;     X: HDMA object index

; Called by:
;     $8DE9: Pre-instruction - power bomb explosion - stage 3 - explosion - yellow
;     $8EB2: Pre-instruction - power bomb explosion - stage 4 - explosion - white

; For on-screen power bomb explosions,
; the calculation 2FFh - [A] at $8C90 is equivalent to 1FFh + (Y position of screen on power bomb)
; (1FFh is enough space for a full screen of no-explosion, followed by a screen containing the upper half of the explosion,
; 2FFh is the table size)
    LDA.W PowerBombExplosionStatus : BMI .exploding
    RTL

  .exploding:
    LDA.W SamusProjectile_PowerBombExplosionXPosition : SEC : SBC.W Layer1XPosition
    CLC : ADC.W #$0100 : CMP.W #$0300 : BCC +
    BRA .offScreen

+   STA.W SamusProjectile_PowerBombPositionOnScreen
    LDA.W SamusProjectile_PowerBombExplosionYPosition : SEC : SBC.W Layer1YPosition
    CLC : ADC.W #$0100 : CMP.W #$0300 : BCC .onScreen

  .offScreen:
    LDA.W #$0000

  .onScreen:
    EOR.W #$03FF : SEC : SBC.W #$0100 : STA.W SamusProjectile_PowerBombExplosionHDMATableIndex
    LDA.W SamusProjectile_PowerBombExplosionRadius : AND.W #$FF00 : BNE +
    STZ.W SamusProjectile_PowerBombExplosionHDMATableIndex

+   LDA.W HDMAObject_ChannelIndicesBanks,X : AND.W #$00FF : TAY
    LDA.W SamusProjectile_PowerBombExplosionHDMATableIndex : ASL
    CLC : ADC.W SamusProjectile_PowerBombExplosionHDMATableIndex : STA.B DP_Temp16
    ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Left_200below : STA.W HDMAObject_TablePointers,X
    LDA.B DP_Temp16 : CLC : ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Right_200below : STA.W HDMAObject_TablePointers+2,X
    RTL


;;; $8CC6: Calculate power bomb explosion HDMA data tables - scaled - power bomb is left of screen ;;;
Calculate_PowerBombExplo_HDMADataTables_Scaled_LeftOfScreen:
;; Parameters:
;;     X: Power bomb (pre-)explosion Y radius in pixels / power bomb explosion HDMA data table end index
;;     Y: 60h. Unscaled power bomb explosion shape definition table index + 60h
;;     $4202: Power bomb (pre-)explosion X radius in pixels
;; Returns:
;;     X: Power bomb explosion HDMA data table index of last padding entry

; Called by:
;     $8DE9: Pre-instruction - power bomb explosion - stage 3 - explosion - yellow
;     $90DF: Pre-instruction - power bomb explosion - stage 1 - pre-explosion - white
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y : STA.W $4203
    NOP #3
    LDA.W $4217 : STA.B DP_Temp14
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y : STA.W $4203
    NOP
    LDA.W SamusProjectile_PowerBombPositionOnScreen : CLC : ADC.W $4217 : BCS .moveToHighByte
    LDA.B #$00 : XBA : LDA.B #$FF
    BRA .loopDataTable

  .moveToHighByte:
    XBA : LDA.B #$00

  .loopDataTable:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    XBA : STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    XBA
    CPX.B DP_Temp14 : BEQ .nextShapeDefinite
    DEX
    JMP .loopDataTable

  .nextShapeDefinite:
    INY : BPL Calculate_PowerBombExplo_HDMADataTables_Scaled_LeftOfScreen
    RTS


;;; $8D04: Calculate power bomb explosion HDMA data tables - scaled - power bomb is on screen ;;;
Calculate_PowerBombExplosion_HDMADataTables_Scaled_OnScreen:
;; Parameters:
;;     X: Power bomb (pre-)explosion Y radius in pixels / power bomb explosion HDMA data table end index
;;     Y: 60h. Unscaled power bomb explosion shape definition table index + 60h
;;     $4202: Power bomb (pre-)explosion X radius in pixels
;; Returns:
;;     X: Power bomb explosion HDMA data table index of last padding entry

; Called by:
;     $8DE9: Pre-instruction - power bomb explosion - stage 3 - explosion - yellow
;     $90DF: Pre-instruction - power bomb explosion - stage 1 - pre-explosion - white
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y : STA.W $4203
    NOP #3
    LDA.W $4217 : STA.B DP_Temp14
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y : STA.W $4203
    NOP
    LDA.W SamusProjectile_PowerBombPositionOnScreen : CLC : ADC.W $4217 : BCC .lowByte
    LDA.B #$FF

  .lowByte:
    XBA
    LDA.W SamusProjectile_PowerBombPositionOnScreen
    SEC : SBC.W $4217 : BCS .loopDataTable
    LDA.B #$00

  .loopDataTable:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    XBA : STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    XBA
    CPX.B DP_Temp14 : BEQ .next
    DEX
    JMP .loopDataTable

  .next:
    INY : BPL Calculate_PowerBombExplosion_HDMADataTables_Scaled_OnScreen
    RTS


;;; $8D46: Calculate power bomb explosion HDMA data tables - scaled - power bomb is right of screen ;;;
Calculate_PowerBombExplo_HDMADataTables_Scaled_RightOfScreen:
;; Parameters:
;;     X: Power bomb (pre-)explosion Y radius in pixels / power bomb explosion HDMA data table index of last entry
;;     Y: 60h. Unscaled power bomb explosion shape definition table index + 60h
;;     $4202: Power bomb (pre-)explosion X radius in pixels
;; Returns:
;;     X: Power bomb explosion HDMA data table index of last padding entry

; Called by:
;     $8DE9: Pre-instruction - power bomb explosion - stage 3 - explosion - yellow
;     $90DF: Pre-instruction - power bomb explosion - stage 1 - pre-explosion - white
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y : STA.W $4203
    NOP #3
    LDA.W $4217 : STA.B DP_Temp14
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y : STA.W $4203
    NOP
    LDA.W SamusProjectile_PowerBombPositionOnScreen : SEC : SBC.W $4217 : BCC .lessThan100
    LDA.B #$FF : XBA : LDA.B #$00
    BRA +

  .lessThan100:
    XBA : LDA.B #$FF

+   XBA

  .loopDataTable:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    XBA : STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    XBA
    CPX.B DP_Temp14 : BEQ .nextShapeDefinition
    DEX
    JMP .loopDataTable

  .nextShapeDefinition:
    INY : BPL Calculate_PowerBombExplo_HDMADataTables_Scaled_RightOfScreen
    RTS


;;; $8D85: Power bomb explosion colours ;;;
PowerBombExplosion_Colors:
; Indexed by [power bomb explosion radius] / 800h
; Red, green, blue. Range 0..1Fh
; Yellow section
  .red:
    db $0E
  .green:
    db     $0E
  .blue:
    db         $0A
    db $0F,$0F,$09
    db $10,$10,$08
    db $11,$11,$07
    db $12,$12,$06
    db $13,$13,$05
    db $14,$14,$04
    db $15,$15,$03
    db $16,$16,$02
    db $17,$17,$01
    db $18,$18,$00
    db $19,$19,$00
    db $1A,$1A,$00
    db $1A,$1A,$00
; White section
    db $1A,$1A,$1A
    db $1A,$1A,$1A
    db $1B,$1B,$1B
    db $1B,$1B,$1B
    db $1C,$1C,$1C
    db $1B,$1B,$1B
    db $1A,$1A,$1A
    db $1A,$18,$18
    db $1A,$17,$17
    db $19,$16,$16
    db $18,$15,$15
    db $17,$15,$15
    db $16,$14,$14
    db $15,$13,$13
    db $12,$10,$10
    db $12,$0E,$0E
    db $12,$0D,$0D
    db $12,$0D,$0D


;;; $8DE5: Power bomb explosion initial radius speed ;;;
PowerBombExplosion_InitialRadiusSpeed:
    dw $0000


;;; $8DE7: Power bomb explosion radius acceleration ;;;
PowerBombExplosion_RadiusAcceleration:
    dw $0030


;;; $8DE9: Pre-instruction - power bomb explosion - stage 3 - explosion - yellow ;;;
PreInstruction_PowerBombExplosion_3_Explosion_Yellow:
;; Parameters:
;;     X: HDMA object index
    LDA.W PowerBombExplosionStatus : BMI .exploding
    RTL

  .exploding:
    PHP : PHB
    REP #$30
    PHX : PHY
    JSL Calculate_PowerBombExplosion_HDMADataTablePointers
    PEA PowerBombExplosion_Colors>>8&$FF00 : PLB : PLB
    SEP #$30
    LDA.B #$00 : XBA
    LDY.B #$60
    LDA.W SamusProjectile_PowerBombExplosionRadius+1 : STA.W $4202
    LDA.W PowerBombExplosion_ShapeDefinitionTable_Unscaled_topOffset : STA.W $4203
    NOP #3
    LDA.W $4217 : STA.B DP_Temp12
    TAX
    PEA .loopPadDataTableBegin-1
    LDA.W SamusProjectile_PowerBombPositionOnScreen+1 : AND.B #$FF : BEQ .offScreenLeft
    DEC : BEQ .onScreen
    JMP Calculate_PowerBombExplo_HDMADataTables_Scaled_RightOfScreen

  .onScreen:
    JMP Calculate_PowerBombExplosion_HDMADataTables_Scaled_OnScreen

  .offScreenLeft:
    JMP Calculate_PowerBombExplo_HDMADataTables_Scaled_LeftOfScreen

  .loopPadDataTableBegin:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    XBA : STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    XBA
    DEX : BPL .loopPadDataTableBegin
    LDX.B DP_Temp12 : INX : CPX.B #$C0 : BEQ .finishedTable
    LDA.B #$FF

  .loopPadDataTableEnd:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    INC : STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    DEC
    INX : CPX.B #$C0 : BNE .loopPadDataTableEnd

  .finishedTable:
    LDA.W SamusProjectile_PowerBombExplosionRadius+1 : LSR #3 : AND.B #$1F : STA.B DP_Temp12
    ASL : CLC : ADC.B DP_Temp12 : TAX
    LDA.L PowerBombExplosion_Colors_red,X : ORA.B #$20 : STA.W DP_ColorMathSubScreenBackdropColor0
    LDA.L PowerBombExplosion_Colors_green,X : ORA.B #$40 : STA.W DP_ColorMathSubScreenBackdropColor1
    LDA.L PowerBombExplosion_Colors_blue,X : ORA.B #$80 : STA.W DP_ColorMathSubScreenBackdropColor2
    REP #$30
    PLY : PLX
    LDA.W SamusProjectile_PowerBombExplosionRadius : CLC : ADC.W SamusProjectile_PowerBombPreExplosionRadiusSpeed : STA.W SamusProjectile_PowerBombExplosionRadius
    CMP.W #$8600 : BCC .lessThan8600
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X
    INC.W HDMAObject_InstListPointers,X : INC.W HDMAObject_InstListPointers,X
    STZ.W HDMAObject_Timers,X
    JMP .return

  .lessThan8600:
    LDA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed : CLC : ADC.L PowerBombExplosion_RadiusAcceleration : STA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed

  .return:
    PLB : PLP
    RTL


;;; $8EB2: Pre-instruction - power bomb explosion - stage 4 - explosion - white ;;;
PreInstruction_PowerBombExplosion_4_Explosion_White:
;; Parameters:
;;     X: HDMA object index
    LDA.W PowerBombExplosionStatus : BMI .exploding
    RTL

  .exploding:
    PHP : PHB
    REP #$30
    PHX : PHY
    JSL Calculate_PowerBombExplosion_HDMADataTablePointers
    PEA PowerBombExplosion_Colors>>8&$FF00 : PLB : PLB
    LDY.W SamusProjectile_PreScaledPowerBombExplosionShapeDefPointer
    LDX.W #$0000
    SEP #$20
    PEA .manualReturn-1
    LDA.W SamusProjectile_PowerBombPositionOnScreen+1 : AND.B #$FF : BEQ .offScreenLeft
    DEC : BEQ .onScreen
    JMP Calc_PowerBombExplo_HDMADataTables_PreScaled_RightOfScreen

  .onScreen:
    JMP Calculate_PowerBombExplo_HDMADataTables_PreScaled_OnScreen

  .offScreenLeft:
    JMP Calc_PowerBombExplo_HDMADataTables_PreScaled_LeftOfScreen

  .manualReturn:
    SEP #$30
    LDA.B #$00 : XBA
    LDA.W SamusProjectile_PowerBombExplosionRadius+1 : LSR #3 : AND.B #$1F : STA.B DP_Temp12
    ASL : CLC : ADC.B DP_Temp12 : TAX
    LDA.L PowerBombExplosion_Colors_red,X : ORA.B #$20 : STA.W DP_ColorMathSubScreenBackdropColor0
    LDA.L PowerBombExplosion_Colors_green,X : ORA.B #$40 : STA.W DP_ColorMathSubScreenBackdropColor1
    LDA.L PowerBombExplosion_Colors_blue,X : ORA.B #$80 : STA.W DP_ColorMathSubScreenBackdropColor2
    REP #$30
    PLY : PLX
    LDA.W SamusProjectile_PreScaledPowerBombExplosionShapeDefPointer : CLC : ADC.W #$00C0 : STA.W SamusProjectile_PreScaledPowerBombExplosionShapeDefPointer
    CMP.W #PowerBomb_PreExplosion_ShapeDefinitionTables_PreScaled : BNE .notPreExplosion
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X
    INC.W HDMAObject_InstListPointers,X : INC.W HDMAObject_InstListPointers,X
    STZ.W HDMAObject_Timers,X
    LDA.W #$0020 : STA.W HDMAObject_Var3,X

  .notPreExplosion:
    LDA.W SamusProjectile_PowerBombExplosionRadius : CLC : ADC.W SamusProjectile_PowerBombPreExplosionRadiusSpeed : BCS .return
    STA.W SamusProjectile_PowerBombExplosionRadius
    LDA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed : CLC : ADC.L PowerBombExplosion_RadiusAcceleration : STA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed

  .return:
    PLB
    PLP
    RTL


;;; $8F56: Calculate power bomb pre-explosion HDMA object table pointers ;;;
Calculate_PowerBombPreExplosion_HDMAObjectTablePointers:
;; Parameters:
;;     X: HDMA object index

; Called by:
;     $90DF: Pre-instruction - power bomb explosion - stage 1 - pre-explosion - white
;     $91A8: Pre-instruction - power bomb explosion - stage 2 - pre-explosion - yellow

; For on-screen power bomb explosions,
; the calculation 2FFh - [A] at $8C90 is equivalent to 1FFh + (Y position of screen on power bomb)
; (1FFh is enough space for a full screen of no-explosion, followed by a screen containing the upper half of the explosion,
; 2FFh is the table size)
    LDA.W PowerBombExplosionStatus : BMI .exploding
    RTL

  .exploding:
    LDA.W SamusProjectile_PowerBombExplosionXPosition : SEC : SBC.W Layer1XPosition
    CLC : ADC.W #$0100 : CMP.W #$0300 : BCC +
    BRA .offScreen

+   STA.W SamusProjectile_PowerBombPositionOnScreen
    LDA.W SamusProjectile_PowerBombExplosionYPosition : SEC : SBC.W Layer1YPosition
    CLC : ADC.W #$0100 : CMP.W #$0300 : BCC .onScreen

  .offScreen:
    LDA.W #$0000

  .onScreen:
    EOR.W #$03FF : SEC : SBC.W #$0100 : STA.W SamusProjectile_PowerBombExplosionHDMATableIndex
    LDA.W SamusProjectile_PowerBombPreExplosionFlashRadius : AND.W #$FF00 : BNE +
    STZ.W SamusProjectile_PowerBombExplosionHDMATableIndex

+   LDA.W HDMAObject_ChannelIndicesBanks,X : AND.W #$00FF : TAY
    LDA.W SamusProjectile_PowerBombExplosionHDMATableIndex : ASL : CLC : ADC.W SamusProjectile_PowerBombExplosionHDMATableIndex : STA.B DP_Temp16
    ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Left_200below : STA.W HDMAObject_TablePointers,X
    LDA.B DP_Temp16 : CLC : ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Right_200below : STA.W HDMAObject_TablePointers+2,X
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $8FBA: Unused. Calculate power bomb related HDMA data tables - scaled - power bomb is left of screen ;;;
UNUSED_CalcPowerBombRelatedHDMATables_Scaled_Left_888FBA:
; Clone of Calculate_PowerBombExplo_HDMADataTables_Scaled_LeftOfScreen
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y : STA.W $4203
    NOP #3
    LDA.W $4217 : STA.B DP_Temp14
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y : STA.W $4203
    NOP
    LDA.W SamusProjectile_PowerBombPositionOnScreen : CLC : ADC.W $4217 : BCS +
    LDA.B #$00 : XBA : LDA.B #$FF
    BRA .loop

+   XBA : LDA.B #$00

  .loop:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    XBA : STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    XBA
    CPX.B DP_Temp14 : BEQ .next
    DEX
    JMP .loop

  .next:
    INY : BPL UNUSED_CalcPowerBombRelatedHDMATables_Scaled_Left_888FBA
    RTS


;;; $8FF8: Unused. Calculate power bomb related HDMA data tables - scaled - power bomb is on screen ;;;
UNUSED_CalcPBRelatedHDMADataTables_Scaled_OnScreen_888FF8:
; Clone of Calculate_PowerBombExplosion_HDMADataTables_Scaled_OnScreen
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y : STA.W $4203
    NOP #3
    LDA.W $4217 : STA.B DP_Temp14
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y : STA.W $4203
    NOP
    LDA.W SamusProjectile_PowerBombPositionOnScreen : CLC : ADC.W $4217 : BCC +
    LDA.B #$FF

+   XBA
    LDA.W SamusProjectile_PowerBombPositionOnScreen : SEC : SBC.W $4217 : BCS .loop
    LDA.B #$00

  .loop:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    XBA : STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    XBA
    CPX.B DP_Temp14 : BEQ .next
    DEX
    JMP .loop

  .next:
    INY : BPL UNUSED_CalcPBRelatedHDMADataTables_Scaled_OnScreen_888FF8
    RTS


;;; $903A: Unused. Calculate power bomb related HDMA data tables - scaled - power bomb is right of screen ;;;
UNUSED_CalPBRelatedHDMADataTables_Scaled_OnScreen_88903A:
; Clone of Calculate_PowerBombExplo_HDMADataTables_Scaled_RightOfScreen
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y : STA.W $4203
    NOP #3
    LDA.W $4217 : STA.B DP_Temp14
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y : STA.W $4203
    NOP
    LDA.W SamusProjectile_PowerBombPositionOnScreen : SEC : SBC.W $4217 : BCC .lowByteFF
    LDA.B #$FF : XBA : LDA.B #$00
    BRA +

  .lowByteFF:
    XBA : LDA.B #$FF

+   XBA

  .loop:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    XBA : STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    XBA
    CPX.B DP_Temp14 : BEQ .next
    DEX
    JMP .loop

  .next:
    INY : BPL UNUSED_CalPBRelatedHDMADataTables_Scaled_OnScreen_88903A
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9079: Power bomb pre-explosion colours ;;;
PowerBomb_PreExplosion_Colors:
; Indexed by [power bomb pre-explosion radius] / 800h
; Red, green, blue. Range 0..1Fh
; White section
  .red:
    db $10
  .green:
    db $10
  .blue:
    db $10
    db $04,$04,$04
    db $06,$06,$06
    db $08,$08,$08
    db $0A,$0A,$0A
    db $0C,$0C,$0C
    db $0E,$0E,$0A
; Yellow section
    db $10,$10,$08
    db $12,$12,$08
    db $14,$14,$08
    db $16,$16,$08
    db $18,$18,$08
    db $1A,$1A,$0A
    db $18,$18,$08
    db $16,$16,$06
    db $14,$14,$04


if !FEATURE_KEEP_UNREFERENCED
;;; $90A9: Unused. Power bomb explosion related colours ;;;
UNUSED_PowerBomb_ExplosionRelated_Colors_8890A9:
; These might have been used for the after-glow in earlier development
    db $13,$13,$0F
    db $11,$11,$0E
    db $0F,$0F,$0D
    db $0D,$0D,$0C
    db $0B,$0B,$0B
    db $0A,$0A,$0A
    db $09,$09,$09
    db $08,$08,$08
    db $07,$07,$07
    db $06,$06,$06
    db $05,$05,$05
    db $04,$04,$04
    db $03,$03,$03
    db $02,$02,$02
    db $01,$01,$01
    db $00,$00,$00


;;; $90D9: Unused ;;;
UNUSED_PowerBombColors_8890D9:
; There's no (non-pre) explosion parallel to this constant (as there is for initial speed and acceleration),
; so I can't even speculate what this might have been for
    dw $0001
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $90DB: Power bomb pre-explosion initial radius speed ;;;
PowerBomb_PreExplosion_InitialRadiusSpeed:
    dw $3000


;;; $90DD: Power bomb pre-explosion radius acceleration ;;;
PowerBomb_PreExplosion_RadiusAcceleration:
    dw $0080


;;; $90DF: Pre-instruction - power bomb explosion - stage 1 - pre-explosion - white ;;;
PreInstruction_PowerBombExplosion_1_PreExplosion_White:
;; Parameters:
;;     X: HDMA object index
    LDA.W PowerBombExplosionStatus : BMI .exploding
    RTL

  .exploding:
    PHP : PHB
    REP #$30
    PHX : PHY
    JSL Calculate_PowerBombPreExplosion_HDMAObjectTablePointers
    PEA PowerBomb_PreExplosion_Colors>>8&$FF00 : PLB : PLB
    SEP #$30
    LDA.B #$00 : XBA : LDY.B #$60
    LDA.W SamusProjectile_PowerBombPreExplosionFlashRadius+1 : STA.W $4202
    LDA.W PowerBombExplosion_ShapeDefinitionTable_Unscaled_topOffset : STA.W $4203
    NOP #3
    LDA.W $4217 : STA.B DP_Temp12
    TAX
    PEA .loopPadDataTableBegin-1
    LDA.W SamusProjectile_PowerBombPositionOnScreen+1 : AND.B #$FF : BEQ .offScreenLeft
    DEC : BEQ .onScreen
    JMP Calculate_PowerBombExplo_HDMADataTables_Scaled_RightOfScreen

  .onScreen:
    JMP Calculate_PowerBombExplosion_HDMADataTables_Scaled_OnScreen

  .offScreenLeft:
    JMP Calculate_PowerBombExplo_HDMADataTables_Scaled_LeftOfScreen

  .loopPadDataTableBegin:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    XBA : STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    XBA
    DEX : BPL .loopPadDataTableBegin
    LDX.B DP_Temp12 : INX : CPX.B #$C0 : BEQ .finishedTable
    LDA.B #$FF

  .loopPadDataTableEnd:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    INC : STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    DEC
    INX : CPX.B #$C0 : BNE .loopPadDataTableEnd

  .finishedTable:
    LDA.W SamusProjectile_PowerBombPreExplosionFlashRadius+1 : LSR #3 : AND.B #$0F : STA.B DP_Temp12
    ASL : CLC : ADC.B DP_Temp12 : TAX
    LDA.L PowerBomb_PreExplosion_Colors_red,X : ORA.B #$20 : STA.W DP_ColorMathSubScreenBackdropColor0
    LDA.L PowerBomb_PreExplosion_Colors_green,X : ORA.B #$40 : STA.W DP_ColorMathSubScreenBackdropColor1
    LDA.L PowerBomb_PreExplosion_Colors_blue,X : ORA.B #$80 : STA.W DP_ColorMathSubScreenBackdropColor2
    REP #$30
    PLY : PLX
    LDA.W SamusProjectile_PowerBombPreExplosionFlashRadius : CLC : ADC.W SamusProjectile_PowerBombPreExplosionRadiusSpeed : STA.W SamusProjectile_PowerBombPreExplosionFlashRadius
    CMP.W #$9200 : BCC .lessThan9200 ; radius
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X
    INC.W HDMAObject_InstListPointers,X : INC.W HDMAObject_InstListPointers,X
    STZ.W HDMAObject_Timers,X
    JMP .return

  .lessThan9200:
    LDA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed : SEC : SBC.L PowerBomb_PreExplosion_RadiusAcceleration : STA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed

  .return:
    PLB : PLP
    RTL


;;; $91A8: Pre-instruction - power bomb explosion - stage 2 - pre-explosion - yellow ;;;
PreInstruction_PowerBombExplosion_2_PreExplosion_Yellow:
;; Parameters:
;;     X: HDMA object index
    LDA.W PowerBombExplosionStatus : BMI .exploding
    RTL

  .exploding:
    PHP : PHB
    REP #$30
    PHX : PHY
    JSL Calculate_PowerBombPreExplosion_HDMAObjectTablePointers
    PEA PowerBomb_PreExplosion_Colors>>8&$FF00 : PLB : PLB
    LDY.W SamusProjectile_PreScaledPowerBombExplosionShapeDefPointer
    LDX.W #$0000
    SEP #$20
    PEA .manualReturn-1
    LDA.W SamusProjectile_PowerBombPositionOnScreen+1 : AND.B #$FF : BEQ .offScreenLeft
    DEC : BEQ .onScreen
    JMP Calc_PowerBombExplo_HDMADataTables_PreScaled_RightOfScreen

  .onScreen:
    JMP Calculate_PowerBombExplo_HDMADataTables_PreScaled_OnScreen

  .offScreenLeft:
    JMP Calc_PowerBombExplo_HDMADataTables_PreScaled_LeftOfScreen

  .manualReturn:
    SEP #$30
    LDA.B #$00 : XBA
    LDA.W SamusProjectile_PowerBombPreExplosionFlashRadius+1 : LSR #3 : AND.B #$0F : STA.B DP_Temp12
    ASL : CLC : ADC.B DP_Temp12 : TAX
    LDA.L PowerBomb_PreExplosion_Colors_red,X : ORA.B #$20 : STA.W DP_ColorMathSubScreenBackdropColor0
    LDA.L PowerBomb_PreExplosion_Colors_green,X : ORA.B #$40 : STA.W DP_ColorMathSubScreenBackdropColor1
    LDA.L PowerBomb_PreExplosion_Colors_blue,X : ORA.B #$80 : STA.W DP_ColorMathSubScreenBackdropColor2
    REP #$30
    PLY : PLX
    LDA.W SamusProjectile_PreScaledPowerBombExplosionShapeDefPointer : CLC : ADC.W #$00C0 : STA.W SamusProjectile_PreScaledPowerBombExplosionShapeDefPointer
    CMP.W #PowerBomb_ShapeDefinitionTiles_Optimization_A206 : BNE .notA206
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X
    INC.W HDMAObject_InstListPointers,X : INC.W HDMAObject_InstListPointers,X
    STZ.W HDMAObject_Timers,X

  .notA206:
    LDA.W SamusProjectile_PowerBombPreExplosionFlashRadius : CLC : ADC.W SamusProjectile_PowerBombPreExplosionRadiusSpeed : BCS .return
    STA.W SamusProjectile_PowerBombPreExplosionFlashRadius
    LDA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed : SEC : SBC.L PowerBomb_PreExplosion_RadiusAcceleration : STA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed

  .return:
    PLB : PLP
    RTL


;;; $9246: Power bomb explosion shape definitions tables - pre-scaled ;;;
PowerBomb_Explosion_ShapeDefinitionTiles_PreScaled:
; Defines the shape of (the bottom) half of a power bomb explosion
; Each byte defines the width of the power bomb explosion for that pixel-row, C0h pixel-rows total
; One line per frame of explosion
    db $7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7E,$7E,$7E
    db $7E,$7D,$7D,$7D,$7D,$7D,$7C,$7C,$7B,$7B,$7B,$7A,$7A,$7A,$79,$79
    db $78,$78,$77,$77,$76,$76,$75,$75,$74,$74,$73,$72,$71,$71,$70,$6F
    db $6E,$6E,$6D,$6C,$6B,$6A,$69,$69,$68,$67,$66,$65,$63,$62,$61,$60
    db $5F,$5E,$5D,$5C,$5A,$59,$57,$56,$54,$53,$51,$4F,$4E,$4C,$4A,$49
    db $47,$45,$43,$40,$3E,$3B,$39,$36,$33,$30,$2C,$28,$25,$1F,$1A,$12
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $86,$86,$86,$86,$86,$86,$86,$86,$86,$85,$85,$85,$85,$85,$85,$85
    db $84,$84,$84,$84,$84,$83,$83,$83,$82,$82,$82,$81,$81,$81,$80,$80
    db $80,$7F,$7F,$7E,$7E,$7D,$7C,$7C,$7B,$7B,$7A,$7A,$79,$78,$77,$77
    db $76,$76,$75,$74,$73,$72,$71,$70,$6F,$6F,$6E,$6D,$6C,$6B,$6A,$68
    db $67,$66,$65,$64,$63,$62,$61,$5F,$5E,$5D,$5B,$5A,$58,$56,$55,$53
    db $52,$50,$4E,$4C,$4A,$48,$46,$45,$42,$40,$3D,$3B,$37,$34,$31,$2D
    db $29,$27,$21,$1B,$13,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $8D,$8D,$8D,$8D,$8D,$8D,$8D,$8D,$8D,$8D,$8C,$8C,$8C,$8C,$8C,$8C
    db $8C,$8B,$8B,$8B,$8B,$8B,$8A,$8A,$8A,$89,$89,$89,$89,$88,$87,$87
    db $87,$86,$86,$85,$85,$84,$84,$84,$83,$82,$82,$81,$80,$80,$80,$7F
    db $7E,$7D,$7C,$7C,$7B,$7A,$7A,$78,$78,$77,$76,$75,$75,$74,$73,$72
    db $71,$70,$6F,$6D,$6C,$6B,$6A,$69,$68,$67,$66,$64,$62,$62,$60,$5E
    db $5D,$5A,$5A,$58,$57,$54,$52,$51,$4F,$4D,$4A,$48,$47,$44,$42,$3F
    db $3C,$3A,$36,$33,$2F,$2B,$29,$22,$1D,$14,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $95,$95,$95,$95,$95,$95,$95,$95,$95,$95,$94,$94,$94,$94,$94,$94
    db $94,$93,$93,$93,$93,$93,$93,$92,$92,$91,$91,$91,$90,$90,$90,$90
    db $8F,$8E,$8E,$8E,$8D,$8D,$8D,$8C,$8C,$8B,$8A,$8A,$89,$89,$88,$87
    db $87,$86,$86,$85,$85,$83,$83,$82,$81,$80,$80,$7F,$7E,$7D,$7C,$7B
    db $7B,$7A,$79,$78,$76,$76,$74,$73,$72,$71,$70,$6F,$6E,$6C,$6B,$6A
    db $68,$67,$66,$65,$63,$61,$60,$5E,$5C,$5B,$59,$57,$55,$53,$51,$4F
    db $4E,$4B,$48,$47,$43,$41,$3E,$3C,$38,$34,$32,$2D,$28,$22,$1F,$15
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $9C,$9C,$9C,$9C,$9C,$9C,$9C,$9C,$9C,$9C,$9C,$9B,$9B,$9B,$9B,$9B
    db $9B,$9B,$9A,$9A,$9A,$99,$99,$99,$99,$99,$98,$98,$98,$97,$97,$97
    db $96,$96,$95,$95,$95,$95,$94,$93,$93,$92,$92,$91,$91,$90,$90,$8F
    db $8E,$8E,$8E,$8D,$8D,$8B,$8B,$8A,$89,$89,$88,$87,$86,$85,$85,$84
    db $83,$82,$81,$80,$80,$7E,$7D,$7D,$7B,$7A,$79,$78,$77,$76,$75,$73
    db $72,$71,$70,$6F,$6D,$6C,$6A,$6A,$67,$66,$64,$63,$60,$60,$5D,$5C
    db $5A,$57,$57,$54,$52,$50,$4D,$4C,$48,$46,$44,$41,$3C,$3A,$36,$34
    db $2F,$2A,$26,$20,$16,$0F,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A3,$A3,$A3,$A3,$A3
    db $A3,$A3,$A3,$A2,$A2,$A2,$A1,$A1,$A1,$A1,$A1,$A1,$A0,$A0,$9F,$9F
    db $9F,$9E,$9E,$9D,$9D,$9D,$9D,$9C,$9B,$9B,$9A,$9A,$9A,$99,$98,$98
    db $97,$96,$96,$95,$95,$94,$94,$93,$92,$92,$91,$91,$8F,$8F,$8E,$8D
    db $8C,$8B,$8B,$8A,$89,$87,$87,$86,$86,$84,$84,$82,$82,$80,$7E,$7E
    db $7D,$7C,$7B,$79,$78,$77,$76,$75,$73,$72,$70,$6F,$6E,$6C,$6B,$69
    db $68,$65,$63,$62,$60,$5E,$5C,$5B,$58,$57,$54,$51,$4F,$4C,$4A,$48
    db $46,$42,$3F,$3B,$39,$34,$2F,$2C,$26,$22,$17,$10,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AB,$AB,$AB,$AB
    db $AB,$AA,$AA,$AA,$AA,$AA,$AA,$A9,$A9,$A9,$A8,$A8,$A8,$A8,$A8,$A7
    db $A6,$A6,$A6,$A6,$A5,$A5,$A4,$A4,$A4,$A4,$A3,$A2,$A2,$A1,$A1,$A0
    db $A0,$A0,$9F,$9E,$9E,$9D,$9C,$9C,$9C,$9B,$9A,$99,$99,$98,$98,$96
    db $96,$95,$94,$93,$92,$91,$91,$8F,$8F,$8E,$8D,$8D,$8B,$8B,$89,$89
    db $87,$86,$85,$84,$83,$82,$81,$7F,$7E,$7D,$7C,$7A,$78,$78,$76,$75
    db $73,$72,$70,$6E,$6E,$6B,$6A,$68,$67,$64,$63,$60,$5F,$5D,$5B,$58
    db $56,$53,$52,$4E,$4D,$49,$47,$42,$40,$3C,$3A,$34,$32,$2E,$27,$23
    db $19,$11,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B3,$B3,$B3
    db $B3,$B2,$B2,$B2,$B2,$B2,$B2,$B2,$B1,$B1,$B1,$B0,$B0,$B0,$B0,$B0
    db $AF,$AF,$AE,$AE,$AE,$AD,$AD,$AC,$AC,$AC,$AB,$AB,$AB,$AA,$A9,$A8
    db $A8,$A8,$A8,$A7,$A6,$A6,$A5,$A5,$A4,$A4,$A3,$A2,$A2,$A1,$A0,$9F
    db $9F,$9F,$9D,$9C,$9C,$9B,$9A,$99,$99,$98,$97,$95,$95,$95,$93,$93
    db $91,$90,$90,$8E,$8E,$8B,$8B,$89,$89,$88,$87,$85,$84,$83,$82,$80
    db $7F,$7D,$7D,$7B,$7A,$78,$76,$76,$73,$72,$70,$6F,$6D,$6A,$69,$67
    db $65,$64,$61,$5F,$5C,$5A,$59,$56,$54,$51,$4F,$4D,$48,$45,$41,$3E
    db $39,$37,$34,$2C,$29,$1F,$1A,$12,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BB,$BB,$BB
    db $BB,$BB,$BA,$BA,$BA,$BA,$BA,$BA,$BA,$B9,$B9,$B9,$B9,$B8,$B8,$B8
    db $B7,$B7,$B7,$B6,$B6,$B6,$B5,$B5,$B4,$B4,$B4,$B4,$B3,$B3,$B2,$B1
    db $B1,$B0,$B0,$AF,$AF,$AE,$AE,$AD,$AD,$AC,$AC,$AB,$AB,$AA,$A9,$A9
    db $A8,$A7,$A6,$A6,$A5,$A4,$A3,$A3,$A2,$A1,$A0,$A0,$9F,$9D,$9D,$9B
    db $9B,$9B,$99,$98,$98,$96,$95,$95,$92,$92,$91,$8F,$8F,$8E,$8D,$8B
    db $8A,$89,$88,$86,$85,$84,$82,$81,$80,$7E,$7C,$7C,$79,$78,$77,$74
    db $73,$70,$6F,$6E,$6B,$69,$68,$65,$63,$62,$5E,$5D,$5B,$57,$55,$52
    db $50,$4E,$49,$46,$44,$3F,$3B,$39,$32,$2E,$2B,$21,$1B,$13,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C4,$C4
    db $C4,$C4,$C4,$C3,$C3,$C3,$C3,$C2,$C2,$C2,$C2,$C2,$C2,$C2,$C1,$C1
    db $C1,$C0,$C0,$BF,$BF,$BF,$BF,$BF,$BE,$BD,$BD,$BC,$BC,$BC,$BB,$BB
    db $BB,$BA,$BA,$B9,$B8,$B8,$B8,$B7,$B7,$B6,$B5,$B4,$B4,$B4,$B3,$B3
    db $B2,$B1,$B1,$B0,$AF,$AE,$AE,$AE,$AC,$AB,$AA,$AA,$A9,$A8,$A7,$A7
    db $A6,$A5,$A3,$A3,$A3,$A2,$A0,$A0,$9F,$9D,$9D,$9C,$9B,$99,$98,$97
    db $96,$95,$94,$93,$91,$90,$8F,$8E,$8C,$8B,$89,$88,$87,$86,$84,$82
    db $81,$7E,$7E,$7D,$7A,$79,$77,$76,$73,$71,$70,$6D,$6B,$6A,$68,$65
    db $63,$62,$5E,$5C,$59,$58,$54,$51,$4F,$4A,$47,$44,$3E,$3C,$39,$35
    db $2D,$28,$22,$14,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CC,$CC
    db $CC,$CC,$CC,$CC,$CB,$CB,$CB,$CB,$CA,$CA,$CA,$C9,$C9,$C9,$C9,$C9
    db $C9,$C9,$C8,$C8,$C8,$C7,$C6,$C6,$C6,$C6,$C5,$C5,$C5,$C4,$C4,$C4
    db $C3,$C3,$C2,$C1,$C1,$C1,$C0,$C0,$BF,$BF,$BE,$BD,$BD,$BD,$BC,$BB
    db $BA,$BA,$B9,$B9,$B9,$B8,$B7,$B6,$B5,$B5,$B5,$B3,$B2,$B1,$B1,$B0
    db $AF,$AE,$AE,$AD,$AC,$AB,$AA,$A9,$A8,$A8,$A7,$A5,$A4,$A4,$A3,$A1
    db $A0,$9F,$9E,$9C,$9C,$9B,$9A,$99,$97,$96,$95,$94,$92,$91,$90,$8F
    db $8C,$8C,$8B,$89,$87,$86,$83,$83,$7F,$7F,$7E,$7C,$79,$77,$76,$75
    db $72,$6F,$6F,$6C,$69,$67,$66,$63,$5F,$5D,$5C,$5A,$57,$52,$4F,$4D
    db $4A,$45,$41,$3E,$3B,$32,$2F,$2A,$24,$14,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D5
    db $D5,$D5,$D5,$D5,$D5,$D4,$D4,$D4,$D4,$D3,$D3,$D3,$D2,$D2,$D2,$D2
    db $D1,$D1,$D1,$D1,$D1,$D1,$D0,$D0,$CF,$CF,$CF,$CE,$CE,$CD,$CD,$CC
    db $CC,$CC,$CC,$CC,$CB,$CA,$CA,$C9,$C8,$C8,$C7,$C7,$C7,$C7,$C6,$C5
    db $C4,$C4,$C3,$C2,$C2,$C2,$C1,$C1,$C0,$BF,$BE,$BD,$BC,$BC,$BC,$BA
    db $B9,$B9,$B8,$B7,$B6,$B6,$B5,$B4,$B3,$B2,$B1,$B1,$B0,$AF,$AE,$AD
    db $AC,$AB,$AA,$A9,$A7,$A6,$A5,$A4,$A3,$A2,$A1,$A0,$9E,$9D,$9D,$9B
    db $9A,$98,$98,$96,$94,$92,$92,$91,$8F,$8D,$8C,$89,$88,$88,$84,$83
    db $82,$80,$7E,$7D,$7A,$78,$77,$74,$73,$70,$6E,$6B,$6A,$68,$63,$61
    db $60,$5E,$5B,$56,$53,$50,$4E,$4A,$48,$41,$3E,$39,$34,$31,$25,$1F
    db $15,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DE
    db $DE,$DE,$DE,$DE,$DE,$DE,$DD,$DD,$DD,$DD,$DC,$DC,$DC,$DB,$DB,$DB
    db $DB,$DB,$DA,$DA,$DA,$D9,$D9,$D9,$D9,$D9,$D8,$D8,$D8,$D7,$D7,$D6
    db $D6,$D5,$D5,$D5,$D4,$D4,$D3,$D3,$D2,$D2,$D1,$D1,$D1,$D0,$D0,$CF
    db $CE,$CD,$CD,$CC,$CC,$CB,$CB,$CB,$CA,$C9,$C9,$C8,$C7,$C6,$C5,$C4
    db $C4,$C4,$C3,$C2,$C1,$C0,$BF,$BE,$BD,$BD,$BD,$BC,$BA,$B9,$B8,$B8
    db $B7,$B6,$B6,$B4,$B3,$B2,$B1,$B0,$AF,$AE,$AC,$AB,$AA,$A9,$A8,$A8
    db $A7,$A4,$A3,$A2,$A1,$A1,$9F,$9E,$9B,$9A,$99,$98,$97,$95,$93,$92
    db $8F,$8E,$8D,$8B,$8A,$89,$85,$84,$82,$80,$7F,$7D,$7C,$78,$76,$75
    db $72,$70,$6F,$6C,$68,$65,$64,$62,$5F,$5C,$5A,$54,$51,$4D,$4B,$46
    db $44,$40,$37,$33,$2E,$27,$20,$16,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8
    db $E7,$E7,$E7,$E7,$E7,$E7,$E6,$E6,$E6,$E6,$E6,$E5,$E5,$E5,$E5,$E4
    db $E4,$E4,$E4,$E3,$E3,$E3,$E3,$E2,$E2,$E1,$E1,$E0,$E0,$E0,$E0,$DF
    db $DF,$DE,$DE,$DE,$DE,$DE,$DD,$DD,$DC,$DC,$DB,$DB,$DA,$D9,$D9,$D8
    db $D8,$D7,$D7,$D6,$D5,$D5,$D4,$D4,$D3,$D3,$D3,$D2,$D1,$D1,$D0,$CF
    db $CE,$CE,$CC,$CC,$CB,$CA,$CA,$C9,$C9,$C8,$C7,$C6,$C5,$C4,$C3,$C2
    db $C1,$C0,$C0,$C0,$BF,$BE,$BC,$BB,$BA,$B9,$B8,$B7,$B6,$B5,$B4,$B3
    db $B1,$B0,$AF,$AE,$AD,$AC,$AB,$AA,$A9,$A8,$A5,$A4,$A2,$A2,$A1,$9F
    db $9E,$9D,$9B,$99,$97,$95,$94,$93,$90,$8F,$8E,$8D,$8B,$89,$85,$84
    db $82,$81,$7E,$7D,$7A,$79,$77,$74,$70,$6F,$6C,$69,$68,$65,$63,$60
    db $5D,$5A,$57,$51,$4E,$49,$46,$43,$3E,$39,$35,$30,$28,$17,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2
    db $F2,$F1,$F1,$F1,$F1,$F1,$F1,$F0,$F0,$F0,$F0,$F0,$EF,$EF,$EF,$EF
    db $EE,$EE,$EE,$EE,$EE,$ED,$ED,$ED,$EC,$EC,$EC,$EB,$EB,$EA,$EA,$EA
    db $EA,$E9,$E9,$E8,$E8,$E7,$E7,$E7,$E7,$E6,$E5,$E5,$E4,$E4,$E3,$E2
    db $E2,$E2,$E1,$E1,$E0,$E0,$E0,$DF,$DF,$DE,$DE,$DC,$DC,$DC,$DB,$DA
    db $DA,$D9,$D8,$D7,$D7,$D6,$D5,$D5,$D4,$D3,$D2,$D1,$D1,$D0,$CE,$CD
    db $CD,$CD,$CC,$CB,$CA,$C9,$C8,$C8,$C7,$C6,$C5,$C4,$C3,$C2,$C1,$C0
    db $BF,$BC,$BB,$BA,$BA,$B9,$B8,$B7,$B6,$B5,$B3,$B2,$B1,$B0,$AF,$AE
    db $AC,$AB,$A9,$A8,$A6,$A5,$A4,$A2,$A0,$9F,$9E,$9B,$9A,$99,$96,$95
    db $95,$93,$91,$8F,$8D,$8B,$87,$86,$83,$82,$80,$7F,$7C,$79,$78,$75
    db $73,$70,$6E,$6D,$6A,$67,$64,$61,$5D,$58,$54,$51,$4C,$4A,$46,$41
    db $3B,$38,$32,$2A,$23,$18,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB
    db $FB,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$F9,$F9,$F9,$F9,$F9,$F8,$F8,$F8
    db $F8,$F7,$F7,$F7,$F7,$F7,$F6,$F6,$F6,$F6,$F5,$F5,$F5,$F4,$F4,$F3
    db $F3,$F3,$F3,$F2,$F2,$F1,$F1,$F0,$F0,$F0,$F0,$EF,$EF,$EE,$EE,$ED
    db $EC,$EB,$EB,$EB,$EA,$EA,$E9,$E9,$E8,$E7,$E7,$E6,$E6,$E5,$E4,$E4
    db $E4,$E3,$E2,$E2,$E1,$E0,$DF,$DF,$DE,$DD,$DD,$DC,$DB,$DA,$D9,$D9
    db $D8,$D7,$D6,$D5,$D5,$D4,$D3,$D2,$D1,$D0,$CF,$CF,$CE,$CD,$CC,$CB
    db $CA,$C9,$C8,$C7,$C6,$C5,$C3,$C2,$C1,$C0,$BF,$BE,$BD,$BD,$BC,$B9
    db $B8,$B7,$B6,$B5,$B3,$B2,$B0,$AF,$AE,$AC,$AB,$AA,$A8,$A6,$A5,$A4
    db $A1,$A0,$9F,$9C,$9B,$9A,$98,$96,$94,$92,$90,$8F,$8C,$8B,$88,$87
    db $84,$83,$80,$7E,$7D,$7A,$78,$75,$72,$71,$6E,$6B,$68,$65,$61,$5E
    db $5B,$57,$54,$4F,$4C,$48,$43,$3E,$3A,$34,$2C,$24,$19,$00,$00,$00
    db $FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE
    db $FE,$FD,$FD,$FD,$FD,$FD,$FD,$FD,$FC,$FC,$FC,$FC,$FC,$FB,$FB,$FB
    db $FB,$FA,$FA,$FA,$FA,$FA,$F9,$F9,$F9,$F9,$F8,$F8,$F8,$F7,$F7,$F6
    db $F6,$F6,$F6,$F5,$F5,$F4,$F4,$F3,$F3,$F3,$F3,$F2,$F2,$F1,$F1,$F0
    db $F0,$EF,$EE,$EE,$EE,$ED,$ED,$EC,$EC,$EB,$EA,$EA,$E9,$E9,$E8,$E7
    db $E7,$E7,$E6,$E5,$E5,$E4,$E3,$E2,$E2,$E1,$E0,$E0,$DF,$DE,$DD,$DC
    db $DC,$DB,$DA,$D9,$D8,$D8,$D7,$D6,$D5,$D4,$D3,$D2,$D2,$D1,$D0,$CF
    db $CE,$CD,$CC,$CB,$CA,$C9,$C8,$C6,$C5,$C4,$C3,$C2,$C1,$C0,$BF,$BE
    db $BC,$BB,$BA,$B9,$B8,$B7,$B5,$B4,$B2,$B1,$B0,$AE,$AD,$AC,$AA,$A8
    db $A7,$A6,$A3,$A2,$A1,$9E,$9D,$9C,$9A,$98,$96,$94,$92,$91,$8E,$8D
    db $8A,$89,$86,$85,$82,$7F,$7E,$7B,$79,$76,$73,$72,$6F,$6C,$69,$66
    db $62,$5F,$5C,$58,$55,$50,$4D,$49,$44,$3E,$3A,$34,$2C,$24,$19,$00


;;; $9F06: Power bomb pre-explosion shape definition tables - pre-scaled ;;;
PowerBomb_PreExplosion_ShapeDefinitionTables_PreScaled:
; Defines the shape of (the bottom) half of a power bomb explosion
; Each byte defines the width of the power bomb explosion for that pixel-row, C0h pixel-rows total
; One line per frame of explosion
    db $91,$91,$91,$91,$91,$91,$91,$91,$91,$91,$90,$90,$90,$90,$90,$90
    db $90,$8F,$8F,$8F,$8F,$8F,$8E,$8E,$8E,$8E,$8D,$8C,$8C,$8C,$8C,$8B
    db $8B,$8B,$8A,$8A,$89,$89,$88,$88,$87,$87,$86,$86,$85,$84,$84,$83
    db $83,$82,$81,$80,$80,$7F,$7E,$7E,$7C,$7C,$7B,$7A,$79,$78,$78,$77
    db $76,$75,$74,$73,$71,$70,$6F,$6E,$6D,$6C,$6B,$6A,$68,$67,$66,$64
    db $63,$61,$60,$5F,$5C,$5A,$5A,$58,$56,$53,$53,$50,$4E,$4C,$4A,$48
    db $45,$42,$41,$3E,$3A,$36,$35,$31,$2C,$27,$23,$1E,$15,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$BF,$BF,$BF
    db $BF,$BF,$BF,$BE,$BE,$BE,$BD,$BD,$BD,$BD,$BD,$BD,$BD,$BC,$BC,$BC
    db $BB,$BB,$BA,$BA,$BA,$BA,$BA,$B9,$B8,$B8,$B7,$B7,$B7,$B7,$B6,$B6
    db $B5,$B5,$B4,$B4,$B4,$B3,$B2,$B2,$B1,$B1,$B0,$AF,$AE,$AE,$AE,$AD
    db $AD,$AB,$AB,$AB,$A9,$A9,$A8,$A7,$A6,$A6,$A5,$A4,$A3,$A2,$A2,$A1
    db $9F,$9F,$9F,$9D,$9C,$9C,$9A,$99,$99,$97,$96,$95,$93,$93,$92,$90
    db $8F,$8E,$8D,$8C,$8B,$8A,$88,$86,$86,$83,$83,$82,$7F,$7E,$7D,$7A
    db $7A,$77,$76,$74,$73,$70,$6E,$6E,$6B,$68,$68,$65,$62,$60,$5D,$5B
    db $59,$56,$54,$52,$4D,$4A,$48,$43,$40,$3D,$37,$34,$2F,$27,$21,$1B
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE
    db $ED,$ED,$ED,$ED,$ED,$ED,$ED,$EC,$EC,$EC,$EC,$EC,$EB,$EB,$EB,$EA
    db $EA,$EA,$EA,$EA,$E9,$E9,$E9,$E9,$E8,$E8,$E8,$E7,$E6,$E6,$E6,$E6
    db $E5,$E5,$E4,$E4,$E3,$E3,$E3,$E3,$E2,$E1,$E1,$E0,$E0,$E0,$DF,$DF
    db $DF,$DE,$DE,$DD,$DD,$DC,$DB,$DA,$DA,$D9,$D8,$D8,$D8,$D7,$D6,$D6
    db $D5,$D4,$D3,$D3,$D2,$D2,$D1,$D0,$CF,$CE,$CE,$CD,$CC,$CB,$CA,$CA
    db $C9,$C8,$C7,$C5,$C4,$C4,$C4,$C3,$C2,$C1,$C0,$BF,$BE,$BD,$BC,$BB
    db $B9,$B7,$B6,$B6,$B5,$B4,$B3,$B2,$B0,$AF,$AE,$AD,$AC,$AB,$A9,$A7
    db $A6,$A5,$A3,$A2,$A1,$9F,$9D,$9C,$9B,$99,$98,$97,$94,$92,$90,$8E
    db $8C,$8B,$89,$88,$85,$84,$81,$80,$7E,$7D,$7A,$76,$73,$71,$6F,$6C
    db $6B,$68,$65,$62,$60,$5C,$59,$56,$53,$4B,$48,$45,$40,$3A,$37,$31
    db $2A,$22,$18,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE
    db $FE,$FD,$FD,$FD,$FD,$FD,$FD,$FD,$FC,$FC,$FC,$FC,$FC,$FB,$FB,$FB
    db $FB,$FA,$FA,$FA,$FA,$FA,$F9,$F9,$F9,$F9,$F8,$F8,$F8,$F7,$F7,$F6
    db $F6,$F6,$F6,$F5,$F5,$F4,$F4,$F3,$F3,$F3,$F3,$F2,$F2,$F1,$F1,$F0
    db $F0,$EF,$EE,$EE,$EE,$ED,$ED,$EC,$EC,$EB,$EA,$EA,$E9,$E9,$E8,$E7
    db $E7,$E7,$E6,$E5,$E5,$E4,$E3,$E2,$E2,$E1,$E0,$E0,$DF,$DE,$DD,$DC
    db $DC,$DB,$DA,$D9,$D8,$D8,$D7,$D6,$D5,$D4,$D3,$D2,$D2,$D1,$D0,$CF
    db $CE,$CD,$CC,$CB,$CA,$C9,$C8,$C6,$C5,$C4,$C3,$C2,$C1,$C0,$BF,$BE
    db $BC,$BB,$BA,$B9,$B8,$B7,$B5,$B4,$B2,$B1,$B0,$AE,$AD,$AC,$AA,$A8
    db $A7,$A6,$A3,$A2,$A1,$9E,$9D,$9C,$9A,$98,$96,$94,$92,$91,$8E,$8D
    db $8A,$89,$86,$85,$82,$7F,$7E,$7B,$79,$76,$73,$72,$6F,$6C,$69,$66
    db $62,$5F,$5C,$58,$55,$50,$4D,$49,$44,$3E,$3A,$34,$2C,$24,$19,$00


;;; $A206: Free space ;;;
PowerBomb_ShapeDefinitionTiles_Optimization_A206:
; PJ believes this padding exists purely because of the "optimisation" done in the
; "calculate power bomb explosion HDMA data tables - stage 1/3" routines ($8CC6/$8D04/$8D46)
; where Y starts at 60h so that it can be checked against 80h via inspecting the negative flag.
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

PowerBomb_ShapeDefinitionTiles_Optimization_A226:
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF


;;; $A266: Power bomb explosion shape definition table - unscaled ;;;
PowerBombExplosion_ShapeDefinitionTable_Unscaled_width:
; This table gives the shape of (the bottom) half of a power bomb explosion with X radius = 100h (Y radius C0h),
; starting from the bottom and ending at the center
; Width
    db $00,$0C,$19,$25,$31,$3E,$4A,$56,$61,$6D,$78,$83,$8E,$98,$A2,$AB
    db $B5,$BD,$C5,$CD,$D4,$DB,$E1,$E7,$EC,$F1,$F4,$F8,$FB,$FD,$FE,$FF

PowerBombExplosion_ShapeDefinitionTable_Unscaled_topOffset:
; Top offset (previous entry used as bottom offset)
    db $BF,$BF,$BE,$BD,$BA,$B8,$B6,$B2,$AF,$AB,$A6,$A2,$9C,$96,$90,$8A
    db $84,$7D,$75,$6E,$66,$5E,$56,$4D,$45,$3C,$33,$2A,$20,$17,$0D,$04


;;; $A2A6: Spawn crystal flash HDMA objects ;;;
Spawn_CrystalFlash_HDMAObjects:
; These HDMAs aren't really needed
    LDA.W #$8000 : STA.W PowerBombExplosionStatus
    JSL Spawn_HDMAObject
    db $40,$28
    dw InstList_CrystalFlash_Window2_LeftPosition
    JSL Spawn_HDMAObject
    db $40,$29
    dw InstList_CrystalFlash_Window2_RightPosition
    RTL


;;; $A2BD: Instruction list - crystal flash window 2 left position ;;;
InstList_CrystalFlash_Window2_LeftPosition:
    dw Instruction_HDMAObject_HDMATableBank : db $89
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl CrystalFlash_Setup_1
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl CrystalFlash_Setup_2
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_CrystalFlash_1_Explosion
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_CrystalFlash_2_AfterGlow
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl CrystalFlash_Cleanup
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_Delete


;;; $A2E4: Crystal flash - setup (1/2) ;;;
CrystalFlash_Setup_1:
    SEP #$20
    LDA.B #$FF : STA.L OffScreenPowerBombExplosionWindow2LeftHDMADataTable
    LDA.B #$00 : STA.L OffScreenPowerBombExplosionWindow2RightHDMADataTable
    REP #$20
    LDA.W #$0400 : STA.W SamusProjectile_PowerBombPreExplosionFlashRadius
    LDA.L PowerBomb_PreExplosion_InitialRadiusSpeed : STA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed
    LDA.W #$0001
    JSL QueueSound_Lib1_Max6
    RTL


;;; $A309: Crystal flash - setup (2/2) ;;;
CrystalFlash_Setup_2:
    LDA.W #$0400 : STA.W SamusProjectile_PowerBombExplosionRadius
    LDA.L PowerBombExplosion_InitialRadiusSpeed : STA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed
    RTL


;;; $A317: Crystal flash - clean up ;;;
CrystalFlash_Cleanup:
;; Parameters:
;;     X: HDMA object index
    STZ.W SamusProjectile_PowerBombFlag : STZ.W PowerBombExplosionStatus
    STZ.W HDMAObject_ChannelBitflags,X : STZ.W HDMAObject_ChannelBitflags+2,X
    STZ.W SamusProjectile_PowerBombPreExplosionFlashRadius : STZ.W SamusProjectile_PowerBombExplosionRadius
    RTL


;;; $A32A: Instruction list - crystal flash window 2 right position ;;;
InstList_CrystalFlash_Window2_RightPosition:
    dw Instruction_HDMAObject_HDMATableBank : db $89
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_CrystalFlash_CustomLayerBlendingWindow2Config
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_Delete


;;; $A339: Pre-instruction - crystal flash - custom layer blending window 2 configuration ;;;
PreInstruction_CrystalFlash_CustomLayerBlendingWindow2Config:
; Setting these variables doesn't achieve anything, as the layer blending is handled entirely by a subsystem using LayerBlending_Config/87
    SEP #$20
    STZ.W DP_WindowMaskBG12
    LDA.B #$08 : STA.W DP_WindowMaskBG34
    LDA.B #$80 : STA.W DP_WindowMaskSprite
    LDA.B #$02 : STA.W DP_NextGameplayColorMathA
    LDA.B #$33 : STA.W DP_NextGameplayColorMathB
    STZ.W DP_WindowAreaMainScreen
    LDA.B #$04 : STA.W DP_WindowAreaSubScreen
    REP #$20
    RTL


;;; $A35D: Pre-instruction - crystal flash - stage 2 - after-glow ;;;
PreInstruction_CrystalFlash_2_AfterGlow:
;; Parameters:
;;     X: HDMA object index

; The same as power bomb explosion stage 5 ($8B98) except for using colour components as a wake criterion ($A36A..76) instead of HDMAObject_Var3
; This is actually a bug, as the colour components are always non-zero in rooms that use a backdrop colour (FX 28h/2Ah), meaning this object never dies
; If you lay a power bomb afterwards, this does override the backdrop colour to zero and causes this object to clean itself up,
; but that screws up the power bomb due to the global power bomb state (see $A317)
    LDA.W PowerBombExplosionStatus : BMI .exploding
    RTL

  .exploding:
    DEC.W HDMAObject_Timers,X : BPL .return
    SEP #$20
    LDA.W DP_ColorMathSubScreenBackdropColor0 : ORA.W DP_ColorMathSubScreenBackdropColor1 : ORA.W DP_ColorMathSubScreenBackdropColor2 : AND.B #$1F : BEQ .wake
    LDA.W DP_ColorMathSubScreenBackdropColor0 : AND.B #$1F : BEQ .green
    DEC : ORA.B #$20 : STA.W DP_ColorMathSubScreenBackdropColor0

  .green:
    LDA.W DP_ColorMathSubScreenBackdropColor1 : AND.B #$1F : BEQ .blue
    DEC : ORA.B #$40 : STA.W DP_ColorMathSubScreenBackdropColor1

  .blue:
    LDA.W DP_ColorMathSubScreenBackdropColor2 : AND.B #$1F : BEQ .setTimer
    DEC : ORA.B #$80 : STA.W DP_ColorMathSubScreenBackdropColor2

  .setTimer:
    LDA.L PowerBomb_Stage5_HDMAObjectTimer : STA.W HDMAObject_Timers,X
    REP #$20

  .return:
    RTL

  .wake:
    REP #$20
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X
    INC.W HDMAObject_InstListPointers,X : INC.W HDMAObject_InstListPointers,X
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $A3B7: Unused. Calculate crystal flash HDMA data tables - pre-scaled - power bomb is left of screen ;;;
UNUSED_CalcCrystalFlashHDMADataTables_PreScaled_Left_88A3B7:
; Clone of Calc_PowerBombExplo_HDMADataTables_PreScaled_LeftOfScreen
    LDA.W SamusProjectile_PowerBombPositionOnScreen : CLC : ADC.W $0000,Y : BCS +
    LDA.B #$00 : STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    INC : STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    BRA .loop

+   STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    LDA.B #$00 : STA.L PowerBombExplosionWindow2LeftHDMADataTable,X

  .loop:
    INY
    INX : CPX.W #$00C0 : BNE UNUSED_CalcCrystalFlashHDMADataTables_PreScaled_Left_88A3B7
    RTS


;;; $A3DF: Unused. Calculate crystal flash HDMA data tables - pre-scaled - power bomb is on screen ;;;
UNUSED_Calc_CF_HDMADataTables_PreScaled_OnScreen_88A3DF:
; Clone of Calculate_PowerBombExplo_HDMADataTables_PreScaled_OnScreen
    LDA.W $0000,Y : BEQ .return
    CLC : ADC.W SamusProjectile_PowerBombPositionOnScreen : BCC +
    LDA.B #$FF

+   STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    LDA.W SamusProjectile_PowerBombPositionOnScreen : SEC : SBC.W $0000,Y : BCS +
    LDA.B #$00

+   STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    INY
    INX : CPX.W #$00C0 : BNE UNUSED_Calc_CF_HDMADataTables_PreScaled_OnScreen_88A3DF

  .return:
    RTS


;;; $A407: Unused. Calculate crystal flash HDMA data tables - pre-scaled - power bomb is right of screen ;;;
UNUSED_Calc_CF_HDMADataTables_PreScaled_RightOfScreen_88A407:
; Clone of Calc_PowerBombExplo_HDMADataTables_PreScaled_RightOfScreen
    LDA.W SamusProjectile_PowerBombPositionOnScreen : SEC : SBC.W $0000,Y : BCC +
    LDA.B #$FF : STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    DEC : STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    BRA .next

+   STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    LDA.B #$FF : STA.L PowerBombExplosionWindow2RightHDMADataTable,X

  .next:
    INY
    INX : CPX.W #$00C0 : BNE UNUSED_Calc_CF_HDMADataTables_PreScaled_RightOfScreen_88A407
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A42F: Calculate crystal flash HDMA object table pointers ;;;
Calculate_CrystalFlash_HDMAObjectTablePointers:
; Clone of Calculate_PowerBombExplosion_HDMADataTablePointers
    LDA.W PowerBombExplosionStatus : BMI .exploding
    RTL

  .exploding:
    LDA.W SamusProjectile_PowerBombExplosionXPosition : SEC : SBC.W Layer1XPosition
    CLC : ADC.W #$0100 : CMP.W #$0300 : BCC +
    BRA .offScreen

+   STA.W SamusProjectile_PowerBombPositionOnScreen
    LDA.W SamusProjectile_PowerBombExplosionYPosition : SEC : SBC.W Layer1YPosition
    CLC : ADC.W #$0100 : CMP.W #$0300 : BCC .onScreen

  .offScreen:
    LDA.W #$0000

  .onScreen:
    EOR.W #$03FF : SEC : SBC.W #$0100 : STA.W SamusProjectile_PowerBombExplosionHDMATableIndex
    LDA.W SamusProjectile_PowerBombExplosionRadius : AND.W #$FF00 : BNE +
    STZ.W SamusProjectile_PowerBombExplosionHDMATableIndex

+   LDA.W HDMAObject_ChannelIndicesBanks,X : AND.W #$00FF : TAY
    LDA.W SamusProjectile_PowerBombExplosionHDMATableIndex : ASL : CLC : ADC.W SamusProjectile_PowerBombExplosionHDMATableIndex : STA.B DP_Temp16
    ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Left_200below : STA.W HDMAObject_TablePointers,X
    LDA.B DP_Temp16 : CLC : ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Right_200below : STA.W HDMAObject_TablePointers+2,X
    RTL


;;; $A493: Calculate crystal flash HDMA data tables - scaled - power bomb is left of screen ;;;
Calculate_CrystalFlash_HDMADataTables_Scaled_LeftOfScreen:
; Clone of Calculate_PowerBombExplo_HDMADataTables_Scaled_LeftOfScreen
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y : STA.W $4203
    NOP #3
    LDA.W $4217 : STA.B DP_Temp14
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y : STA.W $4203
    NOP
    LDA.W SamusProjectile_PowerBombPositionOnScreen : CLC : ADC.W $4217 : BCS .lowByteZero
    LDA.B #$00 : XBA : LDA.B #$FF
    BRA .loop

  .lowByteZero:
    XBA : LDA.B #$00

  .loop:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    XBA : STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    XBA
    CPX.B DP_Temp14 : BEQ .next
    DEX
    JMP .loop

  .next:
    INY : BPL Calculate_CrystalFlash_HDMADataTables_Scaled_LeftOfScreen
    RTS


;;; $A4D1: Calculate crystal flash HDMA data tables - scaled - power bomb is on screen ;;;
Calculate_CrystalFlash_HDMADataTables_Scaled_OnScreen:
; Clone of Calculate_PowerBombExplosion_HDMADataTables_Scaled_OnScreen
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y : STA.W $4203
    NOP #3
    LDA.W $4217 : STA.B DP_Temp14
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y : STA.W $4203
    NOP
    LDA.W SamusProjectile_PowerBombPositionOnScreen : CLC : ADC.W $4217 : BCC +
    LDA.B #$FF

+   XBA
    LDA.W SamusProjectile_PowerBombPositionOnScreen : SEC : SBC.W $4217 : BCS .loop
    LDA.B #$00

  .loop:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    XBA : STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    XBA
    CPX.B DP_Temp14 : BEQ .next
    DEX
    JMP .loop

  .next:
    INY : BPL Calculate_CrystalFlash_HDMADataTables_Scaled_OnScreen
    RTS


;;; $A513: Calculate crystal flash HDMA data tables - scaled - power bomb is right of screen ;;;
Calculate_CrystalFlash_HDMADataTables_Scaled_RightOfScreen:
; Clone of Calculate_PowerBombExplo_HDMADataTables_Scaled_RightOfScreen
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y : STA.W $4203
    NOP #3
    LDA.W $4217 : STA.B DP_Temp14
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y : STA.W $4203
    NOP
    LDA.W SamusProjectile_PowerBombPositionOnScreen : SEC : SBC.W $4217 : BCC .lowByteFF
    LDA.B #$FF : XBA : LDA.B #$00
    BRA +

  .lowByteFF:
    XBA
    LDA.B #$FF

+   XBA

  .loop:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    XBA : STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    XBA
    CPX.B DP_Temp14 : BEQ .next
    DEX
    JMP .loop

  .next:
    INY : BPL Calculate_CrystalFlash_HDMADataTables_Scaled_RightOfScreen
    RTS


;;; $A552: Pre-instruction - crystal flash - stage 1 - explosion ;;;
PreInstruction_CrystalFlash_1_Explosion:
;; Parameters:
;;     X: HDMA object index

; Identical to power bomb explosion stage 3 ($8DE9) except for the max radius (at $A5F6, resp. $8E8D)
    LDA.W PowerBombExplosionStatus : BMI .exploding
    RTL

  .exploding:
    PHP : PHB
    REP #$30
    PHX : PHY
    JSL Calculate_CrystalFlash_HDMAObjectTablePointers
    PEA PowerBombExplosion_Colors>>8&$FF00 : PLB : PLB
    SEP #$30
    LDA.B #$00 : XBA : LDY.B #$60
    LDA.W SamusProjectile_PowerBombExplosionRadius+1 : STA.W $4202
    LDA.W PowerBombExplosion_ShapeDefinitionTable_Unscaled_topOffset : STA.W $4203
    NOP #3
    LDA.W $4217 : STA.B DP_Temp12
    TAX
    PEA .loopPadDataTableBegin-1
    LDA.W SamusProjectile_PowerBombPositionOnScreen+1 : AND.B #$FF : BEQ .offScreenLeft
    DEC : BEQ .onScreen
    JMP Calculate_CrystalFlash_HDMADataTables_Scaled_RightOfScreen

  .onScreen:
    JMP Calculate_CrystalFlash_HDMADataTables_Scaled_OnScreen

  .offScreenLeft:
    JMP Calculate_CrystalFlash_HDMADataTables_Scaled_LeftOfScreen

  .loopPadDataTableBegin:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    XBA : STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    XBA
    DEX : BPL .loopPadDataTableBegin
    LDX.B DP_Temp12 : INX : CPX.B #$C0 : BEQ .finishedTable
    LDA.B #$FF

  .loopPadDataTableEnd:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X
    INC : STA.L PowerBombExplosionWindow2RightHDMADataTable,X
    DEC
    INX : CPX.B #$C0 : BNE .loopPadDataTableEnd

  .finishedTable:
    LDA.W SamusProjectile_PowerBombExplosionRadius+1 : LSR #3 : AND.B #$1F : STA.B DP_Temp12
    ASL : CLC : ADC.B DP_Temp12 : TAX
    LDA.L PowerBombExplosion_Colors_red,X : ORA.B #$20 : STA.W DP_ColorMathSubScreenBackdropColor0
    LDA.L PowerBombExplosion_Colors_green,X : ORA.B #$40 : STA.W DP_ColorMathSubScreenBackdropColor1
    LDA.L PowerBombExplosion_Colors_blue,X : ORA.B #$80 : STA.W DP_ColorMathSubScreenBackdropColor2
    REP #$30
    PLY : PLX
    LDA.W SamusProjectile_PowerBombExplosionRadius : CLC : ADC.W SamusProjectile_PowerBombPreExplosionRadiusSpeed : STA.W SamusProjectile_PowerBombExplosionRadius
    CMP.W #$2000 : BCC .lessThan2000
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X
    INC.W HDMAObject_InstListPointers,X : INC.W HDMAObject_InstListPointers,X
    STZ.W HDMAObject_Timers,X
    JMP .return

  .lessThan2000:
    LDA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed : CLC : ADC.L PowerBombExplosion_RadiusAcceleration : STA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed

  .return:
    PLB : PLP
    RTL


;;; $A61B: FX type 22h: unused ;;;
FXType_20_22_ScrollingSky:
; Seems like it might have been an early version of the WS entrance scrolling sky + water
; Trying to use this FX in that room has tragic results though, and the code in its present form is a mess / broken
    PHP
    REP #$30
    LDA.W #$04E0 : STA.W FX_YPosition
    LDA.W #$0006 : STA.W FX_Type
    JSL Spawn_HDMAObject
    db $02,$12
    dw InstList_FXType_22_BG3YScroll_0
    JSL Spawn_HDMAObject
    db $42,$11
    dw InstList_FXType_22_BG3XScroll_0
    JSL Spawn_HDMAObject
    db $42,$0D
    dw InstList_FXType_22_BG1XScroll_0
    PLP
; fallthrough to PreInstruction_FXType_22_BG3Yscroll


;;; $A643: Pre-instruction - FX type 22h BG3 Y scroll ;;;
PreInstruction_FXType_22_BG3Yscroll:
    REP #$30
    JSR Damage_Samus_IfSheIsInTheTopRow
    LDA.W #FXType_22_RepeatingBG3StripsTable : STA.B DP_Temp00
    LDA.W #FXType_22_RepeatingBG3StripsTable+2 : STA.B DP_Temp03
    LDA.W #FXType_22_RepeatingBG3StripsTable+4 : STA.B DP_Temp06
    LDA.W #FXType_22_RepeatingBG3StripsTable+6 : STA.B DP_Temp09
    LDA.W #$004E : STA.B DP_Temp18
    JSR Calculate_FXType_22_BG3YScrollHDMATable
    LDA.W #$0000 : STA.L FXType22BG3YScrollHDMATable,X
    RTL


;;; $A66C: Instruction - HDMA object phase increase timer = 1 ;;;
Instruction_HDMAObjectPhaseIncreaseTimer_1:
;; Parameters:
;;     X: HDMA object index
    LDA.W #$0001 : STA.W HDMAObject_Var1,X
    RTS


;;; $A673: Pre-instruction - FX type 22h BG3 X scroll ;;;
PreInstruction_FXType_22_BG3XScroll:
;; Parameters:
;;     X: HDMA object index

; $7E:9E02..??: FX type 22h BG3 X scroll indirect HDMA table
; $7E:9F02..??: FX type 22h BG1 X scroll indirect HDMA table
; $7E:9E80..??: FX type 22h BG3 X scroll HDMA data table
    PHP
    REP #$30
    PHB : PHX : PHY
    LDA.W Layer1YPosition : CMP.W #$0400 : BPL .wavy
    LDA.W NMI_8bitFrameCounter : AND.W #$0001 : BNE +
    LDA.W BG3XScrollHDMADataTableSize : INC #2 : AND.W #$001E : STA.W BG3XScrollHDMADataTableSize

+   LDY.W BG3XScrollHDMADataTableSize
    LDX.W #$0000

  .loop:
    LDA.W FXType_22_BG3XScrollHDMAData,Y : STA.L FXType22BG3XScrollHDMADataTable,X
    INX #2
    INY #2 : CPY.W #$0020 : BMI .loop
    BRA .merge

  .wavy:
    DEC.W HDMAObject_Var1,X : BNE +
    LDA.W #$0006 : STA.W HDMAObject_Var1,X
    LDA.W HDMAObject_Var0,X : INC #2 : AND.W #$001F : STA.W HDMAObject_Var0,X

+   LDA.W HDMAObject_Var0,X : TAX
    LDY.W #$001E

  .loopWavy:
    LDA.B DP_BG1XScroll : CLC : ADC.W WaveDisplacementTable_Water,Y : STA.L FXType22BG3XScrollHDMADataTable,X
    TXA : DEC #2 : AND.W #$001F : TAX
    DEY #2 : BPL .loopWavy

  .merge:
    LDA.W #$0000 : STA.L FXType22BG3XScrollIndirectHDMATable-2 : STA.L FXType22BG1XScrollIndirectHDMADataTable-2
    LDA.W #$001F : STA.L FXType22BG3XScrollIndirectHDMATable : STA.L FXType22BG1XScrollIndirectHDMADataTable : STA.B DP_Temp12
    LDA.W #FXType22BG3XScrollIndirectHDMATable-2 : STA.L FXType22BG3XScrollIndirectHDMATable+1 : STA.L FXType22BG1XScrollIndirectHDMADataTable+1
    LDA.W Layer1YPosition : CMP.W #$0400 : BMI .lessThan400
    LDA.W #$00B1 : STA.B DP_Temp14
    STZ.B DP_Temp16
    LDX.W #$0105
    JSR Calculate_FXType_22_IndirectHDMATable
    BRA +

  .lessThan400:
    LDA.W #$0000 : STA.L FXType22BG1XScrollIndirectHDMADataTable

+   LDX.W #$0005
    LDA.W #FXType22BG3XScrollHDMADataTable : STA.B DP_Temp14
    LDA.W #$0080 : STA.B DP_Temp16
    JSR Calculate_FXType_22_IndirectHDMATable
    LDA.W #$00E0 : SEC : SBC.B DP_Temp12 : TAY

  .loopPad:
    TYA : SEC : SBC.W #$0010 : BMI .lessThan10
    TAY
    LDA.W #$0090 : STA.L FXType22BG3XScrollIndirectHDMATable-2,X : STA.L FXType22BG1XScrollIndirectHDMADataTable-2,X
    LDA.W #FXType22BG3XScrollHDMADataTable : STA.L FXType22BG3XScrollIndirectHDMATable-1,X : STA.L FXType22BG1XScrollIndirectHDMADataTable-1,X
    INX #3
    BRA .loopPad

  .lessThan10:
    TYA : CMP.W #$0000 : BEQ +
    CLC : ADC.W #$0080

+   STA.L FXType22BG3XScrollIndirectHDMATable-2,X : STA.L FXType22BG1XScrollIndirectHDMADataTable-2,X
    LDA.W #FXType22BG3XScrollHDMADataTable : STA.L FXType22BG3XScrollIndirectHDMATable-1,X : STA.L FXType22BG1XScrollIndirectHDMADataTable-1,X
    LDA.W #$0000 : STA.L FXType22BG3XScrollIndirectHDMATable+1,X : STA.L FXType22BG1XScrollIndirectHDMADataTable+1,X
    PLY : PLX : PLB : PLP
    RTL


;;; $A786: Calculate FX type 22h indirect HDMA table ;;;
Calculate_FXType_22_IndirectHDMATable:
;; Parameters:
;;     X: HDMA table index. If 5, writes to BG3 X scroll HDMA table. If 105h, writes to BG1 X scroll HDMA table
;;     $12: Y position on screen
;;     $14: HDMA data pointer
;;     $16: HDMA consecutive data flag. If 0, $14 points to one value used for many scanlines. If 80h, $14 points to consecutive values used for consecutive scanlines
;; Returns:
;;     X: HDMA table index
;;     $12: Y position on screen

; If [$16] = 0:
;     Set all scanlines to use HDMA data entry [$14] until (at most) layer 1 Y position 4DFh
; If [$16] = 80h:
;     If layer 1 Y position 4DFh is within 80h pixels of the HUD:
;         Set up to 7Fh scanlines to use HDMA data table [$14] until layer 1 Y position 4DFh
;     Else:
;         Set 10h scanline strips to use HDMA data table [$14] until the bottom of the screen

; (In the following calculations, 1Fh is the HUD height)
    LDA.W #$04C0 : SEC : SBC.W Layer1YPosition : STA.B DP_Temp18 : BMI .return
    BEQ .return
    CMP.W #$0080 : BMI .onlyOneEntryNeeded
    STA.B DP_Temp12
    CMP.W #$00C1 : BMI .remainingScanlineCounter
    LDA.W #$00C1

  .remainingScanlineCounter:
    STA.B DP_Temp12 : STA.B DP_Temp18

  .loop:
    SEC : SBC.W #$0010 : BMI .done
    STA.B DP_Temp18
    LDA.W #$0010 : ORA.B DP_Temp16 : STA.L FXType22BG3XScrollIndirectHDMATable-2,X
    LDA.B DP_Temp14 : STA.L FXType22BG3XScrollIndirectHDMATable-1,X
    LDA.B DP_Temp18
    INX #3
    BRA .loop

  .onlyOneEntryNeeded:
    STA.B DP_Temp12

  .done:
    LDA.B DP_Temp18 : ORA.B DP_Temp16 : STA.L FXType22BG3XScrollIndirectHDMATable-2,X
    LDA.B DP_Temp14 : STA.L FXType22BG3XScrollIndirectHDMATable-1,X
    INX #3

  .return:
    RTS


;;; $A7D8: Spawn scrolling sky land HDMA object / FX type 20h: scrolling sky ;;;
FXType_20_ScrollingSky_RoomSetupASM_ScrollingSkyLand:
    PHP
    SEP #$30
    LDA.W Layer2ScrollX : ORA.B #$01 : STA.W Layer2ScrollX
    LDA.W Layer2ScrollY : ORA.B #$01 : STA.W Layer2ScrollY
    JSL Spawn_HDMAObject
    db $42,$0F
    dw InstList_ScrollingSkyLand_BG2XScroll_0
    REP #$30
    LDA.W #$00E0 : STA.W neverRead059A
    STZ.W neverRead059C
    PLP
    RTL


;;; $A800: Spawn scrolling sky ocean HDMA object ;;;
RoomSetupASM_ScrollingSkyOcean:
    PHP
    SEP #$30
    LDA.B #$4A : STA.B DP_BG2TilemapAddrSize
    JSL Spawn_HDMAObject
    db $42,$0F
    dw InstList_ScrollingSkyOcean_BG2XScroll_0
    REP #$30
    LDA.W #$00E0 : STA.W neverRead059A
    STZ.W neverRead059C
    PLP
    RTL


;;; $A81C: Calculate FX type 22h BG3 Y scroll HDMA table ;;;
Calculate_FXType_22_BG3YScrollHDMATable:
;; Parameters:
;;     $00: $A8E8. Base address of section top positions
;;     $03: $A8EA. Base address of strip heights
;;     $06: $A8EC. Base address of BG3 tilemap Y positions
;;     $09: $A8EE. Base address of section bottom positions
;;     $18: 4Eh. Table size (13 entries of 6 bytes)
;; Returns:
;;     X: HDMA table index
    PHB
    PHK : PLB
    LDA.W #$0020 : STA.W YPositionOnScreenFX22
    DEC : STA.L FXType22BG3YScrollHDMATable
    LDA.W #$0000 : STA.L FXType22BG3YScrollHDMATable+1
    LDX.W #$0003
    LDA.W Layer1YPosition : CLC : ADC.W YPositionOnScreenFX22 : STA.B DP_Temp12
    LDY.W #$0000

  .loopFirstStrip:
    CMP.B (DP_Temp00),Y : BMI +
    CMP.B (DP_Temp09),Y : BMI .foundFirstStrip

+   INY #6 : CPY.B DP_Temp18 : BMI .loopFirstStrip
    PLB
    RTS

  .foundFirstStrip:
    LDA.B DP_Temp12 : CMP.W #$04E0 : BMI .YposMod10
    AND.W #$001F
    BRA +

  .YposMod10:
    AND.W #$000F

+   STA.B DP_Temp16
    LDA.B (DP_Temp03),Y : SEC : SBC.B DP_Temp16 : STA.L FXType22BG3YScrollHDMATable,X
    LDA.B (DP_Temp06),Y : CLC : ADC.B DP_Temp16
    SEC : SBC.W YPositionOnScreenFX22 : STA.L FXType22BG3YScrollHDMATable+1,X
    BRA .next

  .loopHDMATable:
    LDA.B DP_Temp12

  .loopStrip:
    CMP.B (DP_Temp00),Y : BMI +
    CMP.B (DP_Temp09),Y : BMI .foundStrip

+   INY #6 : CPY.B DP_Temp18 : BMI .loopStrip
    PLB
    RTS

  .foundStrip:
    LDA.B (DP_Temp03),Y : STA.L FXType22BG3YScrollHDMATable,X
    LDA.B (DP_Temp06),Y : SEC : SBC.W YPositionOnScreenFX22 : STA.L FXType22BG3YScrollHDMATable+1,X

  .next:
    LDA.L FXType22BG3YScrollHDMATable,X : AND.W #$00FF : STA.B DP_Temp14
    CLC : ADC.B DP_Temp12 : STA.B DP_Temp12
    INX #3
    LDA.B DP_Temp14 : CLC : ADC.W YPositionOnScreenFX22 : STA.W YPositionOnScreenFX22
    CMP.W #$00E0 : BMI .loopHDMATable
    PLB
    RTS


;;; $A8C4: Damage Samus if she is in the top row ;;;
Damage_Samus_IfSheIsInTheTopRow:
    LDA.W SamusYPosition : SEC : SBC.W SamusYRadius : BMI .8damage
    CMP.W #$0011 : BMI .8damage
    RTS

  .8damage:
    LDA.W #$0008 : STA.W PeriodicDamage
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $A8DA: Unused table ;;;
UNUSED_Table_88A8DA:
; Looks like the format of FXType_22_RepeatingBG3StripsTable below
    dw $0000,$0010,$0020,$0020,$0010,$0030,$0040
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A8E8: FX type 22h repeating BG3 strips table ;;;
FXType_22_RepeatingBG3StripsTable:
; This table defines sections of repeating strips of BG3
;        _______________ Section top position
;       |      _________ Strip height
;       |     |      ___ BG3 tilemap Y position
;       |     |     |
    dw $0000,$0010,$0020
    dw $0030,$0010,$0030
    dw $0040,$0010,$0040
    dw $0300,$0010,$0050
    dw $0310,$0010,$0060
    dw $0330,$0010,$0070
    dw $0340,$0010,$0080
    dw $03A0,$0010,$0090
    dw $03B0,$0010,$00A0
    dw $03D0,$0010,$00B0
    dw $03E0,$0010,$00C0
    dw $04E0,$0020,$00D0
    dw $0500,$0020,$00F0
    dw $0600


;;; $A938: FX type 22h BG3 X scroll HDMA data ;;;
FXType_22_BG3XScrollHDMAData:
; Looks like only the first line is used (see PreInstruction_FXType_22_BG3XScroll)
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000


;;; $AD38: RTL. Pre-instruction - FX type 22h BG1 X scroll ;;;
RTL_88AD38:
    RTL


;;; $AD39: Instruction list - FX type 22h BG1 X scroll ;;;
InstList_FXType_22_BG1XScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObjectPhaseIncreaseTimer_1
    dw Instruction_HDMAObject_PreInstructionInY
    dl RTL_88AD38

InstList_FXType_22_BG1XScroll_1:
    dw $7000,FXType22BG1XScrollIndirectHDMADataTable
    dw Instruction_HDMAObject_GotoY
    dw InstList_FXType_22_BG1XScroll_1


;;; $AD4E: Instruction list - FX type 22h BG3 X scroll ;;;
InstList_FXType_22_BG3XScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObjectPhaseIncreaseTimer_1
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_FXType_22_BG3XScroll

InstList_FXType_22_BG3XScroll_1:
    dw $7000,FXType22BG3XScrollIndirectHDMATable
    dw Instruction_HDMAObject_GotoY
    dw InstList_FXType_22_BG3XScroll_1


;;; $AD63: Instruction list - FX type 22h BG3 Y scroll ;;;
InstList_FXType_22_BG3YScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_FXType_22_BG3Yscroll

InstList_FXType_22_BG3YScroll_1:
    dw $7000,FXType22BG3YScrollHDMATable
    dw Instruction_HDMAObject_GotoY
    dw InstList_FXType_22_BG3YScroll_1


;;; $AD76: Instruction list - scrolling sky land BG2 X scroll ;;;
InstList_ScrollingSkyLand_BG2XScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_ScrollingSkyLand_BG2XScroll

InstList_ScrollingSkyLand_BG2XScroll_1:
    dw $7000,ScrollingSkyBG2XScrollIndirectHDMATable
    dw Instruction_HDMAObject_GotoY
    dw InstList_ScrollingSkyLand_BG2XScroll_1


;;; $AD89: Instruction list - scrolling sky ocean BG2 X scroll ;;;
InstList_ScrollingSkyOcean_BG2XScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_ScrollingSkyOcean_BG2XScroll

InstList_ScrollingSkyOcean_BG2XScroll_1:
    dw $7000,ScrollingSkyBG2XScrollIndirectHDMATable
    dw Instruction_HDMAObject_GotoY
    dw InstList_ScrollingSkyOcean_BG2XScroll_1


;;; $AD9C: Scrolling sky land chunk pointers ;;;
ScrollingSkyLand_ChunkPointers:
    dw ScrollingSky_Tilemaps_0
    dw ScrollingSky_Tilemaps_1
    dw ScrollingSky_Tilemaps_2
    dw ScrollingSky_Tilemaps_3
    dw ScrollingSky_Tilemaps_4


;;; $ADA6: Scrolling sky ocean chunk pointers ;;;
ScrollingSkyOcean_ChunkPointesr:
    dw ScrollingSky_Tilemaps_0
    dw ScrollingSky_Tilemaps_1
    dw ScrollingSky_Tilemaps_2
    dw ScrollingSky_Tilemaps_3
    dw ScrollingSky_Tilemaps_5
    dw ScrollingSky_Tilemaps_8AE180


;;; $ADB2: Pre-instruction - scrolling sky land BG2 X scroll ;;;
PreInstruction_ScrollingSkyLand_BG2XScroll:
    REP #$30
    LDA.W TimeIsFrozenFlag : BEQ Handle_ScrollingSky_BG2XScroll_HDMATables
    RTL


;;; $ADBA: Pre-instruction - scrolling sky ocean BG2 X scroll ;;;
PreInstruction_ScrollingSkyOcean_BG2XScroll:
    REP #$30
    LDA.W TimeIsFrozenFlag : BEQ Handle_ScrollingSky_BG2XScroll_HDMATables
    RTL


;;; $ADC2: Handle scrolling sky BG2 X scroll HDMA tables ;;;
Handle_ScrollingSky_BG2XScroll_HDMATables:
; The HUDBG2XPositionScrollingSky HDMA data entry pointer used at $AE05 I low-key suspect should be neverRead059C,
; which is explicitly set to zero in room setup ASM and otherwise unused,
; unlike HUDBG2XPositionScrollingSky which is never set (but is also otherwise unused)
    SEP #$30
    LDA.B #$4A : STA.B DP_BG2TilemapAddrSize
    REP #$30
    LDY.W #$0000

  .loopDataTable:
    LDA.W ScrollingSky_ScrollingTable_HDMADataTableEntryPointer,Y : TAX
    LDA.W ScrollingSky_ScrollingTable_scrollSubspeed,Y : CLC : ADC.L ScrollingSkyBG2XScrollHDMADataTable&$FF0000,X : STA.L ScrollingSkyBG2XScrollHDMADataTable&$FF0000,X
    LDA.W ScrollingSky_ScrollingTable_scrollSpeed,Y : ADC.L (ScrollingSkyBG2XScrollHDMADataTable&$FF0000)+2,X : STA.L (ScrollingSkyBG2XScrollHDMADataTable&$FF0000)+2,X
    TYA : CLC : ADC.W #$0008 : TAY
    CMP.W #$00B8 : BMI .loopDataTable
    LDA.W #$0000 : STA.L ScrollingSkyBG2XScrollHDMADataTable+$58 : STA.L ScrollingSkyBG2XScrollHDMADataTable+$5A
    LDA.W #$001F : STA.L ScrollingSkyBG2XScrollIndirectHDMATable
    LDA.W #HUDBG2XPositionScrollingSky : STA.L ScrollingSkyBG2XScrollIndirectHDMATable+1
    LDA.W Layer1YPosition : CLC : ADC.W #$0020 : STA.B DP_Temp12
    CLC : ADC.W #$00C0 : STA.B DP_Temp14
    LDY.W #$0000
    LDX.W #$0003

  .loopIndirectTable:
    LDA.B DP_Temp12 : CMP.W ScrollingSky_ScrollingTable_topPosition,Y : BMI +
    CMP.W ScrollingSky_ScrollingTable_nextEntry,Y : BMI .scrollingSection

+   TYA : CLC : ADC.W #$0008 : TAY
    CMP.W #$00B8 : BMI .loopIndirectTable
    LDA.W #$05FF : SEC : SBC.B DP_Temp12

  .loopNonScrollingSection:
    STA.B DP_Temp18
    CMP.W #$0080 : BMI .lessThan80
    LDA.W #$007F : STA.L ScrollingSkyBG2XScrollIndirectHDMATable,X
    LDA.W #$00B5 : STA.L ScrollingSkyBG2XScrollIndirectHDMATable+1,X
    INX #3
    LDA.B DP_Temp18 : SEC : SBC.W #$007F
    BRA .loopNonScrollingSection

  .lessThan80:
    STA.L ScrollingSkyBG2XScrollIndirectHDMATable,X
    LDA.W #$00B5 : STA.L ScrollingSkyBG2XScrollIndirectHDMATable+1,X
    LDA.W #$0000 : STA.L ScrollingSkyBG2XScrollIndirectHDMATable+3,X
    RTL

  .scrollingSection:
    LDA.W ScrollingSky_ScrollingTable_nextEntry,Y : SEC : SBC.B DP_Temp12 : STA.B DP_Temp18
    CMP.W #$0080 : BMI .heightLessThan80
    LDA.W #$007F : STA.L ScrollingSkyBG2XScrollIndirectHDMATable,X
    LDA.W ScrollingSky_ScrollingTable_HDMADataTableEntryPointer,Y : INC #2 : STA.L ScrollingSkyBG2XScrollIndirectHDMATable+1,X
    INX #3
    LDA.B DP_Temp18 : SEC : SBC.W #$007F

  .heightLessThan80:
    STA.L ScrollingSkyBG2XScrollIndirectHDMATable,X
    LDA.W ScrollingSky_ScrollingTable_HDMADataTableEntryPointer,Y : CLC : ADC.W #$0002 : STA.L ScrollingSkyBG2XScrollIndirectHDMATable+1,X
    LDA.B DP_Temp18 : CLC : ADC.B DP_Temp12 : STA.B DP_Temp12
    INX #3
    LDA.B DP_Temp12 : CMP.B DP_Temp14 : BPL .terminateTable
    JMP .loopIndirectTable

  .terminateTable:
    LDA.W #$0000 : STA.L ScrollingSkyBG2XScrollIndirectHDMATable+3,X
    RTL


ScrollingSky_ScrollingTable:
; Scrolling sky scroll table
;                        ________________ Top position of scrolling section
;                       |     ___________ Scroll subspeed
;                       |    |     ______ Scroll speed
;                       |    |    |     _ Pointer to HDMA data table entry
;                       |    |    |    |
  .topPosition:
    dw $0000
  .scrollSubspeed:
    dw       $8000
  .scrollSpeed:
    dw             $0000
  .HDMADataTableEntryPointer:
    dw                   ScrollingSkyBG2XScrollHDMADataTable
  .nextEntry:
    dw $0010,$C000,$0000,ScrollingSkyBG2XScrollHDMADataTable+4
    dw $0038,$8000,$0000,ScrollingSkyBG2XScrollHDMADataTable+8
    dw $00D0,$C000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$C
    dw $00E0,$8000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$10
    dw $0120,$C000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$14
    dw $01A0,$8000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$18
    dw $01D8,$C000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$1C
    dw $0238,$8000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$20
    dw $0268,$C000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$24
    dw $02A0,$8000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$28
    dw $02E0,$C000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$20
    dw $0300,$8000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$30
    dw $0320,$C000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$34
    dw $0350,$8000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$38
    dw $0378,$C000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$3C
    dw $03C8,$8000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$40
    dw $0440,$7000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$44
    dw $0460,$C000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$48
    dw $0480,$8000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$4C
    dw $0490,$0000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$50
    dw $04A8,$0000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$54
    dw $04B8,$0000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$58
    dw $0500
; Unused continuation
    dw $0500,$0000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$5C
    dw $0578,$0000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$60
    dw $05F0


;;; $AF8D: Update scrolling sky land tilemap ;;;
RoomMainASM_ScrollingSkyLand:
    LDA.W #ScrollingSkyLand_ChunkPointers : STA.B DP_Temp00
    LDA.W #$0088 : STA.B DP_Temp02
    BRA RoomMainASM_ScrollingSky


;;; $AF99: Update scrolling sky ocean tilemap ;;;
RoomMainASM_ScrollingSkyOcean:
    LDA.W #ScrollingSkyOcean_ChunkPointesr : STA.B DP_Temp00
    LDA.W #$0088 : STA.B DP_Temp02
; fallthrough to RoomMainASM_ScrollingSky


;;; $AFA3: Update scrolling sky tilemap ;;;
RoomMainASM_ScrollingSky:
;; Parameters:
;;     $00: Address of scrolling sky chunk pointers

; The scrolling sky tilemap is divided into 800h byte chunks, the entire scrolling sky background is 7 scrolls high and it loaded from $8A:B180..E97F.
; The landing site scrolling sky uses the first 5 scrolls only;
; the ocean part of the background is actually stored starting from $8A:D980, which is the 6th scroll into the tilemap.
; So what happens for the ocean rooms is the 5th scroll is skipped and first 4 scrolls and the last 2 scrolls are spliced together.

; This routine handles the updating of the scrolling sky tilemap (inc. the splicing, which is done indirectly via the table of chunk pointers pointed to by $00).
; It does this by adding four entries to the VRAM write table, one for each 20h tile row (40h bytes or 20h words), every frame.
; The updated rows are the first two rows below the screen (entry 2 and 3) and the last two rows behind the HUD (entry 0 and 1).

; Notes on the calculations:
;     The VRAM write table entry size is (number of tiles in a row) * (size of a tilemap tile) = 20h * 2 = 40h bytes
;     The VRAM write table entry source address is calculated in two parts from the layer 1 Y position:
;         A mask is applied to the layer 1 Y position (the 7F8h), this is to clear the least significant 3 bits, which rounds the position down to the nearest tile.
;         (The fact that the upper bits are lost is irrelevant, as the land version is 5 scrolls max height and the ocean version is 6 scrolls max height).
;         The upper byte gives which row of scrolls the BG is in, which is used as an index to the provided table (in $00) as the base address of the scrolling sky 'chunk' to be loaded.
;         The lower byte (after rounding) gives the position of the row *within* the current scroll,
;         divide by 8 to get which row of tiles the BG is in, and multiply by 40h bytes (size of a tile row) to get the index *into the tilemap chunk*
;         (equivalently, multiply by 40h/8 = 8).
;     The VRAM write table entry destination address is similar to the lower byte of the source address.
;         The VRAM tilemap is 40h tiles high, or 200h pixels, so the mask (1F8h) is rounding down to the nearest tile as before, and also reducing modulo 200h pixels.
;         Divide by 8 to get which row of tiles the BG is in, and multiply by 20h words (size of a tile row) to get the index *into VRAM*
;         (equivalently, multiply by 20h/8 = 4)
    LDA.W TimeIsFrozenFlag : BEQ .timeNotFrozen
    LDA.W #$0000 : STA.L ScrollingSkyBG2XScrollIndirectHDMATable
    RTL

  .timeNotFrozen:
    REP #$30
    LDA.W Layer1YPosition : STA.B DP_BG2YScroll
    LDX.W VRAMWriteStack
    LDA.W #$0040 : STA.B VRAMWrite.size,X : STA.B VRAMWrite[1].size,X
    STA.B VRAMWrite[2].size,X : STA.B VRAMWrite[3].size,X
    LDA.W Layer1YPosition : AND.W #$07F8 : SEC : SBC.W #$0010 : PHA
    AND.W #$FF00 : XBA : ASL : TAY
    PLA : AND.W #$00FF : ASL #3 : CLC : ADC.B [DP_Temp00],Y : STA.B VRAMWrite.src,X
    CLC : ADC.W #$0040 : STA.B VRAMWrite[1].src,X
    LDA.W Layer1YPosition : AND.W #$07F8 : CLC : ADC.W #$00F0 : PHA
    AND.W #$FF00 : XBA : ASL : TAY
    PLA : AND.W #$00FF : ASL #3 : CLC : ADC.B [DP_Temp00],Y : STA.B VRAMWrite[2].src,X
    CLC : ADC.W #$0040 : STA.B VRAMWrite[3].src,X
    SEP #$20
    LDA.B #$8A : STA.B VRAMWrite.src+2,X : STA.B VRAMWrite[1].src+2,X
    STA.B VRAMWrite[2].src+2,X : STA.B VRAMWrite[3].src+2,X
    REP #$20
    LDA.B DP_BG2TilemapAddrSize : AND.W #$00FC : XBA : STA.B DP_Temp12
    LDA.W Layer1YPosition : SEC : SBC.W #$0010 : AND.W #$01F8
    ASL #2 : CLC : ADC.B DP_Temp12 : STA.B VRAMWrite.dest,X
    CLC : ADC.W #$0020 : STA.B VRAMWrite[1].dest,X
    LDA.W Layer1YPosition : CLC : ADC.W #$00F0 : AND.W #$01F8
    ASL #2 : CLC : ADC.B DP_Temp12 : STA.B VRAMWrite[2].dest,X
    CLC : ADC.W #$0020 : STA.B VRAMWrite[3].dest,X
    TXA : CLC : ADC.W #$001C : STA.W VRAMWriteStack
    RTL


;;; $B058: Fireflea flashing shades ;;;
Fireflea_Flashing_Shades:
; Indexed by [fireflea flashing index] * 2
    dw $0000,$0100,$0200,$0300,$0400,$0500,$0600,$0500
    dw $0400,$0300,$0200,$0100


;;; $B070: Fireflea darkness shades ;;;
Fireflea_Darkness_Shades:
; Indexed by [fireflea darkness level]
    dw $0000,$0600,$0C00,$1200,$1800,$1900


;;; $B07C: FX type 24h: fireflea ;;;
FXType_24_Fireflea:
; This spawns an HDMA object purely for the pre-instruction, which modifies the colour math backdrop colour
; The HDMA doesn't actually do anything
    PHP
    REP #$30
    LDA.W #$0006 : STA.W FirefleaFlashing_Timer
    STZ.W FirefleaFlashing_Index
    JSL Spawn_HDMAObject
    db $42,$11
    dw InstList_Fireflea_BG3XScroll_0
    LDA.W #$0000 : STA.L DummyHDMATable
    STZ.W Unused177C : STZ.W FirefleaFlashing_DarknessLevel
    LDA.W #$0018 : STA.W Unused1780
    LDA.L Fireflea_Flashing_Shades : STA.W Unused1782
    PLP
    RTL


;;; $B0AC: Instruction list - fireflea BG3 X scroll ;;;
InstList_Fireflea_BG3XScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_Fireflea_BG3XScroll

InstList_Fireflea_BG3XScroll_1:
    dw $0001,DummyHDMATable
    dw Instruction_HDMAObject_GotoY
    dw InstList_Fireflea_BG3XScroll_1


;;; $B0BC: Pre-instruction - fireflea BG3 X scroll ;;;
PreInstruction_Fireflea_BG3XScroll:
    PHP
    REP #$30
    LDA.W LayerBlending_Config : AND.W #$FF00 : ORA.W #$000C : STA.W LayerBlending_Config
    LDA.W TimeIsFrozenFlag : BNE .return
    DEC.W FirefleaFlashing_Timer : BNE .nonZero
    LDA.W #$0006 : STA.W FirefleaFlashing_Timer
    LDA.W FirefleaFlashing_DarknessLevel : CMP.W #$000A : BMI .lessThanA
    LDA.W #$0006
    BRA .storeIndex

  .lessThanA:
    LDA.W FirefleaFlashing_Index : INC : CMP.W #$000C : BCC .storeIndex
    LDA.W #$0000

  .storeIndex:
    STA.W FirefleaFlashing_Index

  .nonZero:
    REP #$30
    LDA.W FirefleaFlashing_Index : ASL : TAX
    LDA.L Fireflea_Flashing_Shades,X
    LDX.W FirefleaFlashing_DarknessLevel
    CLC : ADC.L Fireflea_Darkness_Shades,X : XBA : TAX
    SEP #$30
    ORA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor1
    TXA : ORA.B #$40 : STA.B DP_ColorMathSubScreenBackdropColor2
    TXA : ORA.B #$20 : STA.B DP_ColorMathSubScreenBackdropColor0

  .return:
    PLP
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $B11E: Unused. Spawn expanding and contracting effect HDMA object ;;;
UNUSED_Spawn_ExpandingContractingEffect_HDMAObject_88B11E:
; Causes an expanding and contracting effect, see "expanding message box.asm"
; The RAM used here is the same as used for the message box animation,
; usage looks similar too (HDMA table of $85:8363, $05A2..A7 of $85:82B8),
; so this is not unlikely an early version of the message box animation
    PHP
    REP #$30
    STZ.W ContractingFlag : STZ.W ExpandContract_HDMATableUpdateCounter
    LDA.W #$0080 : STA.W ExpandContract_DestTop : STA.W ExpandContract_SrcTop
    LDA.W #$007F : STA.W ExpandContract_DestBottom : STA.W ExpandContract_SrcBottom
    LDA.W #$2000 : STA.W ExpandContract_ExpansionFactor
    LDA.W #$00FF : STA.L ExpandingContractingEffectBG2YScrollIndirectHDMATable
    LDA.W #ExpandingContractingEffectBG2YScrollIndirectHDMADataTable : STA.L ExpandingContractingEffectBG2YScrollIndirectHDMATable+1
    LDA.W #$00E1 : STA.L ExpandingContractingEffectBG2YScrollIndirectHDMATable+3
    LDA.W #ExpandingContractingEffectBG2YScrollIndirectHDMADataTable+$FE : STA.L ExpandingContractingEffectBG2YScrollIndirectHDMATable+4
    LDA.W #$0000 : STA.L ExpandingContractingEffectBG2YScrollIndirectHDMATable+6
    JSL Spawn_HDMAObject
    db $42,$10
    dw InstList_ExpandingContractingEffect_BG2YScroll_0
    PLP
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B16C: Instruction list - expanding and contracting effect BG2 Y scroll ;;;
InstList_ExpandingContractingEffect_BG2YScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_ExpandingContractingEffect_BG2YScroll

InstList_ExpandingContractingEffect_BG2YScroll_1:
    dw $7777,ExpandingContractingEffectBG2YScrollIndirectHDMATable
    dw Instruction_HDMAObject_GotoY
    dw InstList_ExpandingContractingEffect_BG2YScroll_1


;;; $B17F: Pre-instruction - expanding and contracting effect BG2 Y scroll ;;;
PreInstruction_ExpandingContractingEffect_BG2YScroll:
; y_low_0  = ExpandContract_DestTop
; y_high_0 = ExpandContract_DestBottom
; expansion_factor = ExpandContract_ExpansionFactor ; scale factor = 1 + expansion_factor / 8000h
; y_source_low_0  = ExpandContract_SrcTop
; y_source_high_0 = ExpandContract_SrcBottom
; for (i = 0; i < 20h; ++i)
; {
;     y_low  = y_low_0  + i
;     y_high = y_high_0 - i
;     delta = i - (expansion_factor * i + 8000h) / 10000h
;     y_source_low  = y_source_low_0  + delta
;     y_source_high = y_source_high_0 - delta
;     $7E:9C00 + y_low  * 2 = y_source_low  - y_low
;     $7E:9C00 + y_high * 2 = y_source_high - y_high
; }

; ExpandContract_DestTop += 20h
; ExpandContract_DestBottom -= 20h
; ExpandContract_SrcTop += 20h - expansion_factor / 800h
; ExpandContract_SrcBottom -= 20h - expansion_factor / 800h

; "expanding contracting test.lua" seems to agree with this maths
    PHP
    REP #$30
    INC.W ExpandContract_HDMATableUpdateCounter
    LDA.W ExpandContract_HDMATableUpdateCounter : CMP.W #$0004 : BMI .counterLessThan4
    STZ.W ExpandContract_HDMATableUpdateCounter
    LDA.W ContractingFlag : BEQ .expanding
    LDA.W ExpandContract_ExpansionFactor : SEC : SBC.W #$0400 : STA.W ExpandContract_ExpansionFactor
    CMP.W #$2000 : BPL +
    LDA.W #$2000 : STA.W ExpandContract_ExpansionFactor
    STZ.W ContractingFlag
    BRA +

  .expanding:
    LDA.W ExpandContract_ExpansionFactor : CLC : ADC.W #$0400 : STA.W ExpandContract_ExpansionFactor
    CMP.W #$8000 : BMI +
    INC.W ContractingFlag

+   LDA.W #$0080 : STA.W ExpandContract_DestTop : STA.W ExpandContract_SrcTop
    LDA.W #$007F : STA.W ExpandContract_DestBottom : STA.W ExpandContract_SrcBottom

  .counterLessThan4:
    LDA.W ExpandContract_DestTop : ASL : TAX
    LDA.W ExpandContract_DestBottom : ASL : TAY
    STZ.B DP_Temp12
    LDA.W #$0020 : STA.B DP_Temp14

  .loop:
    LDA.W ExpandContract_SrcTop : SEC : SBC.W ExpandContract_DestTop : STA.L ExpandingContractingEffectBG2YScrollIndirectHDMADataTable,X
    PHX
    TYX
    LDA.W ExpandContract_SrcBottom : SEC : SBC.W ExpandContract_DestBottom : STA.L ExpandingContractingEffectBG2YScrollIndirectHDMADataTable,X
    PLX
    LDA.B DP_Temp12 : CLC : ADC.W ExpandContract_ExpansionFactor : STA.B DP_Temp12 : BVS +
    INC.W ExpandContract_SrcTop
    DEC.W ExpandContract_SrcBottom

+   INC.W ExpandContract_DestTop
    DEC.W ExpandContract_DestBottom
    DEY #2
    INX #2
    DEC.B DP_Temp14 : BNE .loop
    PLP
    RTL


;;; $B21D: Handle earthquake sound effect ;;;
Handle_Earthquake_SoundEffect:
; For lavaquake and Tourian entrance reveal
    PHX : PHY : PHP
    REP #$30
    LDA.W EarthquakeSFX_Timer : BMI .return
    DEC : STA.W EarthquakeSFX_Timer : BPL .return
    LDX.W EarthquakeSFX_Index
    LDA.W .soundIndex,X : BPL .quake
    LDX.W #$0000
    LDA.W .soundIndex,X

  .quake:
    JSL QueueSound_Lib2_Max6
    LDA.W RandomNumberSeed : AND.W #$0003 : ADC.W .baseTimer,X : STA.W EarthquakeSFX_Timer
    INX #4 : STX.W EarthquakeSFX_Index

  .return:
    PLP : PLY : PLX
    RTS

;        _________ Sound index (sound library 2)
;       |      ___ Base timer
;       |     |
  .soundIndex:
    dw $0046
  .baseTimer:
    dw       $0001
    dw $0046,$0003
    dw $0046,$0002
    dw $0046,$0001
    dw $0046,$0001
    dw $0046,$0002
    dw $0046,$0002
    dw $0046,$0001
    dw $8000


;;; $B278: RTL. FX type: none ;;;
RTL_88B278:
    RTL


;;; $B279: FX type 2: lava ;;;
FXType_2_Lava:
    LDA.W #FXRisingFunction_LavaAcid_Normal : STA.W FX_RisingFunction
    LDA.W FX_BaseYPosition : STA.W FX_LavaAcidYPosition
    JSL Spawn_HDMAObject
    db $42,$12
    dw InstList_LavaAcidBG3_Yscroll
    JSL Spawn_HDMAObject
    db $42,$10
    dw InstList_LavaAcidBG2_Yscroll
    JSL Spawn_BG3_Scroll_HDMA_Object
    LDY.W #AnimatedTilesObject_Lava
    JSL Spawn_AnimatedTilesObject
    RTL


;;; $B2A1: FX type 4: acid ;;;
FXType_4_Acid:
    LDA.W #FXRisingFunction_LavaAcid_Normal : STA.W FX_RisingFunction
    LDA.W FX_BaseYPosition : STA.W FX_LavaAcidYPosition
    JSL Spawn_HDMAObject
    db $42,$12
    dw InstList_LavaAcidBG3_Yscroll
    JSL Spawn_HDMAObject
    db $42,$10
    dw InstList_LavaAcidBG2_Yscroll
    JSL Spawn_BG3_Scroll_HDMA_Object
    LDY.W #AnimatedTilesObject_Acid
    JSL Spawn_AnimatedTilesObject
    RTL


;;; $B2C9: Handle tide ;;;
Handle_Tide:
    BIT.W FX_YVelocity : BMI .smallTide
    BVS .bigTide
    RTS

  .smallTide:
    STZ.W FX_YSubOffset : STZ.W FX_YOffset
    LDA.W FX_TidePhase+1 : AND.W #$00FF : ASL : TAX
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : ASL #3 : BPL +
    DEC.W FX_YOffset

+   STA.W FX_YSubOffset+1
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : BPL .smallBelowMidpoint
    LDA.W FX_TidePhase : CLC : ADC.W #$00C0
    BRA .returnSmallTide

  .smallBelowMidpoint:
    LDA.W FX_TidePhase : CLC : ADC.W #$0120

  .returnSmallTide:
    STA.W FX_TidePhase
    RTS

  .bigTide:
    STZ.W FX_YSubOffset : STZ.W FX_YOffset
    LDA.W FX_TidePhase+1 : AND.W #$00FF : ASL : TAX
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : ASL #5 : BPL +
    DEC.W FX_YOffset

+   STA.W FX_YSubOffset+1
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : BPL .bigBelowMidpoint
    LDA.W FX_TidePhase : CLC : ADC.W #$0080
    BRA .returnBigTide

  .bigBelowMidpoint:
    LDA.W FX_TidePhase : CLC : ADC.W #$00E0

  .returnBigTide:
    STA.W FX_TidePhase
    RTS


;;; $B341: RTS ;;;
RTS_88B341:
    RTS


;;; $B342: RTS ;;;
RTS_88B342:
    RTS


;;; $B343: FX rising function - lava/acid - normal ;;;
FXRisingFunction_LavaAcid_Normal:
    LDA.W FX_YSubVelocity : BEQ .return3
    BMI .negative
    LDA.W FX_TargetYPosition : CMP.W FX_BaseYPosition : BEQ .return1
    BCS .doRise

  .return1:
    RTS

  .negative:
    LDA.W FX_TargetYPosition : CMP.W FX_BaseYPosition : BEQ .return2
    BCC .doRise

  .return2:
    RTS

  .doRise:
    LDA.W #FXRisingFunction_LavaAcid_WaitToRise : STA.W FX_RisingFunction

  .return3:
    RTS


;;; $B367: FX rising function - lava/acid - wait to rise ;;;
FXRisingFunction_LavaAcid_WaitToRise:
    JSR Handle_Earthquake_SoundEffect
    LDA.W #$0015 : STA.W EarthquakeType
    LDA.W #$0020 : TSB.W EarthquakeTimer
    DEC.W FX_Timer : BNE .return
    LDA.W #FXRisingFunction_LavaAcid_Rising : STA.W FX_RisingFunction

  .return:
    RTS


;;; $B382: FX rising function - lava/acid - rising ;;;
FXRisingFunction_LavaAcid_Rising:
    JSR Handle_Earthquake_SoundEffect
    LDA.W #$0015 : STA.W EarthquakeType
    LDA.W #$0020 : TSB.W EarthquakeTimer
    JSR RaiseOrLower_FX
    BCS .reachedTarget
    RTS

  .reachedTarget:
    STZ.W FX_YSubVelocity
    LDA.W #FXRisingFunction_LavaAcid_Normal : STA.W FX_RisingFunction
    RTS


;;; $B3A1: Lava sound effects ;;;
Lava_SoundEffects:
; Sound library 2. Chosen randomly from the following
    db $12,$13,$14,$12,$13,$14,$12,$13


;;; $B3A9: Instruction - lava sound timer = 70h ;;;
Instruction_LavaSoundTimer_70:
;; Parameters:
;;     X: HDMA object index
    LDA.W #$0070 : STA.W HDMAObject_Var2,X
    RTS


;;; $B3B0: Pre-instruction - lava/acid BG3 Y scroll ;;;
PreInstruction_LavaAcid_BG3YScroll:
; For on-screen lava/acid,
; the calculation 200h - [A] at $B477 is equivalent to 100h + (Y position of screen on lava/acid)
; (100h is the offset of lava/acid in the BG3 tilemap)

; As far as I can tell, the HDMA done here is completely pointless and a big waste of time and space
; I suspect that lava/acid was a copy+paste job from water FX, and this BG3 HDMA is a leftover by-product
; The HDMA set up here writes the zero BG3 Y scroll on every scanline up until 8 pixels above the FX tilemap starts,
; and then writes the calculated [$7E:9C02] BG3 Y scroll for the remaining scanlines
; But there's (more than) a full screen of transparent padding before the FX tilemap, so this is completely unnecessary
; It would be sufficient to set $7E:CADC instead of $7E:9C02 at $B41A to set the BG3 Y position via *the* BG3 scroll HDMA object
    PHB
    LDA.W LayerBlending_Layer3Config : STA.W LayerBlending_Config
    LDA.W TimeIsFrozenFlag : BEQ .timeNotFrozen
    PLB
    RTL

  .timeNotFrozen:
    REP #$30
    PEA .manualReturn-1
    JMP.W (FX_RisingFunction)

  .manualReturn:
    JSR Handle_Tide
    SEP #$10
    LDA.W FX_BaseYSubPosition : CLC : ADC.W FX_YSubOffset : STA.W FX_LavaAcidYSubPosition
    LDA.W FX_BaseYPosition : ADC.W FX_YOffset : STA.W FX_LavaAcidYPosition
    LDA.B DP_BG1XScroll : STA.L BG3XPosition
    LDA.W #$0000 : STA.L LavaAcidBG3YScrollHDMADataTable
    LDA.W #$0000 : STA.L BG3YPosition
    LDA.W FX_LavaAcidYPosition : BMI .offScreen
    SEC : SBC.W Layer1YPosition : BEQ +
    BPL .positive

+   EOR.W #$001F : AND.W #$001F : ORA.W #$0100
    BRA .merge

  .positive:
    CMP.W #$0100 : BCC .onScreen

  .offScreen:
    LDA.W #$0000
    BRA .merge

  .onScreen:
    EOR.W #$00FF : AND.W #$00FF

  .merge:
    STA.L LavaAcidBG3YScrollHDMADataTable+2
    LDX.W HDMAObject_Index
    LDA.W FX_Type : CMP.W #$0002 : BNE +
    LDA.W FX_LavaAcidYPosition : BMI +
    DEC.W HDMAObject_Var2,X : BNE +
    LDA.W #$0070 : STA.W HDMAObject_Var2,X
    LDA.W RandomNumberSeed : AND.W #$0007 : TAY
    LDA.W Lava_SoundEffects,Y : AND.W #$00FF
    JSL QueueSound_Lib2_Max6

+   LDA.W RandomNumberSeed : XBA : STA.W RandomNumberSeed
    LDX.W HDMAObject_Index
    LDA.W HDMAObject_ChannelIndicesBanks,X : AND.W #$00FF : TAY
    LDA.W FX_LavaAcidYPosition : BMI .negative
    SEC : SBC.W Layer1YPosition
    CLC : ADC.W #$0100 : BPL +
    LDA.W #$00FF
    BRA .merge2

+   CMP.W #$0200 : BCC .merge2

  .negative:
    LDA.W #$01FF

  .merge2:
    EOR.W #$01FF : INC : AND.W #$03FF : STA.B DP_Temp12
    LDA.B DP_Temp12 : ASL : CLC : ADC.B DP_Temp12 ; >.< LDA
    ADC.W #IndirectHDMATable_LavaAcid_BG3Yscroll : STA.W HDMAObject_TablePointers,X
    PLB
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $B48E: Unused ;;;
UNUSED_WaveDisplacementTable_88B48E:
; Wave displacement table. Same as the data at Setup_LavaAcid_BG2YScrollDataTable_VerticallyWavy_waveDisplacementTable
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B4CE: Instruction - HDMA object phase decrease timer = 1 ;;;
Instruction_HDMAObject_PhaseDecreaseTimer_1:
;; Parameters:
;;     X: HDMA object index
    LDA.W #$0001 : STA.W HDMAObject_Var1,X
    RTS


;;; $B4D5: Pre-instruction - lava/acid BG2 Y scroll ;;;
PreInstruction_LavaAcid_BG2YScroll:
    PHB
    LDA.B DP_BG2YScroll : STA.L LavaAcidBG2YScrollHDMADataTable-2
    LDA.W TimeIsFrozenFlag : BNE .timeNotFrozen
    LDA.W FX_LiquidOptions : BIT.W #$0006 : BNE .wavy

  .timeNotFrozen:
    LDX.W HDMAObject_Index
    JSR Setup_LavaAcid_BG2YScrollDataTable_NotWavy
    BRA .merge

  .wavy:
    BIT.W #$0002 : BNE .verticallyWavy
    LDX.W HDMAObject_Index
    JSR Setup_LavaAcid_BG2YScrollDataTable_HorizontallyWavy
    BRA .merge

  .verticallyWavy:
    LDX.W HDMAObject_Index
    JSR Setup_LavaAcid_BG2YScrollDataTable_VerticallyWavy

  .merge:
    LDX.W HDMAObject_Index
    LDA.B DP_BG2YScroll : AND.W #$000F : STA.B DP_Temp12
    LDA.B DP_Temp12 : ASL : CLC : ADC.B DP_Temp12
    CLC : ADC.W #IndirectHDMATable_LavaAcidBG2_Yscroll : STA.W HDMAObject_TablePointers,X
    PLB
    RTL


;;; $B51D: Set up lava/acid BG2 Y scroll data table - not wavy ;;;
Setup_LavaAcid_BG2YScrollDataTable_NotWavy:
;; Parameters:
;;     X: HDMA object index
    SEP #$20
    LDY.W HDMAObject_ChannelIndicesBanks,X
    LDA.B #$10 : STA.W $4301,Y
    REP #$20
    PHX
    LDX.B #$1E
    LDA.B DP_BG2YScroll : AND.W #$01FF

  .loop:
    STA.L LavaAcidBG2YScrollHDMADataTable,X
    DEX #2 : BPL .loop
    PLX
    RTS


;;; $B53B: Set up lava/acid BG2 Y scroll data table - horizontally wavy ;;;
Setup_LavaAcid_BG2YScrollDataTable_HorizontallyWavy:
;; Parameters:
;;     X: HDMA object index

; OK so this is suddenly now BG2 *X* scroll here, but this effect is never used in vanilla, so I'm not changing the name
    SEP #$20
    LDY.W HDMAObject_ChannelIndicesBanks,X
    LDA.B #$0F : STA.W $4301,Y
    REP #$20
    DEC.W HDMAObject_Var1,X : BNE .nonZeroTimer
    LDA.W #$0006 : STA.W HDMAObject_Var1,X
    LDA.W HDMAObject_Var0,X : DEC #2 : AND.W #$001E : STA.W HDMAObject_Var0,X

  .nonZeroTimer:
    PHX
    LDY.W HDMAObject_Var0,X
    LDX.B #$1E
    LDA.W #$000F : STA.B DP_Temp12

  .loop:
    LDA.B DP_BG2XScroll : CLC : ADC.W .waveDisplacementTable,Y : AND.W #$01FF : STA.L LavaAcidBG2YScrollHDMADataTable,X
    TYA : DEC #2 : AND.W #$001E : TAY
    TXA : DEC #2 : AND.W #$001E : TAX
    DEC.B DP_Temp12 : BPL .loop
    PLX
    RTS

  .waveDisplacementTable:
    dw $0000,$0000,$0001,$0001,$0001,$0001,$0000,$0000
    dw $FFFF,$FFFF,$FFFF,$FFFF,$0000,$0000,$0000,$0000


;;; $B5A9: Set up lava/acid BG2 Y scroll data table - vertically wavy ;;;
Setup_LavaAcid_BG2YScrollDataTable_VerticallyWavy:
;; Parameters:
;;     X: HDMA object index
    SEP #$20
    LDY.W HDMAObject_ChannelIndicesBanks,X
    LDA.B #$10 : STA.W $4301,Y
    REP #$20
    DEC.W HDMAObject_Var1,X : BNE .nonZeroTimer
    LDA.W #$0004 : STA.W HDMAObject_Var1,X
    LDA.W HDMAObject_Var0,X : DEC #2 : AND.W #$001E : STA.W HDMAObject_Var0,X

  .nonZeroTimer:
    PHX
    LDA.B DP_BG2YScroll : AND.W #$000F : ASL : PHA
    CLC : ADC.W HDMAObject_Var0,X : AND.W #$001E : TAY
    PLA : CLC : ADC.W #$001E : AND.W #$001E : TAX
    LDA.W #$000F : STA.B DP_Temp12

  .loop:
    LDA.B DP_BG2YScroll : CLC : ADC.W .waveDisplacementTable,Y : AND.W #$01FF : STA.L LavaAcidBG2YScrollHDMADataTable,X
    TXA : DEC #2 : AND.W #$001E : TAX
    TYA : DEC #2 : AND.W #$001E : TAY
    DEC.B DP_Temp12 : BPL .loop
    PLX
    RTS

  .waveDisplacementTable:
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000


;;; $B62A: Indirect HDMA table - lava/acid BG3 Y scroll ;;;
IndirectHDMATable_LavaAcid_BG3Yscroll:
; 81h,$9C00 x F0h
; 81h,$9C02 x 190h
; 60h,$9C02 x 2
; 0

; Disregarding the unnecessary nature of the lava/acid BG3 Y scroll HDMA (see $B3B0), this table is needlessly large
; There's no reason to have more than E0h scanlines of $9C02 (even less if the HUD is accounted for)
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $60 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $60 : dw LavaAcidBG3YScrollHDMADataTable+2
    db $00


if !FEATURE_KEEP_UNREFERENCED
;;; $BDB1: Unused. Indirect HDMA table ;;;
UNUSED_IndirectHDMATable_88BDB1:
; $7E:9C44 is set to [BG2 Y scroll] by the lava/acid BG2 Y scroll pre-instruction,
; it's possible that this was the upper half of the following table, and this allowed for the wavy effect to be limited to,
; say, in the acid/lava or just above it
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C0B1: Indirect HDMA table - lava/acid BG2 Y scroll ;;;
IndirectHDMATable_LavaAcidBG2_Yscroll:
    db $81 : dw LavaAcidBG2YScrollHDMADataTable
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+4
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+6
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+8
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$10
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$12
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$14
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$16
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$18
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+4
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+6
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+8
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$10
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$12
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$14
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$16
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$18
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+4
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+6
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+8
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$10
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$12
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$14
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$16
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$18
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+4
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+6
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+8
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$10
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$12
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$14
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$16
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$18
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+4
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+6
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+8
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$10
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$12
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$14
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$16
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$18
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+4
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+6
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+8
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$10
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$12
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$14
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$16
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$18
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+4
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+6
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+8
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$10
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$12
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$14
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$16
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$18
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+4
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+6
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+8
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$10
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$12
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$14
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$16
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$18
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+4
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+6
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+8
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$10
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$12
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$14
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$16
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$18
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+4
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+6
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+8
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$10
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$12
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$14
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$16
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$18
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+4
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+6
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+8
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$10
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$12
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$14
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$16
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$18
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+4
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+6
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+8
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$10
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$12
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$14
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$16
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$18
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+4
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+6
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+8
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$10
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$12
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$14
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$16
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$18
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+4
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+6
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+8
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$10
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$12
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$14
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$16
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$18
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+4
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+6
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+8
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$10
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$12
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$14
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$16
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$18
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+4
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+6
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+8
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$10
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$12
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$14
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$16
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$18
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+2
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+4
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+6
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+8
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$E
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$10
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$12
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$14
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$16
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$18
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1A
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1C
    db $81 : dw LavaAcidBG2YScrollHDMADataTable+$1E


;;; $C3E1: Instruction list - lava/acid BG3 Y scroll ;;;
InstList_LavaAcidBG3_Yscroll:
    dw Instruction_HDMAObject_HDMATableBank : db $88
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_LavaSoundTimer_70
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_LavaAcid_BG3YScroll
    dw Instruction_HDMAObject_Sleep


;;; $C3F0: Instruction list - lava/acid BG2 Y scroll ;;;
InstList_LavaAcidBG2_Yscroll:
    dw Instruction_HDMAObject_HDMATableBank : db $88
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObject_PhaseDecreaseTimer_1
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_LavaAcid_BG2YScroll
    dw Instruction_HDMAObject_Sleep


;;; $C3FF: FX type 6: water ;;;
FXType_6_Water:
    LDA.W #FXRisingFunction_Water_Normal : STA.W FX_RisingFunction
    LDA.W FX_BaseYPosition : STA.W FX_YPosition
    JSL Spawn_HDMAObject
    db $42,$11
    dw InstList_Water_BG3_Xscroll
    LDA.W FX_LiquidOptions : AND.W #$0002 : BEQ .notWavy
    JSL Spawn_HDMAObject
    db $42,$0F
    dw InstList_Water_BG2_Xscroll

  .notWavy:
    JSL Spawn_BG3_Scroll_HDMA_Object
    RTL


;;; $C428: FX rising function - water - normal ;;;
FXRisingFunction_Water_Normal:
    LDA.W FX_YSubVelocity : BEQ .return3
    BMI .negative
    LDA.W FX_TargetYPosition : CMP.W FX_BaseYPosition : BEQ .return1
    BCS .doRise

  .return1:
    RTS

  .negative:
    LDA.W FX_TargetYPosition : CMP.W FX_BaseYPosition : BEQ .return2
    BCC .doRise

  .return2:
    RTS

  .doRise:
    LDA.W #FXRisingFunction_Water_WaitToRise : STA.W FX_RisingFunction

  .return3:
    RTS


;;; $C44C: FX rising function - water - wait to rise ;;;
FXRisingFunction_Water_WaitToRise:
    DEC.W FX_Timer : BNE .return
    LDA.W #FXRisingFunction_Water_Rising : STA.W FX_RisingFunction

  .return:
    RTS


;;; $C458: FX rising function - water - rising ;;;
FXRisingFunction_Water_Rising:
    JSR RaiseOrLower_FX
    BCC .return
    LDA.W #FXRisingFunction_Water_Normal : STA.W FX_RisingFunction
    STZ.W FX_YSubVelocity

  .return:
    RTS


;;; $C467: Instruction - HDMA object phase increase timer = 1 ;;;
Instruction_HDMA_Object_Phase_Increase_Timer_1:
;; Parameters:
;;     X: HDMA object index
    LDA.W #$0001 : STA.W HDMAObject_Var1,X
    RTS


;;; $C46E: Wave displacement table - water ;;;
WaveDisplacementTable_Water:
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000


;;; $C48E: Pre-instruction - water BG3 X scroll ;;;
PreInstruction_Water_BG3_Xscroll:
; For on-screen water,
; the calculation 200h - [A] at $C569 is equivalent to 100h + (Y position of screen on FX)
; (100h is the offset of water in the BG3 tilemap)
    PHB
    LDA.W LayerBlending_Layer3Config : STA.W LayerBlending_Config
    LDA.W TimeIsFrozenFlag : BEQ .notFrozen
    PLB
    RTL

  .notFrozen:
    PHX : PHY
    REP #$30
    PEA .functionReturn-1
    JMP.W (FX_RisingFunction)

  .functionReturn:
    JSR Handle_Tide
    SEP #$10
    LDA.W FX_BaseYSubPosition : CLC : ADC.W FX_YSubOffset : STA.W FX_YSubPosition
    LDA.W FX_BaseYPosition : ADC.W FX_YOffset : STA.W FX_YPosition
    LDA.W FX_YPosition : BMI .negative
    SEC : SBC.W Layer1YPosition : BEQ +
    BPL .notAboveScreen

+   EOR.W #$001F : AND.W #$001F : ORA.W #$0100
    BRA .merge

  .notAboveScreen:
    CMP.W #$0100 : BCC .onScreen

  .negative:
    LDA.W #$0000
    BRA .merge

  .onScreen:
    EOR.W #$00FF : AND.W #$00FF

  .merge:
    STA.L BG3YPosition
    LDX.W HDMAObject_Index
    LDA.W HDMAObject_Var2,X : XBA : BPL .lowByte
    ORA.W #$FF00
    BRA +

  .lowByte:
    AND.W #$00FF

+   CLC : ADC.W Layer1XPosition : STA.B DP_Temp14
    DEC.W HDMAObject_Var1,X : BNE .loopSetup
    LDA.W #$000A : STA.W HDMAObject_Var1,X
    LDA.W HDMAObject_Var0,X : INC #2 : AND.W #$001E : STA.W HDMAObject_Var0,X

  .loopSetup:
    LDA.W HDMAObject_Var0,X : TAX
    LDY.B #$1E

  .loop:
    LDA.B DP_Temp14 : CLC : ADC.W WaveDisplacementTable_Water,Y : STA.L WaterBG3XScrollHDMADataTable,X
    DEX #2 : TXA : AND.W #$001E : TAX
    DEY #2 : BPL .loop
    LDX.W HDMAObject_Index
    LDA.W FX_LiquidOptions : AND.W #$0001 : BEQ +
    LDA.W HDMAObject_Var2,X : CLC : ADC.W #$0040 : STA.W HDMAObject_Var2,X

+   LDX.W HDMAObject_Index
    LDA.W FX_YPosition : BMI .negative2
    SEC : SBC.W Layer1YPosition
    CLC : ADC.W #$0100 : BPL .lessThan100
    AND.W #$000F : ORA.W #$0100
    BRA .merge2

  .lessThan100:
    CMP.W #$0200 : BCC .merge2

  .negative2:
    LDA.W #$01FF

  .merge2:
    EOR.W #$01FF : INC : AND.W #$03FF : STA.B DP_Temp12
    LDA.B DP_Temp12 : ASL : CLC : ADC.B DP_Temp12
    ADC.W #IndirectHDMATable_WaterBG3XScroll_0 : STA.W HDMAObject_TablePointers,X
    PLY : PLX : PLB
    RTL


;;; $C582: Instruction - HDMA object phase increase timer = 1 ;;;
Instruction_HDMA_Object_Phase_Increase_Timer_1_duplicate:
;; Parameters:
;;     X: HDMA object index

; Clone of Instruction_HDMA_Object_Phase_Increase_Timer_1
    LDA.W #$0001 : STA.W HDMAObject_Var1,X
    RTS


;;; $C589: Pre-instruction - water BG2 X scroll ;;;
PreInstruction_Water_BG2_Xscroll:
;; Parameters:
;;     X: HDMA object index

; For on-screen water,
; the calculation 1FFh - [A] at $C5CE is equivalent to FFh + (Y position of screen on FX)
; (100h is the offset of water in the BG3 tilemap, and I think FFh is an off-by-one error)
    PHB
    LDA.B DP_BG2XScroll : STA.L WaterBG2XScrollHDMADataTable-4
    LDA.W TimeIsFrozenFlag : BNE .notWavy
    LDA.W FX_LiquidOptions : AND.W #$0002 : BNE .wavy
    STZ.W HDMAObject_ChannelBitflags,X

  .notWavy:
    JSR Setup_Water_BG2_Xscroll_DataTable_NotWavy
    BRA .merge

  .wavy:
    JSR Setup_Water_BG2_Xscroll_DataTable_Wavy

  .merge:
    LDA.W HDMAObject_ChannelIndicesBanks,X : AND.W #$00FF : TAY
    LDA.W FX_YPosition : BMI .negative
    SEC : SBC.W Layer1YPosition
    CLC : ADC.W #$0100 : BPL .lessThan100
    AND.W #$000F : ORA.W #$0100
    BRA .merge2

  .lessThan100:
    CMP.W #$0200 : BCC .merge2

  .negative:
    LDA.W #$01FF

  .merge2:
    EOR.W #$01FF : AND.W #$03FF : STA.B DP_Temp12
    LDA.B DP_Temp12 : ASL : CLC : ADC.B DP_Temp12
    ADC.W #IndirectHDMATable_WaterBG2XScroll : STA.W HDMAObject_TablePointers,X
    PLB
    RTL


;;; $C5E4: Set up water BG2 X scroll data table - wavy ;;;
Setup_Water_BG2_Xscroll_DataTable_Wavy:
;; Parameters:
;;     X: HDMA object index
    DEC.W HDMAObject_Var1,X : BNE +
    LDA.W #$0006 : STA.W HDMAObject_Var1,X
    LDA.W HDMAObject_Var0,X : INC #2 : AND.W #$001E : STA.W HDMAObject_Var0,X

+   PHX
    LDA.B DP_BG2YScroll : AND.W #$000F : ASL : PHA
    CLC : ADC.W HDMAObject_Var0,X : AND.W #$001E : TAY
    PLA : CLC : ADC.W #$001E : AND.W #$001E : TAX
    LDA.W #$000F : STA.B DP_Temp12

  .loop:
    LDA.B DP_BG2XScroll : CLC : ADC.W WaveDisplacementTable_Water,Y : STA.L WaterBG2XScrollHDMADataTable,X
    DEX #2 : TXA : AND.W #$001E : TAX
    DEY #2 : TYA : AND.W #$001E : TAY
    DEC.B DP_Temp12 : BPL .loop
    PLX
    RTS


;;; $C636: Set up water BG2 X scroll data table - not wavy ;;;
Setup_Water_BG2_Xscroll_DataTable_NotWavy:
    PHX
    LDX.B #$1E
    LDA.B DP_BG2XScroll

  .loop:
    STA.L WaterBG2XScrollHDMADataTable,X
    DEX #2 : BPL .loop
    PLX
    RTS


;;; $C645: Indirect HDMA table - water BG3 X scroll ;;;
IndirectHDMATable_WaterBG3XScroll_0:
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry

IndirectHDMATable_WaterBG3XScroll_1:
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $81 : dw WaterBG3XScrollHDMADataTable
    db $81 : dw WaterBG3XScrollHDMADataTable+2
    db $81 : dw WaterBG3XScrollHDMADataTable+4
    db $81 : dw WaterBG3XScrollHDMADataTable+6
    db $81 : dw WaterBG3XScrollHDMADataTable+8
    db $81 : dw WaterBG3XScrollHDMADataTable+$A
    db $81 : dw WaterBG3XScrollHDMADataTable+$C
    db $81 : dw WaterBG3XScrollHDMADataTable+$E
    db $81 : dw WaterBG3XScrollHDMADataTable+$10
    db $81 : dw WaterBG3XScrollHDMADataTable+$12
    db $81 : dw WaterBG3XScrollHDMADataTable+$14
    db $81 : dw WaterBG3XScrollHDMADataTable+$16
    db $81 : dw WaterBG3XScrollHDMADataTable+$18
    db $81 : dw WaterBG3XScrollHDMADataTable+$1A
    db $81 : dw WaterBG3XScrollHDMADataTable+$1C
    db $81 : dw WaterBG3XScrollHDMADataTable+$1E
    db $00


;;; $CF46: Indirect HDMA table - water BG2 X scroll ;;;
IndirectHDMATable_WaterBG2XScroll:
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable-4
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $81 : dw WaterBG2XScrollHDMADataTable
    db $81 : dw WaterBG2XScrollHDMADataTable+2
    db $81 : dw WaterBG2XScrollHDMADataTable+4
    db $81 : dw WaterBG2XScrollHDMADataTable+6
    db $81 : dw WaterBG2XScrollHDMADataTable+8
    db $81 : dw WaterBG2XScrollHDMADataTable+$A
    db $81 : dw WaterBG2XScrollHDMADataTable+$C
    db $81 : dw WaterBG2XScrollHDMADataTable+$E
    db $81 : dw WaterBG2XScrollHDMADataTable+$10
    db $81 : dw WaterBG2XScrollHDMADataTable+$12
    db $81 : dw WaterBG2XScrollHDMADataTable+$14
    db $81 : dw WaterBG2XScrollHDMADataTable+$16
    db $81 : dw WaterBG2XScrollHDMADataTable+$18
    db $81 : dw WaterBG2XScrollHDMADataTable+$1A
    db $81 : dw WaterBG2XScrollHDMADataTable+$1C
    db $81 : dw WaterBG2XScrollHDMADataTable+$1E
    db $00


;;; $D847: Instruction list - water BG2 X scroll ;;;
InstList_Water_BG2_Xscroll:
    dw Instruction_HDMAObject_HDMATableBank : db $88
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMA_Object_Phase_Increase_Timer_1_duplicate
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_Water_BG2_Xscroll
    dw Instruction_HDMAObject_Sleep


;;; $D856: Instruction list - water BG3 X scroll ;;;
InstList_Water_BG3_Xscroll:
    dw Instruction_HDMAObject_HDMATableBank : db $88
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMA_Object_Phase_Increase_Timer_1
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_Water_BG3_Xscroll
    dw Instruction_HDMAObject_Sleep


;;; $D865: Spawn BG3 scroll HDMA object ;;;
Spawn_BG3_Scroll_HDMA_Object:
; Applies an HDMA that sets BG3 scrolls to [$7E:CAD8]/[$7E:CADA] every line of the HUD and [$7E:CADC]/[$7E:CADE] after the last line of the HUD
; Spawned by:
;     Lava, acid, water, rain, spores, Tourian entrance statue
;     Draygon's body initialisation
;     Door transition after scrolling finishes and before the screen fades in
    JSL SpawnHDMAObject_SlotA_Channel80_Index70
    db $43,$11
    dw InstList_BG3Scroll_0
    RTL


;;; $D86E: RTL ;;;
RTL_88D86E:
    RTL


;;; $D86F: Indirect HDMA table - BG3 scroll ;;;
IndirectHDMATable_BG3Scroll:
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw HUDBG3XPosition
    db $81 : dw BG3XPosition
    db $00


;;; $D8D0: Instruction list - BG3 scroll ;;;
InstList_BG3Scroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E

InstList_BG3Scroll_1:
    dw $7FFF,IndirectHDMATable_BG3Scroll
    dw Instruction_HDMAObject_GotoY
    dw InstList_BG3Scroll_1


;;; $D8DE: FX type 28h: Ceres Ridley ;;;
FXType_28_CeresRidley:
    JSL Spawn_HDMAObject
    db $40,$05
    dw InstList_CeresRidleyMode_BGTileSize_0
    JSL Spawn_HDMAObject
    db $00,$2C
    dw InstList_CeresRidley_MainScreenLayers_0
    RTL


;;; $D8EF: RTL ;;;
RTL_88D8EF:
    RTL


;;; $D8F0: Indirect HDMA table - Ceres Ridley mode and BG tile size ;;;
IndirectHDMATable_CeresRidleyMode_BGTileSize:
    db $1F : dw CeresMode7HDMATables
    db $60 : dw CeresMode7HDMATables+1
    db $50 : dw CeresMode7HDMATables+1
    db $10 : dw CeresMode7HDMATables
    db $00


;;; $D8FD: HDMA table - Ceres Ridley main screen layers ;;;
IndirectHDMATable_CeresRidleyMainScreenLayers:
    db $1F,$04 ;         BG3
    db $60,$13 ; BG1/BG2/    sprites
    db $50,$13 ; BG1/BG2/    sprites
    db $10,$12 ;     BG2/    sprites
    db $00



;;; $D906: Instruction list - Ceres Ridley mode and BG tile size ;;;
InstList_CeresRidleyMode_BGTileSize_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $00
    dw Instruction_VideoMode_for_HUD_and_Floor_1

InstList_CeresRidleyMode_BGTileSize_1:
    dw $7FFF,IndirectHDMATable_CeresRidleyMode_BGTileSize
    dw Instruction_HDMAObject_GotoY
    dw InstList_CeresRidleyMode_BGTileSize_1


;;; $D916: Instruction - video mode for HUD and floor = 1 ;;;
Instruction_VideoMode_for_HUD_and_Floor_1:
    LDA.W #$0009 : STA.W CeresMode7HDMATables
    RTS


;;; $D91D: Instruction list - Ceres Ridley main screen layers ;;;
InstList_CeresRidley_MainScreenLayers_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88

InstList_CeresRidley_MainScreenLayers_1:
    dw $7FFF,IndirectHDMATable_CeresRidleyMainScreenLayers
    dw Instruction_HDMAObject_GotoY
    dw InstList_CeresRidley_MainScreenLayers_1


;;; $D928: FX type 2Ah: Ceres elevator ;;;
FXType_2A_CeresElevator:
    JSL Spawn_HDMAObject
    db $40,$05
    dw InstList_CeresElevatorMode_BGTileSize_0
    RTL


;;; $D931: RTL ;;;
RTL_88D931:
    RTL


;;; $D932: Indirect HDMA table - Ceres elevator mode and BG tile size ;;;
IndirectHDMATable_CeresElevatorMode_BGTileSize:
    db $1F : dw CeresMode7HDMATables
    db $70 : dw CeresMode7HDMATables+1
    db $00


;;; $D939: Instruction list - Ceres elevator mode and BG tile size ;;;
InstList_CeresElevatorMode_BGTileSize_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $00
    dw Instruction_VideoMode_for_HUD_1

InstList_CeresElevatorMode_BGTileSize_1:
    dw $7FFF,IndirectHDMATable_CeresElevatorMode_BGTileSize
    dw Instruction_HDMAObject_GotoY
    dw InstList_CeresElevatorMode_BGTileSize_1


;;; $D949: Instruction - video mode for HUD = 1 ;;;
Instruction_VideoMode_for_HUD_1:
    LDA.W #$0009 : STA.W CeresMode7HDMATables
    RTS


;;; $D950: FX type Ah: rain ;;;
FXType_A_Rain:
    SEP #$20
    LDA.B #$5C : STA.B DP_GameplayBG1TilemapAddrSize
    REP #$20
    JSL Spawn_HDMAObject
    db $43,$11
    dw InstList_Rain_BG3Scroll_0
    JSL Spawn_BG3_Scroll_HDMA_Object
    LDY.W #AnimatedTilesObject_Rain
    JSL Spawn_AnimatedTilesObject
    RTL


;;; $D96C: Instruction list - rain BG3 scroll ;;;
InstList_Rain_BG3Scroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObjectBG3XVelocity
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_RainBG3Scroll

InstList_Rain_BG3Scroll_1:
    dw $7FFF,IndirectHDMATable_BG3Scroll
    dw Instruction_HDMAObject_GotoY
    dw InstList_Rain_BG3Scroll_1


;;; $D981: Instruction - HDMA object BG3 X velocity = randomly ±400h/±600h ;;;
Instruction_HDMAObjectBG3XVelocity:
;; Parameters:
;;     X: HDMA object index
    PHX
    LDA.W RandomNumberSeed : LSR : AND.W #$0006 : TAX
    LDA.W .BG3XVelocities,X
    PLX
    STA.W HDMAObject_Var3,X
    RTS

  .BG3XVelocities:
; BG3 X velocities. Unit 1/100h px/frame
    dw $FA00,$0600,$FC00,$0400


;;; $D99A: Unused. Indirect HDMA table ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_IndirectHDMATable_88D99A:
; Looks like a more space-efficient version of IndirectHDMATable_BG3Scroll
    db $1F : dw $CAD8
    db $81 : dw $CADC
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D9A1: Pre-instruction - rain BG3 scroll ;;;
PreInstruction_RainBG3Scroll:
;; Parameters:
;;     X: HDMA object index
    PHB
    LDY.B #$5C : STY.B DP_GameplayBG1TilemapAddrSize
    LDA.W LayerBlending_Layer3Config : STA.W LayerBlending_Config
    LDA.W TimeIsFrozenFlag : BEQ .notFrozen
    PLB
    RTL

  .notFrozen:
    LDA.W HDMAObject_Var4,X : SEC : SBC.W Layer1YPosition : STA.B DP_Temp12
    LDA.W HDMAObject_Var0,X : XBA : BPL .lowByteD9C7
    ORA.W #$FF00
    BRA +

  .lowByteD9C7:
    AND.W #$00FF

+   CLC : ADC.B DP_Temp12 : STA.L BG3YPosition
    LDA.W HDMAObject_Var0,X : CLC : ADC.W #$FA00 : STA.W HDMAObject_Var0,X
    LDA.W Layer1YPosition : STA.W HDMAObject_Var4,X
    LDA.W HDMAObject_Var5,X : SEC : SBC.W Layer1XPosition : STA.B DP_Temp12
    LDA.W HDMAObject_Var1,X : XBA : BPL .lowByteD9F5
    ORA.W #$FF00
    BRA +

  .lowByteD9F5:
    AND.W #$00FF

+   CLC : ADC.B DP_Temp12 : STA.L BG3XPosition
    LDA.W HDMAObject_Var1,X : CLC : ADC.W HDMAObject_Var3,X : STA.W HDMAObject_Var1,X
    LDA.W Layer1XPosition : STA.W HDMAObject_Var5,X
    PLB
    RTL


;;; $DA11: FX type 8: spores ;;;
FXType_8_Spores:
    SEP #$20
    LDA.B #$5C : STA.B DP_GameplayBG1TilemapAddrSize
    REP #$20
    JSL Spawn_HDMAObject
    db $42,$11
    dw InstList_Spores_BG3_Xscroll_0
    JSL Spawn_BG3_Scroll_HDMA_Object
    LDY.W #AnimatedTilesObject_Spores
    JSL Spawn_AnimatedTilesObject
    RTL


;;; $DA2D: Instruction list - spores BG3 X scroll ;;;
InstList_Spores_BG3_Xscroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_Spores_BG3_Xsscroll

InstList_Spores_BG3_Xscroll_1:
    dw $7FFF,IndirectHDMATable_BG3Scroll
    dw Instruction_HDMAObject_GotoY
    dw InstList_Spores_BG3_Xscroll_1


if !FEATURE_KEEP_UNREFERENCED
;;; $DA40: Unused. Indirect HDMA table ;;;
UNUSED_IndirectHDMATable_88DA40:
; Looks like a more space-efficient version of IndirectHDMATable_BG3Scroll
    db $1F : dw $CAD8
    db $81 : dw $CADC
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DA47: Pre-instruction - spores BG3 X scroll ;;;
PreInstruction_Spores_BG3_Xsscroll:
;; Parameters:
;;     X: HDMA object index
    PHB
    LDY.B #$5C : STY.B DP_GameplayBG1TilemapAddrSize
    LDA.W LayerBlending_Layer3Config : STA.W LayerBlending_Config
    LDA.W TimeIsFrozenFlag : BEQ .notFrozen
    PLB
    RTL

  .notFrozen:
    LDA.W HDMAObject_Var2,X : XBA : BPL .lowByteDA64
    ORA.W #$FF00
    BRA +

  .lowByteDA64:
    AND.W #$00FF

+   CLC : ADC.W Layer1YPosition : STA.L BG3YPosition
    LDA.W HDMAObject_Var2,X : CLC : ADC.W #$FFC0 : STA.W HDMAObject_Var2,X : STA.B DP_Temp14
    LDA.W HDMAObject_Var3,X : XBA : BPL .lowByteDA86
    ORA.W #$FF00
    BRA +

  .lowByteDA86:
    AND.W #$00FF

+   CLC : ADC.W Layer1XPosition : STA.L BG3XPosition : STA.B DP_Temp12
    LDA.W HDMAObject_Var3,X : CLC : ADC.W #$0000 : STA.W HDMAObject_Var3,X
    PLB
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $DA9F: Unused. Handle spores waviness ;;;
UNUSED_HandleSporesWaviness_88DA9F:
;; Parameters:
;;     X: HDMA object index
;;     $12: X position of screen on Samus??
;;     $14: Y position of screen on FX?

; The above routine $DA47 does store values to $12 and $14 that it doesn't use itself,
; however those values don't look right for the usage here, and this routine doesn't PLB before returning,
; which the above routine would need. So I don't think this is an unused section of that routine
    DEC.W HDMAObject_Var1,X : BNE .setupLoop
    LDA.W #$000A : STA.W HDMAObject_Var1,X
    LDA.W HDMAObject_Var0,X : INC #2 : AND.W #$001F : STA.W HDMAObject_Var0,X

  .setupLoop:
    LDA.W HDMAObject_Var0,X : TAX
    LDY.B #$1E

  .loop:
    LDA.B DP_Temp12 : CLC : ADC.W SamusXPosition : ADC.W .waveDisplacementTable,Y : STA.L WaterBG3XScrollHDMADataTable,X
    TXA : DEC #2 : AND.W #$001F : TAX
    DEY #2 : BPL .loop
    LDX.W HDMAObject_Index
    LDA.W #$FFF0 : TRB.B DP_Temp14
    LDA.B DP_Temp14 : ASL : CLC : ADC.B DP_Temp14
    ADC.W #IndirectHDMATable_WaterBG3XScroll_1 : STA.W HDMAObject_TablePointers,X
    RTL

  .waveDisplacementTable:
; Same as WaveDisplacementTable_Water
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DB08: FX type Ch: fog ;;;
FXType_C_Fog:
    SEP #$20
    LDA.B #$5C : STA.B DP_GameplayBG1TilemapAddrSize
    REP #$20
    JSL Spawn_HDMAObject
    db $43,$11
    dw InstList_Fog_BG3_Scroll_0
    RTL


;;; $DB19: Instruction list - fog BG3 scroll ;;;
InstList_Fog_BG3_Scroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw RTS_88DB2E
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_Fog_BG3Scroll

InstList_Fog_BG3_Scroll_1:
    dw $7FFF,IndirectHDMATable_BG3Scroll
    dw Instruction_HDMAObject_GotoY
    dw InstList_Fog_BG3_Scroll_1


;;; $DB2E: RTS ;;;
RTS_88DB2E:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $DB2F: Unused. Indirect HDMA table ;;;
UNUSED_IndirectHDMATable_88DB2F:
; Looks like a more space-efficient version of IndirectHDMATable_BG3Scroll
    db $1F : dw $CAD8
    db $81 : dw $CADC
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DB36: Pre-instruction - fog BG3 scroll ;;;
PreInstruction_Fog_BG3Scroll:
;; Parameters:
;;     X: HDMA object index
    PHB
    LDY.B #$5C : STY.B DP_GameplayBG1TilemapAddrSize
    LDA.W LayerBlending_Layer3Config : STA.W LayerBlending_Config
    LDA.W TimeIsFrozenFlag : BEQ .timeNotFrozen
    PLB
    RTL

  .timeNotFrozen:
    LDA.W HDMAObject_Var0,X : XBA : BPL .lowByteDB53
    ORA.W #$FF00
    BRA +

  .lowByteDB53:
    AND.W #$00FF

+   CLC : ADC.W Layer1YPosition : STA.L BG3YPosition
    LDA.W HDMAObject_Var0,X : CLC : ADC.W #$FFC0 : STA.W HDMAObject_Var0,X
    LDA.W HDMAObject_Var1,X : XBA : BPL .lowByteDB73
    ORA.W #$FF00
    BRA +

  .lowByteDB73:
    AND.W #$00FF

+   CLC : ADC.W Layer1XPosition : STA.L BG3XPosition
    LDA.W HDMAObject_Var1,X : CLC : ADC.W #$0050 : STA.W HDMAObject_Var1,X
    PLB
    RTL


;;; $DB8A: FX type 26h: Tourian entrance statue ;;;
FXType_26_TourianEntranceStatue:
    LDA.W #$000A
    JSL CheckIfEvent_inA_HasHappened
    BCC .tourianLocked
    JSL Spawn_Hardcoded_PLM
    db $06,$0C
    dw PLMEntries_clearAccessToTourianElevator
    LDA.W #$0202 : STA.L Scrolls

  .tourianLocked:
    SEP #$20
    LDA.B #$4A : STA.B DP_BG2TilemapAddrSize
    REP #$20
    LDA.W #FXRisingFunction_Water_Normal : STA.W FX_RisingFunction
    LDA.W FX_BaseYPosition : STA.W FX_YPosition
    JSL Spawn_HDMAObject
    db $42,$11
    dw InstList_Water_BG3_Xscroll
    JSL Spawn_HDMAObject
    db $42,$10
    dw InstList_TourianEntranceStatue_BG2Yscroll_0
    JSL Spawn_BG3_Scroll_HDMA_Object
    RTL


;;; $DBCB: Set Tourian entrance statue BG2 Y scroll ;;;
Set_TourianEntranceStatue_BG2_Yscroll:
;; Parameters:
;;     X: HDMA object index
    LDA.W HDMAObject_Var1,X : CLC : ADC.W Layer1YPosition : STA.L TourianStatueBG2YScroll
    RTS


;;; $DBD7: Pre-instruction - Tourian entrance statue BG2 Y scroll - wait for locks to be released ;;;
PreInst_TourianEntranceStatue_BG2_Yscroll_WaitForUnlock:
;; Parameters:
;;     X: HDMA object index
    PHP
    REP #$30
    LDA.W #$0006
    JSL CheckIfEvent_inA_HasHappened
    BCC .setYscroll
    LDA.W #$0007
    JSL CheckIfEvent_inA_HasHappened
    BCC .setYscroll
    LDA.W #$0008
    JSL CheckIfEvent_inA_HasHappened
    BCC .setYscroll
    LDA.W #$0009
    JSL CheckIfEvent_inA_HasHappened
    BCC .setYscroll
    LDA.W #$0010 : TSB.W TourianStatueAnimationState
    LDA.W TourianStatueAnimationState : BMI .setYscroll
    LDA.W #$012C : STA.W HDMAObject_Var2,X
    LDX.W HDMAObject_Index
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X
    INC.W HDMAObject_InstListPointers,X : INC.W HDMAObject_InstListPointers,X

  .setYscroll:
    JSR Set_TourianEntranceStatue_BG2_Yscroll
    PLP
    RTL


;;; $DC23: Pre-instruction - Tourian entrance statue BG2 Y scroll - descent delay ;;;
PreInst_TourianEntranceStatue_BG2Yscroll_DescentDelay:
;; Parameters:
;;     X: HDMA object index
    JSR Handle_Earthquake_SoundEffect
    LDA.W #$000D : STA.W EarthquakeType
    LDA.W #$0020 : TSB.W EarthquakeTimer
    DEC.W HDMAObject_Var2,X : BPL .setYscroll
    REP #$30
    LDY.W #EnemyProjectile_TourianStatueDustClouds
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDY.W #EnemyProjectile_TourianStatueDustClouds
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDY.W #EnemyProjectile_TourianStatueDustClouds
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDY.W #EnemyProjectile_TourianStatueDustClouds
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    SEP #$10 : REP #$20
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X
    INC.W HDMAObject_InstListPointers,X : INC.W HDMAObject_InstListPointers,X

  .setYscroll:
    JSR Set_TourianEntranceStatue_BG2_Yscroll
    RTL


;;; $DC69: Pre-instruction - Tourian entrance statue BG2 Y scroll - descending ;;;
PreInstruction_TourianEntranceStatue_BG2_Yscroll_Descending:
;; Parameters:
;;     X: HDMA object index
    JSR Handle_Earthquake_SoundEffect
    LDA.W #$000D : STA.W EarthquakeType
    LDA.W #$0020 : TSB.W EarthquakeTimer
    LDA.W TimeIsFrozenFlag : BNE .return
    LDA.W HDMAObject_Var0,X : CLC : ADC.W #$C000 : STA.W HDMAObject_Var0,X
    LDA.W HDMAObject_Var1,X : ADC.W #$FFFF : STA.W HDMAObject_Var1,X
    CMP.W #$FF10 : BNE .setYscroll
    PHX : PHP
    REP #$10
    JSL Spawn_Hardcoded_PLM
    db $06,$0C
    dw PLMEntries_crumbleAccessToTourianElevator
    PLP : PLX
    LDA.W #$000A
    JSL MarkEvent_inA
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X
    INC.W HDMAObject_InstListPointers,X : INC.W HDMAObject_InstListPointers,X

  .setYscroll:
    JSR Set_TourianEntranceStatue_BG2_Yscroll

  .return:
    RTL


;;; $DCBA: Pre-instruction - Tourian entrance statue BG2 Y scroll - enable scrolling ;;;
PreInst_TourianEntranceStatue_BG2Yscroll_EnableScrolling:
;; Parameters:
;;     X: HDMA object index
    LDA.W #$8000 : STA.W TourianStatueFinishedProcessing
    LDA.W #$0202 : STA.L Scrolls
    JSR Set_TourianEntranceStatue_BG2_Yscroll
    RTL


;;; $DCCB: Instruction - go to [[Y]] if entrance to Tourian is unlocked ;;;
Instruction_GotoY_ifEntranceToTourianUnlocked:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    STZ.W HDMAObject_Var2,X : STZ.W HDMAObject_Var0,X
    LDA.W #$000A
    JSL CheckIfEvent_inA_HasHappened
    BCS .gotoY
    STZ.W HDMAObject_Var1,X
    STA.L TourianStatueBG2YScroll
    LDA.W #$0001 : STA.L Scrolls
    INY #2
    RTS

  .gotoY:
    LDA.W #$FF10 : STA.W HDMAObject_Var1,X : STA.L TourianStatueBG2YScroll
    LDA.W $0000,Y : TAY
    RTS


;;; $DCFA: Instruction list - Tourian entrance statue BG2 Y scroll ;;;
InstList_TourianEntranceStatue_BG2Yscroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_GotoY_ifEntranceToTourianUnlocked
    dw InstList_TourianEntranceStatue_BG2Yscroll_1
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInst_TourianEntranceStatue_BG2_Yscroll_WaitForUnlock
    dw $0001,IndirectHDMATable_TourianEntranceStatue_BG2YScroll
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInst_TourianEntranceStatue_BG2Yscroll_DescentDelay
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_TourianEntranceStatue_BG2_Yscroll_Descending
    dw Instruction_HDMAObject_Sleep

InstList_TourianEntranceStatue_BG2Yscroll_1:
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInst_TourianEntranceStatue_BG2Yscroll_EnableScrolling
    dw $0001,IndirectHDMATable_TourianEntranceStatue_BG2YScroll
    dw Instruction_HDMAObject_Sleep


;;; $DD28: Indirect HDMA table - Tourian entrance statue BG2 Y scroll ;;;
IndirectHDMATable_TourianEntranceStatue_BG2YScroll:
    db $1F : dw TourianStatueBG2YScroll
    db $01 : dw TourianStatueBG2YScroll
    db $01 : dw TourianStatueBG2YScroll
    db $00


;;; $DD32: Spawn Bomb Torizo haze ;;;
Spawn_BombTorizoHaze:
    JSL Spawn_HDMAObject
    db $02,$32
    dw PreInst_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed_0
    JSL Spawn_HDMAObject
    db $00,$32
    dw PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue_0
    RTL


;;; $DD43: Pre-instruction - Bomb Torizo haze colour math subscreen backdrop colour ;;;
PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor:
; By default, empty space in BG3 is blank tiles, not transparent tiles, to support the blending of foregrounds like water
; Hence, the colour math backdrop has no effect when BG3 is enabled for colour math, hence why it's disabled here
    LDA.W #$002C : STA.W LayerBlending_Config
    RTL


;;; $DD4A: Instruction list - Bomb Torizo haze colour math subscreen backdrop colour - green and red components ;;;
PreInst_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $88
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor
    dw $0001,HDMATable_Nothing_88DD61

PreInst_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed_1:
    dw $7777,HDMATable_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed
    dw Instruction_HDMAObject_GotoY
    dw PreInst_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed_1


;;; $DD61: HDMA table - nothing ;;;
HDMATable_Nothing_88DD61:
    db $00


;;; $DD62: Instruction list - Bomb Torizo haze colour math subscreen backdrop colour - blue component ;;;
PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $88
    dw $0001,HDMATable_Nothing_88DD74

PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue_1:
    dw $7777,HDMATable_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue
    dw Instruction_HDMAObject_GotoY
    dw PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue_1


;;; $DD74: HDMA table - nothing ;;;
HDMATable_Nothing_88DD74:
    db $00


;;; $DD75: HDMA table - Bomb Torizo haze colour math subscreen backdrop colour - green and red components ;;;
HDMATable_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed:
    db $48,$20,$40
    db $0A,$21,$41
    db $0A,$21,$41
    db $0A,$21,$41
    db $0A,$22,$42
    db $0A,$22,$42
    db $0A,$22,$42
    db $0A,$23,$43
    db $0A,$23,$43
    db $0A,$23,$43
    db $0A,$24,$44
    db $0A,$24,$44
    db $0A,$24,$44
    db $0A,$25,$45
    db $0A,$25,$45
    db $0A,$25,$45
    db $00


;;; $DDA6: HDMA table - Bomb Torizo haze colour math subscreen backdrop colour - blue component ;;;
HDMATable_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue:
    db $48,$80
    db $0A,$81
    db $0A,$81
    db $0A,$82
    db $0A,$82
    db $0A,$83
    db $0A,$83
    db $0A,$84
    db $0A,$84
    db $0A,$85
    db $0A,$85
    db $0A,$86
    db $0A,$86
    db $0A,$87
    db $0A,$87
    db $0A,$88
    db $00


;;; $DDC7: FX type 2Ch: Ceres haze ;;;
FXType_2C_CeresHaze:
    LDA.W #$0001
    JSL CheckIfBossBitsForCurrentAreaMatchAnyBitsInA
    BCS .alive
    JSL Spawn_HDMAObject
    db $40,$32
    dw InstList_CeresHaze_ColorMathSubScnBackColor_RidleyAlive_0
    RTL

  .alive:
    JSL Spawn_HDMAObject
    db $40,$32
    dw InstList_CeresHaze_ColorMathSubScnBackColor_RidleyDead_0
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $DDE2: Unused. Set Ceres haze pre-instruction for no fade ;;;
UNUSED_Set_CeresHaze_PreInstruction_for_NoFade_88DDE2:
    LDA.W #UNUSED_PreInst_CeresHaze_ColorMathSubScnBackdropColor_NoFade : STA.W HDMAObject_PreInstructions,X
; fallthrough to UNUSED_PreInst_CeresHaze_ColorMathSubScnBackdropColor_NoFade


;;; $DDE8: Unused. Pre-instruction - Ceres haze colour math subscreen backdrop colour - no fade ;;;
UNUSED_PreInst_CeresHaze_ColorMathSubScnBackdropColor_NoFade:
;; Parameters:
;;     X: HDMA object index

; I assume this routine was used before they realised they needed to handle door transition fade
    LDY.B #$20 : STY.B DP_ColorMathSubScreenBackdropColor0
    LDY.B #$40 : STY.B DP_ColorMathSubScreenBackdropColor1
    LDY.B #$80 : STY.B DP_ColorMathSubScreenBackdropColor2
    LDA.W #$002C : STA.W LayerBlending_Config
    SEP #$20
    PHX
    LDA.W HDMAObject_Var1,X : ORA.B #$0F
    LDX.B #$0F

  .loop:
    STA.L HazeColorMathSubscreenBackdropColorHDMADataTable,X
    DEC
    DEX : BPL .loop
    PLX
    REP #$20
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DE10: Pre-instruction - Ceres haze colour math subscreen backdrop colour - Ceres Ridley alive ;;;
PreInst_CeresHaze_ColorMathSubScnBackdropColor_RidleyIsAlive:
;; Parameters:
;;     X: HDMA object index
    LDA.W #$0080
    BRA Setup_CeresHaze_ColorMathSubScnBackColor_HDMAObject_FadingIn


;;; $DE15: Pre-instruction - Ceres haze colour math subscreen backdrop colour - Ceres Ridley dead ;;;
PreInst_CeresHaze_ColorMathSubScnBackdropColor_RidleyIsDead:
;; Parameters:
;;     X: HDMA object index
    LDA.W #$0020
; fallthrough to Setup_CeresHaze_ColorMathSubScnBackColor_HDMAObject_FadingIn


;;; $DE18: Set up Ceres haze colour math subscreen backdrop colour HDMA object pre-instruction for fading in ;;;
Setup_CeresHaze_ColorMathSubScnBackColor_HDMAObject_FadingIn:
;; Parameters:
;;     X: HDMA object index
    STA.W HDMAObject_Var1,X
    STZ.W HDMAObject_Var0,X
    LDA.W DoorTransitionFunction : CMP.W #DoorTransitionFunction_FadeInTheScreen_and_RunEnemies_Finish : BEQ .fadingIn
    RTL

  .fadingIn:
    LDA.W #PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadingIn : STA.W HDMAObject_PreInstructions,X


;;; $DE2D: Pre-instruction - Ceres haze colour math subscreen backdrop colour - fading in ;;;
PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadingIn:
;; Parameters:
;;     X: HDMA object index
    LDY.B #$20 : STY.B DP_ColorMathSubScreenBackdropColor0
    LDY.B #$40 : STY.B DP_ColorMathSubScreenBackdropColor1
    LDY.B #$80 : STY.B DP_ColorMathSubScreenBackdropColor2
    LDA.W #$002C : STA.W LayerBlending_Config
    LDA.W HDMAObject_Var0,X : CMP.W #$0010 : BEQ .done
    PHX : PHP
    SEP #$20
    LDA.W HDMAObject_Var1,X : STA.B DP_Temp14
    LDA.W HDMAObject_Var0,X
    LDX.B #$0F

  .loop:
    STA.B DP_Temp12
    ORA.B DP_Temp14 : STA.L HazeColorMathSubscreenBackdropColorHDMADataTable,X
    LDA.B DP_Temp12 : DEC : BPL .next
    LDA.B #$00

  .next:
    DEX : BPL .loop
    PLP : PLX
    INC.W HDMAObject_Var0,X
    RTL

  .done:
    LDA.W #PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadedIn : STA.W HDMAObject_PreInstructions,X
    RTL


;;; $DE74: Pre-instruction - Ceres haze colour math subscreen backdrop colour - faded in ;;;
PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadedIn:
;; Parameters:
;;     X: HDMA object index
    LDY.B #$20 : STY.B DP_ColorMathSubScreenBackdropColor0
    LDY.B #$40 : STY.B DP_ColorMathSubScreenBackdropColor1
    LDY.B #$80 : STY.B DP_ColorMathSubScreenBackdropColor2
    LDA.W #$002C : STA.W LayerBlending_Config
    LDA.W DoorTransitionFunction : CMP.W #DoorTransitionFunction_FadeOutTheScreen : BEQ .fadingOut
    RTL

  .fadingOut:
    LDA.W #PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadingOut : STA.W HDMAObject_PreInstructions,X
    RTL


;;; $DE96: Pre-instruction - Ceres haze colour math subscreen backdrop colour - fading out ;;;
PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadingOut:
;; Parameters:
;;     X: HDMA object index
    LDY.B #$20 : STY.B DP_ColorMathSubScreenBackdropColor0
    LDY.B #$40 : STY.B DP_ColorMathSubScreenBackdropColor1
    LDY.B #$80 : STY.B DP_ColorMathSubScreenBackdropColor2
    LDA.W #$002C : STA.W LayerBlending_Config
    LDA.W HDMAObject_Var0,X : BEQ .return
    PHX : PHP
    SEP #$20
    LDA.W HDMAObject_Var1,X : STA.B DP_Temp14
    LDA.W HDMAObject_Var0,X
    LDX.B #$0F

  .loop:
    STA.B DP_Temp12
    ORA.B DP_Temp14 : STA.L HazeColorMathSubscreenBackdropColorHDMADataTable,X
    LDA.B DP_Temp12 : DEC : BPL .next
    LDA.B #$00

  .next:
    DEX : BPL .loop
    PLP : PLX
    DEC.W HDMAObject_Var0,X

  .return:
    RTL


;;; $DED3: Instruction list - Ceres haze colour math subscreen backdrop colour - Ceres Ridley not dead ;;;
InstList_CeresHaze_ColorMathSubScnBackColor_RidleyAlive_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInst_CeresHaze_ColorMathSubScnBackdropColor_RidleyIsAlive
    dw $0001,Empty_HDMATable_88DEEA

InstList_CeresHaze_ColorMathSubScnBackColor_RidleyAlive_1:
    dw $7777,IndirectHDMATable_CeresHaze_ColorMathSubScnBackdropColor
    dw Instruction_HDMAObject_GotoY
    dw InstList_CeresHaze_ColorMathSubScnBackColor_RidleyAlive_1


;;; $DEEA: Empty HDMA table ;;;
Empty_HDMATable_88DEEA:
    db $00


;;; $DEEB: Instruction list - Ceres haze colour math subscreen backdrop colour - Ceres Ridley dead ;;;
InstList_CeresHaze_ColorMathSubScnBackColor_RidleyDead_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInst_CeresHaze_ColorMathSubScnBackdropColor_RidleyIsDead
    dw $0001,Empty_HDMATable_88DF02

InstList_CeresHaze_ColorMathSubScnBackColor_RidleyDead_1:
    dw $7777,IndirectHDMATable_CeresHaze_ColorMathSubScnBackdropColor
    dw Instruction_HDMAObject_GotoY
    dw InstList_CeresHaze_ColorMathSubScnBackColor_RidleyDead_1


;;; $DF02: Empty HDMA table ;;;
Empty_HDMATable_88DF02:
    db $00


;;; $DF03: Indirect HDMA table - Ceres haze colour math subscreen backdrop colour ;;;
IndirectHDMATable_CeresHaze_ColorMathSubScnBackdropColor:
    db $40 : dw HazeColorMathSubscreenBackdropColorHDMADataTable
    db $08 : dw HazeColorMathSubscreenBackdropColorHDMADataTable+1
    db $08 : dw HazeColorMathSubscreenBackdropColorHDMADataTable+2
    db $08 : dw HazeColorMathSubscreenBackdropColorHDMADataTable+3
    db $08 : dw HazeColorMathSubscreenBackdropColorHDMADataTable+4
    db $08 : dw HazeColorMathSubscreenBackdropColorHDMADataTable+5
    db $08 : dw HazeColorMathSubscreenBackdropColorHDMADataTable+6
    db $08 : dw HazeColorMathSubscreenBackdropColorHDMADataTable+7
    db $08 : dw HazeColorMathSubscreenBackdropColorHDMADataTable+8
    db $08 : dw HazeColorMathSubscreenBackdropColorHDMADataTable+9
    db $08 : dw HazeColorMathSubscreenBackdropColorHDMADataTable+$A
    db $08 : dw HazeColorMathSubscreenBackdropColorHDMADataTable+$B
    db $08 : dw HazeColorMathSubscreenBackdropColorHDMADataTable+$C
    db $08 : dw HazeColorMathSubscreenBackdropColorHDMADataTable+$D
    db $08 : dw HazeColorMathSubscreenBackdropColorHDMADataTable+$E
    db $08 : dw HazeColorMathSubscreenBackdropColorHDMADataTable+$F
    db $00


;;; $DF34: Spawn Draygon main screen layers HDMA object ;;;
Spawn_DraygonMainScreenLayers_HDMAObject:
    JSL Spawn_HDMAObject
    db $00,$2C
    dw InstList_DraygonMainScreenLayers_Initial
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $DF3D: Unused ;;;
UNUSED_SpawnHDMAObject_88DF3D:
    JSL Spawn_HDMAObject
    db $00,$2C
    dw InstList_DraygonMainScreenLayers_DraygonAroundTop
    RTL


;;; $DF46: Unused ;;;
UNUSED_SpawnHDMAObject_88DF46:
    JSL Spawn_HDMAObject
    db $02,$12
    dw UNUSED_InstList_BG3_Yscroll_0_88DF77
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DF4F: Instruction list - Draygon main screen layers - initial ;;;
InstList_DraygonMainScreenLayers_Initial:
    dw Instruction_HDMAObject_HDMATableBank : db $88
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $88
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl RTL_88DF91
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_DraygonMainScreenLayers


;;; $DF5F: Instruction list - Draygon main screen layers - Draygon is around middle of screen ;;;
InstList_DraygonMainScreenLayers_DraygonAroundMiddle:
    dw $0001,HDMATable_DraygonMainScreenLayers_DraygonAroundMiddle
    dw Instruction_HDMAObject_Sleep


;;; $DF65: Instruction list - Draygon main screen layers - Draygon is around bottom of screen ;;;
InstList_DraygonMainScreenLayers_DraygonAroundBottom:
    dw $0001,HDMATable_DraygonMainScreenLayers_DraygonAroundBottom
    dw Instruction_HDMAObject_Sleep


;;; $DF6B: Instruction list - Draygon main screen layers - Draygon is around top of screen ;;;
InstList_DraygonMainScreenLayers_DraygonAroundTop:
    dw $0001,HDMATable_DraygonMainScreenLayers_DraygonAroundTop
    dw Instruction_HDMAObject_Sleep


;;; $DF71: Instruction list - Draygon main screen layers - Draygon is off-screen ;;;
InstList_DraygonMainScreenLayers_DraygonOffScreen:
    dw $0001,HDMATable_DraygonMainScreenLayers_DraygonOffScreen
    dw Instruction_HDMAObject_Sleep


if !FEATURE_KEEP_UNREFERENCED
;;; $DF77: Instruction list - unused BG3 Y scroll ;;;
UNUSED_InstList_BG3_Yscroll_0_88DF77:
    dw Instruction_HDMAObject_HDMATableBank : db $88
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $88
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl RTL_88DF92
    dw Instruction_HDMAObject_PreInstructionInY
    dl RTL_88DF93

UNUSED_InstList_BG3_Yscroll_1_88DF87:
    dw $0001,UNUSED_HDMATable_BG3_Yscroll
    dw Instruction_HDMAObject_GotoY
    dw UNUSED_InstList_BG3_Yscroll_1_88DF87
    dw Instruction_HDMAObject_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DF91: RTL ;;;
RTL_88DF91:
    RTL


;;; $DF92: RTL ;;;
RTL_88DF92:
    RTL


;;; $DF93: RTL ;;;
RTL_88DF93:
    RTL


;;; $DF94: Pre-instruction - Draygon main screen layers ;;;
PreInstruction_DraygonMainScreenLayers:
;; Parameters:
;;     X: HDMA object index
    LDA.W Enemy.properties : BIT.W #$0200 : BNE .offScreen
    LDA.W Enemy.XPosition : SEC : SBC.W Layer1XPosition
    CLC : ADC.W #$0040 : BMI .offScreen
    CMP.W #$0180 : BPL .offScreen
    LDA.W Enemy.YPosition : SEC : SBC.W Layer1YPosition
    CLC : ADC.W #$0010 : BMI .offScreen
    LDA.W Enemy.YPosition : SEC : SBC.W Layer1YPosition : CMP.W #$0130 : BPL .offScreen
    CMP.W #$0028 : BMI .aroundTop
    CMP.W #$00C0 : BMI .aroundMiddle
    BRA .aroundBottom

  .aroundTop:
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X
    LDA.W #InstList_DraygonMainScreenLayers_DraygonAroundTop : STA.W HDMAObject_InstListPointers,X
    RTL

  .offScreen:
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X
    LDA.W #InstList_DraygonMainScreenLayers_DraygonOffScreen : STA.W HDMAObject_InstListPointers,X
    RTL

  .aroundBottom:
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X
    LDA.W #InstList_DraygonMainScreenLayers_DraygonAroundBottom : STA.W HDMAObject_InstListPointers,X
    RTL

  .aroundMiddle:
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X
    LDA.W #InstList_DraygonMainScreenLayers_DraygonAroundMiddle : STA.W HDMAObject_InstListPointers,X
    RTL


;;; $E007: HDMA table - Draygon main screen layers - Draygon is around middle of screen ;;;
HDMATable_DraygonMainScreenLayers_DraygonAroundMiddle:
    db $1F,$04 ;         BG3
    db $81,$13 ; BG1/BG2/    sprites
    db $00


;;; $E00C: HDMA table - Draygon main screen layers - Draygon is around bottom of screen ;;;
HDMATable_DraygonMainScreenLayers_DraygonAroundBottom:
    db $1F,$04 ;         BG3
    db $60,$11 ; BG1/        sprites
    db $81,$13 ; BG1/BG2/    sprites
    db $00


;;; $E013: HDMA table - Draygon main screen layers - Draygon is around top of screen ;;;
HDMATable_DraygonMainScreenLayers_DraygonAroundTop:
    db $1F,$04 ;         BG3
    db $40,$13 ; BG1/BG2/    sprites
    db $81,$11 ; BG1/        sprites
    db $00


;;; $E01A: HDMA table - Draygon main screen layers - Draygon is off-screen ;;;
HDMATable_DraygonMainScreenLayers_DraygonOffScreen:
    db $1F,$04 ;         BG3
    db $81,$11 ; BG1/        sprites
    db $00


if !FEATURE_KEEP_UNREFERENCED
;;; $E01F: HDMA table - unused BG3 Y scroll ;;;
UNUSED_HDMATable_BG3_Yscroll:
    db $40 : dw $0000
    db $81 : dw $0020
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E026: Pre-instruction - varia suit pickup ;;;
PreInstruction_VariaSuitPickup:
    PHP
    REP #$30
    LDA.W SuitPickup_Stage : ASL : TAX
    JSR.W (.pointers,X)
    BCC .return
    SEP #$20
    LDA.W SuitPickup_ColorMathRed : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.W SuitPickup_ColorMathGreen : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.W SuitPickup_ColorMathBlue : STA.B DP_ColorMathSubScreenBackdropColor2
    REP #$20
    LDA.W #$0012 : STA.W LayerBlending_Config

  .return:
    PLP
    RTL

  .pointers:
    dw SuitPickup_Stage0_LightBeamAppears
    dw SuitPickup_Stage1_LightBeamWidens_Linear
    dw SuitPickup_Stage2_LightBeamWidens_Curved
    dw VariaSuitPickup_Stage3_GiveSamusVariaSuit
    dw SuitPickup_Stage4_LightBeamShrinks
    dw SuitPickup_Stage5_LightBeamDissipates
    dw VariaSuitPickup_Stage6


;;; $E05C: Pre-instruction - gravity suit pickup ;;;
PreInstruction_GravitySuitPickup:
    PHP
    REP #$30
    LDA.W SuitPickup_Stage : ASL : TAX
    JSR.W (.poitners,X)
    BCC .return
    SEP #$20
    LDA.W SuitPickup_ColorMathRed : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.W SuitPickup_ColorMathGreen : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.W SuitPickup_ColorMathBlue : STA.B DP_ColorMathSubScreenBackdropColor2
    REP #$20
    LDA.W #$0012 : STA.W LayerBlending_Config

  .return:
    PLP
    RTL

  .poitners:
    dw SuitPickup_Stage0_LightBeamAppears
    dw SuitPickup_Stage1_LightBeamWidens_Linear
    dw SuitPickup_Stage2_LightBeamWidens_Curved
    dw GravitySuitPickup_Stage3_GiveSamusGravitySuit
    dw SuitPickup_Stage4_LightBeamShrinks
    dw SuitPickup_Stage5_LightBeamDissipates
    dw GravitySuitPickup_Stage6


;;; $E092: Suit pickup stage 0 - light beam appears ;;;
SuitPickup_Stage0_LightBeamAppears:
;; Returns:
;;     Carry: Set. Not finished
    LDA.W SuitPickup_LightBeamHeight : CLC : ADC.W #$0008 : STA.W SuitPickup_LightBeamHeight
    TAY
    LDX.W #$0000

  .loopUpperHalf:
    LDA.W .positions : STA.L SuitPickupWindow1HDMADataTable,X
    INX #2
    DEY : BEQ +
    BPL .loopUpperHalf

+   LDX.W #$01FE
    LDY.W SuitPickup_LightBeamHeight

  .loopLowerHalf:
    LDA.W .positions : STA.L SuitPickupWindow1HDMADataTable,X
    DEX #2
    DEY : BEQ +
    BPL .loopLowerHalf

+   LDA.W SuitPickup_LightBeamHeight : CMP.W #$0080 : BMI .return
    INC.W SuitPickup_Stage
    LDA.W #$7878 : STA.W SuitPickup_LightBeamHeight

  .return:
    SEC
    RTS

  .positions:
    db $78,$78


;;; $E0D7: Suit pickup stage 1 - light beam widens - linear ;;;
SuitPickup_Stage1_LightBeamWidens_Linear:
;; Returns:
;;     Carry: Set. Not finished
    SEP #$20
    LDA.W SuitPickup_LightBeamLeftRightPositions : SEC : SBC.W SuitPickupLightBeamWideningSpeed+1 : STA.W SuitPickup_LightBeamLeftRightPositions
    LDA.W SuitPickup_LightBeamLeftRightPositions+1 : CLC : ADC.W SuitPickupLightBeamWideningSpeed+1 : STA.W SuitPickup_LightBeamLeftRightPositions+1
    REP #$20
    LDX.W #$01FE

  .loop:
    LDA.W SuitPickup_LightBeamLeftRightPositions : STA.L SuitPickupWindow1HDMADataTable,X
    DEX #2 : BPL .loop
    LDA.W SuitPickup_LightBeamLeftRightPositions : AND.W #$00FF : CMP.W #$0061 : BPL .return
    INC.W SuitPickup_Stage
    LDA.W #$846C : STA.W SuitPickup_LightBeamLeftRightPositions ; Suit pickup light beam left position = 6Ch, right position = 84h

  .return:
    SEC
    RTS


;;; $E113: Suit pickup stage 2 - light beam widens - curved ;;;
SuitPickup_Stage2_LightBeamWidens_Curved:
    JSR AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToWhite
    REP #$10 : SEP #$20
    LDA.W SuitPickup_LightBeamLeftRightPositions : SEC : SBC.W SuitPickupLightBeamWideningSpeed+1 : STA.W SuitPickup_LightBeamLeftRightPositions : BEQ .lessThanZero
    BMI .lessThanZero
    LDA.W SuitPickup_LightBeamLeftRightPositions+1 : CLC : ADC.W SuitPickupLightBeamWideningSpeed+1 : BCC .greaterThanZero
    LDA.B #$FF

  .greaterThanZero:
    STA.W SuitPickup_LightBeamLeftRightPositions+1
    REP #$20
    BRA .loopSetup

  .lessThanZero:
    REP #$20
    LDA.W #$FF00 : STA.W SuitPickup_LightBeamLeftRightPositions

  .loopSetup:
    SEP #$20
    LDX.W #$0000
    LDY.W #$0000

  .loopUpperHalf:
    LDA.W SuitPickup_LightBeamLeftRightPositions : SEC : SBC.W SuitPickup_LightBeam_CurveWidths,Y : BPL +
    LDA.B #$00

+   STA.L SuitPickupWindow1HDMADataTable,X
    INX
    LDA.W SuitPickup_LightBeamLeftRightPositions+1 : CLC : ADC.W SuitPickup_LightBeam_CurveWidths,Y : BCC +
    LDA.B #$FF

+   STA.L SuitPickupWindow1HDMADataTable,X
    INX
    INY
    CPX.W #$0100 : BMI .loopUpperHalf
    DEY

  .loopLowerHalf:
    LDA.W SuitPickup_LightBeamLeftRightPositions : SEC : SBC.W SuitPickup_LightBeam_CurveWidths,Y : BPL +
    LDA.B #$00

+   STA.L SuitPickupWindow1HDMADataTable,X
    INX
    LDA.W SuitPickup_LightBeamLeftRightPositions+1 : CLC : ADC.W SuitPickup_LightBeam_CurveWidths,Y : BCC +
    LDA.B #$FF

+   STA.L SuitPickupWindow1HDMADataTable,X
    INX
    DEY
    CPX.W #$0200 : BMI .loopLowerHalf
    REP #$20
    LDA.W SuitPickupLightBeamWideningSpeed : CLC : ADC.W #$0060 : STA.W SuitPickupLightBeamWideningSpeed
    LDA.W SuitPickup_LightBeamLeftRightPositions : CMP.W #$FF00 : BNE .return
    INC.W SuitPickup_Stage
    LDA.W SuitPickupLightBeamWideningSpeed : LSR : STA.W SuitPickupLightBeamWideningSpeed
    STZ.W SuitPickup_LightBeamLeftRightPositions

  .return:
    SEC
    RTS


;;; $E1BA: Suit pickup stage 4 - light beam shrinks ;;;
SuitPickup_Stage4_LightBeamShrinks:
;; Returns:
;;     Carry: Set. Not finished
    LDA.W SuitPickup_ColorMathBlue : BIT.W #$FF00 : BNE .advanceToOrange
    JSR AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToOrange
    BRA +

  .advanceToOrange:
    JSR AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToBlue

+   LDA.W SuitPickupLightBeamWideningSpeed : AND.W #$FF00 : XBA : STA.B DP_Temp12
    LDA.W SuitPickup_LightBeamTopPosition : CLC : ADC.B DP_Temp12 : STA.W SuitPickup_LightBeamTopPosition
    TAY
    LDX.W #$0000

  .loopUpperHalf:
    LDA.W #$00FF : STA.L SuitPickupWindow1HDMADataTable,X
    INX #2
    DEY : BEQ .setupLowerLoop
    BPL .loopUpperHalf

  .setupLowerLoop:
    LDX.W #$01FE
    LDY.W SuitPickup_LightBeamTopPosition : DEY

  .loopLowerHalf:
    LDA.W #$00FF : STA.L SuitPickupWindow1HDMADataTable,X
    DEX #2
    DEY : BEQ +
    BPL .loopLowerHalf

+   LDA.W SuitPickupLightBeamWideningSpeed : SEC : SBC.W #$0020 : STA.W SuitPickupLightBeamWideningSpeed
    CMP.W #$0100 : BPL +
    LDA.W #$0100 : STA.W SuitPickupLightBeamWideningSpeed

+   LDA.W SuitPickup_LightBeamTopPosition : CMP.W #$0080 : BMI .return
    INC.W SuitPickup_Stage
    LDA.W #$F8FF : STA.W SuitPickup_LightBeamTopPosition

  .return:
    SEC
    RTS


;;; $E22B: Suit pickup stage 5 - light beam dissipates ;;;
SuitPickup_Stage5_LightBeamDissipates:
;; Returns:
;;     Carry: Set. Not finished
    SEP #$20
    LDA.W SuitPickup_LightBeamLeftRightPositions : CLC : ADC.B #$08 : STA.W SuitPickup_LightBeamLeftRightPositions
    LDA.W SuitPickup_LightBeamLeftRightPositions+1 : SEC : SBC.B #$08 : STA.W SuitPickup_LightBeamLeftRightPositions+1
    REP #$20
    LDA.W SuitPickup_LightBeamLeftRightPositions : STA.L SuitPickupWindow1HDMADataTable+$100
    LDA.W SuitPickup_LightBeamLeftRightPositions : AND.W #$00FF : CMP.W #$0070 : BMI .return
    INC.W SuitPickup_Stage

  .return:
    SEC
    RTS


;;; $E258: Varia suit pickup stage 6 ;;;
VariaSuitPickup_Stage6:
;; Returns:
;;     Carry: Clear. Finished
    LDA.W #$0003
    JSL QueueMusicDataOrTrack_8FrameDelay
; fallthrough to GravitySuitPickup_Stage6


;;; $E25F: Gravity suit pickup stage 6 ;;;
GravitySuitPickup_Stage6:
;; Returns:
;;     Carry: Clear. Finished

; Called by varia suit pickup stage 6 too
    SEP #$20
    LDA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor2
    LDA.B #$40 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$20 : STA.B DP_ColorMathSubScreenBackdropColor0
    REP #$20
    LDA.W #$0001 : STA.W SuitPickupIndirectHDMATable
    LDA.W #SuitPickupWindow1HDMADataTable : STA.W Xray_IndirectHDMATable+1
    STZ.W Xray_IndirectHDMATable+3 : STZ.W Xray_IndirectHDMATable+4
    STZ.W Xray_IndirectHDMATable+6 : STZ.W Xray_IndirectHDMATable+8
    LDA.W #$00FF : STA.L SuitPickupWindow1HDMADataTable
    STZ.W SuitPickup_Stage : STZ.W SuitPickup_Var
    STZ.W SuitPickup_ColorMathRed : STZ.W SuitPickup_ColorMathBlue
    LDX.W HDMAObject_Index
    LDA.W HDMAObject_InstListPointers,X : INC #2 : STA.W HDMAObject_InstListPointers,X
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X
    LDA.W #$000B
    JSL Run_Samus_Command
    CLC
    RTS


;;; $E2B4: Advance suit pickup colour math subscreen backdrop transition to white ;;;
AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToWhite:
    SEP #$20
    LDA.W SuitPickup_ColorMathRed : CMP.B #$3F : BEQ .green
    INC #2 : STA.W SuitPickup_ColorMathRed
    CMP.B #$40 : BMI .green
    LDA.B #$3F : STA.W SuitPickup_ColorMathRed

  .green:
    LDA.W SuitPickup_ColorMathGreen : CMP.B #$5F : BEQ .blue
    INC #2 : STA.W SuitPickup_ColorMathGreen
    CMP.B #$60 : BMI .blue
    LDA.B #$5F : STA.W SuitPickup_ColorMathGreen

  .blue:
    LDA.W SuitPickup_ColorMathBlue : CMP.B #$9F : BEQ .return
    INC #2 : STA.W SuitPickup_ColorMathBlue
    CMP.B #$A0 : BMI .return
    LDA.B #$9F : STA.W SuitPickup_ColorMathBlue

  .return:
    REP #$20
    SEC
    RTS


;;; $E2F9: Advance suit pickup colour math subscreen backdrop transition to orange ;;;
AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToOrange:
    SEP #$20
    LDA.W SuitPickup_ColorMathRed : CMP.B #$3F : BEQ .green
    DEC : STA.W SuitPickup_ColorMathRed

  .green:
    LDA.W SuitPickup_ColorMathGreen : CMP.B #$4D : BEQ .blue
    DEC : STA.W SuitPickup_ColorMathGreen

  .blue:
    LDA.W SuitPickup_ColorMathBlue : CMP.B #$83 : BEQ .return
    DEC : STA.W SuitPickup_ColorMathBlue

  .return:
    REP #$20
    SEC
    RTS


;;; $E320: Varia suit pickup stage 3 - give Samus varia suit ;;;
VariaSuitPickup_Stage3_GiveSamusVariaSuit:
;; Returns:
;;     Carry: Set. Not finished

; This code is all redundant, as varia suit is already given to Samus by the PLM
    LDA.W EquippedItems : ORA.W #$0001 : STA.W EquippedItems
    LDA.W CollectedItems : ORA.W #$0001 : STA.W CollectedItems
    LDA.W #$009B : STA.W Pose
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    LDA.W PreviousPose : STA.W LastDifferentPose
    LDA.W PreviousPoseXDirection : STA.W LastDifferentPoseXDirection
    LDA.W Pose : STA.W PreviousPose
    LDA.W PoseXDirection : STA.W PreviousPoseXDirection
    JSL LoadSamusSuitPalette
    INC.W SuitPickup_Stage
    SEC
    RTS


;;; $E361: Gravity suit pickup stage 3 - give Samus gravity suit ;;;
GravitySuitPickup_Stage3_GiveSamusGravitySuit:
;; Returns:
;;     Carry: Set. Not finished

; This code is all redundant, as gravity suit is already given to Samus by the PLM
    LDA.W EquippedItems : ORA.W #$0020 : STA.W EquippedItems
    LDA.W CollectedItems : ORA.W #$0020 : STA.W CollectedItems
    LDA.W #$009B : STA.W Pose
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    LDA.W PreviousPose : STA.W LastDifferentPose
    LDA.W PreviousPoseXDirection : STA.W LastDifferentPoseXDirection
    LDA.W Pose : STA.W PreviousPose
    LDA.W PoseXDirection : STA.W PreviousPoseXDirection
    JSL LoadSamusSuitPalette
    INC.W SuitPickup_Stage
    SEC
    RTS


;;; $E3A2: Advance suit pickup colour math subscreen backdrop transition to blue ;;;
AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToBlue:
    SEP #$20
    LDA.W SuitPickup_ColorMathRed : CMP.B #$30 : BEQ .green
    DEC : STA.W SuitPickup_ColorMathRed

  .green:
    LDA.W SuitPickup_ColorMathGreen : CMP.B #$49 : BEQ .blue
    DEC : STA.W SuitPickup_ColorMathGreen

  .blue:
    LDA.W SuitPickup_ColorMathBlue : CMP.B #$90 : BEQ .return
    DEC : STA.W SuitPickup_ColorMathBlue

  .return:
    REP #$20
    SEC
    RTS


;;; $E3C9: Suit pickup light beam curve widths ;;;
SuitPickup_LightBeam_CurveWidths:
; Indexed by scanline for upper half (`FFh - scanline` for lower half)
    db $01,$02,$03,$04,$05,$06,$07,$07,$08,$08,$09,$09,$0A,$0A,$0B,$0B
    db $0B,$0C,$0C,$0C,$0D,$0D,$0D,$0E,$0E,$0E,$0E,$0F,$0F,$0F,$0F,$10
    db $10,$10,$10,$10,$11,$11,$11,$11,$11,$11,$12,$12,$12,$12,$12,$12
    db $13,$13,$13,$13,$13,$13,$14,$14,$14,$14,$14,$14,$14,$14,$15,$15
    db $15,$15,$15,$15,$15,$15,$15,$15,$16,$16,$16,$16,$16,$16,$16,$16
    db $16,$16,$16,$16,$17,$17,$17,$17,$17,$17,$17,$17,$17,$17,$17,$17
    db $17,$17,$17,$17,$17,$17,$17,$18,$18,$18,$18,$18,$18,$18,$18,$18
    db $18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18


;;; $E449: Pre-instruction - Phantoon semi-transparency ;;;
PreInstruction_PhantoonSemiTransparency:
    PHP
    SEP #$10 : REP #$20
    BIT.W LayerBlending_PhantoonSemiTransparencyFlag : BVS .semiTransparent
    LDX.W Phantoon.semiTransparencyHDMAObjectControl : BEQ .BG2Disabled
    CPX.B #$FF : BEQ .delete
    BRA .return

  .BG2Disabled:
    LDA.W #$0004 : STA.W LayerBlending_Config
    BRA .return

  .semiTransparent:
    LDA.W #$001A : STA.W LayerBlending_Config

  .return:
    PLP
    RTL

  .delete:
    LDA.W #$0004 : STA.W LayerBlending_Config
    LDX.W HDMAObject_Index
    LDA.W HDMAObject_InstListPointers,X : INC #2 : STA.W HDMAObject_InstListPointers,X
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X
    PLP
    RTL


;;; $E487: Spawn wavy Phantoon HDMA object ;;;
Spawn_WavyPhantoon_HDMAObject:
    PHP : PHB
    PHK : PLB
    REP #$30
    PHX
    STA.W Phantoon.nextWavyPhantoonMode
    STZ.W Phantoon.wavyPhantoonPhaseAmplitude : STZ.W Phantoon.wavyPhantoonPhaseDeltaDirection
    LDA.B $16 : STA.W Phantoon.wavyPhantoonPhaseDelta
    JSL Spawn_HDMAObject
    db $42,$0F
    dw InstList_WavyPhantoon_BG2_Xscroll
    PLX : PLB : PLP
    RTL


;;; $E4A8: Instruction list - wavy Phantoon BG2 X scroll ;;;
InstList_WavyPhantoon_BG2_Xscroll:
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObject_HDMATableBank : db $7E
    dw Instruction_Setup_WavyPhantoon
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_WavyPhantoon
    dw $0001,$9000
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_Delete


;;; $E4BD: Instruction - set up wavy Phantoon ;;;
Instruction_Setup_WavyPhantoon:
;; Parameters:
;;     X: HDMA object index
    PHP
    REP #$30
    LDA.W Phantoon.nextWavyPhantoonMode : STA.W Phantoon.wavyPhantoonMode
    BIT.W #$0001 : BNE .wavelengthDoubled
    LDA.W #$00A0 : STA.L WavyPhantoonBG2XScrollIndirectHDMATable : STA.L WavyPhantoonBG2XScrollIndirectHDMATable+3
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+6 : STA.L WavyPhantoonBG2XScrollIndirectHDMATable+9
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$C : STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$F
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$12 : STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$15
    LDA.W #WavyPhantoonBG2XScrollHDMADataTable : STA.L WavyPhantoonBG2XScrollIndirectHDMATable+1 : STA.L WavyPhantoonBG2XScrollIndirectHDMATable+7
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$D : STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$13
    LDA.W #WavyPhantoonBG2XScrollHDMADataTable+$40 : STA.L WavyPhantoonBG2XScrollIndirectHDMATable+4 : STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$A
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$10 : STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$16
    LDA.W #$0000 : STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$18
    BRA .merge

  .wavelengthDoubled:
    LDA.W #$00C0 : STA.L WavyPhantoonBG2XScrollIndirectHDMATable : STA.L WavyPhantoonBG2XScrollIndirectHDMATable+3
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+6 : STA.L WavyPhantoonBG2XScrollIndirectHDMATable+9
    LDA.W #WavyPhantoonBG2XScrollHDMADataTable : STA.L WavyPhantoonBG2XScrollIndirectHDMATable+1
    LDA.W #WavyPhantoonBG2XScrollHDMADataTable+$80 : STA.L WavyPhantoonBG2XScrollIndirectHDMATable+4
    LDA.W #WavyPhantoonBG2XScrollHDMADataTable : STA.L WavyPhantoonBG2XScrollIndirectHDMATable+7
    LDA.W #WavyPhantoonBG2XScrollHDMADataTable+$80 : STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$A
    LDA.W #$0000 : STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$C

  .merge:
    LDA.W #$FFFE : STA.W HDMAObject_Var0,X
    LDA.W #$0001 : STA.W HDMAObject_Var1,X
    STZ.W HDMAObject_Var2,X : STZ.W HDMAObject_Var3,X
    PLP
    RTS


;;; $E567: Pre-instruction - wavy Phantoon ;;;
PreInstruction_WavyPhantoon:
; If [wavy Phantoon mode] = 0:
;     Delete HDMA object
;     Return

; Decrement HDMA object phase increase timer
; If [HDMA object phase increase timer] = 0:
;     HDMA object phase increase timer = 1
;     HDMA object wave phase += [wavy Phantoon phase delta] * 2

; If Phantoon wavelength doubled ([wavy Phantoon mode] & 1 = 0):
;     n = 40h
; Else:
;     n = 20h

; t_0 = [HDMA object wave phase] / 2
; r = [wavy Phantoon amplitude] / 100h
; For i in 0..n-1:
;     t = t_0 + i * 80h / n
;     $7E:9100 + i*2       = [BG2 X scroll] + r * sin(t * pi / 80h)
;     $7E:9100 + n*2 + i*2 = [BG2 X scroll] - r * sin(t * pi / 80h)

; This routine could be rewritten to be considerably faster by using the 8-bit sine table and using the 16-bit x 8-bit signed multiplication registers ($211B et al)
    PHP
    REP #$30
    LDA.W Phantoon.wavyPhantoonMode : BNE .phantoonEnabled
    LDX.W HDMAObject_Index
    LDA.W HDMAObject_InstListPointers,X : INC #2 : STA.W HDMAObject_InstListPointers,X
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X
    PLP
    RTL

  .phantoonEnabled:
    BIT.W #$0001 : BNE .doubledE593
    LDA.W #$0008 : STA.B DP_Temp1C
    LDA.W #$0040 : STA.B DP_Temp1E
    BRA +

  .doubledE593:
    LDA.W #$0004 : STA.B DP_Temp1C
    LDA.W #$0080 : STA.B DP_Temp1E

+   PHX
    DEC.W HDMAObject_Var1,X : BNE .nonZeroTimer
    LDA.W #$0001 : STA.W HDMAObject_Var1,X
    LDA.W Phantoon.wavyPhantoonPhaseDelta : ASL : STA.B DP_Temp12
    LDA.W HDMAObject_Var0,X : CLC : ADC.B DP_Temp12 : AND.W #$01FF : STA.W HDMAObject_Var0,X

  .nonZeroTimer:
    LDA.W HDMAObject_Var0,X : STA.B DP_Temp14
    LDX.W #$0000

  .loop:
    PHX
    LDX.B DP_Temp14
    LDA.L SineCosineTables_8bitSine_SignExtended,X : BPL .positive
    JMP .negative

  .positive:
    STA.B DP_Temp12
    SEP #$20
    STA.W $4202
    LDA.W Phantoon.wavyPhantoonPhaseAmplitude : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : XBA : AND.W #$00FF : STA.B DP_Temp16
    SEP #$20
    LDA.B DP_Temp13 : STA.W $4202
    LDA.W Phantoon.wavyPhantoonPhaseAmplitude : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : CLC : ADC.B DP_Temp16 : STA.B DP_Temp16
    SEP #$20
    LDA.B DP_Temp12 : STA.W $4202
    LDA.W Phantoon.wavyPhantoonPhaseAmplitude+1 : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : STA.B DP_Temp18
    SEP #$20
    LDA.B DP_Temp13 : STA.W $4202
    LDA.W Phantoon.wavyPhantoonPhaseAmplitude+1 : STA.W $4203
    REP #$20
    LDA.B DP_Temp16 : CLC : ADC.B DP_Temp18 : STA.B DP_Temp16
    LDA.W $4215 : AND.W #$FF00 : CLC : ADC.B DP_Temp16
    AND.W #$FF00 : XBA : STA.B DP_Temp12
    TXA : CLC : ADC.B DP_Temp1C : AND.W #$01FF : STA.B DP_Temp14
    PLX
    LDA.B DP_BG2XScroll : CLC
    ADC.B DP_Temp12 : STA.L WavyPhantoonBG2XScrollHDMADataTable,X
    JMP .next

  .negative:
    EOR.W #$FFFF : INC : STA.B DP_Temp12
    SEP #$20
    STA.W $4202
    LDA.W Phantoon.wavyPhantoonPhaseAmplitude : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : XBA : AND.W #$00FF : STA.B DP_Temp16
    SEP #$20
    LDA.B DP_Temp13 : STA.W $4202
    LDA.W Phantoon.wavyPhantoonPhaseAmplitude : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : CLC : ADC.B DP_Temp16 : STA.B DP_Temp16
    SEP #$20
    LDA.B DP_Temp12 : STA.W $4202
    LDA.W Phantoon.wavyPhantoonPhaseAmplitude+1 : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : STA.B DP_Temp18
    SEP #$20
    LDA.B DP_Temp13 : STA.W $4202
    LDA.W Phantoon.wavyPhantoonPhaseAmplitude+1 : STA.W $4203
    REP #$20
    LDA.B DP_Temp16 : CLC : ADC.B DP_Temp18 : STA.B DP_Temp16
    LDA.W $4215 : AND.W #$FF00 : CLC : ADC.B DP_Temp16
    AND.W #$FF00 : XBA : STA.B DP_Temp12
    TXA : CLC : ADC.B DP_Temp1C : AND.W #$01FF : STA.B DP_Temp14
    PLX
    LDA.B DP_BG2XScroll : SEC : SBC.B DP_Temp12 : STA.L WavyPhantoonBG2XScrollHDMADataTable,X

  .next:
    INX #2 : CPX.B DP_Temp1E : BPL +
    JMP .loop

+   LDA.W Phantoon.wavyPhantoonMode : BIT.W #$0001 : BNE .doubledE706
    LDX.W #$003E

  .loopNotDoubled:
    LDA.B DP_BG2XScroll : SEC : SBC.L WavyPhantoonBG2XScrollHDMADataTable,X
    CLC : ADC.B DP_BG2XScroll : STA.L WavyPhantoonBG2XScrollHDMADataTable+$40,X
    DEX #2 : BPL .loopNotDoubled
    BRA .return

  .doubledE706:
    LDX.W #$007E

  .loopDoubled:
    LDA.B DP_BG2XScroll : SEC : SBC.L WavyPhantoonBG2XScrollHDMADataTable,X
    CLC : ADC.B DP_BG2XScroll : STA.L WavyPhantoonBG2XScrollHDMADataTable+$80,X
    DEX #2
    BPL .loopDoubled

  .return:
    PLX : PLP
    RTL


;;; $E71E: Spawn Mother Brain rising HDMA object ;;;
Spawn_MotherBrainRising_HDMAObject:
; Prevent Mother Brain's legs (sprites) from appearing over the floor
    JSL Spawn_HDMAObject
    db $00,$2C
    dw InstList_MotherBrainRising_MainScreenLayers
; fallthrough to RTL_88E726


RTL_88E726:
    RTL


;;; $E727: Instruction list - Mother Brain rising main screen layers ;;;
InstList_MotherBrainRising_MainScreenLayers:
    dw Instruction_HDMAObject_HDMATableBank : db $88
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $88
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl RTL_88E726
    dw Instruction_HDMAObject_PreInstructionInY
    dl RTL_88E726
    dw $0001,HDMATable_MotherBrainRising_MainScreenLayers
    dw Instruction_HDMAObject_Sleep


;;; $E73D: HDMA table - Mother Brain rising main screen layers ;;;
HDMATable_MotherBrainRising_MainScreenLayers:
    db $20,$04 ;         BG3
    db $18,$15 ; BG1/    BG3/sprites
    db $60,$13 ; BG1/BG2/    sprites
    db $40,$13 ; BG1/BG2/    sprites
    db $08,$05 ; BG1/    BG3
    db $00


;;; $E748: Spawn Mother Brain rainbow beam HDMA object ;;;
Spawn_MotherBrainRainbowBeam_HDMAObject:
    JSL Spawn_HDMAObject
    db $41,$26
    dw InstList_MotherBrainRainbowBeam_Window1Position
    RTL


;;; $E751: Instruction list - Mother Brain rainbow beam window 1 position ;;;
InstList_MotherBrainRainbowBeam_Window1Position:
    dw Instruction_HDMAObject_HDMATableBank : db $7E
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl Initialise_Rainbow_Beam
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_MotherBrainRainbowBeam
    dw $0001,MotherBrainRainbowBeamWindow1IndirectHDMATable
    dw Instruction_HDMAObject_Sleep


;;; $E767: Initialise rainbow beam ;;;
Initialise_Rainbow_Beam:
    PHP
    SEP #$20 : REP #$10
    LDA.B #$20 : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.B #$47 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$8F : STA.B DP_ColorMathSubScreenBackdropColor2
    REP #$30
    LDA.W #$0024 : STA.W LayerBlending_Config
    SEP #$20
    LDA.B #$E4 ; >.<
    LDA.B #$64 : STA.L MotherBrainRainbowBeamWindow1IndirectHDMATable
    REP #$20
    LDA.W #MotherBrainRainbowBeamWindow1HDMADataTable : STA.L MotherBrainRainbowBeamWindow1IndirectHDMATable+1
    LDA.W #$0000 : STA.L MotherBrainRainbowBeamWindow1IndirectHDMATable+3
    LDA.W #$0000 : STA.L MotherBrainRainbowBeamWindow1HDMADataTable
    LDA.W #$8020 : STA.L MotherBrainRainbowBeamWindow1HDMADataTable+2 ; $7E:9D02 = 20h,80h
    LDA.W #$0000 : STA.L MotherBrainRainbowBeamWindow1HDMADataTable+4
    PHB
    PEA.W Calculate_MotherBrain_RainbowBeam_HDMATables>>8&$FF00 : PLB : PLB ; >.<
    JSL Calculate_MotherBrain_RainbowBeam_HDMATables
    PLB : PLP
    RTL


;;; $E7BC: Pre-instruction - Mother Brain rainbow beam ;;;
PreInstruction_MotherBrainRainbowBeam:
    PHP
    REP #$30
    LDA.W GameState : CMP.W #$0013 : BEQ .delete
    LDA.W #$0024 : STA.W LayerBlending_Config
    LDA.W GameState : CMP.W #$001B : BEQ .return
    PHB
    PEA.W Calculate_MotherBrain_RainbowBeam_HDMATables>>8&$FF00 : PLB : PLB ; >.<
    JSL Calculate_MotherBrain_RainbowBeam_HDMATables
    PLB
    JSR Set_RainbowBeam_ColorMathSubscreenBackdropColor

  .return:
    PLP
    RTL

  .delete:
    LDX.W HDMAObject_Index
    STZ.W HDMAObject_ChannelBitflags,X
    PLP
    RTL


;;; $E7ED: Set rainbow beam colour math subscreen backdrop colour ;;;
Set_RainbowBeam_ColorMathSubscreenBackdropColor:
    LDX.W HDMAObject_Var0
    LDA.W .table,X : BPL .notSet
    STZ.W HDMAObject_Var0
    LDA.W .table
    BRA .setColor

  .notSet:
    INC.W HDMAObject_Var0 : INC.W HDMAObject_Var0
    INC.W HDMAObject_Var0 : INC.W HDMAObject_Var0

  .setColor:
    PHA
    SEP #$20
    AND.B #$1F : ORA.B #$20 : STA.B DP_ColorMathSubScreenBackdropColor0
    REP #$20
    LDA.B $01,S : ASL #3 : XBA
    SEP #$20
    AND.B #$1F : ORA.B #$40 : STA.B DP_ColorMathSubScreenBackdropColor1
    REP #$20
    PLA : LSR #2 : XBA
    SEP #$20
    AND.B #$1F : ORA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor2
    REP #$20
    RTS

  .table:
; Rainbow beam colour table
; The table index is incremented by 4 per frame instead of 2, so only entries 2k for some k are used
    dw $001F,$005F, $009F,$00DF, $011F,$015F, $019F,$01DF
    dw $023F,$027F, $02BF,$02FF, $033F,$037F, $03BF,$03FF
    dw $03FD,$03FB, $03F9,$03F7, $03F5,$03F3, $03F1,$03EF
    dw $03EC,$03EA, $03E8,$03E6, $03E4,$03E2, $03E0,$0BA0
    dw $1360,$1B20, $22E0,$2AA0, $3260,$3A20, $45E0,$4D80
    dw $5540,$5D00, $64C0,$6C80, $7440,$7C00, $7C02,$7C04
    dw $7C06,$7C08, $7C0A,$7C0C, $7C0D,$7C2F, $7C31,$7C33
    dw $7C35,$7C37, $7C39,$7C3B, $7C1F,$741F, $6C1F,$641F
    dw $5C1F,$541F, $4C1F,$441F, $3C1F,$301F, $281F,$201F
    dw $181F,$101F, $081F,$FFFF, $FFFF
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF ; Excess terminators


;;; $E8D9: Spawn morph ball eye beam HDMA object ;;;
Spawn_MorphBallEyeBeam_HDMAObject:
    PHP : PHB
    PHK : PLB
    REP #$30
    PHX
    JSL Spawn_HDMAObject
    db $41,$26
    dw InstList_MorphBallEyeBeam_Window1Position
    PLX : PLB : PLP
    RTL


;;; $E8EC: Instruction list - window 1 position - morph ball eye beam ;;;
InstList_MorphBallEyeBeam_Window1Position:
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObject_HDMATableBank : db $7E
    dw Instruction_Initialise_MorphBallEyeBeam_HDMA
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_MorphBallEyeBeam_BeamIsWidening
    dw $0001,$9000
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_MorphBallEyeBeamHDMA_FullBeam
    dw $0001,$9000
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_MorphBallEyeBeamHDMA_DeactivateBeam
    dw $0001,$9000
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_Delete


;;; $E917: Instruction - initialise morph ball eye beam HDMA ;;;
Instruction_Initialise_MorphBallEyeBeam_HDMA:
;; Parameters:
;;     X: HDMA object index
    PHP
    SEP #$20 : REP #$10
    LDA.B #$30 : STA.W HDMAObject_Var0,X : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.B #$50 : STA.W HDMAObject_Var0+1,X : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$80 : STA.W HDMAObject_Var1,X : STA.B DP_ColorMathSubScreenBackdropColor2
    REP #$30
    LDA.W #$0010 : STA.W LayerBlending_Config
    LDA.W #$00E4 : STA.L EyeBeamWindow1IndirectHDMATable
    LDA.W #EyeBeamWindow1HDMADataTable : STA.L EyeBeamWindow1IndirectHDMATable+1
    LDA.W #$00E4 : STA.L EyeBeamWindow1IndirectHDMATable+3
    LDA.W #EyeBeamWindow1HDMADataTable+$C8 : STA.L EyeBeamWindow1IndirectHDMATable+4
    LDA.W #$0098 : STA.L EyeBeamWindow1IndirectHDMATable+6
    LDA.W #EyeBeamWindow1HDMADataTable+$190 : STA.L EyeBeamWindow1IndirectHDMATable+7
    LDA.W #$0000 : STA.L EyeBeamWindow1IndirectHDMATable+9
    LDA.W #$0001 : STA.W Eye.activatedFlag+$40
    STZ.W HDMAObject_Var2,X : STZ.W HDMAObject_Var3,X
    LDA.W #$0000 : STA.L EyeBeamAngularWidthDelta
    STA.L EyeBeamAngularSubWidthDelta : STA.L EyeBeamColorIndex
    PLP
    RTS


;;; $E987: Update morph ball eye beam HDMA data table and colour math subscreen backdrop colour ;;;
Update_MorphBallEyeBeam_HDMATable_ColorMathSubScnBackColor:
;; Parameters:
;;     X: HDMA object index
    PHP
    REP #$30
    PHX
    LDA.W Eye.angle+$40 : STA.B DP_Temp12
    LDA.W HDMAObject_Var2,X : STA.B DP_Temp14
    LDA.W Enemy[1].YPosition : SEC : SBC.W Layer1YPosition : TAY
    LDA.W Enemy[1].XPosition : SEC : SBC.W Layer1XPosition : TAX
    BMI .offScreen
    CMP.W #$0100 : BPL .offScreen
    SEP #$20
    LDA.B #EyeBeamWindow1HDMADataTable>>16 : STA.B DP_Temp02
    REP #$20
    LDA.W #EyeBeamWindow1HDMADataTable : STA.B DP_Temp00
    JSL Calc_Xray_HDMADataTable_OnScreen
    BRA .merge

  .offScreen:
    SEP #$20
    LDA.B #EyeBeamWindow1HDMADataTable>>16 : STA.B DP_Temp02
    REP #$20
    LDA.W #EyeBeamWindow1HDMADataTable : STA.B DP_Temp00
    JSL Calc_Xray_HDMADataTable_OffScreen

  .merge:
    PLX
    SEP #$20
    LDA.W HDMAObject_Var0,X : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.W HDMAObject_Var0+1,X : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.W HDMAObject_Var1,X : STA.B DP_ColorMathSubScreenBackdropColor2
    REP #$20 ; >_<
    PLP
    RTS


;;; $E9E6: Pre-instruction - morph ball eye beam HDMA - beam is widening ;;;
PreInstruction_MorphBallEyeBeam_BeamIsWidening:
;; Parameters:
;;     X: HDMA object index
    PHP
    REP #$30
    LDA.W #$0010 : STA.W LayerBlending_Config
    LDA.L EyeBeamAngularSubWidthDelta : CLC : ADC.W #$4000 : STA.L EyeBeamAngularSubWidthDelta
    LDA.L EyeBeamAngularWidthDelta : ADC.W #$0000 : STA.L EyeBeamAngularWidthDelta
    LDA.W HDMAObject_Var3,X : CLC : ADC.L EyeBeamAngularSubWidthDelta : STA.W HDMAObject_Var3,X
    LDA.W HDMAObject_Var2,X : ADC.L EyeBeamAngularWidthDelta : STA.W HDMAObject_Var2,X
    CMP.W #$0004 : BMI .update
    LDA.W #$0004 : STA.W HDMAObject_Var2,X
    LDX.W HDMAObject_Index
    LDA.W HDMAObject_InstListPointers,X : INC #2 : STA.W HDMAObject_InstListPointers,X
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X

  .update:
    JSR Update_MorphBallEyeBeam_HDMATable_ColorMathSubScnBackColor
    PLP
    RTL


;;; $EA3C: Pre-instruction - morph ball eye beam HDMA - full beam ;;;
PreInstruction_MorphBallEyeBeamHDMA_FullBeam:
;; Parameters:
;;     X: HDMA object index
    PHP
    REP #$30
    LDA.W #$0010 : STA.W LayerBlending_Config
    LDA.W Eye.activatedFlag+$40 : BNE .update
    LDX.W HDMAObject_Index
    LDA.W HDMAObject_InstListPointers,X : INC #2 : STA.W HDMAObject_InstListPointers,X
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X
    PLP
    RTL

  .update:
    JSR Update_MorphBallEyeBeam_HDMATable_ColorMathSubScnBackColor
    LDA.L EyeBeamColorIndex : ASL #2 : TAY
    SEP #$20
    LDA.W .red,Y : STA.W HDMAObject_Var0,X
    LDA.W .green,Y : STA.W HDMAObject_Var0+1,X
    LDA.W .blue,Y : STA.W HDMAObject_Var1,X
    REP #$20
    LDA.L EyeBeamColorIndex : INC : AND.W #$000F : STA.L EyeBeamColorIndex
    PLP
    RTL

;        ____________ Red component
;       |    ________ Green component
;       |   |    ____ Blue component
;       |   |   |
  .red:
    db $30
  .green:
    db     $50
  .blue:
    db         $80, $00
    db $2F,$4F,$80, $00
    db $2E,$4E,$80, $00
    db $2D,$4D,$80, $00
    db $2C,$4C,$80, $00
    db $2B,$4B,$80, $00
    db $2A,$4A,$80, $00
    db $29,$49,$80, $00
    db $28,$48,$80, $00
    db $29,$49,$80, $00
    db $2A,$4A,$80, $00
    db $2B,$4B,$80, $00
    db $2C,$4C,$80, $00
    db $2D,$4D,$80, $00
    db $2E,$4E,$80, $00
    db $2F,$4F,$80, $00


;;; $EACB: Pre-instruction - morph ball eye beam HDMA - deactivate beam ;;;
PreInstruction_MorphBallEyeBeamHDMA_DeactivateBeam:
;; Parameters:
;;     X: HDMA object index
    PHP
    REP #$30
    LDA.W #$0010 : STA.W LayerBlending_Config
    SEP #$20
    LDA.W HDMAObject_Var0+1,X : CMP.B #$40 : BNE .notDone
    LDA.B #$20 : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.B #$40 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B #$80 : STA.B DP_ColorMathSubScreenBackdropColor2
    REP #$20
    STZ.W HDMAObject_Var3,X : STZ.W HDMAObject_Var2,X
    LDX.W #$01FE

  .loop:
    LDA.W #$00FF : STA.L EyeBeamWindow1HDMADataTable,X
    DEX #2 : BPL .loop
    LDA.W #$0000 : STA.L EyeBeamWindow1IndirectHDMATable
    STA.L EyeBeamWindow1IndirectHDMATable+2 : STA.L EyeBeamWindow1IndirectHDMATable+4
    STA.L EyeBeamWindow1IndirectHDMATable+6 : STA.L EyeBeamWindow1IndirectHDMATable+8
    LDX.W HDMAObject_Index
    LDA.W HDMAObject_InstListPointers,X : INC #2 : STA.W HDMAObject_InstListPointers,X
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X
    BRA .return

  .notDone:
    REP #$20
    JSR Update_MorphBallEyeBeam_HDMATable_ColorMathSubScnBackColor
    LDX.W HDMAObject_Index
    SEP #$20
    LDA.W HDMAObject_Var0,X : CMP.B #$20 : BEQ .green
    DEC : STA.W HDMAObject_Var0,X

  .green:
    LDA.W HDMAObject_Var0+1,X : CMP.B #$40 : BEQ .blue
    DEC : STA.W HDMAObject_Var0+1,X

  .blue:
    LDA.W HDMAObject_Var1,X : CMP.B #$80 : BEQ .returnREP20
    DEC : STA.W HDMAObject_Var1,X

  .returnREP20:
    REP #$20 ; >.<

  .return:
    PLP
    RTL


;;; $EB58: Spawn title sequence gradient HDMA objects ;;;
Spawn_TitleSequenceGradient_HDMAObjects:
    PHP : PHB
    PHK : PLB
    REP #$30
    PHX
    JSL Spawn_HDMAObject
    db $00,$32
    dw InstList_ColorMathSubScnBackdropColor_TitleSequenceGradient
    JSL Spawn_HDMAObject
    db $00,$31
    dw InstList_ColorMathControlRegB_TitleSequenceGradient
    PLX : PLB : PLP
    RTL


;;; $EB73: Instruction list - colour math subscreen backdrop colour - title sequence gradient ;;;
InstList_ColorMathSubScnBackdropColor_TitleSequenceGradient:
    dw Instruction_HDMAObject_HDMATableBank : db $7E
    dw Instruction_Setup_TitleSequenceGradient_HDMATable
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInst_ColorMathSubScnBackdropColor_TitleSequenceGradient
    dw $0001,SuitPickupWindow1HDMADataTable
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_Delete


;;; $EB85: Instruction list - colour math control register B - title sequence gradient ;;;
InstList_ColorMathControlRegB_TitleSequenceGradient:
    dw Instruction_HDMAObject_HDMATableBank : db $88
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_ColorMathControlRegB_TitleSequenceGradient
    dw $0001,HDMATable_ColorMathControlRegB_TitleSequenceGradient
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_Delete


;;; $EB95: HDMA table - colour math control register B - title sequence gradient ;;;
HDMATable_ColorMathControlRegB_TitleSequenceGradient:
    db $40,$A1 ;\
    db $3A,$A1 ;} Enable subtractive colour math on BG1/backdrop
    db $40,$31 ;\
    db $40,$31 ;} Enable colour math on BG1/sprites/backdrop
    db $00,$00


;;; $EB9F: Instruction - set up title sequence gradient HDMA table ;;;
Instruction_Setup_TitleSequenceGradient_HDMATable:
    PHP
    SEP #$20 : REP #$10
    PHX : PHY
    STZ.B DP_ColorMathA
    JSL Configure_TitleScreen_GradientHDMATable
    PLY : PLX : PLP
    RTS


;;; $EBB0: Pre-instruction - colour math subscreen backdrop colour - title sequence gradient ;;;
PreInst_ColorMathSubScnBackdropColor_TitleSequenceGradient:
    PHP
    REP #$30
    JSL Configure_TitleScreen_GradientHDMATable
    LDA.W CinematicFunction : CMP.W #CinematicFunction_LoadTitleSequence : BNE .return
    LDX.W HDMAObject_Index
    LDA.W HDMAObject_InstListPointers,X : INC #2 : STA.W HDMAObject_InstListPointers,X
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X

  .return:
    PLP
    RTL


;;; $EBD2: Pre-instruction - colour math control register B - title sequence gradient ;;;
PreInstruction_ColorMathControlRegB_TitleSequenceGradient:
    PHP
    REP #$30
    LDA.W CinematicFunction : CMP.W #CinematicFunction_LoadTitleSequence : BNE .return
    LDX.W HDMAObject_Index
    LDA.W HDMAObject_InstListPointers,X : INC #2 : STA.W HDMAObject_InstListPointers,X
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X

  .return:
    PLP
    RTL


;;; $EBF0: Spawn intro cutscene cross-fade HDMA object ;;;
SpawnIntroCutsceneCrossFade_HDMAObject:
    PHP : PHB
    PHK : PLB
    REP #$30
    PHX
    JSL Spawn_HDMAObject
    db $00,$31
    dw InstList_IntroCutsceneCrossFade
    PLX : PLB : PLP
    RTL


;;; $EC03: Instruction list - intro cutscene cross-fade ;;;
InstList_IntroCutsceneCrossFade:
    dw Instruction_HDMAObject_HDMATableBank : db $88
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_IntroCutsceneCrossFade
    dw $0001,HDMATable_IntroCutsceneCrossFade_ColorMathControlRegB
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_Delete


;;; $EC13: HDMA table - intro cutscene cross-fade colour math control register B ;;;
HDMATable_IntroCutsceneCrossFade_ColorMathControlRegB:
    db $17,$02 ; Enable colour math on BG2
    db $60,$06 ; Enable colour math on BG2/BG3
    db $40,$06 ; Enable colour math on BG2/BG3
    db $48,$02 ; Enable colour math on BG2
    db $00,$00


;;; $EC1D: Pre-instruction - intro cutscene cross-fade ;;;
PreInstruction_IntroCutsceneCrossFade:
    PHP
    REP #$30
    LDA.W IntroCrossFadeTimer : CMP.W #$0001 : BNE .return
    LDX.W HDMAObject_Index
    LDA.W HDMAObject_InstListPointers,X : INC #2 : STA.W HDMAObject_InstListPointers,X
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X

  .return:
    PLP
    RTL


;;; $EC3B: Spawn wavy Samus HDMA object ;;;
Spawn_WavySamus_HDMAObject:
; Almost identical to doubled wavelength wavy Phantoon
    PHP : PHB
    PHK : PLB
    REP #$30
    PHX
    LDA.W #$0001 : STA.W WavySamus_Enable
    LDA.W #$4000 : STA.W WavySamus_Amplitude
    LDA.W #$0008 : STA.W WavySamus_PhaseDelta
    LDA.W #$00C0 : STA.W WavySamusBG3XScrollIndirectHDMATable : STA.W WavySamusBG3XScrollIndirectHDMATable+3
    STA.W WavySamusBG3XScrollIndirectHDMATable+6 : STA.W WavySamusBG3XScrollIndirectHDMATable+9
    LDA.W #WavySamusBG3XScrollHDMADataTable : STA.W WavySamusBG3XScrollIndirectHDMATable+1
    LDA.W #WavySamusBG3XScrollHDMADataTable+$80 : STA.W WavySamusBG3XScrollIndirectHDMATable+4
    LDA.W #WavySamusBG3XScrollHDMADataTable : STA.W WavySamusBG3XScrollIndirectHDMATable+7
    LDA.W #WavySamusBG3XScrollHDMADataTable+$80 : STA.W WavySamusBG3XScrollIndirectHDMATable+$A
    STZ.W WavySamusBG3XScrollIndirectHDMATable+$C
    JSL Spawn_HDMAObject
    db $42,$11
    dw InstList_WavySamus
    PLX : PLB : PLP
    RTL


;;; $EC8A: Instruction list - wavy Samus ;;;
InstList_WavySamus:
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObject_HDMATableBank : db $00
    dw Instruction_Setup_WavySamus
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_WavySamus
    dw $0001,WavySamusBG3XScrollIndirectHDMATable
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_Delete


;;; $EC9F: Instruction - set up wavy Samus ;;;
Instruction_Setup_WavySamus:
;; Parameters:
;;     X: HDMA object index
    PHP
    REP #$30
    LDA.W #$FFFE : STA.W HDMAObject_Var0,X
    LDA.W #$0001 : STA.W HDMAObject_Var1,X
    STZ.W HDMAObject_Var2,X : STZ.W HDMAObject_Var3,X
    PLP
    RTS


;;; $ECB6: Pre-instruction - wavy Samus ;;;
PreInstruction_WavySamus:
    PHP
    REP #$30
    LDA.W WavySamus_Enable : BNE .enabled
    LDX.W HDMAObject_Index
    LDA.W HDMAObject_InstListPointers,X : INC #2 : STA.W HDMAObject_InstListPointers,X
    LDA.W #$0001 : STA.W HDMAObject_InstructionTimers,X
    PLP
    RTL

  .enabled:
    LDA.W #$0004 : STA.B DP_Temp1C
    LDA.W #$0080 : STA.B DP_Temp1E
    PHX
    LDA.W WavySamus_PhaseDelta : ASL : STA.B DP_Temp12
    LDA.W HDMAObject_Var0,X : CLC : ADC.B DP_Temp12 : AND.W #$01FF : STA.W HDMAObject_Var0,X
    LDA.W HDMAObject_Var0,X : STA.B DP_Temp14
    LDX.W #$0000

  .loop:
    PHX
    LDX.B DP_Temp14
    LDA.L SineCosineTables_8bitSine_SignExtended,X : BPL +
    JMP .negative

+   STA.B DP_Temp12
    SEP #$20
    STA.W $4202
    LDA.W WavySamus_Amplitude : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : XBA : AND.W #$00FF : STA.B DP_Temp16
    SEP #$20
    LDA.B DP_Temp13 : STA.W $4202
    LDA.W WavySamus_Amplitude : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : CLC : ADC.B DP_Temp16 : STA.B DP_Temp16
    SEP #$20
    LDA.B DP_Temp12 : STA.W $4202
    LDA.W WavySamus_Amplitude+1 : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : STA.B DP_Temp18
    SEP #$20
    LDA.B DP_Temp13 : STA.W $4202
    LDA.W WavySamus_Amplitude+1 : STA.W $4203
    REP #$20
    LDA.B DP_Temp16 : CLC : ADC.B DP_Temp18 : STA.B DP_Temp16
    LDA.W $4215 : AND.W #$FF00 : CLC : ADC.B DP_Temp16
    AND.W #$FF00 : XBA : STA.B DP_Temp12
    TXA : CLC : ADC.B DP_Temp1C : AND.W #$01FF : STA.B DP_Temp14
    PLX
    LDA.B DP_BG3XScroll : CLC : ADC.B DP_Temp12 : STA.L WavySamusBG3XScrollHDMADataTable,X
    JMP .next

  .negative:
    EOR.W #$FFFF : INC : STA.B DP_Temp12
    SEP #$20
    STA.W $4202
    LDA.W WavySamus_Amplitude : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : XBA : AND.W #$00FF : STA.B DP_Temp16
    SEP #$20
    LDA.B DP_Temp13 : STA.W $4202
    LDA.W WavySamus_Amplitude : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : CLC : ADC.B DP_Temp16 : STA.B DP_Temp16
    SEP #$20
    LDA.B DP_Temp12 : STA.W $4202
    LDA.W WavySamus_Amplitude+1 : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : STA.B DP_Temp18
    SEP #$20
    LDA.B DP_Temp13 : STA.W $4202
    LDA.W WavySamus_Amplitude+1 : STA.W $4203
    REP #$20
    LDA.B DP_Temp16 : CLC : ADC.B DP_Temp18 : STA.B DP_Temp16
    LDA.W $4215 : AND.W #$FF00 : CLC : ADC.B DP_Temp16
    AND.W #$FF00 : XBA : STA.B DP_Temp12
    TXA : CLC : ADC.B DP_Temp1C : AND.W #$01FF : STA.B DP_Temp14
    PLX
    LDA.B DP_BG3XScroll : SEC : SBC.B DP_Temp12 : STA.L WavySamusBG3XScrollHDMADataTable,X

  .next:
    INX #2 : CPX.B DP_Temp1E : BPL +
    JMP .loop

+   LDX.W #$007E

  .loopBG3XScroll:
    LDA.B DP_BG3XScroll : SEC : SBC.L WavySamusBG3XScrollHDMADataTable,X
    CLC : ADC.B DP_BG3XScroll : STA.L WavySamusBG3XScrollHDMADataTable+$80,X
    DEX #2 : BPL .loopBG3XScroll
    PLX : PLP
    RTL


Freespace_Bank88_EE32:
; $11CE bytes
