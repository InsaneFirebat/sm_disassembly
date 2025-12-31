
; HDMA

org $888000


;{
; General comments
;{
; Summary of `LayerBlending_Config != 0` branch
; |_LayerBlending_Config_____|_Main screen layers__|_Subscreen layers____|_Colour math_|_Colour math layers___________|_Y_|_Misc.________________________________
; | 2/Eh/20h    | BG1/BG2/    sprites |         BG3         | Additive    | BG1/BG2    /sprites/backdrop | 0 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | 4           | BG1    /    sprites |         BG3         | Additive    | BG1/BG2    /sprites/backdrop | 0 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | 6           | BG1/BG2/    sprites |         BG3/sprites | Additive    | BG1/BG2/BG3        /backdrop | 0 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | 8           | BG1/BG2/    sprites |         BG3/sprites | Additive    |     BG2            /backdrop | 0 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | Ah          | BG1/BG2/    sprites |         BG3         | Additive    |     BG2    /sprites/backdrop | 0 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | Ch          | BG1/BG2/    sprites |         BG3         | Subtractive |     BG2            /backdrop | 0 | Disable colour math subscreen layers,  disable window masking, enable all layers in window area
; | 10h/12h     | BG1/BG2/    sprites |         BG3         | Additive    | BG1/BG2    /sprites/backdrop | 0 | Enable  colour math subscreen layers,  enable BG3 / colour math window 1 inclusive mask, disable BG3 in window area subscreen
; | 14h/22h     | BG1/BG2/    sprites |         BG3         | Subtractive |     BG2    /sprites/backdrop | 0 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | 16h         | BG1    /    sprites |     BG2/BG3         | Subtractive | BG1        /sprites/backdrop | 4 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | 18h/1Eh/30h |         BG3         | BG1/BG2    /sprites | Additive    |         BG3        /backdrop | 2 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | 1Ah         | BG1    /BG3/sprites |     BG2             | Additive    | BG1    /BG3/sprites/backdrop | 4 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | 1Ch         | BG1    /BG3/sprites |     BG2             | Halved      | BG1    /BG3/sprites          | 0 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | 24h         | BG1/BG2/    sprites |         BG3         | Additive    | BG1/BG2    /sprites/backdrop | 0 | Restrict colour math to inside window, disable BG1/BG2 window 1/2 masking, enable BG3/colour math window 1 inclusive mask, disable BG1/BG2/sprites in window area main screen, disable BG3 in window area subscreen
; | 26h         | BG1/BG2/    sprites |         BG3         | Halved      | BG1/BG2/BG3/sprites/backdrop | 0 | Enable  colour math subscreen layers,  disable window masking, enable all layers in window area
; | 28h         | BG1/BG2/    sprites |         BG3         | Subtractive |     BG2    /sprites/backdrop | 0 | Disable colour math subscreen layers,  disable window masking, enable all layers in window area, if LayerBlending_Window2Config & 80h = 0: colour math subscreen backdrop colour = (5, 0, 0) (red)
; | 2Ah         | BG1/BG2/    sprites |         BG3         | Subtractive |     BG2    /sprites/backdrop | 0 | Disable colour math subscreen layers,  disable window masking, enable all layers in window area, if LayerBlending_Window2Config & 80h = 0: colour math subscreen backdrop colour = (6, 2, 0) (orange)
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
{
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
{
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
    PHP                                                                  ;888000;
    SEP #$30                                                             ;888001;
    LDY.B #$00                                                           ;888003;
    LDX.W LayerBlending_Config                                           ;888005;
    BEQ .powerBomb                                                       ;888008;
    JSR.W Initialize_LayerBlending                                       ;88800A;
    JSR.W (.pointers,X)                                                  ;88800D;

  .powerBomb:
    BIT.W LayerBlending_Window2Config                                    ;888010;
    BPL .xrayShowBlocks                                                  ;888013;
    JSR.W Handle_LayerBlending_PowerBomb                                 ;888015;
    BRA .return                                                          ;888018;

  .xrayShowBlocks:
    BIT.W LayerBlending_Window2Config                                    ;88801A;
    BVC .xrayHideBlocks                                                  ;88801D;
    JSR.W Handle_LayerBlending_Xray_CanShowBlocks                        ;88801F;
    BRA .return                                                          ;888022;

  .xrayHideBlocks:
    LDA.W LayerBlending_Window2Config                                    ;888024;
    BIT.B #$20                                                           ;888027;
    BEQ .xrayFirefleaRoom                                                ;888029;
    JSR.W Handle_LayerBlending_Xray_CantShowBlocks                       ;88802B;
    BRA .return                                                          ;88802E;

  .xrayFirefleaRoom:
    LDA.W LayerBlending_Window2Config                                    ;888030;
    BIT.B #$10                                                           ;888033;
    BEQ .return                                                          ;888035;
    JSR.W Handle_LayerBlending_Xray_FirefleaRoom                         ;888037;
    BRA .return                                                          ;88803A; >_<

  .return:
    PLP                                                                  ;88803C;
    RTS                                                                  ;88803D;

  .pointers:
    dw RTS_888074                                                        ;88803E;
    dw RTS_888074                                                        ;888040;
    dw LayerBlending_4_Phantoon                                          ;888042;
    dw UNUSED_LayerBlending_6_888099                                     ;888044;
    dw LayerBlending_8_WreckedShipPowerOff                               ;888046;
    dw LayerBlending_A_Spores                                            ;888048;
    dw LayerBlending_C_Fireflea                                          ;88804A;
    dw RTS_8880B7                                                        ;88804C;
    dw LayerBlending_10_12_MorphBallEye_SuitPickup                       ;88804E;
    dw LayerBlending_10_12_MorphBallEye_SuitPickup                       ;888050;
    dw LayerBlending_14_22_Water                                         ;888052;
    dw LayerBlending_16_Water                                            ;888054;
    dw LayerBlending_18_1E_30_Water_LavaAcid_Fog                         ;888056;
    dw LayerBlending_1A_Phantoon                                         ;888058;
    dw LayerBlending_1C                                                  ;88805A;
    dw LayerBlending_18_1E_30_Water_LavaAcid_Fog                         ;88805C;
    dw RTS_88810C                                                        ;88805E;
    dw LayerBlending_14_22_Water                                         ;888060;
    dw LayerBlending_24_MotherBrain                                      ;888062;
    dw LayerBlending_26                                                  ;888064;
    dw LayerBlending_28                                                  ;888066;
    dw LayerBlending_2A                                                  ;888068;
    dw LayerBlending_2C                                                  ;88806A;
    dw LayerBlending_2E                                                  ;88806C;
    dw LayerBlending_18_1E_30_Water_LavaAcid_Fog                         ;88806E;
    dw UNUSED_LayerBlending_32_88814A                                    ;888070;
    dw LayerBlending_34                                                  ;888072;


;;; $8074: RTS. Layer blending configuration 0/2 ;;;
RTS_888074:
    RTS                                                                  ;888074;


;;; $8075: Initialise layer blending ;;;
Initialize_LayerBlending:
    STZ.B DP_WindowMaskBG12                                              ;888075;
    STZ.B DP_WindowMaskBG34                                              ;888077;
    STZ.B DP_WindowMaskSprite                                            ;888079;
    LDA.B #$13                                                           ;88807B;
    STA.B DP_MainScreenLayers                                            ;88807D;
    LDA.B #$04                                                           ;88807F;
    STA.B DP_SubScreenLayers                                             ;888081;
    STZ.B DP_WindowAreaMainScreen                                        ;888083;
    STZ.B DP_WindowAreaSubScreen                                         ;888085;
    LDA.B #$02                                                           ;888087;
    STA.B DP_NextGameplayColorMathA                                      ;888089;
    LDA.B #$33                                                           ;88808B;
    STA.B DP_NextGameplayColorMathB                                      ;88808D;
    RTS                                                                  ;88808F;


;;; $8090: Layer blending configuration 4 - Phantoon - hidden (BG2 disabled) ;;;
LayerBlending_4_Phantoon:
; Used by Phantoon
    LDA.B #$11                                                           ;888090;
    STA.B DP_MainScreenLayers                                            ;888092;
    LDA.B #$04                                                           ;888094;
    STA.B DP_SubScreenLayers                                             ;888096;
    RTS                                                                  ;888098;


;;; $8099: Unused. Layer blending configuration 6 - semi-transparent sprites on BG1/BG2 ;;;
UNUSED_LayerBlending_6_888099:
    LDA.B #$14                                                           ;888099;
    STA.B DP_SubScreenLayers                                             ;88809B;
    LDA.B #$27                                                           ;88809D;
    STA.B DP_NextGameplayColorMathB                                      ;88809F;
    RTS                                                                  ;8880A1;


;;; $80A2: Layer blending configuration 8 - coven (semi-transparent sprites on BG2) ;;;
LayerBlending_8_WreckedShipPowerOff:
; Used in:
;     Room $CA52, state $CA64. Wrecked Ship attic - default
;     Room $CAF6, state $CB08. Wrecked Ship mainstreet - default
;     Room $CCCB, state $CCDD. Wrecked Ship map station - default
    LDA.B #$14                                                           ;8880A2;
    STA.B DP_SubScreenLayers                                             ;8880A4;
    LDA.B #$22                                                           ;8880A6;
    STA.B DP_NextGameplayColorMathB                                      ;8880A8;
    RTS                                                                  ;8880AA;


;;; $80AB: Layer blending configuration Ah - spores (BG3 hidden by BG1) ;;;
LayerBlending_A_Spores:
; Used with spores
    LDA.B #$32                                                           ;8880AB;
    STA.B DP_NextGameplayColorMathB                                      ;8880AD;
    RTS                                                                  ;8880AF;


;;; $80B0: Layer blending configuration Ch - fireflea (BG3 disabled, BG2 dimmed by subscreen backdrop) ;;;
LayerBlending_C_Fireflea:
; Used with FX type = fireflea
    STZ.B DP_NextGameplayColorMathA                                      ;8880B0;
    LDA.B #$A2                                                           ;8880B2;
    STA.B DP_NextGameplayColorMathB                                      ;8880B4;
    RTS                                                                  ;8880B6;


;;; $80B7: RTS. Layer blending configuration Eh - rain ;;;
RTS_8880B7:
; Used with FX type = rain
    RTS                                                                  ;8880B7;


;;; $80B8: Layer blending configuration 10h/12h - subscreen backdrop window (BG3 disabled, colour math disabled outside window 1) ;;;
LayerBlending_10_12_MorphBallEye_SuitPickup:
; 10h is used by morph ball eye
; 12h is used by varia/gravity suit pickup

; The BG3 hides the subscreen backdrop, so the BG3 window mask is used to reveal the subscreen backdrop inside the window
; The colour math window mask disables the blending of BG3 outside the window (note subscreen backdrop is not affected by windowing and must be hidden by BG3)
    LDA.B #$02                                                           ;8880B8;
    STA.B DP_WindowMaskBG34                                              ;8880BA;
    LDA.B #$20                                                           ;8880BC;
    STA.B DP_WindowMaskSprite                                            ;8880BE;
    LDA.B #$04                                                           ;8880C0;
    STA.B DP_WindowAreaSubScreen                                         ;8880C2;
    RTS                                                                  ;8880C4;


;;; $80C5: Layer blending configuration 14h/22h - water - dimmed by BG3 ;;;
LayerBlending_14_22_Water:
; 14h is sometimes used with FX type = water
; 22h is unused
    LDA.B #$B3                                                           ;8880C5;
    STA.B DP_NextGameplayColorMathB                                      ;8880C7;
    RTS                                                                  ;8880C9;


;;; $80CA: Layer blending configuration 16h - water - background waterfalls (dimmed by BG2/BG3) ;;;
LayerBlending_16_Water:
;; Returns:
;;     Y: Layer blending power bomb configuration

; Used with FX type = water in:
;     Room $D72A. Maridia grapple room
;     Room $D913. Maridia grapple wall shaft
;     Room $DA2B. Maridia cacatac room east
    LDY.B #$04                                                           ;8880CA;
    LDA.B #$11                                                           ;8880CC;
    STA.B DP_MainScreenLayers                                            ;8880CE;
    LDA.B #$06                                                           ;8880D0;
    STA.B DP_SubScreenLayers                                             ;8880D2;
    LDA.B #$B1                                                           ;8880D4;
    STA.B DP_NextGameplayColorMathB                                      ;8880D6;
    RTS                                                                  ;8880D8;


;;; $80D9: Layer blending configuration 1Ah - Phantoon - semi-transparent (semi-transparent BG2 on BG1) ;;;
LayerBlending_1A_Phantoon:
;; Returns:
;;     Y: Layer blending power bomb configuration
    LDY.B #$04                                                           ;8880D9;
    LDA.B #$15                                                           ;8880DB;
    STA.B DP_MainScreenLayers                                            ;8880DD;
    LDA.B #$02                                                           ;8880DF;
    STA.B DP_SubScreenLayers                                             ;8880E1;
    LDA.B #$35                                                           ;8880E3;
    STA.B DP_NextGameplayColorMathB                                      ;8880E5;
    RTS                                                                  ;8880E7;


;;; $80E8: Unused. Layer blending configuration 1Ch - semi-transparent BG2 on semi-transparent BG1/BG3/sprites ;;;
LayerBlending_1C:
    LDA.B #$15                                                           ;8880E8;
    STA.B DP_MainScreenLayers                                            ;8880EA;
    LDA.B #$02                                                           ;8880EC;
    STA.B DP_SubScreenLayers                                             ;8880EE;
    LDA.B #$55                                                           ;8880F0;
    STA.B DP_NextGameplayColorMathB                                      ;8880F2;
    RTS                                                                  ;8880F4;


;;; $80F5: Layer blending configuration 18h/1Eh/30h - colour math affects all sprite palettes (semi-transparent BG1/BG2/sprites on BG3) ;;;
LayerBlending_18_1E_30_Water_LavaAcid_Fog:
;; Returns:
;;     Y: Layer blending power bomb configuration

; 18h is sometimes used with FX type = water
; 18h is used with FX type = Tourian entrance statue
; 1Eh is used with FX type = lava/acid
; 30h is used with FX type = fog

; Unsure of the significance of h/v-counter interrupts being disabled...
    LDY.B #$02                                                           ;8880F5;
    LDA.B DP_IRQAutoJoy                                                  ;8880F7;
    AND.B #$30                                                           ;8880F9;
    EOR.B #$30                                                           ;8880FB;
    BNE .return                                                          ;8880FD;
    LDA.B #$24                                                           ;8880FF;
    STA.B DP_NextGameplayColorMathB                                      ;888101;
    LDA.B #$13                                                           ;888103;
    STA.B DP_SubScreenLayers                                             ;888105;
    LDA.B #$04                                                           ;888107;
    STA.B DP_MainScreenLayers                                            ;888109;

  .return:
    RTS                                                                  ;88810B;


;;; $810C: RTS. Layer blending configuration 20h ;;;
RTS_88810C:
    RTS                                                                  ;88810C;


;;; $810D: Unused. Layer blending configuration 26h - semi-transparent BG3 on semi-transparent BG1/BG2/sprites ;;;
LayerBlending_26:
    LDA.B #$77                                                           ;88810D;
    STA.B DP_NextGameplayColorMathB                                      ;88810F;
    RTS                                                                  ;888111;


;;; $8112: Layer blending configuration 28h - red desaturation (BG3 disabled, dimmed by red subscreen backdrop) ;;;
LayerBlending_28:
; Used in:
;     Room $92FD, state $9314. Crateria mainstreet - default
;     Room $9A44, state $9A56. Crateria bomb block hall - default
;     Room $9A90, state $9AA2. Crateria chozo missile - default
;     Room $C98E, state $C9A0. Wrecked Ship chozo room - default
;     Room $CC6F, state $CC81. Pre Phantoon hall - default
;     Room $D27E. Plasma beam puyo room
;     Room $D387. Pre plasma beam shaft
    STZ.B DP_NextGameplayColorMathA                                      ;888112;
    LDA.B #$B3                                                           ;888114;
    STA.B DP_NextGameplayColorMathB                                      ;888116;
    BIT.W LayerBlending_Window2Config                                    ;888118;
    BMI .return                                                          ;88811B;
    LDA.B #$25                                                           ;88811D;
    STA.B DP_ColorMathSubScreenBackdropColor0                            ;88811F;
    LDA.B #$40                                                           ;888121;
    STA.B DP_ColorMathSubScreenBackdropColor1                            ;888123;
    LDA.B #$80                                                           ;888125;
    STA.B DP_ColorMathSubScreenBackdropColor2                            ;888127;

  .return:
    RTS                                                                  ;888129;


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
    STZ.B DP_NextGameplayColorMathA                                      ;88812A;
    LDA.B #$B3                                                           ;88812C;
    STA.B DP_NextGameplayColorMathB                                      ;88812E;
    BIT.W LayerBlending_Window2Config                                    ;888130;
    BMI .return                                                          ;888133;
    LDA.B #$26                                                           ;888135;
    STA.B DP_ColorMathSubScreenBackdropColor0                            ;888137;
    LDA.B #$42                                                           ;888139;
    STA.B DP_ColorMathSubScreenBackdropColor1                            ;88813B;
    LDA.B #$80                                                           ;88813D;
    STA.B DP_ColorMathSubScreenBackdropColor2                            ;88813F;

  .return:
    RTS                                                                  ;888141;


;;; $8142: Layer blending configuration 2Ch - haze (BG3 disabled) ;;;
LayerBlending_2C:
; Used by FX type = Ceres haze and Bomb Torizo haze
    STZ.B DP_NextGameplayColorMathA                                      ;888142;
    RTS                                                                  ;888144;


;;; $8145: Unused. Layer blending configuration 2Eh - dimmed by BG3 ;;;
LayerBlending_2E:
; Clone of LayerBlending_14_22_Water
    LDA.B #$B3                                                           ;888145;
    STA.B DP_NextGameplayColorMathB                                      ;888147;
    RTS                                                                  ;888149;


;;; $814A: Unused. Layer blending configuration 32h - dimmed by BG3, BG3 hidden by BG1 ;;;
UNUSED_LayerBlending_32_88814A:
    LDA.B #$44                                                           ;88814A;
    STA.B DP_SubScreenLayers                                             ;88814C;
    LDA.B #$B2                                                           ;88814E;
    STA.B DP_NextGameplayColorMathB                                      ;888150;
    RTS                                                                  ;888152;


;;; $8153: Layer blending configuration 34h - Mother Brain phase 2 (power bomb explosion doesn't affect BG2) ;;;
LayerBlending_34:
;; Returns:
;;     Y: Layer blending power bomb configuration
    LDY.B #$06                                                           ;888153;
    RTS                                                                  ;888155;


;;; $8156: Layer blending configuration 24h - Mother Brain rainbow beam (BG3 disabled, colour math disabled outside window 1) ;;;
LayerBlending_24_MotherBrain:
    LDA.B #$00                                                           ;888156;
    STA.B DP_WindowMaskBG12                                              ;888158;
    LDA.B #$02                                                           ;88815A;
    STA.B DP_WindowMaskBG34                                              ;88815C;
    LDA.B #$20                                                           ;88815E;
    STA.B DP_WindowMaskSprite                                            ;888160;
    LDA.B #$13                                                           ;888162;
    STA.B DP_MainScreenLayers                                            ;888164;
    LDA.B #$04                                                           ;888166;
    STA.B DP_SubScreenLayers                                             ;888168;
    LDA.B #$13                                                           ;88816A;
    STA.B DP_WindowAreaMainScreen                                        ;88816C;
    LDA.B #$04                                                           ;88816E;
    STA.B DP_WindowAreaSubScreen                                         ;888170;
    LDA.B #$10                                                           ;888172;
    STA.B DP_NextGameplayColorMathA                                      ;888174;
    LDA.B #$33                                                           ;888176;
    STA.B DP_NextGameplayColorMathB                                      ;888178;
    RTS                                                                  ;88817A;


;;; $817B: Handle layer blending x-ray - can show blocks ;;;
Handle_LayerBlending_Xray_CanShowBlocks:
; Disable BG1 inside window
; Disable BG2 outside window
; Disable BG3
; Enabled halved colour math outside window
    LDA.B #$C8                                                           ;88817B;
    STA.B DP_WindowMaskBG12                                              ;88817D;
    LDA.B #$08                                                           ;88817F;
    STA.B DP_WindowMaskBG34                                              ;888181;
    LDA.B #$80                                                           ;888183;
    STA.B DP_WindowMaskSprite                                            ;888185;
    LDA.B #$13                                                           ;888187;
    STA.B DP_MainScreenLayers                                            ;888189;
    LDA.B #$04                                                           ;88818B;
    STA.B DP_SubScreenLayers                                             ;88818D;
    LDA.B #$03                                                           ;88818F;
    STA.B DP_WindowAreaMainScreen                                        ;888191;
    LDA.B #$04                                                           ;888193;
    STA.B DP_WindowAreaSubScreen                                         ;888195;
    LDA.B #$22                                                           ;888197;
    STA.B DP_NextGameplayColorMathA                                      ;888199;
    LDA.B DP_NextGameplayColorMathB                                      ;88819B;
    AND.B #$80                                                           ;88819D;
    ORA.B #$73                                                           ;88819F;
    STA.B DP_NextGameplayColorMathB                                      ;8881A1;
    RTS                                                                  ;8881A3;


;;; $81A4: Handle layer blending x-ray - can't show blocks ;;;
Handle_LayerBlending_Xray_CantShowBlocks:
; Disable BG3
; Enabled halved colour math outside window
; If n00b tube room, disable BG2
    STZ.B DP_WindowMaskBG12                                              ;8881A4;
    LDA.B #$08                                                           ;8881A6;
    STA.B DP_WindowMaskBG34                                              ;8881A8;
    LDA.B #$80                                                           ;8881AA;
    STA.B DP_WindowMaskSprite                                            ;8881AC;
    LDA.B #$13                                                           ;8881AE;
    STA.B DP_MainScreenLayers                                            ;8881B0;
    LDA.B #$04                                                           ;8881B2;
    STA.B DP_SubScreenLayers                                             ;8881B4;
    LDA.B #$03                                                           ;8881B6;
    STA.B DP_WindowAreaMainScreen                                        ;8881B8;
    LDA.B #$04                                                           ;8881BA;
    STA.B DP_WindowAreaSubScreen                                         ;8881BC;
    LDA.B #$22                                                           ;8881BE;
    STA.B DP_NextGameplayColorMathA                                      ;8881C0;
    LDA.B DP_NextGameplayColorMathB                                      ;8881C2;
    AND.B #$80                                                           ;8881C4;
    ORA.B #$61                                                           ;8881C6;
    STA.B DP_NextGameplayColorMathB                                      ;8881C8;
    REP #$20                                                             ;8881CA;
    LDA.W RoomPointer                                                    ;8881CC;
    CMP.W #RoomHeader_GlassTunnel                                        ;8881CF;
    SEP #$20                                                             ;8881D2;
    BNE .return                                                          ;8881D4;
    LDA.B #$11                                                           ;8881D6;
    STA.B DP_MainScreenLayers                                            ;8881D8;

  .return:
    RTS                                                                  ;8881DA;


;;; $81DB: Handle layer blending x-ray - fireflea room ;;;
Handle_LayerBlending_Xray_FirefleaRoom:
; Disable BG3
; Enabled subtractive colour math outside window
    STZ.B DP_WindowMaskBG12                                              ;8881DB;
    LDA.B #$08                                                           ;8881DD;
    STA.B DP_WindowMaskBG34                                              ;8881DF;
    LDA.B #$80                                                           ;8881E1;
    STA.B DP_WindowMaskSprite                                            ;8881E3;
    LDA.B #$13                                                           ;8881E5;
    STA.B DP_MainScreenLayers                                            ;8881E7;
    LDA.B #$04                                                           ;8881E9;
    STZ.B DP_SubScreenLayers                                             ;8881EB;
    LDA.B #$03                                                           ;8881ED;
    STA.B DP_WindowAreaMainScreen                                        ;8881EF;
    LDA.B #$04                                                           ;8881F1;
    STA.B DP_WindowAreaSubScreen                                         ;8881F3;
    LDA.B #$20                                                           ;8881F5;
    STA.B DP_NextGameplayColorMathA                                      ;8881F7;
    LDA.B #$B3                                                           ;8881F9;
    STA.B DP_NextGameplayColorMathB                                      ;8881FB;
    RTS                                                                  ;8881FD;


;;; $81FE: Handle layer blending power bomb ;;;
Handle_LayerBlending_PowerBomb:
;; Parameters:
;;     Y: Layer blending power bomb configuration
    REP #$30                                                             ;8881FE;
    LDA.W RoomPointer                                                    ;888200;
    CMP.W #RoomHeader_Statues                                            ;888203;
    SEP #$30                                                             ;888206;
    BNE .execute                                                         ;888208;
    LDY.B #$06                                                           ;88820A;

  .execute
    TYX                                                                  ;88820C;
    JSR.W (.pointers,X)                                                  ;88820D;
    RTS                                                                  ;888210;

  .pointers:
    dw Handle_LayerBlending_PowerBomb_0_2                                ;888211;
    dw Handle_LayerBlending_PowerBomb_0_2                                ;888213;
    dw Handle_LayerBlending_PowerBomb_4                                  ;888215;
    dw Handle_LayerBlending_PowerBomb_6                                  ;888217;


;;; $8219: Handle layer blending power bomb configuration 0/2 - normal ;;;
Handle_LayerBlending_PowerBomb_0_2:
    LDA.B #$00                                                           ;888219;
    STA.B DP_WindowMaskBG12                                              ;88821B;
    LDA.B #$08                                                           ;88821D;
    STA.B DP_WindowMaskBG34                                              ;88821F;
    LDA.B #$80                                                           ;888221;
    STA.B DP_WindowMaskSprite                                            ;888223;
    LDA.B #$02                                                           ;888225;
    STA.B DP_NextGameplayColorMathA                                      ;888227;
    LDA.B #$37                                                           ;888229;
    STA.B DP_NextGameplayColorMathB                                      ;88822B;
    LDA.B #$00                                                           ;88822D;
    STA.B DP_WindowAreaMainScreen                                        ;88822F;
    LDA.B #$04                                                           ;888231;
    STA.B DP_WindowAreaSubScreen                                         ;888233;
    LDA.B #$13                                                           ;888235;
    STA.B DP_MainScreenLayers                                            ;888237;
    LDA.B #$04                                                           ;888239;
    STA.B DP_SubScreenLayers                                             ;88823B;
    RTS                                                                  ;88823D;


;;; $823E: Handle layer blending power bomb configuration 4 - BG2 hidden by explosion ;;;
Handle_LayerBlending_PowerBomb_4:
; Used by:
;    Layer blending configuration 16h - water - background waterfalls
;    Layer blending configuration 1Ah - Phantoon - semi-transparent
    LDA.B #$80                                                           ;88823E;
    STA.B DP_WindowMaskBG12                                              ;888240;
    LDA.B #$08                                                           ;888242;
    STA.B DP_WindowMaskBG34                                              ;888244;
    LDA.B #$80                                                           ;888246;
    STA.B DP_WindowMaskSprite                                            ;888248;
    LDA.B #$02                                                           ;88824A;
    STA.B DP_NextGameplayColorMathA                                      ;88824C;
    LDA.B #$37                                                           ;88824E;
    STA.B DP_NextGameplayColorMathB                                      ;888250;
    LDA.B #$00                                                           ;888252;
    STA.B DP_WindowAreaMainScreen                                        ;888254;
    LDA.B #$06                                                           ;888256;
    STA.B DP_WindowAreaSubScreen                                         ;888258;
    LDA.B #$11                                                           ;88825A;
    STA.B DP_MainScreenLayers                                            ;88825C;
    LDA.B #$06                                                           ;88825E;
    STA.B DP_SubScreenLayers                                             ;888260;
    RTS                                                                  ;888262;


;;; $8263: Handle layer blending power bomb configuration 6 - explosion hidden by BG2 ;;;
Handle_LayerBlending_PowerBomb_6:
; Used by:
;     Layer blending configuration 34h - Mother Brain phase 2

; Compared with config 0/2, this one disables colour math on BG2/BG3
    LDA.B #$00                                                           ;888263;
    STA.B DP_WindowMaskBG12                                              ;888265;
    LDA.B #$08                                                           ;888267;
    STA.B DP_WindowMaskBG34                                              ;888269;
    LDA.B #$80                                                           ;88826B;
    STA.B DP_WindowMaskSprite                                            ;88826D;
    LDA.B #$02                                                           ;88826F;
    STA.B DP_NextGameplayColorMathA                                      ;888271;
    LDA.B #$31                                                           ;888273;
    STA.B DP_NextGameplayColorMathB                                      ;888275;
    LDA.B #$00                                                           ;888277;
    STA.B DP_WindowAreaMainScreen                                        ;888279;
    LDA.B #$04                                                           ;88827B;
    STA.B DP_WindowAreaSubScreen                                         ;88827D;
    LDA.B #$13                                                           ;88827F;
    STA.B DP_MainScreenLayers                                            ;888281;
    LDA.B #$04                                                           ;888283;
    STA.B DP_SubScreenLayers                                             ;888285;
    RTS                                                                  ;888287;


;;; $8288: Enable HDMA objects ;;;
Enable_HDMAObjects:
    PHP                                                                  ;888288;
    REP #$20                                                             ;888289;
    LDA.W #$8000                                                         ;88828B;
    TSB.W HDMAObject_Enable                                              ;88828E;
    PLP                                                                  ;888291;
    RTL                                                                  ;888292;


;;; $8293: Disable HDMA objects ;;;
Disable_HDMAObjects:
; Power bombs still work
    PHP                                                                  ;888293;
    REP #$20                                                             ;888294;
    LDA.W #$8000                                                         ;888296;
    TRB.W HDMAObject_Enable                                              ;888299;
    PLP                                                                  ;88829C;
    RTL                                                                  ;88829D;


;;; $829E: Wait until the end of a v-blank and clear (H)DMA enable flags ;;;
Wait_End_VBlank_Clear_HDMA:
    PHP                                                                  ;88829E;
    SEP #$20                                                             ;88829F;
    JSL.L WaitUntilTheEndOfAVBlank                                       ;8882A1;
    STZ.W $420B                                                          ;8882A5;
    STZ.W $420C                                                          ;8882A8;
    PLP                                                                  ;8882AB; fallthrough to Delete_HDMA_Objects


;;; $82AC: Delete HDMA objects ;;;
Delete_HDMAObjects:
    PHP                                                                  ;8882AC;
    SEP #$20                                                             ;8882AD;
    STZ.B DP_HDMAEnable                                                  ;8882AF;
    REP #$30                                                             ;8882B1;
    PHX                                                                  ;8882B3;
    LDX.W #$000A                                                         ;8882B4;

  .loop:
    STZ.W HDMAObject_ChannelBitflags,X                                   ;8882B7;
    DEX                                                                  ;8882BA;
    DEX                                                                  ;8882BB;
    BPL .loop                                                            ;8882BC;
    PLX                                                                  ;8882BE;
    PLP                                                                  ;8882BF;
    RTL                                                                  ;8882C0;


;;; $82C1: Initialise special effects for new room ;;;
Initialise_Special_Effects_for_New_Room:
; This initial bit regarding earthquake sound effects is strictly for rising acid/lava rooms
    PHP                                                                  ;8882C1;
    REP #$20                                                             ;8882C2;
    STZ.W EarthquakeSFX_Index                                            ;8882C4;
    STZ.W EarthquakeSFX_Timer                                            ;8882C7;
    LDA.W RoomPointer                                                    ;8882CA;
    CMP.W #RoomHeader_BombTorizo                                         ;8882CD;
    BEQ .noEarthquakeSFX                                                 ;8882D0;
    CMP.W #RoomHeader_Climb                                              ;8882D2;
    BEQ .noEarthquakeSFX                                                 ;8882D5;
    CMP.W #RoomHeader_Ridley                                             ;8882D7;
    BEQ .noEarthquakeSFX                                                 ;8882DA;
    CMP.W #RoomHeader_Pillar                                             ;8882DC;
    BEQ .noEarthquakeSFX                                                 ;8882DF;
    CMP.W #RoomHeader_MotherBrain                                        ;8882E1;
    BEQ .noEarthquakeSFX                                                 ;8882E4;
    CMP.W #RoomHeader_TourianEscape4                                     ;8882E6;
    BEQ .noEarthquakeSFX                                                 ;8882E9;
    BRA .earthquakeSFX                                                   ;8882EB;

  .noEarthquakeSFX:
    LDA.W #$FFFF                                                         ;8882ED;
    STA.W EarthquakeSFX_Timer                                            ;8882F0;

  .earthquakeSFX:
    STZ.W DisableMinimap                                                 ;8882F3;
    SEP #$30                                                             ;8882F6;
    LDX.B #$20                                                           ;8882F8;

  .loopClearHDMARegisters:
    STZ.W $4300,X                                                        ;8882FA;
    LDA.B #$13                                                           ;8882FD;
    STA.W $4301,X                                                        ;8882FF;
    STZ.W $4302,X                                                        ;888302;
    STZ.W $4303,X                                                        ;888305;
    STZ.W $4304,X                                                        ;888308;
    STZ.W $4305,X                                                        ;88830B;
    STZ.W $4306,X                                                        ;88830E;
    STZ.W $4308,X                                                        ;888311;
    STZ.W $4309,X                                                        ;888314;
    TXA                                                                  ;888317;
    CLC                                                                  ;888318;
    ADC.B #$10                                                           ;888319;
    TAX                                                                  ;88831B;
    CPX.B #$80                                                           ;88831C;
    BNE .loopClearHDMARegisters                                          ;88831E;
    REP #$30                                                             ;888320;
    LDA.W #$FFFF                                                         ;888322;
    STZ.W FX_YSubPosition                                                ;888325;
    STA.W FX_YPosition                                                   ;888328;
    STZ.W FX_LavaAcidYSubPosition                                        ;88832B;
    STA.W FX_LavaAcidYPosition                                           ;88832E;
    LDA.W #$0000                                                         ;888331;
    STA.L HUDBG3XPosition                                                ;888334;
    STA.L HUDBG3YPosition                                                ;888338;
    STA.L BG3XPosition                                                   ;88833C;
    STA.L BG3YPosition                                                   ;888340;
    STZ.W Mode7Flag                                                      ;888344;
    STZ.W CameraDistanceIndex                                            ;888347;
    STZ.W TourianStatueAnimationState                                    ;88834A;
    STZ.W TourianStatueFinishedProcessing                                ;88834D;
    STZ.W EarthquakeTimer                                                ;888350;
    STZ.W LayerBlending_PhantoonSemiTransparencyFlag                     ;888353;
    STZ.W PowerBombExplosionStatus                                       ;888356;
    STZ.W SamusProjectile_PowerBombFlag                                  ;888359;
    STZ.W SamusProjectile_PowerBombExplosionRadius                       ;88835C;
    STZ.W FX_TilemapPointer                                              ;88835F;
    STZ.W FX_Type                                                        ;888362;
    LDA.W #$8000                                                         ;888365;
    STA.W FX_BaseYSubPosition                                            ;888368;
    STZ.W FX_BaseYPosition                                               ;88836B;
    STZ.W FX_TargetYPosition                                             ;88836E;
    STZ.W FX_YSubVelocity                                                ;888371;
    STZ.W FX_LiquidOptions                                               ;888374;
    STZ.W FX_Timer                                                       ;888377;
    STZ.W FX_TidePhase                                                   ;88837A;
    STZ.W FX_YSubOffset                                                  ;88837D;
    STZ.W FX_YOffset                                                     ;888380;
    LDA.W #$0002                                                         ;888383;
    STA.W LayerBlending_DefaultConfig                                    ;888386;
    STZ.B DP_BG3XScroll                                                  ;888389;
    STZ.B DP_BG3YScroll                                                  ;88838B;
    STZ.W Layer2XPosition                                                ;88838D;
    STZ.W Layer2YPosition                                                ;888390;
    STZ.B DP_RoomLoadIRQCmd                                              ;888393;
    LDA.W #.return>>8&$FF00                                              ;888395;
    STA.W PauseHook_Pause+1                                              ;888398;
    STA.W PauseHook_Unpause+1                                            ;88839B;
    LDA.W #.return                                                       ;88839E;
    STA.W PauseHook_Pause                                                ;8883A1;
    STA.W PauseHook_Unpause                                              ;8883A4;
    SEP #$20                                                             ;8883A7;
    LDA.B #$F0                                                           ;8883A9;
    STA.W $2181                                                          ;8883AB;
    LDA.B #$FF                                                           ;8883AE;
    STA.W $2182                                                          ;8883B0;
    LDA.B #$01                                                           ;8883B3;
    STA.W $2183                                                          ;8883B5;
    STZ.B DP_HDMAEnable                                                  ;8883B8;
    LDA.B #$20                                                           ;8883BA;
    STA.B DP_ColorMathSubScreenBackdropColor0                            ;8883BC;
    LDA.B #$40                                                           ;8883BE;
    STA.B DP_ColorMathSubScreenBackdropColor1                            ;8883C0;
    LDA.B #$80                                                           ;8883C2;
    STA.B DP_ColorMathSubScreenBackdropColor2                            ;8883C4;
    STZ.B DP_Mosaic                                                      ;8883C6;
    LDA.B #$13                                                           ;8883C8;
    STA.B DP_MainScreenLayers                                            ;8883CA;
    STZ.B DP_ColorMathA                                                  ;8883CC;
    STZ.B DP_ColorMathB                                                  ;8883CE;
    STZ.B DP_BGTilesAddr                                                 ;8883D0;
    LDA.B #$04                                                           ;8883D2;
    STA.B DP_BGTilesAddr+1                                               ;8883D4;
    LDA.B #$49                                                           ;8883D6;
    STA.B DP_BG2TilemapAddrSize                                          ;8883D8;
    LDA.B #$5A                                                           ;8883DA;
    STA.B DP_BG3TilemapAddrSize                                          ;8883DC;
    STA.B DP_GameplayBG1TilemapAddrSize                                  ;8883DE;
    PLP                                                                  ;8883E0;

.return:
    RTL                                                                  ;8883E1;


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
    PHP                                                                  ;8883E2;
    PHB                                                                  ;8883E3;
    REP #$20                                                             ;8883E4;
    LDA.W #$0400                                                         ;8883E6;
    STA.B DP_Temp12                                                      ;8883E9;
    LDA.W #$0020                                                         ;8883EB;
    STA.B DP_Temp14                                                      ;8883EE;
    LDX.W #$0000                                                         ;8883F0;
    JMP.W SpawnHDMAObject_SlotX_Hardcoded                                ;8883F3;


;;; $83F6: Unused. Spawn HDMA object on HDMA channel 6 ;;;
UNUSED_SpawnHDMAObject_Slot8_Channel40_Index60_8883F6:
;; Parameters:
;;     [[S] + 1] + 1: HDMA control
;;     [[S] + 1] + 2: HDMA target
;;     [[S] + 1] + 3: HDMA object instruction list pointer
;; Returns:
;;     Carry: Clear
;;     A: HDMA object index
    PHP                                                                  ;8883F6;
    PHB                                                                  ;8883F7;
    REP #$20                                                             ;8883F8;
    LDA.W #$4000                                                         ;8883FA;
    STA.B DP_Temp12                                                      ;8883FD;
    LDA.W #$0060                                                         ;8883FF;
    STA.B DP_Temp14                                                      ;888402;
    LDX.W #$0008                                                         ;888404;
    JMP.W SpawnHDMAObject_SlotX_Hardcoded                                ;888407;
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
    PHP                                                                  ;88840A;
    PHB                                                                  ;88840B;
    REP #$20                                                             ;88840C;
    LDA.W #$8000                                                         ;88840E;
    STA.B DP_Temp12                                                      ;888411;
    LDA.W #$0070                                                         ;888413;
    STA.B DP_Temp14                                                      ;888416;
    LDX.W #$000A                                                         ;888418; fallthrough to SpawnHDMAObject_SlotX_Hardcoded


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
    SEP #$20                                                             ;88841B;
    LDA.B $05,S                                                          ;88841D;
    PHA                                                                  ;88841F;
    PLB                                                                  ;888420;
    XBA                                                                  ;888421;
    LDA.B #$00                                                           ;888422;
    REP #$30                                                             ;888424;
    STA.B DP_Temp18                                                      ;888426;
    LDA.B $03,S                                                          ;888428;
    TAY                                                                  ;88842A;
    INY                                                                  ;88842B;
    CLC                                                                  ;88842C;
    ADC.W #$0004                                                         ;88842D;
    STA.B $03,S                                                          ;888430;
    JMP.W Spawn_HDMAObject_to_Slot_X                                     ;888432;


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
    PHP                                                                  ;888435;
    PHB                                                                  ;888436;
    SEP #$20                                                             ;888437;
    LDA.B $05,S                                                          ;888439;
    PHA                                                                  ;88843B;
    PLB                                                                  ;88843C;
    XBA                                                                  ;88843D;
    LDA.B #$00                                                           ;88843E;
    REP #$30                                                             ;888440;
    STA.B DP_Temp18                                                      ;888442;
    LDA.B $03,S                                                          ;888444;
    TAY                                                                  ;888446;
    INY                                                                  ;888447;
    CLC                                                                  ;888448;
    ADC.W #$0004                                                         ;888449;
    STA.B $03,S                                                          ;88844C;
    LDA.W #$0400                                                         ;88844E;
    STA.B DP_Temp12                                                      ;888451;
    LDA.W #$0020                                                         ;888453;
    STA.B DP_Temp14                                                      ;888456;
    LDX.W #$0000                                                         ;888458;

  .loop:
    LDA.W HDMAObject_ChannelBitflags,X                                   ;88845B;
    BEQ Spawn_HDMAObject_to_Slot_X                                       ;88845E;
    ASL.B DP_Temp12                                                      ;888460;
    BCS .returnFullArray                                                 ;888462;
    LDA.B DP_Temp14                                                      ;888464;
    CLC                                                                  ;888466;
    ADC.W #$0010                                                         ;888467;
    STA.B DP_Temp14                                                      ;88846A;
    INX                                                                  ;88846C;
    INX                                                                  ;88846D;
    CPX.W #$000C                                                         ;88846E;
    BNE .loop                                                            ;888471;

  .returnFullArray:
    PLB                                                                  ;888473;
    PLP                                                                  ;888474;
    SEC                                                                  ;888475;
    RTL                                                                  ;888476;


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
    LDA.W #.return                                                       ;888477;
    STA.W HDMAObject_PreInstructions,X                                   ;88847A;
    LDA.W #$0088                                                         ;88847D;
    STA.W HDMAObject_PreInstructionBanks,X                               ;888480;
    LDA.W $0002,Y                                                        ;888483;
    STA.W HDMAObject_InstListPointers,X                                  ;888486;
    LDA.W #$0001                                                         ;888489;
    STA.W HDMAObject_InstructionTimers,X                                 ;88848C;
    STZ.W HDMAObject_Timers,X                                            ;88848F;
    STZ.W HDMAObject_Var0,X                                              ;888492;
    STZ.W HDMAObject_Var1,X                                              ;888495;
    STZ.W HDMAObject_Var2,X                                              ;888498;
    STZ.W HDMAObject_Var3,X                                              ;88849B;
    LDA.B DP_Temp12                                                      ;88849E;
    XBA                                                                  ;8884A0;
    STA.W HDMAObject_ChannelBitflags,X                                   ;8884A1;
    LDA.B DP_Temp14                                                      ;8884A4;
    ORA.B DP_Temp18                                                      ;8884A6;
    STA.W HDMAObject_ChannelIndicesBanks,X                               ;8884A8;
    PHX                                                                  ;8884AB;
    LDX.B DP_Temp14                                                      ;8884AC;
    LDA.W $0000,Y                                                        ;8884AE;
    STA.W $4300,X                                                        ;8884B1;
    PLA                                                                  ;8884B4;
    PLB                                                                  ;8884B5;
    PLP                                                                  ;8884B6;
    CLC                                                                  ;8884B7;

  .return:
    RTL                                                                  ;8884B8;


;;; $84B9: HDMA object handler (also handle music queue) ;;;
HDMAObjectHandler_HandleMusicQueue:
; Also spawns power bombs that were set as pending due to Samus dying(?) or auto reserve tanks activating
; Also calls the layer blending handler
; Seriously, why is the music queue handler called here... >_<;
    PHP                                                                  ;8884B9;
    PHB                                                                  ;8884BA;
    REP #$30                                                             ;8884BB;
    JSL.L HandleMusicQueue                                               ;8884BD;
    LDA.W TimeIsFrozenFlag                                               ;8884C1;
    BNE +                                                                ;8884C4;
    BIT.W PowerBombExplosionStatus                                       ;8884C6;
    BVC +                                                                ;8884C9;
    LDA.W #$8000                                                         ;8884CB;
    STA.W PowerBombExplosionStatus                                       ;8884CE;
    JSL.L Spawn_HDMAObject                                               ;8884D1;
    db $40,$28                                                           ;8884D5;
    dw InstList_PowerBombExplosion_Window2_LeftPosition                  ;8884D7;
    JSL.L Spawn_HDMAObject                                               ;8884D9;
    db $40,$29                                                           ;8884DD;
    dw InstList_PowerBombExplosion_Window2_RightPosition                 ;8884DF;

+   PHK                                                                  ;8884E1;
    PLB                                                                  ;8884E2;
    REP #$30                                                             ;8884E3;
    LDA.W LayerBlending_DefaultConfig                                    ;8884E5;
    STA.W LayerBlending_Config                                           ;8884E8;
    BIT.W HDMAObject_Enable                                              ;8884EB;
    BPL .return                                                          ;8884EE;
    SEP #$30                                                             ;8884F0;
    LDX.B #$00                                                           ;8884F2;
    STX.B DP_HDMAEnable                                                  ;8884F4;
    STX.W HDMAObject_Index+1                                             ;8884F6;

  .loop:
    STX.W HDMAObject_Index                                               ;8884F9;
    LDA.W HDMAObject_ChannelBitflags,X                                   ;8884FC;
    BEQ .next                                                            ;8884FF;
    ORA.B DP_HDMAEnable                                                  ;888501;
    STA.B DP_HDMAEnable                                                  ;888503;
    JSR.W HDMAObject_Instruction_Handler                                 ;888505;
    LDX.W HDMAObject_Index                                               ;888508;

  .next:
    INX                                                                  ;88850B;
    INX                                                                  ;88850C;
    CPX.B #$0C                                                           ;88850D;
    BNE .loop                                                            ;88850F;
    JSR.W LayerBlending_Handler                                          ;888511;
    PLB                                                                  ;888514;
    PLP                                                                  ;888515;
    RTL                                                                  ;888516;

; Nothing points here, devs might have misplaced their destination label for the HDMA objects disabled branch ($84EE)
    STZ.B DP_HDMAEnable                                                  ;888517; dead code

  .return:
    PLB                                                                  ;888519;
    PLP                                                                  ;88851A;
    RTL                                                                  ;88851B;


;;; $851C: HDMA object instruction handler ;;;
HDMAObject_Instruction_Handler:
;; Parameter:
;;     X: HDMA object index

; Some instructions (e.g. sleep) pop the return address pushed to the stack by $854F to return out of *this* routine
; (marked "terminate processing HDMA object")
    REP #$20                                                             ;88851C;
    LDA.W HDMAObject_PreInstructions,X                                   ;88851E;
    STA.B DP_Temp12                                                      ;888521;
    LDA.W HDMAObject_PreInstructionBanks,X                               ;888523;
    STA.B DP_Temp14                                                      ;888526;
    PHK                                                                  ;888528;
    PEA.W .manualReturn-1                                                ;888529;
    JML.W [DP_Temp12]                                                    ;88852C;

  .manualReturn:
    SEP #$10                                                             ;88852F;
    REP #$20                                                             ;888531;
    LDX.W HDMAObject_Index                                               ;888533;
    DEC.W HDMAObject_InstructionTimers,X                                 ;888536;
    BNE .return                                                          ;888539;
    LDY.W HDMAObject_ChannelIndicesBanks+1,X                             ;88853B;
    PHY                                                                  ;88853E;
    PLB                                                                  ;88853F;
    LDA.W HDMAObject_InstListPointers,X                                  ;888540;
    REP #$10                                                             ;888543;
    TAY                                                                  ;888545;

  .loop:
    LDA.W $0000,Y                                                        ;888546;
    BPL .timer                                                           ;888549;
    STA.B DP_Temp12                                                      ;88854B;
    INY                                                                  ;88854D;
    INY                                                                  ;88854E;
    PEA.W .loop-1                                                        ;88854F;
    JMP.W (DP_Temp12)                                                    ;888552;

  .timer:
    STA.W HDMAObject_InstructionTimers,X                                 ;888555;
    TYA                                                                  ;888558;
    CLC                                                                  ;888559;
    ADC.W #$0004                                                         ;88855A;
    STA.W HDMAObject_InstListPointers,X                                  ;88855D;
    LDA.W $0002,Y                                                        ;888560;
    STA.W HDMAObject_TablePointers,X                                     ;888563;

  .return:
    SEP #$30                                                             ;888566;
    RTS                                                                  ;888568;


;;; $8569: Instruction - delete ;;;
Instruction_HDMAObject_Delete:
;; Parameter:
;;     X: HDMA object index
    STZ.W HDMAObject_ChannelBitflags,X                                   ;888569;
    PLA                                                                  ;88856C;
    SEP #$30                                                             ;88856D;
    RTS                                                                  ;88856F;


;;; $8570: Instruction - pre-instruction = [[Y]] ;;;
Instruction_HDMAObject_PreInstructionInY:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y                                                        ;888570;
    STA.W HDMAObject_PreInstructions,X                                   ;888573;
    SEP #$20                                                             ;888576;
    LDA.W $0002,Y                                                        ;888578;
    STA.W HDMAObject_PreInstructionBanks,X                               ;88857B;
    REP #$20                                                             ;88857E;
    INY                                                                  ;888580;
    INY                                                                  ;888581;
    INY                                                                  ;888582;
    RTS                                                                  ;888583;


if !FEATURE_KEEP_UNREFERENCED
;;; $8584: Unused. Instruction - clear pre-instruction ;;;
UNUSED_Instruction_HDMAObject_ClearPreInstruction_888584:
;; Parameters:
;;     X: HDMA object index
    LDA.W #.return                                                       ;888584;
    STA.W HDMAObject_PreInstructions,X                                   ;888587;

  .return:
    RTS                                                                  ;88858A;


;;; $858B: Unused. Instruction - call function [[Y]] ;;;
UNUSED_Instruction_HDMAObject_CallFunctionY_88858B:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y                                                        ;88858B;
    STA.B DP_Temp12                                                      ;88858E;
    PHX                                                                  ;888590;
    PHY                                                                  ;888591;
    PEA.W .return-1                                                      ;888592;
    JMP.W (DP_Temp12)                                                    ;888595;

  .return:
    PLY                                                                  ;888598;
    PLX                                                                  ;888599;
    INY                                                                  ;88859A;
    INY                                                                  ;88859B;
    RTS                                                                  ;88859C;


;;; $859D: Unused. Instruction - call function [[Y]] with A = [[Y] + 2] ;;;
UNUSED_Instruction_HDMAObject_CallFunctionYWithA_88859D:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y                                                        ;88859D;
    STA.B DP_Temp12                                                      ;8885A0;
    LDA.W $0002,Y                                                        ;8885A2;
    PHX                                                                  ;8885A5;
    PHY                                                                  ;8885A6;
    PEA.W .return-1                                                      ;8885A7;
    JMP.W (DP_Temp12)                                                    ;8885AA;

  .return:
    PLY                                                                  ;8885AD;
    PLX                                                                  ;8885AE;
    INY                                                                  ;8885AF;
    INY                                                                  ;8885B0;
    INY                                                                  ;8885B1;
    INY                                                                  ;8885B2;
    RTS                                                                  ;8885B3;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $85B4: Instruction - call external function [[Y]] ;;;
Instruction_HDMAObject_CallExternalFunctionInY:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y                                                        ;8885B4;
    STA.B DP_Temp12                                                      ;8885B7;
    LDA.W $0001,Y                                                        ;8885B9;
    STA.B DP_Temp13                                                      ;8885BC;
    PHX                                                                  ;8885BE;
    PHY                                                                  ;8885BF;
    JSL.L .externalFunction                                              ;8885C0;
    PLY                                                                  ;8885C4;
    PLX                                                                  ;8885C5;
    INY                                                                  ;8885C6;
    INY                                                                  ;8885C7;
    INY                                                                  ;8885C8;
    RTS                                                                  ;8885C9;

  .externalFunction:
    JML.W [DP_Temp12]                                                    ;8885CA;


if !FEATURE_KEEP_UNREFERENCED
;;; $85CD: Unused. Instruction - call external function [[Y]] with A = [[Y] + 3] ;;;
UNUSED_Instruction_HDMAObject_CallExternalFuncYWithA_8885CD:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y                                                        ;8885CD;
    STA.B DP_Temp12                                                      ;8885D0;
    LDA.W $0001,Y                                                        ;8885D2;
    STA.B DP_Temp13                                                      ;8885D5;
    LDA.W $0003,Y                                                        ;8885D7;
    PHX                                                                  ;8885DA;
    PHY                                                                  ;8885DB;
    JSL.L .externalFunction                                              ;8885DC;
    PLY                                                                  ;8885E0;
    PLX                                                                  ;8885E1;
    TYA                                                                  ;8885E2;
    CLC                                                                  ;8885E3;
    ADC.W #$0005                                                         ;8885E4;
    TAY                                                                  ;8885E7;
    RTS                                                                  ;8885E8;

  .externalFunction:
    JML.W [DP_Temp12]                                                    ;8885E9;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $85EC: Instruction - go to [[Y]] ;;;
Instruction_HDMAObject_GotoY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y                                                        ;8885EC;
    TAY                                                                  ;8885EF;
    RTS                                                                  ;8885F0;


if !FEATURE_KEEP_UNREFERENCED
;;; $85F1: Unused. Instruction - go to [Y] + ±[[Y]] ;;;
UNUSED_Instruction_HDMAObject_GotoY_Y_8885F1:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    STY.B DP_Temp12                                                      ;8885F1;
    DEY                                                                  ;8885F3;
    LDA.W $0000,Y                                                        ;8885F4;
    XBA                                                                  ;8885F7;
    BMI .highByte                                                        ;8885F8;
    AND.W #$00FF                                                         ;8885FA;
    BRA +                                                                ;8885FD;

  .highByte:
    ORA.W #$FF00                                                         ;8885FF;

+   CLC                                                                  ;888602;
    ADC.B DP_Temp12                                                      ;888603;
    TAY                                                                  ;888605;
    RTS                                                                  ;888606;


;;; $8607: Unused. Instruction - decrement timer and go to [[Y]] if non-zero ;;;
UNUSED_Instruction_HDMAObject_DecTimer_GotoY_IfNonZero_888607:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    DEC.W HDMAObject_Timers,X                                            ;888607;
    BNE Instruction_HDMAObject_GotoY                                     ;88860A;
    INY                                                                  ;88860C;
    INY                                                                  ;88860D;
    RTS                                                                  ;88860E;


;;; $860F: Unused. Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
UNUSED_Instruction_HDMAObject_DecTimer_GotoYIfNonZero_88860F:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    DEC.W HDMAObject_Timers,X                                            ;88860F;
    BNE UNUSED_Instruction_HDMAObject_GotoY_Y_8885F1                     ;888612;
    INY                                                                  ;888614;
    RTS                                                                  ;888615;


;;; $8616: Unused. Instruction - timer = [[Y]] ;;;
UNUSED_Instruction_HDMAObject_TimerInY_888616:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    SEP #$20                                                             ;888616;
    LDA.W $0000,Y                                                        ;888618;
    STA.W HDMAObject_Timers,X                                            ;88861B;
    REP #$20                                                             ;88861E;
    INY                                                                  ;888620;
    RTS                                                                  ;888621;


;;; $8622: Unused. Instruction - HDMA control = [[Y]] ;;;
UNUSED_Instruction_HDMAObject_HDMAControlInY_888622:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHX                                                                  ;888622;
    LDA.W HDMAObject_ChannelIndicesBanks,X                               ;888623;
    AND.W #$00FF                                                         ;888626;
    TAX                                                                  ;888629;
    SEP #$20                                                             ;88862A;
    LDA.W $0000,Y                                                        ;88862C;
    STA.W $4300,X                                                        ;88862F;
    REP #$20                                                             ;888632;
    PLX                                                                  ;888634;
    INY                                                                  ;888635;
    RTS                                                                  ;888636;


;;; $8637: Unused. Instruction - HDMA target = [[Y]] ;;;
UNUSED_Instruction_HDMAObject_HDMATargetInY:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHX                                                                  ;888637;
    LDA.W HDMAObject_ChannelIndicesBanks,X                               ;888638;
    AND.W #$00FF                                                         ;88863B;
    TAX                                                                  ;88863E;
    SEP #$20                                                             ;88863F;
    LDA.W $0000,Y                                                        ;888641;
    STA.W $4301,X                                                        ;888644;
    REP #$20                                                             ;888647;
    PLX                                                                  ;888649;
    INY                                                                  ;88864A;
    RTS                                                                  ;88864B;


;;; $864C: Unused. Instruction - HDMA table pointer = [[Y]] ;;;
UNUSED_Instruction_HDMAObject_HDMATablePointerInY_88864C:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y                                                        ;88864C;
    STA.W HDMAObject_TablePointers,X                                     ;88864F;
    INY                                                                  ;888652;
    INY                                                                  ;888653;
    RTS                                                                  ;888654;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8655: Instruction - HDMA table bank = [[Y]] ;;;
Instruction_HDMAObject_HDMATableBank:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHX                                                                  ;888655;
    LDA.W HDMAObject_ChannelIndicesBanks,X                               ;888656;
    AND.W #$00FF                                                         ;888659;
    TAX                                                                  ;88865C;
    SEP #$20                                                             ;88865D;
    LDA.W $0000,Y                                                        ;88865F;
    STA.W $4304,X                                                        ;888662;
    REP #$20                                                             ;888665;
    PLX                                                                  ;888667;
    INY                                                                  ;888668;
    RTS                                                                  ;888669;


;;; $866A: Instruction - indirect HDMA data bank = [[Y]] ;;;
Instruction_HDMAObject_IndirectHDMATableBank:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHX                                                                  ;88866A;
    LDA.W HDMAObject_ChannelIndicesBanks,X                               ;88866B;
    AND.W #$00FF                                                         ;88866E;
    TAX                                                                  ;888671;
    SEP #$20                                                             ;888672;
    LDA.W $0000,Y                                                        ;888674;
    STA.W $4307,X                                                        ;888677;
    REP #$20                                                             ;88867A;
    PLX                                                                  ;88867C;
    INY                                                                  ;88867D;
    RTS                                                                  ;88867E;


if !FEATURE_KEEP_UNREFERENCED
;;; $867F: Unused. Instruction - skip next instruction ;;;
UNUSED_Instruction_HDMAObject_SkipNextInstruction_88867F:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to after this instruction
;; Returns:
;;     Y: Pointer to next instruction
    INY                                                                  ;88867F;
    INY                                                                  ;888680;
    RTS                                                                  ;888681;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8682: Instruction - sleep ;;;
Instruction_HDMAObject_Sleep:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to after this instruction
    DEY                                                                  ;888682;
    DEY                                                                  ;888683;
    TYA                                                                  ;888684;
    STA.W HDMAObject_InstListPointers,X                                  ;888685;
    PLA                                                                  ;888688;
    SEP #$30                                                             ;888689;
    RTS                                                                  ;88868B;


;;; $868C: Raise/lower FX ;;;
RaiseOrLower_FX:
;; Returns:
;;     Carry: set if reached target position, clear otherwise
    LDA.W FX_TargetYPosition                                             ;88868C;
    BMI .returnCarrySet                                                  ;88868F;
    STZ.B DP_Temp16                                                      ;888691;
    STZ.B DP_Temp18                                                      ;888693;
    LDA.W FX_YSubVelocity                                                ;888695;
    BPL .lower                                                           ;888698;
    DEC.B DP_Temp18                                                      ;88869A;
    STA.B DP_Temp17                                                      ;88869C;
    LDA.W FX_BaseYSubPosition                                            ;88869E;
    CLC                                                                  ;8886A1;
    ADC.B DP_Temp16                                                      ;8886A2;
    STA.W FX_BaseYSubPosition                                            ;8886A4;
    LDA.W FX_BaseYPosition                                               ;8886A7;
    ADC.B DP_Temp18                                                      ;8886AA;
    BPL +                                                                ;8886AC;
    LDA.W #$0000                                                         ;8886AE;

+   STA.W FX_BaseYPosition                                               ;8886B1;
    LDA.W FX_TargetYPosition                                             ;8886B4;
    CMP.W FX_BaseYPosition                                               ;8886B7;
    BCC .return                                                          ;8886BA;
    STA.W FX_BaseYPosition                                               ;8886BC;
    STZ.W FX_BaseYSubPosition                                            ;8886BF;

  .return:
    RTS                                                                  ;8886C2;

  .lower:
    STA.B DP_Temp17                                                      ;8886C3;
    LDA.W FX_BaseYSubPosition                                            ;8886C5;
    CLC                                                                  ;8886C8;
    ADC.B DP_Temp16                                                      ;8886C9;
    STA.W FX_BaseYSubPosition                                            ;8886CB;
    LDA.W FX_BaseYPosition                                               ;8886CE;
    ADC.B DP_Temp18                                                      ;8886D1;
    BPL +                                                                ;8886D3;
    LDA.W #$FFFF                                                         ;8886D5;

+   STA.W FX_BaseYPosition                                               ;8886D8;
    LDA.W FX_TargetYPosition                                             ;8886DB;
    CMP.W FX_BaseYPosition                                               ;8886DE;
    BCS .returnCarryClear                                                ;8886E1;
    STA.W FX_BaseYPosition                                               ;8886E3;
    STZ.W FX_BaseYSubPosition                                            ;8886E6;
    SEC                                                                  ;8886E9;
    RTS                                                                  ;8886EA;

  .returnCarryClear:
    CLC                                                                  ;8886EB;
    RTS                                                                  ;8886EC;

  .returnCarrySet:
    SEC                                                                  ;8886ED;
    RTS                                                                  ;8886EE;


;;; $86EF: Pre-instruction - x-ray - main ;;;
PreInstruction_Xray_Main:
    PHP                                                                  ;8886EF;
    REP #$30                                                             ;8886F0;
    LDX.W #$1000                                                         ;8886F2;
    LDA.W FX_Type                                                        ;8886F5;
    CMP.W #$0024                                                         ;8886F8;
    BEQ +                                                                ;8886FB;
    LDX.W #$2000                                                         ;8886FD;
    JSL.L CheckIfXrayShouldShowAnyBlocks                                 ;888700;
    BEQ +                                                                ;888704;
    LDX.W #$4000                                                         ;888706;
    LDA.W #$0027                                                         ;888709;
    STA.B DP_ColorMathSubScreenBackdropColor0                            ;88870C;
    LDA.W #$0047                                                         ;88870E;
    STA.B DP_ColorMathSubScreenBackdropColor1                            ;888711;
    LDA.W #$0087                                                         ;888713;
    STA.B DP_ColorMathSubScreenBackdropColor2                            ;888716;

+   TXA                                                                  ;888718;
    TSB.W LayerBlending_Config                                           ;888719;
    LDA.W Xray_State                                                     ;88871C;
    ASL                                                                  ;88871F;
    TAX                                                                  ;888720;
    JSR.W (.pointers,X)                                                  ;888721;
    PLP                                                                  ;888724;
    RTL                                                                  ;888725;

  .pointers:
    dw HandleXrayScope_State0_NoBeam                                     ;888726;
    dw HandleXrayScope_State1_BeamIsWidening                             ;888728;
    dw HandleXrayScope_State2_FullBeam                                   ;88872A;
    dw HandleXrayScope_State3_DeactivateBeam_RestoreBG2_FirstHalf        ;88872C;
    dw HandleXrayScope_State4_DeactivateBeam_RestoreBG2_SecondHalf       ;88872E;
    dw HandleXrayScope_State5_DeactivateBeam_Finish                      ;888730;


;;; $8732: Handle x-ray scope - x-ray state = 0 (no beam) ;;;
HandleXrayScope_State0_NoBeam:
    PHP                                                                  ;888732;
    REP #$30                                                             ;888733;
    LDA.B DP_Controller1Input                                            ;888735;
    BIT.W DashBinding                                                    ;888737;
    BNE .calculateHDMATable                                              ;88873A;
    LDA.W #$0003                                                         ;88873C;
    STA.W Xray_State                                                     ;88873F;
    BRA .return                                                          ;888742;

  .calculateHDMATable:
    JSR.W Calculate_Xray_HDMADataTable                                   ;888744;
    LDA.W Xray_State                                                     ;888747;
    INC                                                                  ;88874A;
    STA.W Xray_State                                                     ;88874B;
    JSR.W RTS_888753                                                     ;88874E;

  .return:
    PLP                                                                  ;888751;
    RTS                                                                  ;888752;


;;; $8753: RTS ;;;
RTS_888753:
    RTS                                                                  ;888753;


;;; $8754: Handle x-ray scope - x-ray state = 1 (beam is widening) ;;;
HandleXrayScope_State1_BeamIsWidening:
    PHP                                                                  ;888754;
    REP #$30                                                             ;888755;
    LDA.B DP_Controller1Input                                            ;888757;
    BIT.W DashBinding                                                    ;888759;
    BNE +                                                                ;88875C;
    LDA.W #$0003                                                         ;88875E;
    STA.W Xray_State                                                     ;888761;
    BRA .return                                                          ;888764;

+   JSR.W RTS_888753                                                     ;888766;
    REP #$20                                                             ;888769;
    LDA.W Xray_AngularSubWidthDelta                                      ;88876B;
    CLC                                                                  ;88876E;
    ADC.W #$0800                                                         ;88876F;
    STA.W Xray_AngularSubWidthDelta                                      ;888772;
    LDA.W Xray_AngularWidthDelta                                         ;888775;
    ADC.W #$0000                                                         ;888778;
    STA.W Xray_AngularWidthDelta                                         ;88877B;
    LDA.W Xray_AngularSubWidth                                           ;88877E;
    CLC                                                                  ;888781;
    ADC.W Xray_AngularSubWidthDelta                                      ;888782;
    STA.W Xray_AngularSubWidth                                           ;888785;
    LDA.W Xray_AngularWidth                                              ;888788;
    ADC.W Xray_AngularWidthDelta                                         ;88878B;
    STA.W Xray_AngularWidth                                              ;88878E;
    CMP.W #$000B                                                         ;888791;
    BMI .calculateHDMATable                                              ;888794;
    STZ.W Xray_AngularSubWidth                                           ;888796;
    LDA.W #$000A                                                         ;888799;
    STA.W Xray_AngularWidth                                              ;88879C;
    LDA.W Xray_State                                                     ;88879F;
    INC                                                                  ;8887A2;
    STA.W Xray_State                                                     ;8887A3;

  .calculateHDMATable:
    JSR.W Calculate_Xray_HDMADataTable                                   ;8887A6;

  .return:
    PLP                                                                  ;8887A9;
    RTS                                                                  ;8887AA;


;;; $87AB: Handle x-ray scope - x-ray state = 2 (full beam) ;;;
HandleXrayScope_State2_FullBeam:
    PHP                                                                  ;8887AB;
    REP #$30                                                             ;8887AC;
    LDA.B DP_Controller1Input                                            ;8887AE;
    BIT.W DashBinding                                                    ;8887B0;
    BEQ .state3                                                          ;8887B3;
    JSR.W HandleMovingXray_UpDown                                        ;8887B5;
    JSR.W Calculate_Xray_HDMADataTable                                   ;8887B8;
    JSR.W RTS_888753                                                     ;8887BB;
    PLP                                                                  ;8887BE;
    RTS                                                                  ;8887BF;

  .state3:
    INC.W Xray_State                                                     ;8887C0;
    PLP                                                                  ;8887C3;
    RTS                                                                  ;8887C4;


;;; $87C5: Handle moving x-ray up/down ;;;
HandleMovingXray_UpDown:
    PHP                                                                  ;8887C5;
    REP #$30                                                             ;8887C6;
    LDA.B DP_Controller1Input                                            ;8887C8;
    BIT.W UpBinding                                                      ;8887CA;
    BNE .up                                                              ;8887CD;
    BIT.W DownBinding                                                    ;8887CF;
    BNE .down                                                            ;8887D2;
    BRA .return                                                          ;8887D4;

  .up:
    JSR.W MoveXray_Up                                                    ;8887D6;
    BRA .return                                                          ;8887D9;

  .down:
    JSR.W MoveXray_Down                                                  ;8887DB;

  .return:
    PLP                                                                  ;8887DE;
    RTS                                                                  ;8887DF;


;;; $87E0: Move x-ray up ;;;
MoveXray_Up:
    PHP                                                                  ;8887E0;
    REP #$30                                                             ;8887E1;
    LDA.W Xray_Angle                                                     ;8887E3;
    CMP.W #$0080                                                         ;8887E6;
    BPL .facingLeft                                                      ;8887E9;
    SEC                                                                  ;8887EB;
    SBC.W Xray_AngularWidth                                              ;8887EC;
    BEQ .return                                                          ;8887EF;
    BMI .setAngularWidth                                                 ;8887F1;
    LDA.W Xray_Angle                                                     ;8887F3;
    SEC                                                                  ;8887F6;
    SBC.W #$0001                                                         ;8887F7;
    STA.W Xray_Angle                                                     ;8887FA;
    SBC.W Xray_AngularWidth                                              ;8887FD;
    BPL .return                                                          ;888800;

  .setAngularWidth:
    LDA.W Xray_AngularWidth                                              ;888802;
    STA.W Xray_Angle                                                     ;888805;
    BRA .return                                                          ;888808;

  .facingLeft:
    CLC                                                                  ;88880A;
    ADC.W Xray_AngularWidth                                              ;88880B;
    CMP.W #$0100                                                         ;88880E;
    BEQ .return                                                          ;888811;
    BPL .max100                                                          ;888813;
    LDA.W Xray_Angle                                                     ;888815;
    CLC                                                                  ;888818;
    ADC.W #$0001                                                         ;888819;
    STA.W Xray_Angle                                                     ;88881C;
    ADC.W Xray_AngularWidth                                              ;88881F;
    CMP.W #$0100                                                         ;888822;
    BEQ .return                                                          ;888825;
    BMI .return                                                          ;888827;

  .max100:
    LDA.W #$0100                                                         ;888829;
    SEC                                                                  ;88882C;
    SBC.W Xray_AngularWidth                                              ;88882D;
    STA.W Xray_Angle                                                     ;888830;

  .return:
    PLP                                                                  ;888833;
    RTS                                                                  ;888834;


;;; $8835: Move x-ray down ;;;
MoveXray_Down:
    PHP                                                                  ;888835;
    REP #$30                                                             ;888836;
    LDA.W Xray_Angle                                                     ;888838;
    CMP.W #$0080                                                         ;88883B;
    BPL .facingLeft                                                      ;88883E;
    CLC                                                                  ;888840;
    ADC.W Xray_AngularWidth                                              ;888841;
    CMP.W #$0080                                                         ;888844;
    BEQ .return                                                          ;888847;
    BPL .setAngularWidth                                                 ;888849;
    LDA.W Xray_Angle                                                     ;88884B;
    CLC                                                                  ;88884E;
    ADC.W #$0001                                                         ;88884F;
    STA.W Xray_Angle                                                     ;888852;
    ADC.W Xray_AngularWidth                                              ;888855;
    CMP.W #$0080                                                         ;888858;
    BEQ .return                                                          ;88885B;
    BMI .return                                                          ;88885D;

  .setAngularWidth:
    LDA.W #$0080                                                         ;88885F;
    SEC                                                                  ;888862;
    SBC.W Xray_AngularWidth                                              ;888863;
    STA.W Xray_Angle                                                     ;888866;
    BRA .return                                                          ;888869;

  .facingLeft:
    SEC                                                                  ;88886B;
    SBC.W Xray_AngularWidth                                              ;88886C;
    CMP.W #$0080                                                         ;88886F;
    BEQ .return                                                          ;888872;
    BMI +                                                                ;888874;
    LDA.W Xray_Angle                                                     ;888876;
    SEC                                                                  ;888879;
    SBC.W #$0001                                                         ;88887A;
    STA.W Xray_Angle                                                     ;88887D;
    SBC.W Xray_AngularWidth                                              ;888880;
    CMP.W #$0080                                                         ;888883;
    BEQ .return                                                          ;888886;
    BPL .return                                                          ;888888;

+   LDA.W #$0080                                                         ;88888A;
    CLC                                                                  ;88888D;
    ADC.W Xray_AngularWidth                                              ;88888E;
    STA.W Xray_Angle                                                     ;888891;

  .return:
    PLP                                                                  ;888894;
    RTS                                                                  ;888895;


;;; $8896: Calculate x-ray HDMA data table ;;;
Calculate_Xray_HDMADataTable:
    PHP                                                                  ;888896;
    REP #$30                                                             ;888897;
    LDA.W #XrayWindow2HDMADataTable>>8&$FF00                             ;888899;
    STA.B DP_Temp01                                                      ;88889C;
    LDA.W #XrayWindow2HDMADataTable                                      ;88889E;
    STA.B DP_Temp00                                                      ;8888A1;
    LDA.W Xray_Angle                                                     ;8888A3;
    STA.B DP_Temp12                                                      ;8888A6;
    LDA.W Xray_AngularWidth                                              ;8888A8;
    STA.B DP_Temp14                                                      ;8888AB;
    LDA.W PoseXDirection                                                 ;8888AD;
    AND.W #$00FF                                                         ;8888B0;
    CMP.W #$0004                                                         ;8888B3;
    BEQ .facingLeft                                                      ;8888B6;
    LDA.W SamusXPosition                                                 ;8888B8;
    SEC                                                                  ;8888BB;
    SBC.W Layer1XPosition                                                ;8888BC;
    CLC                                                                  ;8888BF;
    ADC.W #$0003                                                         ;8888C0;
    TAX                                                                  ;8888C3;
    BRA .checkMovement                                                   ;8888C4;

  .facingLeft:
    LDA.W SamusXPosition                                                 ;8888C6;
    SEC                                                                  ;8888C9;
    SBC.W Layer1XPosition                                                ;8888CA;
    SBC.W #$0003                                                         ;8888CD;
    TAX                                                                  ;8888D0;

  .checkMovement:
    LDA.W MovementType                                                   ;8888D1;
    AND.W #$00FF                                                         ;8888D4;
    CMP.W #$0005                                                         ;8888D7;
    BEQ .crouching                                                       ;8888DA;
    LDA.W SamusYPosition                                                 ;8888DC;
    SEC                                                                  ;8888DF;
    SBC.W Layer1YPosition                                                ;8888E0;
    SBC.W #$0010                                                         ;8888E3;
    TAY                                                                  ;8888E6;
    BRA .checkScreenPosition                                             ;8888E7;

  .crouching:
    LDA.W SamusYPosition                                                 ;8888E9;
    SEC                                                                  ;8888EC;
    SBC.W Layer1YPosition                                                ;8888ED;
    SBC.W #$000C                                                         ;8888F0;
    TAY                                                                  ;8888F3;

  .checkScreenPosition:
    CPX.W #$0000                                                         ;8888F4;
    BMI .leftOfScreen                                                    ;8888F7;
    CPX.W #$0100                                                         ;8888F9;
    BMI .onScreen                                                        ;8888FC;
    LDA.W PoseXDirection                                                 ;8888FE;
    AND.W #$00FF                                                         ;888901;
    CMP.W #$0008                                                         ;888904;
    BEQ .offScreen                                                       ;888907;
    BRA .onScreenFromOffScreen                                           ;888909;

  .leftOfScreen:
    LDA.W PoseXDirection                                                 ;88890B;
    AND.W #$00FF                                                         ;88890E;
    CMP.W #$0004                                                         ;888911;
    BEQ .offScreen                                                       ;888914;
    BRA .onScreenFromOffScreen                                           ;888916;

  .onScreen:
    JSL.L Calc_Xray_HDMADataTable_OnScreen                               ;888918;
    PLP                                                                  ;88891C;
    RTS                                                                  ;88891D;

  .onScreenFromOffScreen:
    JSL.L Calc_Xray_HDMADataTable_OffScreen                              ;88891E;
    PLP                                                                  ;888922;
    RTS                                                                  ;888923;

  .offScreen:
    LDX.W #$01FE                                                         ;888924;
    LDA.W #$00FF                                                         ;888927;

  .loop:
    STA.L XrayWindow2HDMADataTable,X                                     ;88892A;
    DEX                                                                  ;88892E;
    DEX                                                                  ;88892F;
    BPL .loop                                                            ;888930;
    PLP                                                                  ;888932;
    RTS                                                                  ;888933;


;;; $8934: Handle x-ray scope - x-ray state = 3 (deactivate beam - restore BG2 - first half) ;;;
HandleXrayScope_State3_DeactivateBeam_RestoreBG2_FirstHalf:
    PHP                                                                  ;888934;
    REP #$30                                                             ;888935;
    LDA.W #$0001                                                         ;888937;
    STA.W Xray_IndirectHDMATable                                         ;88893A;
    LDA.W #XrayWindow2HDMADataTable                                      ;88893D;
    STA.W Xray_IndirectHDMATable+1                                       ;888940;
    STZ.W Xray_IndirectHDMATable+3                                       ;888943;
    STZ.W Xray_IndirectHDMATable+4                                       ;888946;
    STZ.W Xray_IndirectHDMATable+6                                       ;888949;
    STZ.W Xray_IndirectHDMATable+8                                       ;88894C;
    LDA.W #$00FF                                                         ;88894F;
    STA.L XrayWindow2HDMADataTable                                       ;888952;
    LDX.W #$1000                                                         ;888956;
    LDA.W FX_Type                                                        ;888959;
    CMP.W #$0024                                                         ;88895C;
    BEQ +                                                                ;88895F;
    LDX.W #$2000                                                         ;888961;
    JSL.L CheckIfXrayShouldShowAnyBlocks                                 ;888964;
    BEQ +                                                                ;888968;
    LDX.W #$4000                                                         ;88896A;

+   TXA                                                                  ;88896D;
    TSB.W LayerBlending_Config                                           ;88896E;
    LDA.W #$0000                                                         ;888971;
    STA.L Palettes                                                       ;888974;
    LDX.W HDMAObject_Index                                               ;888978;
    LDA.W HDMAObject_Var0,X                                              ;88897B;
    STA.B DP_BG2XScroll                                                  ;88897E;
    LDA.W HDMAObject_Var1,X                                              ;888980;
    STA.B DP_BG2YScroll                                                  ;888983;
    SEP #$20                                                             ;888985;
    LDA.W HDMAObject_Var2,X                                              ;888987;
    STA.B DP_BG2TilemapAddrSize                                          ;88898A;
    REP #$20                                                             ;88898C;
    LDX.W VRAMWriteStack                                                 ;88898E;
    CPX.W #$00F0                                                         ;888991;
    BPL .return                                                          ;888994;
    LDA.W #$0800                                                         ;888996;
    STA.B VRAMWrite.size,X                                               ;888999;
    LDA.W #XrayTilemaps_BackupBG2                                        ;88899B;
    STA.B VRAMWrite.src,X                                                ;88899E;
    LDA.W #XrayTilemaps_BackupBG2>>16                                    ;8889A0;
    STA.B VRAMWrite.src+2,X                                              ;8889A3;
    LDA.B DP_BG2TilemapAddrSize                                          ;8889A5;
    AND.W #$00FC                                                         ;8889A7;
    XBA                                                                  ;8889AA;
    STA.B VRAMWrite.dest,X                                               ;8889AB;
    TXA                                                                  ;8889AD;
    CLC                                                                  ;8889AE;
    ADC.W #$0007                                                         ;8889AF;
    STA.W VRAMWriteStack                                                 ;8889B2;
    INC.W Xray_State                                                     ;8889B5;

  .return:
    PLP                                                                  ;8889B8;
    RTS                                                                  ;8889B9;


;;; $89BA: Handle x-ray scope - x-ray state = 4 (deactivate beam - restore BG2 - second half) ;;;
HandleXrayScope_State4_DeactivateBeam_RestoreBG2_SecondHalf:
    PHP                                                                  ;8889BA;
    REP #$30                                                             ;8889BB;
    LDX.W #$1000                                                         ;8889BD;
    LDA.W FX_Type                                                        ;8889C0;
    CMP.W #$0024                                                         ;8889C3;
    BEQ +                                                                ;8889C6;
    LDX.W #$2000                                                         ;8889C8;
    JSL.L CheckIfXrayShouldShowAnyBlocks                                 ;8889CB;
    BEQ +                                                                ;8889CF;
    LDX.W #$4000                                                         ;8889D1;

+   TXA                                                                  ;8889D4;
    TSB.W LayerBlending_Config                                           ;8889D5;
    LDX.W VRAMWriteStack                                                 ;8889D8;
    CPX.W #$00F0                                                         ;8889DB;
    BPL .return                                                          ;8889DE;
    LDA.W #$0800                                                         ;8889E0;
    STA.B VRAMWrite.size,X                                               ;8889E3;
    LDA.W #XrayTilemaps_BackupBG2+$800                                   ;8889E5;
    STA.B VRAMWrite.src,X                                                ;8889E8;
    LDA.W #XrayTilemaps_BackupBG2>>16                                    ;8889EA;
    STA.B VRAMWrite.src+2,X                                              ;8889ED;
    LDA.B DP_BG2TilemapAddrSize                                          ;8889EF;
    AND.W #$00FC                                                         ;8889F1;
    XBA                                                                  ;8889F4;
    CLC                                                                  ;8889F5;
    ADC.W #$0400                                                         ;8889F6;
    STA.B VRAMWrite.dest,X                                               ;8889F9;
    TXA                                                                  ;8889FB;
    CLC                                                                  ;8889FC;
    ADC.W #$0007                                                         ;8889FD;
    STA.W VRAMWriteStack                                                 ;888A00;
    INC.W Xray_State                                                     ;888A03;

  .return:
    PLP                                                                  ;888A06;
    RTS                                                                  ;888A07;


;;; $8A08: Handle x-ray scope - x-ray state = 5 (deactivate beam - finish) ;;;
HandleXrayScope_State5_DeactivateBeam_Finish:
    PHP                                                                  ;888A08;
    REP #$30                                                             ;888A09;
    LDX.W #$1000                                                         ;888A0B;
    LDA.W FX_Type                                                        ;888A0E;
    CMP.W #$0024                                                         ;888A11;
    BEQ +                                                                ;888A14;
    LDX.W #$2000                                                         ;888A16;
    JSL.L CheckIfXrayShouldShowAnyBlocks                                 ;888A19;
    BEQ +                                                                ;888A1D;
    LDX.W #$4000                                                         ;888A1F;

+   TXA                                                                  ;888A22;
    TSB.W LayerBlending_Config                                           ;888A23;
    LDA.W TimeIsFrozenFlag                                               ;888A26;
    BNE .timeIsFrozen                                                    ;888A29;
    PLP                                                                  ;888A2B;
    RTS                                                                  ;888A2C;

  .timeIsFrozen:
    STZ.W TimeIsFrozenFlag                                               ;888A2D;
    STZ.W Xray_State                                                     ;888A30;
    STZ.W Xray_AngularWidthDelta                                         ;888A33;
    STZ.W Xray_AngularSubWidthDelta                                      ;888A36;
    STZ.W Xray_Angle                                                     ;888A39;
    STZ.W Xray_AngularWidth                                              ;888A3C;
    STZ.W Xray_AngularSubWidth                                           ;888A3F;
    LDA.W #$0001                                                         ;888A42;
    STA.W Xray_IndirectHDMATable                                         ;888A45;
    LDA.W #XrayWindow2HDMADataTable                                      ;888A48;
    STA.W Xray_IndirectHDMATable+1                                       ;888A4B;
    STZ.W Xray_IndirectHDMATable+3                                       ;888A4E;
    STZ.W Xray_IndirectHDMATable+4                                       ;888A51;
    STZ.W Xray_IndirectHDMATable+6                                       ;888A54;
    STZ.W Xray_IndirectHDMATable+8                                       ;888A57;
    JSL.L Set_NonXray_SamusPose                                          ;888A5A;
    LDX.W HDMAObject_Index                                               ;888A5E;
    STZ.W HDMAObject_ChannelBitflags,X                                   ;888A61;
    LDA.W #$000A                                                         ;888A64;
    JSL.L QueueSound_Lib1_Max6                                           ;888A67;
    SEP #$20                                                             ;888A6B;
    LDA.W FX_Type                                                        ;888A6D;
    CMP.B #$24                                                           ;888A70;
    BEQ +                                                                ;888A72;
    LDA.B #$80                                                           ;888A74;
    STA.B DP_ColorMathSubScreenBackdropColor2                            ;888A76;
    LDA.B #$40                                                           ;888A78;
    STA.B DP_ColorMathSubScreenBackdropColor1                            ;888A7A;
    LDA.B #$20                                                           ;888A7C;
    STA.B DP_ColorMathSubScreenBackdropColor0                            ;888A7E;

+   LDA.B #XrayWindow2HDMADataTable>>16                                  ;888A80;
    STA.B DP_Temp02                                                      ;888A82;
    REP #$20                                                             ;888A84;
    LDA.W #XrayWindow2HDMADataTable                                      ;888A86;
    STA.B DP_Temp00                                                      ;888A89;
    LDY.W #$01FE                                                         ;888A8B;
    LDA.W #$00FF                                                         ;888A8E;

  .loop:
    STA.B [DP_Temp00],Y                                                  ;888A91;
    DEY                                                                  ;888A93;
    DEY                                                                  ;888A94;
    BPL .loop                                                            ;888A95;
    LDA.W AutoCancelHUDItemIndex                                         ;888A97;
    BEQ .return                                                          ;888A9A;
    STZ.W SelectedHUDItem                                                ;888A9C;
    STZ.W AutoCancelHUDItemIndex                                         ;888A9F;

  .return:
    PLP                                                                  ;888AA2;
    RTS                                                                  ;888AA3;


;;; $8AA4: Spawn power bomb explosion ;;;
Spawn_PowerBombExplosion:
    LDA.W TimeIsFrozenFlag                                               ;888AA4;
    BNE .pending                                                         ;888AA7;
    LDA.W #$0001                                                         ;888AA9;
    JSL.L QueueSound                                                     ;888AAC;
    LDA.W #$8000                                                         ;888AB0;
    STA.W PowerBombExplosionStatus                                       ;888AB3;
    JSL.L Spawn_HDMAObject                                               ;888AB6;
    db $40,$28                                                           ;888ABA;
    dw InstList_PowerBombExplosion_Window2_LeftPosition                  ;888ABC;
    JSL.L Spawn_HDMAObject                                               ;888ABE;
    db $40,$29                                                           ;888AC2;
    dw InstList_PowerBombExplosion_Window2_RightPosition                 ;888AC4;
    RTL                                                                  ;888AC6;

  .pending:
    LDA.W #$4000                                                         ;888AC7;
    STA.W PowerBombExplosionStatus                                       ;888ACA;
    RTL                                                                  ;888ACD;


;;; $8ACE: Instruction list - power bomb explosion window 2 left position ;;;
InstList_PowerBombExplosion_Window2_LeftPosition:
    dw Instruction_HDMAObject_HDMATableBank : db $89                     ;888ACE;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;888AD1;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;888AD4;
    dl PowerBombExplosion_Setup1_PreExplosion_White                      ;888AD6;
    dw Instruction_HDMAObject_PreInstructionInY                          ;888AD9;
    dl PreInstruction_PowerBombExplosion_1_PreExplosion_White            ;888ADB;
    dw Instruction_HDMAObject_Sleep                                      ;888ADE;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;888AE0;
    dl PowerBombExplosion_Setup2_PreExplosion_Yellow                     ;888AE2;
    dw Instruction_HDMAObject_PreInstructionInY                          ;888AE5;
    dl PreInstruction_PowerBombExplosion_2_PreExplosion_Yellow           ;888AE7;
    dw Instruction_HDMAObject_Sleep                                      ;888AEA;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;888AEC;
    dl PowerBombExplosion_Setup3_Explosion_Yellow                        ;888AEE;
    dw Instruction_HDMAObject_PreInstructionInY                          ;888AF1;
    dl PreInstruction_PowerBombExplosion_3_Explosion_Yellow              ;888AF3;
    dw Instruction_HDMAObject_Sleep                                      ;888AF6;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;888AF8;
    dl PowerBombExplosion_Setup4_Explosion_White                         ;888AFA;
    dw Instruction_HDMAObject_PreInstructionInY                          ;888AFD;
    dl PreInstruction_PowerBombExplosion_4_Explosion_White               ;888AFF;
    dw Instruction_HDMAObject_Sleep                                      ;888B02;
    dw Instruction_HDMAObject_PreInstructionInY                          ;888B04;
    dl PreInstruction_PowerBombExplosion_5_AfterGlow                     ;888B06;
    dw Instruction_HDMAObject_Sleep                                      ;888B09;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;888B0B;
    dl PowerBombExplosion_ClearnUp_TryCrystalFlash                       ;888B0D;
    dw Instruction_HDMAObject_Sleep                                      ;888B10;
    dw Instruction_HDMAObject_Delete                                     ;888B12;


;;; $8B14: Power bomb explosion - stage 1 setup (pre-explosion - white) ;;;
PowerBombExplosion_Setup1_PreExplosion_White:
    SEP #$20                                                             ;888B14;
    LDA.B #$FF                                                           ;888B16;
    STA.L OffScreenPowerBombExplosionWindow2LeftHDMADataTable            ;888B18;
    LDA.B #$00                                                           ;888B1C;
    STA.L OffScreenPowerBombExplosionWindow2RightHDMADataTable           ;888B1E;
    REP #$20                                                             ;888B22;
    LDA.W #$0400                                                         ;888B24;
    STA.W SamusProjectile_PowerBombPreExplosionFlashRadius               ;888B27;
    LDA.L PowerBomb_PreExplosion_InitialRadiusSpeed                      ;888B2A;
    STA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed               ;888B2E;
    RTL                                                                  ;888B31;


;;; $8B32: Power bomb explosion - stage 2 setup (pre-explosion - yellow) ;;;
PowerBombExplosion_Setup2_PreExplosion_Yellow:
    LDA.W #PowerBomb_PreExplosion_ShapeDefinitionTables_PreScaled        ;888B32;
    STA.W SamusProjectile_PreScaledPowerBombExplosionShapeDefPointer     ;888B35;
    RTL                                                                  ;888B38;


;;; $8B39: Power bomb explosion - stage 3 setup (explosion - yellow) ;;;
PowerBombExplosion_Setup3_Explosion_Yellow:
    LDA.W #$0400                                                         ;888B39;
    STA.W SamusProjectile_PowerBombExplosionRadius                       ;888B3C;
    LDA.L PowerBombExplosion_InitialRadiusSpeed                          ;888B3F;
    STA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed               ;888B43;
    RTL                                                                  ;888B46;


;;; $8B47: Power bomb explosion - stage 4 setup (explosion - white) ;;;
PowerBombExplosion_Setup4_Explosion_White:
    LDA.W #PowerBomb_Explosion_ShapeDefinitionTiles_PreScaled            ;888B47;
    STA.W SamusProjectile_PreScaledPowerBombExplosionShapeDefPointer     ;888B4A;
    RTL                                                                  ;888B4D;


;;; $8B4E: Power bomb explosion - clean up and try crystal flash ;;;
PowerBombExplosion_ClearnUp_TryCrystalFlash:
;; Parameters:
;;     X: HDMA object index
    LDA.W SamusXPosition                                                 ;888B4E;
    CMP.W SamusProjectile_PowerBombExplosionXPosition                    ;888B51;
    BNE .clearPBFlag                                                     ;888B54;
    LDA.W SamusYPosition                                                 ;888B56;
    CMP.W SamusProjectile_PowerBombExplosionYPosition                    ;888B59;
    BNE .clearPBFlag                                                     ;888B5C;
    PHX                                                                  ;888B5E;
    JSL.L CrystalFlash                                                   ;888B5F;
    PLX                                                                  ;888B63;
    BCC .crystalFlashing                                                 ;888B64;

  .clearPBFlag:
    STZ.W SamusProjectile_PowerBombFlag                                  ;888B66;

  .crystalFlashing:
    STZ.W PowerBombExplosionStatus                                       ;888B69;
    STZ.W HDMAObject_ChannelBitflags,X                                   ;888B6C;
    STZ.W HDMAObject_ChannelBitflags+2,X                                 ;888B6F;
    STZ.W SamusProjectile_PowerBombPreExplosionFlashRadius               ;888B72;
    STZ.W SamusProjectile_PowerBombExplosionRadius                       ;888B75;
    LDA.W #$001E                                                         ;888B78;
    JSL.L Run_Samus_Command                                              ;888B7B;
    RTL                                                                  ;888B7F;


;;; $8B80: Instruction list - power bomb explosion window 2 right position ;;;
InstList_PowerBombExplosion_Window2_RightPosition:
    dw Instruction_HDMAObject_HDMATableBank : db $89                     ;888B80;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;888B83;
    dw Instruction_HDMAObject_PreInstructionInY                          ;888B86;
    dl PreInstruction_PowerBombExplosion_SetLayerBlendingWindow2         ;888B88;
    dw Instruction_HDMAObject_Sleep                                      ;888B8B;
    dw Instruction_HDMAObject_Delete                                     ;888B8D;


;;; $8B8F: Pre-instruction - power bomb explosion - set layer blending window 2 configuration ;;;
PreInstruction_PowerBombExplosion_SetLayerBlendingWindow2:
; Used by InstList_PowerBombExplosion_Window2_RightPosition
    LDA.W #$8000                                                         ;888B8F;
    TSB.W LayerBlending_Config                                           ;888B92;
    RTL                                                                  ;888B95;


;;; $8B96: Power bomb stage 5 HDMA object timer ;;;
PowerBomb_Stage5_HDMAObjectTimer:
    dw $0003                                                             ;888B96;


;;; $8B98: Pre-instruction - power bomb explosion - stage 5 - after-glow ;;;
PreInstruction_PowerBombExplosion_5_AfterGlow:
;; Parameters:
;;     X: HDMA object index
    LDA.W PowerBombExplosionStatus                                       ;888B98;
    BMI .exploding                                                       ;888B9B;
    RTL                                                                  ;888B9D;

  .exploding:
    DEC.W HDMAObject_Timers,X                                            ;888B9E;
    BPL .return                                                          ;888BA1;
    SEP #$20                                                             ;888BA3;
    DEC.W HDMAObject_Var3,X                                              ;888BA5;
    BEQ .wake                                                            ;888BA8;
    LDA.W DP_ColorMathSubScreenBackdropColor0                            ;888BAA;
    AND.B #$1F                                                           ;888BAD;
    BEQ .green                                                           ;888BAF;
    DEC                                                                  ;888BB1;
    ORA.B #$20                                                           ;888BB2;
    STA.W DP_ColorMathSubScreenBackdropColor0                            ;888BB4;

  .green:
    LDA.W DP_ColorMathSubScreenBackdropColor1                            ;888BB7;
    AND.B #$1F                                                           ;888BBA;
    BEQ .blue                                                            ;888BBC;
    DEC                                                                  ;888BBE;
    ORA.B #$40                                                           ;888BBF;
    STA.W DP_ColorMathSubScreenBackdropColor1                            ;888BC1;

  .blue:
    LDA.W DP_ColorMathSubScreenBackdropColor2                            ;888BC4;
    AND.B #$1F                                                           ;888BC7;
    BEQ .setTimer                                                        ;888BC9;
    DEC                                                                  ;888BCB;
    ORA.B #$80                                                           ;888BCC;
    STA.W DP_ColorMathSubScreenBackdropColor2                            ;888BCE;

  .setTimer:
    LDA.L PowerBomb_Stage5_HDMAObjectTimer                               ;888BD1;
    STA.W HDMAObject_Timers,X                                            ;888BD5;
    REP #$20                                                             ;888BD8;

  .return:
    RTL                                                                  ;888BDA;

  .wake:
    REP #$20                                                             ;888BDB;
    LDA.W #$0001                                                         ;888BDD;
    STA.W HDMAObject_InstructionTimers,X                                 ;888BE0;
    INC.W HDMAObject_InstListPointers,X                                  ;888BE3;
    INC.W HDMAObject_InstListPointers,X                                  ;888BE6;
    RTL                                                                  ;888BE9;


;;; $8BEA: Calculate power bomb explosion HDMA data tables - pre-scaled - power bomb is left of screen ;;;
Calc_PowerBombExplo_HDMADataTables_PreScaled_LeftOfScreen:
;; Parameters:
;;     X: 0. Power bomb explosion HDMA data table index
;;     Y: Pre-scaled power bomb explosion shape definition pointer

; Called by:
;     $8EB2: Pre-instruction - power bomb explosion - stage 4 - explosion - white
;     $91A8: Pre-instruction - power bomb explosion - stage 2 - pre-explosion - yellow
    LDA.W SamusProjectile_PowerBombPositionOnScreen                      ;888BEA;
    CLC                                                                  ;888BED;
    ADC.W $0000,Y                                                        ;888BEE;
    BCS +                                                                ;888BF1;
    LDA.B #$00                                                           ;888BF3;
    STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;888BF5;
    INC                                                                  ;888BF9;
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;888BFA;
    BRA .next                                                            ;888BFE;

+   STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;888C00;
    LDA.B #$00                                                           ;888C04;
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;888C06;

  .next:
    INY                                                                  ;888C0A;
    INX                                                                  ;888C0B;
    CPX.W #$00C0                                                         ;888C0C;
    BNE Calc_PowerBombExplo_HDMADataTables_PreScaled_LeftOfScreen        ;888C0F;
    RTS                                                                  ;888C11;


;;; $8C12: Calculate power bomb explosion HDMA data tables - pre-scaled - power bomb is on screen ;;;
Calculate_PowerBombExplo_HDMADataTables_PreScaled_OnScreen:
;; Parameters:
;;     X: 0. Power bomb explosion HDMA data table index
;;     Y: Pre-scaled power bomb explosion shape definition pointer

; Called by:
;     $8EB2: Pre-instruction - power bomb explosion - stage 4 - explosion - white
;     $91A8: Pre-instruction - power bomb explosion - stage 2 - pre-explosion - yellow
    LDA.W $0000,Y                                                        ;888C12;
    BEQ .return                                                          ;888C15;
    CLC                                                                  ;888C17;
    ADC.W SamusProjectile_PowerBombPositionOnScreen                      ;888C18;
    BCC +                                                                ;888C1B;
    LDA.B #$FF                                                           ;888C1D;

+   STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;888C1F;
    LDA.W SamusProjectile_PowerBombPositionOnScreen                      ;888C23;
    SEC                                                                  ;888C26;
    SBC.W $0000,Y                                                        ;888C27;
    BCS .storeTable                                                      ;888C2A;
    LDA.B #$00                                                           ;888C2C;

  .storeTable:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;888C2E;
    INY                                                                  ;888C32;
    INX                                                                  ;888C33;
    CPX.W #$00C0                                                         ;888C34;
    BNE Calculate_PowerBombExplo_HDMADataTables_PreScaled_OnScreen       ;888C37;

  .return:
    RTS                                                                  ;888C39;


;;; $8C3A: Calculate power bomb explosion HDMA data tables - pre-scaled - power bomb is right of screen ;;;
Calc_PowerBombExplo_HDMADataTables_PreScaled_RightOfScreen:
;; Parameters:
;;     X: 0. Power bomb explosion HDMA data table index
;;     Y: Pre-scaled power bomb explosion shape definition pointer

; Called by:
;     $8EB2: Pre-instruction - power bomb explosion - stage 4 - explosion - white
;     $91A8: Pre-instruction - power bomb explosion - stage 2 - pre-explosion - yellow
    LDA.W SamusProjectile_PowerBombPositionOnScreen                      ;888C3A;
    SEC                                                                  ;888C3D;
    SBC.W $0000,Y                                                        ;888C3E;
    BCC +                                                                ;888C41;
    LDA.B #$FF                                                           ;888C43;
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;888C45;
    DEC                                                                  ;888C49;
    STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;888C4A;
    BRA .next                                                            ;888C4E;

+   STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;888C50;
    LDA.B #$FF                                                           ;888C54;
    STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;888C56;

  .next:
    INY                                                                  ;888C5A;
    INX                                                                  ;888C5B;
    CPX.W #$00C0                                                         ;888C5C;
    BNE Calc_PowerBombExplo_HDMADataTables_PreScaled_RightOfScreen       ;888C5F;
    RTS                                                                  ;888C61;


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
    LDA.W PowerBombExplosionStatus                                       ;888C62;
    BMI .exploding                                                       ;888C65;
    RTL                                                                  ;888C67;

  .exploding:
    LDA.W SamusProjectile_PowerBombExplosionXPosition                    ;888C68;
    SEC                                                                  ;888C6B;
    SBC.W Layer1XPosition                                                ;888C6C;
    CLC                                                                  ;888C6F;
    ADC.W #$0100                                                         ;888C70;
    CMP.W #$0300                                                         ;888C73;
    BCC +                                                                ;888C76;
    BRA .offScreen                                                       ;888C78;

+   STA.W SamusProjectile_PowerBombPositionOnScreen                      ;888C7A;
    LDA.W SamusProjectile_PowerBombExplosionYPosition                    ;888C7D;
    SEC                                                                  ;888C80;
    SBC.W Layer1YPosition                                                ;888C81;
    CLC                                                                  ;888C84;
    ADC.W #$0100                                                         ;888C85;
    CMP.W #$0300                                                         ;888C88;
    BCC .onScreen                                                        ;888C8B;

  .offScreen:
    LDA.W #$0000                                                         ;888C8D;

  .onScreen:
    EOR.W #$03FF                                                         ;888C90;
    SEC                                                                  ;888C93;
    SBC.W #$0100                                                         ;888C94;
    STA.W SamusProjectile_PowerBombExplosionHDMATableIndex               ;888C97;
    LDA.W SamusProjectile_PowerBombExplosionRadius                       ;888C9A;
    AND.W #$FF00                                                         ;888C9D;
    BNE +                                                                ;888CA0;
    STZ.W SamusProjectile_PowerBombExplosionHDMATableIndex               ;888CA2;

+   LDA.W HDMAObject_ChannelIndicesBanks,X                               ;888CA5;
    AND.W #$00FF                                                         ;888CA8;
    TAY                                                                  ;888CAB;
    LDA.W SamusProjectile_PowerBombExplosionHDMATableIndex               ;888CAC;
    ASL                                                                  ;888CAF;
    CLC                                                                  ;888CB0;
    ADC.W SamusProjectile_PowerBombExplosionHDMATableIndex               ;888CB1;
    STA.B DP_Temp16                                                      ;888CB4;
    ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Left_200below     ;888CB6;
    STA.W HDMAObject_TablePointers,X                                     ;888CB9;
    LDA.B DP_Temp16                                                      ;888CBC;
    CLC                                                                  ;888CBE;
    ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Right_200below    ;888CBF;
    STA.W HDMAObject_TablePointers+2,X                                   ;888CC2;
    RTL                                                                  ;888CC5;


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
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y             ;888CC6;
    STA.W $4203                                                          ;888CC9;
    NOP                                                                  ;888CCC;
    NOP                                                                  ;888CCD;
    NOP                                                                  ;888CCE;
    LDA.W $4217                                                          ;888CCF;
    STA.B DP_Temp14                                                      ;888CD2;
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y             ;888CD4;
    STA.W $4203                                                          ;888CD7;
    NOP                                                                  ;888CDA;
    LDA.W SamusProjectile_PowerBombPositionOnScreen                      ;888CDB;
    CLC                                                                  ;888CDE;
    ADC.W $4217                                                          ;888CDF;
    BCS .moveToHighByte                                                  ;888CE2;
    LDA.B #$00                                                           ;888CE4;
    XBA                                                                  ;888CE6;
    LDA.B #$FF                                                           ;888CE7;
    BRA .loopDataTable                                                   ;888CE9;

  .moveToHighByte:
    XBA                                                                  ;888CEB;
    LDA.B #$00                                                           ;888CEC;

  .loopDataTable:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;888CEE;
    XBA                                                                  ;888CF2;
    STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;888CF3;
    XBA                                                                  ;888CF7;
    CPX.B DP_Temp14                                                      ;888CF8;
    BEQ .nextShapeDefinite                                               ;888CFA;
    DEX                                                                  ;888CFC;
    JMP.W .loopDataTable                                                 ;888CFD;

  .nextShapeDefinite:
    INY                                                                  ;888D00;
    BPL Calculate_PowerBombExplo_HDMADataTables_Scaled_LeftOfScreen      ;888D01;
    RTS                                                                  ;888D03;


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
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y             ;888D04;
    STA.W $4203                                                          ;888D07;
    NOP                                                                  ;888D0A;
    NOP                                                                  ;888D0B;
    NOP                                                                  ;888D0C;
    LDA.W $4217                                                          ;888D0D;
    STA.B DP_Temp14                                                      ;888D10;
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y             ;888D12;
    STA.W $4203                                                          ;888D15;
    NOP                                                                  ;888D18;
    LDA.W SamusProjectile_PowerBombPositionOnScreen                      ;888D19;
    CLC                                                                  ;888D1C;
    ADC.W $4217                                                          ;888D1D;
    BCC .lowByte                                                         ;888D20;
    LDA.B #$FF                                                           ;888D22;

  .lowByte:
    XBA                                                                  ;888D24;
    LDA.W SamusProjectile_PowerBombPositionOnScreen                      ;888D25;
    SEC                                                                  ;888D28;
    SBC.W $4217                                                          ;888D29;
    BCS .loopDataTable                                                   ;888D2C;
    LDA.B #$00                                                           ;888D2E;

  .loopDataTable:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;888D30;
    XBA                                                                  ;888D34;
    STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;888D35;
    XBA                                                                  ;888D39;
    CPX.B DP_Temp14                                                      ;888D3A;
    BEQ .next                                                            ;888D3C;
    DEX                                                                  ;888D3E;
    JMP.W .loopDataTable                                                 ;888D3F;

  .next:
    INY                                                                  ;888D42;
    BPL Calculate_PowerBombExplosion_HDMADataTables_Scaled_OnScreen      ;888D43;
    RTS                                                                  ;888D45;


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
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y             ;888D46;
    STA.W $4203                                                          ;888D49;
    NOP                                                                  ;888D4C;
    NOP                                                                  ;888D4D;
    NOP                                                                  ;888D4E;
    LDA.W $4217                                                          ;888D4F;
    STA.B DP_Temp14                                                      ;888D52;
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y             ;888D54;
    STA.W $4203                                                          ;888D57;
    NOP                                                                  ;888D5A;
    LDA.W SamusProjectile_PowerBombPositionOnScreen                      ;888D5B;
    SEC                                                                  ;888D5E;
    SBC.W $4217                                                          ;888D5F;
    BCC .lessThan100                                                     ;888D62;
    LDA.B #$FF                                                           ;888D64;
    XBA                                                                  ;888D66;
    LDA.B #$00                                                           ;888D67;
    BRA +                                                                ;888D69;

  .lessThan100:
    XBA                                                                  ;888D6B;
    LDA.B #$FF                                                           ;888D6C;

+   XBA                                                                  ;888D6E;

  .loopDataTable:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;888D6F;
    XBA                                                                  ;888D73;
    STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;888D74;
    XBA                                                                  ;888D78;
    CPX.B DP_Temp14                                                      ;888D79;
    BEQ .nextShapeDefinition                                             ;888D7B;
    DEX                                                                  ;888D7D;
    JMP.W .loopDataTable                                                 ;888D7E;

  .nextShapeDefinition:
    INY                                                                  ;888D81;
    BPL Calculate_PowerBombExplo_HDMADataTables_Scaled_RightOfScreen     ;888D82;
    RTS                                                                  ;888D84;


;;; $8D85: Power bomb explosion colours ;;;
PowerBombExplosion_Colors:
; Indexed by [power bomb explosion radius] / 800h
; Red, green, blue. Range 0..1Fh
; Yellow section
  .red:
    db $0E                                                               ;888D85;
  .green:
    db     $0E                                                           ;888D86;
  .blue:
    db         $0A                                                       ;888D87;
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
    dw $0000                                                             ;888DE5;


;;; $8DE7: Power bomb explosion radius acceleration ;;;
PowerBombExplosion_RadiusAcceleration:
    dw $0030                                                             ;888DE7;


;;; $8DE9: Pre-instruction - power bomb explosion - stage 3 - explosion - yellow ;;;
PreInstruction_PowerBombExplosion_3_Explosion_Yellow:
;; Parameters:
;;     X: HDMA object index
    LDA.W PowerBombExplosionStatus                                       ;888DE9;
    BMI .exploding                                                       ;888DEC;
    RTL                                                                  ;888DEE;

  .exploding:
    PHP                                                                  ;888DEF;
    PHB                                                                  ;888DF0;
    REP #$30                                                             ;888DF1;
    PHX                                                                  ;888DF3;
    PHY                                                                  ;888DF4;
    JSL.L Calculate_PowerBombExplosion_HDMADataTablePointers             ;888DF5;
    PEA.W PowerBombExplosion_Colors>>8&$FF00                             ;888DF9;
    PLB                                                                  ;888DFC;
    PLB                                                                  ;888DFD;
    SEP #$30                                                             ;888DFE;
    LDA.B #$00                                                           ;888E00;
    XBA                                                                  ;888E02;
    LDY.B #$60                                                           ;888E03;
    LDA.W SamusProjectile_PowerBombExplosionRadius+1                     ;888E05;
    STA.W $4202                                                          ;888E08;
    LDA.W PowerBombExplosion_ShapeDefinitionTable_Unscaled_topOffset     ;888E0B;
    STA.W $4203                                                          ;888E0E;
    NOP                                                                  ;888E11;
    NOP                                                                  ;888E12;
    NOP                                                                  ;888E13;
    LDA.W $4217                                                          ;888E14;
    STA.B DP_Temp12                                                      ;888E17;
    TAX                                                                  ;888E19;
    PEA.W .loopPadDataTableBegin-1                                       ;888E1A;
    LDA.W SamusProjectile_PowerBombPositionOnScreen+1                    ;888E1D;
    AND.B #$FF                                                           ;888E20;
    BEQ .offScreenLeft                                                   ;888E22;
    DEC                                                                  ;888E24;
    BEQ .onScreen                                                        ;888E25;
    JMP.W Calculate_PowerBombExplo_HDMADataTables_Scaled_RightOfScreen   ;888E27;

  .onScreen:
    JMP.W Calculate_PowerBombExplosion_HDMADataTables_Scaled_OnScreen    ;888E2A;

  .offScreenLeft:
    JMP.W Calculate_PowerBombExplo_HDMADataTables_Scaled_LeftOfScreen    ;888E2D;

  .loopPadDataTableBegin:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;888E30;
    XBA                                                                  ;888E34;
    STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;888E35;
    XBA                                                                  ;888E39;
    DEX                                                                  ;888E3A;
    BPL .loopPadDataTableBegin                                           ;888E3B;
    LDX.B DP_Temp12                                                      ;888E3D;
    INX                                                                  ;888E3F;
    CPX.B #$C0                                                           ;888E40;
    BEQ .finishedTable                                                   ;888E42;
    LDA.B #$FF                                                           ;888E44;

  .loopPadDataTableEnd:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;888E46;
    INC                                                                  ;888E4A;
    STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;888E4B;
    DEC                                                                  ;888E4F;
    INX                                                                  ;888E50;
    CPX.B #$C0                                                           ;888E51;
    BNE .loopPadDataTableEnd                                             ;888E53;

  .finishedTable:
    LDA.W SamusProjectile_PowerBombExplosionRadius+1                     ;888E55;
    LSR                                                                  ;888E58;
    LSR                                                                  ;888E59;
    LSR                                                                  ;888E5A;
    AND.B #$1F                                                           ;888E5B;
    STA.B DP_Temp12                                                      ;888E5D;
    ASL                                                                  ;888E5F;
    CLC                                                                  ;888E60;
    ADC.B DP_Temp12                                                      ;888E61;
    TAX                                                                  ;888E63;
    LDA.L PowerBombExplosion_Colors_red,X                                ;888E64;
    ORA.B #$20                                                           ;888E68;
    STA.W DP_ColorMathSubScreenBackdropColor0                            ;888E6A;
    LDA.L PowerBombExplosion_Colors_green,X                              ;888E6D;
    ORA.B #$40                                                           ;888E71;
    STA.W DP_ColorMathSubScreenBackdropColor1                            ;888E73;
    LDA.L PowerBombExplosion_Colors_blue,X                               ;888E76;
    ORA.B #$80                                                           ;888E7A;
    STA.W DP_ColorMathSubScreenBackdropColor2                            ;888E7C;
    REP #$30                                                             ;888E7F;
    PLY                                                                  ;888E81;
    PLX                                                                  ;888E82;
    LDA.W SamusProjectile_PowerBombExplosionRadius                       ;888E83;
    CLC                                                                  ;888E86;
    ADC.W SamusProjectile_PowerBombPreExplosionRadiusSpeed               ;888E87;
    STA.W SamusProjectile_PowerBombExplosionRadius                       ;888E8A;
    CMP.W #$8600                                                         ;888E8D;
    BCC .lessThan8600                                                    ;888E90;
    LDA.W #$0001                                                         ;888E92;
    STA.W HDMAObject_InstructionTimers,X                                 ;888E95;
    INC.W HDMAObject_InstListPointers,X                                  ;888E98;
    INC.W HDMAObject_InstListPointers,X                                  ;888E9B;
    STZ.W HDMAObject_Timers,X                                            ;888E9E;
    JMP.W .return                                                        ;888EA1;

  .lessThan8600:
    LDA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed               ;888EA4;
    CLC                                                                  ;888EA7;
    ADC.L PowerBombExplosion_RadiusAcceleration                          ;888EA8;
    STA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed               ;888EAC;

  .return:
    PLB                                                                  ;888EAF;
    PLP                                                                  ;888EB0;
    RTL                                                                  ;888EB1;


;;; $8EB2: Pre-instruction - power bomb explosion - stage 4 - explosion - white ;;;
PreInstruction_PowerBombExplosion_4_Explosion_White:
;; Parameters:
;;     X: HDMA object index
    LDA.W PowerBombExplosionStatus                                       ;888EB2;
    BMI .exploding                                                       ;888EB5;
    RTL                                                                  ;888EB7;

  .exploding:
    PHP                                                                  ;888EB8;
    PHB                                                                  ;888EB9;
    REP #$30                                                             ;888EBA;
    PHX                                                                  ;888EBC;
    PHY                                                                  ;888EBD;
    JSL.L Calculate_PowerBombExplosion_HDMADataTablePointers             ;888EBE;
    PEA.W PowerBombExplosion_Colors>>8&$FF00                             ;888EC2;
    PLB                                                                  ;888EC5;
    PLB                                                                  ;888EC6;
    LDY.W SamusProjectile_PreScaledPowerBombExplosionShapeDefPointer     ;888EC7;
    LDX.W #$0000                                                         ;888ECA;
    SEP #$20                                                             ;888ECD;
    PEA.W .manualReturn-1                                                ;888ECF;
    LDA.W SamusProjectile_PowerBombPositionOnScreen+1                    ;888ED2;
    AND.B #$FF                                                           ;888ED5;
    BEQ .offScreenLeft                                                   ;888ED7;
    DEC                                                                  ;888ED9;
    BEQ .onScreen                                                        ;888EDA;
    JMP.W Calc_PowerBombExplo_HDMADataTables_PreScaled_RightOfScreen     ;888EDC;

  .onScreen:
    JMP.W Calculate_PowerBombExplo_HDMADataTables_PreScaled_OnScreen     ;888EDF;

  .offScreenLeft:
    JMP.W Calc_PowerBombExplo_HDMADataTables_PreScaled_LeftOfScreen      ;888EE2;

  .manualReturn:
    SEP #$30                                                             ;888EE5;
    LDA.B #$00                                                           ;888EE7;
    XBA                                                                  ;888EE9;
    LDA.W SamusProjectile_PowerBombExplosionRadius+1                     ;888EEA;
    LSR                                                                  ;888EED;
    LSR                                                                  ;888EEE;
    LSR                                                                  ;888EEF;
    AND.B #$1F                                                           ;888EF0;
    STA.B DP_Temp12                                                      ;888EF2;
    ASL                                                                  ;888EF4;
    CLC                                                                  ;888EF5;
    ADC.B DP_Temp12                                                      ;888EF6;
    TAX                                                                  ;888EF8;
    LDA.L PowerBombExplosion_Colors_red,X                                ;888EF9;
    ORA.B #$20                                                           ;888EFD;
    STA.W DP_ColorMathSubScreenBackdropColor0                            ;888EFF;
    LDA.L PowerBombExplosion_Colors_green,X                              ;888F02;
    ORA.B #$40                                                           ;888F06;
    STA.W DP_ColorMathSubScreenBackdropColor1                            ;888F08;
    LDA.L PowerBombExplosion_Colors_blue,X                               ;888F0B;
    ORA.B #$80                                                           ;888F0F;
    STA.W DP_ColorMathSubScreenBackdropColor2                            ;888F11;
    REP #$30                                                             ;888F14;
    PLY                                                                  ;888F16;
    PLX                                                                  ;888F17;
    LDA.W SamusProjectile_PreScaledPowerBombExplosionShapeDefPointer     ;888F18;
    CLC                                                                  ;888F1B;
    ADC.W #$00C0                                                         ;888F1C;
    STA.W SamusProjectile_PreScaledPowerBombExplosionShapeDefPointer     ;888F1F;
    CMP.W #PowerBomb_PreExplosion_ShapeDefinitionTables_PreScaled        ;888F22;
    BNE .notPreExplosion                                                 ;888F25;
    LDA.W #$0001                                                         ;888F27;
    STA.W HDMAObject_InstructionTimers,X                                 ;888F2A;
    INC.W HDMAObject_InstListPointers,X                                  ;888F2D;
    INC.W HDMAObject_InstListPointers,X                                  ;888F30;
    STZ.W HDMAObject_Timers,X                                            ;888F33;
    LDA.W #$0020                                                         ;888F36;
    STA.W HDMAObject_Var3,X                                              ;888F39;

  .notPreExplosion:
    LDA.W SamusProjectile_PowerBombExplosionRadius                       ;888F3C;
    CLC                                                                  ;888F3F;
    ADC.W SamusProjectile_PowerBombPreExplosionRadiusSpeed               ;888F40;
    BCS .return                                                          ;888F43;
    STA.W SamusProjectile_PowerBombExplosionRadius                       ;888F45;
    LDA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed               ;888F48;
    CLC                                                                  ;888F4B;
    ADC.L PowerBombExplosion_RadiusAcceleration                          ;888F4C;
    STA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed               ;888F50;

  .return:
    PLB                                                                  ;888F53;
    PLP                                                                  ;888F54;
    RTL                                                                  ;888F55;


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
    LDA.W PowerBombExplosionStatus                                       ;888F56;
    BMI .exploding                                                       ;888F59;
    RTL                                                                  ;888F5B;

  .exploding:
    LDA.W SamusProjectile_PowerBombExplosionXPosition                    ;888F5C;
    SEC                                                                  ;888F5F;
    SBC.W Layer1XPosition                                                ;888F60;
    CLC                                                                  ;888F63;
    ADC.W #$0100                                                         ;888F64;
    CMP.W #$0300                                                         ;888F67;
    BCC +                                                                ;888F6A;
    BRA .offScreen                                                       ;888F6C;

+   STA.W SamusProjectile_PowerBombPositionOnScreen                      ;888F6E;
    LDA.W SamusProjectile_PowerBombExplosionYPosition                    ;888F71;
    SEC                                                                  ;888F74;
    SBC.W Layer1YPosition                                                ;888F75;
    CLC                                                                  ;888F78;
    ADC.W #$0100                                                         ;888F79;
    CMP.W #$0300                                                         ;888F7C;
    BCC .onScreen                                                        ;888F7F;

  .offScreen:
    LDA.W #$0000                                                         ;888F81;

  .onScreen:
    EOR.W #$03FF                                                         ;888F84;
    SEC                                                                  ;888F87;
    SBC.W #$0100                                                         ;888F88;
    STA.W SamusProjectile_PowerBombExplosionHDMATableIndex               ;888F8B;
    LDA.W SamusProjectile_PowerBombPreExplosionFlashRadius               ;888F8E;
    AND.W #$FF00                                                         ;888F91;
    BNE +                                                                ;888F94;
    STZ.W SamusProjectile_PowerBombExplosionHDMATableIndex               ;888F96;

+   LDA.W HDMAObject_ChannelIndicesBanks,X                               ;888F99;
    AND.W #$00FF                                                         ;888F9C;
    TAY                                                                  ;888F9F;
    LDA.W SamusProjectile_PowerBombExplosionHDMATableIndex               ;888FA0;
    ASL                                                                  ;888FA3;
    CLC                                                                  ;888FA4;
    ADC.W SamusProjectile_PowerBombExplosionHDMATableIndex               ;888FA5;
    STA.B DP_Temp16                                                      ;888FA8;
    ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Left_200below     ;888FAA;
    STA.W HDMAObject_TablePointers,X                                     ;888FAD;
    LDA.B DP_Temp16                                                      ;888FB0;
    CLC                                                                  ;888FB2;
    ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Right_200below    ;888FB3;
    STA.W HDMAObject_TablePointers+2,X                                   ;888FB6;
    RTL                                                                  ;888FB9;


if !FEATURE_KEEP_UNREFERENCED
;;; $8FBA: Unused. Calculate power bomb related HDMA data tables - scaled - power bomb is left of screen ;;;
UNUSED_CalcPowerBombRelatedHDMATables_Scaled_Left_888FBA:
; Clone of Calculate_PowerBombExplo_HDMADataTables_Scaled_LeftOfScreen
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y             ;888FBA;
    STA.W $4203                                                          ;888FBD;
    NOP                                                                  ;888FC0;
    NOP                                                                  ;888FC1;
    NOP                                                                  ;888FC2;
    LDA.W $4217                                                          ;888FC3;
    STA.B DP_Temp14                                                      ;888FC6;
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y             ;888FC8;
    STA.W $4203                                                          ;888FCB;
    NOP                                                                  ;888FCE;
    LDA.W SamusProjectile_PowerBombPositionOnScreen                      ;888FCF;
    CLC                                                                  ;888FD2;
    ADC.W $4217                                                          ;888FD3;
    BCS +                                                                ;888FD6;
    LDA.B #$00                                                           ;888FD8;
    XBA                                                                  ;888FDA;
    LDA.B #$FF                                                           ;888FDB;
    BRA .loop                                                            ;888FDD;

+   XBA                                                                  ;888FDF;
    LDA.B #$00                                                           ;888FE0;

  .loop:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;888FE2;
    XBA                                                                  ;888FE6;
    STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;888FE7;
    XBA                                                                  ;888FEB;
    CPX.B DP_Temp14                                                      ;888FEC;
    BEQ .next                                                            ;888FEE;
    DEX                                                                  ;888FF0;
    JMP.W .loop                                                          ;888FF1;

  .next:
    INY                                                                  ;888FF4;
    BPL UNUSED_CalcPowerBombRelatedHDMATables_Scaled_Left_888FBA         ;888FF5;
    RTS                                                                  ;888FF7;


;;; $8FF8: Unused. Calculate power bomb related HDMA data tables - scaled - power bomb is on screen ;;;
UNUSED_CalcPBRelatedHDMADataTables_Scaled_OnScreen_888FF8:
; Clone of Calculate_PowerBombExplosion_HDMADataTables_Scaled_OnScreen
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y             ;888FF8;
    STA.W $4203                                                          ;888FFB;
    NOP                                                                  ;888FFE;
    NOP                                                                  ;888FFF;
    NOP                                                                  ;889000;
    LDA.W $4217                                                          ;889001;
    STA.B DP_Temp14                                                      ;889004;
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y             ;889006;
    STA.W $4203                                                          ;889009;
    NOP                                                                  ;88900C;
    LDA.W SamusProjectile_PowerBombPositionOnScreen                      ;88900D;
    CLC                                                                  ;889010;
    ADC.W $4217                                                          ;889011;
    BCC +                                                                ;889014;
    LDA.B #$FF                                                           ;889016;

+   XBA                                                                  ;889018;
    LDA.W SamusProjectile_PowerBombPositionOnScreen                      ;889019;
    SEC                                                                  ;88901C;
    SBC.W $4217                                                          ;88901D;
    BCS .loop                                                            ;889020;
    LDA.B #$00                                                           ;889022;

  .loop:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;889024;
    XBA                                                                  ;889028;
    STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;889029;
    XBA                                                                  ;88902D;
    CPX.B DP_Temp14                                                      ;88902E;
    BEQ .next                                                            ;889030;
    DEX                                                                  ;889032;
    JMP.W .loop                                                          ;889033;

  .next:
    INY                                                                  ;889036;
    BPL UNUSED_CalcPBRelatedHDMADataTables_Scaled_OnScreen_888FF8        ;889037;
    RTS                                                                  ;889039;


;;; $903A: Unused. Calculate power bomb related HDMA data tables - scaled - power bomb is right of screen ;;;
UNUSED_CalPBRelatedHDMADataTables_Scaled_OnScreen_88903A:
; Clone of Calculate_PowerBombExplo_HDMADataTables_Scaled_RightOfScreen
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y             ;88903A;
    STA.W $4203                                                          ;88903D;
    NOP                                                                  ;889040;
    NOP                                                                  ;889041;
    NOP                                                                  ;889042;
    LDA.W $4217                                                          ;889043;
    STA.B DP_Temp14                                                      ;889046;
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y             ;889048;
    STA.W $4203                                                          ;88904B;
    NOP                                                                  ;88904E;
    LDA.W SamusProjectile_PowerBombPositionOnScreen                      ;88904F;
    SEC                                                                  ;889052;
    SBC.W $4217                                                          ;889053;
    BCC .lowByteFF                                                       ;889056;
    LDA.B #$FF                                                           ;889058;
    XBA                                                                  ;88905A;
    LDA.B #$00                                                           ;88905B;
    BRA +                                                                ;88905D;

  .lowByteFF:
    XBA                                                                  ;88905F;
    LDA.B #$FF                                                           ;889060;

+   XBA                                                                  ;889062;

  .loop:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;889063;
    XBA                                                                  ;889067;
    STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;889068;
    XBA                                                                  ;88906C;
    CPX.B DP_Temp14                                                      ;88906D;
    BEQ .next                                                            ;88906F;
    DEX                                                                  ;889071;
    JMP.W .loop                                                          ;889072;

  .next:
    INY                                                                  ;889075;
    BPL UNUSED_CalPBRelatedHDMADataTables_Scaled_OnScreen_88903A         ;889076;
    RTS                                                                  ;889078;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9079: Power bomb pre-explosion colours ;;;
PowerBomb_PreExplosion_Colors:
; Indexed by [power bomb pre-explosion radius] / 800h
; Red, green, blue. Range 0..1Fh
; White section
  .red:
    db $10                                                               ;889079;
  .green:
    db $10                                                               ;88907A;
  .blue:
    db $10                                                               ;88907B;
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
    db $13,$13,$0F                                                       ;8890A9;
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
    dw $0001                                                             ;8890D9;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $90DB: Power bomb pre-explosion initial radius speed ;;;
PowerBomb_PreExplosion_InitialRadiusSpeed:
    dw $3000                                                             ;8890DB;


;;; $90DD: Power bomb pre-explosion radius acceleration ;;;
PowerBomb_PreExplosion_RadiusAcceleration:
    dw $0080                                                             ;8890DD;


;;; $90DF: Pre-instruction - power bomb explosion - stage 1 - pre-explosion - white ;;;
PreInstruction_PowerBombExplosion_1_PreExplosion_White:
;; Parameters:
;;     X: HDMA object index
    LDA.W PowerBombExplosionStatus                                       ;8890DF;
    BMI .exploding                                                       ;8890E2;
    RTL                                                                  ;8890E4;

  .exploding:
    PHP                                                                  ;8890E5;
    PHB                                                                  ;8890E6;
    REP #$30                                                             ;8890E7;
    PHX                                                                  ;8890E9;
    PHY                                                                  ;8890EA;
    JSL.L Calculate_PowerBombPreExplosion_HDMAObjectTablePointers        ;8890EB;
    PEA.W PowerBomb_PreExplosion_Colors>>8&$FF00                         ;8890EF;
    PLB                                                                  ;8890F2;
    PLB                                                                  ;8890F3;
    SEP #$30                                                             ;8890F4;
    LDA.B #$00                                                           ;8890F6;
    XBA                                                                  ;8890F8;
    LDY.B #$60                                                           ;8890F9;
    LDA.W SamusProjectile_PowerBombPreExplosionFlashRadius+1             ;8890FB;
    STA.W $4202                                                          ;8890FE;
    LDA.W PowerBombExplosion_ShapeDefinitionTable_Unscaled_topOffset     ;889101;
    STA.W $4203                                                          ;889104;
    NOP                                                                  ;889107;
    NOP                                                                  ;889108;
    NOP                                                                  ;889109;
    LDA.W $4217                                                          ;88910A;
    STA.B DP_Temp12                                                      ;88910D;
    TAX                                                                  ;88910F;
    PEA.W .loopPadDataTableBegin-1                                       ;889110;
    LDA.W SamusProjectile_PowerBombPositionOnScreen+1                    ;889113;
    AND.B #$FF                                                           ;889116;
    BEQ .offScreenLeft                                                   ;889118;
    DEC                                                                  ;88911A;
    BEQ .onScreen                                                        ;88911B;
    JMP.W Calculate_PowerBombExplo_HDMADataTables_Scaled_RightOfScreen   ;88911D;

  .onScreen:
    JMP.W Calculate_PowerBombExplosion_HDMADataTables_Scaled_OnScreen    ;889120;

  .offScreenLeft:
    JMP.W Calculate_PowerBombExplo_HDMADataTables_Scaled_LeftOfScreen    ;889123;

  .loopPadDataTableBegin:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;889126;
    XBA                                                                  ;88912A;
    STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;88912B;
    XBA                                                                  ;88912F;
    DEX                                                                  ;889130;
    BPL .loopPadDataTableBegin                                           ;889131;
    LDX.B DP_Temp12                                                      ;889133;
    INX                                                                  ;889135;
    CPX.B #$C0                                                           ;889136;
    BEQ .finishedTable                                                   ;889138;
    LDA.B #$FF                                                           ;88913A;

  .loopPadDataTableEnd:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;88913C;
    INC                                                                  ;889140;
    STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;889141;
    DEC                                                                  ;889145;
    INX                                                                  ;889146;
    CPX.B #$C0                                                           ;889147;
    BNE .loopPadDataTableEnd                                             ;889149;

  .finishedTable:
    LDA.W SamusProjectile_PowerBombPreExplosionFlashRadius+1             ;88914B;
    LSR                                                                  ;88914E;
    LSR                                                                  ;88914F;
    LSR                                                                  ;889150;
    AND.B #$0F                                                           ;889151;
    STA.B DP_Temp12                                                      ;889153;
    ASL                                                                  ;889155;
    CLC                                                                  ;889156;
    ADC.B DP_Temp12                                                      ;889157;
    TAX                                                                  ;889159;
    LDA.L PowerBomb_PreExplosion_Colors_red,X                            ;88915A;
    ORA.B #$20                                                           ;88915E;
    STA.W DP_ColorMathSubScreenBackdropColor0                            ;889160;
    LDA.L PowerBomb_PreExplosion_Colors_green,X                          ;889163;
    ORA.B #$40                                                           ;889167;
    STA.W DP_ColorMathSubScreenBackdropColor1                            ;889169;
    LDA.L PowerBomb_PreExplosion_Colors_blue,X                           ;88916C;
    ORA.B #$80                                                           ;889170;
    STA.W DP_ColorMathSubScreenBackdropColor2                            ;889172;
    REP #$30                                                             ;889175;
    PLY                                                                  ;889177;
    PLX                                                                  ;889178;
    LDA.W SamusProjectile_PowerBombPreExplosionFlashRadius               ;889179;
    CLC                                                                  ;88917C;
    ADC.W SamusProjectile_PowerBombPreExplosionRadiusSpeed               ;88917D;
    STA.W SamusProjectile_PowerBombPreExplosionFlashRadius               ;889180;
    CMP.W #$9200                                                         ;889183; radius
    BCC .lessThan9200                                                    ;889186;
    LDA.W #$0001                                                         ;889188;
    STA.W HDMAObject_InstructionTimers,X                                 ;88918B;
    INC.W HDMAObject_InstListPointers,X                                  ;88918E;
    INC.W HDMAObject_InstListPointers,X                                  ;889191;
    STZ.W HDMAObject_Timers,X                                            ;889194;
    JMP.W .return                                                        ;889197;

  .lessThan9200:
    LDA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed               ;88919A;
    SEC                                                                  ;88919D;
    SBC.L PowerBomb_PreExplosion_RadiusAcceleration                      ;88919E;
    STA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed               ;8891A2;

  .return:
    PLB                                                                  ;8891A5;
    PLP                                                                  ;8891A6;
    RTL                                                                  ;8891A7;


;;; $91A8: Pre-instruction - power bomb explosion - stage 2 - pre-explosion - yellow ;;;
PreInstruction_PowerBombExplosion_2_PreExplosion_Yellow:
;; Parameters:
;;     X: HDMA object index
    LDA.W PowerBombExplosionStatus                                       ;8891A8;
    BMI .exploding                                                       ;8891AB;
    RTL                                                                  ;8891AD;

  .exploding:
    PHP                                                                  ;8891AE;
    PHB                                                                  ;8891AF;
    REP #$30                                                             ;8891B0;
    PHX                                                                  ;8891B2;
    PHY                                                                  ;8891B3;
    JSL.L Calculate_PowerBombPreExplosion_HDMAObjectTablePointers        ;8891B4;
    PEA.W PowerBomb_PreExplosion_Colors>>8&$FF00                         ;8891B8;
    PLB                                                                  ;8891BB;
    PLB                                                                  ;8891BC;
    LDY.W SamusProjectile_PreScaledPowerBombExplosionShapeDefPointer     ;8891BD;
    LDX.W #$0000                                                         ;8891C0;
    SEP #$20                                                             ;8891C3;
    PEA.W .manualReturn-1                                                ;8891C5;
    LDA.W SamusProjectile_PowerBombPositionOnScreen+1                    ;8891C8;
    AND.B #$FF                                                           ;8891CB;
    BEQ .offScreenLeft                                                   ;8891CD;
    DEC                                                                  ;8891CF;
    BEQ .onScreen                                                        ;8891D0;
    JMP.W Calc_PowerBombExplo_HDMADataTables_PreScaled_RightOfScreen     ;8891D2;

  .onScreen:
    JMP.W Calculate_PowerBombExplo_HDMADataTables_PreScaled_OnScreen     ;8891D5;

  .offScreenLeft:
    JMP.W Calc_PowerBombExplo_HDMADataTables_PreScaled_LeftOfScreen      ;8891D8;

  .manualReturn:
    SEP #$30                                                             ;8891DB;
    LDA.B #$00                                                           ;8891DD;
    XBA                                                                  ;8891DF;
    LDA.W SamusProjectile_PowerBombPreExplosionFlashRadius+1             ;8891E0;
    LSR                                                                  ;8891E3;
    LSR                                                                  ;8891E4;
    LSR                                                                  ;8891E5;
    AND.B #$0F                                                           ;8891E6;
    STA.B DP_Temp12                                                      ;8891E8;
    ASL                                                                  ;8891EA;
    CLC                                                                  ;8891EB;
    ADC.B DP_Temp12                                                      ;8891EC;
    TAX                                                                  ;8891EE;
    LDA.L PowerBomb_PreExplosion_Colors_red,X                            ;8891EF;
    ORA.B #$20                                                           ;8891F3;
    STA.W DP_ColorMathSubScreenBackdropColor0                            ;8891F5;
    LDA.L PowerBomb_PreExplosion_Colors_green,X                          ;8891F8;
    ORA.B #$40                                                           ;8891FC;
    STA.W DP_ColorMathSubScreenBackdropColor1                            ;8891FE;
    LDA.L PowerBomb_PreExplosion_Colors_blue,X                           ;889201;
    ORA.B #$80                                                           ;889205;
    STA.W DP_ColorMathSubScreenBackdropColor2                            ;889207;
    REP #$30                                                             ;88920A;
    PLY                                                                  ;88920C;
    PLX                                                                  ;88920D;
    LDA.W SamusProjectile_PreScaledPowerBombExplosionShapeDefPointer     ;88920E;
    CLC                                                                  ;889211;
    ADC.W #$00C0                                                         ;889212;
    STA.W SamusProjectile_PreScaledPowerBombExplosionShapeDefPointer     ;889215;
    CMP.W #PowerBomb_ShapeDefinitionTiles_Optimization_A206              ;889218;
    BNE .notA206                                                         ;88921B;
    LDA.W #$0001                                                         ;88921D;
    STA.W HDMAObject_InstructionTimers,X                                 ;889220;
    INC.W HDMAObject_InstListPointers,X                                  ;889223;
    INC.W HDMAObject_InstListPointers,X                                  ;889226;
    STZ.W HDMAObject_Timers,X                                            ;889229;

  .notA206:
    LDA.W SamusProjectile_PowerBombPreExplosionFlashRadius               ;88922C;
    CLC                                                                  ;88922F;
    ADC.W SamusProjectile_PowerBombPreExplosionRadiusSpeed               ;889230;
    BCS .return                                                          ;889233;
    STA.W SamusProjectile_PowerBombPreExplosionFlashRadius               ;889235;
    LDA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed               ;889238;
    SEC                                                                  ;88923B;
    SBC.L PowerBomb_PreExplosion_RadiusAcceleration                      ;88923C;
    STA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed               ;889240;

  .return:
    PLB                                                                  ;889243;
    PLP                                                                  ;889244;
    RTL                                                                  ;889245;


;;; $9246: Power bomb explosion shape definitions tables - pre-scaled ;;;
PowerBomb_Explosion_ShapeDefinitionTiles_PreScaled:
; Defines the shape of (the bottom) half of a power bomb explosion
; Each byte defines the width of the power bomb explosion for that pixel-row, C0h pixel-rows total
; One line per frame of explosion
    db $7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7E,$7E,$7E   ;889246;
    db $7E,$7D,$7D,$7D,$7D,$7D,$7C,$7C,$7B,$7B,$7B,$7A,$7A,$7A,$79,$79   ;889256;
    db $78,$78,$77,$77,$76,$76,$75,$75,$74,$74,$73,$72,$71,$71,$70,$6F   ;889266;
    db $6E,$6E,$6D,$6C,$6B,$6A,$69,$69,$68,$67,$66,$65,$63,$62,$61,$60   ;889276;
    db $5F,$5E,$5D,$5C,$5A,$59,$57,$56,$54,$53,$51,$4F,$4E,$4C,$4A,$49   ;889286;
    db $47,$45,$43,$40,$3E,$3B,$39,$36,$33,$30,$2C,$28,$25,$1F,$1A,$12   ;889296;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8892A6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8892B6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8892C6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8892D6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8892E6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8892F6;
    db $86,$86,$86,$86,$86,$86,$86,$86,$86,$85,$85,$85,$85,$85,$85,$85   ;889306;
    db $84,$84,$84,$84,$84,$83,$83,$83,$82,$82,$82,$81,$81,$81,$80,$80   ;889316;
    db $80,$7F,$7F,$7E,$7E,$7D,$7C,$7C,$7B,$7B,$7A,$7A,$79,$78,$77,$77   ;889326;
    db $76,$76,$75,$74,$73,$72,$71,$70,$6F,$6F,$6E,$6D,$6C,$6B,$6A,$68   ;889336;
    db $67,$66,$65,$64,$63,$62,$61,$5F,$5E,$5D,$5B,$5A,$58,$56,$55,$53   ;889346;
    db $52,$50,$4E,$4C,$4A,$48,$46,$45,$42,$40,$3D,$3B,$37,$34,$31,$2D   ;889356;
    db $29,$27,$21,$1B,$13,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889366;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889376;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889386;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889396;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8893A6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8893B6;
    db $8D,$8D,$8D,$8D,$8D,$8D,$8D,$8D,$8D,$8D,$8C,$8C,$8C,$8C,$8C,$8C   ;8893C6;
    db $8C,$8B,$8B,$8B,$8B,$8B,$8A,$8A,$8A,$89,$89,$89,$89,$88,$87,$87   ;8893D6;
    db $87,$86,$86,$85,$85,$84,$84,$84,$83,$82,$82,$81,$80,$80,$80,$7F   ;8893E6;
    db $7E,$7D,$7C,$7C,$7B,$7A,$7A,$78,$78,$77,$76,$75,$75,$74,$73,$72   ;8893F6;
    db $71,$70,$6F,$6D,$6C,$6B,$6A,$69,$68,$67,$66,$64,$62,$62,$60,$5E   ;889406;
    db $5D,$5A,$5A,$58,$57,$54,$52,$51,$4F,$4D,$4A,$48,$47,$44,$42,$3F   ;889416;
    db $3C,$3A,$36,$33,$2F,$2B,$29,$22,$1D,$14,$00,$00,$00,$00,$00,$00   ;889426;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889436;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889446;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889456;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889466;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889476;
    db $95,$95,$95,$95,$95,$95,$95,$95,$95,$95,$94,$94,$94,$94,$94,$94   ;889486;
    db $94,$93,$93,$93,$93,$93,$93,$92,$92,$91,$91,$91,$90,$90,$90,$90   ;889496;
    db $8F,$8E,$8E,$8E,$8D,$8D,$8D,$8C,$8C,$8B,$8A,$8A,$89,$89,$88,$87   ;8894A6;
    db $87,$86,$86,$85,$85,$83,$83,$82,$81,$80,$80,$7F,$7E,$7D,$7C,$7B   ;8894B6;
    db $7B,$7A,$79,$78,$76,$76,$74,$73,$72,$71,$70,$6F,$6E,$6C,$6B,$6A   ;8894C6;
    db $68,$67,$66,$65,$63,$61,$60,$5E,$5C,$5B,$59,$57,$55,$53,$51,$4F   ;8894D6;
    db $4E,$4B,$48,$47,$43,$41,$3E,$3C,$38,$34,$32,$2D,$28,$22,$1F,$15   ;8894E6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8894F6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889506;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889516;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889526;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889536;
    db $9C,$9C,$9C,$9C,$9C,$9C,$9C,$9C,$9C,$9C,$9C,$9B,$9B,$9B,$9B,$9B   ;889546;
    db $9B,$9B,$9A,$9A,$9A,$99,$99,$99,$99,$99,$98,$98,$98,$97,$97,$97   ;889556;
    db $96,$96,$95,$95,$95,$95,$94,$93,$93,$92,$92,$91,$91,$90,$90,$8F   ;889566;
    db $8E,$8E,$8E,$8D,$8D,$8B,$8B,$8A,$89,$89,$88,$87,$86,$85,$85,$84   ;889576;
    db $83,$82,$81,$80,$80,$7E,$7D,$7D,$7B,$7A,$79,$78,$77,$76,$75,$73   ;889586;
    db $72,$71,$70,$6F,$6D,$6C,$6A,$6A,$67,$66,$64,$63,$60,$60,$5D,$5C   ;889596;
    db $5A,$57,$57,$54,$52,$50,$4D,$4C,$48,$46,$44,$41,$3C,$3A,$36,$34   ;8895A6;
    db $2F,$2A,$26,$20,$16,$0F,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8895B6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8895C6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8895D6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8895E6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8895F6;
    db $A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A3,$A3,$A3,$A3,$A3   ;889606;
    db $A3,$A3,$A3,$A2,$A2,$A2,$A1,$A1,$A1,$A1,$A1,$A1,$A0,$A0,$9F,$9F   ;889616;
    db $9F,$9E,$9E,$9D,$9D,$9D,$9D,$9C,$9B,$9B,$9A,$9A,$9A,$99,$98,$98   ;889626;
    db $97,$96,$96,$95,$95,$94,$94,$93,$92,$92,$91,$91,$8F,$8F,$8E,$8D   ;889636;
    db $8C,$8B,$8B,$8A,$89,$87,$87,$86,$86,$84,$84,$82,$82,$80,$7E,$7E   ;889646;
    db $7D,$7C,$7B,$79,$78,$77,$76,$75,$73,$72,$70,$6F,$6E,$6C,$6B,$69   ;889656;
    db $68,$65,$63,$62,$60,$5E,$5C,$5B,$58,$57,$54,$51,$4F,$4C,$4A,$48   ;889666;
    db $46,$42,$3F,$3B,$39,$34,$2F,$2C,$26,$22,$17,$10,$00,$00,$00,$00   ;889676;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889686;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889696;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8896A6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8896B6;
    db $AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AB,$AB,$AB,$AB   ;8896C6;
    db $AB,$AA,$AA,$AA,$AA,$AA,$AA,$A9,$A9,$A9,$A8,$A8,$A8,$A8,$A8,$A7   ;8896D6;
    db $A6,$A6,$A6,$A6,$A5,$A5,$A4,$A4,$A4,$A4,$A3,$A2,$A2,$A1,$A1,$A0   ;8896E6;
    db $A0,$A0,$9F,$9E,$9E,$9D,$9C,$9C,$9C,$9B,$9A,$99,$99,$98,$98,$96   ;8896F6;
    db $96,$95,$94,$93,$92,$91,$91,$8F,$8F,$8E,$8D,$8D,$8B,$8B,$89,$89   ;889706;
    db $87,$86,$85,$84,$83,$82,$81,$7F,$7E,$7D,$7C,$7A,$78,$78,$76,$75   ;889716;
    db $73,$72,$70,$6E,$6E,$6B,$6A,$68,$67,$64,$63,$60,$5F,$5D,$5B,$58   ;889726;
    db $56,$53,$52,$4E,$4D,$49,$47,$42,$40,$3C,$3A,$34,$32,$2E,$27,$23   ;889736;
    db $19,$11,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889746;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889756;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889766;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889776;
    db $B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B3,$B3,$B3   ;889786;
    db $B3,$B2,$B2,$B2,$B2,$B2,$B2,$B2,$B1,$B1,$B1,$B0,$B0,$B0,$B0,$B0   ;889796;
    db $AF,$AF,$AE,$AE,$AE,$AD,$AD,$AC,$AC,$AC,$AB,$AB,$AB,$AA,$A9,$A8   ;8897A6;
    db $A8,$A8,$A8,$A7,$A6,$A6,$A5,$A5,$A4,$A4,$A3,$A2,$A2,$A1,$A0,$9F   ;8897B6;
    db $9F,$9F,$9D,$9C,$9C,$9B,$9A,$99,$99,$98,$97,$95,$95,$95,$93,$93   ;8897C6;
    db $91,$90,$90,$8E,$8E,$8B,$8B,$89,$89,$88,$87,$85,$84,$83,$82,$80   ;8897D6;
    db $7F,$7D,$7D,$7B,$7A,$78,$76,$76,$73,$72,$70,$6F,$6D,$6A,$69,$67   ;8897E6;
    db $65,$64,$61,$5F,$5C,$5A,$59,$56,$54,$51,$4F,$4D,$48,$45,$41,$3E   ;8897F6;
    db $39,$37,$34,$2C,$29,$1F,$1A,$12,$00,$00,$00,$00,$00,$00,$00,$00   ;889806;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889816;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889826;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889836;
    db $BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BB,$BB,$BB   ;889846;
    db $BB,$BB,$BA,$BA,$BA,$BA,$BA,$BA,$BA,$B9,$B9,$B9,$B9,$B8,$B8,$B8   ;889856;
    db $B7,$B7,$B7,$B6,$B6,$B6,$B5,$B5,$B4,$B4,$B4,$B4,$B3,$B3,$B2,$B1   ;889866;
    db $B1,$B0,$B0,$AF,$AF,$AE,$AE,$AD,$AD,$AC,$AC,$AB,$AB,$AA,$A9,$A9   ;889876;
    db $A8,$A7,$A6,$A6,$A5,$A4,$A3,$A3,$A2,$A1,$A0,$A0,$9F,$9D,$9D,$9B   ;889886;
    db $9B,$9B,$99,$98,$98,$96,$95,$95,$92,$92,$91,$8F,$8F,$8E,$8D,$8B   ;889896;
    db $8A,$89,$88,$86,$85,$84,$82,$81,$80,$7E,$7C,$7C,$79,$78,$77,$74   ;8898A6;
    db $73,$70,$6F,$6E,$6B,$69,$68,$65,$63,$62,$5E,$5D,$5B,$57,$55,$52   ;8898B6;
    db $50,$4E,$49,$46,$44,$3F,$3B,$39,$32,$2E,$2B,$21,$1B,$13,$00,$00   ;8898C6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8898D6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8898E6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8898F6;
    db $C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C4,$C4   ;889906;
    db $C4,$C4,$C4,$C3,$C3,$C3,$C3,$C2,$C2,$C2,$C2,$C2,$C2,$C2,$C1,$C1   ;889916;
    db $C1,$C0,$C0,$BF,$BF,$BF,$BF,$BF,$BE,$BD,$BD,$BC,$BC,$BC,$BB,$BB   ;889926;
    db $BB,$BA,$BA,$B9,$B8,$B8,$B8,$B7,$B7,$B6,$B5,$B4,$B4,$B4,$B3,$B3   ;889936;
    db $B2,$B1,$B1,$B0,$AF,$AE,$AE,$AE,$AC,$AB,$AA,$AA,$A9,$A8,$A7,$A7   ;889946;
    db $A6,$A5,$A3,$A3,$A3,$A2,$A0,$A0,$9F,$9D,$9D,$9C,$9B,$99,$98,$97   ;889956;
    db $96,$95,$94,$93,$91,$90,$8F,$8E,$8C,$8B,$89,$88,$87,$86,$84,$82   ;889966;
    db $81,$7E,$7E,$7D,$7A,$79,$77,$76,$73,$71,$70,$6D,$6B,$6A,$68,$65   ;889976;
    db $63,$62,$5E,$5C,$59,$58,$54,$51,$4F,$4A,$47,$44,$3E,$3C,$39,$35   ;889986;
    db $2D,$28,$22,$14,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889996;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8899A6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8899B6;
    db $CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CC,$CC   ;8899C6;
    db $CC,$CC,$CC,$CC,$CB,$CB,$CB,$CB,$CA,$CA,$CA,$C9,$C9,$C9,$C9,$C9   ;8899D6;
    db $C9,$C9,$C8,$C8,$C8,$C7,$C6,$C6,$C6,$C6,$C5,$C5,$C5,$C4,$C4,$C4   ;8899E6;
    db $C3,$C3,$C2,$C1,$C1,$C1,$C0,$C0,$BF,$BF,$BE,$BD,$BD,$BD,$BC,$BB   ;8899F6;
    db $BA,$BA,$B9,$B9,$B9,$B8,$B7,$B6,$B5,$B5,$B5,$B3,$B2,$B1,$B1,$B0   ;889A06;
    db $AF,$AE,$AE,$AD,$AC,$AB,$AA,$A9,$A8,$A8,$A7,$A5,$A4,$A4,$A3,$A1   ;889A16;
    db $A0,$9F,$9E,$9C,$9C,$9B,$9A,$99,$97,$96,$95,$94,$92,$91,$90,$8F   ;889A26;
    db $8C,$8C,$8B,$89,$87,$86,$83,$83,$7F,$7F,$7E,$7C,$79,$77,$76,$75   ;889A36;
    db $72,$6F,$6F,$6C,$69,$67,$66,$63,$5F,$5D,$5C,$5A,$57,$52,$4F,$4D   ;889A46;
    db $4A,$45,$41,$3E,$3B,$32,$2F,$2A,$24,$14,$00,$00,$00,$00,$00,$00   ;889A56;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889A66;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889A76;
    db $D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D5   ;889A86;
    db $D5,$D5,$D5,$D5,$D5,$D4,$D4,$D4,$D4,$D3,$D3,$D3,$D2,$D2,$D2,$D2   ;889A96;
    db $D1,$D1,$D1,$D1,$D1,$D1,$D0,$D0,$CF,$CF,$CF,$CE,$CE,$CD,$CD,$CC   ;889AA6;
    db $CC,$CC,$CC,$CC,$CB,$CA,$CA,$C9,$C8,$C8,$C7,$C7,$C7,$C7,$C6,$C5   ;889AB6;
    db $C4,$C4,$C3,$C2,$C2,$C2,$C1,$C1,$C0,$BF,$BE,$BD,$BC,$BC,$BC,$BA   ;889AC6;
    db $B9,$B9,$B8,$B7,$B6,$B6,$B5,$B4,$B3,$B2,$B1,$B1,$B0,$AF,$AE,$AD   ;889AD6;
    db $AC,$AB,$AA,$A9,$A7,$A6,$A5,$A4,$A3,$A2,$A1,$A0,$9E,$9D,$9D,$9B   ;889AE6;
    db $9A,$98,$98,$96,$94,$92,$92,$91,$8F,$8D,$8C,$89,$88,$88,$84,$83   ;889AF6;
    db $82,$80,$7E,$7D,$7A,$78,$77,$74,$73,$70,$6E,$6B,$6A,$68,$63,$61   ;889B06;
    db $60,$5E,$5B,$56,$53,$50,$4E,$4A,$48,$41,$3E,$39,$34,$31,$25,$1F   ;889B16;
    db $15,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889B26;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889B36;
    db $DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DE   ;889B46;
    db $DE,$DE,$DE,$DE,$DE,$DE,$DD,$DD,$DD,$DD,$DC,$DC,$DC,$DB,$DB,$DB   ;889B56;
    db $DB,$DB,$DA,$DA,$DA,$D9,$D9,$D9,$D9,$D9,$D8,$D8,$D8,$D7,$D7,$D6   ;889B66;
    db $D6,$D5,$D5,$D5,$D4,$D4,$D3,$D3,$D2,$D2,$D1,$D1,$D1,$D0,$D0,$CF   ;889B76;
    db $CE,$CD,$CD,$CC,$CC,$CB,$CB,$CB,$CA,$C9,$C9,$C8,$C7,$C6,$C5,$C4   ;889B86;
    db $C4,$C4,$C3,$C2,$C1,$C0,$BF,$BE,$BD,$BD,$BD,$BC,$BA,$B9,$B8,$B8   ;889B96;
    db $B7,$B6,$B6,$B4,$B3,$B2,$B1,$B0,$AF,$AE,$AC,$AB,$AA,$A9,$A8,$A8   ;889BA6;
    db $A7,$A4,$A3,$A2,$A1,$A1,$9F,$9E,$9B,$9A,$99,$98,$97,$95,$93,$92   ;889BB6;
    db $8F,$8E,$8D,$8B,$8A,$89,$85,$84,$82,$80,$7F,$7D,$7C,$78,$76,$75   ;889BC6;
    db $72,$70,$6F,$6C,$68,$65,$64,$62,$5F,$5C,$5A,$54,$51,$4D,$4B,$46   ;889BD6;
    db $44,$40,$37,$33,$2E,$27,$20,$16,$00,$00,$00,$00,$00,$00,$00,$00   ;889BE6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889BF6;
    db $E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8   ;889C06;
    db $E7,$E7,$E7,$E7,$E7,$E7,$E6,$E6,$E6,$E6,$E6,$E5,$E5,$E5,$E5,$E4   ;889C16;
    db $E4,$E4,$E4,$E3,$E3,$E3,$E3,$E2,$E2,$E1,$E1,$E0,$E0,$E0,$E0,$DF   ;889C26;
    db $DF,$DE,$DE,$DE,$DE,$DE,$DD,$DD,$DC,$DC,$DB,$DB,$DA,$D9,$D9,$D8   ;889C36;
    db $D8,$D7,$D7,$D6,$D5,$D5,$D4,$D4,$D3,$D3,$D3,$D2,$D1,$D1,$D0,$CF   ;889C46;
    db $CE,$CE,$CC,$CC,$CB,$CA,$CA,$C9,$C9,$C8,$C7,$C6,$C5,$C4,$C3,$C2   ;889C56;
    db $C1,$C0,$C0,$C0,$BF,$BE,$BC,$BB,$BA,$B9,$B8,$B7,$B6,$B5,$B4,$B3   ;889C66;
    db $B1,$B0,$AF,$AE,$AD,$AC,$AB,$AA,$A9,$A8,$A5,$A4,$A2,$A2,$A1,$9F   ;889C76;
    db $9E,$9D,$9B,$99,$97,$95,$94,$93,$90,$8F,$8E,$8D,$8B,$89,$85,$84   ;889C86;
    db $82,$81,$7E,$7D,$7A,$79,$77,$74,$70,$6F,$6C,$69,$68,$65,$63,$60   ;889C96;
    db $5D,$5A,$57,$51,$4E,$49,$46,$43,$3E,$39,$35,$30,$28,$17,$00,$00   ;889CA6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889CB6;
    db $F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2   ;889CC6;
    db $F2,$F1,$F1,$F1,$F1,$F1,$F1,$F0,$F0,$F0,$F0,$F0,$EF,$EF,$EF,$EF   ;889CD6;
    db $EE,$EE,$EE,$EE,$EE,$ED,$ED,$ED,$EC,$EC,$EC,$EB,$EB,$EA,$EA,$EA   ;889CE6;
    db $EA,$E9,$E9,$E8,$E8,$E7,$E7,$E7,$E7,$E6,$E5,$E5,$E4,$E4,$E3,$E2   ;889CF6;
    db $E2,$E2,$E1,$E1,$E0,$E0,$E0,$DF,$DF,$DE,$DE,$DC,$DC,$DC,$DB,$DA   ;889D06;
    db $DA,$D9,$D8,$D7,$D7,$D6,$D5,$D5,$D4,$D3,$D2,$D1,$D1,$D0,$CE,$CD   ;889D16;
    db $CD,$CD,$CC,$CB,$CA,$C9,$C8,$C8,$C7,$C6,$C5,$C4,$C3,$C2,$C1,$C0   ;889D26;
    db $BF,$BC,$BB,$BA,$BA,$B9,$B8,$B7,$B6,$B5,$B3,$B2,$B1,$B0,$AF,$AE   ;889D36;
    db $AC,$AB,$A9,$A8,$A6,$A5,$A4,$A2,$A0,$9F,$9E,$9B,$9A,$99,$96,$95   ;889D46;
    db $95,$93,$91,$8F,$8D,$8B,$87,$86,$83,$82,$80,$7F,$7C,$79,$78,$75   ;889D56;
    db $73,$70,$6E,$6D,$6A,$67,$64,$61,$5D,$58,$54,$51,$4C,$4A,$46,$41   ;889D66;
    db $3B,$38,$32,$2A,$23,$18,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889D76;
    db $FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB   ;889D86;
    db $FB,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$F9,$F9,$F9,$F9,$F9,$F8,$F8,$F8   ;889D96;
    db $F8,$F7,$F7,$F7,$F7,$F7,$F6,$F6,$F6,$F6,$F5,$F5,$F5,$F4,$F4,$F3   ;889DA6;
    db $F3,$F3,$F3,$F2,$F2,$F1,$F1,$F0,$F0,$F0,$F0,$EF,$EF,$EE,$EE,$ED   ;889DB6;
    db $EC,$EB,$EB,$EB,$EA,$EA,$E9,$E9,$E8,$E7,$E7,$E6,$E6,$E5,$E4,$E4   ;889DC6;
    db $E4,$E3,$E2,$E2,$E1,$E0,$DF,$DF,$DE,$DD,$DD,$DC,$DB,$DA,$D9,$D9   ;889DD6;
    db $D8,$D7,$D6,$D5,$D5,$D4,$D3,$D2,$D1,$D0,$CF,$CF,$CE,$CD,$CC,$CB   ;889DE6;
    db $CA,$C9,$C8,$C7,$C6,$C5,$C3,$C2,$C1,$C0,$BF,$BE,$BD,$BD,$BC,$B9   ;889DF6;
    db $B8,$B7,$B6,$B5,$B3,$B2,$B0,$AF,$AE,$AC,$AB,$AA,$A8,$A6,$A5,$A4   ;889E06;
    db $A1,$A0,$9F,$9C,$9B,$9A,$98,$96,$94,$92,$90,$8F,$8C,$8B,$88,$87   ;889E16;
    db $84,$83,$80,$7E,$7D,$7A,$78,$75,$72,$71,$6E,$6B,$68,$65,$61,$5E   ;889E26;
    db $5B,$57,$54,$4F,$4C,$48,$43,$3E,$3A,$34,$2C,$24,$19,$00,$00,$00   ;889E36;
    db $FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE   ;889E46;
    db $FE,$FD,$FD,$FD,$FD,$FD,$FD,$FD,$FC,$FC,$FC,$FC,$FC,$FB,$FB,$FB   ;889E56;
    db $FB,$FA,$FA,$FA,$FA,$FA,$F9,$F9,$F9,$F9,$F8,$F8,$F8,$F7,$F7,$F6   ;889E66;
    db $F6,$F6,$F6,$F5,$F5,$F4,$F4,$F3,$F3,$F3,$F3,$F2,$F2,$F1,$F1,$F0   ;889E76;
    db $F0,$EF,$EE,$EE,$EE,$ED,$ED,$EC,$EC,$EB,$EA,$EA,$E9,$E9,$E8,$E7   ;889E86;
    db $E7,$E7,$E6,$E5,$E5,$E4,$E3,$E2,$E2,$E1,$E0,$E0,$DF,$DE,$DD,$DC   ;889E96;
    db $DC,$DB,$DA,$D9,$D8,$D8,$D7,$D6,$D5,$D4,$D3,$D2,$D2,$D1,$D0,$CF   ;889EA6;
    db $CE,$CD,$CC,$CB,$CA,$C9,$C8,$C6,$C5,$C4,$C3,$C2,$C1,$C0,$BF,$BE   ;889EB6;
    db $BC,$BB,$BA,$B9,$B8,$B7,$B5,$B4,$B2,$B1,$B0,$AE,$AD,$AC,$AA,$A8   ;889EC6;
    db $A7,$A6,$A3,$A2,$A1,$9E,$9D,$9C,$9A,$98,$96,$94,$92,$91,$8E,$8D   ;889ED6;
    db $8A,$89,$86,$85,$82,$7F,$7E,$7B,$79,$76,$73,$72,$6F,$6C,$69,$66   ;889EE6;
    db $62,$5F,$5C,$58,$55,$50,$4D,$49,$44,$3E,$3A,$34,$2C,$24,$19,$00   ;889EF6;


;;; $9F06: Power bomb pre-explosion shape definition tables - pre-scaled ;;;
PowerBomb_PreExplosion_ShapeDefinitionTables_PreScaled:
; Defines the shape of (the bottom) half of a power bomb explosion
; Each byte defines the width of the power bomb explosion for that pixel-row, C0h pixel-rows total
; One line per frame of explosion
    db $91,$91,$91,$91,$91,$91,$91,$91,$91,$91,$90,$90,$90,$90,$90,$90   ;889F06;
    db $90,$8F,$8F,$8F,$8F,$8F,$8E,$8E,$8E,$8E,$8D,$8C,$8C,$8C,$8C,$8B   ;889F16;
    db $8B,$8B,$8A,$8A,$89,$89,$88,$88,$87,$87,$86,$86,$85,$84,$84,$83   ;889F26;
    db $83,$82,$81,$80,$80,$7F,$7E,$7E,$7C,$7C,$7B,$7A,$79,$78,$78,$77   ;889F36;
    db $76,$75,$74,$73,$71,$70,$6F,$6E,$6D,$6C,$6B,$6A,$68,$67,$66,$64   ;889F46;
    db $63,$61,$60,$5F,$5C,$5A,$5A,$58,$56,$53,$53,$50,$4E,$4C,$4A,$48   ;889F56;
    db $45,$42,$41,$3E,$3A,$36,$35,$31,$2C,$27,$23,$1E,$15,$00,$00,$00   ;889F66;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889F76;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889F86;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889F96;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889FA6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889FB6;
    db $C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$BF,$BF,$BF   ;889FC6;
    db $BF,$BF,$BF,$BE,$BE,$BE,$BD,$BD,$BD,$BD,$BD,$BD,$BD,$BC,$BC,$BC   ;889FD6;
    db $BB,$BB,$BA,$BA,$BA,$BA,$BA,$B9,$B8,$B8,$B7,$B7,$B7,$B7,$B6,$B6   ;889FE6;
    db $B5,$B5,$B4,$B4,$B4,$B3,$B2,$B2,$B1,$B1,$B0,$AF,$AE,$AE,$AE,$AD   ;889FF6;
    db $AD,$AB,$AB,$AB,$A9,$A9,$A8,$A7,$A6,$A6,$A5,$A4,$A3,$A2,$A2,$A1   ;88A006;
    db $9F,$9F,$9F,$9D,$9C,$9C,$9A,$99,$99,$97,$96,$95,$93,$93,$92,$90   ;88A016;
    db $8F,$8E,$8D,$8C,$8B,$8A,$88,$86,$86,$83,$83,$82,$7F,$7E,$7D,$7A   ;88A026;
    db $7A,$77,$76,$74,$73,$70,$6E,$6E,$6B,$68,$68,$65,$62,$60,$5D,$5B   ;88A036;
    db $59,$56,$54,$52,$4D,$4A,$48,$43,$40,$3D,$37,$34,$2F,$27,$21,$1B   ;88A046;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;88A056;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;88A066;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;88A076;
    db $EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE   ;88A086;
    db $ED,$ED,$ED,$ED,$ED,$ED,$ED,$EC,$EC,$EC,$EC,$EC,$EB,$EB,$EB,$EA   ;88A096;
    db $EA,$EA,$EA,$EA,$E9,$E9,$E9,$E9,$E8,$E8,$E8,$E7,$E6,$E6,$E6,$E6   ;88A0A6;
    db $E5,$E5,$E4,$E4,$E3,$E3,$E3,$E3,$E2,$E1,$E1,$E0,$E0,$E0,$DF,$DF   ;88A0B6;
    db $DF,$DE,$DE,$DD,$DD,$DC,$DB,$DA,$DA,$D9,$D8,$D8,$D8,$D7,$D6,$D6   ;88A0C6;
    db $D5,$D4,$D3,$D3,$D2,$D2,$D1,$D0,$CF,$CE,$CE,$CD,$CC,$CB,$CA,$CA   ;88A0D6;
    db $C9,$C8,$C7,$C5,$C4,$C4,$C4,$C3,$C2,$C1,$C0,$BF,$BE,$BD,$BC,$BB   ;88A0E6;
    db $B9,$B7,$B6,$B6,$B5,$B4,$B3,$B2,$B0,$AF,$AE,$AD,$AC,$AB,$A9,$A7   ;88A0F6;
    db $A6,$A5,$A3,$A2,$A1,$9F,$9D,$9C,$9B,$99,$98,$97,$94,$92,$90,$8E   ;88A106;
    db $8C,$8B,$89,$88,$85,$84,$81,$80,$7E,$7D,$7A,$76,$73,$71,$6F,$6C   ;88A116;
    db $6B,$68,$65,$62,$60,$5C,$59,$56,$53,$4B,$48,$45,$40,$3A,$37,$31   ;88A126;
    db $2A,$22,$18,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;88A136;
    db $FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE   ;88A146;
    db $FE,$FD,$FD,$FD,$FD,$FD,$FD,$FD,$FC,$FC,$FC,$FC,$FC,$FB,$FB,$FB   ;88A156;
    db $FB,$FA,$FA,$FA,$FA,$FA,$F9,$F9,$F9,$F9,$F8,$F8,$F8,$F7,$F7,$F6   ;88A166;
    db $F6,$F6,$F6,$F5,$F5,$F4,$F4,$F3,$F3,$F3,$F3,$F2,$F2,$F1,$F1,$F0   ;88A176;
    db $F0,$EF,$EE,$EE,$EE,$ED,$ED,$EC,$EC,$EB,$EA,$EA,$E9,$E9,$E8,$E7   ;88A186;
    db $E7,$E7,$E6,$E5,$E5,$E4,$E3,$E2,$E2,$E1,$E0,$E0,$DF,$DE,$DD,$DC   ;88A196;
    db $DC,$DB,$DA,$D9,$D8,$D8,$D7,$D6,$D5,$D4,$D3,$D2,$D2,$D1,$D0,$CF   ;88A1A6;
    db $CE,$CD,$CC,$CB,$CA,$C9,$C8,$C6,$C5,$C4,$C3,$C2,$C1,$C0,$BF,$BE   ;88A1B6;
    db $BC,$BB,$BA,$B9,$B8,$B7,$B5,$B4,$B2,$B1,$B0,$AE,$AD,$AC,$AA,$A8   ;88A1C6;
    db $A7,$A6,$A3,$A2,$A1,$9E,$9D,$9C,$9A,$98,$96,$94,$92,$91,$8E,$8D   ;88A1D6;
    db $8A,$89,$86,$85,$82,$7F,$7E,$7B,$79,$76,$73,$72,$6F,$6C,$69,$66   ;88A1E6;
    db $62,$5F,$5C,$58,$55,$50,$4D,$49,$44,$3E,$3A,$34,$2C,$24,$19,$00   ;88A1F6;


;;; $A206: Free space ;;;
PowerBomb_ShapeDefinitionTiles_Optimization_A206:
; PJ believes this padding exists purely because of the "optimisation" done in the
; "calculate power bomb explosion HDMA data tables - stage 1/3" routines ($8CC6/$8D04/$8D46)
; where Y starts at 60h so that it can be checked against 80h via inspecting the negative flag.
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;88A206;
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;88A216;

PowerBomb_ShapeDefinitionTiles_Optimization_A226:
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;88A226;
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;88A236;
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;88A246;
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;88A256;


;;; $A266: Power bomb explosion shape definition table - unscaled ;;;
PowerBombExplosion_ShapeDefinitionTable_Unscaled_width:
; This table gives the shape of (the bottom) half of a power bomb explosion with X radius = 100h (Y radius C0h),
; starting from the bottom and ending at the center
; Width
    db $00,$0C,$19,$25,$31,$3E,$4A,$56,$61,$6D,$78,$83,$8E,$98,$A2,$AB   ;88A266;
    db $B5,$BD,$C5,$CD,$D4,$DB,$E1,$E7,$EC,$F1,$F4,$F8,$FB,$FD,$FE,$FF   ;88A276;

PowerBombExplosion_ShapeDefinitionTable_Unscaled_topOffset:
; Top offset (previous entry used as bottom offset)
    db $BF,$BF,$BE,$BD,$BA,$B8,$B6,$B2,$AF,$AB,$A6,$A2,$9C,$96,$90,$8A   ;88A286;
    db $84,$7D,$75,$6E,$66,$5E,$56,$4D,$45,$3C,$33,$2A,$20,$17,$0D,$04   ;88A296;


;;; $A2A6: Spawn crystal flash HDMA objects ;;;
Spawn_CrystalFlash_HDMAObjects:
; These HDMAs aren't really needed
    LDA.W #$8000                                                         ;88A2A6;
    STA.W PowerBombExplosionStatus                                       ;88A2A9;
    JSL.L Spawn_HDMAObject                                               ;88A2AC;
    db $40,$28                                                           ;88A2B0;
    dw InstList_CrystalFlash_Window2_LeftPosition                        ;88A2B2;
    JSL.L Spawn_HDMAObject                                               ;88A2B4;
    db $40,$29                                                           ;88A2B8;
    dw InstList_CrystalFlash_Window2_RightPosition                       ;88A2BA;
    RTL                                                                  ;88A2BC;


;;; $A2BD: Instruction list - crystal flash window 2 left position ;;;
InstList_CrystalFlash_Window2_LeftPosition:
    dw Instruction_HDMAObject_HDMATableBank : db $89                     ;88A2BD;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88A2C0;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;88A2C3;
    dl CrystalFlash_Setup_1                                              ;88A2C5;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;88A2C8;
    dl CrystalFlash_Setup_2                                              ;88A2CA;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88A2CD;
    dl PreInstruction_CrystalFlash_1_Explosion                           ;88A2CF;
    dw Instruction_HDMAObject_Sleep                                      ;88A2D2;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88A2D4;
    dl PreInstruction_CrystalFlash_2_AfterGlow                           ;88A2D6;
    dw Instruction_HDMAObject_Sleep                                      ;88A2D9;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;88A2DB;
    dl CrystalFlash_Cleanup                                              ;88A2DD;
    dw Instruction_HDMAObject_Sleep                                      ;88A2E0;
    dw Instruction_HDMAObject_Delete                                     ;88A2E2;


;;; $A2E4: Crystal flash - setup (1/2) ;;;
CrystalFlash_Setup_1:
    SEP #$20                                                             ;88A2E4;
    LDA.B #$FF                                                           ;88A2E6;
    STA.L OffScreenPowerBombExplosionWindow2LeftHDMADataTable            ;88A2E8;
    LDA.B #$00                                                           ;88A2EC;
    STA.L OffScreenPowerBombExplosionWindow2RightHDMADataTable           ;88A2EE;
    REP #$20                                                             ;88A2F2;
    LDA.W #$0400                                                         ;88A2F4;
    STA.W SamusProjectile_PowerBombPreExplosionFlashRadius               ;88A2F7;
    LDA.L PowerBomb_PreExplosion_InitialRadiusSpeed                      ;88A2FA;
    STA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed               ;88A2FE;
    LDA.W #$0001                                                         ;88A301;
    JSL.L QueueSound_Lib1_Max6                                           ;88A304;
    RTL                                                                  ;88A308;


;;; $A309: Crystal flash - setup (2/2) ;;;
CrystalFlash_Setup_2:
    LDA.W #$0400                                                         ;88A309;
    STA.W SamusProjectile_PowerBombExplosionRadius                       ;88A30C;
    LDA.L PowerBombExplosion_InitialRadiusSpeed                          ;88A30F;
    STA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed               ;88A313;
    RTL                                                                  ;88A316;


;;; $A317: Crystal flash - clean up ;;;
CrystalFlash_Cleanup:
;; Parameters:
;;     X: HDMA object index
    STZ.W SamusProjectile_PowerBombFlag                                  ;88A317;
    STZ.W PowerBombExplosionStatus                                       ;88A31A;
    STZ.W HDMAObject_ChannelBitflags,X                                   ;88A31D;
    STZ.W HDMAObject_ChannelBitflags+2,X                                 ;88A320;
    STZ.W SamusProjectile_PowerBombPreExplosionFlashRadius               ;88A323;
    STZ.W SamusProjectile_PowerBombExplosionRadius                       ;88A326;
    RTL                                                                  ;88A329;


;;; $A32A: Instruction list - crystal flash window 2 right position ;;;
InstList_CrystalFlash_Window2_RightPosition:
    dw Instruction_HDMAObject_HDMATableBank : db $89                     ;88A32A;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88A32D;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88A330;
    dl PreInstruction_CrystalFlash_CustomLayerBlendingWindow2Config      ;88A332;
    dw Instruction_HDMAObject_Sleep                                      ;88A335;
    dw Instruction_HDMAObject_Delete                                     ;88A337;


;;; $A339: Pre-instruction - crystal flash - custom layer blending window 2 configuration ;;;
PreInstruction_CrystalFlash_CustomLayerBlendingWindow2Config:
; Setting these variables doesn't achieve anything, as the layer blending is handled entirely by a subsystem using LayerBlending_Config/87
    SEP #$20                                                             ;88A339;
    STZ.W DP_WindowMaskBG12                                              ;88A33B;
    LDA.B #$08                                                           ;88A33E;
    STA.W DP_WindowMaskBG34                                              ;88A340;
    LDA.B #$80                                                           ;88A343;
    STA.W DP_WindowMaskSprite                                            ;88A345;
    LDA.B #$02                                                           ;88A348;
    STA.W DP_NextGameplayColorMathA                                      ;88A34A;
    LDA.B #$33                                                           ;88A34D;
    STA.W DP_NextGameplayColorMathB                                      ;88A34F;
    STZ.W DP_WindowAreaMainScreen                                        ;88A352;
    LDA.B #$04                                                           ;88A355;
    STA.W DP_WindowAreaSubScreen                                         ;88A357;
    REP #$20                                                             ;88A35A;
    RTL                                                                  ;88A35C;


;;; $A35D: Pre-instruction - crystal flash - stage 2 - after-glow ;;;
PreInstruction_CrystalFlash_2_AfterGlow:
;; Parameters:
;;     X: HDMA object index

; The same as power bomb explosion stage 5 ($8B98) except for using colour components as a wake criterion ($A36A..76) instead of HDMAObject_Var3
; This is actually a bug, as the colour components are always non-zero in rooms that use a backdrop colour (FX 28h/2Ah), meaning this object never dies
; If you lay a power bomb afterwards, this does override the backdrop colour to zero and causes this object to clean itself up,
; but that screws up the power bomb due to the global power bomb state (see $A317)
    LDA.W PowerBombExplosionStatus                                       ;88A35D;
    BMI .exploding                                                       ;88A360;
    RTL                                                                  ;88A362;

  .exploding:
    DEC.W HDMAObject_Timers,X                                            ;88A363;
    BPL .return                                                          ;88A366;
    SEP #$20                                                             ;88A368;
    LDA.W DP_ColorMathSubScreenBackdropColor0                            ;88A36A;
    ORA.W DP_ColorMathSubScreenBackdropColor1                            ;88A36D;
    ORA.W DP_ColorMathSubScreenBackdropColor2                            ;88A370;
    AND.B #$1F                                                           ;88A373;
    BEQ .wake                                                            ;88A375;
    LDA.W DP_ColorMathSubScreenBackdropColor0                            ;88A377;
    AND.B #$1F                                                           ;88A37A;
    BEQ .green                                                           ;88A37C;
    DEC                                                                  ;88A37E;
    ORA.B #$20                                                           ;88A37F;
    STA.W DP_ColorMathSubScreenBackdropColor0                            ;88A381;

  .green:
    LDA.W DP_ColorMathSubScreenBackdropColor1                            ;88A384;
    AND.B #$1F                                                           ;88A387;
    BEQ .blue                                                            ;88A389;
    DEC                                                                  ;88A38B;
    ORA.B #$40                                                           ;88A38C;
    STA.W DP_ColorMathSubScreenBackdropColor1                            ;88A38E;

  .blue:
    LDA.W DP_ColorMathSubScreenBackdropColor2                            ;88A391;
    AND.B #$1F                                                           ;88A394;
    BEQ .setTimer                                                        ;88A396;
    DEC                                                                  ;88A398;
    ORA.B #$80                                                           ;88A399;
    STA.W DP_ColorMathSubScreenBackdropColor2                            ;88A39B;

  .setTimer:
    LDA.L PowerBomb_Stage5_HDMAObjectTimer                               ;88A39E;
    STA.W HDMAObject_Timers,X                                            ;88A3A2;
    REP #$20                                                             ;88A3A5;

  .return:
    RTL                                                                  ;88A3A7;

  .wake:
    REP #$20                                                             ;88A3A8;
    LDA.W #$0001                                                         ;88A3AA;
    STA.W HDMAObject_InstructionTimers,X                                 ;88A3AD;
    INC.W HDMAObject_InstListPointers,X                                  ;88A3B0;
    INC.W HDMAObject_InstListPointers,X                                  ;88A3B3;
    RTL                                                                  ;88A3B6;


if !FEATURE_KEEP_UNREFERENCED
;;; $A3B7: Unused. Calculate crystal flash HDMA data tables - pre-scaled - power bomb is left of screen ;;;
UNUSED_CalcCrystalFlashHDMADataTables_PreScaled_Left_88A3B7:
; Clone of Calc_PowerBombExplo_HDMADataTables_PreScaled_LeftOfScreen
    LDA.W SamusProjectile_PowerBombPositionOnScreen                      ;88A3B7;
    CLC                                                                  ;88A3BA;
    ADC.W $0000,Y                                                        ;88A3BB;
    BCS +                                                                ;88A3BE;
    LDA.B #$00                                                           ;88A3C0;
    STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;88A3C2;
    INC                                                                  ;88A3C6;
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;88A3C7;
    BRA .loop                                                            ;88A3CB;

+   STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;88A3CD;
    LDA.B #$00                                                           ;88A3D1;
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;88A3D3;

  .loop:
    INY                                                                  ;88A3D7;
    INX                                                                  ;88A3D8;
    CPX.W #$00C0                                                         ;88A3D9;
    BNE UNUSED_CalcCrystalFlashHDMADataTables_PreScaled_Left_88A3B7      ;88A3DC;
    RTS                                                                  ;88A3DE;


;;; $A3DF: Unused. Calculate crystal flash HDMA data tables - pre-scaled - power bomb is on screen ;;;
UNUSED_Calc_CF_HDMADataTables_PreScaled_OnScreen_88A3DF:
; Clone of Calculate_PowerBombExplo_HDMADataTables_PreScaled_OnScreen
    LDA.W $0000,Y                                                        ;88A3DF;
    BEQ .return                                                          ;88A3E2;
    CLC                                                                  ;88A3E4;
    ADC.W SamusProjectile_PowerBombPositionOnScreen                      ;88A3E5;
    BCC +                                                                ;88A3E8;
    LDA.B #$FF                                                           ;88A3EA;

+   STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;88A3EC;
    LDA.W SamusProjectile_PowerBombPositionOnScreen                      ;88A3F0;
    SEC                                                                  ;88A3F3;
    SBC.W $0000,Y                                                        ;88A3F4;
    BCS +                                                                ;88A3F7;
    LDA.B #$00                                                           ;88A3F9;

+   STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;88A3FB;
    INY                                                                  ;88A3FF;
    INX                                                                  ;88A400;
    CPX.W #$00C0                                                         ;88A401;
    BNE UNUSED_Calc_CF_HDMADataTables_PreScaled_OnScreen_88A3DF          ;88A404;

  .return:
    RTS                                                                  ;88A406;


;;; $A407: Unused. Calculate crystal flash HDMA data tables - pre-scaled - power bomb is right of screen ;;;
UNUSED_Calc_CF_HDMADataTables_PreScaled_RightOfScreen_88A407:
; Clone of Calc_PowerBombExplo_HDMADataTables_PreScaled_RightOfScreen
    LDA.W SamusProjectile_PowerBombPositionOnScreen                      ;88A407;
    SEC                                                                  ;88A40A;
    SBC.W $0000,Y                                                        ;88A40B;
    BCC +                                                                ;88A40E;
    LDA.B #$FF                                                           ;88A410;
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;88A412;
    DEC                                                                  ;88A416;
    STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;88A417;
    BRA .next                                                            ;88A41B;

+   STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;88A41D;
    LDA.B #$FF                                                           ;88A421;
    STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;88A423;

  .next:
    INY                                                                  ;88A427;
    INX                                                                  ;88A428;
    CPX.W #$00C0                                                         ;88A429;
    BNE UNUSED_Calc_CF_HDMADataTables_PreScaled_RightOfScreen_88A407     ;88A42C;
    RTS                                                                  ;88A42E;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A42F: Calculate crystal flash HDMA object table pointers ;;;
Calculate_CrystalFlash_HDMAObjectTablePointers:
; Clone of Calculate_PowerBombExplosion_HDMADataTablePointers
    LDA.W PowerBombExplosionStatus                                       ;88A42F;
    BMI .exploding                                                       ;88A432;
    RTL                                                                  ;88A434;

  .exploding:
    LDA.W SamusProjectile_PowerBombExplosionXPosition                    ;88A435;
    SEC                                                                  ;88A438;
    SBC.W Layer1XPosition                                                ;88A439;
    CLC                                                                  ;88A43C;
    ADC.W #$0100                                                         ;88A43D;
    CMP.W #$0300                                                         ;88A440;
    BCC +                                                                ;88A443;
    BRA .offScreen                                                       ;88A445;

+   STA.W SamusProjectile_PowerBombPositionOnScreen                      ;88A447;
    LDA.W SamusProjectile_PowerBombExplosionYPosition                    ;88A44A;
    SEC                                                                  ;88A44D;
    SBC.W Layer1YPosition                                                ;88A44E;
    CLC                                                                  ;88A451;
    ADC.W #$0100                                                         ;88A452;
    CMP.W #$0300                                                         ;88A455;
    BCC .onScreen                                                        ;88A458;

  .offScreen:
    LDA.W #$0000                                                         ;88A45A;

  .onScreen:
    EOR.W #$03FF                                                         ;88A45D;
    SEC                                                                  ;88A460;
    SBC.W #$0100                                                         ;88A461;
    STA.W SamusProjectile_PowerBombExplosionHDMATableIndex               ;88A464;
    LDA.W SamusProjectile_PowerBombExplosionRadius                       ;88A467;
    AND.W #$FF00                                                         ;88A46A;
    BNE +                                                                ;88A46D;
    STZ.W SamusProjectile_PowerBombExplosionHDMATableIndex               ;88A46F;

+   LDA.W HDMAObject_ChannelIndicesBanks,X                               ;88A472;
    AND.W #$00FF                                                         ;88A475;
    TAY                                                                  ;88A478;
    LDA.W SamusProjectile_PowerBombExplosionHDMATableIndex               ;88A479;
    ASL                                                                  ;88A47C;
    CLC                                                                  ;88A47D;
    ADC.W SamusProjectile_PowerBombExplosionHDMATableIndex               ;88A47E;
    STA.B DP_Temp16                                                      ;88A481;
    ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Left_200below     ;88A483;
    STA.W HDMAObject_TablePointers,X                                     ;88A486;
    LDA.B DP_Temp16                                                      ;88A489;
    CLC                                                                  ;88A48B;
    ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Right_200below    ;88A48C;
    STA.W HDMAObject_TablePointers+2,X                                   ;88A48F;
    RTL                                                                  ;88A492;


;;; $A493: Calculate crystal flash HDMA data tables - scaled - power bomb is left of screen ;;;
Calculate_CrystalFlash_HDMADataTables_Scaled_LeftOfScreen:
; Clone of Calculate_PowerBombExplo_HDMADataTables_Scaled_LeftOfScreen
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y             ;88A493;
    STA.W $4203                                                          ;88A496;
    NOP                                                                  ;88A499;
    NOP                                                                  ;88A49A;
    NOP                                                                  ;88A49B;
    LDA.W $4217                                                          ;88A49C;
    STA.B DP_Temp14                                                      ;88A49F;
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y             ;88A4A1;
    STA.W $4203                                                          ;88A4A4;
    NOP                                                                  ;88A4A7;
    LDA.W SamusProjectile_PowerBombPositionOnScreen                      ;88A4A8;
    CLC                                                                  ;88A4AB;
    ADC.W $4217                                                          ;88A4AC;
    BCS .lowByteZero                                                     ;88A4AF;
    LDA.B #$00                                                           ;88A4B1;
    XBA                                                                  ;88A4B3;
    LDA.B #$FF                                                           ;88A4B4;
    BRA .loop                                                            ;88A4B6;

  .lowByteZero:
    XBA                                                                  ;88A4B8;
    LDA.B #$00                                                           ;88A4B9;

  .loop:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;88A4BB;
    XBA                                                                  ;88A4BF;
    STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;88A4C0;
    XBA                                                                  ;88A4C4;
    CPX.B DP_Temp14                                                      ;88A4C5;
    BEQ .next                                                            ;88A4C7;
    DEX                                                                  ;88A4C9;
    JMP.W .loop                                                          ;88A4CA;

  .next:
    INY                                                                  ;88A4CD;
    BPL Calculate_CrystalFlash_HDMADataTables_Scaled_LeftOfScreen        ;88A4CE;
    RTS                                                                  ;88A4D0;


;;; $A4D1: Calculate crystal flash HDMA data tables - scaled - power bomb is on screen ;;;
Calculate_CrystalFlash_HDMADataTables_Scaled_OnScreen:
; Clone of Calculate_PowerBombExplosion_HDMADataTables_Scaled_OnScreen
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y             ;88A4D1;
    STA.W $4203                                                          ;88A4D4;
    NOP                                                                  ;88A4D7;
    NOP                                                                  ;88A4D8;
    NOP                                                                  ;88A4D9;
    LDA.W $4217                                                          ;88A4DA;
    STA.B DP_Temp14                                                      ;88A4DD;
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y             ;88A4DF;
    STA.W $4203                                                          ;88A4E2;
    NOP                                                                  ;88A4E5;
    LDA.W SamusProjectile_PowerBombPositionOnScreen                      ;88A4E6;
    CLC                                                                  ;88A4E9;
    ADC.W $4217                                                          ;88A4EA;
    BCC +                                                                ;88A4ED;
    LDA.B #$FF                                                           ;88A4EF;

+   XBA                                                                  ;88A4F1;
    LDA.W SamusProjectile_PowerBombPositionOnScreen                      ;88A4F2;
    SEC                                                                  ;88A4F5;
    SBC.W $4217                                                          ;88A4F6;
    BCS .loop                                                            ;88A4F9;
    LDA.B #$00                                                           ;88A4FB;

  .loop:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;88A4FD;
    XBA                                                                  ;88A501;
    STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;88A502;
    XBA                                                                  ;88A506;
    CPX.B DP_Temp14                                                      ;88A507;
    BEQ .next                                                            ;88A509;
    DEX                                                                  ;88A50B;
    JMP.W .loop                                                          ;88A50C;

  .next:
    INY                                                                  ;88A50F;
    BPL Calculate_CrystalFlash_HDMADataTables_Scaled_OnScreen            ;88A510;
    RTS                                                                  ;88A512;


;;; $A513: Calculate crystal flash HDMA data tables - scaled - power bomb is right of screen ;;;
Calculate_CrystalFlash_HDMADataTables_Scaled_RightOfScreen:
; Clone of Calculate_PowerBombExplo_HDMADataTables_Scaled_RightOfScreen
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y             ;88A513;
    STA.W $4203                                                          ;88A516;
    NOP                                                                  ;88A519;
    NOP                                                                  ;88A51A;
    NOP                                                                  ;88A51B;
    LDA.W $4217                                                          ;88A51C;
    STA.B DP_Temp14                                                      ;88A51F;
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y             ;88A521;
    STA.W $4203                                                          ;88A524;
    NOP                                                                  ;88A527;
    LDA.W SamusProjectile_PowerBombPositionOnScreen                      ;88A528;
    SEC                                                                  ;88A52B;
    SBC.W $4217                                                          ;88A52C;
    BCC .lowByteFF                                                       ;88A52F;
    LDA.B #$FF                                                           ;88A531;
    XBA                                                                  ;88A533;
    LDA.B #$00                                                           ;88A534;
    BRA +                                                                ;88A536;

  .lowByteFF:
    XBA                                                                  ;88A538;
    LDA.B #$FF                                                           ;88A539;

+   XBA                                                                  ;88A53B;

  .loop:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;88A53C;
    XBA                                                                  ;88A540;
    STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;88A541;
    XBA                                                                  ;88A545;
    CPX.B DP_Temp14                                                      ;88A546;
    BEQ .next                                                            ;88A548;
    DEX                                                                  ;88A54A;
    JMP.W .loop                                                          ;88A54B;

  .next:
    INY                                                                  ;88A54E;
    BPL Calculate_CrystalFlash_HDMADataTables_Scaled_RightOfScreen       ;88A54F;
    RTS                                                                  ;88A551;


;;; $A552: Pre-instruction - crystal flash - stage 1 - explosion ;;;
PreInstruction_CrystalFlash_1_Explosion:
;; Parameters:
;;     X: HDMA object index

; Identical to power bomb explosion stage 3 ($8DE9) except for the max radius (at $A5F6, resp. $8E8D)
    LDA.W PowerBombExplosionStatus                                       ;88A552;
    BMI .exploding                                                       ;88A555;
    RTL                                                                  ;88A557;

  .exploding:
    PHP                                                                  ;88A558;
    PHB                                                                  ;88A559;
    REP #$30                                                             ;88A55A;
    PHX                                                                  ;88A55C;
    PHY                                                                  ;88A55D;
    JSL.L Calculate_CrystalFlash_HDMAObjectTablePointers                 ;88A55E;
    PEA.W PowerBombExplosion_Colors>>8&$FF00                             ;88A562;
    PLB                                                                  ;88A565;
    PLB                                                                  ;88A566;
    SEP #$30                                                             ;88A567;
    LDA.B #$00                                                           ;88A569;
    XBA                                                                  ;88A56B;
    LDY.B #$60                                                           ;88A56C;
    LDA.W SamusProjectile_PowerBombExplosionRadius+1                     ;88A56E;
    STA.W $4202                                                          ;88A571;
    LDA.W PowerBombExplosion_ShapeDefinitionTable_Unscaled_topOffset     ;88A574;
    STA.W $4203                                                          ;88A577;
    NOP                                                                  ;88A57A;
    NOP                                                                  ;88A57B;
    NOP                                                                  ;88A57C;
    LDA.W $4217                                                          ;88A57D;
    STA.B DP_Temp12                                                      ;88A580;
    TAX                                                                  ;88A582;
    PEA.W .loopPadDataTableBegin-1                                       ;88A583;
    LDA.W SamusProjectile_PowerBombPositionOnScreen+1                    ;88A586;
    AND.B #$FF                                                           ;88A589;
    BEQ .offScreenLeft                                                   ;88A58B;
    DEC                                                                  ;88A58D;
    BEQ .onScreen                                                        ;88A58E;
    JMP.W Calculate_CrystalFlash_HDMADataTables_Scaled_RightOfScreen     ;88A590;

  .onScreen:
    JMP.W Calculate_CrystalFlash_HDMADataTables_Scaled_OnScreen          ;88A593;

  .offScreenLeft:
    JMP.W Calculate_CrystalFlash_HDMADataTables_Scaled_LeftOfScreen      ;88A596;

  .loopPadDataTableBegin:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;88A599;
    XBA                                                                  ;88A59D;
    STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;88A59E;
    XBA                                                                  ;88A5A2;
    DEX                                                                  ;88A5A3;
    BPL .loopPadDataTableBegin                                           ;88A5A4;
    LDX.B DP_Temp12                                                      ;88A5A6;
    INX                                                                  ;88A5A8;
    CPX.B #$C0                                                           ;88A5A9;
    BEQ .finishedTable                                                   ;88A5AB;
    LDA.B #$FF                                                           ;88A5AD;

  .loopPadDataTableEnd:
    STA.L PowerBombExplosionWindow2LeftHDMADataTable,X                   ;88A5AF;
    INC                                                                  ;88A5B3;
    STA.L PowerBombExplosionWindow2RightHDMADataTable,X                  ;88A5B4;
    DEC                                                                  ;88A5B8;
    INX                                                                  ;88A5B9;
    CPX.B #$C0                                                           ;88A5BA;
    BNE .loopPadDataTableEnd                                             ;88A5BC;

  .finishedTable:
    LDA.W SamusProjectile_PowerBombExplosionRadius+1                     ;88A5BE;
    LSR                                                                  ;88A5C1;
    LSR                                                                  ;88A5C2;
    LSR                                                                  ;88A5C3;
    AND.B #$1F                                                           ;88A5C4;
    STA.B DP_Temp12                                                      ;88A5C6;
    ASL                                                                  ;88A5C8;
    CLC                                                                  ;88A5C9;
    ADC.B DP_Temp12                                                      ;88A5CA;
    TAX                                                                  ;88A5CC;
    LDA.L PowerBombExplosion_Colors_red,X                                ;88A5CD;
    ORA.B #$20                                                           ;88A5D1;
    STA.W DP_ColorMathSubScreenBackdropColor0                            ;88A5D3;
    LDA.L PowerBombExplosion_Colors_green,X                              ;88A5D6;
    ORA.B #$40                                                           ;88A5DA;
    STA.W DP_ColorMathSubScreenBackdropColor1                            ;88A5DC;
    LDA.L PowerBombExplosion_Colors_blue,X                               ;88A5DF;
    ORA.B #$80                                                           ;88A5E3;
    STA.W DP_ColorMathSubScreenBackdropColor2                            ;88A5E5;
    REP #$30                                                             ;88A5E8;
    PLY                                                                  ;88A5EA;
    PLX                                                                  ;88A5EB;
    LDA.W SamusProjectile_PowerBombExplosionRadius                       ;88A5EC;
    CLC                                                                  ;88A5EF;
    ADC.W SamusProjectile_PowerBombPreExplosionRadiusSpeed               ;88A5F0;
    STA.W SamusProjectile_PowerBombExplosionRadius                       ;88A5F3;
    CMP.W #$2000                                                         ;88A5F6;
    BCC .lessThan2000                                                    ;88A5F9;
    LDA.W #$0001                                                         ;88A5FB;
    STA.W HDMAObject_InstructionTimers,X                                 ;88A5FE;
    INC.W HDMAObject_InstListPointers,X                                  ;88A601;
    INC.W HDMAObject_InstListPointers,X                                  ;88A604;
    STZ.W HDMAObject_Timers,X                                            ;88A607;
    JMP.W .return                                                        ;88A60A;

  .lessThan2000:
    LDA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed               ;88A60D;
    CLC                                                                  ;88A610;
    ADC.L PowerBombExplosion_RadiusAcceleration                          ;88A611;
    STA.W SamusProjectile_PowerBombPreExplosionRadiusSpeed               ;88A615;

  .return:
    PLB                                                                  ;88A618;
    PLP                                                                  ;88A619;
    RTL                                                                  ;88A61A;


;;; $A61B: FX type 22h: unused ;;;
FXType_20_22_ScrollingSky:
; Seems like it might have been an early version of the WS entrance scrolling sky + water
; Trying to use this FX in that room has tragic results though, and the code in its present form is a mess / broken
    PHP                                                                  ;88A61B;
    REP #$30                                                             ;88A61C;
    LDA.W #$04E0                                                         ;88A61E;
    STA.W FX_YPosition                                                   ;88A621;
    LDA.W #$0006                                                         ;88A624;
    STA.W FX_Type                                                        ;88A627;
    JSL.L Spawn_HDMAObject                                               ;88A62A;
    db $02,$12                                                           ;88A62E;
    dw InstList_FXType_22_BG3YScroll_0                                   ;88A630;
    JSL.L Spawn_HDMAObject                                               ;88A632;
    db $42,$11                                                           ;88A636;
    dw InstList_FXType_22_BG3XScroll_0                                   ;88A638;
    JSL.L Spawn_HDMAObject                                               ;88A63A;
    db $42,$0D                                                           ;88A63E;
    dw InstList_FXType_22_BG1XScroll_0                                   ;88A640;
    PLP                                                                  ;88A642; fallthrough to PreInstruction_FXType_22_BG3Yscroll


;;; $A643: Pre-instruction - FX type 22h BG3 Y scroll ;;;
PreInstruction_FXType_22_BG3Yscroll:
    REP #$30                                                             ;88A643;
    JSR.W Damage_Samus_IfSheIsInTheTopRow                                ;88A645;
    LDA.W #FXType_22_RepeatingBG3StripsTable                             ;88A648;
    STA.B DP_Temp00                                                      ;88A64B;
    LDA.W #FXType_22_RepeatingBG3StripsTable+2                           ;88A64D;
    STA.B DP_Temp03                                                      ;88A650;
    LDA.W #FXType_22_RepeatingBG3StripsTable+4                           ;88A652;
    STA.B DP_Temp06                                                      ;88A655;
    LDA.W #FXType_22_RepeatingBG3StripsTable+6                           ;88A657;
    STA.B DP_Temp09                                                      ;88A65A;
    LDA.W #$004E                                                         ;88A65C;
    STA.B DP_Temp18                                                      ;88A65F;
    JSR.W Calculate_FXType_22_BG3YScrollHDMATable                        ;88A661;
    LDA.W #$0000                                                         ;88A664;
    STA.L FXType22BG3YScrollHDMATable,X                                  ;88A667;
    RTL                                                                  ;88A66B;


;;; $A66C: Instruction - HDMA object phase increase timer = 1 ;;;
Instruction_HDMAObjectPhaseIncreaseTimer_1:
;; Parameters:
;;     X: HDMA object index
    LDA.W #$0001                                                         ;88A66C;
    STA.W HDMAObject_Var1,X                                              ;88A66F;
    RTS                                                                  ;88A672;


;;; $A673: Pre-instruction - FX type 22h BG3 X scroll ;;;
PreInstruction_FXType_22_BG3XScroll:
;; Parameters:
;;     X: HDMA object index

; $7E:9E02..??: FX type 22h BG3 X scroll indirect HDMA table
; $7E:9F02..??: FX type 22h BG1 X scroll indirect HDMA table
; $7E:9E80..??: FX type 22h BG3 X scroll HDMA data table
    PHP                                                                  ;88A673;
    REP #$30                                                             ;88A674;
    PHB                                                                  ;88A676;
    PHX                                                                  ;88A677;
    PHY                                                                  ;88A678;
    LDA.W Layer1YPosition                                                ;88A679;
    CMP.W #$0400                                                         ;88A67C;
    BPL .wavy                                                            ;88A67F;
    LDA.W NMI_8bitFrameCounter                                           ;88A681;
    AND.W #$0001                                                         ;88A684;
    BNE +                                                                ;88A687;
    LDA.W BG3XScrollHDMADataTableSize                                    ;88A689;
    INC                                                                  ;88A68C;
    INC                                                                  ;88A68D;
    AND.W #$001E                                                         ;88A68E;
    STA.W BG3XScrollHDMADataTableSize                                    ;88A691;

+   LDY.W BG3XScrollHDMADataTableSize                                    ;88A694;
    LDX.W #$0000                                                         ;88A697;

  .loop:
    LDA.W FXType_22_BG3XScrollHDMAData,Y                                 ;88A69A;
    STA.L FXType22BG3XScrollHDMADataTable,X                              ;88A69D;
    INX                                                                  ;88A6A1;
    INX                                                                  ;88A6A2;
    INY                                                                  ;88A6A3;
    INY                                                                  ;88A6A4;
    CPY.W #$0020                                                         ;88A6A5;
    BMI .loop                                                            ;88A6A8;
    BRA .merge                                                           ;88A6AA;

  .wavy:
    DEC.W HDMAObject_Var1,X                                              ;88A6AC;
    BNE +                                                                ;88A6AF;
    LDA.W #$0006                                                         ;88A6B1;
    STA.W HDMAObject_Var1,X                                              ;88A6B4;
    LDA.W HDMAObject_Var0,X                                              ;88A6B7;
    INC                                                                  ;88A6BA;
    INC                                                                  ;88A6BB;
    AND.W #$001F                                                         ;88A6BC;
    STA.W HDMAObject_Var0,X                                              ;88A6BF;

+   LDA.W HDMAObject_Var0,X                                              ;88A6C2;
    TAX                                                                  ;88A6C5;
    LDY.W #$001E                                                         ;88A6C6;

  .loopWavy:
    LDA.B DP_BG1XScroll                                                  ;88A6C9;
    CLC                                                                  ;88A6CB;
    ADC.W WaveDisplacementTable_Water,Y                                  ;88A6CC;
    STA.L FXType22BG3XScrollHDMADataTable,X                              ;88A6CF;
    TXA                                                                  ;88A6D3;
    DEC                                                                  ;88A6D4;
    DEC                                                                  ;88A6D5;
    AND.W #$001F                                                         ;88A6D6;
    TAX                                                                  ;88A6D9;
    DEY                                                                  ;88A6DA;
    DEY                                                                  ;88A6DB;
    BPL .loopWavy                                                        ;88A6DC;

  .merge:
    LDA.W #$0000                                                         ;88A6DE;
    STA.L FXType22BG3XScrollIndirectHDMATable-2                          ;88A6E1;
    STA.L FXType22BG1XScrollIndirectHDMADataTable-2                      ;88A6E5;
    LDA.W #$001F                                                         ;88A6E9;
    STA.L FXType22BG3XScrollIndirectHDMATable                            ;88A6EC;
    STA.L FXType22BG1XScrollIndirectHDMADataTable                        ;88A6F0;
    STA.B DP_Temp12                                                      ;88A6F4;
    LDA.W #FXType22BG3XScrollIndirectHDMATable-2                         ;88A6F6;
    STA.L FXType22BG3XScrollIndirectHDMATable+1                          ;88A6F9;
    STA.L FXType22BG1XScrollIndirectHDMADataTable+1                      ;88A6FD;
    LDA.W Layer1YPosition                                                ;88A701;
    CMP.W #$0400                                                         ;88A704;
    BMI .lessThan400                                                     ;88A707;
    LDA.W #$00B1                                                         ;88A709;
    STA.B DP_Temp14                                                      ;88A70C;
    STZ.B DP_Temp16                                                      ;88A70E;
    LDX.W #$0105                                                         ;88A710;
    JSR.W Calculate_FXType_22_IndirectHDMATable                          ;88A713;
    BRA +                                                                ;88A716;

  .lessThan400:
    LDA.W #$0000                                                         ;88A718;
    STA.L FXType22BG1XScrollIndirectHDMADataTable                        ;88A71B;

+   LDX.W #$0005                                                         ;88A71F;
    LDA.W #FXType22BG3XScrollHDMADataTable                               ;88A722;
    STA.B DP_Temp14                                                      ;88A725;
    LDA.W #$0080                                                         ;88A727;
    STA.B DP_Temp16                                                      ;88A72A;
    JSR.W Calculate_FXType_22_IndirectHDMATable                          ;88A72C;
    LDA.W #$00E0                                                         ;88A72F;
    SEC                                                                  ;88A732;
    SBC.B DP_Temp12                                                      ;88A733;
    TAY                                                                  ;88A735;

  .loopPad:
    TYA                                                                  ;88A736;
    SEC                                                                  ;88A737;
    SBC.W #$0010                                                         ;88A738;
    BMI .lessThan10                                                      ;88A73B;
    TAY                                                                  ;88A73D;
    LDA.W #$0090                                                         ;88A73E;
    STA.L FXType22BG3XScrollIndirectHDMATable-2,X                        ;88A741;
    STA.L FXType22BG1XScrollIndirectHDMADataTable-2,X                    ;88A745;
    LDA.W #FXType22BG3XScrollHDMADataTable                               ;88A749;
    STA.L FXType22BG3XScrollIndirectHDMATable-1,X                        ;88A74C;
    STA.L FXType22BG1XScrollIndirectHDMADataTable-1,X                    ;88A750;
    INX                                                                  ;88A754;
    INX                                                                  ;88A755;
    INX                                                                  ;88A756;
    BRA .loopPad                                                         ;88A757;

  .lessThan10:
    TYA                                                                  ;88A759;
    CMP.W #$0000                                                         ;88A75A;
    BEQ +                                                                ;88A75D;
    CLC                                                                  ;88A75F;
    ADC.W #$0080                                                         ;88A760;

+   STA.L FXType22BG3XScrollIndirectHDMATable-2,X                        ;88A763;
    STA.L FXType22BG1XScrollIndirectHDMADataTable-2,X                    ;88A767;
    LDA.W #FXType22BG3XScrollHDMADataTable                               ;88A76B;
    STA.L FXType22BG3XScrollIndirectHDMATable-1,X                        ;88A76E;
    STA.L FXType22BG1XScrollIndirectHDMADataTable-1,X                    ;88A772;
    LDA.W #$0000                                                         ;88A776;
    STA.L FXType22BG3XScrollIndirectHDMATable+1,X                        ;88A779;
    STA.L FXType22BG1XScrollIndirectHDMADataTable+1,X                    ;88A77D;
    PLY                                                                  ;88A781;
    PLX                                                                  ;88A782;
    PLB                                                                  ;88A783;
    PLP                                                                  ;88A784;
    RTL                                                                  ;88A785;


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
    LDA.W #$04C0                                                         ;88A786;
    SEC                                                                  ;88A789;
    SBC.W Layer1YPosition                                                ;88A78A;
    STA.B DP_Temp18                                                      ;88A78D;
    BMI .return                                                          ;88A78F;
    BEQ .return                                                          ;88A791;
    CMP.W #$0080                                                         ;88A793;
    BMI .onlyOneEntryNeeded                                              ;88A796;
    STA.B DP_Temp12                                                      ;88A798;
    CMP.W #$00C1                                                         ;88A79A;
    BMI .remainingScanlineCounter                                        ;88A79D;
    LDA.W #$00C1                                                         ;88A79F;

  .remainingScanlineCounter:
    STA.B DP_Temp12                                                      ;88A7A2;
    STA.B DP_Temp18                                                      ;88A7A4;

  .loop:
    SEC                                                                  ;88A7A6;
    SBC.W #$0010                                                         ;88A7A7;
    BMI .done                                                            ;88A7AA;
    STA.B DP_Temp18                                                      ;88A7AC;
    LDA.W #$0010                                                         ;88A7AE;
    ORA.B DP_Temp16                                                      ;88A7B1;
    STA.L FXType22BG3XScrollIndirectHDMATable-2,X                        ;88A7B3;
    LDA.B DP_Temp14                                                      ;88A7B7;
    STA.L FXType22BG3XScrollIndirectHDMATable-1,X                        ;88A7B9;
    LDA.B DP_Temp18                                                      ;88A7BD;
    INX                                                                  ;88A7BF;
    INX                                                                  ;88A7C0;
    INX                                                                  ;88A7C1;
    BRA .loop                                                            ;88A7C2;

  .onlyOneEntryNeeded:
    STA.B DP_Temp12                                                      ;88A7C4;

  .done:
    LDA.B DP_Temp18                                                      ;88A7C6;
    ORA.B DP_Temp16                                                      ;88A7C8;
    STA.L FXType22BG3XScrollIndirectHDMATable-2,X                        ;88A7CA;
    LDA.B DP_Temp14                                                      ;88A7CE;
    STA.L FXType22BG3XScrollIndirectHDMATable-1,X                        ;88A7D0;
    INX                                                                  ;88A7D4;
    INX                                                                  ;88A7D5;
    INX                                                                  ;88A7D6;

  .return:
    RTS                                                                  ;88A7D7;


;;; $A7D8: Spawn scrolling sky land HDMA object / FX type 20h: scrolling sky ;;;
FXType_20_ScrollingSky_RoomSetupASM_ScrollingSkyLand:
    PHP                                                                  ;88A7D8;
    SEP #$30                                                             ;88A7D9;
    LDA.W Layer2ScrollX                                                  ;88A7DB;
    ORA.B #$01                                                           ;88A7DE;
    STA.W Layer2ScrollX                                                  ;88A7E0;
    LDA.W Layer2ScrollY                                                  ;88A7E3;
    ORA.B #$01                                                           ;88A7E6;
    STA.W Layer2ScrollY                                                  ;88A7E8;
    JSL.L Spawn_HDMAObject                                               ;88A7EB;
    db $42,$0F                                                           ;88A7EF;
    dw InstList_ScrollingSkyLand_BG2XScroll_0                            ;88A7F1;
    REP #$30                                                             ;88A7F3;
    LDA.W #$00E0                                                         ;88A7F5;
    STA.W neverRead059A                                                  ;88A7F8;
    STZ.W neverRead059C                                                  ;88A7FB;
    PLP                                                                  ;88A7FE;
    RTL                                                                  ;88A7FF;


;;; $A800: Spawn scrolling sky ocean HDMA object ;;;
RoomSetupASM_ScrollingSkyOcean:
    PHP                                                                  ;88A800;
    SEP #$30                                                             ;88A801;
    LDA.B #$4A                                                           ;88A803;
    STA.B DP_BG2TilemapAddrSize                                          ;88A805;
    JSL.L Spawn_HDMAObject                                               ;88A807;
    db $42,$0F                                                           ;88A80B;
    dw InstList_ScrollingSkyOcean_BG2XScroll_0                           ;88A80D;
    REP #$30                                                             ;88A80F;
    LDA.W #$00E0                                                         ;88A811;
    STA.W neverRead059A                                                  ;88A814;
    STZ.W neverRead059C                                                  ;88A817;
    PLP                                                                  ;88A81A;
    RTL                                                                  ;88A81B;


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
    PHB                                                                  ;88A81C;
    PHK                                                                  ;88A81D;
    PLB                                                                  ;88A81E;
    LDA.W #$0020                                                         ;88A81F;
    STA.W YPositionOnScreenFX22                                          ;88A822;
    DEC                                                                  ;88A825;
    STA.L FXType22BG3YScrollHDMATable                                    ;88A826;
    LDA.W #$0000                                                         ;88A82A;
    STA.L FXType22BG3YScrollHDMATable+1                                  ;88A82D;
    LDX.W #$0003                                                         ;88A831;
    LDA.W Layer1YPosition                                                ;88A834;
    CLC                                                                  ;88A837;
    ADC.W YPositionOnScreenFX22                                          ;88A838;
    STA.B DP_Temp12                                                      ;88A83B;
    LDY.W #$0000                                                         ;88A83D;

  .loopFirstStrip:
    CMP.B (DP_Temp00),Y                                                  ;88A840;
    BMI +                                                                ;88A842;
    CMP.B (DP_Temp09),Y                                                  ;88A844;
    BMI .foundFirstStrip                                                 ;88A846;

+   INY                                                                  ;88A848;
    INY                                                                  ;88A849;
    INY                                                                  ;88A84A;
    INY                                                                  ;88A84B;
    INY                                                                  ;88A84C;
    INY                                                                  ;88A84D;
    CPY.B DP_Temp18                                                      ;88A84E;
    BMI .loopFirstStrip                                                  ;88A850;
    PLB                                                                  ;88A852;
    RTS                                                                  ;88A853;

  .foundFirstStrip:
    LDA.B DP_Temp12                                                      ;88A854;
    CMP.W #$04E0                                                         ;88A856;
    BMI .YposMod10                                                       ;88A859;
    AND.W #$001F                                                         ;88A85B;
    BRA +                                                                ;88A85E;

  .YposMod10:
    AND.W #$000F                                                         ;88A860;

+   STA.B DP_Temp16                                                      ;88A863;
    LDA.B (DP_Temp03),Y                                                  ;88A865;
    SEC                                                                  ;88A867;
    SBC.B DP_Temp16                                                      ;88A868;
    STA.L FXType22BG3YScrollHDMATable,X                                  ;88A86A;
    LDA.B (DP_Temp06),Y                                                  ;88A86E;
    CLC                                                                  ;88A870;
    ADC.B DP_Temp16                                                      ;88A871;
    SEC                                                                  ;88A873;
    SBC.W YPositionOnScreenFX22                                          ;88A874;
    STA.L FXType22BG3YScrollHDMATable+1,X                                ;88A877;
    BRA .next                                                            ;88A87B;

  .loopHDMATable:
    LDA.B DP_Temp12                                                      ;88A87D;

  .loopStrip:
    CMP.B (DP_Temp00),Y                                                  ;88A87F;
    BMI +                                                                ;88A881;
    CMP.B (DP_Temp09),Y                                                  ;88A883;
    BMI .foundStrip                                                      ;88A885;

+   INY                                                                  ;88A887;
    INY                                                                  ;88A888;
    INY                                                                  ;88A889;
    INY                                                                  ;88A88A;
    INY                                                                  ;88A88B;
    INY                                                                  ;88A88C;
    CPY.B DP_Temp18                                                      ;88A88D;
    BMI .loopStrip                                                       ;88A88F;
    PLB                                                                  ;88A891;
    RTS                                                                  ;88A892;

  .foundStrip:
    LDA.B (DP_Temp03),Y                                                  ;88A893;
    STA.L FXType22BG3YScrollHDMATable,X                                  ;88A895;
    LDA.B (DP_Temp06),Y                                                  ;88A899;
    SEC                                                                  ;88A89B;
    SBC.W YPositionOnScreenFX22                                          ;88A89C;
    STA.L FXType22BG3YScrollHDMATable+1,X                                ;88A89F;

  .next:
    LDA.L FXType22BG3YScrollHDMATable,X                                  ;88A8A3;
    AND.W #$00FF                                                         ;88A8A7;
    STA.B DP_Temp14                                                      ;88A8AA;
    CLC                                                                  ;88A8AC;
    ADC.B DP_Temp12                                                      ;88A8AD;
    STA.B DP_Temp12                                                      ;88A8AF;
    INX                                                                  ;88A8B1;
    INX                                                                  ;88A8B2;
    INX                                                                  ;88A8B3;
    LDA.B DP_Temp14                                                      ;88A8B4;
    CLC                                                                  ;88A8B6;
    ADC.W YPositionOnScreenFX22                                          ;88A8B7;
    STA.W YPositionOnScreenFX22                                          ;88A8BA;
    CMP.W #$00E0                                                         ;88A8BD;
    BMI .loopHDMATable                                                   ;88A8C0;
    PLB                                                                  ;88A8C2;
    RTS                                                                  ;88A8C3;


;;; $A8C4: Damage Samus if she is in the top row ;;;
Damage_Samus_IfSheIsInTheTopRow:
    LDA.W SamusYPosition                                                 ;88A8C4;
    SEC                                                                  ;88A8C7;
    SBC.W SamusYRadius                                                   ;88A8C8;
    BMI .8damage                                                         ;88A8CB;
    CMP.W #$0011                                                         ;88A8CD;
    BMI .8damage                                                         ;88A8D0;
    RTS                                                                  ;88A8D2;

  .8damage:
    LDA.W #$0008                                                         ;88A8D3;
    STA.W PeriodicDamage                                                 ;88A8D6;
    RTS                                                                  ;88A8D9;


if !FEATURE_KEEP_UNREFERENCED
;;; $A8DA: Unused table ;;;
UNUSED_Table_88A8DA:
; Looks like the format of FXType_22_RepeatingBG3StripsTable below
    dw $0000,$0010,$0020,$0020,$0010,$0030,$0040                         ;88A8DA;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A8E8: FX type 22h repeating BG3 strips table ;;;
FXType_22_RepeatingBG3StripsTable:
; This table defines sections of repeating strips of BG3
;        _______________ Section top position
;       |      _________ Strip height
;       |     |      ___ BG3 tilemap Y position
;       |     |     |
    dw $0000,$0010,$0020                                                 ;88A8E8;
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
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88A938;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88A948;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88A958;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88A968;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88A978;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88A988;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88A998;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88A9A8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88A9B8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88A9C8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88A9D8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88A9E8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88A9F8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AA08;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AA18;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AA28;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AA38;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AA48;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AA58;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AA68;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AA78;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AA88;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AA98;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AAA8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AAB8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AAC8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AAD8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AAE8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AAF8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AB08;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AB18;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AB28;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AB38;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AB48;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AB58;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AB68;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AB78;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AB88;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AB98;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88ABA8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88ABB8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88ABC8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88ABD8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88ABE8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88ABF8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AC08;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AC18;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AC28;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AC38;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AC48;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AC58;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AC68;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AC78;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AC88;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AC98;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88ACA8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88ACB8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88ACC8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88ACD8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88ACE8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88ACF8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AD08;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AD18;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AD28;


;;; $AD38: RTL. Pre-instruction - FX type 22h BG1 X scroll ;;;
RTL_88AD38:
    RTL                                                                  ;88AD38;


;;; $AD39: Instruction list - FX type 22h BG1 X scroll ;;;
InstList_FXType_22_BG1XScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88AD39;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88AD3C;
    dw Instruction_HDMAObjectPhaseIncreaseTimer_1                        ;88AD3F;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88AD41;
    dl RTL_88AD38                                                        ;88AD43;

InstList_FXType_22_BG1XScroll_1:
    dw $7000,FXType22BG1XScrollIndirectHDMADataTable                     ;88AD46;
    dw Instruction_HDMAObject_GotoY                                      ;88AD4A;
    dw InstList_FXType_22_BG1XScroll_1                                   ;88AD4C;


;;; $AD4E: Instruction list - FX type 22h BG3 X scroll ;;;
InstList_FXType_22_BG3XScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88AD4E;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88AD51;
    dw Instruction_HDMAObjectPhaseIncreaseTimer_1                        ;88AD54;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88AD56;
    dl PreInstruction_FXType_22_BG3XScroll                               ;88AD58;

InstList_FXType_22_BG3XScroll_1:
    dw $7000,FXType22BG3XScrollIndirectHDMATable                         ;88AD5B;
    dw Instruction_HDMAObject_GotoY                                      ;88AD5F;
    dw InstList_FXType_22_BG3XScroll_1                                   ;88AD61;


;;; $AD63: Instruction list - FX type 22h BG3 Y scroll ;;;
InstList_FXType_22_BG3YScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88AD63;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88AD66;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88AD69;
    dl PreInstruction_FXType_22_BG3Yscroll                               ;88AD6B;

InstList_FXType_22_BG3YScroll_1:
    dw $7000,FXType22BG3YScrollHDMATable                                 ;88AD6E;
    dw Instruction_HDMAObject_GotoY                                      ;88AD72;
    dw InstList_FXType_22_BG3YScroll_1                                   ;88AD74;


;;; $AD76: Instruction list - scrolling sky land BG2 X scroll ;;;
InstList_ScrollingSkyLand_BG2XScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88AD76;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88AD79;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88AD7C;
    dl PreInstruction_ScrollingSkyLand_BG2XScroll                        ;88AD7E;

InstList_ScrollingSkyLand_BG2XScroll_1:
    dw $7000,ScrollingSkyBG2XScrollIndirectHDMATable                     ;88AD81;
    dw Instruction_HDMAObject_GotoY                                      ;88AD85;
    dw InstList_ScrollingSkyLand_BG2XScroll_1                            ;88AD87;


;;; $AD89: Instruction list - scrolling sky ocean BG2 X scroll ;;;
InstList_ScrollingSkyOcean_BG2XScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88AD89;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88AD8C;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88AD8F;
    dl PreInstruction_ScrollingSkyOcean_BG2XScroll                       ;88AD91;

InstList_ScrollingSkyOcean_BG2XScroll_1:
    dw $7000,ScrollingSkyBG2XScrollIndirectHDMATable                     ;88AD94;
    dw Instruction_HDMAObject_GotoY                                      ;88AD98;
    dw InstList_ScrollingSkyOcean_BG2XScroll_1                           ;88AD9A;


;;; $AD9C: Scrolling sky land chunk pointers ;;;
ScrollingSkyLand_ChunkPointers:
    dw ScrollingSky_Tilemaps_0                                           ;88AD9C;
    dw ScrollingSky_Tilemaps_1                                           ;88AD9E;
    dw ScrollingSky_Tilemaps_2                                           ;88ADA0;
    dw ScrollingSky_Tilemaps_3                                           ;88ADA2;
    dw ScrollingSky_Tilemaps_4                                           ;88ADA4;


;;; $ADA6: Scrolling sky ocean chunk pointers ;;;
ScrollingSkyOcean_ChunkPointesr:
    dw ScrollingSky_Tilemaps_0                                           ;88ADA6;
    dw ScrollingSky_Tilemaps_1                                           ;88ADA8;
    dw ScrollingSky_Tilemaps_2                                           ;88ADAA;
    dw ScrollingSky_Tilemaps_3                                           ;88ADAC;
    dw ScrollingSky_Tilemaps_5                                           ;88ADAE;
    dw ScrollingSky_Tilemaps_8AE180                                      ;88ADB0;


;;; $ADB2: Pre-instruction - scrolling sky land BG2 X scroll ;;;
PreInstruction_ScrollingSkyLand_BG2XScroll:
    REP #$30                                                             ;88ADB2;
    LDA.W TimeIsFrozenFlag                                               ;88ADB4;
    BEQ Handle_ScrollingSky_BG2XScroll_HDMATables                        ;88ADB7;
    RTL                                                                  ;88ADB9;


;;; $ADBA: Pre-instruction - scrolling sky ocean BG2 X scroll ;;;
PreInstruction_ScrollingSkyOcean_BG2XScroll:
    REP #$30                                                             ;88ADBA;
    LDA.W TimeIsFrozenFlag                                               ;88ADBC;
    BEQ Handle_ScrollingSky_BG2XScroll_HDMATables                        ;88ADBF;
    RTL                                                                  ;88ADC1;


;;; $ADC2: Handle scrolling sky BG2 X scroll HDMA tables ;;;
Handle_ScrollingSky_BG2XScroll_HDMATables:
; The HUDBG2XPositionScrollingSky HDMA data entry pointer used at $AE05 I low-key suspect should be neverRead059C,
; which is explicitly set to zero in room setup ASM and otherwise unused,
; unlike HUDBG2XPositionScrollingSky which is never set (but is also otherwise unused)
    SEP #$30                                                             ;88ADC2;
    LDA.B #$4A                                                           ;88ADC4;
    STA.B DP_BG2TilemapAddrSize                                          ;88ADC6;
    REP #$30                                                             ;88ADC8;
    LDY.W #$0000                                                         ;88ADCA;

  .loopDataTable:
    LDA.W ScrollingSky_ScrollingTable_HDMADataTableEntryPointer,Y        ;88ADCD;
    TAX                                                                  ;88ADD0;
    LDA.W ScrollingSky_ScrollingTable_scrollSubspeed,Y                   ;88ADD1;
    CLC                                                                  ;88ADD4;
    ADC.L ScrollingSkyBG2XScrollHDMADataTable&$FF0000,X                  ;88ADD5;
    STA.L ScrollingSkyBG2XScrollHDMADataTable&$FF0000,X                  ;88ADD9;
    LDA.W ScrollingSky_ScrollingTable_scrollSpeed,Y                      ;88ADDD;
    ADC.L (ScrollingSkyBG2XScrollHDMADataTable&$FF0000)+2,X              ;88ADE0;
    STA.L (ScrollingSkyBG2XScrollHDMADataTable&$FF0000)+2,X              ;88ADE4;
    TYA                                                                  ;88ADE8;
    CLC                                                                  ;88ADE9;
    ADC.W #$0008                                                         ;88ADEA;
    TAY                                                                  ;88ADED;
    CMP.W #$00B8                                                         ;88ADEE;
    BMI .loopDataTable                                                   ;88ADF1;
    LDA.W #$0000                                                         ;88ADF3;
    STA.L ScrollingSkyBG2XScrollHDMADataTable+$58                        ;88ADF6;
    STA.L ScrollingSkyBG2XScrollHDMADataTable+$5A                        ;88ADFA;
    LDA.W #$001F                                                         ;88ADFE;
    STA.L ScrollingSkyBG2XScrollIndirectHDMATable                        ;88AE01;
    LDA.W #HUDBG2XPositionScrollingSky                                   ;88AE05;
    STA.L ScrollingSkyBG2XScrollIndirectHDMATable+1                      ;88AE08;
    LDA.W Layer1YPosition                                                ;88AE0C;
    CLC                                                                  ;88AE0F;
    ADC.W #$0020                                                         ;88AE10;
    STA.B DP_Temp12                                                      ;88AE13;
    CLC                                                                  ;88AE15;
    ADC.W #$00C0                                                         ;88AE16;
    STA.B DP_Temp14                                                      ;88AE19;
    LDY.W #$0000                                                         ;88AE1B;
    LDX.W #$0003                                                         ;88AE1E;

  .loopIndirectTable:
    LDA.B DP_Temp12                                                      ;88AE21;
    CMP.W ScrollingSky_ScrollingTable_topPosition,Y                      ;88AE23;
    BMI +                                                                ;88AE26;
    CMP.W ScrollingSky_ScrollingTable_nextEntry,Y                        ;88AE28;
    BMI .scrollingSection                                                ;88AE2B;

+   TYA                                                                  ;88AE2D;
    CLC                                                                  ;88AE2E;
    ADC.W #$0008                                                         ;88AE2F;
    TAY                                                                  ;88AE32;
    CMP.W #$00B8                                                         ;88AE33;
    BMI .loopIndirectTable                                               ;88AE36;
    LDA.W #$05FF                                                         ;88AE38;
    SEC                                                                  ;88AE3B;
    SBC.B DP_Temp12                                                      ;88AE3C;

  .loopNonScrollingSection:
    STA.B DP_Temp18                                                      ;88AE3E;
    CMP.W #$0080                                                         ;88AE40;
    BMI .lessThan80                                                      ;88AE43;
    LDA.W #$007F                                                         ;88AE45;
    STA.L ScrollingSkyBG2XScrollIndirectHDMATable,X                      ;88AE48;
    LDA.W #$00B5                                                         ;88AE4C;
    STA.L ScrollingSkyBG2XScrollIndirectHDMATable+1,X                    ;88AE4F;
    INX                                                                  ;88AE53;
    INX                                                                  ;88AE54;
    INX                                                                  ;88AE55;
    LDA.B DP_Temp18                                                      ;88AE56;
    SEC                                                                  ;88AE58;
    SBC.W #$007F                                                         ;88AE59;
    BRA .loopNonScrollingSection                                         ;88AE5C;

  .lessThan80:
    STA.L ScrollingSkyBG2XScrollIndirectHDMATable,X                      ;88AE5E;
    LDA.W #$00B5                                                         ;88AE62;
    STA.L ScrollingSkyBG2XScrollIndirectHDMATable+1,X                    ;88AE65;
    LDA.W #$0000                                                         ;88AE69;
    STA.L ScrollingSkyBG2XScrollIndirectHDMATable+3,X                    ;88AE6C;
    RTL                                                                  ;88AE70;

  .scrollingSection:
    LDA.W ScrollingSky_ScrollingTable_nextEntry,Y                        ;88AE71;
    SEC                                                                  ;88AE74;
    SBC.B DP_Temp12                                                      ;88AE75;
    STA.B DP_Temp18                                                      ;88AE77;
    CMP.W #$0080                                                         ;88AE79;
    BMI .heightLessThan80                                                ;88AE7C;
    LDA.W #$007F                                                         ;88AE7E;
    STA.L ScrollingSkyBG2XScrollIndirectHDMATable,X                      ;88AE81;
    LDA.W ScrollingSky_ScrollingTable_HDMADataTableEntryPointer,Y        ;88AE85;
    INC                                                                  ;88AE88;
    INC                                                                  ;88AE89;
    STA.L ScrollingSkyBG2XScrollIndirectHDMATable+1,X                    ;88AE8A;
    INX                                                                  ;88AE8E;
    INX                                                                  ;88AE8F;
    INX                                                                  ;88AE90;
    LDA.B DP_Temp18                                                      ;88AE91;
    SEC                                                                  ;88AE93;
    SBC.W #$007F                                                         ;88AE94;

  .heightLessThan80:
    STA.L ScrollingSkyBG2XScrollIndirectHDMATable,X                      ;88AE97;
    LDA.W ScrollingSky_ScrollingTable_HDMADataTableEntryPointer,Y        ;88AE9B;
    CLC                                                                  ;88AE9E;
    ADC.W #$0002                                                         ;88AE9F;
    STA.L ScrollingSkyBG2XScrollIndirectHDMATable+1,X                    ;88AEA2;
    LDA.B DP_Temp18                                                      ;88AEA6;
    CLC                                                                  ;88AEA8;
    ADC.B DP_Temp12                                                      ;88AEA9;
    STA.B DP_Temp12                                                      ;88AEAB;
    INX                                                                  ;88AEAD;
    INX                                                                  ;88AEAE;
    INX                                                                  ;88AEAF;
    LDA.B DP_Temp12                                                      ;88AEB0;
    CMP.B DP_Temp14                                                      ;88AEB2;
    BPL .terminateTable                                                  ;88AEB4;
    JMP.W .loopIndirectTable                                             ;88AEB6;

  .terminateTable:
    LDA.W #$0000                                                         ;88AEB9;
    STA.L ScrollingSkyBG2XScrollIndirectHDMATable+3,X                    ;88AEBC;
    RTL                                                                  ;88AEC0;


ScrollingSky_ScrollingTable:
; Scrolling sky scroll table
;                        ________________ Top position of scrolling section
;                       |     ___________ Scroll subspeed
;                       |    |     ______ Scroll speed
;                       |    |    |     _ Pointer to HDMA data table entry
;                       |    |    |    |
  .topPosition:
    dw $0000                                                             ;88AEC1;
  .scrollSubspeed:
    dw       $8000                                                       ;88AEC3;
  .scrollSpeed:
    dw             $0000                                                 ;88AEC5;
  .HDMADataTableEntryPointer:
    dw                   ScrollingSkyBG2XScrollHDMADataTable             ;88AEC7;
  .nextEntry:
    dw $0010,$C000,$0000,ScrollingSkyBG2XScrollHDMADataTable+4           ;88AEC9;
    dw $0038,$8000,$0000,ScrollingSkyBG2XScrollHDMADataTable+8           ;88AED1;
    dw $00D0,$C000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$C          ;88AED9;
    dw $00E0,$8000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$10         ;88AEE1;
    dw $0120,$C000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$14         ;88AEE9;
    dw $01A0,$8000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$18         ;88AEF1;
    dw $01D8,$C000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$1C         ;88AEF9;
    dw $0238,$8000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$20         ;88AF01;
    dw $0268,$C000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$24         ;88AF09;
    dw $02A0,$8000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$28         ;88AF11;
    dw $02E0,$C000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$20         ;88AF19;
    dw $0300,$8000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$30         ;88AF21;
    dw $0320,$C000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$34         ;88AF29;
    dw $0350,$8000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$38         ;88AF31;
    dw $0378,$C000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$3C         ;88AF39;
    dw $03C8,$8000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$40         ;88AF41;
    dw $0440,$7000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$44         ;88AF49;
    dw $0460,$C000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$48         ;88AF51;
    dw $0480,$8000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$4C         ;88AF59;
    dw $0490,$0000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$50         ;88AF61;
    dw $04A8,$0000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$54         ;88AF69;
    dw $04B8,$0000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$58         ;88AF71;
    dw $0500
; Unused continuation
    dw $0500,$0000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$5C         ;88AF79;
    dw $0578,$0000,$0000,ScrollingSkyBG2XScrollHDMADataTable+$60         ;88AF83;
    dw $05F0                                                             ;88AF8B;


;;; $AF8D: Update scrolling sky land tilemap ;;;
RoomMainASM_ScrollingSkyLand:
    LDA.W #ScrollingSkyLand_ChunkPointers                                ;88AF8D;
    STA.B DP_Temp00                                                      ;88AF90;
    LDA.W #$0088                                                         ;88AF92;
    STA.B DP_Temp02                                                      ;88AF95;
    BRA RoomMainASM_ScrollingSky                                         ;88AF97;


;;; $AF99: Update scrolling sky ocean tilemap ;;;
RoomMainASM_ScrollingSkyOcean:
    LDA.W #ScrollingSkyOcean_ChunkPointesr                               ;88AF99;
    STA.B DP_Temp00                                                      ;88AF9C;
    LDA.W #$0088                                                         ;88AF9E;
    STA.B DP_Temp02                                                      ;88AFA1; fallthrough to RoomMainASM_ScrollingSky


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
    LDA.W TimeIsFrozenFlag                                               ;88AFA3;
    BEQ .timeNotFrozen                                                   ;88AFA6;
    LDA.W #$0000                                                         ;88AFA8;
    STA.L ScrollingSkyBG2XScrollIndirectHDMATable                        ;88AFAB;
    RTL                                                                  ;88AFAF;

  .timeNotFrozen:
    REP #$30                                                             ;88AFB0;
    LDA.W Layer1YPosition                                                ;88AFB2;
    STA.B DP_BG2YScroll                                                  ;88AFB5;
    LDX.W VRAMWriteStack                                                 ;88AFB7;
    LDA.W #$0040                                                         ;88AFBA;
    STA.B VRAMWrite.size,X                                               ;88AFBD;
    STA.B VRAMWrite[1].size,X                                            ;88AFBF;
    STA.B VRAMWrite[2].size,X                                            ;88AFC1;
    STA.B VRAMWrite[3].size,X                                            ;88AFC3;
    LDA.W Layer1YPosition                                                ;88AFC5;
    AND.W #$07F8                                                         ;88AFC8;
    SEC                                                                  ;88AFCB;
    SBC.W #$0010                                                         ;88AFCC;
    PHA                                                                  ;88AFCF;
    AND.W #$FF00                                                         ;88AFD0;
    XBA                                                                  ;88AFD3;
    ASL                                                                  ;88AFD4;
    TAY                                                                  ;88AFD5;
    PLA                                                                  ;88AFD6;
    AND.W #$00FF                                                         ;88AFD7;
    ASL                                                                  ;88AFDA;
    ASL                                                                  ;88AFDB;
    ASL                                                                  ;88AFDC;
    CLC                                                                  ;88AFDD;
    ADC.B [DP_Temp00],Y                                                  ;88AFDE;
    STA.B VRAMWrite.src,X                                                ;88AFE0;
    CLC                                                                  ;88AFE2;
    ADC.W #$0040                                                         ;88AFE3;
    STA.B VRAMWrite[1].src,X                                             ;88AFE6;
    LDA.W Layer1YPosition                                                ;88AFE8;
    AND.W #$07F8                                                         ;88AFEB;
    CLC                                                                  ;88AFEE;
    ADC.W #$00F0                                                         ;88AFEF;
    PHA                                                                  ;88AFF2;
    AND.W #$FF00                                                         ;88AFF3;
    XBA                                                                  ;88AFF6;
    ASL                                                                  ;88AFF7;
    TAY                                                                  ;88AFF8;
    PLA                                                                  ;88AFF9;
    AND.W #$00FF                                                         ;88AFFA;
    ASL                                                                  ;88AFFD;
    ASL                                                                  ;88AFFE;
    ASL                                                                  ;88AFFF;
    CLC                                                                  ;88B000;
    ADC.B [DP_Temp00],Y                                                  ;88B001;
    STA.B VRAMWrite[2].src,X                                             ;88B003;
    CLC                                                                  ;88B005;
    ADC.W #$0040                                                         ;88B006;
    STA.B VRAMWrite[3].src,X                                             ;88B009;
    SEP #$20                                                             ;88B00B;
    LDA.B #$8A                                                           ;88B00D;
    STA.B VRAMWrite.src+2,X                                              ;88B00F;
    STA.B VRAMWrite[1].src+2,X                                           ;88B011;
    STA.B VRAMWrite[2].src+2,X                                           ;88B013;
    STA.B VRAMWrite[3].src+2,X                                           ;88B015;
    REP #$20                                                             ;88B017;
    LDA.B DP_BG2TilemapAddrSize                                          ;88B019;
    AND.W #$00FC                                                         ;88B01B;
    XBA                                                                  ;88B01E;
    STA.B DP_Temp12                                                      ;88B01F;
    LDA.W Layer1YPosition                                                ;88B021;
    SEC                                                                  ;88B024;
    SBC.W #$0010                                                         ;88B025;
    AND.W #$01F8                                                         ;88B028;
    ASL                                                                  ;88B02B;
    ASL                                                                  ;88B02C;
    CLC                                                                  ;88B02D;
    ADC.B DP_Temp12                                                      ;88B02E;
    STA.B VRAMWrite.dest,X                                               ;88B030;
    CLC                                                                  ;88B032;
    ADC.W #$0020                                                         ;88B033;
    STA.B VRAMWrite[1].dest,X                                            ;88B036;
    LDA.W Layer1YPosition                                                ;88B038;
    CLC                                                                  ;88B03B;
    ADC.W #$00F0                                                         ;88B03C;
    AND.W #$01F8                                                         ;88B03F;
    ASL                                                                  ;88B042;
    ASL                                                                  ;88B043;
    CLC                                                                  ;88B044;
    ADC.B DP_Temp12                                                      ;88B045;
    STA.B VRAMWrite[2].dest,X                                            ;88B047;
    CLC                                                                  ;88B049;
    ADC.W #$0020                                                         ;88B04A;
    STA.B VRAMWrite[3].dest,X                                            ;88B04D;
    TXA                                                                  ;88B04F;
    CLC                                                                  ;88B050;
    ADC.W #$001C                                                         ;88B051;
    STA.W VRAMWriteStack                                                 ;88B054;
    RTL                                                                  ;88B057;


;;; $B058: Fireflea flashing shades ;;;
Fireflea_Flashing_Shades:
; Indexed by [fireflea flashing index] * 2
    dw $0000,$0100,$0200,$0300,$0400,$0500,$0600,$0500                   ;88B058;
    dw $0400,$0300,$0200,$0100                                           ;88B068;


;;; $B070: Fireflea darkness shades ;;;
Fireflea_Darkness_Shades:
; Indexed by [fireflea darkness level]
    dw $0000,$0600,$0C00,$1200,$1800,$1900                               ;88B070;


;;; $B07C: FX type 24h: fireflea ;;;
FXType_24_Fireflea:
; This spawns an HDMA object purely for the pre-instruction, which modifies the colour math backdrop colour
; The HDMA doesn't actually do anything
    PHP                                                                  ;88B07C;
    REP #$30                                                             ;88B07D;
    LDA.W #$0006                                                         ;88B07F;
    STA.W FirefleaFlashing_Timer                                         ;88B082;
    STZ.W FirefleaFlashing_Index                                         ;88B085;
    JSL.L Spawn_HDMAObject                                               ;88B088;
    db $42,$11                                                           ;88B08C;
    dw InstList_Fireflea_BG3XScroll_0                                    ;88B08E;
    LDA.W #$0000                                                         ;88B090;
    STA.L DummyHDMATable                                                 ;88B093;
    STZ.W Unused177C                                                     ;88B097;
    STZ.W FirefleaFlashing_DarknessLevel                                 ;88B09A;
    LDA.W #$0018                                                         ;88B09D;
    STA.W Unused1780                                                     ;88B0A0;
    LDA.L Fireflea_Flashing_Shades                                       ;88B0A3;
    STA.W Unused1782                                                     ;88B0A7;
    PLP                                                                  ;88B0AA;
    RTL                                                                  ;88B0AB;


;;; $B0AC: Instruction list - fireflea BG3 X scroll ;;;
InstList_Fireflea_BG3XScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88B0AC;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88B0AF;
    dl PreInstruction_Fireflea_BG3XScroll                                ;88B0B1;

InstList_Fireflea_BG3XScroll_1:
    dw $0001,DummyHDMATable                                              ;88B0B4;
    dw Instruction_HDMAObject_GotoY                                      ;88B0B8;
    dw InstList_Fireflea_BG3XScroll_1                                    ;88B0BA;


;;; $B0BC: Pre-instruction - fireflea BG3 X scroll ;;;
PreInstruction_Fireflea_BG3XScroll:
    PHP                                                                  ;88B0BC;
    REP #$30                                                             ;88B0BD;
    LDA.W LayerBlending_Config                                           ;88B0BF;
    AND.W #$FF00                                                         ;88B0C2;
    ORA.W #$000C                                                         ;88B0C5;
    STA.W LayerBlending_Config                                           ;88B0C8;
    LDA.W TimeIsFrozenFlag                                               ;88B0CB;
    BNE .return                                                          ;88B0CE;
    DEC.W FirefleaFlashing_Timer                                         ;88B0D0;
    BNE .nonZero                                                         ;88B0D3;
    LDA.W #$0006                                                         ;88B0D5;
    STA.W FirefleaFlashing_Timer                                         ;88B0D8;
    LDA.W FirefleaFlashing_DarknessLevel                                 ;88B0DB;
    CMP.W #$000A                                                         ;88B0DE;
    BMI .lessThanA                                                       ;88B0E1;
    LDA.W #$0006                                                         ;88B0E3;
    BRA .storeIndex                                                      ;88B0E6;

  .lessThanA:
    LDA.W FirefleaFlashing_Index                                         ;88B0E8;
    INC                                                                  ;88B0EB;
    CMP.W #$000C                                                         ;88B0EC;
    BCC .storeIndex                                                      ;88B0EF;
    LDA.W #$0000                                                         ;88B0F1;

  .storeIndex:
    STA.W FirefleaFlashing_Index                                         ;88B0F4;

  .nonZero:
    REP #$30                                                             ;88B0F7;
    LDA.W FirefleaFlashing_Index                                         ;88B0F9;
    ASL                                                                  ;88B0FC;
    TAX                                                                  ;88B0FD;
    LDA.L Fireflea_Flashing_Shades,X                                     ;88B0FE;
    LDX.W FirefleaFlashing_DarknessLevel                                 ;88B102;
    CLC                                                                  ;88B105;
    ADC.L Fireflea_Darkness_Shades,X                                     ;88B106;
    XBA                                                                  ;88B10A;
    TAX                                                                  ;88B10B;
    SEP #$30                                                             ;88B10C;
    ORA.B #$80                                                           ;88B10E;
    STA.B DP_ColorMathSubScreenBackdropColor1                            ;88B110;
    TXA                                                                  ;88B112;
    ORA.B #$40                                                           ;88B113;
    STA.B DP_ColorMathSubScreenBackdropColor2                            ;88B115;
    TXA                                                                  ;88B117;
    ORA.B #$20                                                           ;88B118;
    STA.B DP_ColorMathSubScreenBackdropColor0                            ;88B11A;

  .return:
    PLP                                                                  ;88B11C;
    RTL                                                                  ;88B11D;


if !FEATURE_KEEP_UNREFERENCED
;;; $B11E: Unused. Spawn expanding and contracting effect HDMA object ;;;
UNUSED_Spawn_ExpandingContractingEffect_HDMAObject_88B11E:
; Causes an expanding and contracting effect, see "expanding message box.asm"
; The RAM used here is the same as used for the message box animation,
; usage looks similar too (HDMA table of $85:8363, $05A2..A7 of $85:82B8),
; so this is not unlikely an early version of the message box animation
    PHP                                                                  ;88B11E;
    REP #$30                                                             ;88B11F;
    STZ.W ContractingFlag                                                ;88B121;
    STZ.W ExpandContract_HDMATableUpdateCounter                          ;88B124;
    LDA.W #$0080                                                         ;88B127;
    STA.W ExpandContract_DestTop                                         ;88B12A;
    STA.W ExpandContract_SrcTop                                          ;88B12D;
    LDA.W #$007F                                                         ;88B130;
    STA.W ExpandContract_DestBottom                                      ;88B133;
    STA.W ExpandContract_SrcBottom                                       ;88B136;
    LDA.W #$2000                                                         ;88B139;
    STA.W ExpandContract_ExpansionFactor                                 ;88B13C;
    LDA.W #$00FF                                                         ;88B13F;
    STA.L ExpandingContractingEffectBG2YScrollIndirectHDMATable          ;88B142;
    LDA.W #ExpandingContractingEffectBG2YScrollIndirectHDMADataTable     ;88B146;
    STA.L ExpandingContractingEffectBG2YScrollIndirectHDMATable+1        ;88B149;
    LDA.W #$00E1                                                         ;88B14D;
    STA.L ExpandingContractingEffectBG2YScrollIndirectHDMATable+3        ;88B150;
    LDA.W #ExpandingContractingEffectBG2YScrollIndirectHDMADataTable+$FE ;88B154;
    STA.L ExpandingContractingEffectBG2YScrollIndirectHDMATable+4        ;88B157;
    LDA.W #$0000                                                         ;88B15B;
    STA.L ExpandingContractingEffectBG2YScrollIndirectHDMATable+6        ;88B15E;
    JSL.L Spawn_HDMAObject                                               ;88B162;
    db $42,$10                                                           ;88B166;
    dw InstList_ExpandingContractingEffect_BG2YScroll_0                  ;88B168;
    PLP                                                                  ;88B16A;
    RTL                                                                  ;88B16B;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B16C: Instruction list - expanding and contracting effect BG2 Y scroll ;;;
InstList_ExpandingContractingEffect_BG2YScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88B16C;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88B16F;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88B172;
    dl PreInstruction_ExpandingContractingEffect_BG2YScroll              ;88B174;

InstList_ExpandingContractingEffect_BG2YScroll_1:
    dw $7777,ExpandingContractingEffectBG2YScrollIndirectHDMATable       ;88B177;
    dw Instruction_HDMAObject_GotoY                                      ;88B17B;
    dw InstList_ExpandingContractingEffect_BG2YScroll_1                  ;88B17D;


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
    PHP                                                                  ;88B17F;
    REP #$30                                                             ;88B180;
    INC.W ExpandContract_HDMATableUpdateCounter                          ;88B182;
    LDA.W ExpandContract_HDMATableUpdateCounter                          ;88B185;
    CMP.W #$0004                                                         ;88B188;
    BMI .counterLessThan4                                                ;88B18B;
    STZ.W ExpandContract_HDMATableUpdateCounter                          ;88B18D;
    LDA.W ContractingFlag                                                ;88B190;
    BEQ .expanding                                                       ;88B193;
    LDA.W ExpandContract_ExpansionFactor                                 ;88B195;
    SEC                                                                  ;88B198;
    SBC.W #$0400                                                         ;88B199;
    STA.W ExpandContract_ExpansionFactor                                 ;88B19C;
    CMP.W #$2000                                                         ;88B19F;
    BPL +                                                                ;88B1A2;
    LDA.W #$2000                                                         ;88B1A4;
    STA.W ExpandContract_ExpansionFactor                                 ;88B1A7;
    STZ.W ContractingFlag                                                ;88B1AA;
    BRA +                                                                ;88B1AD;

  .expanding:
    LDA.W ExpandContract_ExpansionFactor                                 ;88B1AF;
    CLC                                                                  ;88B1B2;
    ADC.W #$0400                                                         ;88B1B3;
    STA.W ExpandContract_ExpansionFactor                                 ;88B1B6;
    CMP.W #$8000                                                         ;88B1B9;
    BMI +                                                                ;88B1BC;
    INC.W ContractingFlag                                                ;88B1BE;

+   LDA.W #$0080                                                         ;88B1C1;
    STA.W ExpandContract_DestTop                                         ;88B1C4;
    STA.W ExpandContract_SrcTop                                          ;88B1C7;
    LDA.W #$007F                                                         ;88B1CA;
    STA.W ExpandContract_DestBottom                                      ;88B1CD;
    STA.W ExpandContract_SrcBottom                                       ;88B1D0;

  .counterLessThan4:
    LDA.W ExpandContract_DestTop                                         ;88B1D3;
    ASL                                                                  ;88B1D6;
    TAX                                                                  ;88B1D7;
    LDA.W ExpandContract_DestBottom                                      ;88B1D8;
    ASL                                                                  ;88B1DB;
    TAY                                                                  ;88B1DC;
    STZ.B DP_Temp12                                                      ;88B1DD;
    LDA.W #$0020                                                         ;88B1DF;
    STA.B DP_Temp14                                                      ;88B1E2;

  .loop:
    LDA.W ExpandContract_SrcTop                                          ;88B1E4;
    SEC                                                                  ;88B1E7;
    SBC.W ExpandContract_DestTop                                         ;88B1E8;
    STA.L ExpandingContractingEffectBG2YScrollIndirectHDMADataTable,X    ;88B1EB;
    PHX                                                                  ;88B1EF;
    TYX                                                                  ;88B1F0;
    LDA.W ExpandContract_SrcBottom                                       ;88B1F1;
    SEC                                                                  ;88B1F4;
    SBC.W ExpandContract_DestBottom                                      ;88B1F5;
    STA.L ExpandingContractingEffectBG2YScrollIndirectHDMADataTable,X    ;88B1F8;
    PLX                                                                  ;88B1FC;
    LDA.B DP_Temp12                                                      ;88B1FD;
    CLC                                                                  ;88B1FF;
    ADC.W ExpandContract_ExpansionFactor                                 ;88B200;
    STA.B DP_Temp12                                                      ;88B203;
    BVS +                                                                ;88B205;
    INC.W ExpandContract_SrcTop                                          ;88B207;
    DEC.W ExpandContract_SrcBottom                                       ;88B20A;

+   INC.W ExpandContract_DestTop                                         ;88B20D;
    DEC.W ExpandContract_DestBottom                                      ;88B210;
    DEY                                                                  ;88B213;
    DEY                                                                  ;88B214;
    INX                                                                  ;88B215;
    INX                                                                  ;88B216;
    DEC.B DP_Temp14                                                      ;88B217;
    BNE .loop                                                            ;88B219;
    PLP                                                                  ;88B21B;
    RTL                                                                  ;88B21C;


;;; $B21D: Handle earthquake sound effect ;;;
Handle_Earthquake_SoundEffect:
; For lavaquake and Tourian entrance reveal
    PHX                                                                  ;88B21D;
    PHY                                                                  ;88B21E;
    PHP                                                                  ;88B21F;
    REP #$30                                                             ;88B220;
    LDA.W EarthquakeSFX_Timer                                            ;88B222;
    BMI .return                                                          ;88B225;
    DEC                                                                  ;88B227;
    STA.W EarthquakeSFX_Timer                                            ;88B228;
    BPL .return                                                          ;88B22B;
    LDX.W EarthquakeSFX_Index                                            ;88B22D;
    LDA.W .soundIndex,X                                                  ;88B230;
    BPL .quake                                                           ;88B233;
    LDX.W #$0000                                                         ;88B235;
    LDA.W .soundIndex,X                                                  ;88B238;

  .quake:
    JSL.L QueueSound_Lib2_Max6                                           ;88B23B;
    LDA.W RandomNumberSeed                                               ;88B23F;
    AND.W #$0003                                                         ;88B242;
    ADC.W .baseTimer,X                                                   ;88B245;
    STA.W EarthquakeSFX_Timer                                            ;88B248;
    INX                                                                  ;88B24B;
    INX                                                                  ;88B24C;
    INX                                                                  ;88B24D;
    INX                                                                  ;88B24E;
    STX.W EarthquakeSFX_Index                                            ;88B24F;

  .return:
    PLP                                                                  ;88B252;
    PLY                                                                  ;88B253;
    PLX                                                                  ;88B254;
    RTS                                                                  ;88B255;

;        _________ Sound index (sound library 2)
;       |      ___ Base timer
;       |     |
  .soundIndex:
    dw $0046                                                             ;88B256;
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
    RTL                                                                  ;88B278;


;;; $B279: FX type 2: lava ;;;
FXType_2_Lava:
    LDA.W #FXRisingFunction_LavaAcid_Normal                              ;88B279;
    STA.W FX_RisingFunction                                              ;88B27C;
    LDA.W FX_BaseYPosition                                               ;88B27F;
    STA.W FX_LavaAcidYPosition                                           ;88B282;
    JSL.L Spawn_HDMAObject                                               ;88B285;
    db $42,$12                                                           ;88B289;
    dw InstList_LavaAcidBG3_Yscroll                                      ;88B28B;
    JSL.L Spawn_HDMAObject                                               ;88B28D;
    db $42,$10                                                           ;88B291;
    dw InstList_LavaAcidBG2_Yscroll                                      ;88B293;
    JSL.L Spawn_BG3_Scroll_HDMA_Object                                   ;88B295;
    LDY.W #AnimatedTilesObject_Lava                                      ;88B299;
    JSL.L Spawn_AnimatedTilesObject                                      ;88B29C;
    RTL                                                                  ;88B2A0;


;;; $B2A1: FX type 4: acid ;;;
FXType_4_Acid:
    LDA.W #FXRisingFunction_LavaAcid_Normal                              ;88B2A1;
    STA.W FX_RisingFunction                                              ;88B2A4;
    LDA.W FX_BaseYPosition                                               ;88B2A7;
    STA.W FX_LavaAcidYPosition                                           ;88B2AA;
    JSL.L Spawn_HDMAObject                                               ;88B2AD;
    db $42,$12                                                           ;88B2B1;
    dw InstList_LavaAcidBG3_Yscroll                                      ;88B2B3;
    JSL.L Spawn_HDMAObject                                               ;88B2B5;
    db $42,$10                                                           ;88B2B9;
    dw InstList_LavaAcidBG2_Yscroll                                      ;88B2BB;
    JSL.L Spawn_BG3_Scroll_HDMA_Object                                   ;88B2BD;
    LDY.W #AnimatedTilesObject_Acid                                      ;88B2C1;
    JSL.L Spawn_AnimatedTilesObject                                      ;88B2C4;
    RTL                                                                  ;88B2C8;


;;; $B2C9: Handle tide ;;;
Handle_Tide:
    BIT.W FX_YVelocity                                                   ;88B2C9;
    BMI .smallTide                                                       ;88B2CC;
    BVS .bigTide                                                         ;88B2CE;
    RTS                                                                  ;88B2D0;

  .smallTide:
    STZ.W FX_YSubOffset                                                  ;88B2D1;
    STZ.W FX_YOffset                                                     ;88B2D4;
    LDA.W FX_TidePhase+1                                                 ;88B2D7;
    AND.W #$00FF                                                         ;88B2DA;
    ASL                                                                  ;88B2DD;
    TAX                                                                  ;88B2DE;
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X                 ;88B2DF;
    ASL                                                                  ;88B2E3;
    ASL                                                                  ;88B2E4;
    ASL                                                                  ;88B2E5;
    BPL +                                                                ;88B2E6;
    DEC.W FX_YOffset                                                     ;88B2E8;

+   STA.W FX_YSubOffset+1                                                ;88B2EB;
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X                 ;88B2EE;
    BPL .smallBelowMidpoint                                              ;88B2F2;
    LDA.W FX_TidePhase                                                   ;88B2F4;
    CLC                                                                  ;88B2F7;
    ADC.W #$00C0                                                         ;88B2F8;
    BRA .returnSmallTide                                                 ;88B2FB;

  .smallBelowMidpoint:
    LDA.W FX_TidePhase                                                   ;88B2FD;
    CLC                                                                  ;88B300;
    ADC.W #$0120                                                         ;88B301;

  .returnSmallTide:
    STA.W FX_TidePhase                                                   ;88B304;
    RTS                                                                  ;88B307;

  .bigTide:
    STZ.W FX_YSubOffset                                                  ;88B308;
    STZ.W FX_YOffset                                                     ;88B30B;
    LDA.W FX_TidePhase+1                                                 ;88B30E;
    AND.W #$00FF                                                         ;88B311;
    ASL                                                                  ;88B314;
    TAX                                                                  ;88B315;
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X                 ;88B316;
    ASL                                                                  ;88B31A;
    ASL                                                                  ;88B31B;
    ASL                                                                  ;88B31C;
    ASL                                                                  ;88B31D;
    ASL                                                                  ;88B31E;
    BPL +                                                                ;88B31F;
    DEC.W FX_YOffset                                                     ;88B321;

+   STA.W FX_YSubOffset+1                                                ;88B324;
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X                 ;88B327;
    BPL .bigBelowMidpoint                                                ;88B32B;
    LDA.W FX_TidePhase                                                   ;88B32D;
    CLC                                                                  ;88B330;
    ADC.W #$0080                                                         ;88B331;
    BRA .returnBigTide                                                   ;88B334;

  .bigBelowMidpoint:
    LDA.W FX_TidePhase                                                   ;88B336;
    CLC                                                                  ;88B339;
    ADC.W #$00E0                                                         ;88B33A;

  .returnBigTide:
    STA.W FX_TidePhase                                                   ;88B33D;
    RTS                                                                  ;88B340;


;;; $B341: RTS ;;;
RTS_88B341:
    RTS                                                                  ;88B341;


;;; $B342: RTS ;;;
RTS_88B342:
    RTS                                                                  ;88B342;


;;; $B343: FX rising function - lava/acid - normal ;;;
FXRisingFunction_LavaAcid_Normal:
    LDA.W FX_YSubVelocity                                                ;88B343;
    BEQ .return3                                                         ;88B346;
    BMI .negative                                                        ;88B348;
    LDA.W FX_TargetYPosition                                             ;88B34A;
    CMP.W FX_BaseYPosition                                               ;88B34D;
    BEQ .return1                                                         ;88B350;
    BCS .doRise                                                          ;88B352;

  .return1:
    RTS                                                                  ;88B354;

  .negative:
    LDA.W FX_TargetYPosition                                             ;88B355;
    CMP.W FX_BaseYPosition                                               ;88B358;
    BEQ .return2                                                         ;88B35B;
    BCC .doRise                                                          ;88B35D;

  .return2:
    RTS                                                                  ;88B35F;

  .doRise:
    LDA.W #FXRisingFunction_LavaAcid_WaitToRise                          ;88B360;
    STA.W FX_RisingFunction                                              ;88B363;

  .return3:
    RTS                                                                  ;88B366;


;;; $B367: FX rising function - lava/acid - wait to rise ;;;
FXRisingFunction_LavaAcid_WaitToRise:
    JSR.W Handle_Earthquake_SoundEffect                                  ;88B367;
    LDA.W #$0015                                                         ;88B36A;
    STA.W EarthquakeType                                                 ;88B36D;
    LDA.W #$0020                                                         ;88B370;
    TSB.W EarthquakeTimer                                                ;88B373;
    DEC.W FX_Timer                                                       ;88B376;
    BNE .return                                                          ;88B379;
    LDA.W #FXRisingFunction_LavaAcid_Rising                              ;88B37B;
    STA.W FX_RisingFunction                                              ;88B37E;

  .return:
    RTS                                                                  ;88B381;


;;; $B382: FX rising function - lava/acid - rising ;;;
FXRisingFunction_LavaAcid_Rising:
    JSR.W Handle_Earthquake_SoundEffect                                  ;88B382;
    LDA.W #$0015                                                         ;88B385;
    STA.W EarthquakeType                                                 ;88B388;
    LDA.W #$0020                                                         ;88B38B;
    TSB.W EarthquakeTimer                                                ;88B38E;
    JSR.W RaiseOrLower_FX                                                ;88B391;
    BCS .reachedTarget                                                   ;88B394;
    RTS                                                                  ;88B396;

  .reachedTarget:
    STZ.W FX_YSubVelocity                                                ;88B397;
    LDA.W #FXRisingFunction_LavaAcid_Normal                              ;88B39A;
    STA.W FX_RisingFunction                                              ;88B39D;
    RTS                                                                  ;88B3A0;


;;; $B3A1: Lava sound effects ;;;
Lava_SoundEffects:
; Sound library 2. Chosen randomly from the following
    db $12,$13,$14,$12,$13,$14,$12,$13                                   ;88B3A1;


;;; $B3A9: Instruction - lava sound timer = 70h ;;;
Instruction_LavaSoundTimer_70:
;; Parameters:
;;     X: HDMA object index
    LDA.W #$0070                                                         ;88B3A9;
    STA.W HDMAObject_Var2,X                                              ;88B3AC;
    RTS                                                                  ;88B3AF;


;;; $B3B0: Pre-instruction - lava/acid BG3 Y scroll ;;;
PreInstruction_LavaAcid_BG3YScroll:
; For on-screen lava/acid,
; the calculation 200h - [A] at .merge2 is equivalent to 100h + (Y position of screen on lava/acid)
; (100h is the offset of lava/acid in the BG3 tilemap)

; As far as I can tell, the HDMA done here is completely pointless and a big waste of time and space
; I suspect that lava/acid was a copy+paste job from water FX, and this BG3 HDMA is a leftover by-product
; The HDMA set up here writes the zero BG3 Y scroll on every scanline up until 8 pixels above the FX tilemap starts,
; and then writes the calculated LavaAcidBG3YScrollHDMADataTable+2 BG3 Y scroll for the remaining scanlines
; But there's (more than) a full screen of transparent padding before the FX tilemap, so this is completely unnecessary
; It would be sufficient to set BG3YPosition instead of LavaAcidBG3YScrollHDMADataTable+2 at .merge to set the BG3 Y position via *the* BG3 scroll HDMA object
    PHB                                                                  ;88B3B0;
    LDA.W LayerBlending_Layer3Config                                     ;88B3B1;
    STA.W LayerBlending_Config                                           ;88B3B4;
    LDA.W TimeIsFrozenFlag                                               ;88B3B7;
    BEQ .timeNotFrozen                                                   ;88B3BA;
    PLB                                                                  ;88B3BC;
    RTL                                                                  ;88B3BD;

  .timeNotFrozen:
    REP #$30                                                             ;88B3BE;
    PEA.W .manualReturn-1                                                ;88B3C0;
    JMP.W (FX_RisingFunction)                                            ;88B3C3;

  .manualReturn:
    JSR.W Handle_Tide                                                    ;88B3C6;
    SEP #$10                                                             ;88B3C9;
    LDA.W FX_BaseYSubPosition                                            ;88B3CB;
    CLC                                                                  ;88B3CE;
    ADC.W FX_YSubOffset                                                  ;88B3CF;
    STA.W FX_LavaAcidYSubPosition                                        ;88B3D2;
    LDA.W FX_BaseYPosition                                               ;88B3D5;
    ADC.W FX_YOffset                                                     ;88B3D8;
    STA.W FX_LavaAcidYPosition                                           ;88B3DB;
    LDA.B DP_BG1XScroll                                                  ;88B3DE;
    STA.L BG3XPosition                                                   ;88B3E0;
    LDA.W #$0000                                                         ;88B3E4;
    STA.L LavaAcidBG3YScrollHDMADataTable                                ;88B3E7;
    LDA.W #$0000                                                         ;88B3EB;
    STA.L BG3YPosition                                                   ;88B3EE;
    LDA.W FX_LavaAcidYPosition                                           ;88B3F2;
    BMI .offScreen                                                       ;88B3F5;
    SEC                                                                  ;88B3F7;
    SBC.W Layer1YPosition                                                ;88B3F8;
    BEQ +                                                                ;88B3FB;
    BPL .positive                                                        ;88B3FD;

+   EOR.W #$001F                                                         ;88B3FF;
    AND.W #$001F                                                         ;88B402;
    ORA.W #$0100                                                         ;88B405;
    BRA .merge                                                           ;88B408;

  .positive:
    CMP.W #$0100                                                         ;88B40A;
    BCC .onScreen                                                        ;88B40D;

  .offScreen:
    LDA.W #$0000                                                         ;88B40F;
    BRA .merge                                                           ;88B412;

  .onScreen:
    EOR.W #$00FF                                                         ;88B414;
    AND.W #$00FF                                                         ;88B417;

  .merge:
    STA.L LavaAcidBG3YScrollHDMADataTable+2                              ;88B41A;
    LDX.W HDMAObject_Index                                               ;88B41E;
    LDA.W FX_Type                                                        ;88B421;
    CMP.W #$0002                                                         ;88B424;
    BNE +                                                                ;88B427;
    LDA.W FX_LavaAcidYPosition                                           ;88B429;
    BMI +                                                                ;88B42C;
    DEC.W HDMAObject_Var2,X                                              ;88B42E;
    BNE +                                                                ;88B431;
    LDA.W #$0070                                                         ;88B433;
    STA.W HDMAObject_Var2,X                                              ;88B436;
    LDA.W RandomNumberSeed                                               ;88B439;
    AND.W #$0007                                                         ;88B43C;
    TAY                                                                  ;88B43F;
    LDA.W Lava_SoundEffects,Y                                            ;88B440;
    AND.W #$00FF                                                         ;88B443;
    JSL.L QueueSound_Lib2_Max6                                           ;88B446;

+   LDA.W RandomNumberSeed                                               ;88B44A;
    XBA                                                                  ;88B44D;
    STA.W RandomNumberSeed                                               ;88B44E;
    LDX.W HDMAObject_Index                                               ;88B451;
    LDA.W HDMAObject_ChannelIndicesBanks,X                               ;88B454;
    AND.W #$00FF                                                         ;88B457;
    TAY                                                                  ;88B45A;
    LDA.W FX_LavaAcidYPosition                                           ;88B45B;
    BMI .negative                                                        ;88B45E;
    SEC                                                                  ;88B460;
    SBC.W Layer1YPosition                                                ;88B461;
    CLC                                                                  ;88B464;
    ADC.W #$0100                                                         ;88B465;
    BPL +                                                                ;88B468;
    LDA.W #$00FF                                                         ;88B46A;
    BRA .merge2                                                          ;88B46D;

+   CMP.W #$0200                                                         ;88B46F;
    BCC .merge2                                                          ;88B472;

  .negative:
    LDA.W #$01FF                                                         ;88B474;

  .merge2:
    EOR.W #$01FF                                                         ;88B477;
    INC                                                                  ;88B47A;
    AND.W #$03FF                                                         ;88B47B;
    STA.B DP_Temp12                                                      ;88B47E;
    LDA.B DP_Temp12                                                      ;88B480; >.<
    ASL                                                                  ;88B482;
    CLC                                                                  ;88B483;
    ADC.B DP_Temp12                                                      ;88B484;
    ADC.W #IndirectHDMATable_LavaAcid_BG3Yscroll                         ;88B486;
    STA.W HDMAObject_TablePointers,X                                     ;88B489;
    PLB                                                                  ;88B48C;
    RTL                                                                  ;88B48D;


if !FEATURE_KEEP_UNREFERENCED
;;; $B48E: Unused ;;;
UNUSED_WaveDisplacementTable_88B48E:
; Wave displacement table. Same as the data at Setup_LavaAcid_BG2YScrollDataTable_VerticallyWavy_waveDisplacementTable
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000                   ;88B48E;
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000                   ;88B49E;
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000                   ;88B4AE;
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000                   ;88B4BE;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B4CE: Instruction - HDMA object phase decrease timer = 1 ;;;
Instruction_HDMAObject_PhaseDecreaseTimer_1:
;; Parameters:
;;     X: HDMA object index
    LDA.W #$0001                                                         ;88B4CE;
    STA.W HDMAObject_Var1,X                                              ;88B4D1;
    RTS                                                                  ;88B4D4;


;;; $B4D5: Pre-instruction - lava/acid BG2 Y scroll ;;;
PreInstruction_LavaAcid_BG2YScroll:
    PHB                                                                  ;88B4D5;
    LDA.B DP_BG2YScroll                                                  ;88B4D6;
    STA.L LavaAcidBG2YScrollHDMADataTable-2                              ;88B4D8;
    LDA.W TimeIsFrozenFlag                                               ;88B4DC;
    BNE .timeNotFrozen                                                   ;88B4DF;
    LDA.W FX_LiquidOptions                                               ;88B4E1;
    BIT.W #$0006                                                         ;88B4E4;
    BNE .wavy                                                            ;88B4E7;

  .timeNotFrozen:
    LDX.W HDMAObject_Index                                               ;88B4E9;
    JSR.W Setup_LavaAcid_BG2YScrollDataTable_NotWavy                     ;88B4EC;
    BRA .merge                                                           ;88B4EF;

  .wavy:
    BIT.W #$0002                                                         ;88B4F1;
    BNE .verticallyWavy                                                  ;88B4F4;
    LDX.W HDMAObject_Index                                               ;88B4F6;
    JSR.W Setup_LavaAcid_BG2YScrollDataTable_HorizontallyWavy            ;88B4F9;
    BRA .merge                                                           ;88B4FC;

  .verticallyWavy:
    LDX.W HDMAObject_Index                                               ;88B4FE;
    JSR.W Setup_LavaAcid_BG2YScrollDataTable_VerticallyWavy              ;88B501;

  .merge:
    LDX.W HDMAObject_Index                                               ;88B504;
    LDA.B DP_BG2YScroll                                                  ;88B507;
    AND.W #$000F                                                         ;88B509;
    STA.B DP_Temp12                                                      ;88B50C;
    LDA.B DP_Temp12                                                      ;88B50E;
    ASL                                                                  ;88B510;
    CLC                                                                  ;88B511;
    ADC.B DP_Temp12                                                      ;88B512;
    CLC                                                                  ;88B514;
    ADC.W #IndirectHDMATable_LavaAcidBG2_Yscroll                         ;88B515;
    STA.W HDMAObject_TablePointers,X                                     ;88B518;
    PLB                                                                  ;88B51B;
    RTL                                                                  ;88B51C;


;;; $B51D: Set up lava/acid BG2 Y scroll data table - not wavy ;;;
Setup_LavaAcid_BG2YScrollDataTable_NotWavy:
;; Parameters:
;;     X: HDMA object index
    SEP #$20                                                             ;88B51D;
    LDY.W HDMAObject_ChannelIndicesBanks,X                               ;88B51F;
    LDA.B #$10                                                           ;88B522;
    STA.W $4301,Y                                                        ;88B524;
    REP #$20                                                             ;88B527;
    PHX                                                                  ;88B529;
    LDX.B #$1E                                                           ;88B52A;
    LDA.B DP_BG2YScroll                                                  ;88B52C;
    AND.W #$01FF                                                         ;88B52E;

  .loop:
    STA.L LavaAcidBG2YScrollHDMADataTable,X                              ;88B531;
    DEX                                                                  ;88B535;
    DEX                                                                  ;88B536;
    BPL .loop                                                            ;88B537;
    PLX                                                                  ;88B539;
    RTS                                                                  ;88B53A;


;;; $B53B: Set up lava/acid BG2 Y scroll data table - horizontally wavy ;;;
Setup_LavaAcid_BG2YScrollDataTable_HorizontallyWavy:
;; Parameters:
;;     X: HDMA object index

; OK so this is suddenly now BG2 *X* scroll here, but this effect is never used in vanilla, so I'm not changing the name
    SEP #$20                                                             ;88B53B;
    LDY.W HDMAObject_ChannelIndicesBanks,X                               ;88B53D;
    LDA.B #$0F                                                           ;88B540;
    STA.W $4301,Y                                                        ;88B542;
    REP #$20                                                             ;88B545;
    DEC.W HDMAObject_Var1,X                                              ;88B547;
    BNE .nonZeroTimer                                                    ;88B54A;
    LDA.W #$0006                                                         ;88B54C;
    STA.W HDMAObject_Var1,X                                              ;88B54F;
    LDA.W HDMAObject_Var0,X                                              ;88B552;
    DEC                                                                  ;88B555;
    DEC                                                                  ;88B556;
    AND.W #$001E                                                         ;88B557;
    STA.W HDMAObject_Var0,X                                              ;88B55A;

  .nonZeroTimer:
    PHX                                                                  ;88B55D;
    LDY.W HDMAObject_Var0,X                                              ;88B55E;
    LDX.B #$1E                                                           ;88B561;
    LDA.W #$000F                                                         ;88B563;
    STA.B DP_Temp12                                                      ;88B566;

  .loop:
    LDA.B DP_BG2XScroll                                                  ;88B568;
    CLC                                                                  ;88B56A;
    ADC.W .waveDisplacementTable,Y                                       ;88B56B;
    AND.W #$01FF                                                         ;88B56E;
    STA.L LavaAcidBG2YScrollHDMADataTable,X                              ;88B571;
    TYA                                                                  ;88B575;
    DEC                                                                  ;88B576;
    DEC                                                                  ;88B577;
    AND.W #$001E                                                         ;88B578;
    TAY                                                                  ;88B57B;
    TXA                                                                  ;88B57C;
    DEC                                                                  ;88B57D;
    DEC                                                                  ;88B57E;
    AND.W #$001E                                                         ;88B57F;
    TAX                                                                  ;88B582;
    DEC.B DP_Temp12                                                      ;88B583;
    BPL .loop                                                            ;88B585;
    PLX                                                                  ;88B587;
    RTS                                                                  ;88B588;

  .waveDisplacementTable:
    dw $0000,$0000,$0001,$0001,$0001,$0001,$0000,$0000                   ;88B589;
    dw $FFFF,$FFFF,$FFFF,$FFFF,$0000,$0000,$0000,$0000                   ;88B599;


;;; $B5A9: Set up lava/acid BG2 Y scroll data table - vertically wavy ;;;
Setup_LavaAcid_BG2YScrollDataTable_VerticallyWavy:
;; Parameters:
;;     X: HDMA object index
    SEP #$20                                                             ;88B5A9;
    LDY.W HDMAObject_ChannelIndicesBanks,X                               ;88B5AB;
    LDA.B #$10                                                           ;88B5AE;
    STA.W $4301,Y                                                        ;88B5B0;
    REP #$20                                                             ;88B5B3;
    DEC.W HDMAObject_Var1,X                                              ;88B5B5;
    BNE .nonZeroTimer                                                    ;88B5B8;
    LDA.W #$0004                                                         ;88B5BA;
    STA.W HDMAObject_Var1,X                                              ;88B5BD;
    LDA.W HDMAObject_Var0,X                                              ;88B5C0;
    DEC                                                                  ;88B5C3;
    DEC                                                                  ;88B5C4;
    AND.W #$001E                                                         ;88B5C5;
    STA.W HDMAObject_Var0,X                                              ;88B5C8;

  .nonZeroTimer:
    PHX                                                                  ;88B5CB;
    LDA.B DP_BG2YScroll                                                  ;88B5CC;
    AND.W #$000F                                                         ;88B5CE;
    ASL                                                                  ;88B5D1;
    PHA                                                                  ;88B5D2;
    CLC                                                                  ;88B5D3;
    ADC.W HDMAObject_Var0,X                                              ;88B5D4;
    AND.W #$001E                                                         ;88B5D7;
    TAY                                                                  ;88B5DA;
    PLA                                                                  ;88B5DB;
    CLC                                                                  ;88B5DC;
    ADC.W #$001E                                                         ;88B5DD;
    AND.W #$001E                                                         ;88B5E0;
    TAX                                                                  ;88B5E3;
    LDA.W #$000F                                                         ;88B5E4;
    STA.B DP_Temp12                                                      ;88B5E7;

  .loop:
    LDA.B DP_BG2YScroll                                                  ;88B5E9;
    CLC                                                                  ;88B5EB;
    ADC.W .waveDisplacementTable,Y                                       ;88B5EC;
    AND.W #$01FF                                                         ;88B5EF;
    STA.L LavaAcidBG2YScrollHDMADataTable,X                              ;88B5F2;
    TXA                                                                  ;88B5F6;
    DEC                                                                  ;88B5F7;
    DEC                                                                  ;88B5F8;
    AND.W #$001E                                                         ;88B5F9;
    TAX                                                                  ;88B5FC;
    TYA                                                                  ;88B5FD;
    DEC                                                                  ;88B5FE;
    DEC                                                                  ;88B5FF;
    AND.W #$001E                                                         ;88B600;
    TAY                                                                  ;88B603;
    DEC.B DP_Temp12                                                      ;88B604;
    BPL .loop                                                            ;88B606;
    PLX                                                                  ;88B608;
    RTS                                                                  ;88B609;

  .waveDisplacementTable:
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000                   ;88B60A;
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000                   ;88B61A;


;;; $B62A: Indirect HDMA table - lava/acid BG3 Y scroll ;;;
IndirectHDMATable_LavaAcid_BG3Yscroll:
; 81h,$9C00 x F0h
; 81h,$9C02 x 190h
; 60h,$9C02 x 2
; 0

; Disregarding the unnecessary nature of the lava/acid BG3 Y scroll HDMA (see $B3B0), this table is needlessly large
; There's no reason to have more than E0h scanlines of $9C02 (even less if the HUD is accounted for)
    db $81 : dw LavaAcidBG3YScrollHDMADataTable                          ;88B62A;
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
    db $81 : dw LavaAcidBG2YScrollHDMADataTable-2                                                    ;88BDB1;
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
    db $81 : dw LavaAcidBG2YScrollHDMADataTable                                                    ;88C0B1;
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
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88C3E1;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88C3E4;
    dw Instruction_LavaSoundTimer_70                                     ;88C3E7;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88C3E9;
    dl PreInstruction_LavaAcid_BG3YScroll                                ;88C3EB;
    dw Instruction_HDMAObject_Sleep                                      ;88C3EE;


;;; $C3F0: Instruction list - lava/acid BG2 Y scroll ;;;
InstList_LavaAcidBG2_Yscroll:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88C3F0;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88C3F3;
    dw Instruction_HDMAObject_PhaseDecreaseTimer_1                       ;88C3F6;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88C3F8;
    dl PreInstruction_LavaAcid_BG2YScroll                                ;88C3FA;
    dw Instruction_HDMAObject_Sleep                                      ;88C3FD;


;;; $C3FF: FX type 6: water ;;;
FXType_6_Water:
    LDA.W #FXRisingFunction_Water_Normal                                 ;88C3FF;
    STA.W FX_RisingFunction                                              ;88C402;
    LDA.W FX_BaseYPosition                                               ;88C405;
    STA.W FX_YPosition                                                   ;88C408;
    JSL.L Spawn_HDMAObject                                               ;88C40B;
    db $42,$11                                                           ;88C40F;
    dw InstList_Water_BG3_Xscroll                                        ;88C411;
    LDA.W FX_LiquidOptions                                               ;88C413;
    AND.W #$0002                                                         ;88C416;
    BEQ .notWavy                                                         ;88C419;
    JSL.L Spawn_HDMAObject                                               ;88C41B;
    db $42,$0F                                                           ;88C41F;
    dw InstList_Water_BG2_Xscroll                                        ;88C421;

  .notWavy:
    JSL.L Spawn_BG3_Scroll_HDMA_Object                                   ;88C423;
    RTL                                                                  ;88C427;


;;; $C428: FX rising function - water - normal ;;;
FXRisingFunction_Water_Normal:
    LDA.W FX_YSubVelocity                                                ;88C428;
    BEQ .return3                                                         ;88C42B;
    BMI .negative                                                        ;88C42D;
    LDA.W FX_TargetYPosition                                             ;88C42F;
    CMP.W FX_BaseYPosition                                               ;88C432;
    BEQ .return1                                                         ;88C435;
    BCS .doRise                                                          ;88C437;

  .return1:
    RTS                                                                  ;88C439;

  .negative:
    LDA.W FX_TargetYPosition                                             ;88C43A;
    CMP.W FX_BaseYPosition                                               ;88C43D;
    BEQ .return2                                                         ;88C440;
    BCC .doRise                                                          ;88C442;

  .return2:
    RTS                                                                  ;88C444;

  .doRise:
    LDA.W #FXRisingFunction_Water_WaitToRise                             ;88C445;
    STA.W FX_RisingFunction                                              ;88C448;

  .return3:
    RTS                                                                  ;88C44B;


;;; $C44C: FX rising function - water - wait to rise ;;;
FXRisingFunction_Water_WaitToRise:
    DEC.W FX_Timer                                                       ;88C44C;
    BNE .return                                                          ;88C44F;
    LDA.W #FXRisingFunction_Water_Rising                                 ;88C451;
    STA.W FX_RisingFunction                                              ;88C454;

  .return:
    RTS                                                                  ;88C457;


;;; $C458: FX rising function - water - rising ;;;
FXRisingFunction_Water_Rising:
    JSR.W RaiseOrLower_FX                                                ;88C458;
    BCC .return                                                          ;88C45B;
    LDA.W #FXRisingFunction_Water_Normal                                 ;88C45D;
    STA.W FX_RisingFunction                                              ;88C460;
    STZ.W FX_YSubVelocity                                                ;88C463;

  .return:
    RTS                                                                  ;88C466;


;;; $C467: Instruction - HDMA object phase increase timer = 1 ;;;
Instruction_HDMA_Object_Phase_Increase_Timer_1:
;; Parameters:
;;     X: HDMA object index
    LDA.W #$0001                                                         ;88C467;
    STA.W HDMAObject_Var1,X                                              ;88C46A;
    RTS                                                                  ;88C46D;


;;; $C46E: Wave displacement table - water ;;;
WaveDisplacementTable_Water:
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000                   ;88C46E;
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000                   ;88C47E;


;;; $C48E: Pre-instruction - water BG3 X scroll ;;;
PreInstruction_Water_BG3_Xscroll:
; For on-screen water,
; the calculation 200h - [A] at $C569 is equivalent to 100h + (Y position of screen on FX)
; (100h is the offset of water in the BG3 tilemap)
    PHB                                                                  ;88C48E;
    LDA.W LayerBlending_Layer3Config                                     ;88C48F;
    STA.W LayerBlending_Config                                           ;88C492;
    LDA.W TimeIsFrozenFlag                                               ;88C495;
    BEQ .notFrozen                                                       ;88C498;
    PLB                                                                  ;88C49A;
    RTL                                                                  ;88C49B;

  .notFrozen:
    PHX                                                                  ;88C49C;
    PHY                                                                  ;88C49D;
    REP #$30                                                             ;88C49E;
    PEA.W .functionReturn-1                                              ;88C4A0;
    JMP.W (FX_RisingFunction)                                            ;88C4A3;

  .functionReturn:
    JSR.W Handle_Tide                                                    ;88C4A6;
    SEP #$10                                                             ;88C4A9;
    LDA.W FX_BaseYSubPosition                                            ;88C4AB;
    CLC                                                                  ;88C4AE;
    ADC.W FX_YSubOffset                                                  ;88C4AF;
    STA.W FX_YSubPosition                                                ;88C4B2;
    LDA.W FX_BaseYPosition                                               ;88C4B5;
    ADC.W FX_YOffset                                                     ;88C4B8;
    STA.W FX_YPosition                                                   ;88C4BB;
    LDA.W FX_YPosition                                                   ;88C4BE;
    BMI .negative                                                        ;88C4C1;
    SEC                                                                  ;88C4C3;
    SBC.W Layer1YPosition                                                ;88C4C4;
    BEQ +                                                                ;88C4C7;
    BPL .notAboveScreen                                                  ;88C4C9;

+   EOR.W #$001F                                                         ;88C4CB;
    AND.W #$001F                                                         ;88C4CE;
    ORA.W #$0100                                                         ;88C4D1;
    BRA .merge                                                           ;88C4D4;

  .notAboveScreen:
    CMP.W #$0100                                                         ;88C4D6;
    BCC .onScreen                                                        ;88C4D9;

  .negative:
    LDA.W #$0000                                                         ;88C4DB;
    BRA .merge                                                           ;88C4DE;

  .onScreen:
    EOR.W #$00FF                                                         ;88C4E0;
    AND.W #$00FF                                                         ;88C4E3;

  .merge:
    STA.L BG3YPosition                                                   ;88C4E6;
    LDX.W HDMAObject_Index                                               ;88C4EA;
    LDA.W HDMAObject_Var2,X                                              ;88C4ED;
    XBA                                                                  ;88C4F0;
    BPL .lowByte                                                         ;88C4F1;
    ORA.W #$FF00                                                         ;88C4F3;
    BRA +                                                                ;88C4F6;

  .lowByte:
    AND.W #$00FF                                                         ;88C4F8;

+   CLC                                                                  ;88C4FB;
    ADC.W Layer1XPosition                                                ;88C4FC;
    STA.B DP_Temp14                                                      ;88C4FF;
    DEC.W HDMAObject_Var1,X                                              ;88C501;
    BNE .loopSetup                                                       ;88C504;
    LDA.W #$000A                                                         ;88C506;
    STA.W HDMAObject_Var1,X                                              ;88C509;
    LDA.W HDMAObject_Var0,X                                              ;88C50C;
    INC                                                                  ;88C50F;
    INC                                                                  ;88C510;
    AND.W #$001E                                                         ;88C511;
    STA.W HDMAObject_Var0,X                                              ;88C514;

  .loopSetup:
    LDA.W HDMAObject_Var0,X                                              ;88C517;
    TAX                                                                  ;88C51A;
    LDY.B #$1E                                                           ;88C51B;

  .loop:
    LDA.B DP_Temp14                                                      ;88C51D;
    CLC                                                                  ;88C51F;
    ADC.W WaveDisplacementTable_Water,Y                                  ;88C520;
    STA.L WaterBG3XScrollHDMADataTable,X                                 ;88C523;
    DEX                                                                  ;88C527;
    DEX                                                                  ;88C528;
    TXA                                                                  ;88C529;
    AND.W #$001E                                                         ;88C52A;
    TAX                                                                  ;88C52D;
    DEY                                                                  ;88C52E;
    DEY                                                                  ;88C52F;
    BPL .loop                                                            ;88C530;
    LDX.W HDMAObject_Index                                               ;88C532;
    LDA.W FX_LiquidOptions                                               ;88C535;
    AND.W #$0001                                                         ;88C538;
    BEQ +                                                                ;88C53B;
    LDA.W HDMAObject_Var2,X                                              ;88C53D;
    CLC                                                                  ;88C540;
    ADC.W #$0040                                                         ;88C541;
    STA.W HDMAObject_Var2,X                                              ;88C544;

+   LDX.W HDMAObject_Index                                               ;88C547;
    LDA.W FX_YPosition                                                   ;88C54A;
    BMI .negative2                                                       ;88C54D;
    SEC                                                                  ;88C54F;
    SBC.W Layer1YPosition                                                ;88C550;
    CLC                                                                  ;88C553;
    ADC.W #$0100                                                         ;88C554;
    BPL .lessThan100                                                     ;88C557;
    AND.W #$000F                                                         ;88C559;
    ORA.W #$0100                                                         ;88C55C;
    BRA .merge2                                                          ;88C55F;

  .lessThan100:
    CMP.W #$0200                                                         ;88C561;
    BCC .merge2                                                          ;88C564;

  .negative2:
    LDA.W #$01FF                                                         ;88C566;

  .merge2:
    EOR.W #$01FF                                                         ;88C569;
    INC                                                                  ;88C56C;
    AND.W #$03FF                                                         ;88C56D;
    STA.B DP_Temp12                                                      ;88C570;
    LDA.B DP_Temp12                                                      ;88C572;
    ASL                                                                  ;88C574;
    CLC                                                                  ;88C575;
    ADC.B DP_Temp12                                                      ;88C576;
    ADC.W #IndirectHDMATable_WaterBG3XScroll_0                           ;88C578;
    STA.W HDMAObject_TablePointers,X                                     ;88C57B;
    PLY                                                                  ;88C57E;
    PLX                                                                  ;88C57F;
    PLB                                                                  ;88C580;
    RTL                                                                  ;88C581;


;;; $C582: Instruction - HDMA object phase increase timer = 1 ;;;
Instruction_HDMA_Object_Phase_Increase_Timer_1_duplicate:
;; Parameters:
;;     X: HDMA object index

; Clone of Instruction_HDMA_Object_Phase_Increase_Timer_1
    LDA.W #$0001                                                         ;88C582;
    STA.W HDMAObject_Var1,X                                              ;88C585;
    RTS                                                                  ;88C588;


;;; $C589: Pre-instruction - water BG2 X scroll ;;;
PreInstruction_Water_BG2_Xscroll:
;; Parameters:
;;     X: HDMA object index

; For on-screen water,
; the calculation 1FFh - [A] at $C5CE is equivalent to FFh + (Y position of screen on FX)
; (100h is the offset of water in the BG3 tilemap, and I think FFh is an off-by-one error)
    PHB                                                                  ;88C589;
    LDA.B DP_BG2XScroll                                                  ;88C58A;
    STA.L WaterBG2XScrollHDMADataTable-4                                 ;88C58C;
    LDA.W TimeIsFrozenFlag                                               ;88C590;
    BNE .notWavy                                                         ;88C593;
    LDA.W FX_LiquidOptions                                               ;88C595;
    AND.W #$0002                                                         ;88C598;
    BNE .wavy                                                            ;88C59B;
    STZ.W HDMAObject_ChannelBitflags,X                                   ;88C59D;

  .notWavy:
    JSR.W Setup_Water_BG2_Xscroll_DataTable_NotWavy                      ;88C5A0;
    BRA .merge                                                           ;88C5A3;

  .wavy:
    JSR.W Setup_Water_BG2_Xscroll_DataTable_Wavy                         ;88C5A5;

  .merge:
    LDA.W HDMAObject_ChannelIndicesBanks,X                               ;88C5A8;
    AND.W #$00FF                                                         ;88C5AB;
    TAY                                                                  ;88C5AE;
    LDA.W FX_YPosition                                                   ;88C5AF;
    BMI .negative                                                        ;88C5B2;
    SEC                                                                  ;88C5B4;
    SBC.W Layer1YPosition                                                ;88C5B5;
    CLC                                                                  ;88C5B8;
    ADC.W #$0100                                                         ;88C5B9;
    BPL .lessThan100                                                     ;88C5BC;
    AND.W #$000F                                                         ;88C5BE;
    ORA.W #$0100                                                         ;88C5C1;
    BRA .merge2                                                          ;88C5C4;

  .lessThan100:
    CMP.W #$0200                                                         ;88C5C6;
    BCC .merge2                                                          ;88C5C9;

  .negative:
    LDA.W #$01FF                                                         ;88C5CB;

  .merge2:
    EOR.W #$01FF                                                         ;88C5CE;
    AND.W #$03FF                                                         ;88C5D1;
    STA.B DP_Temp12                                                      ;88C5D4;
    LDA.B DP_Temp12                                                      ;88C5D6;
    ASL                                                                  ;88C5D8;
    CLC                                                                  ;88C5D9;
    ADC.B DP_Temp12                                                      ;88C5DA;
    ADC.W #IndirectHDMATable_WaterBG2XScroll                             ;88C5DC;
    STA.W HDMAObject_TablePointers,X                                     ;88C5DF;
    PLB                                                                  ;88C5E2;
    RTL                                                                  ;88C5E3;


;;; $C5E4: Set up water BG2 X scroll data table - wavy ;;;
Setup_Water_BG2_Xscroll_DataTable_Wavy:
;; Parameters:
;;     X: HDMA object index
    DEC.W HDMAObject_Var1,X                                              ;88C5E4;
    BNE +                                                                ;88C5E7;
    LDA.W #$0006                                                         ;88C5E9;
    STA.W HDMAObject_Var1,X                                              ;88C5EC;
    LDA.W HDMAObject_Var0,X                                              ;88C5EF;
    INC                                                                  ;88C5F2;
    INC                                                                  ;88C5F3;
    AND.W #$001E                                                         ;88C5F4;
    STA.W HDMAObject_Var0,X                                              ;88C5F7;

+   PHX                                                                  ;88C5FA;
    LDA.B DP_BG2YScroll                                                  ;88C5FB;
    AND.W #$000F                                                         ;88C5FD;
    ASL                                                                  ;88C600;
    PHA                                                                  ;88C601;
    CLC                                                                  ;88C602;
    ADC.W HDMAObject_Var0,X                                              ;88C603;
    AND.W #$001E                                                         ;88C606;
    TAY                                                                  ;88C609;
    PLA                                                                  ;88C60A;
    CLC                                                                  ;88C60B;
    ADC.W #$001E                                                         ;88C60C;
    AND.W #$001E                                                         ;88C60F;
    TAX                                                                  ;88C612;
    LDA.W #$000F                                                         ;88C613;
    STA.B DP_Temp12                                                      ;88C616;

  .loop:
    LDA.B DP_BG2XScroll                                                  ;88C618;
    CLC                                                                  ;88C61A;
    ADC.W WaveDisplacementTable_Water,Y                                  ;88C61B;
    STA.L WaterBG2XScrollHDMADataTable,X                                 ;88C61E;
    DEX                                                                  ;88C622;
    DEX                                                                  ;88C623;
    TXA                                                                  ;88C624;
    AND.W #$001E                                                         ;88C625;
    TAX                                                                  ;88C628;
    DEY                                                                  ;88C629;
    DEY                                                                  ;88C62A;
    TYA                                                                  ;88C62B;
    AND.W #$001E                                                         ;88C62C;
    TAY                                                                  ;88C62F;
    DEC.B DP_Temp12                                                      ;88C630;
    BPL .loop                                                            ;88C632;
    PLX                                                                  ;88C634;
    RTS                                                                  ;88C635;


;;; $C636: Set up water BG2 X scroll data table - not wavy ;;;
Setup_Water_BG2_Xscroll_DataTable_NotWavy:
    PHX                                                                  ;88C636;
    LDX.B #$1E                                                           ;88C637;
    LDA.B DP_BG2XScroll                                                  ;88C639;

  .loop:
    STA.L WaterBG2XScrollHDMADataTable,X                                 ;88C63B;
    DEX                                                                  ;88C63F;
    DEX                                                                  ;88C640;
    BPL .loop                                                            ;88C641;
    PLX                                                                  ;88C643;
    RTS                                                                  ;88C644;


;;; $C645: Indirect HDMA table - water BG3 X scroll ;;;
IndirectHDMATable_WaterBG3XScroll_0:
    db $81 : dw AboveSurfaceWaterBG3XScrollHDMADataEntry                 ;88C645;
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
    db $81 : dw WaterBG3XScrollHDMADataTable                             ;88C945;
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
    db $81 : dw WaterBG2XScrollHDMADataTable-4                           ;88CF46;
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
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88D847;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88D84A;
    dw Instruction_HDMA_Object_Phase_Increase_Timer_1_duplicate          ;88D84D;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88D84F;
    dl PreInstruction_Water_BG2_Xscroll                                  ;88D851;
    dw Instruction_HDMAObject_Sleep                                      ;88D854;


;;; $D856: Instruction list - water BG3 X scroll ;;;
InstList_Water_BG3_Xscroll:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88D856;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88D859;
    dw Instruction_HDMA_Object_Phase_Increase_Timer_1                    ;88D85C;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88D85E;
    dl PreInstruction_Water_BG3_Xscroll                                  ;88D860;
    dw Instruction_HDMAObject_Sleep                                      ;88D863;


;;; $D865: Spawn BG3 scroll HDMA object ;;;
Spawn_BG3_Scroll_HDMA_Object:
; Applies an HDMA that sets BG3 scrolls to [$7E:CAD8]/[$7E:CADA] every line of the HUD and [$7E:CADC]/[$7E:CADE] after the last line of the HUD
; Spawned by:
;     Lava, acid, water, rain, spores, Tourian entrance statue
;     Draygon's body initialisation
;     Door transition after scrolling finishes and before the screen fades in
    JSL.L SpawnHDMAObject_SlotA_Channel80_Index70                        ;88D865;
    db $43,$11                                                           ;88D869;
    dw InstList_BG3Scroll_0                                              ;88D86B;
    RTL                                                                  ;88D86D;


;;; $D86E: RTL ;;;
RTL_88D86E:
    RTL                                                                  ;88D86E;


;;; $D86F: Indirect HDMA table - BG3 scroll ;;;
IndirectHDMATable_BG3Scroll:                                             ;88D86F;
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
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88D8D0;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88D8D3;

InstList_BG3Scroll_1:
    dw $7FFF,IndirectHDMATable_BG3Scroll                                 ;88D8D6;
    dw Instruction_HDMAObject_GotoY                                      ;88D8DA;
    dw InstList_BG3Scroll_1                                              ;88D8DC;


;;; $D8DE: FX type 28h: Ceres Ridley ;;;
FXType_28_CeresRidley:
    JSL.L Spawn_HDMAObject                                               ;88D8DE;
    db $40,$05                                                           ;88D8E2;
    dw InstList_CeresRidleyMode_BGTileSize_0                             ;88D8E4;
    JSL.L Spawn_HDMAObject                                               ;88D8E6;
    db $00,$2C                                                           ;88D8EA;
    dw InstList_CeresRidley_MainScreenLayers_0                           ;88D8EC;
    RTL                                                                  ;88D8EE;


;;; $D8EF: RTL ;;;
RTL_88D8EF:
    RTL                                                                  ;88D8EF;


;;; $D8F0: Indirect HDMA table - Ceres Ridley mode and BG tile size ;;;
IndirectHDMATable_CeresRidleyMode_BGTileSize:
    db $1F : dw CeresMode7HDMATables                                     ;88D8F0;
    db $60 : dw CeresMode7HDMATables+1
    db $50 : dw CeresMode7HDMATables+1
    db $10 : dw CeresMode7HDMATables
    db $00


;;; $D8FD: HDMA table - Ceres Ridley main screen layers ;;;
IndirectHDMATable_CeresRidleyMainScreenLayers:                           ;88D8FD;
    db $1F,$04 ;         BG3
    db $60,$13 ; BG1/BG2/    sprites
    db $50,$13 ; BG1/BG2/    sprites
    db $10,$12 ;     BG2/    sprites
    db $00



;;; $D906: Instruction list - Ceres Ridley mode and BG tile size ;;;
InstList_CeresRidleyMode_BGTileSize_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88D906;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $00             ;88D909;
    dw Instruction_VideoMode_for_HUD_and_Floor_1                         ;88D90C;

InstList_CeresRidleyMode_BGTileSize_1:
    dw $7FFF,IndirectHDMATable_CeresRidleyMode_BGTileSize                ;88D90E;
    dw Instruction_HDMAObject_GotoY                                      ;88D912;
    dw InstList_CeresRidleyMode_BGTileSize_1                             ;88D914;


;;; $D916: Instruction - video mode for HUD and floor = 1 ;;;
Instruction_VideoMode_for_HUD_and_Floor_1:
    LDA.W #$0009                                                         ;88D916;
    STA.W CeresMode7HDMATables                                           ;88D919;
    RTS                                                                  ;88D91C;


;;; $D91D: Instruction list - Ceres Ridley main screen layers ;;;
InstList_CeresRidley_MainScreenLayers_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88D91D;

InstList_CeresRidley_MainScreenLayers_1:
    dw $7FFF,IndirectHDMATable_CeresRidleyMainScreenLayers               ;88D920;
    dw Instruction_HDMAObject_GotoY                                      ;88D924;
    dw InstList_CeresRidley_MainScreenLayers_1                           ;88D926;


;;; $D928: FX type 2Ah: Ceres elevator ;;;
FXType_2A_CeresElevator:
    JSL.L Spawn_HDMAObject                                               ;88D928;
    db $40,$05                                                           ;88D92C;
    dw InstList_CeresElevatorMode_BGTileSize_0                           ;88D92E;
    RTL                                                                  ;88D930;


;;; $D931: RTL ;;;
RTL_88D931:
    RTL                                                                  ;88D931;


;;; $D932: Indirect HDMA table - Ceres elevator mode and BG tile size ;;;
IndirectHDMATable_CeresElevatorMode_BGTileSize:                          ;88D932;
    db $1F : dw CeresMode7HDMATables
    db $70 : dw CeresMode7HDMATables+1
    db $00


;;; $D939: Instruction list - Ceres elevator mode and BG tile size ;;;
InstList_CeresElevatorMode_BGTileSize_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88D939;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $00             ;88D93C;
    dw Instruction_VideoMode_for_HUD_1                                   ;88D93F;

InstList_CeresElevatorMode_BGTileSize_1:
    dw $7FFF,IndirectHDMATable_CeresElevatorMode_BGTileSize              ;88D941;
    dw Instruction_HDMAObject_GotoY                                      ;88D945;
    dw InstList_CeresElevatorMode_BGTileSize_1                           ;88D947;


;;; $D949: Instruction - video mode for HUD = 1 ;;;
Instruction_VideoMode_for_HUD_1:
    LDA.W #$0009                                                         ;88D949;
    STA.W CeresMode7HDMATables                                           ;88D94C;
    RTS                                                                  ;88D94F;


;;; $D950: FX type Ah: rain ;;;
FXType_A_Rain:
    SEP #$20                                                             ;88D950;
    LDA.B #$5C                                                           ;88D952;
    STA.B DP_GameplayBG1TilemapAddrSize                                  ;88D954;
    REP #$20                                                             ;88D956;
    JSL.L Spawn_HDMAObject                                               ;88D958;
    db $43,$11                                                           ;88D95C;
    dw InstList_Rain_BG3Scroll_0                                         ;88D95E;
    JSL.L Spawn_BG3_Scroll_HDMA_Object                                   ;88D960;
    LDY.W #AnimatedTilesObject_Rain                                      ;88D964;
    JSL.L Spawn_AnimatedTilesObject                                      ;88D967;
    RTL                                                                  ;88D96B;


;;; $D96C: Instruction list - rain BG3 scroll ;;;
InstList_Rain_BG3Scroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88D96C;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88D96F;
    dw Instruction_HDMAObjectBG3XVelocity                                ;88D972;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88D974;
    dl PreInstruction_RainBG3Scroll                                      ;88D976;

InstList_Rain_BG3Scroll_1:
    dw $7FFF,IndirectHDMATable_BG3Scroll                                 ;88D979;
    dw Instruction_HDMAObject_GotoY                                      ;88D97D;
    dw InstList_Rain_BG3Scroll_1                                         ;88D97F;


;;; $D981: Instruction - HDMA object BG3 X velocity = randomly ±400h/±600h ;;;
Instruction_HDMAObjectBG3XVelocity:
;; Parameters:
;;     X: HDMA object index
    PHX                                                                  ;88D981;
    LDA.W RandomNumberSeed                                               ;88D982;
    LSR                                                                  ;88D985;
    AND.W #$0006                                                         ;88D986;
    TAX                                                                  ;88D989;
    LDA.W .BG3XVelocities,X                                              ;88D98A;
    PLX                                                                  ;88D98D;
    STA.W HDMAObject_Var3,X                                              ;88D98E;
    RTS                                                                  ;88D991;

  .BG3XVelocities:
; BG3 X velocities. Unit 1/100h px/frame
    dw $FA00,$0600,$FC00,$0400                                           ;88D992;


;;; $D99A: Unused. Indirect HDMA table ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_IndirectHDMATable_88D99A:
; Looks like a more space-efficient version of IndirectHDMATable_BG3Scroll
    db $1F : dw $CAD8                                                    ;88D99A;
    db $81 : dw $CADC
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D9A1: Pre-instruction - rain BG3 scroll ;;;
PreInstruction_RainBG3Scroll:
;; Parameters:
;;     X: HDMA object index
    PHB                                                                  ;88D9A1;
    LDY.B #$5C                                                           ;88D9A2;
    STY.B DP_GameplayBG1TilemapAddrSize                                  ;88D9A4;
    LDA.W LayerBlending_Layer3Config                                     ;88D9A6;
    STA.W LayerBlending_Config                                           ;88D9A9;
    LDA.W TimeIsFrozenFlag                                               ;88D9AC;
    BEQ .notFrozen                                                       ;88D9AF;
    PLB                                                                  ;88D9B1;
    RTL                                                                  ;88D9B2;

  .notFrozen:
    LDA.W HDMAObject_Var4,X                                              ;88D9B3;
    SEC                                                                  ;88D9B6;
    SBC.W Layer1YPosition                                                ;88D9B7;
    STA.B DP_Temp12                                                      ;88D9BA;
    LDA.W HDMAObject_Var0,X                                              ;88D9BC;
    XBA                                                                  ;88D9BF;
    BPL .lowByteD9C7                                                     ;88D9C0;
    ORA.W #$FF00                                                         ;88D9C2;
    BRA +                                                                ;88D9C5;

  .lowByteD9C7:
    AND.W #$00FF                                                         ;88D9C7;

+   CLC                                                                  ;88D9CA;
    ADC.B DP_Temp12                                                      ;88D9CB;
    STA.L BG3YPosition                                                   ;88D9CD;
    LDA.W HDMAObject_Var0,X                                              ;88D9D1;
    CLC                                                                  ;88D9D4;
    ADC.W #$FA00                                                         ;88D9D5; -$600
    STA.W HDMAObject_Var0,X                                              ;88D9D8;
    LDA.W Layer1YPosition                                                ;88D9DB;
    STA.W HDMAObject_Var4,X                                              ;88D9DE;
    LDA.W HDMAObject_Var5,X                                              ;88D9E1;
    SEC                                                                  ;88D9E4;
    SBC.W Layer1XPosition                                                ;88D9E5;
    STA.B DP_Temp12                                                      ;88D9E8;
    LDA.W HDMAObject_Var1,X                                              ;88D9EA;
    XBA                                                                  ;88D9ED;
    BPL .lowByteD9F5                                                     ;88D9EE;
    ORA.W #$FF00                                                         ;88D9F0;
    BRA +                                                                ;88D9F3;

  .lowByteD9F5:
    AND.W #$00FF                                                         ;88D9F5;

+   CLC                                                                  ;88D9F8;
    ADC.B DP_Temp12                                                      ;88D9F9;
    STA.L BG3XPosition                                                   ;88D9FB;
    LDA.W HDMAObject_Var1,X                                              ;88D9FF;
    CLC                                                                  ;88DA02;
    ADC.W HDMAObject_Var3,X                                              ;88DA03;
    STA.W HDMAObject_Var1,X                                              ;88DA06;
    LDA.W Layer1XPosition                                                ;88DA09;
    STA.W HDMAObject_Var5,X                                              ;88DA0C;
    PLB                                                                  ;88DA0F;
    RTL                                                                  ;88DA10;


;;; $DA11: FX type 8: spores ;;;
FXType_8_Spores:
    SEP #$20                                                             ;88DA11;
    LDA.B #$5C                                                           ;88DA13;
    STA.B DP_GameplayBG1TilemapAddrSize                                  ;88DA15;
    REP #$20                                                             ;88DA17;
    JSL.L Spawn_HDMAObject                                               ;88DA19;
    db $42,$11                                                           ;88DA1D;
    dw InstList_Spores_BG3_Xscroll_0                                     ;88DA1F;
    JSL.L Spawn_BG3_Scroll_HDMA_Object                                   ;88DA21;
    LDY.W #AnimatedTilesObject_Spores                                    ;88DA25;
    JSL.L Spawn_AnimatedTilesObject                                      ;88DA28;
    RTL                                                                  ;88DA2C;


;;; $DA2D: Instruction list - spores BG3 X scroll ;;;
InstList_Spores_BG3_Xscroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88DA2D;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88DA30;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DA33;
    dl PreInstruction_Spores_BG3_Xsscroll                                ;88DA35;

InstList_Spores_BG3_Xscroll_1:
    dw $7FFF,IndirectHDMATable_BG3Scroll                                 ;88DA38;
    dw Instruction_HDMAObject_GotoY                                      ;88DA3C;
    dw InstList_Spores_BG3_Xscroll_1                                     ;88DA3E;


if !FEATURE_KEEP_UNREFERENCED
;;; $DA40: Unused. Indirect HDMA table ;;;
UNUSED_IndirectHDMATable_88DA40:
; Looks like a more space-efficient version of IndirectHDMATable_BG3Scroll
    db $1F : dw $CAD8                                                    ;88DA40;
    db $81 : dw $CADC
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DA47: Pre-instruction - spores BG3 X scroll ;;;
PreInstruction_Spores_BG3_Xsscroll:
;; Parameters:
;;     X: HDMA object index
    PHB                                                                  ;88DA47;
    LDY.B #$5C                                                           ;88DA48;
    STY.B DP_GameplayBG1TilemapAddrSize                                  ;88DA4A;
    LDA.W LayerBlending_Layer3Config                                     ;88DA4C;
    STA.W LayerBlending_Config                                           ;88DA4F;
    LDA.W TimeIsFrozenFlag                                               ;88DA52;
    BEQ .notFrozen                                                       ;88DA55;
    PLB                                                                  ;88DA57;
    RTL                                                                  ;88DA58;

  .notFrozen:
    LDA.W HDMAObject_Var2,X                                              ;88DA59;
    XBA                                                                  ;88DA5C;
    BPL .lowByteDA64                                                     ;88DA5D;
    ORA.W #$FF00                                                         ;88DA5F;
    BRA +                                                                ;88DA62;

  .lowByteDA64:
    AND.W #$00FF                                                         ;88DA64;

+   CLC                                                                  ;88DA67;
    ADC.W Layer1YPosition                                                ;88DA68;
    STA.L BG3YPosition                                                   ;88DA6B;
    LDA.W HDMAObject_Var2,X                                              ;88DA6F;
    CLC                                                                  ;88DA72;
    ADC.W #$FFC0                                                         ;88DA73;
    STA.W HDMAObject_Var2,X                                              ;88DA76;
    STA.B DP_Temp14                                                      ;88DA79;
    LDA.W HDMAObject_Var3,X                                              ;88DA7B;
    XBA                                                                  ;88DA7E;
    BPL .lowByteDA86                                                     ;88DA7F;
    ORA.W #$FF00                                                         ;88DA81;
    BRA +                                                                ;88DA84;

  .lowByteDA86:
    AND.W #$00FF                                                         ;88DA86;

+   CLC                                                                  ;88DA89;
    ADC.W Layer1XPosition                                                ;88DA8A;
    STA.L BG3XPosition                                                   ;88DA8D;
    STA.B DP_Temp12                                                      ;88DA91;
    LDA.W HDMAObject_Var3,X                                              ;88DA93;
    CLC                                                                  ;88DA96;
    ADC.W #$0000                                                         ;88DA97;
    STA.W HDMAObject_Var3,X                                              ;88DA9A;
    PLB                                                                  ;88DA9D;
    RTL                                                                  ;88DA9E;


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
    DEC.W HDMAObject_Var1,X                                              ;88DA9F;
    BNE .setupLoop                                                       ;88DAA2;
    LDA.W #$000A                                                         ;88DAA4;
    STA.W HDMAObject_Var1,X                                              ;88DAA7;
    LDA.W HDMAObject_Var0,X                                              ;88DAAA;
    INC                                                                  ;88DAAD;
    INC                                                                  ;88DAAE;
    AND.W #$001F                                                         ;88DAAF;
    STA.W HDMAObject_Var0,X                                              ;88DAB2;

  .setupLoop:
    LDA.W HDMAObject_Var0,X                                              ;88DAB5;
    TAX                                                                  ;88DAB8;
    LDY.B #$1E                                                           ;88DAB9;

  .loop:
    LDA.B DP_Temp12                                                      ;88DABB;
    CLC                                                                  ;88DABD;
    ADC.W SamusXPosition                                                 ;88DABE;
    ADC.W .waveDisplacementTable,Y                                       ;88DAC1;
    STA.L WaterBG3XScrollHDMADataTable,X                                 ;88DAC4;
    TXA                                                                  ;88DAC8;
    DEC                                                                  ;88DAC9;
    DEC                                                                  ;88DACA;
    AND.W #$001F                                                         ;88DACB;
    TAX                                                                  ;88DACE;
    DEY                                                                  ;88DACF;
    DEY                                                                  ;88DAD0;
    BPL .loop                                                            ;88DAD1;
    LDX.W HDMAObject_Index                                               ;88DAD3;
    LDA.W #$FFF0                                                         ;88DAD6;
    TRB.B DP_Temp14                                                      ;88DAD9;
    LDA.B DP_Temp14                                                      ;88DADB;
    ASL                                                                  ;88DADD;
    CLC                                                                  ;88DADE;
    ADC.B DP_Temp14                                                      ;88DADF;
    ADC.W #IndirectHDMATable_WaterBG3XScroll_1                           ;88DAE1;
    STA.W HDMAObject_TablePointers,X                                     ;88DAE4;
    RTL                                                                  ;88DAE7;

  .waveDisplacementTable:
; Same as WaveDisplacementTable_Water
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000                   ;88DAE8;
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000                   ;88DAF8;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DB08: FX type Ch: fog ;;;
FXType_C_Fog:
    SEP #$20                                                             ;88DB08;
    LDA.B #$5C                                                           ;88DB0A;
    STA.B DP_GameplayBG1TilemapAddrSize                                  ;88DB0C;
    REP #$20                                                             ;88DB0E;
    JSL.L Spawn_HDMAObject                                               ;88DB10;
    db $43,$11                                                           ;88DB14;
    dw InstList_Fog_BG3_Scroll_0                                         ;88DB16;
    RTL                                                                  ;88DB18;


;;; $DB19: Instruction list - fog BG3 scroll ;;;
InstList_Fog_BG3_Scroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88DB19;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88DB1C;
    dw RTS_88DB2E                                                        ;88DB1F;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DB21;
    dl PreInstruction_Fog_BG3Scroll                                      ;88DB23;

InstList_Fog_BG3_Scroll_1:
    dw $7FFF,IndirectHDMATable_BG3Scroll                                 ;88DB26;
    dw Instruction_HDMAObject_GotoY                                      ;88DB2A;
    dw InstList_Fog_BG3_Scroll_1                                         ;88DB2C;


;;; $DB2E: RTS ;;;
RTS_88DB2E:
    RTS                                                                  ;88DB2E;


if !FEATURE_KEEP_UNREFERENCED
;;; $DB2F: Unused. Indirect HDMA table ;;;
UNUSED_IndirectHDMATable_88DB2F:
; Looks like a more space-efficient version of IndirectHDMATable_BG3Scroll
    db $1F : dw $CAD8                                                    ;88DB2F;
    db $81 : dw $CADC
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DB36: Pre-instruction - fog BG3 scroll ;;;
PreInstruction_Fog_BG3Scroll:
;; Parameters:
;;     X: HDMA object index
    PHB                                                                  ;88DB36;
    LDY.B #$5C                                                           ;88DB37;
    STY.B DP_GameplayBG1TilemapAddrSize                                  ;88DB39;
    LDA.W LayerBlending_Layer3Config                                     ;88DB3B;
    STA.W LayerBlending_Config                                           ;88DB3E;
    LDA.W TimeIsFrozenFlag                                               ;88DB41;
    BEQ .timeNotFrozen                                                   ;88DB44;
    PLB                                                                  ;88DB46;
    RTL                                                                  ;88DB47;

  .timeNotFrozen:
    LDA.W HDMAObject_Var0,X                                              ;88DB48;
    XBA                                                                  ;88DB4B;
    BPL .lowByteDB53                                                     ;88DB4C;
    ORA.W #$FF00                                                         ;88DB4E;
    BRA +                                                                ;88DB51;

  .lowByteDB53:
    AND.W #$00FF                                                         ;88DB53;

+   CLC                                                                  ;88DB56;
    ADC.W Layer1YPosition                                                ;88DB57;
    STA.L BG3YPosition                                                   ;88DB5A;
    LDA.W HDMAObject_Var0,X                                              ;88DB5E;
    CLC                                                                  ;88DB61;
    ADC.W #$FFC0                                                         ;88DB62;
    STA.W HDMAObject_Var0,X                                              ;88DB65;
    LDA.W HDMAObject_Var1,X                                              ;88DB68;
    XBA                                                                  ;88DB6B;
    BPL .lowByteDB73                                                     ;88DB6C;
    ORA.W #$FF00                                                         ;88DB6E;
    BRA +                                                                ;88DB71;

  .lowByteDB73:
    AND.W #$00FF                                                         ;88DB73;

+   CLC                                                                  ;88DB76;
    ADC.W Layer1XPosition                                                ;88DB77;
    STA.L BG3XPosition                                                   ;88DB7A;
    LDA.W HDMAObject_Var1,X                                              ;88DB7E;
    CLC                                                                  ;88DB81;
    ADC.W #$0050                                                         ;88DB82;
    STA.W HDMAObject_Var1,X                                              ;88DB85;
    PLB                                                                  ;88DB88;
    RTL                                                                  ;88DB89;


;;; $DB8A: FX type 26h: Tourian entrance statue ;;;
FXType_26_TourianEntranceStatue:
    LDA.W #$000A                                                         ;88DB8A;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;88DB8D;
    BCC .tourianLocked                                                   ;88DB91;
    JSL.L Spawn_Hardcoded_PLM                                            ;88DB93;
    db $06,$0C                                                           ;88DB97;
    dw PLMEntries_clearAccessToTourianElevator                           ;88DB99;
    LDA.W #$0202                                                         ;88DB9B;
    STA.L Scrolls                                                        ;88DB9E;

  .tourianLocked:
    SEP #$20                                                             ;88DBA2;
    LDA.B #$4A                                                           ;88DBA4;
    STA.B DP_BG2TilemapAddrSize                                          ;88DBA6;
    REP #$20                                                             ;88DBA8;
    LDA.W #FXRisingFunction_Water_Normal                                 ;88DBAA;
    STA.W FX_RisingFunction                                              ;88DBAD;
    LDA.W FX_BaseYPosition                                               ;88DBB0;
    STA.W FX_YPosition                                                   ;88DBB3;
    JSL.L Spawn_HDMAObject                                               ;88DBB6;
    db $42,$11                                                           ;88DBBA;
    dw InstList_Water_BG3_Xscroll                                        ;88DBBC;
    JSL.L Spawn_HDMAObject                                               ;88DBBE;
    db $42,$10                                                           ;88DBC2;
    dw InstList_TourianEntranceStatue_BG2Yscroll_0                       ;88DBC4;
    JSL.L Spawn_BG3_Scroll_HDMA_Object                                   ;88DBC6;
    RTL                                                                  ;88DBCA;


;;; $DBCB: Set Tourian entrance statue BG2 Y scroll ;;;
Set_TourianEntranceStatue_BG2_Yscroll:
;; Parameters:
;;     X: HDMA object index
    LDA.W HDMAObject_Var1,X                                              ;88DBCB;
    CLC                                                                  ;88DBCE;
    ADC.W Layer1YPosition                                                ;88DBCF;
    STA.L TourianStatueBG2YScroll                                        ;88DBD2;
    RTS                                                                  ;88DBD6;


;;; $DBD7: Pre-instruction - Tourian entrance statue BG2 Y scroll - wait for locks to be released ;;;
PreInst_TourianEntranceStatue_BG2_Yscroll_WaitForUnlock:
;; Parameters:
;;     X: HDMA object index
    PHP                                                                  ;88DBD7;
    REP #$30                                                             ;88DBD8;
    LDA.W #$0006                                                         ;88DBDA;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;88DBDD;
    BCC .setYscroll                                                      ;88DBE1;
    LDA.W #$0007                                                         ;88DBE3;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;88DBE6;
    BCC .setYscroll                                                      ;88DBEA;
    LDA.W #$0008                                                         ;88DBEC;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;88DBEF;
    BCC .setYscroll                                                      ;88DBF3;
    LDA.W #$0009                                                         ;88DBF5;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;88DBF8;
    BCC .setYscroll                                                      ;88DBFC;
    LDA.W #$0010                                                         ;88DBFE;
    TSB.W TourianStatueAnimationState                                    ;88DC01;
    LDA.W TourianStatueAnimationState                                    ;88DC04;
    BMI .setYscroll                                                      ;88DC07;
    LDA.W #$012C                                                         ;88DC09;
    STA.W HDMAObject_Var2,X                                              ;88DC0C;
    LDX.W HDMAObject_Index                                               ;88DC0F;
    LDA.W #$0001                                                         ;88DC12;
    STA.W HDMAObject_InstructionTimers,X                                 ;88DC15;
    INC.W HDMAObject_InstListPointers,X                                  ;88DC18;
    INC.W HDMAObject_InstListPointers,X                                  ;88DC1B;

  .setYscroll:
    JSR.W Set_TourianEntranceStatue_BG2_Yscroll                          ;88DC1E;
    PLP                                                                  ;88DC21;
    RTL                                                                  ;88DC22;


;;; $DC23: Pre-instruction - Tourian entrance statue BG2 Y scroll - descent delay ;;;
PreInst_TourianEntranceStatue_BG2Yscroll_DescentDelay:
;; Parameters:
;;     X: HDMA object index
    JSR.W Handle_Earthquake_SoundEffect                                  ;88DC23;
    LDA.W #$000D                                                         ;88DC26;
    STA.W EarthquakeType                                                 ;88DC29;
    LDA.W #$0020                                                         ;88DC2C;
    TSB.W EarthquakeTimer                                                ;88DC2F;
    DEC.W HDMAObject_Var2,X                                              ;88DC32;
    BPL .setYscroll                                                      ;88DC35;
    REP #$30                                                             ;88DC37;
    LDY.W #EnemyProjectile_TourianStatueDustClouds                       ;88DC39;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;88DC3C;
    LDY.W #EnemyProjectile_TourianStatueDustClouds                       ;88DC40;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;88DC43;
    LDY.W #EnemyProjectile_TourianStatueDustClouds                       ;88DC47;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;88DC4A;
    LDY.W #EnemyProjectile_TourianStatueDustClouds                       ;88DC4E;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;88DC51;
    SEP #$10                                                             ;88DC55;
    REP #$20                                                             ;88DC57;
    LDA.W #$0001                                                         ;88DC59;
    STA.W HDMAObject_InstructionTimers,X                                 ;88DC5C;
    INC.W HDMAObject_InstListPointers,X                                  ;88DC5F;
    INC.W HDMAObject_InstListPointers,X                                  ;88DC62;

  .setYscroll:
    JSR.W Set_TourianEntranceStatue_BG2_Yscroll                          ;88DC65;
    RTL                                                                  ;88DC68;


;;; $DC69: Pre-instruction - Tourian entrance statue BG2 Y scroll - descending ;;;
PreInstruction_TourianEntranceStatue_BG2_Yscroll_Descending:
;; Parameters:
;;     X: HDMA object index
    JSR.W Handle_Earthquake_SoundEffect                                  ;88DC69;
    LDA.W #$000D                                                         ;88DC6C;
    STA.W EarthquakeType                                                 ;88DC6F;
    LDA.W #$0020                                                         ;88DC72;
    TSB.W EarthquakeTimer                                                ;88DC75;
    LDA.W TimeIsFrozenFlag                                               ;88DC78;
    BNE .return                                                          ;88DC7B;
    LDA.W HDMAObject_Var0,X                                              ;88DC7D;
    CLC                                                                  ;88DC80;
    ADC.W #$C000                                                         ;88DC81;
    STA.W HDMAObject_Var0,X                                              ;88DC84;
    LDA.W HDMAObject_Var1,X                                              ;88DC87;
    ADC.W #$FFFF                                                         ;88DC8A;
    STA.W HDMAObject_Var1,X                                              ;88DC8D;
    CMP.W #$FF10                                                         ;88DC90;
    BNE .setYscroll                                                      ;88DC93;
    PHX                                                                  ;88DC95;
    PHP                                                                  ;88DC96;
    REP #$10                                                             ;88DC97;
    JSL.L Spawn_Hardcoded_PLM                                            ;88DC99;
    db $06,$0C                                                           ;88DC9D;
    dw PLMEntries_crumbleAccessToTourianElevator                         ;88DC9F;
    PLP                                                                  ;88DCA1;
    PLX                                                                  ;88DCA2;
    LDA.W #$000A                                                         ;88DCA3;
    JSL.L MarkEvent_inA                                                  ;88DCA6;
    LDA.W #$0001                                                         ;88DCAA;
    STA.W HDMAObject_InstructionTimers,X                                 ;88DCAD;
    INC.W HDMAObject_InstListPointers,X                                  ;88DCB0;
    INC.W HDMAObject_InstListPointers,X                                  ;88DCB3;

  .setYscroll:
    JSR.W Set_TourianEntranceStatue_BG2_Yscroll                          ;88DCB6;

  .return:
    RTL                                                                  ;88DCB9;


;;; $DCBA: Pre-instruction - Tourian entrance statue BG2 Y scroll - enable scrolling ;;;
PreInst_TourianEntranceStatue_BG2Yscroll_EnableScrolling:
;; Parameters:
;;     X: HDMA object index
    LDA.W #$8000                                                         ;88DCBA;
    STA.W TourianStatueFinishedProcessing                                ;88DCBD;
    LDA.W #$0202                                                         ;88DCC0;
    STA.L Scrolls                                                        ;88DCC3;
    JSR.W Set_TourianEntranceStatue_BG2_Yscroll                          ;88DCC7;
    RTL                                                                  ;88DCCA;


;;; $DCCB: Instruction - go to [[Y]] if entrance to Tourian is unlocked ;;;
Instruction_GotoY_ifEntranceToTourianUnlocked:
;; Parameters:
;;     X: HDMA object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    STZ.W HDMAObject_Var2,X                                              ;88DCCB;
    STZ.W HDMAObject_Var0,X                                              ;88DCCE;
    LDA.W #$000A                                                         ;88DCD1;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;88DCD4;
    BCS .gotoY                                                           ;88DCD8;
    STZ.W HDMAObject_Var1,X                                              ;88DCDA;
    STA.L TourianStatueBG2YScroll                                        ;88DCDD;
    LDA.W #$0001                                                         ;88DCE1;
    STA.L Scrolls                                                        ;88DCE4;
    INY                                                                  ;88DCE8;
    INY                                                                  ;88DCE9;
    RTS                                                                  ;88DCEA;

  .gotoY:
    LDA.W #$FF10                                                         ;88DCEB;
    STA.W HDMAObject_Var1,X                                              ;88DCEE;
    STA.L TourianStatueBG2YScroll                                        ;88DCF1;
    LDA.W $0000,Y                                                        ;88DCF5;
    TAY                                                                  ;88DCF8;
    RTS                                                                  ;88DCF9;


;;; $DCFA: Instruction list - Tourian entrance statue BG2 Y scroll ;;;
InstList_TourianEntranceStatue_BG2Yscroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88DCFA;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88DCFD;
    dw Instruction_GotoY_ifEntranceToTourianUnlocked                     ;88DD00;
    dw InstList_TourianEntranceStatue_BG2Yscroll_1                       ;88DD02;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DD04;
    dl PreInst_TourianEntranceStatue_BG2_Yscroll_WaitForUnlock           ;88DD06;
    dw $0001,IndirectHDMATable_TourianEntranceStatue_BG2YScroll          ;88DD09;
    dw Instruction_HDMAObject_Sleep                                      ;88DD0D;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DD0F;
    dl PreInst_TourianEntranceStatue_BG2Yscroll_DescentDelay             ;88DD11;
    dw Instruction_HDMAObject_Sleep                                      ;88DD14;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DD16;
    dl PreInstruction_TourianEntranceStatue_BG2_Yscroll_Descending       ;88DD18;
    dw Instruction_HDMAObject_Sleep                                      ;88DD1B;

InstList_TourianEntranceStatue_BG2Yscroll_1:
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DD1D;
    dl PreInst_TourianEntranceStatue_BG2Yscroll_EnableScrolling          ;88DD1F;
    dw $0001,IndirectHDMATable_TourianEntranceStatue_BG2YScroll          ;88DD22;
    dw Instruction_HDMAObject_Sleep                                      ;88DD26;


;;; $DD28: Indirect HDMA table - Tourian entrance statue BG2 Y scroll ;;;
IndirectHDMATable_TourianEntranceStatue_BG2YScroll:                      ;88DD28;
    db $1F : dw TourianStatueBG2YScroll
    db $01 : dw TourianStatueBG2YScroll
    db $01 : dw TourianStatueBG2YScroll
    db $00


;;; $DD32: Spawn Bomb Torizo haze ;;;
Spawn_BombTorizoHaze:
    JSL.L Spawn_HDMAObject                                               ;88DD32;
    db $02,$32                                                           ;88DD36;
    dw PreInst_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed_0        ;88DD38;
    JSL.L Spawn_HDMAObject                                               ;88DD3A;
    db $00,$32                                                           ;88DD3E;
    dw PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue_0        ;88DD40;
    RTL                                                                  ;88DD42;


;;; $DD43: Pre-instruction - Bomb Torizo haze colour math subscreen backdrop colour ;;;
PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor:
; By default, empty space in BG3 is blank tiles, not transparent tiles, to support the blending of foregrounds like water
; Hence, the colour math backdrop has no effect when BG3 is enabled for colour math, hence why it's disabled here
    LDA.W #$002C                                                         ;88DD43;
    STA.W LayerBlending_Config                                           ;88DD46;
    RTL                                                                  ;88DD49;


;;; $DD4A: Instruction list - Bomb Torizo haze colour math subscreen backdrop colour - green and red components ;;;
PreInst_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88DD4A;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $88             ;88DD4D;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DD50;
    dl PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor               ;88DD52;
    dw $0001,HDMATable_Nothing_88DD61                                    ;88DD55;

PreInst_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed_1:
    dw $7777,HDMATable_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed  ;88DD59;
    dw Instruction_HDMAObject_GotoY                                      ;88DD5D;
    dw PreInst_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed_1        ;88DD5F;


;;; $DD61: HDMA table - nothing ;;;
HDMATable_Nothing_88DD61:
    db $00                                                               ;88DD61;


;;; $DD62: Instruction list - Bomb Torizo haze colour math subscreen backdrop colour - blue component ;;;
PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88DD62;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $88             ;88DD65;
    dw $0001,HDMATable_Nothing_88DD74                                    ;88DD68;

PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue_1:
    dw $7777,HDMATable_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue  ;88DD6C;
    dw Instruction_HDMAObject_GotoY                                      ;88DD70;
    dw PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue_1        ;88DD72;


;;; $DD74: HDMA table - nothing ;;;
HDMATable_Nothing_88DD74:
    db $00                                                               ;88DD74;


;;; $DD75: HDMA table - Bomb Torizo haze colour math subscreen backdrop colour - green and red components ;;;
HDMATable_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed:
    db $48,$20,$40                                                       ;88DD75;
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
    db $48,$80                                                           ;88DDA6;
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
    LDA.W #$0001                                                         ;88DDC7;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;88DDCA;
    BCS .alive                                                           ;88DDCE;
    JSL.L Spawn_HDMAObject                                               ;88DDD0;
    db $40,$32                                                           ;88DDD4;
    dw InstList_CeresHaze_ColorMathSubScnBackColor_RidleyAlive_0         ;88DDD6;
    RTL                                                                  ;88DDD8;

  .alive:
    JSL.L Spawn_HDMAObject                                               ;88DDD9;
    db $40,$32                                                           ;88DDDD;
    dw InstList_CeresHaze_ColorMathSubScnBackColor_RidleyDead_0          ;88DDDF;
    RTL                                                                  ;88DDE1;


if !FEATURE_KEEP_UNREFERENCED
;;; $DDE2: Unused. Set Ceres haze pre-instruction for no fade ;;;
UNUSED_Set_CeresHaze_PreInstruction_for_NoFade_88DDE2:
    LDA.W #UNUSED_PreInst_CeresHaze_ColorMathSubScnBackdropColor_NoFade  ;88DDE2;
    STA.W HDMAObject_PreInstructions,X                                   ;88DDE5; fallthrough to UNUSED_PreInst_CeresHaze_ColorMathSubScnBackdropColor_NoFade


;;; $DDE8: Unused. Pre-instruction - Ceres haze colour math subscreen backdrop colour - no fade ;;;
UNUSED_PreInst_CeresHaze_ColorMathSubScnBackdropColor_NoFade:
;; Parameters:
;;     X: HDMA object index

; I assume this routine was used before they realised they needed to handle door transition fade
    LDY.B #$20                                                           ;88DDE8;
    STY.B DP_ColorMathSubScreenBackdropColor0                            ;88DDEA;
    LDY.B #$40                                                           ;88DDEC;
    STY.B DP_ColorMathSubScreenBackdropColor1                            ;88DDEE;
    LDY.B #$80                                                           ;88DDF0;
    STY.B DP_ColorMathSubScreenBackdropColor2                            ;88DDF2;
    LDA.W #$002C                                                         ;88DDF4;
    STA.W LayerBlending_Config                                           ;88DDF7;
    SEP #$20                                                             ;88DDFA;
    PHX                                                                  ;88DDFC;
    LDA.W HDMAObject_Var1,X                                              ;88DDFD;
    ORA.B #$0F                                                           ;88DE00;
    LDX.B #$0F                                                           ;88DE02;

  .loop:
    STA.L HazeColorMathSubscreenBackdropColorHDMADataTable,X             ;88DE04;
    DEC                                                                  ;88DE08;
    DEX                                                                  ;88DE09;
    BPL .loop                                                            ;88DE0A;
    PLX                                                                  ;88DE0C;
    REP #$20                                                             ;88DE0D;
    RTL                                                                  ;88DE0F;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DE10: Pre-instruction - Ceres haze colour math subscreen backdrop colour - Ceres Ridley alive ;;;
PreInst_CeresHaze_ColorMathSubScnBackdropColor_RidleyIsAlive:
;; Parameters:
;;     X: HDMA object index
    LDA.W #$0080                                                         ;88DE10;
    BRA Setup_CeresHaze_ColorMathSubScnBackColor_HDMAObject_FadingIn     ;88DE13;


;;; $DE15: Pre-instruction - Ceres haze colour math subscreen backdrop colour - Ceres Ridley dead ;;;
PreInst_CeresHaze_ColorMathSubScnBackdropColor_RidleyIsDead:
;; Parameters:
;;     X: HDMA object index
    LDA.W #$0020                                                         ;88DE15; fallthrough to Setup_CeresHaze_ColorMathSubScnBackColor_HDMAObject_FadingIn


;;; $DE18: Set up Ceres haze colour math subscreen backdrop colour HDMA object pre-instruction for fading in ;;;
Setup_CeresHaze_ColorMathSubScnBackColor_HDMAObject_FadingIn:
;; Parameters:
;;     X: HDMA object index
    STA.W HDMAObject_Var1,X                                              ;88DE18;
    STZ.W HDMAObject_Var0,X                                              ;88DE1B;
    LDA.W DoorTransitionFunction                                         ;88DE1E;
    CMP.W #DoorTransitionFunction_FadeInTheScreen_and_RunEnemies_Finish  ;88DE21;
    BEQ .fadingIn                                                        ;88DE24;
    RTL                                                                  ;88DE26;

  .fadingIn:
    LDA.W #PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadingIn    ;88DE27;
    STA.W HDMAObject_PreInstructions,X                                   ;88DE2A;


;;; $DE2D: Pre-instruction - Ceres haze colour math subscreen backdrop colour - fading in ;;;
PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadingIn:
;; Parameters:
;;     X: HDMA object index
    LDY.B #$20                                                           ;88DE2D;
    STY.B DP_ColorMathSubScreenBackdropColor0                            ;88DE2F;
    LDY.B #$40                                                           ;88DE31;
    STY.B DP_ColorMathSubScreenBackdropColor1                            ;88DE33;
    LDY.B #$80                                                           ;88DE35;
    STY.B DP_ColorMathSubScreenBackdropColor2                            ;88DE37;
    LDA.W #$002C                                                         ;88DE39;
    STA.W LayerBlending_Config                                           ;88DE3C;
    LDA.W HDMAObject_Var0,X                                              ;88DE3F;
    CMP.W #$0010                                                         ;88DE42;
    BEQ .done                                                            ;88DE45;
    PHX                                                                  ;88DE47;
    PHP                                                                  ;88DE48;
    SEP #$20                                                             ;88DE49;
    LDA.W HDMAObject_Var1,X                                              ;88DE4B;
    STA.B DP_Temp14                                                      ;88DE4E;
    LDA.W HDMAObject_Var0,X                                              ;88DE50;
    LDX.B #$0F                                                           ;88DE53;

  .loop:
    STA.B DP_Temp12                                                      ;88DE55;
    ORA.B DP_Temp14                                                      ;88DE57;
    STA.L HazeColorMathSubscreenBackdropColorHDMADataTable,X             ;88DE59;
    LDA.B DP_Temp12                                                      ;88DE5D;
    DEC                                                                  ;88DE5F;
    BPL .next                                                            ;88DE60;
    LDA.B #$00                                                           ;88DE62;

  .next:
    DEX                                                                  ;88DE64;
    BPL .loop                                                            ;88DE65;
    PLP                                                                  ;88DE67;
    PLX                                                                  ;88DE68;
    INC.W HDMAObject_Var0,X                                              ;88DE69;
    RTL                                                                  ;88DE6C;

  .done:
    LDA.W #PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadedIn     ;88DE6D;
    STA.W HDMAObject_PreInstructions,X                                   ;88DE70;
    RTL                                                                  ;88DE73;


;;; $DE74: Pre-instruction - Ceres haze colour math subscreen backdrop colour - faded in ;;;
PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadedIn:
;; Parameters:
;;     X: HDMA object index
    LDY.B #$20                                                           ;88DE74;
    STY.B DP_ColorMathSubScreenBackdropColor0                            ;88DE76;
    LDY.B #$40                                                           ;88DE78;
    STY.B DP_ColorMathSubScreenBackdropColor1                            ;88DE7A;
    LDY.B #$80                                                           ;88DE7C;
    STY.B DP_ColorMathSubScreenBackdropColor2                            ;88DE7E;
    LDA.W #$002C                                                         ;88DE80;
    STA.W LayerBlending_Config                                           ;88DE83;
    LDA.W DoorTransitionFunction                                         ;88DE86;
    CMP.W #DoorTransitionFunction_FadeOutTheScreen                       ;88DE89;
    BEQ .fadingOut                                                       ;88DE8C;
    RTL                                                                  ;88DE8E;

  .fadingOut:
    LDA.W #PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadingOut   ;88DE8F;
    STA.W HDMAObject_PreInstructions,X                                   ;88DE92;
    RTL                                                                  ;88DE95;


;;; $DE96: Pre-instruction - Ceres haze colour math subscreen backdrop colour - fading out ;;;
PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadingOut:
;; Parameters:
;;     X: HDMA object index
    LDY.B #$20                                                           ;88DE96;
    STY.B DP_ColorMathSubScreenBackdropColor0                            ;88DE98;
    LDY.B #$40                                                           ;88DE9A;
    STY.B DP_ColorMathSubScreenBackdropColor1                            ;88DE9C;
    LDY.B #$80                                                           ;88DE9E;
    STY.B DP_ColorMathSubScreenBackdropColor2                            ;88DEA0;
    LDA.W #$002C                                                         ;88DEA2;
    STA.W LayerBlending_Config                                           ;88DEA5;
    LDA.W HDMAObject_Var0,X                                              ;88DEA8;
    BEQ .return                                                          ;88DEAB;
    PHX                                                                  ;88DEAD;
    PHP                                                                  ;88DEAE;
    SEP #$20                                                             ;88DEAF;
    LDA.W HDMAObject_Var1,X                                              ;88DEB1;
    STA.B DP_Temp14                                                      ;88DEB4;
    LDA.W HDMAObject_Var0,X                                              ;88DEB6;
    LDX.B #$0F                                                           ;88DEB9;

  .loop:
    STA.B DP_Temp12                                                      ;88DEBB;
    ORA.B DP_Temp14                                                      ;88DEBD;
    STA.L HazeColorMathSubscreenBackdropColorHDMADataTable,X             ;88DEBF;
    LDA.B DP_Temp12                                                      ;88DEC3;
    DEC                                                                  ;88DEC5;
    BPL .next                                                            ;88DEC6;
    LDA.B #$00                                                           ;88DEC8;

  .next:
    DEX                                                                  ;88DECA;
    BPL .loop                                                            ;88DECB;
    PLP                                                                  ;88DECD;
    PLX                                                                  ;88DECE;
    DEC.W HDMAObject_Var0,X                                              ;88DECF;

  .return:
    RTL                                                                  ;88DED2;


;;; $DED3: Instruction list - Ceres haze colour math subscreen backdrop colour - Ceres Ridley not dead ;;;
InstList_CeresHaze_ColorMathSubScnBackColor_RidleyAlive_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88DED3;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88DED6;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DED9;
    dl PreInst_CeresHaze_ColorMathSubScnBackdropColor_RidleyIsAlive      ;88DEDB;
    dw $0001,Empty_HDMATable_88DEEA                                      ;88DEDE;

InstList_CeresHaze_ColorMathSubScnBackColor_RidleyAlive_1:
    dw $7777,IndirectHDMATable_CeresHaze_ColorMathSubScnBackdropColor    ;88DEE2;
    dw Instruction_HDMAObject_GotoY                                      ;88DEE6;
    dw InstList_CeresHaze_ColorMathSubScnBackColor_RidleyAlive_1         ;88DEE8;


;;; $DEEA: Empty HDMA table ;;;
Empty_HDMATable_88DEEA:
    db $00                                                               ;88DEEA;


;;; $DEEB: Instruction list - Ceres haze colour math subscreen backdrop colour - Ceres Ridley dead ;;;
InstList_CeresHaze_ColorMathSubScnBackColor_RidleyDead_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88DEEB;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88DEEE;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DEF1;
    dl PreInst_CeresHaze_ColorMathSubScnBackdropColor_RidleyIsDead       ;88DEF3;
    dw $0001,Empty_HDMATable_88DF02                                      ;88DEF6;

InstList_CeresHaze_ColorMathSubScnBackColor_RidleyDead_1:
    dw $7777,IndirectHDMATable_CeresHaze_ColorMathSubScnBackdropColor    ;88DEFA;
    dw Instruction_HDMAObject_GotoY                                      ;88DEFE;
    dw InstList_CeresHaze_ColorMathSubScnBackColor_RidleyDead_1          ;88DF00;


;;; $DF02: Empty HDMA table ;;;
Empty_HDMATable_88DF02:
    db $00                                                               ;88DF02;


;;; $DF03: Indirect HDMA table - Ceres haze colour math subscreen backdrop colour ;;;
IndirectHDMATable_CeresHaze_ColorMathSubScnBackdropColor:
    db $40 : dw HazeColorMathSubscreenBackdropColorHDMADataTable         ;88DF03;
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
    JSL.L Spawn_HDMAObject                                               ;88DF34;
    db $00,$2C                                                           ;88DF38;
    dw InstList_DraygonMainScreenLayers_Initial                          ;88DF3A;
    RTL                                                                  ;88DF3C;


if !FEATURE_KEEP_UNREFERENCED
;;; $DF3D: Unused ;;;
UNUSED_SpawnHDMAObject_88DF3D:
    JSL.L Spawn_HDMAObject                                               ;88DF3D;
    db $00,$2C                                                           ;88DF41;
    dw InstList_DraygonMainScreenLayers_DraygonAroundTop                 ;88DF43;
    RTL                                                                  ;88DF45;


;;; $DF46: Unused ;;;
UNUSED_SpawnHDMAObject_88DF46:
    JSL.L Spawn_HDMAObject                                               ;88DF46;
    db $02,$12                                                           ;88DF4A;
    dw UNUSED_InstList_BG3_Yscroll_0_88DF77                              ;88DF4C;
    RTL                                                                  ;88DF4E;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DF4F: Instruction list - Draygon main screen layers - initial ;;;
InstList_DraygonMainScreenLayers_Initial:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88DF4F;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $88             ;88DF52;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;88DF55;
    dl RTL_88DF91                                                        ;88DF57;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DF5A;
    dl PreInstruction_DraygonMainScreenLayers                            ;88DF5C;


;;; $DF5F: Instruction list - Draygon main screen layers - Draygon is around middle of screen ;;;
InstList_DraygonMainScreenLayers_DraygonAroundMiddle:
    dw $0001,HDMATable_DraygonMainScreenLayers_DraygonAroundMiddle       ;88DF5F;
    dw Instruction_HDMAObject_Sleep                                      ;88DF63;


;;; $DF65: Instruction list - Draygon main screen layers - Draygon is around bottom of screen ;;;
InstList_DraygonMainScreenLayers_DraygonAroundBottom:
    dw $0001,HDMATable_DraygonMainScreenLayers_DraygonAroundBottom       ;88DF65;
    dw Instruction_HDMAObject_Sleep                                      ;88DF69;


;;; $DF6B: Instruction list - Draygon main screen layers - Draygon is around top of screen ;;;
InstList_DraygonMainScreenLayers_DraygonAroundTop:
    dw $0001,HDMATable_DraygonMainScreenLayers_DraygonAroundTop          ;88DF6B;
    dw Instruction_HDMAObject_Sleep                                      ;88DF6F;


;;; $DF71: Instruction list - Draygon main screen layers - Draygon is off-screen ;;;
InstList_DraygonMainScreenLayers_DraygonOffScreen:
    dw $0001,HDMATable_DraygonMainScreenLayers_DraygonOffScreen          ;88DF71;
    dw Instruction_HDMAObject_Sleep                                      ;88DF75;


if !FEATURE_KEEP_UNREFERENCED
;;; $DF77: Instruction list - unused BG3 Y scroll ;;;
UNUSED_InstList_BG3_Yscroll_0_88DF77:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88DF77;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $88             ;88DF7A;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;88DF7D;
    dl RTL_88DF92                                                        ;88DF7F;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DF82;
    dl RTL_88DF93                                                        ;88DF84;

UNUSED_InstList_BG3_Yscroll_1_88DF87:
    dw $0001,UNUSED_HDMATable_BG3_Yscroll                                ;88DF87;
    dw Instruction_HDMAObject_GotoY                                      ;88DF8B;
    dw UNUSED_InstList_BG3_Yscroll_1_88DF87                              ;88DF8D;
    dw Instruction_HDMAObject_Sleep                                      ;88DF8F;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DF91: RTL ;;;
RTL_88DF91:
    RTL                                                                  ;88DF91;


;;; $DF92: RTL ;;;
RTL_88DF92:
    RTL                                                                  ;88DF92;


;;; $DF93: RTL ;;;
RTL_88DF93:
    RTL                                                                  ;88DF93;


;;; $DF94: Pre-instruction - Draygon main screen layers ;;;
PreInstruction_DraygonMainScreenLayers:
;; Parameters:
;;     X: HDMA object index
    LDA.W Enemy.properties                                               ;88DF94;
    BIT.W #$0200                                                         ;88DF97;
    BNE .offScreen                                                       ;88DF9A;
    LDA.W Enemy.XPosition                                                ;88DF9C;
    SEC                                                                  ;88DF9F;
    SBC.W Layer1XPosition                                                ;88DFA0;
    CLC                                                                  ;88DFA3;
    ADC.W #$0040                                                         ;88DFA4;
    BMI .offScreen                                                       ;88DFA7;
    CMP.W #$0180                                                         ;88DFA9;
    BPL .offScreen                                                       ;88DFAC;
    LDA.W Enemy.YPosition                                                ;88DFAE;
    SEC                                                                  ;88DFB1;
    SBC.W Layer1YPosition                                                ;88DFB2;
    CLC                                                                  ;88DFB5;
    ADC.W #$0010                                                         ;88DFB6;
    BMI .offScreen                                                       ;88DFB9;
    LDA.W Enemy.YPosition                                                ;88DFBB;
    SEC                                                                  ;88DFBE;
    SBC.W Layer1YPosition                                                ;88DFBF;
    CMP.W #$0130                                                         ;88DFC2;
    BPL .offScreen                                                       ;88DFC5;
    CMP.W #$0028                                                         ;88DFC7;
    BMI .aroundTop                                                       ;88DFCA;
    CMP.W #$00C0                                                         ;88DFCC;
    BMI .aroundMiddle                                                    ;88DFCF;
    BRA .aroundBottom                                                    ;88DFD1;

  .aroundTop:
    LDA.W #$0001                                                         ;88DFD3;
    STA.W HDMAObject_InstructionTimers,X                                 ;88DFD6;
    LDA.W #InstList_DraygonMainScreenLayers_DraygonAroundTop             ;88DFD9;
    STA.W HDMAObject_InstListPointers,X                                  ;88DFDC;
    RTL                                                                  ;88DFDF;

  .offScreen:
    LDA.W #$0001                                                         ;88DFE0;
    STA.W HDMAObject_InstructionTimers,X                                 ;88DFE3;
    LDA.W #InstList_DraygonMainScreenLayers_DraygonOffScreen             ;88DFE6;
    STA.W HDMAObject_InstListPointers,X                                  ;88DFE9;
    RTL                                                                  ;88DFEC;

  .aroundBottom:
    LDA.W #$0001                                                         ;88DFED;
    STA.W HDMAObject_InstructionTimers,X                                 ;88DFF0;
    LDA.W #InstList_DraygonMainScreenLayers_DraygonAroundBottom          ;88DFF3;
    STA.W HDMAObject_InstListPointers,X                                  ;88DFF6;
    RTL                                                                  ;88DFF9;

  .aroundMiddle:
    LDA.W #$0001                                                         ;88DFFA;
    STA.W HDMAObject_InstructionTimers,X                                 ;88DFFD;
    LDA.W #InstList_DraygonMainScreenLayers_DraygonAroundMiddle          ;88E000;
    STA.W HDMAObject_InstListPointers,X                                  ;88E003;
    RTL                                                                  ;88E006;


;;; $E007: HDMA table - Draygon main screen layers - Draygon is around middle of screen ;;;
HDMATable_DraygonMainScreenLayers_DraygonAroundMiddle:                   ;88E007;
    db $1F,$04 ;         BG3
    db $81,$13 ; BG1/BG2/    sprites
    db $00


;;; $E00C: HDMA table - Draygon main screen layers - Draygon is around bottom of screen ;;;
HDMATable_DraygonMainScreenLayers_DraygonAroundBottom:                   ;88E00C;
    db $1F,$04 ;         BG3
    db $60,$11 ; BG1/        sprites
    db $81,$13 ; BG1/BG2/    sprites
    db $00


;;; $E013: HDMA table - Draygon main screen layers - Draygon is around top of screen ;;;
HDMATable_DraygonMainScreenLayers_DraygonAroundTop:                      ;88E013;
    db $1F,$04 ;         BG3
    db $40,$13 ; BG1/BG2/    sprites
    db $81,$11 ; BG1/        sprites
    db $00


;;; $E01A: HDMA table - Draygon main screen layers - Draygon is off-screen ;;;
HDMATable_DraygonMainScreenLayers_DraygonOffScreen:                      ;88E01A;
    db $1F,$04 ;         BG3
    db $81,$11 ; BG1/        sprites
    db $00


if !FEATURE_KEEP_UNREFERENCED
;;; $E01F: HDMA table - unused BG3 Y scroll ;;;
UNUSED_HDMATable_BG3_Yscroll:
    db $40 : dw $0000                                                    ;88E01F;
    db $81 : dw $0020
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E026: Pre-instruction - varia suit pickup ;;;
PreInstruction_VariaSuitPickup:
    PHP                                                                  ;88E026;
    REP #$30                                                             ;88E027;
    LDA.W SuitPickup_Stage                                               ;88E029;
    ASL                                                                  ;88E02C;
    TAX                                                                  ;88E02D;
    JSR.W (.pointers,X)                                                  ;88E02E;
    BCC .return                                                          ;88E031;
    SEP #$20                                                             ;88E033;
    LDA.W SuitPickup_ColorMathRed                                        ;88E035;
    STA.B DP_ColorMathSubScreenBackdropColor0                            ;88E038;
    LDA.W SuitPickup_ColorMathGreen                                      ;88E03A;
    STA.B DP_ColorMathSubScreenBackdropColor1                            ;88E03D;
    LDA.W SuitPickup_ColorMathBlue                                       ;88E03F;
    STA.B DP_ColorMathSubScreenBackdropColor2                            ;88E042;
    REP #$20                                                             ;88E044;
    LDA.W #$0012                                                         ;88E046;
    STA.W LayerBlending_Config                                           ;88E049;

  .return:
    PLP                                                                  ;88E04C;
    RTL                                                                  ;88E04D;

  .pointers:
    dw SuitPickup_Stage0_LightBeamAppears                                ;88E04E;
    dw SuitPickup_Stage1_LightBeamWidens_Linear                          ;88E050;
    dw SuitPickup_Stage2_LightBeamWidens_Curved                          ;88E052;
    dw VariaSuitPickup_Stage3_GiveSamusVariaSuit                         ;88E054;
    dw SuitPickup_Stage4_LightBeamShrinks                                ;88E056;
    dw SuitPickup_Stage5_LightBeamDissipates                             ;88E058;
    dw VariaSuitPickup_Stage6                                            ;88E05A;


;;; $E05C: Pre-instruction - gravity suit pickup ;;;
PreInstruction_GravitySuitPickup:
    PHP                                                                  ;88E05C;
    REP #$30                                                             ;88E05D;
    LDA.W SuitPickup_Stage                                               ;88E05F;
    ASL                                                                  ;88E062;
    TAX                                                                  ;88E063;
    JSR.W (.poitners,X)                                                  ;88E064;
    BCC .return                                                          ;88E067;
    SEP #$20                                                             ;88E069;
    LDA.W SuitPickup_ColorMathRed                                        ;88E06B;
    STA.B DP_ColorMathSubScreenBackdropColor0                            ;88E06E;
    LDA.W SuitPickup_ColorMathGreen                                      ;88E070;
    STA.B DP_ColorMathSubScreenBackdropColor1                            ;88E073;
    LDA.W SuitPickup_ColorMathBlue                                       ;88E075;
    STA.B DP_ColorMathSubScreenBackdropColor2                            ;88E078;
    REP #$20                                                             ;88E07A;
    LDA.W #$0012                                                         ;88E07C;
    STA.W LayerBlending_Config                                           ;88E07F;

  .return:
    PLP                                                                  ;88E082;
    RTL                                                                  ;88E083;

  .poitners:
    dw SuitPickup_Stage0_LightBeamAppears                                ;88E084;
    dw SuitPickup_Stage1_LightBeamWidens_Linear                          ;88E086;
    dw SuitPickup_Stage2_LightBeamWidens_Curved                          ;88E088;
    dw GravitySuitPickup_Stage3_GiveSamusGravitySuit                     ;88E08A;
    dw SuitPickup_Stage4_LightBeamShrinks                                ;88E08C;
    dw SuitPickup_Stage5_LightBeamDissipates                             ;88E08E;
    dw GravitySuitPickup_Stage6                                          ;88E090;


;;; $E092: Suit pickup stage 0 - light beam appears ;;;
SuitPickup_Stage0_LightBeamAppears:
;; Returns:
;;     Carry: Set. Not finished
    LDA.W SuitPickup_LightBeamHeight                                     ;88E092;
    CLC                                                                  ;88E095;
    ADC.W #$0008                                                         ;88E096;
    STA.W SuitPickup_LightBeamHeight                                     ;88E099;
    TAY                                                                  ;88E09C;
    LDX.W #$0000                                                         ;88E09D;

  .loopUpperHalf:
    LDA.W .positions                                                     ;88E0A0;
    STA.L SuitPickupWindow1HDMADataTable,X                               ;88E0A3;
    INX                                                                  ;88E0A7;
    INX                                                                  ;88E0A8;
    DEY                                                                  ;88E0A9;
    BEQ +                                                                ;88E0AA;
    BPL .loopUpperHalf                                                   ;88E0AC;

+   LDX.W #$01FE                                                         ;88E0AE;
    LDY.W SuitPickup_LightBeamHeight                                     ;88E0B1;

  .loopLowerHalf:
    LDA.W .positions                                                     ;88E0B4;
    STA.L SuitPickupWindow1HDMADataTable,X                               ;88E0B7;
    DEX                                                                  ;88E0BB;
    DEX                                                                  ;88E0BC;
    DEY                                                                  ;88E0BD;
    BEQ +                                                                ;88E0BE;
    BPL .loopLowerHalf                                                   ;88E0C0;

+   LDA.W SuitPickup_LightBeamHeight                                     ;88E0C2;
    CMP.W #$0080                                                         ;88E0C5;
    BMI .return                                                          ;88E0C8;
    INC.W SuitPickup_Stage                                               ;88E0CA;
    LDA.W #$7878                                                         ;88E0CD;
    STA.W SuitPickup_LightBeamHeight                                     ;88E0D0;

  .return:
    SEC                                                                  ;88E0D3;
    RTS                                                                  ;88E0D4;

  .positions:
    db $78,$78                                                           ;88E0D5;


;;; $E0D7: Suit pickup stage 1 - light beam widens - linear ;;;
SuitPickup_Stage1_LightBeamWidens_Linear:
;; Returns:
;;     Carry: Set. Not finished
    SEP #$20                                                             ;88E0D7;
    LDA.W SuitPickup_LightBeamLeftRightPositions                         ;88E0D9;
    SEC                                                                  ;88E0DC;
    SBC.W SuitPickupLightBeamWideningSpeed+1                             ;88E0DD;
    STA.W SuitPickup_LightBeamLeftRightPositions                         ;88E0E0;
    LDA.W SuitPickup_LightBeamLeftRightPositions+1                       ;88E0E3;
    CLC                                                                  ;88E0E6;
    ADC.W SuitPickupLightBeamWideningSpeed+1                             ;88E0E7;
    STA.W SuitPickup_LightBeamLeftRightPositions+1                       ;88E0EA;
    REP #$20                                                             ;88E0ED;
    LDX.W #$01FE                                                         ;88E0EF;

  .loop:
    LDA.W SuitPickup_LightBeamLeftRightPositions                        ;88E0F2;
    STA.L SuitPickupWindow1HDMADataTable,X                              ;88E0F5;
    DEX                                                                 ;88E0F9;
    DEX                                                                 ;88E0FA;
    BPL .loop                                                           ;88E0FB;
    LDA.W SuitPickup_LightBeamLeftRightPositions                        ;88E0FD;
    AND.W #$00FF                                                        ;88E100;
    CMP.W #$0061                                                        ;88E103;
    BPL .return                                                         ;88E106;
    INC.W SuitPickup_Stage                                              ;88E108;
    LDA.W #$846C                                                        ;88E10B; Suit pickup light beam left position = 6Ch, right position = 84h
    STA.W SuitPickup_LightBeamLeftRightPositions                        ;88E10E;

  .return:
    SEC                                                                  ;88E111;
    RTS                                                                  ;88E112;


;;; $E113: Suit pickup stage 2 - light beam widens - curved ;;;
SuitPickup_Stage2_LightBeamWidens_Curved:
    JSR.W AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToWhite    ;88E113;
    REP #$10                                                             ;88E116;
    SEP #$20                                                             ;88E118;
    LDA.W SuitPickup_LightBeamLeftRightPositions                         ;88E11A;
    SEC                                                                  ;88E11D;
    SBC.W SuitPickupLightBeamWideningSpeed+1                             ;88E11E;
    STA.W SuitPickup_LightBeamLeftRightPositions                         ;88E121;
    BEQ .lessThanZero                                                    ;88E124;
    BMI .lessThanZero                                                    ;88E126;
    LDA.W SuitPickup_LightBeamLeftRightPositions+1                       ;88E128;
    CLC                                                                  ;88E12B;
    ADC.W SuitPickupLightBeamWideningSpeed+1                             ;88E12C;
    BCC .greaterThanZero                                                 ;88E12F;
    LDA.B #$FF                                                           ;88E131;

  .greaterThanZero:
    STA.W SuitPickup_LightBeamLeftRightPositions+1                       ;88E133;
    REP #$20                                                             ;88E136;
    BRA .loopSetup                                                       ;88E138;

  .lessThanZero:
    REP #$20                                                             ;88E13A;
    LDA.W #$FF00                                                         ;88E13C;
    STA.W SuitPickup_LightBeamLeftRightPositions                         ;88E13F;

  .loopSetup:
    SEP #$20                                                             ;88E142;
    LDX.W #$0000                                                         ;88E144;
    LDY.W #$0000                                                         ;88E147;

  .loopUpperHalf:
    LDA.W SuitPickup_LightBeamLeftRightPositions                         ;88E14A;
    SEC                                                                  ;88E14D;
    SBC.W SuitPickup_LightBeam_CurveWidths,Y                             ;88E14E;
    BPL +                                                                ;88E151;
    LDA.B #$00                                                           ;88E153;

+   STA.L SuitPickupWindow1HDMADataTable,X                               ;88E155;
    INX                                                                  ;88E159;
    LDA.W SuitPickup_LightBeamLeftRightPositions+1                       ;88E15A;
    CLC                                                                  ;88E15D;
    ADC.W SuitPickup_LightBeam_CurveWidths,Y                             ;88E15E;
    BCC +                                                                ;88E161;
    LDA.B #$FF                                                           ;88E163;

+   STA.L SuitPickupWindow1HDMADataTable,X                               ;88E165;
    INX                                                                  ;88E169;
    INY                                                                  ;88E16A;
    CPX.W #$0100                                                         ;88E16B;
    BMI .loopUpperHalf                                                   ;88E16E;
    DEY                                                                  ;88E170;

  .loopLowerHalf:
    LDA.W SuitPickup_LightBeamLeftRightPositions                         ;88E171;
    SEC                                                                  ;88E174;
    SBC.W SuitPickup_LightBeam_CurveWidths,Y                             ;88E175;
    BPL +                                                                ;88E178;
    LDA.B #$00                                                           ;88E17A;

+   STA.L SuitPickupWindow1HDMADataTable,X                               ;88E17C;
    INX                                                                  ;88E180;
    LDA.W SuitPickup_LightBeamLeftRightPositions+1                       ;88E181;
    CLC                                                                  ;88E184;
    ADC.W SuitPickup_LightBeam_CurveWidths,Y                             ;88E185;
    BCC +                                                                ;88E188;
    LDA.B #$FF                                                           ;88E18A;

+   STA.L SuitPickupWindow1HDMADataTable,X                               ;88E18C;
    INX                                                                  ;88E190;
    DEY                                                                  ;88E191;
    CPX.W #$0200                                                         ;88E192;
    BMI .loopLowerHalf                                                   ;88E195;
    REP #$20                                                             ;88E197;
    LDA.W SuitPickupLightBeamWideningSpeed                               ;88E199;
    CLC                                                                  ;88E19C;
    ADC.W #$0060                                                         ;88E19D;
    STA.W SuitPickupLightBeamWideningSpeed                               ;88E1A0;
    LDA.W SuitPickup_LightBeamLeftRightPositions                         ;88E1A3;
    CMP.W #$FF00                                                         ;88E1A6;
    BNE .return                                                          ;88E1A9;
    INC.W SuitPickup_Stage                                               ;88E1AB;
    LDA.W SuitPickupLightBeamWideningSpeed                               ;88E1AE;
    LSR                                                                  ;88E1B1;
    STA.W SuitPickupLightBeamWideningSpeed                               ;88E1B2;
    STZ.W SuitPickup_LightBeamLeftRightPositions                         ;88E1B5;

  .return:
    SEC                                                                  ;88E1B8;
    RTS                                                                  ;88E1B9;


;;; $E1BA: Suit pickup stage 4 - light beam shrinks ;;;
SuitPickup_Stage4_LightBeamShrinks:
;; Returns:
;;     Carry: Set. Not finished
    LDA.W SuitPickup_ColorMathBlue                                       ;88E1BA;
    BIT.W #$FF00                                                         ;88E1BD;
    BNE .advanceToOrange                                                 ;88E1C0;
    JSR.W AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToOrange   ;88E1C2;
    BRA +                                                                ;88E1C5;

  .advanceToOrange:
    JSR.W AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToBlue     ;88E1C7;

+   LDA.W SuitPickupLightBeamWideningSpeed                               ;88E1CA;
    AND.W #$FF00                                                         ;88E1CD;
    XBA                                                                  ;88E1D0;
    STA.B DP_Temp12                                                      ;88E1D1;
    LDA.W SuitPickup_LightBeamTopPosition                                ;88E1D3;
    CLC                                                                  ;88E1D6;
    ADC.B DP_Temp12                                                      ;88E1D7;
    STA.W SuitPickup_LightBeamTopPosition                                ;88E1D9;
    TAY                                                                  ;88E1DC;
    LDX.W #$0000                                                         ;88E1DD;

  .loopUpperHalf:
    LDA.W #$00FF                                                         ;88E1E0;
    STA.L SuitPickupWindow1HDMADataTable,X                               ;88E1E3;
    INX                                                                  ;88E1E7;
    INX                                                                  ;88E1E8;
    DEY                                                                  ;88E1E9;
    BEQ .setupLowerLoop                                                  ;88E1EA;
    BPL .loopUpperHalf                                                   ;88E1EC;

  .setupLowerLoop:
    LDX.W #$01FE                                                         ;88E1EE;
    LDY.W SuitPickup_LightBeamTopPosition                                ;88E1F1;
    DEY                                                                  ;88E1F4;

  .loopLowerHalf:
    LDA.W #$00FF                                                         ;88E1F5;
    STA.L SuitPickupWindow1HDMADataTable,X                               ;88E1F8;
    DEX                                                                  ;88E1FC;
    DEX                                                                  ;88E1FD;
    DEY                                                                  ;88E1FE;
    BEQ +                                                                ;88E1FF;
    BPL .loopLowerHalf                                                   ;88E201;

+   LDA.W SuitPickupLightBeamWideningSpeed                               ;88E203;
    SEC                                                                  ;88E206;
    SBC.W #$0020                                                         ;88E207;
    STA.W SuitPickupLightBeamWideningSpeed                               ;88E20A;
    CMP.W #$0100                                                         ;88E20D;
    BPL +                                                                ;88E210;
    LDA.W #$0100                                                         ;88E212;
    STA.W SuitPickupLightBeamWideningSpeed                               ;88E215;

+   LDA.W SuitPickup_LightBeamTopPosition                                ;88E218;
    CMP.W #$0080                                                         ;88E21B;
    BMI .return                                                          ;88E21E;
    INC.W SuitPickup_Stage                                               ;88E220;
    LDA.W #$F8FF                                                         ;88E223;
    STA.W SuitPickup_LightBeamTopPosition                                ;88E226;

  .return:
    SEC                                                                  ;88E229;
    RTS                                                                  ;88E22A;


;;; $E22B: Suit pickup stage 5 - light beam dissipates ;;;
SuitPickup_Stage5_LightBeamDissipates:
;; Returns:
;;     Carry: Set. Not finished
    SEP #$20                                                             ;88E22B;
    LDA.W SuitPickup_LightBeamLeftRightPositions                         ;88E22D;
    CLC                                                                  ;88E230;
    ADC.B #$08                                                           ;88E231;
    STA.W SuitPickup_LightBeamLeftRightPositions                         ;88E233;
    LDA.W SuitPickup_LightBeamLeftRightPositions+1                       ;88E236;
    SEC                                                                  ;88E239;
    SBC.B #$08                                                           ;88E23A;
    STA.W SuitPickup_LightBeamLeftRightPositions+1                       ;88E23C;
    REP #$20                                                             ;88E23F;
    LDA.W SuitPickup_LightBeamLeftRightPositions                         ;88E241;
    STA.L SuitPickupWindow1HDMADataTable+$100                            ;88E244;
    LDA.W SuitPickup_LightBeamLeftRightPositions                         ;88E248;
    AND.W #$00FF                                                         ;88E24B;
    CMP.W #$0070                                                         ;88E24E;
    BMI .return                                                          ;88E251;
    INC.W SuitPickup_Stage                                               ;88E253;

  .return:
    SEC                                                                  ;88E256;
    RTS                                                                  ;88E257;


;;; $E258: Varia suit pickup stage 6 ;;;
VariaSuitPickup_Stage6:
;; Returns:
;;     Carry: Clear. Finished
    LDA.W #$0003                                                         ;88E258;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;88E25B; fallthrough to GravitySuitPickup_Stage6


;;; $E25F: Gravity suit pickup stage 6 ;;;
GravitySuitPickup_Stage6:
;; Returns:
;;     Carry: Clear. Finished

; Called by varia suit pickup stage 6 too
    SEP #$20                                                             ;88E25F;
    LDA.B #$80                                                           ;88E261;
    STA.B DP_ColorMathSubScreenBackdropColor2                            ;88E263;
    LDA.B #$40                                                           ;88E265;
    STA.B DP_ColorMathSubScreenBackdropColor1                            ;88E267;
    LDA.B #$20                                                           ;88E269;
    STA.B DP_ColorMathSubScreenBackdropColor0                            ;88E26B;
    REP #$20                                                             ;88E26D;
    LDA.W #$0001                                                         ;88E26F;
    STA.W SuitPickupIndirectHDMATable                                    ;88E272;
    LDA.W #SuitPickupWindow1HDMADataTable                                ;88E275;
    STA.W Xray_IndirectHDMATable+1                                       ;88E278;
    STZ.W Xray_IndirectHDMATable+3                                       ;88E27B;
    STZ.W Xray_IndirectHDMATable+4                                       ;88E27E;
    STZ.W Xray_IndirectHDMATable+6                                       ;88E281;
    STZ.W Xray_IndirectHDMATable+8                                       ;88E284;
    LDA.W #$00FF                                                         ;88E287;
    STA.L SuitPickupWindow1HDMADataTable                                 ;88E28A;
    STZ.W SuitPickup_Stage                                               ;88E28E;
    STZ.W SuitPickup_Var                                                 ;88E291;
    STZ.W SuitPickup_ColorMathRed                                        ;88E294;
    STZ.W SuitPickup_ColorMathBlue                                       ;88E297;
    LDX.W HDMAObject_Index                                               ;88E29A;
    LDA.W HDMAObject_InstListPointers,X                                  ;88E29D;
    INC                                                                  ;88E2A0;
    INC                                                                  ;88E2A1;
    STA.W HDMAObject_InstListPointers,X                                  ;88E2A2;
    LDA.W #$0001                                                         ;88E2A5;
    STA.W HDMAObject_InstructionTimers,X                                 ;88E2A8;
    LDA.W #$000B                                                         ;88E2AB;
    JSL.L Run_Samus_Command                                              ;88E2AE;
    CLC                                                                  ;88E2B2;
    RTS                                                                  ;88E2B3;


;;; $E2B4: Advance suit pickup colour math subscreen backdrop transition to white ;;;
AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToWhite:
    SEP #$20                                                             ;88E2B4;
    LDA.W SuitPickup_ColorMathRed                                        ;88E2B6;
    CMP.B #$3F                                                           ;88E2B9;
    BEQ .green                                                           ;88E2BB;
    INC                                                                  ;88E2BD;
    INC                                                                  ;88E2BE;
    STA.W SuitPickup_ColorMathRed                                        ;88E2BF;
    CMP.B #$40                                                           ;88E2C2;
    BMI .green                                                           ;88E2C4;
    LDA.B #$3F                                                           ;88E2C6;
    STA.W SuitPickup_ColorMathRed                                        ;88E2C8;

  .green:
    LDA.W SuitPickup_ColorMathGreen                                      ;88E2CB;
    CMP.B #$5F                                                           ;88E2CE;
    BEQ .blue                                                            ;88E2D0;
    INC                                                                  ;88E2D2;
    INC                                                                  ;88E2D3;
    STA.W SuitPickup_ColorMathGreen                                      ;88E2D4;
    CMP.B #$60                                                           ;88E2D7;
    BMI .blue                                                            ;88E2D9;
    LDA.B #$5F                                                           ;88E2DB;
    STA.W SuitPickup_ColorMathGreen                                      ;88E2DD;

  .blue:
    LDA.W SuitPickup_ColorMathBlue                                       ;88E2E0;
    CMP.B #$9F                                                           ;88E2E3;
    BEQ .return                                                          ;88E2E5;
    INC                                                                  ;88E2E7;
    INC                                                                  ;88E2E8;
    STA.W SuitPickup_ColorMathBlue                                       ;88E2E9;
    CMP.B #$A0                                                           ;88E2EC;
    BMI .return                                                          ;88E2EE;
    LDA.B #$9F                                                           ;88E2F0;
    STA.W SuitPickup_ColorMathBlue                                       ;88E2F2;

  .return:
    REP #$20                                                             ;88E2F5;
    SEC                                                                  ;88E2F7;
    RTS                                                                  ;88E2F8;


;;; $E2F9: Advance suit pickup colour math subscreen backdrop transition to orange ;;;
AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToOrange:
    SEP #$20                                                             ;88E2F9;
    LDA.W SuitPickup_ColorMathRed                                        ;88E2FB;
    CMP.B #$3F                                                           ;88E2FE;
    BEQ .green                                                           ;88E300;
    DEC                                                                  ;88E302;
    STA.W SuitPickup_ColorMathRed                                        ;88E303;

  .green:
    LDA.W SuitPickup_ColorMathGreen                                      ;88E306;
    CMP.B #$4D                                                           ;88E309;
    BEQ .blue                                                            ;88E30B;
    DEC                                                                  ;88E30D;
    STA.W SuitPickup_ColorMathGreen                                      ;88E30E;

  .blue:
    LDA.W SuitPickup_ColorMathBlue                                       ;88E311;
    CMP.B #$83                                                           ;88E314;
    BEQ .return                                                          ;88E316;
    DEC                                                                  ;88E318;
    STA.W SuitPickup_ColorMathBlue                                       ;88E319;

  .return:
    REP #$20                                                             ;88E31C;
    SEC                                                                  ;88E31E;
    RTS                                                                  ;88E31F;


;;; $E320: Varia suit pickup stage 3 - give Samus varia suit ;;;
VariaSuitPickup_Stage3_GiveSamusVariaSuit:
;; Returns:
;;     Carry: Set. Not finished

; This code is all redundant, as varia suit is already given to Samus by the PLM
    LDA.W EquippedItems                                                  ;88E320;
    ORA.W #$0001                                                         ;88E323;
    STA.W EquippedItems                                                  ;88E326;
    LDA.W CollectedItems                                                 ;88E329;
    ORA.W #$0001                                                         ;88E32C;
    STA.W CollectedItems                                                 ;88E32F;
    LDA.W #$009B                                                         ;88E332;
    STA.W Pose                                                           ;88E335;
    JSL.L InitializeSamusPose_1                                          ;88E338;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;88E33C;
    LDA.W PreviousPose                                                   ;88E340;
    STA.W LastDifferentPose                                              ;88E343;
    LDA.W PreviousPoseXDirection                                         ;88E346;
    STA.W LastDifferentPoseXDirection                                    ;88E349;
    LDA.W Pose                                                           ;88E34C;
    STA.W PreviousPose                                                   ;88E34F;
    LDA.W PoseXDirection                                                 ;88E352;
    STA.W PreviousPoseXDirection                                         ;88E355;
    JSL.L LoadSamusSuitPalette                                           ;88E358;
    INC.W SuitPickup_Stage                                               ;88E35C;
    SEC                                                                  ;88E35F;
    RTS                                                                  ;88E360;


;;; $E361: Gravity suit pickup stage 3 - give Samus gravity suit ;;;
GravitySuitPickup_Stage3_GiveSamusGravitySuit:
;; Returns:
;;     Carry: Set. Not finished

; This code is all redundant, as gravity suit is already given to Samus by the PLM
    LDA.W EquippedItems                                                  ;88E361;
    ORA.W #$0020                                                         ;88E364;
    STA.W EquippedItems                                                  ;88E367;
    LDA.W CollectedItems                                                 ;88E36A;
    ORA.W #$0020                                                         ;88E36D;
    STA.W CollectedItems                                                 ;88E370;
    LDA.W #$009B                                                         ;88E373;
    STA.W Pose                                                           ;88E376;
    JSL.L InitializeSamusPose_1                                          ;88E379;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;88E37D;
    LDA.W PreviousPose                                                   ;88E381;
    STA.W LastDifferentPose                                              ;88E384;
    LDA.W PreviousPoseXDirection                                         ;88E387;
    STA.W LastDifferentPoseXDirection                                    ;88E38A;
    LDA.W Pose                                                           ;88E38D;
    STA.W PreviousPose                                                   ;88E390;
    LDA.W PoseXDirection                                                 ;88E393;
    STA.W PreviousPoseXDirection                                         ;88E396;
    JSL.L LoadSamusSuitPalette                                           ;88E399;
    INC.W SuitPickup_Stage                                               ;88E39D;
    SEC                                                                  ;88E3A0;
    RTS                                                                  ;88E3A1;


;;; $E3A2: Advance suit pickup colour math subscreen backdrop transition to blue ;;;
AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToBlue:
    SEP #$20                                                             ;88E3A2;
    LDA.W SuitPickup_ColorMathRed                                        ;88E3A4;
    CMP.B #$30                                                           ;88E3A7;
    BEQ .green                                                           ;88E3A9;
    DEC                                                                  ;88E3AB;
    STA.W SuitPickup_ColorMathRed                                        ;88E3AC;

  .green:
    LDA.W SuitPickup_ColorMathGreen                                      ;88E3AF;
    CMP.B #$49                                                           ;88E3B2;
    BEQ .blue                                                            ;88E3B4;
    DEC                                                                  ;88E3B6;
    STA.W SuitPickup_ColorMathGreen                                      ;88E3B7;

  .blue:
    LDA.W SuitPickup_ColorMathBlue                                       ;88E3BA;
    CMP.B #$90                                                           ;88E3BD;
    BEQ .return                                                          ;88E3BF;
    DEC                                                                  ;88E3C1;
    STA.W SuitPickup_ColorMathBlue                                       ;88E3C2;

  .return:
    REP #$20                                                             ;88E3C5;
    SEC                                                                  ;88E3C7;
    RTS                                                                  ;88E3C8;


;;; $E3C9: Suit pickup light beam curve widths ;;;
SuitPickup_LightBeam_CurveWidths:
; Indexed by scanline for upper half (`FFh - scanline` for lower half)
    db $01,$02,$03,$04,$05,$06,$07,$07,$08,$08,$09,$09,$0A,$0A,$0B,$0B   ;88E3C9;
    db $0B,$0C,$0C,$0C,$0D,$0D,$0D,$0E,$0E,$0E,$0E,$0F,$0F,$0F,$0F,$10   ;88E3D9;
    db $10,$10,$10,$10,$11,$11,$11,$11,$11,$11,$12,$12,$12,$12,$12,$12   ;88E3E9;
    db $13,$13,$13,$13,$13,$13,$14,$14,$14,$14,$14,$14,$14,$14,$15,$15   ;88E3F9;
    db $15,$15,$15,$15,$15,$15,$15,$15,$16,$16,$16,$16,$16,$16,$16,$16   ;88E409;
    db $16,$16,$16,$16,$17,$17,$17,$17,$17,$17,$17,$17,$17,$17,$17,$17   ;88E419;
    db $17,$17,$17,$17,$17,$17,$17,$18,$18,$18,$18,$18,$18,$18,$18,$18   ;88E429;
    db $18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18   ;88E439;


;;; $E449: Pre-instruction - Phantoon semi-transparency ;;;
PreInstruction_PhantoonSemiTransparency:
    PHP                                                                  ;88E449;
    SEP #$10                                                             ;88E44A;
    REP #$20                                                             ;88E44C;
    BIT.W LayerBlending_PhantoonSemiTransparencyFlag                     ;88E44E;
    BVS .semiTransparent                                                 ;88E451;
    LDX.W Phantoon.semiTransparencyHDMAObjectControl                     ;88E453;
    BEQ .BG2Disabled                                                     ;88E456;
    CPX.B #$FF                                                           ;88E458;
    BEQ .delete                                                          ;88E45A;
    BRA .return                                                          ;88E45C;

  .BG2Disabled:
    LDA.W #$0004                                                         ;88E45E;
    STA.W LayerBlending_Config                                           ;88E461;
    BRA .return                                                          ;88E464;

  .semiTransparent:
    LDA.W #$001A                                                         ;88E466;
    STA.W LayerBlending_Config                                           ;88E469;

  .return:
    PLP                                                                  ;88E46C;
    RTL                                                                  ;88E46D;

  .delete:
    LDA.W #$0004                                                         ;88E46E;
    STA.W LayerBlending_Config                                           ;88E471;
    LDX.W HDMAObject_Index                                               ;88E474;
    LDA.W HDMAObject_InstListPointers,X                                  ;88E477;
    INC                                                                  ;88E47A;
    INC                                                                  ;88E47B;
    STA.W HDMAObject_InstListPointers,X                                  ;88E47C;
    LDA.W #$0001                                                         ;88E47F;
    STA.W HDMAObject_InstructionTimers,X                                 ;88E482;
    PLP                                                                  ;88E485;
    RTL                                                                  ;88E486;


;;; $E487: Spawn wavy Phantoon HDMA object ;;;
Spawn_WavyPhantoon_HDMAObject:
    PHP                                                                  ;88E487;
    PHB                                                                  ;88E488;
    PHK                                                                  ;88E489;
    PLB                                                                  ;88E48A;
    REP #$30                                                             ;88E48B;
    PHX                                                                  ;88E48D;
    STA.W Phantoon.nextWavyPhantoonMode                                  ;88E48E;
    STZ.W Phantoon.wavyPhantoonPhaseAmplitude                            ;88E491;
    STZ.W Phantoon.wavyPhantoonPhaseDeltaDirection                       ;88E494;
    LDA.B DP_Temp16                                                      ;88E497;
    STA.W Phantoon.wavyPhantoonPhaseDelta                                ;88E499;
    JSL.L Spawn_HDMAObject                                               ;88E49C;
    db $42,$0F                                                           ;88E4A0;
    dw InstList_WavyPhantoon_BG2_Xscroll                                 ;88E4A2;
    PLX                                                                  ;88E4A4;
    PLB                                                                  ;88E4A5;
    PLP                                                                  ;88E4A6;
    RTL                                                                  ;88E4A7;


;;; $E4A8: Instruction list - wavy Phantoon BG2 X scroll ;;;
InstList_WavyPhantoon_BG2_Xscroll:
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88E4A8;
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88E4AB;
    dw Instruction_Setup_WavyPhantoon                                    ;88E4AE;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88E4B0;
    dl PreInstruction_WavyPhantoon                                       ;88E4B2;
    dw $0001,$9000                                                       ;88E4B5;
    dw Instruction_HDMAObject_Sleep                                      ;88E4B9;
    dw Instruction_HDMAObject_Delete                                     ;88E4BB;


;;; $E4BD: Instruction - set up wavy Phantoon ;;;
Instruction_Setup_WavyPhantoon:
;; Parameters:
;;     X: HDMA object index
    PHP                                                                  ;88E4BD;
    REP #$30                                                             ;88E4BE;
    LDA.W Phantoon.nextWavyPhantoonMode                                  ;88E4C0;
    STA.W Phantoon.wavyPhantoonMode                                      ;88E4C3;
    BIT.W #$0001                                                         ;88E4C6;
    BNE .wavelengthDoubled                                               ;88E4C9;
    LDA.W #$00A0                                                         ;88E4CB;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable                        ;88E4CE;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+3                      ;88E4D2;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+6                      ;88E4D6;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+9                      ;88E4DA;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$C                     ;88E4DE;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$F                     ;88E4E2;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$12                    ;88E4E6;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$15                    ;88E4EA;
    LDA.W #WavyPhantoonBG2XScrollHDMADataTable                           ;88E4EE;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+1                      ;88E4F1;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+7                      ;88E4F5;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$D                     ;88E4F9;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$13                    ;88E4FD;
    LDA.W #WavyPhantoonBG2XScrollHDMADataTable+$40                       ;88E501;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+4                      ;88E504;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$A                     ;88E508;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$10                    ;88E50C;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$16                    ;88E510;
    LDA.W #$0000                                                         ;88E514;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$18                    ;88E517;
    BRA .merge                                                           ;88E51B;

  .wavelengthDoubled:
    LDA.W #$00C0                                                         ;88E51D;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable                        ;88E520;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+3                      ;88E524;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+6                      ;88E528;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+9                      ;88E52C;
    LDA.W #WavyPhantoonBG2XScrollHDMADataTable                           ;88E530;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+1                      ;88E533;
    LDA.W #WavyPhantoonBG2XScrollHDMADataTable+$80                       ;88E537;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+4                      ;88E53A;
    LDA.W #WavyPhantoonBG2XScrollHDMADataTable                           ;88E53E;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+7                      ;88E541;
    LDA.W #WavyPhantoonBG2XScrollHDMADataTable+$80                       ;88E545;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$A                     ;88E548;
    LDA.W #$0000                                                         ;88E54C;
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable+$C                     ;88E54F;

  .merge:
    LDA.W #$FFFE                                                         ;88E553;
    STA.W HDMAObject_Var0,X                                              ;88E556;
    LDA.W #$0001                                                         ;88E559;
    STA.W HDMAObject_Var1,X                                              ;88E55C;
    STZ.W HDMAObject_Var2,X                                              ;88E55F;
    STZ.W HDMAObject_Var3,X                                              ;88E562;
    PLP                                                                  ;88E565;
    RTS                                                                  ;88E566;


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
    PHP                                                                  ;88E567;
    REP #$30                                                             ;88E568;
    LDA.W Phantoon.wavyPhantoonMode                                      ;88E56A;
    BNE .phantoonEnabled                                                 ;88E56D;
    LDX.W HDMAObject_Index                                               ;88E56F;
    LDA.W HDMAObject_InstListPointers,X                                  ;88E572;
    INC                                                                  ;88E575;
    INC                                                                  ;88E576;
    STA.W HDMAObject_InstListPointers,X                                  ;88E577;
    LDA.W #$0001                                                         ;88E57A;
    STA.W HDMAObject_InstructionTimers,X                                 ;88E57D;
    PLP                                                                  ;88E580;
    RTL                                                                  ;88E581;

  .phantoonEnabled:
    BIT.W #$0001                                                         ;88E582;
    BNE .doubledE593                                                     ;88E585;
    LDA.W #$0008                                                         ;88E587;
    STA.B DP_Temp1C                                                      ;88E58A;
    LDA.W #$0040                                                         ;88E58C;
    STA.B DP_Temp1E                                                      ;88E58F;
    BRA +                                                                ;88E591;

  .doubledE593:
    LDA.W #$0004                                                         ;88E593;
    STA.B DP_Temp1C                                                      ;88E596;
    LDA.W #$0080                                                         ;88E598;
    STA.B DP_Temp1E                                                      ;88E59B;

+   PHX                                                                  ;88E59D;
    DEC.W HDMAObject_Var1,X                                              ;88E59E;
    BNE .nonZeroTimer                                                    ;88E5A1;
    LDA.W #$0001                                                         ;88E5A3;
    STA.W HDMAObject_Var1,X                                              ;88E5A6;
    LDA.W Phantoon.wavyPhantoonPhaseDelta                                ;88E5A9;
    ASL                                                                  ;88E5AC;
    STA.B DP_Temp12                                                      ;88E5AD;
    LDA.W HDMAObject_Var0,X                                              ;88E5AF;
    CLC                                                                  ;88E5B2;
    ADC.B DP_Temp12                                                      ;88E5B3;
    AND.W #$01FF                                                         ;88E5B5;
    STA.W HDMAObject_Var0,X                                              ;88E5B8;

  .nonZeroTimer:
    LDA.W HDMAObject_Var0,X                                              ;88E5BB;
    STA.B DP_Temp14                                                      ;88E5BE;
    LDX.W #$0000                                                         ;88E5C0;

  .loop:
    PHX                                                                  ;88E5C3;
    LDX.B DP_Temp14                                                      ;88E5C4;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;88E5C6;
    BPL .positive                                                        ;88E5CA;
    JMP.W .negative                                                      ;88E5CC;

  .positive:
    STA.B DP_Temp12                                                      ;88E5CF;
    SEP #$20                                                             ;88E5D1;
    STA.W $4202                                                          ;88E5D3;
    LDA.W Phantoon.wavyPhantoonPhaseAmplitude                            ;88E5D6;
    STA.W $4203                                                          ;88E5D9;
    NOP                                                                  ;88E5DC;
    NOP                                                                  ;88E5DD;
    NOP                                                                  ;88E5DE;
    REP #$20                                                             ;88E5DF;
    LDA.W $4216                                                          ;88E5E1;
    XBA                                                                  ;88E5E4;
    AND.W #$00FF                                                         ;88E5E5;
    STA.B DP_Temp16                                                      ;88E5E8;
    SEP #$20                                                             ;88E5EA;
    LDA.B DP_Temp13                                                      ;88E5EC;
    STA.W $4202                                                          ;88E5EE;
    LDA.W Phantoon.wavyPhantoonPhaseAmplitude                            ;88E5F1;
    STA.W $4203                                                          ;88E5F4;
    NOP                                                                  ;88E5F7;
    NOP                                                                  ;88E5F8;
    NOP                                                                  ;88E5F9;
    REP #$20                                                             ;88E5FA;
    LDA.W $4216                                                          ;88E5FC;
    CLC                                                                  ;88E5FF;
    ADC.B DP_Temp16                                                      ;88E600;
    STA.B DP_Temp16                                                      ;88E602;
    SEP #$20                                                             ;88E604;
    LDA.B DP_Temp12                                                      ;88E606;
    STA.W $4202                                                          ;88E608;
    LDA.W Phantoon.wavyPhantoonPhaseAmplitude+1                          ;88E60B;
    STA.W $4203                                                          ;88E60E;
    NOP                                                                  ;88E611;
    NOP                                                                  ;88E612;
    NOP                                                                  ;88E613;
    REP #$20                                                             ;88E614;
    LDA.W $4216                                                          ;88E616;
    STA.B DP_Temp18                                                      ;88E619;
    SEP #$20                                                             ;88E61B;
    LDA.B DP_Temp13                                                      ;88E61D;
    STA.W $4202                                                          ;88E61F;
    LDA.W Phantoon.wavyPhantoonPhaseAmplitude+1                          ;88E622;
    STA.W $4203                                                          ;88E625;
    REP #$20                                                             ;88E628;
    LDA.B DP_Temp16                                                      ;88E62A;
    CLC                                                                  ;88E62C;
    ADC.B DP_Temp18                                                      ;88E62D;
    STA.B DP_Temp16                                                      ;88E62F;
    LDA.W $4215                                                          ;88E631;
    AND.W #$FF00                                                         ;88E634;
    CLC                                                                  ;88E637;
    ADC.B DP_Temp16                                                      ;88E638;
    AND.W #$FF00                                                         ;88E63A;
    XBA                                                                  ;88E63D;
    STA.B DP_Temp12                                                      ;88E63E;
    TXA                                                                  ;88E640;
    CLC                                                                  ;88E641;
    ADC.B DP_Temp1C                                                      ;88E642;
    AND.W #$01FF                                                         ;88E644;
    STA.B DP_Temp14                                                      ;88E647;
    PLX                                                                  ;88E649;
    LDA.B DP_BG2XScroll                                                  ;88E64A;
    CLC                                                                  ;88E64C;
    ADC.B DP_Temp12                                                      ;88E64D;
    STA.L WavyPhantoonBG2XScrollHDMADataTable,X                          ;88E64F;
    JMP.W .next                                                          ;88E653;

  .negative:
    EOR.W #$FFFF                                                         ;88E656;
    INC                                                                  ;88E659;
    STA.B DP_Temp12                                                      ;88E65A;
    SEP #$20                                                             ;88E65C;
    STA.W $4202                                                          ;88E65E;
    LDA.W Phantoon.wavyPhantoonPhaseAmplitude                            ;88E661;
    STA.W $4203                                                          ;88E664;
    NOP                                                                  ;88E667;
    NOP                                                                  ;88E668;
    NOP                                                                  ;88E669;
    REP #$20                                                             ;88E66A;
    LDA.W $4216                                                          ;88E66C;
    XBA                                                                  ;88E66F;
    AND.W #$00FF                                                         ;88E670;
    STA.B DP_Temp16                                                      ;88E673;
    SEP #$20                                                             ;88E675;
    LDA.B DP_Temp13                                                      ;88E677;
    STA.W $4202                                                          ;88E679;
    LDA.W Phantoon.wavyPhantoonPhaseAmplitude                            ;88E67C;
    STA.W $4203                                                          ;88E67F;
    NOP                                                                  ;88E682;
    NOP                                                                  ;88E683;
    NOP                                                                  ;88E684;
    REP #$20                                                             ;88E685;
    LDA.W $4216                                                          ;88E687;
    CLC                                                                  ;88E68A;
    ADC.B DP_Temp16                                                      ;88E68B;
    STA.B DP_Temp16                                                      ;88E68D;
    SEP #$20                                                             ;88E68F;
    LDA.B DP_Temp12                                                      ;88E691;
    STA.W $4202                                                          ;88E693;
    LDA.W Phantoon.wavyPhantoonPhaseAmplitude+1                          ;88E696;
    STA.W $4203                                                          ;88E699;
    NOP                                                                  ;88E69C;
    NOP                                                                  ;88E69D;
    NOP                                                                  ;88E69E;
    REP #$20                                                             ;88E69F;
    LDA.W $4216                                                          ;88E6A1;
    STA.B DP_Temp18                                                      ;88E6A4;
    SEP #$20                                                             ;88E6A6;
    LDA.B DP_Temp13                                                      ;88E6A8;
    STA.W $4202                                                          ;88E6AA;
    LDA.W Phantoon.wavyPhantoonPhaseAmplitude+1                          ;88E6AD;
    STA.W $4203                                                          ;88E6B0;
    REP #$20                                                             ;88E6B3;
    LDA.B DP_Temp16                                                      ;88E6B5;
    CLC                                                                  ;88E6B7;
    ADC.B DP_Temp18                                                      ;88E6B8;
    STA.B DP_Temp16                                                      ;88E6BA;
    LDA.W $4215                                                          ;88E6BC;
    AND.W #$FF00                                                         ;88E6BF;
    CLC                                                                  ;88E6C2;
    ADC.B DP_Temp16                                                      ;88E6C3;
    AND.W #$FF00                                                         ;88E6C5;
    XBA                                                                  ;88E6C8;
    STA.B DP_Temp12                                                      ;88E6C9;
    TXA                                                                  ;88E6CB;
    CLC                                                                  ;88E6CC;
    ADC.B DP_Temp1C                                                      ;88E6CD;
    AND.W #$01FF                                                         ;88E6CF;
    STA.B DP_Temp14                                                      ;88E6D2;
    PLX                                                                  ;88E6D4;
    LDA.B DP_BG2XScroll                                                  ;88E6D5;
    SEC                                                                  ;88E6D7;
    SBC.B DP_Temp12                                                      ;88E6D8;
    STA.L WavyPhantoonBG2XScrollHDMADataTable,X                          ;88E6DA;

  .next:
    INX                                                                  ;88E6DE;
    INX                                                                  ;88E6DF;
    CPX.B DP_Temp1E                                                      ;88E6E0;
    BPL +                                                                ;88E6E2;
    JMP.W .loop                                                          ;88E6E4;

+   LDA.W Phantoon.wavyPhantoonMode                                      ;88E6E7;
    BIT.W #$0001                                                         ;88E6EA;
    BNE .doubledE706                                                     ;88E6ED;
    LDX.W #$003E                                                         ;88E6EF;

  .loopNotDoubled:
    LDA.B DP_BG2XScroll                                                  ;88E6F2;
    SEC                                                                  ;88E6F4;
    SBC.L WavyPhantoonBG2XScrollHDMADataTable,X                          ;88E6F5;
    CLC                                                                  ;88E6F9;
    ADC.B DP_BG2XScroll                                                  ;88E6FA;
    STA.L WavyPhantoonBG2XScrollHDMADataTable+$40,X                      ;88E6FC;
    DEX                                                                  ;88E700;
    DEX                                                                  ;88E701;
    BPL .loopNotDoubled                                                  ;88E702;
    BRA .return                                                          ;88E704;

  .doubledE706:
    LDX.W #$007E                                                         ;88E706;

  .loopDoubled:
    LDA.B DP_BG2XScroll                                                  ;88E709;
    SEC                                                                  ;88E70B;
    SBC.L WavyPhantoonBG2XScrollHDMADataTable,X                          ;88E70C;
    CLC                                                                  ;88E710;
    ADC.B DP_BG2XScroll                                                  ;88E711;
    STA.L WavyPhantoonBG2XScrollHDMADataTable+$80,X                      ;88E713;
    DEX                                                                  ;88E717;
    DEX                                                                  ;88E718;
    BPL .loopDoubled                                                     ;88E719;

  .return:
    PLX                                                                  ;88E71B;
    PLP                                                                  ;88E71C;
    RTL                                                                  ;88E71D;


;;; $E71E: Spawn Mother Brain rising HDMA object ;;;
Spawn_MotherBrainRising_HDMAObject:
; Prevent Mother Brain's legs (sprites) from appearing over the floor
    JSL.L Spawn_HDMAObject                                               ;88E71E;
    db $00,$2C                                                           ;88E722;
    dw InstList_MotherBrainRising_MainScreenLayers                       ;88E724; fallthrough to RTL_88E726


RTL_88E726:
    RTL                                                                  ;88E726;


;;; $E727: Instruction list - Mother Brain rising main screen layers ;;;
InstList_MotherBrainRising_MainScreenLayers:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88E727;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $88             ;88E72A;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;88E72D;
    dl RTL_88E726                                                        ;88E72F;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88E732;
    dl RTL_88E726                                                        ;88E734;
    dw $0001,HDMATable_MotherBrainRising_MainScreenLayers                ;88E737;
    dw Instruction_HDMAObject_Sleep                                      ;88E73B;


;;; $E73D: HDMA table - Mother Brain rising main screen layers ;;;
HDMATable_MotherBrainRising_MainScreenLayers:                            ;88E73D;
    db $20,$04 ;         BG3
    db $18,$15 ; BG1/    BG3/sprites
    db $60,$13 ; BG1/BG2/    sprites
    db $40,$13 ; BG1/BG2/    sprites
    db $08,$05 ; BG1/    BG3
    db $00


;;; $E748: Spawn Mother Brain rainbow beam HDMA object ;;;
Spawn_MotherBrainRainbowBeam_HDMAObject:
    JSL.L Spawn_HDMAObject                                               ;88E748;
    db $41,$26                                                           ;88E74C;
    dw InstList_MotherBrainRainbowBeam_Window1Position                   ;88E74E;
    RTL                                                                  ;88E750;


;;; $E751: Instruction list - Mother Brain rainbow beam window 1 position ;;;
InstList_MotherBrainRainbowBeam_Window1Position:
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88E751;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88E754;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;88E757;
    dl Initialise_Rainbow_Beam                                           ;88E759;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88E75C;
    dl PreInstruction_MotherBrainRainbowBeam                             ;88E75E;
    dw $0001,MotherBrainRainbowBeamWindow1IndirectHDMATable              ;88E761;
    dw Instruction_HDMAObject_Sleep                                      ;88E765;


;;; $E767: Initialise rainbow beam ;;;
Initialise_Rainbow_Beam:
    PHP                                                                  ;88E767;
    SEP #$20                                                             ;88E768;
    REP #$10                                                             ;88E76A;
    LDA.B #$20                                                           ;88E76C;
    STA.B DP_ColorMathSubScreenBackdropColor0                            ;88E76E;
    LDA.B #$47                                                           ;88E770;
    STA.B DP_ColorMathSubScreenBackdropColor1                            ;88E772;
    LDA.B #$8F                                                           ;88E774;
    STA.B DP_ColorMathSubScreenBackdropColor2                            ;88E776;
    REP #$30                                                             ;88E778;
    LDA.W #$0024                                                         ;88E77A;
    STA.W LayerBlending_Config                                           ;88E77D;
    SEP #$20                                                             ;88E780;
    LDA.B #$E4                                                           ;88E782;
    LDA.B #$64                                                           ;88E784;
    STA.L MotherBrainRainbowBeamWindow1IndirectHDMATable                 ;88E786;
    REP #$20                                                             ;88E78A;
    LDA.W #MotherBrainRainbowBeamWindow1HDMADataTable                    ;88E78C;
    STA.L MotherBrainRainbowBeamWindow1IndirectHDMATable+1               ;88E78F;
    LDA.W #$0000                                                         ;88E793;
    STA.L MotherBrainRainbowBeamWindow1IndirectHDMATable+3               ;88E796;
    LDA.W #$0000                                                         ;88E79A;
    STA.L MotherBrainRainbowBeamWindow1HDMADataTable                     ;88E79D;
    LDA.W #$8020                                                         ;88E7A1; $7E:9D02 = 20h,80h
    STA.L MotherBrainRainbowBeamWindow1HDMADataTable+2                   ;88E7A4;
    LDA.W #$0000                                                         ;88E7A8;
    STA.L MotherBrainRainbowBeamWindow1HDMADataTable+4                   ;88E7AB;
    PHB                                                                  ;88E7AF;
    PEA.W Calculate_MotherBrain_RainbowBeam_HDMATables>>8&$FF00          ;88E7B0;
    PLB                                                                  ;88E7B3;
    PLB                                                                  ;88E7B4;
    JSL.L Calculate_MotherBrain_RainbowBeam_HDMATables                   ;88E7B5;
    PLB                                                                  ;88E7B9;
    PLP                                                                  ;88E7BA;
    RTL                                                                  ;88E7BB;


;;; $E7BC: Pre-instruction - Mother Brain rainbow beam ;;;
PreInstruction_MotherBrainRainbowBeam:
    PHP                                                                  ;88E7BC;
    REP #$30                                                             ;88E7BD;
    LDA.W GameState                                                      ;88E7BF;
    CMP.W #$0013                                                         ;88E7C2;
    BEQ .delete                                                          ;88E7C5;
    LDA.W #$0024                                                         ;88E7C7;
    STA.W LayerBlending_Config                                           ;88E7CA;
    LDA.W GameState                                                      ;88E7CD;
    CMP.W #$001B                                                         ;88E7D0;
    BEQ .return                                                          ;88E7D3;
    PHB                                                                  ;88E7D5;
    PEA.W Calculate_MotherBrain_RainbowBeam_HDMATables>>8&$FF00          ;88E7D6;
    PLB                                                                  ;88E7D9;
    PLB                                                                  ;88E7DA;
    JSL.L Calculate_MotherBrain_RainbowBeam_HDMATables                   ;88E7DB;
    PLB                                                                  ;88E7DF;
    JSR.W Set_RainbowBeam_ColorMathSubscreenBackdropColor                ;88E7E0;

  .return:
    PLP                                                                  ;88E7E3;
    RTL                                                                  ;88E7E4;

  .delete:
    LDX.W HDMAObject_Index                                               ;88E7E5;
    STZ.W HDMAObject_ChannelBitflags,X                                   ;88E7E8;
    PLP                                                                  ;88E7EB;
    RTL                                                                  ;88E7EC;


;;; $E7ED: Set rainbow beam colour math subscreen backdrop colour ;;;
Set_RainbowBeam_ColorMathSubscreenBackdropColor:
    LDX.W HDMAObject_Var0                                                ;88E7ED;
    LDA.W .table,X                                                       ;88E7F0;
    BPL .notSet                                                          ;88E7F3;
    STZ.W HDMAObject_Var0                                                ;88E7F5;
    LDA.W .table                                                         ;88E7F8;
    BRA .setColor                                                        ;88E7FB;

  .notSet:
    INC.W HDMAObject_Var0                                                ;88E7FD;
    INC.W HDMAObject_Var0                                                ;88E800;
    INC.W HDMAObject_Var0                                                ;88E803;
    INC.W HDMAObject_Var0                                                ;88E806;

  .setColor:
    PHA                                                                  ;88E809;
    SEP #$20                                                             ;88E80A;
    AND.B #$1F                                                           ;88E80C;
    ORA.B #$20                                                           ;88E80E;
    STA.B DP_ColorMathSubScreenBackdropColor0                            ;88E810;
    REP #$20                                                             ;88E812;
    LDA.B $01,S                                                          ;88E814;
    ASL                                                                  ;88E816;
    ASL                                                                  ;88E817;
    ASL                                                                  ;88E818;
    XBA                                                                  ;88E819;
    SEP #$20                                                             ;88E81A;
    AND.B #$1F                                                           ;88E81C;
    ORA.B #$40                                                           ;88E81E;
    STA.B DP_ColorMathSubScreenBackdropColor1                            ;88E820;
    REP #$20                                                             ;88E822;
    PLA                                                                  ;88E824;
    LSR                                                                  ;88E825;
    LSR                                                                  ;88E826;
    XBA                                                                  ;88E827;
    SEP #$20                                                             ;88E828;
    AND.B #$1F                                                           ;88E82A;
    ORA.B #$80                                                           ;88E82C;
    STA.B DP_ColorMathSubScreenBackdropColor2                            ;88E82E;
    REP #$20                                                             ;88E830;
    RTS                                                                  ;88E832;

  .table:
; Rainbow beam colour table
; The table index is incremented by 4 per frame instead of 2, so only entries 2k for some k are used
    dw $001F,$005F, $009F,$00DF, $011F,$015F, $019F,$01DF                 ;88E833;
    dw $023F,$027F, $02BF,$02FF, $033F,$037F, $03BF,$03FF                 ;88E843;
    dw $03FD,$03FB, $03F9,$03F7, $03F5,$03F3, $03F1,$03EF                 ;88E853;
    dw $03EC,$03EA, $03E8,$03E6, $03E4,$03E2, $03E0,$0BA0                 ;88E863;
    dw $1360,$1B20, $22E0,$2AA0, $3260,$3A20, $45E0,$4D80                 ;88E873;
    dw $5540,$5D00, $64C0,$6C80, $7440,$7C00, $7C02,$7C04                 ;88E883;
    dw $7C06,$7C08, $7C0A,$7C0C, $7C0D,$7C2F, $7C31,$7C33                 ;88E893;
    dw $7C35,$7C37, $7C39,$7C3B, $7C1F,$741F, $6C1F,$641F                 ;88E8A3;
    dw $5C1F,$541F, $4C1F,$441F, $3C1F,$301F, $281F,$201F                 ;88E8B3;
    dw $181F,$101F, $081F,$FFFF, $FFFF                                    ;88E8C3;
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF ; Excess terminators


;;; $E8D9: Spawn morph ball eye beam HDMA object ;;;
Spawn_MorphBallEyeBeam_HDMAObject:
    PHP                                                                  ;88E8D9;
    PHB                                                                  ;88E8DA;
    PHK                                                                  ;88E8DB;
    PLB                                                                  ;88E8DC;
    REP #$30                                                             ;88E8DD;
    PHX                                                                  ;88E8DF;
    JSL.L Spawn_HDMAObject                                               ;88E8E0;
    db $41,$26                                                           ;88E8E4;
    dw InstList_MorphBallEyeBeam_Window1Position                         ;88E8E6;
    PLX                                                                  ;88E8E8;
    PLB                                                                  ;88E8E9;
    PLP                                                                  ;88E8EA;
    RTL                                                                  ;88E8EB;


;;; $E8EC: Instruction list - window 1 position - morph ball eye beam ;;;
InstList_MorphBallEyeBeam_Window1Position:
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88E8EC;
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88E8EF;
    dw Instruction_Initialise_MorphBallEyeBeam_HDMA                      ;88E8F2;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88E8F4;
    dl PreInstruction_MorphBallEyeBeam_BeamIsWidening                    ;88E8F6;
    dw $0001,$9000                                                       ;88E8F9;
    dw Instruction_HDMAObject_Sleep                                      ;88E8FD;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88E8FF;
    dl PreInstruction_MorphBallEyeBeamHDMA_FullBeam                      ;88E901;
    dw $0001,$9000                                                       ;88E904;
    dw Instruction_HDMAObject_Sleep                                      ;88E908;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88E90A;
    dl PreInstruction_MorphBallEyeBeamHDMA_DeactivateBeam                ;88E90C;
    dw $0001,$9000                                                       ;88E90F;
    dw Instruction_HDMAObject_Sleep                                      ;88E913;
    dw Instruction_HDMAObject_Delete                                     ;88E915;


;;; $E917: Instruction - initialise morph ball eye beam HDMA ;;;
Instruction_Initialise_MorphBallEyeBeam_HDMA:
;; Parameters:
;;     X: HDMA object index
    PHP                                                                  ;88E917;
    SEP #$20                                                             ;88E918;
    REP #$10                                                             ;88E91A;
    LDA.B #$30                                                           ;88E91C;
    STA.W HDMAObject_Var0,X                                              ;88E91E;
    STA.B DP_ColorMathSubScreenBackdropColor0                            ;88E921;
    LDA.B #$50                                                           ;88E923;
    STA.W HDMAObject_Var0+1,X                                            ;88E925;
    STA.B DP_ColorMathSubScreenBackdropColor1                            ;88E928;
    LDA.B #$80                                                           ;88E92A;
    STA.W HDMAObject_Var1,X                                              ;88E92C;
    STA.B DP_ColorMathSubScreenBackdropColor2                            ;88E92F;
    REP #$30                                                             ;88E931;
    LDA.W #$0010                                                         ;88E933;
    STA.W LayerBlending_Config                                           ;88E936;
    LDA.W #$00E4                                                         ;88E939;
    STA.L EyeBeamWindow1IndirectHDMATable                                ;88E93C;
    LDA.W #EyeBeamWindow1HDMADataTable                                   ;88E940;
    STA.L EyeBeamWindow1IndirectHDMATable+1                              ;88E943;
    LDA.W #$00E4                                                         ;88E947;
    STA.L EyeBeamWindow1IndirectHDMATable+3                              ;88E94A;
    LDA.W #EyeBeamWindow1HDMADataTable+$C8                               ;88E94E;
    STA.L EyeBeamWindow1IndirectHDMATable+4                              ;88E951;
    LDA.W #$0098                                                         ;88E955;
    STA.L EyeBeamWindow1IndirectHDMATable+6                              ;88E958;
    LDA.W #EyeBeamWindow1HDMADataTable+$190                              ;88E95C;
    STA.L EyeBeamWindow1IndirectHDMATable+7                              ;88E95F;
    LDA.W #$0000                                                         ;88E963;
    STA.L EyeBeamWindow1IndirectHDMATable+9                              ;88E966;
    LDA.W #$0001                                                         ;88E96A;
    STA.W Eye.activatedFlag+$40                                          ;88E96D;
    STZ.W HDMAObject_Var2,X                                              ;88E970;
    STZ.W HDMAObject_Var3,X                                              ;88E973;
    LDA.W #$0000                                                         ;88E976;
    STA.L EyeBeamAngularWidthDelta                                       ;88E979;
    STA.L EyeBeamAngularSubWidthDelta                                    ;88E97D;
    STA.L EyeBeamColorIndex                                              ;88E981;
    PLP                                                                  ;88E985;
    RTS                                                                  ;88E986;


;;; $E987: Update morph ball eye beam HDMA data table and colour math subscreen backdrop colour ;;;
Update_MorphBallEyeBeam_HDMATable_ColorMathSubScnBackColor:
;; Parameters:
;;     X: HDMA object index
    PHP                                                                  ;88E987;
    REP #$30                                                             ;88E988;
    PHX                                                                  ;88E98A;
    LDA.W Eye.angle+$40                                                  ;88E98B;
    STA.B DP_Temp12                                                      ;88E98E;
    LDA.W HDMAObject_Var2,X                                              ;88E990;
    STA.B DP_Temp14                                                      ;88E993;
    LDA.W Enemy[1].YPosition                                             ;88E995;
    SEC                                                                  ;88E998;
    SBC.W Layer1YPosition                                                ;88E999;
    TAY                                                                  ;88E99C;
    LDA.W Enemy[1].XPosition                                             ;88E99D;
    SEC                                                                  ;88E9A0;
    SBC.W Layer1XPosition                                                ;88E9A1;
    TAX                                                                  ;88E9A4;
    BMI .offScreen                                                       ;88E9A5;
    CMP.W #$0100                                                         ;88E9A7;
    BPL .offScreen                                                       ;88E9AA;
    SEP #$20                                                             ;88E9AC;
    LDA.B #EyeBeamWindow1HDMADataTable>>16                               ;88E9AE;
    STA.B DP_Temp02                                                      ;88E9B0;
    REP #$20                                                             ;88E9B2;
    LDA.W #EyeBeamWindow1HDMADataTable                                   ;88E9B4;
    STA.B DP_Temp00                                                      ;88E9B7;
    JSL.L Calc_Xray_HDMADataTable_OnScreen                               ;88E9B9;
    BRA .merge                                                           ;88E9BD;

  .offScreen:
    SEP #$20                                                             ;88E9BF;
    LDA.B #EyeBeamWindow1HDMADataTable>>16                               ;88E9C1;
    STA.B DP_Temp02                                                      ;88E9C3;
    REP #$20                                                             ;88E9C5;
    LDA.W #EyeBeamWindow1HDMADataTable                                   ;88E9C7;
    STA.B DP_Temp00                                                      ;88E9CA;
    JSL.L Calc_Xray_HDMADataTable_OffScreen                              ;88E9CC;

  .merge:
    PLX                                                                  ;88E9D0;
    SEP #$20                                                             ;88E9D1;
    LDA.W HDMAObject_Var0,X                                              ;88E9D3;
    STA.B DP_ColorMathSubScreenBackdropColor0                            ;88E9D6;
    LDA.W HDMAObject_Var0+1,X                                            ;88E9D8;
    STA.B DP_ColorMathSubScreenBackdropColor1                            ;88E9DB;
    LDA.W HDMAObject_Var1,X                                              ;88E9DD;
    STA.B DP_ColorMathSubScreenBackdropColor2                            ;88E9E0;
    REP #$20                                                             ;88E9E2; >_<
    PLP                                                                  ;88E9E4;
    RTS                                                                  ;88E9E5;


;;; $E9E6: Pre-instruction - morph ball eye beam HDMA - beam is widening ;;;
PreInstruction_MorphBallEyeBeam_BeamIsWidening:
;; Parameters:
;;     X: HDMA object index
    PHP                                                                  ;88E9E6;
    REP #$30                                                             ;88E9E7;
    LDA.W #$0010                                                         ;88E9E9;
    STA.W LayerBlending_Config                                           ;88E9EC;
    LDA.L EyeBeamAngularSubWidthDelta                                    ;88E9EF;
    CLC                                                                  ;88E9F3;
    ADC.W #$4000                                                         ;88E9F4;
    STA.L EyeBeamAngularSubWidthDelta                                    ;88E9F7;
    LDA.L EyeBeamAngularWidthDelta                                       ;88E9FB;
    ADC.W #$0000                                                         ;88E9FF;
    STA.L EyeBeamAngularWidthDelta                                       ;88EA02;
    LDA.W HDMAObject_Var3,X                                              ;88EA06;
    CLC                                                                  ;88EA09;
    ADC.L EyeBeamAngularSubWidthDelta                                    ;88EA0A;
    STA.W HDMAObject_Var3,X                                              ;88EA0E;
    LDA.W HDMAObject_Var2,X                                              ;88EA11;
    ADC.L EyeBeamAngularWidthDelta                                       ;88EA14;
    STA.W HDMAObject_Var2,X                                              ;88EA18;
    CMP.W #$0004                                                         ;88EA1B;
    BMI .update                                                          ;88EA1E;
    LDA.W #$0004                                                         ;88EA20;
    STA.W HDMAObject_Var2,X                                              ;88EA23;
    LDX.W HDMAObject_Index                                               ;88EA26;
    LDA.W HDMAObject_InstListPointers,X                                  ;88EA29;
    INC                                                                  ;88EA2C;
    INC                                                                  ;88EA2D;
    STA.W HDMAObject_InstListPointers,X                                  ;88EA2E;
    LDA.W #$0001                                                         ;88EA31;
    STA.W HDMAObject_InstructionTimers,X                                 ;88EA34;

  .update:
    JSR.W Update_MorphBallEyeBeam_HDMATable_ColorMathSubScnBackColor     ;88EA37;
    PLP                                                                  ;88EA3A;
    RTL                                                                  ;88EA3B;


;;; $EA3C: Pre-instruction - morph ball eye beam HDMA - full beam ;;;
PreInstruction_MorphBallEyeBeamHDMA_FullBeam:
;; Parameters:
;;     X: HDMA object index
    PHP                                                                  ;88EA3C;
    REP #$30                                                             ;88EA3D;
    LDA.W #$0010                                                         ;88EA3F;
    STA.W LayerBlending_Config                                           ;88EA42;
    LDA.W Eye.activatedFlag+$40                                          ;88EA45;
    BNE .update                                                          ;88EA48;
    LDX.W HDMAObject_Index                                               ;88EA4A;
    LDA.W HDMAObject_InstListPointers,X                                  ;88EA4D;
    INC                                                                  ;88EA50;
    INC                                                                  ;88EA51;
    STA.W HDMAObject_InstListPointers,X                                  ;88EA52;
    LDA.W #$0001                                                         ;88EA55;
    STA.W HDMAObject_InstructionTimers,X                                 ;88EA58;
    PLP                                                                  ;88EA5B;
    RTL                                                                  ;88EA5C;

  .update:
    JSR.W Update_MorphBallEyeBeam_HDMATable_ColorMathSubScnBackColor     ;88EA5D;
    LDA.L EyeBeamColorIndex                                              ;88EA60;
    ASL                                                                  ;88EA64;
    ASL                                                                  ;88EA65;
    TAY                                                                  ;88EA66;
    SEP #$20                                                             ;88EA67;
    LDA.W .red,Y                                                         ;88EA69;
    STA.W HDMAObject_Var0,X                                              ;88EA6C;
    LDA.W .green,Y                                                       ;88EA6F;
    STA.W HDMAObject_Var0+1,X                                            ;88EA72;
    LDA.W .blue,Y                                                        ;88EA75;
    STA.W HDMAObject_Var1,X                                              ;88EA78;
    REP #$20                                                             ;88EA7B;
    LDA.L EyeBeamColorIndex                                              ;88EA7D;
    INC                                                                  ;88EA81;
    AND.W #$000F                                                         ;88EA82;
    STA.L EyeBeamColorIndex                                              ;88EA85;
    PLP                                                                  ;88EA89;
    RTL                                                                  ;88EA8A;

;        ____________ Red component
;       |    ________ Green component
;       |   |    ____ Blue component
;       |   |   |
  .red:
    db $30                                                               ;88EA8B;
  .green:
    db     $50                                                           ;88EA8C;
  .blue:
    db         $80, $00                                                  ;88EA8D;
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
    PHP                                                                  ;88EACB;
    REP #$30                                                             ;88EACC;
    LDA.W #$0010                                                         ;88EACE;
    STA.W LayerBlending_Config                                           ;88EAD1;
    SEP #$20                                                             ;88EAD4;
    LDA.W HDMAObject_Var0+1,X                                            ;88EAD6;
    CMP.B #$40                                                           ;88EAD9;
    BNE .notDone                                                         ;88EADB;
    LDA.B #$20                                                           ;88EADD;
    STA.B DP_ColorMathSubScreenBackdropColor0                            ;88EADF;
    LDA.B #$40                                                           ;88EAE1;
    STA.B DP_ColorMathSubScreenBackdropColor1                            ;88EAE3;
    LDA.B #$80                                                           ;88EAE5;
    STA.B DP_ColorMathSubScreenBackdropColor2                            ;88EAE7;
    REP #$20                                                             ;88EAE9;
    STZ.W HDMAObject_Var3,X                                              ;88EAEB;
    STZ.W HDMAObject_Var2,X                                              ;88EAEE;
    LDX.W #$01FE                                                         ;88EAF1;

  .loop:
    LDA.W #$00FF                                                         ;88EAF4;
    STA.L EyeBeamWindow1HDMADataTable,X                                  ;88EAF7;
    DEX                                                                  ;88EAFB;
    DEX                                                                  ;88EAFC;
    BPL .loop                                                            ;88EAFD;
    LDA.W #$0000                                                         ;88EAFF;
    STA.L EyeBeamWindow1IndirectHDMATable                                ;88EB02;
    STA.L EyeBeamWindow1IndirectHDMATable+2                              ;88EB06;
    STA.L EyeBeamWindow1IndirectHDMATable+4                              ;88EB0A;
    STA.L EyeBeamWindow1IndirectHDMATable+6                              ;88EB0E;
    STA.L EyeBeamWindow1IndirectHDMATable+8                              ;88EB12;
    LDX.W HDMAObject_Index                                               ;88EB16;
    LDA.W HDMAObject_InstListPointers,X                                  ;88EB19;
    INC                                                                  ;88EB1C;
    INC                                                                  ;88EB1D;
    STA.W HDMAObject_InstListPointers,X                                  ;88EB1E;
    LDA.W #$0001                                                         ;88EB21;
    STA.W HDMAObject_InstructionTimers,X                                 ;88EB24;
    BRA .return                                                          ;88EB27;

  .notDone:
    REP #$20                                                             ;88EB29;
    JSR.W Update_MorphBallEyeBeam_HDMATable_ColorMathSubScnBackColor     ;88EB2B;
    LDX.W HDMAObject_Index                                               ;88EB2E;
    SEP #$20                                                             ;88EB31;
    LDA.W HDMAObject_Var0,X                                              ;88EB33;
    CMP.B #$20                                                           ;88EB36;
    BEQ .green                                                           ;88EB38;
    DEC                                                                  ;88EB3A;
    STA.W HDMAObject_Var0,X                                              ;88EB3B;

  .green:
    LDA.W HDMAObject_Var0+1,X                                            ;88EB3E;
    CMP.B #$40                                                           ;88EB41;
    BEQ .blue                                                            ;88EB43;
    DEC                                                                  ;88EB45;
    STA.W HDMAObject_Var0+1,X                                            ;88EB46;

  .blue:
    LDA.W HDMAObject_Var1,X                                              ;88EB49;
    CMP.B #$80                                                           ;88EB4C;
    BEQ .returnREP20                                                     ;88EB4E;
    DEC                                                                  ;88EB50;
    STA.W HDMAObject_Var1,X                                              ;88EB51;

  .returnREP20:
    REP #$20                                                             ;88EB54; >.<

  .return:
    PLP                                                                  ;88EB56;
    RTL                                                                  ;88EB57;


;;; $EB58: Spawn title sequence gradient HDMA objects ;;;
Spawn_TitleSequenceGradient_HDMAObjects:
    PHP                                                                  ;88EB58;
    PHB                                                                  ;88EB59;
    PHK                                                                  ;88EB5A;
    PLB                                                                  ;88EB5B;
    REP #$30                                                             ;88EB5C;
    PHX                                                                  ;88EB5E;
    JSL.L Spawn_HDMAObject                                               ;88EB5F;
    db $00,$32                                                           ;88EB63;
    dw InstList_ColorMathSubScnBackdropColor_TitleSequenceGradient       ;88EB65;
    JSL.L Spawn_HDMAObject                                               ;88EB67;
    db $00,$31                                                           ;88EB6B;
    dw InstList_ColorMathControlRegB_TitleSequenceGradient               ;88EB6D;
    PLX                                                                  ;88EB6F;
    PLB                                                                  ;88EB70;
    PLP                                                                  ;88EB71;
    RTL                                                                  ;88EB72;


;;; $EB73: Instruction list - colour math subscreen backdrop colour - title sequence gradient ;;;
InstList_ColorMathSubScnBackdropColor_TitleSequenceGradient:
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88EB73;
    dw Instruction_Setup_TitleSequenceGradient_HDMATable                 ;88EB76;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88EB78;
    dl PreInst_ColorMathSubScnBackdropColor_TitleSequenceGradient        ;88EB7A;
    dw $0001,SuitPickupWindow1HDMADataTable                              ;88EB7D;
    dw Instruction_HDMAObject_Sleep                                      ;88EB81;
    dw Instruction_HDMAObject_Delete                                     ;88EB83;


;;; $EB85: Instruction list - colour math control register B - title sequence gradient ;;;
InstList_ColorMathControlRegB_TitleSequenceGradient:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88EB85;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88EB88;
    dl PreInstruction_ColorMathControlRegB_TitleSequenceGradient         ;88EB8A;
    dw $0001,HDMATable_ColorMathControlRegB_TitleSequenceGradient        ;88EB8D;
    dw Instruction_HDMAObject_Sleep                                      ;88EB91;
    dw Instruction_HDMAObject_Delete                                     ;88EB93;


;;; $EB95: HDMA table - colour math control register B - title sequence gradient ;;;
HDMATable_ColorMathControlRegB_TitleSequenceGradient:                    ;88EB95;
    db $40,$A1 ;\
    db $3A,$A1 ;} Enable subtractive colour math on BG1/backdrop
    db $40,$31 ;\
    db $40,$31 ;} Enable colour math on BG1/sprites/backdrop
    db $00,$00


;;; $EB9F: Instruction - set up title sequence gradient HDMA table ;;;
Instruction_Setup_TitleSequenceGradient_HDMATable:
    PHP                                                                  ;88EB9F;
    SEP #$20                                                             ;88EBA0;
    REP #$10                                                             ;88EBA2;
    PHX                                                                  ;88EBA4;
    PHY                                                                  ;88EBA5;
    STZ.B DP_ColorMathA                                                  ;88EBA6;
    JSL.L Configure_TitleScreen_GradientHDMATable                        ;88EBA8;
    PLY                                                                  ;88EBAC;
    PLX                                                                  ;88EBAD;
    PLP                                                                  ;88EBAE;
    RTS                                                                  ;88EBAF;


;;; $EBB0: Pre-instruction - colour math subscreen backdrop colour - title sequence gradient ;;;
PreInst_ColorMathSubScnBackdropColor_TitleSequenceGradient:
    PHP                                                                  ;88EBB0;
    REP #$30                                                             ;88EBB1;
    JSL.L Configure_TitleScreen_GradientHDMATable                        ;88EBB3;
    LDA.W CinematicFunction                                              ;88EBB7;
    CMP.W #CinematicFunction_LoadTitleSequence                           ;88EBBA;
    BNE .return                                                          ;88EBBD;
    LDX.W HDMAObject_Index                                               ;88EBBF;
    LDA.W HDMAObject_InstListPointers,X                                  ;88EBC2;
    INC                                                                  ;88EBC5;
    INC                                                                  ;88EBC6;
    STA.W HDMAObject_InstListPointers,X                                  ;88EBC7;
    LDA.W #$0001                                                         ;88EBCA;
    STA.W HDMAObject_InstructionTimers,X                                 ;88EBCD;

  .return:
    PLP                                                                  ;88EBD0;
    RTL                                                                  ;88EBD1;


;;; $EBD2: Pre-instruction - colour math control register B - title sequence gradient ;;;
PreInstruction_ColorMathControlRegB_TitleSequenceGradient:
    PHP                                                                  ;88EBD2;
    REP #$30                                                             ;88EBD3;
    LDA.W CinematicFunction                                              ;88EBD5;
    CMP.W #CinematicFunction_LoadTitleSequence                           ;88EBD8;
    BNE .return                                                          ;88EBDB;
    LDX.W HDMAObject_Index                                               ;88EBDD;
    LDA.W HDMAObject_InstListPointers,X                                  ;88EBE0;
    INC                                                                  ;88EBE3;
    INC                                                                  ;88EBE4;
    STA.W HDMAObject_InstListPointers,X                                  ;88EBE5;
    LDA.W #$0001                                                         ;88EBE8;
    STA.W HDMAObject_InstructionTimers,X                                 ;88EBEB;

  .return:
    PLP                                                                  ;88EBEE;
    RTL                                                                  ;88EBEF;


;;; $EBF0: Spawn intro cutscene cross-fade HDMA object ;;;
SpawnIntroCutsceneCrossFade_HDMAObject:
    PHP                                                                  ;88EBF0;
    PHB                                                                  ;88EBF1;
    PHK                                                                  ;88EBF2;
    PLB                                                                  ;88EBF3;
    REP #$30                                                             ;88EBF4;
    PHX                                                                  ;88EBF6;
    JSL.L Spawn_HDMAObject                                               ;88EBF7;
    db $00,$31                                                           ;88EBFB;
    dw InstList_IntroCutsceneCrossFade                                   ;88EBFD;
    PLX                                                                  ;88EBFF;
    PLB                                                                  ;88EC00;
    PLP                                                                  ;88EC01;
    RTL                                                                  ;88EC02;


;;; $EC03: Instruction list - intro cutscene cross-fade ;;;
InstList_IntroCutsceneCrossFade:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88EC03;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88EC06;
    dl PreInstruction_IntroCutsceneCrossFade                             ;88EC08;
    dw $0001,HDMATable_IntroCutsceneCrossFade_ColorMathControlRegB       ;88EC0B;
    dw Instruction_HDMAObject_Sleep                                      ;88EC0F;
    dw Instruction_HDMAObject_Delete                                     ;88EC11;


;;; $EC13: HDMA table - intro cutscene cross-fade colour math control register B ;;;
HDMATable_IntroCutsceneCrossFade_ColorMathControlRegB:                   ;88EC13;
    db $17,$02 ; Enable colour math on BG2
    db $60,$06 ; Enable colour math on BG2/BG3
    db $40,$06 ; Enable colour math on BG2/BG3
    db $48,$02 ; Enable colour math on BG2
    db $00,$00


;;; $EC1D: Pre-instruction - intro cutscene cross-fade ;;;
PreInstruction_IntroCutsceneCrossFade:
    PHP                                                                  ;88EC1D;
    REP #$30                                                             ;88EC1E;
    LDA.W IntroCrossFadeTimer                                            ;88EC20;
    CMP.W #$0001                                                         ;88EC23;
    BNE .return                                                          ;88EC26;
    LDX.W HDMAObject_Index                                               ;88EC28;
    LDA.W HDMAObject_InstListPointers,X                                  ;88EC2B;
    INC                                                                  ;88EC2E;
    INC                                                                  ;88EC2F;
    STA.W HDMAObject_InstListPointers,X                                  ;88EC30;
    LDA.W #$0001                                                         ;88EC33;
    STA.W HDMAObject_InstructionTimers,X                                 ;88EC36;

  .return:
    PLP                                                                  ;88EC39;
    RTL                                                                  ;88EC3A;


;;; $EC3B: Spawn wavy Samus HDMA object ;;;
Spawn_WavySamus_HDMAObject:
; Almost identical to doubled wavelength wavy Phantoon
    PHP                                                                  ;88EC3B;
    PHB                                                                  ;88EC3C;
    PHK                                                                  ;88EC3D;
    PLB                                                                  ;88EC3E;
    REP #$30                                                             ;88EC3F;
    PHX                                                                  ;88EC41;
    LDA.W #$0001                                                         ;88EC42;
    STA.W WavySamus_Enable                                               ;88EC45;
    LDA.W #$4000                                                         ;88EC48;
    STA.W WavySamus_Amplitude                                            ;88EC4B;
    LDA.W #$0008                                                         ;88EC4E;
    STA.W WavySamus_PhaseDelta                                           ;88EC51;
    LDA.W #$00C0                                                         ;88EC54;
    STA.W WavySamusBG3XScrollIndirectHDMATable                           ;88EC57;
    STA.W WavySamusBG3XScrollIndirectHDMATable+3                         ;88EC5A;
    STA.W WavySamusBG3XScrollIndirectHDMATable+6                         ;88EC5D;
    STA.W WavySamusBG3XScrollIndirectHDMATable+9                         ;88EC60;
    LDA.W #WavySamusBG3XScrollHDMADataTable                              ;88EC63;
    STA.W WavySamusBG3XScrollIndirectHDMATable+1                         ;88EC66;
    LDA.W #WavySamusBG3XScrollHDMADataTable+$80                          ;88EC69;
    STA.W WavySamusBG3XScrollIndirectHDMATable+4                         ;88EC6C;
    LDA.W #WavySamusBG3XScrollHDMADataTable                              ;88EC6F;
    STA.W WavySamusBG3XScrollIndirectHDMATable+7                         ;88EC72;
    LDA.W #WavySamusBG3XScrollHDMADataTable+$80                          ;88EC75;
    STA.W WavySamusBG3XScrollIndirectHDMATable+$A                        ;88EC78;
    STZ.W WavySamusBG3XScrollIndirectHDMATable+$C                        ;88EC7B;
    JSL.L Spawn_HDMAObject                                               ;88EC7E;
    db $42,$11                                                           ;88EC82;
    dw InstList_WavySamus                                                ;88EC84;
    PLX                                                                  ;88EC86;
    PLB                                                                  ;88EC87;
    PLP                                                                  ;88EC88;
    RTL                                                                  ;88EC89;


;;; $EC8A: Instruction list - wavy Samus ;;;
InstList_WavySamus:
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88EC8A;
    dw Instruction_HDMAObject_HDMATableBank : db $00                     ;88EC8D;
    dw Instruction_Setup_WavySamus                                       ;88EC90;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88EC92;
    dl PreInstruction_WavySamus                                          ;88EC94;
    dw $0001,WavySamusBG3XScrollIndirectHDMATable                        ;88EC97;
    dw Instruction_HDMAObject_Sleep                                      ;88EC9B;
    dw Instruction_HDMAObject_Delete                                     ;88EC9D;


;;; $EC9F: Instruction - set up wavy Samus ;;;
Instruction_Setup_WavySamus:
;; Parameters:
;;     X: HDMA object index
    PHP                                                                  ;88EC9F;
    REP #$30                                                             ;88ECA0;
    LDA.W #$FFFE                                                         ;88ECA2;
    STA.W HDMAObject_Var0,X                                              ;88ECA5;
    LDA.W #$0001                                                         ;88ECA8;
    STA.W HDMAObject_Var1,X                                              ;88ECAB;
    STZ.W HDMAObject_Var2,X                                              ;88ECAE;
    STZ.W HDMAObject_Var3,X                                              ;88ECB1;
    PLP                                                                  ;88ECB4;
    RTS                                                                  ;88ECB5;


;;; $ECB6: Pre-instruction - wavy Samus ;;;
PreInstruction_WavySamus:
    PHP                                                                  ;88ECB6;
    REP #$30                                                             ;88ECB7;
    LDA.W WavySamus_Enable                                               ;88ECB9;
    BNE .enabled                                                         ;88ECBC;
    LDX.W HDMAObject_Index                                               ;88ECBE;
    LDA.W HDMAObject_InstListPointers,X                                  ;88ECC1;
    INC                                                                  ;88ECC4;
    INC                                                                  ;88ECC5;
    STA.W HDMAObject_InstListPointers,X                                  ;88ECC6;
    LDA.W #$0001                                                         ;88ECC9;
    STA.W HDMAObject_InstructionTimers,X                                 ;88ECCC;
    PLP                                                                  ;88ECCF;
    RTL                                                                  ;88ECD0;

  .enabled:
    LDA.W #$0004                                                         ;88ECD1;
    STA.B DP_Temp1C                                                      ;88ECD4;
    LDA.W #$0080                                                         ;88ECD6;
    STA.B DP_Temp1E                                                      ;88ECD9;
    PHX                                                                  ;88ECDB;
    LDA.W WavySamus_PhaseDelta                                           ;88ECDC;
    ASL                                                                  ;88ECDF;
    STA.B DP_Temp12                                                      ;88ECE0;
    LDA.W HDMAObject_Var0,X                                              ;88ECE2;
    CLC                                                                  ;88ECE5;
    ADC.B DP_Temp12                                                      ;88ECE6;
    AND.W #$01FF                                                         ;88ECE8;
    STA.W HDMAObject_Var0,X                                              ;88ECEB;
    LDA.W HDMAObject_Var0,X                                              ;88ECEE;
    STA.B DP_Temp14                                                      ;88ECF1;
    LDX.W #$0000                                                         ;88ECF3;

  .loop:
    PHX                                                                  ;88ECF6;
    LDX.B DP_Temp14                                                      ;88ECF7;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;88ECF9;
    BPL +                                                                ;88ECFD;
    JMP.W .negative                                                      ;88ECFF;

+   STA.B DP_Temp12                                                      ;88ED02;
    SEP #$20                                                             ;88ED04;
    STA.W $4202                                                          ;88ED06;
    LDA.W WavySamus_Amplitude                                            ;88ED09;
    STA.W $4203                                                          ;88ED0C;
    NOP                                                                  ;88ED0F;
    NOP                                                                  ;88ED10;
    NOP                                                                  ;88ED11;
    REP #$20                                                             ;88ED12;
    LDA.W $4216                                                          ;88ED14;
    XBA                                                                  ;88ED17;
    AND.W #$00FF                                                         ;88ED18;
    STA.B DP_Temp16                                                      ;88ED1B;
    SEP #$20                                                             ;88ED1D;
    LDA.B DP_Temp13                                                      ;88ED1F;
    STA.W $4202                                                          ;88ED21;
    LDA.W WavySamus_Amplitude                                            ;88ED24;
    STA.W $4203                                                          ;88ED27;
    NOP                                                                  ;88ED2A;
    NOP                                                                  ;88ED2B;
    NOP                                                                  ;88ED2C;
    REP #$20                                                             ;88ED2D;
    LDA.W $4216                                                          ;88ED2F;
    CLC                                                                  ;88ED32;
    ADC.B DP_Temp16                                                      ;88ED33;
    STA.B DP_Temp16                                                      ;88ED35;
    SEP #$20                                                             ;88ED37;
    LDA.B DP_Temp12                                                      ;88ED39;
    STA.W $4202                                                          ;88ED3B;
    LDA.W WavySamus_Amplitude+1                                          ;88ED3E;
    STA.W $4203                                                          ;88ED41;
    NOP                                                                  ;88ED44;
    NOP                                                                  ;88ED45;
    NOP                                                                  ;88ED46;
    REP #$20                                                             ;88ED47;
    LDA.W $4216                                                          ;88ED49;
    STA.B DP_Temp18                                                      ;88ED4C;
    SEP #$20                                                             ;88ED4E;
    LDA.B DP_Temp13                                                      ;88ED50;
    STA.W $4202                                                          ;88ED52;
    LDA.W WavySamus_Amplitude+1                                          ;88ED55;
    STA.W $4203                                                          ;88ED58;
    REP #$20                                                             ;88ED5B;
    LDA.B DP_Temp16                                                      ;88ED5D;
    CLC                                                                  ;88ED5F;
    ADC.B DP_Temp18                                                      ;88ED60;
    STA.B DP_Temp16                                                      ;88ED62;
    LDA.W $4215                                                          ;88ED64;
    AND.W #$FF00                                                         ;88ED67;
    CLC                                                                  ;88ED6A;
    ADC.B DP_Temp16                                                      ;88ED6B;
    AND.W #$FF00                                                         ;88ED6D;
    XBA                                                                  ;88ED70;
    STA.B DP_Temp12                                                      ;88ED71;
    TXA                                                                  ;88ED73;
    CLC                                                                  ;88ED74;
    ADC.B DP_Temp1C                                                      ;88ED75;
    AND.W #$01FF                                                         ;88ED77;
    STA.B DP_Temp14                                                      ;88ED7A;
    PLX                                                                  ;88ED7C;
    LDA.B DP_BG3XScroll                                                  ;88ED7D;
    CLC                                                                  ;88ED7F;
    ADC.B DP_Temp12                                                      ;88ED80;
    STA.L WavySamusBG3XScrollHDMADataTable,X                             ;88ED82;
    JMP.W .next                                                          ;88ED86;

  .negative:
    EOR.W #$FFFF                                                         ;88ED89;
    INC                                                                  ;88ED8C;
    STA.B DP_Temp12                                                      ;88ED8D;
    SEP #$20                                                             ;88ED8F;
    STA.W $4202                                                          ;88ED91;
    LDA.W WavySamus_Amplitude                                            ;88ED94;
    STA.W $4203                                                          ;88ED97;
    NOP                                                                  ;88ED9A;
    NOP                                                                  ;88ED9B;
    NOP                                                                  ;88ED9C;
    REP #$20                                                             ;88ED9D;
    LDA.W $4216                                                          ;88ED9F;
    XBA                                                                  ;88EDA2;
    AND.W #$00FF                                                         ;88EDA3;
    STA.B DP_Temp16                                                      ;88EDA6;
    SEP #$20                                                             ;88EDA8;
    LDA.B DP_Temp13                                                      ;88EDAA;
    STA.W $4202                                                          ;88EDAC;
    LDA.W WavySamus_Amplitude                                            ;88EDAF;
    STA.W $4203                                                          ;88EDB2;
    NOP                                                                  ;88EDB5;
    NOP                                                                  ;88EDB6;
    NOP                                                                  ;88EDB7;
    REP #$20                                                             ;88EDB8;
    LDA.W $4216                                                          ;88EDBA;
    CLC                                                                  ;88EDBD;
    ADC.B DP_Temp16                                                      ;88EDBE;
    STA.B DP_Temp16                                                      ;88EDC0;
    SEP #$20                                                             ;88EDC2;
    LDA.B DP_Temp12                                                      ;88EDC4;
    STA.W $4202                                                          ;88EDC6;
    LDA.W WavySamus_Amplitude+1                                          ;88EDC9;
    STA.W $4203                                                          ;88EDCC;
    NOP                                                                  ;88EDCF;
    NOP                                                                  ;88EDD0;
    NOP                                                                  ;88EDD1;
    REP #$20                                                             ;88EDD2;
    LDA.W $4216                                                          ;88EDD4;
    STA.B DP_Temp18                                                      ;88EDD7;
    SEP #$20                                                             ;88EDD9;
    LDA.B DP_Temp13                                                      ;88EDDB;
    STA.W $4202                                                          ;88EDDD;
    LDA.W WavySamus_Amplitude+1                                          ;88EDE0;
    STA.W $4203                                                          ;88EDE3;
    REP #$20                                                             ;88EDE6;
    LDA.B DP_Temp16                                                      ;88EDE8;
    CLC                                                                  ;88EDEA;
    ADC.B DP_Temp18                                                      ;88EDEB;
    STA.B DP_Temp16                                                      ;88EDED;
    LDA.W $4215                                                          ;88EDEF;
    AND.W #$FF00                                                         ;88EDF2;
    CLC                                                                  ;88EDF5;
    ADC.B DP_Temp16                                                      ;88EDF6;
    AND.W #$FF00                                                         ;88EDF8;
    XBA                                                                  ;88EDFB;
    STA.B DP_Temp12                                                      ;88EDFC;
    TXA                                                                  ;88EDFE;
    CLC                                                                  ;88EDFF;
    ADC.B DP_Temp1C                                                      ;88EE00;
    AND.W #$01FF                                                         ;88EE02;
    STA.B DP_Temp14                                                      ;88EE05;
    PLX                                                                  ;88EE07;
    LDA.B DP_BG3XScroll                                                  ;88EE08;
    SEC                                                                  ;88EE0A;
    SBC.B DP_Temp12                                                      ;88EE0B;
    STA.L WavySamusBG3XScrollHDMADataTable,X                             ;88EE0D;

  .next:
    INX                                                                  ;88EE11;
    INX                                                                  ;88EE12;
    CPX.B DP_Temp1E                                                      ;88EE13;
    BPL +                                                                ;88EE15;
    JMP.W .loop                                                          ;88EE17;

+   LDX.W #$007E                                                         ;88EE1A;

  .loopBG3XScroll:
    LDA.B DP_BG3XScroll                                                  ;88EE1D;
    SEC                                                                  ;88EE1F;
    SBC.L WavySamusBG3XScrollHDMADataTable,X                             ;88EE20;
    CLC                                                                  ;88EE24;
    ADC.B DP_BG3XScroll                                                  ;88EE25;
    STA.L WavySamusBG3XScrollHDMADataTable+$80,X                         ;88EE27;
    DEX                                                                  ;88EE2B;
    DEX                                                                  ;88EE2C;
    BPL .loopBG3XScroll                                                  ;88EE2D;
    PLX                                                                  ;88EE2F;
    PLP                                                                  ;88EE30;
    RTL                                                                  ;88EE31;


Freespace_Bank88_EE32:                                                   ;88EE32;
; $11CE bytes
