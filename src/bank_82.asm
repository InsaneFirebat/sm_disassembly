
org $828000


GameState_6_1F_28_LoadingGameData_SetupNewGame_LoadDemoData:
    PHP 
    REP #$30 
    LDA.W $0998 : CMP.W #$0028 : BNE .notDemo 
    JSR.W InialiseIORegistersForGameplay 
    JSR.W Load_StandardBG3Tiles_SpriteTiles_ClearTilemaps 
    JSR.W LoadInitialPalette 
    JSL.L InitializeSamus 
    JSR.W LoadDemoRoomData 
    BRA .gameplay 


.notDemo:
    LDA.L $7ED914 : CMP.W #$0005 : BEQ .onZebes 
    CMP.W #$001F : BEQ .ceres 
    CMP.W #$0022 : BEQ .zebesLanding 
    BRA .onZebes 


.zebesLanding:
    STZ.W $079F 
    LDA.W #$0012 : STA.W $078B 
    JSL.L LoadMirrorOfCurrentAreasMapExplored 
    BRA .onZebes 


.ceres:
    LDA.W #$0006 : STA.W $079F 
    STZ.W $078B 
    JSL.L ClearTimerRAM 

.onZebes:
    JSR.W InialiseIORegistersForGameplay 
    JSR.W Load_StandardBG3Tiles_SpriteTiles_ClearTilemaps 
    JSR.W LoadInitialPalette 
    JSL.L InitializeSamus 
    JSL.L LoadFromLoadStation 

.gameplay:
    JSL.L StartGameplay 
    JSL.L InitialiseHUD_GameLoading 
    JSL.L RTL_A09784 
    PHP 
    REP #$30 
    LDY.W #$0020 
    LDX.W #$0000 

.loopTargetSamusPalette:
    LDA.L $7EC180,X : STA.L $7EC380,X 
    INX #2
    DEY #2
    BNE .loopTargetSamusPalette 
    PLP 
    LDA.W #$0001 : STA.W $0723 
    STA.W $0725 
    JSL.L EnableNMI 
    JSL.L Enable_Enemy_Projectiles 
    JSL.L Enable_PLMs 
    JSL.L Enable_PaletteFXObjects 
    JSL.L Enable_HDMAObjects 
    JSL.L Enable_AnimatedTilesObjects 
    JSL.L SetLiquidPhysicsType 
    LDA.W $0998 : CMP.W #$0028 : BNE + 
    JMP.W .demo 


  + LDA.L $7ED914 : CMP.W #$0022 : BNE .notZebesLanding 
    LDA.W #$0005 : JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$000F : STA.W $0DA0 

.loopAlpha:
    JSL.L TransferEnemyTilesToVRAM_InitialiseEnemies 
    JSL.L WaitForNMI 
    DEC.W $0DA0 
    BPL .loopAlpha 
    INC.W $0998 
    PHP 
    REP #$30 
    LDY.W #$0200 
    LDX.W #$0000 

.loopAlphaPalettes:
    LDA.L $7EC200,X : STA.L $7EC000,X 
    INX #2
    DEY #2
    BNE .loopAlphaPalettes 
    PLP : PLP 
    RTS 


.notZebesLanding:
    LDA.W #$0006 : STA.W $0DA0 

.loopBeta:
    JSL.L TransferEnemyTilesToVRAM_InitialiseEnemies 
    JSL.L WaitForNMI 
    DEC.W $0DA0 
    BPL .loopBeta 
    LDA.W #$0007 : STA.W $0998 
    PHP 
    REP #$30 
    LDY.W #$0200 
    LDX.W #$0000 

.loopBetaPalettes:
    LDA.L $7EC200,X : STA.L $7EC000,X 
    INX #2
    DEY #2
    BNE .loopBetaPalettes 
    PLP 
    LDA.L $7ED914 : CMP.W #$001F : BNE .runSamusCmd 
    LDA.W #$0000 : STA.L $7EC1BE 
    LDA.W #$0008 : JSL.L Run_Samus_Command 
    PLP 
    RTS 


.runSamusCmd:
    LDA.W #$0009 : JSL.L Run_Samus_Command 
    PLP 
    RTS 


.demo:
    LDA.W #$0006 : STA.W $0DA0 

.transferVRAM:
    JSL.L TransferEnemyTilesToVRAM_InitialiseEnemies 
    JSL.L WaitForNMI 
    DEC.W $0DA0 
    BPL .transferVRAM 
    LDA.W $1F57 
    DEC A 
    STA.B $12 
    ASL #3
    ADC.B $12 : ASL A 
    STA.B $12 
    LDA.W $1F55 
    ASL A 
    TAX 
    LDA.W DemoRoomData_pointers,X : CLC : ADC.B $12 : TAX 
    LDA.W $0010,X : STA.B $12 
    LDX.W #$0000 
    JSR.W ($0012,X) 
    INC.W $0998 
    PHP 
    REP #$30 
    LDY.W #$0200 
    LDX.W #$0000 

.loopDemoPalettes:
    LDA.L $7EC200,X : STA.L $7EC000,X 
    INX #2
    DEY #2
    BNE .loopDemoPalettes 
    PLP : PLP 
    RTS 


InialiseIORegistersForGameplay:
    PHP 
    JSR.W InitialiseCPURegistersForGameplay 
    JSR.W SetupPPUForGameplay 
    PLP 
    RTS 


InitialiseCPURegistersForGameplay:
    PHP 
    SEP #$30 
    LDA.B #$01 : STA.W $4200 
    STA.B $84 
    STZ.W $4201 
    STZ.W $4202 
    STZ.W $4203 
    STZ.W $4204 
    STZ.W $4205 
    STZ.W $4206 
    STZ.W $4207 
    STZ.W $4208 
    STZ.W $4209 
    STZ.W $420A 
    STZ.W $420B 
    STZ.W $420C 
    STZ.B $85 
    LDA.B #$01 : STA.W $420D 
    STA.B $86 
    PLP 
    RTS 


SetupPPUForGameplay:
    PHP 
    SEP #$30 
    LDA.B #$80 : STA.W $2100 
    STA.B $51 
    LDA.B #$03 : STA.W $2101 
    STA.B $52 
    STZ.W $2102 
    STZ.B $53 
    LDA.B #$80 : STA.W $2103 
    STA.B $54 
    STZ.W $2104 
    STZ.W $2104 
    LDA.B #$09 : STA.W $2105 
    STA.B $55 
    STZ.W $2106 
    STZ.B $57 
    STZ.B $5D 
    STZ.W $210B 
    LDA.B #$04 : STA.B $5E 
    STA.W $210C 
    LDA.B #$51 : STA.B $58 
    STA.W $2107 
    LDA.B #$49 : STA.B $59 
    STA.W $2108 
    LDA.B #$5A : STA.B $5A 
    STA.W $2109 
    LDA.B #$00 : STA.B $5C 
    STA.W $210A 
    STZ.W $2115 
    STZ.W $2123 
    STZ.B $60 
    STZ.W $2123 
    STZ.B $60 
    STZ.W $2124 
    STZ.B $61 
    STZ.W $2125 
    STZ.B $62 
    STZ.W $2126 
    STZ.B $63 
    STZ.W $2127 
    STZ.B $64 
    STZ.W $2128 
    STZ.B $65 
    STZ.W $2129 
    STZ.B $66 
    STZ.W $212A 
    STZ.B $67 
    STZ.W $212B 
    STZ.B $68 
    LDA.B #$17 : STA.W $212C 
    STA.B $69 
    STZ.W $212E 
    STZ.B $6C 
    LDA.B #$00 : STA.W $212D 
    STA.B $6B 
    STZ.W $212F 
    STZ.B $6D 
    STZ.W $2130 
    STZ.B $6E 
    STZ.W $2131 
    STZ.B $71 
    LDA.B #$E0 : STA.W $2132 
    LDA.B #$00 : STA.W $2133 
    STA.B $77 
    REP #$30 
    STZ.W $0590 
    LDA.W #$0000 
    LDX.W #$3000 
    LDY.W #$07FE 
    JSL.L WriteYBytesOfATo_7E0000_X_16bit 
    LDA.W #$006F 
    LDX.W #$4000 
    LDY.W #$07FE 
    JSL.L WriteYBytesOfATo_7E0000_X_16bit 
    LDA.W #$2C0F 
    LDX.W #$4000 
    LDY.W #$00FE 
    JSL.L WriteYBytesOfATo_7E0000_X_16bit 
    PLP 
    RTS 


LoadInitialPalette:
    PHP 
    SEP #$30 
    PHP 
    REP #$30 
    LDY.W #$0200 
    LDX.W #$0000 

.loop:
    LDA.L Initial_Palette_BGPalette0,X : STA.L $7EC000,X 
    INX #2
    DEY #2
    BNE .loop 
    PLP : PLP 
    RTS 


Load_StandardBG3Tiles_SpriteTiles_ClearTilemaps:
    PHP 
    SEP #$30 
    LDA.B #$00 : STA.W $2116 
    LDA.B #$40 : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl Tiles_Standard_BG3 
    dw $2000 
    LDA.B #$02 : STA.W $420B 
    LDA.B #$00 : STA.W $2116 
    LDA.B #$60 : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl Tiles_Standard_Sprite_0 
    dw $4000 
    LDA.B #$02 : STA.W $420B 
    LDA.B #$00 : STA.W $2116 
    LDA.B #$50 : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7E4000 
    dw $1000 
    LDA.B #$02 : STA.W $420B 
    LDA.B #$00 : STA.W $2116 
    LDA.B #$58 : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7E4000 
    dw $0800 
    LDA.B #$02 : STA.W $420B 
    PLP 
    RTS 


GameState_20_MadeItToCeresElevator:
    PHP 
    REP #$30 
    LDA.W $0943 : BEQ + 
    JSL.L DrawTimer 

  + JSR.W GameState_8_MainGameplay 
    DEC.W $0AA0 
    BEQ + 
    BPL .return 

  + INC.W $0998 
    STZ.W $0723 
    STZ.W $0725 

.return:
    PLP 
    RTS 


GameState_21_BlackoutFromCeres:
    PHP 
    REP #$30 
    LDA.W $0943 : BEQ + 
    JSL.L DrawTimer 

  + JSR.W GameState_8_MainGameplay 
    JSL.L HandleFadingOut 
    SEP #$20 
    LDA.B $51 : CMP.B #$80 : BEQ + 
    REP #$20 
    PLP 
    RTS 


  + JSL.L EnableNMI 
    REP #$20 
    JSL.L Wait_End_VBlank_Clear_HDMA 
    JSL.L DisableHVCounterInterrupts 
    STZ.W $1982 
    STZ.B $AB 
    SEP #$20 
    STZ.B $6E 
    STZ.B $71 
    LDA.B #$10 : STA.B $69 
    STZ.B $6B 
    STZ.B $6C 
    STZ.B $6D 
    LDA.B #$09 : STA.B $55 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    LDA.W #$0022 : STA.L $7ED914 
    STA.W $0998 
    LDA.W $0952 : JSL.L SaveToSRAM 
    LDA.W #CinematicFunction_CeresGoesBoom_Initial : STA.W $1F51 
    STZ.W $093F 
    STZ.W $0943 
    LDA.W #$0000 : JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$0002 : JSL.L QueueSound 
    LDA.W #$0071 : JSL.L QueueSound_Lib2_Max15 
    LDA.W #$0001 : JSL.L QueueSound_Lib3_Max15 
    PLP 
    RTS 


GameState_23_TimeUp:
    PHP 
    REP #$30 
    JSR.W GameState_8_MainGameplay 
    LDA.W #$0008 : STA.L $7EC402 
    JSR.W Advance_GradualColorChange_ofAllPalettes 
    BCC .return 
    LDA.W #$0024 : STA.W $0998 
    STZ.W $0723 
    STZ.W $0725 

.return:
    PLP 
    RTS 


GameState_24_WhitingOutFromTimeUp:
    PHP 
    REP #$30 
    JSL.L HandleFadingOut 
    SEP #$20 
    LDA.B $51 : CMP.B #$80 : BEQ + 
    REP #$20 
    PLP 
    RTS 


  + JSL.L EnableNMI 
    REP #$20 
    JSL.L Wait_End_VBlank_Clear_HDMA 
    JSL.L DisableHVCounterInterrupts 
    STZ.W $1982 
    STZ.B $AB 
    SEP #$20 
    STZ.B $6E 
    STZ.B $71 
    LDA.B #$10 : STA.B $69 
    STZ.B $6B 
    STZ.B $6C 
    STZ.B $6D 
    LDA.B #$09 : STA.B $55 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    STZ.W $093F 
    STZ.W $0943 
    LDA.W #$0002 : JSL.L QueueSound 
    LDA.W #$0071 : JSL.L QueueSound_Lib2_Max15 
    LDA.W #$0001 : JSL.L QueueSound_Lib3_Max15 
    LDA.W #$000E : JSL.L CheckIfEvent_inA_HasHappened 
    BCC .notZebesTimebomb 
    STZ.W $0DE2 
    STZ.W $0727 
    LDX.W #$00FE 

.loop:
    STZ.W $1A8D,X 
    DEX #2
    BPL .loop 
    LDA.W #$0019 : STA.W $0998 
    PLP 
    RTS 


.notZebesTimebomb:
    LDA.W #$0025 : STA.W $0998 
    LDA.W #CinematicFunction_CeresGoesBoom_Initial : STA.W $1F51 
    PLP 
    RTS 


GameState_26_SamusEscapesFromZebes:
    PHP 
    REP #$30 
    JSR.W GameState_8_MainGameplay 
    JSL.L HandleFadingOut 
    SEP #$20 
    LDA.B $51 : CMP.B #$80 : BEQ + 
    REP #$20 
    PLP 
    RTS 


  + JSL.L EnableNMI 
    REP #$20 
    JSL.L Wait_End_VBlank_Clear_HDMA 
    JSL.L DisableHVCounterInterrupts 
    STZ.W $1982 
    SEP #$20 
    STZ.B $6E 
    STZ.B $71 
    LDA.B #$10 : STA.B $69 
    STZ.B $6B 
    STZ.B $6C 
    STZ.B $6D 
    LDA.B #$09 : STA.B $55 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    LDA.W #$0027 : STA.W $0998 
    LDA.W #CinematicFunction_Ending_Setup : STA.W $1F51 
    STZ.W $0943 
    LDA.W #$0000 : JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$0002 : JSL.L QueueSound 
    LDA.W #$0071 : JSL.L QueueSound_Lib2_Max15 
    LDA.W #$0001 : JSL.L QueueSound_Lib3_Max15 
    PLP 
    RTS 


GameState_29_TransitionToDemo:
    PHP 
    REP #$30 
    JSR.W GameState_8_MainGameplay 
    JSL.L WaitForNMI 
    JSL.L HDMAObjectHandler_HandleMusicQueue 
    INC.W $0998 
    SEP #$20 
    LDA.B #$0F : STA.B $51 
    REP #$20 
    PLP 
    RTS 


GameState_2A_PlayingDemo:
    PHP 
    REP #$30 
    JSR.W GameState_8_MainGameplay 
    LDA.B $8F : BEQ .decDemoTimer 
    LDA.W #$0001 : STA.W $0DEC 
    BRA .endDemos 


.decDemoTimer:
    DEC.W $1F53 
    BEQ + 
    BPL .return 

  + STZ.W $0DEC 
    LDX.W #$005A 

.loop:
    JSL.L WaitForNMI 
    LDA.B $8F : BNE .pressedInput 
    DEX 
    BNE .loop 
    BRA .endDemos 


.pressedInput:
    LDA.W #$0001 : STA.W $0DEC 

.endDemos:
    INC.W $0998 
    STZ.W $05F5 
    SEP #$20 
    LDA.B #$80 : STA.B $51 
    REP #$20 
    LDA.W #$0001 : STA.W $0723 
    STA.W $0725 

.return:
    PLP 
    RTS 


GameState_2B_UnloadGameData:
    PHP 
    REP #$30 
    LDA.W $0DEC : CMP.W #$0001 : BEQ + 
    JSR.W CheckForNextDemo 

  + JSL.L EnableNMI 
    INC.W $0998 
    STZ.W $0723 
    STZ.W $0725 
    JSL.L Wait_End_VBlank_Clear_HDMA 
    JSL.L DisableHVCounterInterrupts 
    STZ.W $1982 
    STZ.B $AB 
    STZ.B $A7 
    JSL.L Disable_PaletteFXObjects 
    JSL.L Clear_PaletteFXObjects 
    LDA.W #$1C1F 
    DEC #2
    SEC : SBC.W #$198D : TAX 

.clearNonGameplayRAM:
    STZ.W $198D,X 
    DEX #2
    BPL .clearNonGameplayRAM 
    LDA.W #$0998 
    DEC #2
    SEC : SBC.W #$077C : TAX 

.clearGameplayRAM:
    STZ.W $077C,X 
    DEX #2
    BPL .clearGameplayRAM 
    SEP #$20 
    STZ.B $6E 
    STZ.B $71 
    LDA.B #$10 : STA.B $69 
    STZ.B $6B 
    STZ.B $6C 
    STZ.B $6D 
    REP #$20 
    PLP 
    RTS 


GameState_2C_TransitionFromDemo:
    PHP 
    REP #$30 
    LDA.W #$0001 : STA.W $0998 
    LDA.W $0DEC : BMI .nextDemoScene 
    BNE .titleSequence 
    LDA.W #$0000 : JSL.L QueueMusicDataOrTrack_8FrameDelay 
    STZ.W $05F5 
    LDA.W #CinematicFunction_LoadTitleSequence : STA.W $1F51 
    PLP 
    RTS 


.titleSequence:
    JSL.L Load_Title_Sequence_Graphics 
    LDA.W #$0002 : STA.W $1A53 
    LDA.W #RTS_8B9A47 : STA.W $1F51 
    PLP 
    RTS 


.nextDemoScene:
    LDA.W #$0028 : STA.W $0998 
    PLP 
    RTS 


CheckForNextDemo:
    PHP 
    REP #$30 
    LDA.W $1F57 
    ASL #3
    ADC.W $1F57 : ASL A 
    STA.B $12 
    LDA.W $1F55 
    ASL A 
    TAX 
    LDA.W DemoRoomData_pointers,X : CLC : ADC.B $12 : TAX 
    LDA.W $0000,X : CMP.W #$FFFF : BNE .nextDemoScene 
    STZ.W $0DEC 
    LDA.W $1F55 
    INC A 
    CMP.W $1F59 : BCC + 
    LDA.W #$0000 

  + STA.W $1F55 
    STZ.W $1F57 
    PLP 
    RTS 


.nextDemoScene:
    LDA.W #$8000 : STA.W $0DEC 
    PLP 
    RTS 


LoadDemoRoomData:
    PHP 
    REP #$30 
    STZ.W $078D 
    LDA.W $1F57 
    ASL #3
    ADC.W $1F57 : ASL A 
    STA.B $12 
    LDA.W $1F55 
    ASL A 
    TAX 
    LDA.W DemoRoomData_pointers,X : CLC : ADC.B $12 : TAX 
    LDA.W $0000,X : STA.W $079B 
    LDA.W $0002,X : STA.W $078D 
    LDA.W $0004,X : STA.W $078F 
    LDA.W $0006,X : STA.W $0911 
    STA.W $091D 
    LDA.W $0008,X : STA.W $0915 
    STA.W $091F 
    LDA.W $000A,X : CLC : ADC.W $0915 : STA.W $0AFA 
    STA.W $0B14 
    LDA.W $0911 : CLC : ADC.W #$0080 : CLC : ADC.W $000C,X : STA.W $0AF6 
    STA.W $0B10 
    LDA.W $000E,X : STA.W $1F53 
    PHB 
    SEP #$20 
    LDA.B #$8F 
    PHA : PLB 
    LDX.W $079B 
    LDA.W $0001,X : STA.W $079F 
    REP #$20 
    PLB 
    STZ.B $B1 
    STZ.B $B3 
    INC.W $1F57 
    LDX.W #$0000 

.loopEvents:
    LDA.W #$FFFF : STA.L $7ED830,X 
    STA.L $7ED870,X 
    STA.L $7ED8F0,X 
    STA.L $7ED908,X 
    STA.L $7ED8F8,X 
    STA.L $7ED900,X 
    LDA.W #$0000 : STA.L $7ED8B0,X 
    STA.L $7ED820,X 
    STA.L $7ED828,X 
    INX #2
    CPX.W #$0008 
    BMI .loopEvents 

.loopItems:
    LDA.W #$FFFF : STA.L $7ED830,X 
    STA.L $7ED870,X 
    LDA.W #$0000 : STA.L $7ED8B0,X 
    INX #2
    CPX.W #$0040 
    BMI .loopItems 
    LDA.W #$0000 
    LDX.W #$0000 

.loopMapData:
    STA.L $7ECD52,X 
    INX #2
    CPX.W #$0600 
    BMI .loopMapData 
    LDA.W #$0000 : STA.W $09D4 
    STA.W $09D6 
    STA.W $09C0 
    STA.L $7ED914 
    STA.W $05F7 
    PLP 
    RTS 


DemoRoomData_pointers:
    dw DemoRoomData_set0 
    dw DemoRoomData_set1 
    dw DemoRoomData_set2 
    dw DemoRoomData_set3 

DemoRoomData_set0:
    dw RoomHeader_LandingSite 
    dw Door_Parlor_1 
    dw $0001,$0400,$0400,$0040,$0001,$04D3 
    dw DemoRoomCode_LandingSite_BG2Tilemap 

    dw RoomHeader_ConstructionZone 
    dw Door_MorphBall_1 
    dw $0001,$0000,$0000,$006B,$FFD2,$0151 
    dw RTS_828924 

    dw RoomHeader_SporeSpawnKihunters 
    dw Door_BigPink_0 
    dw $0000,$0100,$0000,$00BB,$FFE0,$017A 
    dw RTS_828924 

    dw RoomHeader_FrogSpeedway 
    dw Door_UpperNorfairFarming_0 
    dw $0000,$0700,$0000,$008B,$0048,$01A4 
    dw RTS_828924 

    dw RoomHeader_SpikyAcidSnakesTunnel 
    dw Door_UpperNorfairRefill_1 
    dw $0001,$0000,$0000,$008B,$FFC2,$01BC 
    dw RTS_828924 

    dw RoomHeader_BigPink 
    dw Door_GreenHillZone_0 
    dw $0000,$0200,$0600,$0099,$0027,$0265 
    dw DemoRoomCode_ChargeBeamRoom_Scroll21hRed 

    dw $FFFF 

DemoRoomData_set1:
    dw RoomHeader_BelowSpazer 
    dw Door_WestTunnel_1 
    dw $0000,$0100,$0100,$008B,$0056,$01FD 
    dw RTS_828924 

    dw RoomHeader_GreenBrinstarFirefleas 
    dw Door_GreenBrinstarMainShaft_3 
    dw $0003,$0200,$0000,$008B,$0049,$019A 
    dw RTS_828924 

    dw RoomHeader_GreenHillZone 
    dw Door_BigPink_3 
    dw $0003,$0500,$0300,$00AB,$FFE2,$0117 
    dw RTS_828924 

    dw RoomHeader_LavaDive 
    dw Door_KronicBoost_2 
    dw $0002,$0300,$0000,$008B,$004B,$03CA 
    dw RTS_828924 

    dw RoomHeader_Flyway 
    dw Door_Parlor_3 
    dw $0003,$0000,$0000,$00BB,$FFF1,$00D5 
    dw RTS_828924 

    dw RoomHeader_Dachora 
    dw Door_BigPink_1 
    dw $0001,$0400,$0200,$0080,$0005,$0317 
    dw RTS_828924 

    dw $FFFF 

DemoRoomData_set2:
    dw RoomHeader_Basement 
    dw Door_WreckedShipMainShaft_3 
    dw $0003,$0200,$0000,$0060,$0004,$02EF 
    dw RTS_828924 

    dw RoomHeader_LandingSite 
    dw Door_Parlor_1 
    dw $0001,$0300,$0400,$00B0,$0000,$00C7 
    dw DemoRoomCode_LandingSite_BG2Tilemap 

    dw RoomHeader_KraidEyeDoor 
    dw Door_MiniKraid_1 
    dw $0001,$0000,$0100,$008B,$FFD2,$02D3 
    dw RTS_828924 

    dw RoomHeader_Caterpillar 
    dw Door_AlphaPowerBomb_0 
    dw $0000,$0000,$0700,$008B,$FFAA,$0164 
    dw RTS_828924 

    dw RoomHeader_Kraid 
    dw Door_KraidEyeDoor_1 
    dw $0001,$0000,$0100,$008B,$FFBF,$013F 
    dw DemoRoomCode_Kraid_KraidFunctionTimer 

    dw RoomHeader_Statues 
    dw Door_StatuesHallway_1 
    dw $0001,$0000,$0000,$008B,$FFB1,$0197 
    dw DemoRoomCode_TourianEntrance_KraidIsDead 

    dw $FFFF 

DemoRoomData_set3:
    dw RoomHeader_LandingSite 
    dw Door_DemoSet3_0_2_4 
    dw $0000,$0600,$0200,$0080,$0030,$0100 
    dw DemoRoomCode_LandingSite_BG2Tilemap 

    dw RoomHeader_MtEverest 
    dw Door_RedFish_0 
    dw $0000,$0200,$0000,$00AB,$0000,$0332 
    dw RTS_828924 

    dw RoomHeader_LandingSite 
    dw Door_DemoSet3_0_2_4 
    dw $0000,$0600,$0200,$007B,$0020,$0185 
    dw DemoRoomCode_LandingSite_BG2Tilemap 

    dw RoomHeader_GreenBrinstarMainShaft 
    dw Door_BrinstarPreMap_1 
    dw $0001,$0000,$0400,$008B,$FFB7,$018A 
    dw RTS_828924 

    dw RoomHeader_LandingSite 
    dw Door_DemoSet3_0_2_4 
    dw $0000,$0600,$0200,$008B,$0004,$0200 
    dw DemoRoomCode_LandingSite_BG2Tilemap 

    dw $FFFF 

DemoRoomCode_ChargeBeamRoom_Scroll21hRed:
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD41 
    REP #$20 

RTS_828924:
    RTS 


DemoRoomCode_LandingSite_BG2Tilemap:
    LDA.W #$004A : STA.B $59 
    RTS 


DemoRoomCode_Kraid_KraidFunctionTimer:
    LDA.W #$003C : STA.W $0FB2 
    RTS 


DemoRoomCode_TourianEntrance_KraidIsDead:
    SEP #$20 
    LDA.B #$01 : STA.L $7ED829 
    REP #$20 
    RTS 


MainGameLoop:
    PHK : PLB 
    REP #$20 
    STZ.W $0998 
    STZ.W $0DF4 
    CLI 

.loop:
    PHP 
    REP #$30 
    JSL.L HDMAObjectHandler_HandleMusicQueue 
    JSL.L GenerateRandomNumber 
    JSL.L ClearHighOAM 
    STZ.W $0590 
    STZ.W $071D 
    STZ.W $071F 
    STZ.W $0721 
    LDA.W $0998 : AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.gamemodes,X) 
    JSL.L HandleSounds 
    JSL.L Finalise_OAM 
    JSL.L ShowSpareCPUDebug_UpdatePrevCtrl1Input 
    JSL.L WaitForNMI 
    PLP 
    BRA .loop 


.gamemodes:
    dw GameState_0_ResetStart 
    dw GameState_1_TitleSequence 
    dw GameState_2_GameOptionsMenu 
    dw GameState_3_Nothing 
    dw GameState_4_FileSelectMenus 
    dw GameState_5_FileSelectMap 
    dw GameState_6_1F_28_LoadingGameData_SetupNewGame_LoadDemoData 
    dw GameState_7_MainGameplayFadingIn 
    dw GameState_8_MainGameplay 
    dw GameState_9_HitADoorBlock 
    dw GameState_A_LoadingNextRoom 
    dw GameState_B_LoadingNextRoom 
    dw GameState_C_Pausing_NormalGameplayDarkening 
    dw GameState_D_Pausing_LoadingPauseScreen 
    dw GameState_E_Paused_LoadingPauseScreen 
    dw GameState_F_Paused_MapAndItemScreens 
    dw GameState_10_Unpausing_LoadingNormalGameplay 
    dw GameState_11_Unpausing_LoadingNormalGameplay 
    dw GameState_12_Unpausing_NormalGameplayBrightening 
    dw GameState_13_DeathSequence_Start 
    dw GameState_14_DeathSequence_BlackOutSurroundings 
    dw GameState_15_DeathSequence_WaitForMusic 
    dw GameState_16_DeathSequence_PreFlashing 
    dw GameState_17_DeathSequence_Flashing 
    dw GameState_18_DeathSequence_ExplosionWhiteOut 
    dw GameState_19_DeathSequence_BlackOut 
    dw GameState_1A_GameOverScreen 
    dw GameState_1B_ReserveTankAuto 
    dw UNUSED_GameState_1C_828B3F 
    dw GameState_1D_DebugGameOverMenu 
    dw GameState_1E_22_25_Intro_CeresGoesBoom_SamusGoesToZebes 
    dw GameState_6_1F_28_LoadingGameData_SetupNewGame_LoadDemoData 
    dw GameState_20_MadeItToCeresElevator 
    dw GameState_21_BlackoutFromCeres 
    dw GameState_1E_22_25_Intro_CeresGoesBoom_SamusGoesToZebes 
    dw GameState_23_TimeUp 
    dw GameState_24_WhitingOutFromTimeUp 
    dw GameState_1E_22_25_Intro_CeresGoesBoom_SamusGoesToZebes 
    dw GameState_26_SamusEscapesFromZebes 
    dw GameState_27_EndingAndCredits 
    dw GameState_6_1F_28_LoadingGameData_SetupNewGame_LoadDemoData 
    dw GameState_29_TransitionToDemo 
    dw GameState_2A_PlayingDemo 
    dw GameState_2B_UnloadGameData 
    dw GameState_2C_TransitionFromDemo 

GameState_1D_DebugGameOverMenu:
    JSL.L Debug_GameOverMenu 
    RTS 


GameState_1A_GameOverScreen:
    JSL.L GameOverMenu 
    RTS 


GameState_4_FileSelectMenus:
    JSL.L FileSelectMenu 
    RTS 


GameState_5_FileSelectMap:
    JSL.L FileSelectMap 
    RTS 


HandleSounds:
    PHP 
    SEP #$30 
    LDA.W $0686 
    DEC A 
    BPL .downtime 
    LDY.B #$00 

.loop:
    PHY 
    LDA.W $0649,Y 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    PLY 
    INY 
    CPY.B #$03 
    BCC .loop 
    PLP 
    RTL 


.downtime:
    STA.W $0686 
    STZ.W $2141 
    STZ.W $064D 
    STZ.W $2142 
    STZ.W $064E 
    STZ.W $2143 
    STZ.W $064F 
    PLP 
    RTL 


.pointers:
    dw SoundState_0_SendAPUSoundRequestFromQueue 
    dw SoundState_1_WaitForAPUSoundRequestAcknowledgement 
    dw SoundState_2_ClearSoundRequest 
    dw SoudnState_3_WaitForAPUClearRequestAcknowledgement 
    dw SoundState_4_ResetSoundState 

SoundState_0_SendAPUSoundRequestFromQueue:
    TYX 
    LDA.W $0643,X : CMP.W $0646,X : BEQ .return 
    LDA.L .data,X : CLC : ADC.W $0643,X : TAY 
    LDA.W $0656,Y : STA.W $2141,X 
    STA.W $064D,X 
    INY 
    TYA 
    AND.B #$0F 
    STA.W $0643,X 
    INC.W $0649,X 

.return:
    RTS 


.data:
    db $00,$10,$20 

SoundState_1_WaitForAPUSoundRequestAcknowledgement:
    TYX 
    LDA.W $064D,X : CMP.W $2141,X : BEQ .incState 
    STA.W $2141,X 
    BRA .return 


.incState:
    INC.W $0649,X 
    LDA.B #$02 : STA.W $0650,X 

.return:
    RTS 


SoundState_2_ClearSoundRequest:
    TYX 
    DEC.W $0650,X 
    BNE .return 
    STZ.W $2141,X 
    STZ.W $064D,X 
    INC.W $0649,X 

.return:
    RTS 


SoudnState_3_WaitForAPUClearRequestAcknowledgement:
    TYX 
    LDA.W $064D,X : CMP.W $2141,X : BEQ .state0 
    STA.W $2141,X 
    BRA .return 


.state0:
    STZ.W $0649,X 
    BRA SoundState_0_SendAPUSoundRequestFromQueue 


.return:
    RTS 


SoundState_4_ResetSoundState:
    TYX 
    DEC.W $0650,X 
    BNE .return 
    STZ.W $0649,X 

.return:
    RTS 


ResetSoundQueues:
    PHP 
    REP #$20 
    STZ.W $0643 
    STZ.W $0645 
    STZ.W $0647 
    STZ.W $0649 
    SEP #$20 
    STZ.W $064B 
    PLP 
    RTL 


ShowSpareCPUDebug_UpdatePrevCtrl1Input:
    PHP 
    REP #$30 
    LDA.W $05C5 : AND.W #$4000 
    BEQ + 
    LDA.W $0DF4 : BNE .clearFlag 
    LDA.W #$0001 : STA.W $0DF4 
    BRA + 


.clearFlag:
    STZ.W $0DF4 

  + LDA.W $0DF4 : BEQ .return 
    SEP #$20 
    LDA.B $51 : AND.B #$F0 
    ORA.B #$05 
    STA.W $2100 
    REP #$20 

.return:
    LDA.B $8B : STA.W $0DFE 
    PLP 
    RTL 


GameState_0_ResetStart:
    STZ.W $0DF8 
    STZ.W $0DFA 
    STZ.W $0DFC 
    LDA.W #CinematicFunction_LoadTitleSequence : STA.W $1F51 
    STZ.W $1F55 
    LDA.W $1F59 : CMP.W #$0004 : BNE .return 
    LDA.W #$0003 : STA.W $1F55 

.return:
    INC.W $0998 
    RTS 


GameState_1_TitleSequence:
    JSL.L GameState1_TitleSequence 
    RTS 


GameState_3_Nothing:
    RTS 


GameState_1E_22_25_Intro_CeresGoesBoom_SamusGoesToZebes:
    JSL.L GameState_1E_22_25_Intro_CeresGoesBoom_SamusGoesToZebes_8B 
    RTS 


GameState_27_EndingAndCredits:
    JSL.L GameState27_EndingAndCredits 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_IncrementGameState_828B18:
    PHP 
    REP #$30 
    INC.W $0998 
    PLP 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


GameState_7_MainGameplayFadingIn:
    PHP 
    REP #$30 
    JSR.W GameState_8_MainGameplay 
    JSL.L HandleFadingIn 
    SEP #$20 
    LDA.B $51 : CMP.B #$0F : BNE .return 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    INC.W $0998 

.return:
    PLP 
    RTS 


UNUSED_GameState_1C_828B3F:
    JSL.L UNUSED_GameState1C_91D4DA 
    RTS 


GameState_8_MainGameplay:
    PHP 
    REP #$30 
    JSL.L Determine_Which_Enemies_to_Process 
    JSL.L DebugHandler 
    AND.W #$FFFF 
    BNE .skipProcessing 
    JSL.L PaletteFXObject_Handler 
    JSL.L SamusCurrentStateHandler 
    LDA.W $0E12 : BNE + 
    JSL.L Samus_Projectiles_Interaction_Handling 

  + JSL.L Main_Enemy_Routine 
    JSL.L SamusNewStateHandler 
    JSL.L Enemy_Projectile_Handler 
    JSL.L PLM_Handler 
    JSL.L AnimatedTilesObject_Handler 
    LDA.W $0E12 : BNE + 
    JSL.L EnemyProjectile_Samus_Collision_Handling 
    JSL.L Projectile_vs_Projectile_Collision_Handling 
    JSL.L Process_Enemy_PowerBomb_Interaction 

  + JSL.L Main_Scrolling_Routine 
    LDA.L DebugConst_DebugScrolling : BEQ + 
    JSL.L Debug_Layer1Position_Saving_Loading 

  + JSL.L Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles 
    JSL.L Handle_Queuing_Enemy_BG2_Tilemap_VRAM_Transfer 

.skipProcessing:
    JSL.L HandleHUDTilemap_PausedAndRunning 
    JSL.L Calc_Layer2Position_BGScrolls_UpdateBGGraphics_WhenScrolling 
    JSL.L Execute_Room_Main_ASM 
    JSR.W HandleSamusRunningOutOfEnergy_and_IncrementGameTime 
    JSL.L Handle_Room_Shaking 
    JSL.L DecrementSamusHurtTimers_ClearActiveEnemyIndicesLists 
    PLP 
    RTS 


Delete_GameOptionsMenu_Objects:
    PHP 
    REP #$30 
    LDX.W #$000E 

.loop:
    STZ.W $1A9D,X 
    STZ.W $1AFD,X 
    DEX #2
    BPL .loop 
    PLP 
    RTS 


Spawn_GameOptionsMenu_Object:
    PHP 
    REP #$30 
    PHX 
    STA.W $1A93 
    TYX 
    LDY.W #$000E 

.loop:
    LDA.W $1AFD,Y : BEQ .instruction 
    DEY #2
    BPL .loop 
    PLX : PLP 
    SEC 
    RTS 


.instruction:
    REP #$30 
    LDA.W $0002,X : STA.W $1B0D,Y 
    LDA.W $0004,X : STA.W $1AFD,Y 
    LDA.W #$0001 : STA.W $1B1D,Y 
    LDA.W #$0000 : STA.W $1A9D,Y 
    LDA.W #$0000 : STA.W $1B2D,Y 
    STA.W $1ADD,Y 
    STA.W $1AED,Y 
    JSR.W ($0000,X) 
    PLX : PLP 
    CLC 
    RTS 


RTS_828C10:
    RTS 


GameOptionsMenu_ObjectHandler:
    PHP 
    REP #$30 
    LDX.W #$000E 

.loop:
    STX.W $1A8F 
    LDA.W $1AFD,X : BEQ .next 
    JSR.W Process_GameOptionsMenu_Object 
    LDX.W $1A8F 

.next:
    DEX #2
    BPL .loop 
    PLP 
    RTS 


Process_GameOptionsMenu_Object:
    JSR.W ($1B0D,X) 
    LDX.W $1A8F 
    DEC.W $1B1D,X 
    BNE .return 
    LDY.W $1AFD,X 

.returnPEA:
    LDA.W $0000,Y : BPL .instruction 
    STA.B $12 
    INY #2
    PEA.W .returnPEA-1 
    JMP.W ($0012) 


.instruction:
    STA.W $1B1D,X 
    LDA.W $0002,Y : STA.W $1A9D,X 
    TYA 
    CLC : ADC.W #$0004 : STA.W $1AFD,X 

.return:
    RTS 


Instruction_GameOptionsMenu_Delete:
    REP #$30 
    STZ.W $1A9D,X 
    STZ.W $1AFD,X 
    PLA 
    RTS 


Instruction_GameOptionsMenu_Sleep:
    REP #$30 
    DEY #2
    TYA 
    STA.W $1AFD,X 
    PLA 
    RTS 


Instruction_GameOptionsMenu_PreInstruction_inY:
    REP #$30 
    LDA.W $0000,Y : STA.W $1B0D,X 
    INY #2
    RTS 


Instruction_GameOptionsMenu_ClearPreInstruction:
    REP #$30 
    LDA.W #.RTS : STA.W $1B0D,X 

.RTS:
    RTS 


Instruction_GameOptionsMenu_GotoY:
    REP #$30 
    LDA.W $0000,Y 
    TAY 
    RTS 


Instruction_GameOptionsMenu_DecTimer_and_GotoY_if_NonZero:
    REP #$30 
    DEC.W $1B2D,X 
    BNE Instruction_GameOptionsMenu_GotoY 
    INY #2
    RTS 


Instruction_GameOptionsMenu_TimerInY:
    REP #$30 
    LDA.W $0000,Y : STA.W $1B2D,X 
    INY #2
    RTS 


REP30RTS_828C9E:
    REP #$30 
    RTS 


Draw_GameOptionsMenu_Spritemaps:
    PHP 
    REP #$30 
    PHB 
    LDX.W #$000E 

.loop:
    LDA.W $1A9D,X : BEQ .next 
    PEA.W $8200 
    PLB : PLB 
    LDY.W $1A9D,X 
    LDA.W $1ACD,X : STA.B $16 
    LDA.W $1AAD,X : STA.B $14 
    LDA.W $1ABD,X : STA.B $12 
    JSL.L AddSpritemapToOAM 

.next:
    DEX #2
    BPL .loop 
    PLB : PLP 
    RTS 


GameState_C_Pausing_NormalGameplayDarkening:
    PHP 
    REP #$30 
    JSR.W GameState_8_MainGameplay 
    JSL.L HandleFadingOut 
    LDA.B $51 : AND.W #$000F 
    BNE .return 
    JSL.L EnableNMI 
    STZ.W $0723 
    STZ.W $0725 
    INC.W $0998 

.return:
    PLP 
    RTS 


GameState_D_Pausing_LoadingPauseScreen:
    PHP 
    REP #$30 
    PHB : PHK : PLB 
    JSL.L Disable_HDMAObjects 
    SEP #$20 
    LDA.B #$00 : STA.B $85 
    STA.W $420C 
    REP #$20 
    JSL.L Disable_AnimatedTilesObjects 
    JSR.W Backup_BG2Tilemap_for_PauseMenu 
    PHP : PHB : PHK : PEA.W .returnPEA-1 
    JML.W [$0601] 


.returnPEA:
    PLB : PLP 
    JSL.L Cancel_Sound_Effects 
    JSR.W Backup_SomeGraphicsState_for_PauseScreen 
    JSL.L LoadPauseMenuTiles_ClearBG2Tilemap 
    JSL.L LoadPauseScreen_BaseTilemaps 
    JSL.L Load_PauseMenuMapTilemap_and_AreaLabel 
    JSR.W BackupGameplayPalettes_LoadPauseScreenPalettes 
    JSR.W ContinueInitializingPauseMenu 
    LDA.W #$0001 : STA.W $0723 
    STA.W $0725 
    STZ.W $074D 
    LDA.W #$0001 : STA.W $073B 
    STZ.W $05FD 
    STZ.W $05FF 
    JSL.L QueueClearingOfFXTilemap 
    INC.W $0998 
    PLB : PLP 
    RTS 


Backup_BG2Tilemap_for_PauseMenu:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.W $2116 
    LDA.B $59 : AND.B #$FC : STA.W $2117 
    LDA.B #$81 : STA.W $4310 
    LDA.B #$39 : STA.W $4311 
    LDA.B #$5C : STA.W $4312 
    LDA.B #$DF : STA.W $4313 
    LDA.B #$7E : STA.W $4314 
    LDA.B #$00 : STA.W $4315 
    LDA.B #$10 : STA.W $4316 
    STZ.W $4317 
    STZ.W $4318 
    STZ.W $4319 
    STZ.W $431A 
    LDA.B #$02 : STA.W $420B 
    PLP 
    RTS 


Restore_BG2Tilemap_from_PauseMenu:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.W $2116 
    LDA.B $59 : AND.B #$FC : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7EDF5C 
    dw $1000 
    LDA.B #$02 : STA.W $420B 
    PLP 
    RTS 


Backup_SomeGraphicsState_for_PauseScreen:
    PHP 
    SEP #$20 
    LDA.B $58 : STA.W $0765 
    LDA.B $59 : STA.W $0766 
    LDA.B $5A : STA.W $0767 
    LDA.B $5D : STA.W $0768 
    LDA.B $5E : STA.W $0769 
    LDA.B $52 : STA.W $076A 
    LDA.B $B1 : STA.W $076B 
    LDA.B $B5 : STA.W $076C 
    LDA.B $B9 : STA.W $076D 
    LDA.B $B3 : STA.W $076E 
    LDA.B $B7 : STA.W $076F 
    LDA.B $BB : STA.W $0770 
    LDA.B $55 : STA.W $0771 
    LDA.W $091B : STA.W $0772 
    LDA.W $091C : STA.W $0773 
    LDA.B $57 : STA.W $0774 
    LDA.B $71 : STA.W $0775 
    PLP 
    RTS 


Restore_SomeGraphicsState_from_PauseScreen:
    PHP 
    SEP #$20 
    LDA.W $0772 : STA.W $091B 
    LDA.W $0773 : STA.W $091C 
    LDA.W $0771 : STA.B $55 
    LDA.W $0770 : STA.B $BB 
    LDA.W $076F : STA.B $B7 
    LDA.W $076E : STA.B $B3 
    LDA.W $076D : STA.B $B9 
    LDA.W $076C : STA.B $B5 
    LDA.W $076B : STA.B $B1 
    LDA.W $076A : STA.B $52 
    LDA.W $0769 : STA.B $5E 
    LDA.W $0768 : STA.B $5D 
    LDA.W $0767 : STA.B $5A 
    LDA.W $0766 : STA.B $59 
    LDA.W $0765 : STA.B $58 
    LDA.W $0774 : STA.B $57 
    LDA.W $0775 : STA.B $71 
    PLP 
    RTS 


LoadPauseMenuTiles_ClearBG2Tilemap:
    PHP 
    SEP #$30 
    LDA.B #$00 : STA.W $2116 
    LDA.B #$00 : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl Tiles_PauseScreen_BG1_BG2 
    dw $4000 
    LDA.B #$02 : STA.W $420B 
    LDA.B #$00 : STA.W $2116 
    LDA.B #$20 : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl Tiles_Menu_PauseScreen_Sprites 
    dw $2000 
    LDA.B #$02 : STA.W $420B 
    LDA.B #$00 : STA.W $2116 
    LDA.B #$40 : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl Tiles_Standard_BG3 
    dw $2000 
    LDA.B #$02 : STA.W $420B 
    PLP 
    RTL 


LoadPauseScreen_BaseTilemaps:
    PHP 
    SEP #$30 
    LDA.B #$00 : STA.W $2116 
    LDA.B #$38 : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl Tilemap_BG2PauseScreen_BG2RoomSelectMap_0 
    dw $0800 
    LDA.B #$02 : STA.W $420B 
    LDA.B #$00 : STA.W $2181 
    LDA.B #$34 : STA.W $2182 
    LDA.B #$7E : STA.W $2183 
    JSL.L SetupHDMATransfer 
    db $01,$00,$80 
    dl Tilemap_BG2PauseScreen_BG2RoomSelectMap_1 
    dw $0400 
    LDA.B #$02 : STA.W $420B 
    LDA.B #$00 : STA.W $2181 
    LDA.B #$38 : STA.W $2182 
    LDA.B #$7E : STA.W $2183 
    JSL.L SetupHDMATransfer 
    db $01,$00,$80 
    dl Tilemap_EquipmentScreen 
    dw $0800 
    LDA.B #$02 : STA.W $420B 
    REP #$30 
    LDY.W #Dummy_Samus_Wireframe_Tilemap 
    LDX.W #$01D8 
    LDA.W #$0011 : STA.B $14 

.loopRows:
    LDA.W #$0008 : STA.B $12 

.loopColumns:
    LDA.W $0000,Y : STA.L $7E3000,X 
    INX #2
    INY #2
    DEC.B $12 
    BNE .loopColumns 
    TXA 
    CLC : ADC.W #$0010 : TAX 
    DEC.B $14 
    BNE .loopRows 
    JSR.W EquipmentScreen_WriteSamusWireframeTilemap 
    JSR.W Load_EquipmentScreen_ReserveHealth_Tilemap 
    PLP 
    RTL 


Load_EquipmentScreen_ReserveHealth_Tilemap:
    PHP 
    REP #$30 
    LDA.W $09D4 : BEQ .return 
    LDA.W $09D6 : STA.W $4204 
    SEP #$20 
    LDA.B #$64 : STA.W $4206 
    NOP #9
    LDA.W $4214 : STA.B $2A 
    LDA.W $4215 : STA.B $2B 
    LDA.W $4216 : STA.W $4204 
    LDA.W $4217 : STA.W $4205 
    LDA.B #$0A : STA.W $4206 
    REP #$20 
    NOP #7
    LDA.W $4216 : CLC : ADC.W #$0804 : STA.L $7E3B14 
    LDA.W $4214 : CLC : ADC.W #$0804 : STA.L $7E3B12 
    LDA.B $2A : CLC : ADC.W #$0804 : STA.L $7E3B10 

.return:
    PLP 
    RTS 


BackupGameplayPalettes_LoadPauseScreenPalettes:
    PHP 
    SEP #$30 
    PHP 
    REP #$30 
    LDY.W #$0200 
    LDX.W #$0000 

.loopBackupGameplay:
    LDA.L $7EC000,X : STA.L $7E3300,X 
    INX #2
    DEY #2
    BNE .loopBackupGameplay 
    PLP : PHP 
    REP #$30 
    LDY.W #$0200 
    LDX.W #$0000 

.loopLoadPause:
    LDA.L Palettes_PauseScreen,X : STA.L $7EC000,X 
    INX #2
    DEY #2
    BNE .loopLoadPause 
    PLP : PLP 
    RTS 


ContinueInitializingPauseMenu:
    PHP : PHB : PHK : PLB 
    JSR.W SetupPPUForPauseMenu 
    JSR.W ResetPauseMenuAnimations 
    JSR.W Load_EquipmentScreen_EquipmentTilemaps 
    JSR.W Set_PauseScreen_ButtonLabelPalettes_MapScreen 
    JSR.W Update_PauseMenu_L_R_Start_VRAMTilemap 
    JSR.W DetermineMapScrollLimits 
    LDA.W #$0080 : JSR.W SetupMapScrollingForPauseMenu 
    PLB : PLP 
    RTS 


Setup_MapScrolling_for_FileSelectMap:
    JSR.W ResetPauseMenuAnimations 
    JSR.W DetermineMapScrollLimits 
    LDA.W $05AE : SEC : SBC.W $05AC : LSR A 
    CLC : ADC.W $05AC : SEC : SBC.W #$0080 : STA.B $B1 
    LDA.W $0AF6 : AND.W #$FF00 
    XBA 
    CLC : ADC.W $07A1 : ASL #3
    SEC : SBC.B $B1 : STA.B $12 
    LDA.W #$00E0 : SEC : SBC.B $12 : BPL .Xscroll 
    STA.B $12 
    LDA.B $B1 : SEC : SBC.B $12 : STA.B $B1 
    BRA .Yscroll 


.Xscroll:
    LDA.W #$0020 : SEC : SBC.B $12 : STA.B $12 
    BMI .Yscroll 
    LDA.B $B1 : SEC : SBC.B $12 : STA.B $B1 

.Yscroll:
    LDA.W $05B2 : SEC : SBC.W $05B0 : LSR A 
    CLC : ADC.W #$0010 : CLC : ADC.W $05B0 : STA.B $12 
    LDA.W #$0070 : SEC : SBC.B $12 : AND.W #$FFF8 
    EOR.W #$FFFF 
    INC A 
    STA.B $B3 
    LDA.W $0AFA 
    XBA 
    AND.W #$00FF 
    CLC : ADC.W $07A3 : INC A 
    ASL #3
    SEC : SBC.B $B3 : STA.B $12 
    LDA.W #$0040 : SEC : SBC.B $12 : BMI .return 
    STA.B $12 
    LDA.B $B3 : SEC : SBC.B $12 : STA.B $B3 
    CMP.W #$FFD8 : BPL .return 
    LDA.W #$FFD8 : STA.B $B3 

.return:
    RTL 


GameState_E_Paused_LoadingPauseScreen:
    PHP 
    REP #$30 
    JSL.L Draw_PauseMenu_during_FadeIn 
    JSL.L HandleFadingIn 
    SEP #$20 
    LDA.B $51 : CMP.B #$0F : BNE .return 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    INC.W $0998 

.return:
    PLP 
    RTS 


GameState_F_Paused_MapAndItemScreens:
    PHB : PHK : PLB 
    LDA.W #$0003 : JSL.L UpdateHeldInput 
    JSL.L MainPauseRoutine 
    JSL.L HandleHUDTilemap_PausedAndRunning 
    JSR.W Handle_PauseScreen_PaletteAnimation 
    PLB 
    RTS 


MainPauseRoutine:
    PHP : PHB : PHK : PLB 
    REP #$30 
    LDA.W $0727 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    PLB : PLP 
    RTL 


.pointers:
    dw PauseMenu_0_MapScreen 
    dw PauseScreen_1_EquipmentScreen 
    dw PauseMenu_2_MapScreenToEquipmentScreen_FadingOut 
    dw PauseMenu_3_MapScreenToEquipmentScreen_LoadEquipmentScreen 
    dw PauseMenu_4_MapScreenToEquipmentScreen_FadingIn 
    dw PauseMenu_5_EquipmentScreenToMapScreen_FadingOut 
    dw PauseMenu_6_EquipmentScreenToMapScreen_LoadMapScreen 
    dw PauseMenu_7_EquipmentScreenToMapScreen_FadingIn 

PauseMenu_0_MapScreen:
    REP #$30 
    JSR.W Handle_PauseScreen_L_R 
    JSR.W Handle_PauseScreen_StartButton 
    JSL.L Handle_MapScrollArrows 
    JSL.L MapScrolling 
    JSR.W MapScreen_DrawSamusPositionIndicator 
    JSL.L Draw_Map_Icons 
    JSL.L Display_Map_Elevator_Destinations 
    LDA.W #$0000 : STA.W $0763 
    RTS 


PauseScreen_1_EquipmentScreen:
    STZ.B $B1 
    STZ.B $B3 
    JSR.W EquipmentScreen_Main 
    JSR.W Handle_PauseScreen_L_R 
    JSR.W Handle_PauseScreen_StartButton 
    LDA.W #$0001 : STA.W $0763 
    RTS 


PauseMenu_2_MapScreenToEquipmentScreen_FadingOut:
    JSL.L Display_Map_Elevator_Destinations 
    JSR.W MapScreen_DrawSamusPositionIndicator 
    JSL.L Draw_Map_Icons 
    JSR.W Handle_PauseMenu_L_R_PressedHighlight 
    LDA.W #$0000 : STA.W $0763 
    JSL.L HandleFadingOut 
    SEP #$20 
    LDA.B $51 : CMP.B #$80 : BNE .return 
    JSL.L EnableNMI 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    INC.W $0727 

.return:
    RTS 


PauseMenu_5_EquipmentScreenToMapScreen_FadingOut:
    JSR.W EquipmentScreen_DrawItemSelector 
    JSR.W EquipmentScreen_DisplayReserveTankAmount_shell 
    JSR.W Handle_PauseMenu_L_R_PressedHighlight 
    JSL.L HandleFadingOut 
    SEP #$20 
    LDA.B $51 : CMP.B #$80 : BNE .return 
    JSL.L EnableNMI 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    INC.W $0727 

.return:
    RTS 


PauseMenu_3_MapScreenToEquipmentScreen_LoadEquipmentScreen:
    REP #$30 
    JSL.L Display_Map_Elevator_Destinations 
    JSR.W EquipmentScreen_SetupReserveMode_and_DetermineInitialSelect 
    JSL.L EquipmentScreen_TransferBG1Tilemap 
    LDA.W #$0001 : STA.W $0763 
    JSR.W Set_PauseScreen_ButtonLabelPalettes 
    STZ.W $073F 
    LDA.W L_R_HighlightAnimationData_PauseScreenPaletteAnimationDelays : STA.W $072B 
    LDA.W #$0001 : STA.W $0723 
    STA.W $0725 
    INC.W $0727 
    RTS 


PauseMenu_6_EquipmentScreenToMapScreen_LoadMapScreen:
    REP #$30 
    JSL.L Display_Map_Elevator_Destinations 
    JSL.L Load_PauseMenuMapTilemap_and_AreaLabel 
    JSR.W Set_PauseScreen_ButtonLabelPalettes 
    STZ.W $073F 
    LDA.W L_R_HighlightAnimationData_PauseScreenPaletteAnimationDelays : STA.W $072B 
    LDA.W #$0001 : STA.W $0723 
    STA.W $0725 
    LDA.W #$0000 : STA.W $0763 
    INC.W $0727 
    RTS 


PauseMenu_7_EquipmentScreenToMapScreen_FadingIn:
    JSR.W MapScreen_DrawSamusPositionIndicator 
    JSL.L Draw_Map_Icons 
    JSL.L Display_Map_Elevator_Destinations 
    LDA.W #$0000 : STA.W $0763 
    JSL.L HandleFadingIn 
    SEP #$20 
    LDA.B $51 : CMP.B #$0F : BNE .return 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    LDA.W $0753 : BEQ + 
    LDA.W #$0001 

  + STA.W $0727 

.return:
    RTS 


PauseMenu_4_MapScreenToEquipmentScreen_FadingIn:
    JSR.W EquipmentScreen_DrawItemSelector 
    JSR.W EquipmentScreen_DisplayReserveTankAmount_shell 
    LDA.W #$0001 : STA.W $0763 
    JSL.L HandleFadingIn 
    SEP #$20 
    LDA.B $51 : CMP.B #$0F : BNE .return 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    LDA.W $0753 : BEQ + 
    LDA.W #$0001 

  + STA.W $0727 

.return:
    RTS 


MapScrolling:
    PHP : PHB : PHK : PLB 
    REP #$30 
    LDA.W $05FD 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    PLB : PLP 
    RTL 


.pointers:
    dw MapScrolling_None 
    dw MapScrolling_Left 
    dw MapScrolling_Right 
    dw MapScrolling_Up 
    dw MapScrolling_Down 

MapScrolling_None:
    LDA.W #$0004 : STA.W $05FB 
    RTS 


GetMapScrollSpeedIndexInX:
    LDX.W $05FF 
    LDA.W $05FB : BNE .return 
    TXA 
    CLC : ADC.W #$0020 : TAX 

.return:
    RTS 


MapScrolling_Left:
    JSR.W GetMapScrollSpeedIndexInX 
    LDA.B $B1 : SEC : SBC.W MapScrolling_SpeedTable,X : STA.B $B1 

MapScrolling_Common:
    INC.W $05FF 
    INC.W $05FF 
    LDA.W $05FF : AND.W #$000F 
    BNE .return 
    LDA.W #$0036 : JSL.L QueueSound_Lib1_Max6 
    STZ.W $05FD 
    STZ.W $05FF 
    LDA.W $05FB : BEQ .return 
    DEC.W $05FB 

.return:
    RTS 


MapScrolling_Right:
    JSR.W GetMapScrollSpeedIndexInX 
    LDA.W MapScrolling_SpeedTable,X : CLC : ADC.B $B1 : STA.B $B1 
    BRA MapScrolling_Common 


MapScrolling_Up:
    JSR.W GetMapScrollSpeedIndexInX 
    LDA.B $B3 : SEC : SBC.W MapScrolling_SpeedTable,X : STA.B $B3 
    BRA MapScrolling_Common 


MapScrolling_Down:
    JSR.W GetMapScrollSpeedIndexInX 
    LDA.W MapScrolling_SpeedTable,X : CLC : ADC.B $B3 : STA.B $B3 
    BRA MapScrolling_Common 


MapScrolling_SpeedTable:
    dw $0000,$0000,$0000,$0008,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0008,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 

GameState_10_Unpausing_LoadingNormalGameplay:
    PHP 
    REP #$30 
    JSL.L Handle_PauseMenu_StartPressedHighlight 
    JSR.W Draw_PauseMenu_During_FadeOut 
    JSL.L HandleFadingOut 
    SEP #$20 
    LDA.B $51 : CMP.B #$80 : BNE .return 
    JSL.L EnableNMI 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    INC.W $0998 

.return:
    PLP 
    RTS 


Draw_PauseMenu_During_FadeOut:
    LDA.W $0763 : CMP.W #$0001 : BEQ .equipScreen 
    JSL.L Display_Map_Elevator_Destinations 
    JSL.L Draw_Map_Icons 
    JMP.W MapScreen_DrawSamusPositionIndicator 


.equipScreen:
    JSR.W EquipmentScreen_DrawItemSelector 
    JSR.W EquipmentScreen_DisplayReserveTankAmount_shell 
    JMP.W Handle_PauseMenu_L_R_PressedHighlight 


GameState_11_Unpausing_LoadingNormalGameplay:
    PHP 
    REP #$30 
    JSR.W Clear_Samus_Beam_Tiles 
    JSR.W ContinueInitialising_GameplayResume 
    JSL.L ResumeGameplay 
    JSR.W Restore_SomeGraphicsState_from_PauseScreen 
    JSR.W Restore_BG2Tilemap_from_PauseMenu 
    REP #$30 
    LDA.W #$0001 : STA.W $0723 
    STA.W $0725 
    PHP : PHB : PHK : PEA.W .returnPEA-1 
    JML.W [$0604] ; Execute unpause hook


.returnPEA:
    JSL.L Enable_HDMAObjects 
    JSL.L Enable_AnimatedTilesObjects 
    JSL.L Queue_Samus_Movement_SoundEffects 
    PLB : PLP 
    INC.W $0998 
    PLP 
    RTS 


GameState_12_Unpausing_NormalGameplayBrightening:
    PHP 
    REP #$30 
    JSR.W GameState_8_MainGameplay 
    JSL.L HandleFadingIn 
    SEP #$20 
    LDA.B $51 : CMP.B #$0F : BNE .return 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    LDA.W #$0008 : STA.W $0998 

.return:
    PLP 
    RTS 


Load_PauseMenuMapTilemap_and_AreaLabel:
    PHP : PHB : PHK : PLB 
    REP #$30 
    LDA.B $BD : STA.B $B1 
    LDA.B $BF : STA.B $B3 
    SEP #$30 
    LDA.B #$00 : STA.W $2116 
    LDA.B #$30 : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSR.W LoadPauseMenuMapTilemap 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7E4000 
    dw $1000 
    LDA.B #$02 : STA.W $420B 
    LDA.B #$AA : STA.W $2116 
    LDA.B #$38 : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    LDA.B #$01 : STA.W $4310 
    LDA.B #$18 : STA.W $4311 
    LDA.B #$18 : STA.W $4315 
    LDA.B #$00 : STA.W $4316 
    REP #$30 
    LDA.W $079F : CMP.W #$0007 : BMI + 
    LDA.W #$0000 

  + ASL A 
    TAX 
    LDA.W AreaLabelTilemaps_pointers,X : STA.W $4312 
    SEP #$20 
    LDA.B #$82 : STA.W $4314 
    LDA.B #$02 : STA.W $420B 
    PLB : PLP 
    RTL 


LoadPauseMenuMapTilemap:
    PHP 
    REP #$30 
    LDA.W $079F : CMP.W #$0007 : BMI + 
    LDA.W #$0000 

  + STA.B $12 
    ASL A 
    CLC : ADC.B $12 : TAX 
    LDA.W AreaMapPointers,X : STA.B $00 
    LDA.W AreaMapPointers+2,X : STA.B $02 
    LDA.W #$4000 : STA.B $03 
    LDA.W #$007E : STA.B $05 
    LDA.B $12 
    ASL A 
    TAX 
    LDA.W #$0082 : STA.B $08 
    LDA.L MapData_pointers,X : STA.B $06 
    LDX.W $079F 
    LDA.L $7ED908,X : AND.W #$00FF 
    BNE .mapCollected 
    SEP #$20 
    LDY.W #$0000 
    LDX.W #$0000 
    STZ.B $12 
    CLC 

.loopWithoutMapData:
    ROL.W $07F7,X 
    BCS .exploredMapTile 
    REP #$20 
    LDA.W #$001F : STA.B [$03],Y 

.nextWithoutMapData:
    SEP #$20 
    INY #2
    INC.B $12 
    LDA.B $12 : CMP.B #$08 : BMI .loopWithoutMapData 
    STZ.B $12 
    INX 
    CPX.W #$0100 
    BMI .loopWithoutMapData 
    PLP 
    RTS 


.exploredMapTile:
    INC.W $07F7,X 
    REP #$30 
    LDA.B [$00],Y : AND.W #$FBFF : STA.B [$03],Y 
    BRA .nextWithoutMapData 


.mapCollected:
    REP #$30 
    LDA.B [$06] 
    XBA 
    STA.B $26 
    INC.B $06 
    INC.B $06 
    LDA.W #$0000 : STA.B $0B 
    LDA.W #$07F7 : STA.B $09 
    LDA.B [$09] 
    XBA 
    STA.B $28 
    INC.B $09 
    INC.B $09 
    LDY.W #$0000 
    LDX.W #$0010 

.loopWithMapData:
    LDA.B [$00],Y 
    ASL.B $28 
    BCC + 
    AND.W #$FBFF 
    ASL.B $26 
    BRA .decX 


  + ASL.B $26 
    BCS .decX 
    LDA.W #$001F 

.decX:
    STA.B [$03],Y 
    DEX 
    BNE .next 
    LDX.W #$0010 
    LDA.B [$06] 
    XBA 
    STA.B $26 
    INC.B $06 
    INC.B $06 
    LDA.B [$09] 
    XBA 
    STA.B $28 
    INC.B $09 
    INC.B $09 

.next:
    INY #2
    CPY.W #$1000 
    BMI .loopWithMapData 
    PLP 
    RTS 


DrawRoomSelectMap:
    SEP #$30 
    LDA.B #$33 : STA.B $5D 
    LDA.B #$13 : STA.B $69 
    LDA.B #$D8 : STA.B $B3 
    LDA.B #$FF : STA.B $B4 
    REP #$30 
    PHK : PLB 
    LDA.W $079F : CMP.W #$0007 : BMI + 
    LDA.W #$0000 

  + STA.B $12 
    ASL A 
    CLC : ADC.B $12 : TAX 
    LDA.W AreaMapPointers,X : STA.B $00 
    LDA.W AreaMapPointers+2,X : STA.B $02 
    LDA.W #$3000 : STA.B $03 
    LDA.W #$007E : STA.B $05 
    LDA.B $12 
    ASL A 
    TAX 
    LDA.W #$0082 : STA.B $08 
    LDA.L MapData_pointers,X : STA.B $06 
    LDX.W $079F 
    LDA.L $7ED908,X : AND.W #$00FF 
    BNE .mapCollected 
    SEP #$20 
    LDY.W #$0000 
    LDX.W #$0000 
    STZ.B $12 
    CLC 

.loopWithoutMapData:
    ROL.W $07F7,X 
    BCS .exploredMapTile 
    REP #$20 
    LDA.W #$000F : STA.B [$03],Y 

.nextWithoutMapData:
    SEP #$20 
    INY #2
    INC.B $12 
    LDA.B $12 : CMP.B #$08 : BMI .loopWithoutMapData 
    STZ.B $12 
    INX 
    CPX.W #$0100 
    BMI .loopWithoutMapData 
    JMP.W .return 


.exploredMapTile:
    INC.W $07F7,X 
    REP #$30 
    LDA.B [$00],Y : AND.W #$FBFF : STA.B [$03],Y 
    BRA .nextWithoutMapData 


.mapCollected:
    REP #$30 
    LDA.B [$06] 
    XBA 
    STA.B $26 
    INC.B $06 
    INC.B $06 
    LDA.W #$0000 : STA.B $0B 
    LDA.W #$07F7 : STA.B $09 
    LDA.B [$09] 
    XBA 
    STA.B $28 
    INC.B $09 
    INC.B $09 
    LDY.W #$0000 
    LDX.W #$0010 

.loopWithMapData:
    LDA.B [$00],Y 
    ASL.B $28 
    BCC + 
    AND.W #$FBFF 
    ASL.B $26 
    BRA .decX 


  + ASL.B $26 
    BCS .decX 
    LDA.W #$001F 

.decX:
    STA.B [$03],Y 
    DEX 
    BNE .next 
    LDX.W #$0010 
    LDA.B [$06] 
    XBA 
    STA.B $26 
    INC.B $06 
    INC.B $06 
    LDA.B [$09] 
    XBA 
    STA.B $28 
    INC.B $09 
    INC.B $09 

.next:
    INY #2
    CPY.W #$1000 
    BMI .loopWithMapData 

.return:
    REP #$30 
    LDX.W $0330 
    LDA.W #$1000 : STA.B $D0,X 
    LDA.W #$3000 : STA.B $D2,X 
    LDA.W #$007E : STA.B $D4,X 
    LDA.B $58 : AND.W #$00FC 
    XBA 
    STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    RTL 


DrawRoomSelectMap_AreaLabel:
    PHB : PHK : PLB 
    LDA.W $079F 
    ASL A 
    TAX 
    LDA.W AreaLabelTilemaps_pointers,X 
    TAX 
    LDY.W #$0000 

.loop:
    LDA.W $0000,X : AND.W #$EFFF : STA.B [$00],Y 
    INX #2
    INY #2
    CPY.W #$0018 
    BMI .loop 
    PLB 
    RTL 


AreaMapPointers:
    dl MapTilemaps_crateria 
    dl MapTilemaps_brinstar 
    dl MapTilemaps_norfair 
    dl MapTilemaps_wreckedShip 
    dl MapTilemaps_maridia 
    dl MapTilemaps_tourian 
    dl UNUSED_MapTilemaps_ceres_B5E000 

AreaLabelTilemaps_pointers:
    dw AreaLabelTilemaps_crateria 
    dw AreaLabelTilemaps_brinstar 
    dw AreaLabelTilemaps_norfair 
    dw AreaLabelTilemaps_wreckedShip 
    dw AreaLabelTilemaps_maridia 
    dw AreaLabelTilemaps_tourianDebug 
    dw AreaLabelTilemaps_ceres 
    dw AreaLabelTilemaps_tourianDebug 

AreaLabelTilemaps_crateria:
    dw $2801,$2801,$3832,$3841,$3830,$3843,$3834,$3841,$3838,$2830,$2801,$2801 

AreaLabelTilemaps_brinstar:
    dw $2801,$2801,$3831,$3841,$3838,$383D,$3842,$3843,$3830,$3841,$2801,$2801 

AreaLabelTilemaps_norfair:
    dw $2801,$2801,$383D,$383E,$3841,$3835,$3830,$3838,$3841,$2801,$2801,$2801 

AreaLabelTilemaps_wreckedShip:
    dw $3846,$3841,$3834,$3832,$383A,$3834,$3833,$2801,$3842,$3837,$3838,$383F 

AreaLabelTilemaps_maridia:
    dw $2801,$2801,$383C,$3830,$3841,$3838,$3833,$3838,$3830,$2801,$2801,$2801 

AreaLabelTilemaps_tourianDebug:
    dw $2801,$2801,$3843,$383E,$3844,$3841,$3838,$3830,$383D,$2801,$2801,$2801 

AreaLabelTilemaps_ceres:
    dw $2801,$2801,$2801,$3832,$383E,$383B,$383E,$383D,$3848,$2801,$2801,$2801 

MapData_pointers:
    dw MapData_crateria 
    dw MapData_brinstar 
    dw MapData_norfair 
    dw MapData_wreckedShip 
    dw MapData_maridia 
    dw MapData_tourianDebug 
    dw MapData_ceres 
    dw MapData_tourianDebug 

MapData_crateria:
    db $00,$00,$00,$00 
    db $00,$00,$00,$7F
    db $00,$00,$00,$7F
    db $00,$00,$00,$7F
    db $00,$00,$00,$7F
    db $00,$01,$FF,$FF
    db $00,$07,$94,$00
    db $00,$1E,$37,$C0
    db $00,$10,$FF,$00
    db $03,$F0,$10,$00
    db $02,$00,$10,$00
    db $02,$00,$10,$00
    db $02,$00,$10,$00
    db $00,$00,$10,$00
    db $00,$00,$10,$00
    db $00,$00,$10,$00
    db $00,$00,$10,$00
    db $00,$00,$10,$00
    db $00,$00,$1F,$00
    db $00,$00,$01,$00
    db $00,$00,$01,$00
    db $00,$00,$01,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $03,$FC,$00,$00
    db                 $03,$FC,$00,$00
    db                 $03,$F0,$00,$00
    db                 $03,$F0,$00,$00
    db                 $FF,$FC,$7F,$80
    db                 $0D,$FC,$7F,$80
    db                 $00,$00,$00,$80
    db                 $20,$00,$00,$80
    db                 $20,$00,$07,$80
    db                 $20,$00,$0F,$80
    db                 $20,$00,$08,$00
    db                 $00,$00,$08,$00
    db                 $00,$00,$08,$00
    db                 $00,$00,$08,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00

MapData_brinstar:
    db $00,$00,$00,$00 
    db $00,$40,$00,$00
    db $00,$40,$02,$00
    db $00,$40,$02,$00
    db $00,$40,$02,$00
    db $07,$FD,$FE,$00
    db $00,$C0,$60,$00
    db $03,$FF,$E0,$00
    db $06,$00,$78,$20
    db $00,$00,$7C,$20
    db $00,$00,$60,$20
    db $00,$00,$7E,$7F
    db $00,$00,$1C,$0C
    db $00,$00,$07,$80
    db $00,$FE,$01,$FF
    db $00,$00,$00,$00
    db $00,$00,$01,$FF
    db $00,$00,$00,$66
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $04,$00,$00,$00
    db                 $04,$00,$00,$00
    db                 $04,$00,$00,$00
    db                 $04,$00,$00,$00
    db                 $1C,$00,$00,$00
    db                 $06,$00,$00,$00
    db                 $7C,$00,$00,$00
    db                 $C0,$00,$00,$00
    db                 $50,$00,$00,$00
    db                 $40,$00,$00,$00
    db                 $C0,$00,$00,$00
    db                 $40,$00,$00,$00
    db                 $C0,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $02,$00,$00,$00
    db                 $3F,$FF,$C1,$80
    db                 $00,$79,$FF,$C0
    db                 $00,$40,$00,$00
    db                 $00,$40,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00

MapData_norfair:
    db $00,$00,$00,$00 
    db $00,$20,$00,$00
    db $1E,$20,$00,$FE
    db $1E,$20,$07,$8F
    db $1F,$FF,$87,$80
    db $3E,$7F,$FF,$FC
    db $20,$FF,$FF,$F8
    db $21,$BE,$1E,$FC
    db $3F,$1F,$13,$04
    db $03,$C1,$93,$FC
    db $00,$FF,$FF,$A0
    db $00,$7F,$F3,$E0
    db $00,$38,$01,$C0
    db $03,$E0,$01,$80
    db $03,$E0,$00,$00
    db $1E,$20,$00,$00
    db $1F,$3E,$00,$00
    db $1F,$A0,$01,$00
    db $0F,$F0,$01,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $FC,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00

MapData_wreckedShip:
    db $00,$00,$00,$00 
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$0F,$FC,$00
    db $00,$0F,$00,$00
    db $00,$3E,$00,$00
    db $00,$20,$80,$00
    db $00,$0F,$C4,$00
    db $00,$00,$FC,$00
    db $00,$00,$80,$00
    db $00,$01,$80,$00
    db $00,$00,$80,$00
    db $00,$07,$F0,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00

MapData_maridia:
    db $00,$00,$00,$00 
    db $00,$00,$00,$78
    db $00,$00,$00,$58
    db $00,$00,$01,$D8
    db $00,$00,$01,$C0
    db $00,$00,$3F,$C0
    db $00,$00,$FD,$FF
    db $00,$00,$31,$DF
    db $00,$02,$21,$FF
    db $00,$02,$2F,$BF
    db $00,$3F,$EF,$C0
    db $00,$3F,$CF,$FC
    db $00,$37,$9F,$C0
    db $00,$37,$B0,$00
    db $00,$37,$B0,$00
    db $00,$37,$B0,$00
    db $00,$3E,$70,$00
    db $00,$3F,$FF,$F0
    db $00,$1F,$C0,$00
    db $00,$7C,$00,$00
    db $00,$18,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $20,$00,$00,$00
    db                 $20,$00,$00,$00
    db                 $20,$00,$00,$00
    db                 $20,$00,$00,$00
    db                 $30,$00,$00,$00
    db                 $E0,$00,$00,$00
    db                 $FF,$E0,$00,$00
    db                 $FF,$E0,$00,$00
    db                 $FE,$00,$00,$00
    db                 $01,$80,$00,$00
    db                 $03,$80,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00

MapData_tourianDebug:
    db $00,$00,$00,$00 
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$08,$00
    db $00,$00,$08,$00
    db $00,$00,$08,$00
    db $00,$00,$08,$00
    db $00,$07,$FC,$00
    db $00,$07,$F8,$00
    db $00,$00,$08,$00
    db $00,$0F,$F8,$00
    db $00,$1F,$C0,$00
    db $00,$00,$C0,$00
    db $00,$07,$C0,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00

MapData_ceres:
    db $00,$00,$00,$00 
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$08,$00,$00
    db $00,$08,$00,$00
    db $00,$08,$00,$00
    db $00,$08,$00,$00
    db $00,$08,$00,$00
    db $00,$0F,$00,$00
    db $00,$01,$F8,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00

SetupMapScrollingForPauseMenu:
    REP #$30 
    STA.B $14 
    LDA.W $05AE : SEC : SBC.W $05AC : LSR A 
    CLC : ADC.W $05AC : SEC : SBC.W #$0080 : STA.B $B1 
    LDA.W $0AF6 : AND.W #$FF00 
    XBA 
    CLC : ADC.W $07A1 : ASL #3
    SEC : SBC.B $B1 : STA.B $12 
    LDA.W #$00E0 : SEC : SBC.B $12 : BPL .Xscroll 
    STA.B $12 
    LDA.B $B1 : SEC : SBC.B $12 : STA.B $B1 
    BRA .Yscroll 


.Xscroll:
    LDA.W #$0020 : SEC : SBC.B $12 : STA.B $12 
    BMI .Yscroll 
    LDA.B $B1 : SEC : SBC.B $12 : STA.B $B1 

.Yscroll:
    LDA.W $05B2 : SEC : SBC.W $05B0 : LSR A 
    CLC : ADC.W #$0010 : CLC : ADC.W $05B0 : STA.B $12 
    LDA.B $14 : SEC : SBC.B $12 : AND.W #$FFF8 
    EOR.W #$FFFF 
    INC A 
    STA.B $B3 
    LDA.W $0AFA 
    XBA 
    AND.W #$00FF 
    CLC : ADC.W $07A3 : INC A 
    ASL #3
    SEC : SBC.B $B3 : STA.B $12 
    LDA.W #$0040 : SEC : SBC.B $12 : BMI .return 
    STA.B $12 
    LDA.B $B3 : SEC : SBC.B $12 : STA.B $B3 
    CMP.W #$FFD8 : BPL .return 
    LDA.W #$FFD8 : STA.B $B3 

.return:
    RTS 


DetermineMapScrollLimits:
    PHP : PHB 
    LDA.W $0789 : BEQ .areaMapNotCollected 
    LDA.W #$0082 : STA.B $08 
    LDA.W #MapData_pointers : STA.B $06 
    LDA.W $079F 
    ASL A 
    TAY 
    LDA.B [$06],Y : STA.B $06 
    BRA + 


.areaMapNotCollected:
    LDA.W #$0000 : STA.B $08 
    LDA.W #$07F7 : STA.B $06 

  + PHK : PLB 
    SEP #$20 
    LDA.B $08 : STA.B $02 
    REP #$20 
    LDA.B $06 : STA.B $00 
    JSR.W DetermineLeftmostMapColumn 
    JSR.W A_equals_X_times_8 
    STA.W $05AC 
    LDA.W $079F : CMP.W #$0004 : BNE + 
    LDA.W $05AC : SEC : SBC.W #$0018 : STA.W $05AC 

  + LDA.B $06 : CLC : ADC.W #$0083 : STA.B $00 
    JSR.W DetermineRightmostMapColumn 
    JSR.W A_equals_X_times_8 
    STA.W $05AE 
    LDA.B $06 : STA.B $00 
    JSR.W DetermineTopmostMapRow 
    JSR.W A_equals_X_times_8 
    STA.W $05B0 
    LDA.B $06 : CLC : ADC.W #$007C : STA.B $00 
    JSR.W DetermineLeftmostMapRow 
    JSR.W A_equals_X_times_8 
    STA.W $05B2 
    PLB : PLP 
    RTS 


A_equals_X_times_8:
    TXA 
    ASL #3
    RTS 


DetermineLeftmostMapColumn:
    PHP 
    SEP #$20 
    LDA.B #$00 
    XBA 
    LDA.B #$00 
    LDX.W #$0000 

.loopColumns:
    TXA 
    AND.B #$07 
    TAY 
    LDA.W .bits,Y : STA.B $12 
    LDY.W #$0000 

.loopRows:
    LDA.B [$00],Y : BIT.B $12 
    BNE .return 
    INY #4
    CPY.W #$0080 
    BMI .loopRows 
    INX 
    CPX.W #$0040 
    BPL .emptyMap 
    TXA 
    AND.B #$07 
    BNE + 
    LDA.B $00 : CLC : ADC.B #$01 : STA.B $00 
    LDA.B $01 : ADC.B #$00 : STA.B $01 

  + CPX.W #$0020 
    BNE .loopColumns 
    LDA.B $00 : CLC : ADC.B #$7B : STA.B $00 
    LDA.B $01 : ADC.B #$00 : STA.B $01 
    BRA .loopColumns 


.emptyMap:
    LDX.W #$001A 

.return:
    PLP 
    RTS 


.bits:
    db $80,$40,$20,$10,$08,$04,$02,$01 

DetermineRightmostMapColumn:
    PHP 
    SEP #$20 
    LDA.B #$00 
    XBA 
    LDA.B #$00 
    LDX.W #$003F 

.loopColumns:
    TXA 
    AND.B #$07 
    TAY 
    LDA.W .bits,Y : STA.B $12 
    LDY.W #$0000 

.loopRows:
    LDA.B [$00],Y : BIT.B $12 
    BNE .return 
    INY #4
    CPY.W #$0080 
    BMI .loopRows 
    DEX 
    BMI .emptyMap 
    TXA 
    AND.B #$07 
    CMP.B #$07 : BNE + 
    LDA.B $00 : SEC : SBC.B #$01 : STA.B $00 
    LDA.B $01 : SBC.B #$00 : STA.B $01 

  + CPX.W #$001F 
    BNE .loopColumns 
    REP #$20 
    LDA.B $00 : SEC : SBC.W #$007C : STA.B $00 
    LDA.W #$0000 
    SEP #$20 
    BRA .loopColumns 


.emptyMap:
    LDX.W #$001C 

.return:
    PLP 
    RTS 


.bits:
    db $80,$40,$20,$10,$08,$04,$02,$01 

DetermineTopmostMapRow:
    PHP 
    REP #$20 
    LDA.B $00 : CLC : ADC.W #$0080 : STA.B $03 
    LDA.W #$0000 
    SEP #$20 
    LDA.B $02 : STA.B $05 
    LDX.W #$0000 
    LDY.W #$0000 

.loop:
    LDA.B [$00],Y : BNE .return 
    LDA.B [$03],Y : BNE .return 
    INY 
    CPY.W #$0004 
    BMI .loop 
    LDY.W #$0000 
    REP #$20 
    LDA.B $00 : CLC : ADC.W #$0004 : STA.B $00 
    LDA.B $03 : CLC : ADC.W #$0004 : STA.B $03 
    SEP #$20 
    INX 
    CPX.W #$001F 
    BMI .loop 
    LDX.W #$0001 

.return:
    PLP 
    RTS 


DetermineLeftmostMapRow:
    PHP 
    REP #$20 
    LDA.B $00 : CLC : ADC.W #$0080 : STA.B $03 
    LDA.W #$0000 
    SEP #$20 
    LDA.B $02 : STA.B $05 
    LDX.W #$001F 
    LDY.W #$0000 

.loop:
    LDA.B [$00],Y : BNE .return 
    LDA.B [$03],Y : BNE .return 
    INY 
    CPY.W #$0004 
    BMI .loop 
    LDY.W #$0000 
    REP #$20 
    LDA.B $00 : SEC : SBC.W #$0004 : STA.B $00 
    LDA.B $03 : SEC : SBC.W #$0004 : STA.B $03 
    SEP #$20 
    DEX 
    BNE .loop 
    LDX.W #$000B 

.return:
    PLP 
    RTS 


SetupPPUForPauseMenu:
    SEP #$30 
    LDA.B #$01 : STA.W $2101 
    STA.B $52 
    LDA.B #$09 : STA.W $2105 
    STA.B $55 
    STZ.B $5D 
    STZ.W $210B 
    LDA.B #$04 : STA.B $5E 
    STA.W $210C 
    LDA.B #$31 : STA.B $58 
    STA.W $2107 
    LDA.B #$38 : STA.B $59 
    STA.W $2108 
    LDA.B #$58 : STA.B $5A 
    STA.W $2109 
    LDA.B #$00 : STA.B $5C 
    STA.W $210A 
    LDA.B #$17 : STA.W $212C 
    STA.B $69 
    LDA.B #$00 : STA.W $2106 
    STA.B $57 
    LDA.B $74 : AND.B #$E0 : STA.B $74 
    LDA.B $75 : AND.B #$E0 : STA.B $75 
    LDA.B $76 : AND.B #$E0 : STA.B $76 
    LDA.B #$00 : STA.B $71 
    RTS 


ResetPauseMenuAnimations:
    REP #$30 
    STZ.W $0757 
    STZ.B $B1 
    STZ.B $B5 
    STZ.B $B9 
    STZ.B $B7 
    STZ.B $BB 
    STZ.W $0753 
    STZ.W $073F 
    STZ.W $0745 
    STZ.W $0776 
    STZ.W $0778 
    STZ.W $077A 
    LDA.W L_R_HighlightAnimationData_PauseScreenPaletteAnimationDelays : STA.W $072B 
    LDA.W #$0001 : STA.W $073B 
    LDA.W #$0000 : STA.W $074F 
    RTS 


Load_EquipmentScreen_EquipmentTilemaps:
    REP #$30 
    LDA.W $09D4 : BEQ + 
    LDY.W #$0000 
    LDA.W #EquipmentScreenData_RAMTilemapOffsets_tanks : STA.B $03 
    LDA.W #$0082 : STA.B $05 
    LDA.B [$03],Y : STA.B $00 
    LDX.W EquipmentScreenData_PointersEquipmentTIlemaps_tanks 
    LDA.W #$000E : STA.B $16 
    JSR.W Copy_Bytes_from_X_to_7ERAM 
    LDY.W #$0002 
    LDA.W #EquipmentScreenData_RAMTilemapOffsets_tanks : STA.B $03 
    LDA.W #$0082 : STA.B $05 
    LDA.B [$03],Y : STA.B $00 
    LDX.W EquipmentScreenData_PointersEquipmentTIlemaps_tanksReserve 
    LDA.W #$000E : STA.B $16 
    JSR.W Copy_Bytes_from_X_to_7ERAM 

  + LDY.W #$0000 
    LDA.W #EquipmentScreenData_RAMTilemapOffsets_weapons : STA.B $03 
    LDA.W #$0082 : STA.B $05 
    LDA.B [$03],Y : STA.B $00 
    LDA.W $0A76 : BNE .hyperBeam 

.loopWeapons:
    LDA.W EquipmentScreenData_EquipmentBitmasks_weapons,Y : BIT.W $09A8 
    BNE + 
    LDX.W #EquipmentScreenTilemaps_blankPlaceholder 
    LDA.W #$000A : STA.B $16 
    JSR.W Copy_Bytes_from_X_to_7ERAM 
    BRA .nextWeapon 


  + LDX.W EquipmentScreenData_PointersEquipmentTIlemaps_weapons,Y 
    LDA.W #$000A : STA.B $16 
    JSR.W Copy_Bytes_from_X_to_7ERAM 
    LDA.W EquipmentScreenData_EquipmentBitmasks_weapons,Y : BIT.W $09A6 
    BNE .nextWeapon 
    LDA.W #$0C00 : STA.B $12 
    LDA.W #$000A : STA.B $16 
    JSR.W Copy_Bytes_of_Palette_from_7E_to_12 

.nextWeapon:
    INY #2
    LDA.B [$03],Y : STA.B $00 
    CPY.W #$000C 
    BMI .loopWeapons 
    BRA .merge 


.hyperBeam:
    LDY.W #$0000 

.loopHyperBeamWeapons:
    LDX.W HyperBeamTilemaps,Y 
    LDA.W #$000A : STA.B $16 
    JSR.W Copy_Bytes_from_X_to_7ERAM 
    INY #2
    LDA.B [$03],Y : STA.B $00 
    CPY.W #$000C 
    BMI .loopHyperBeamWeapons 

.merge:
    LDY.W #$0000 
    LDA.W #EquipmentScreenData_RAMTilemapOffsets_suitsMisc : STA.B $03 
    LDA.W #$0082 : STA.B $05 
    LDA.B [$03],Y : STA.B $00 

.loopSuitMisc:
    LDA.W EquipmentScreenData_EquipmentBitmasks_suitsMisc,Y : BIT.W $09A4 
    BNE + 
    LDX.W #EquipmentScreenTilemaps_blankPlaceholder 
    LDA.W #$0012 : STA.B $16 
    JSR.W Copy_Bytes_from_X_to_7ERAM 
    BRA .nextSuitMisc 


  + LDX.W EquipmentScreenData_PointersEquipmentTIlemaps_suitsMisc,Y 
    LDA.W #$0012 : STA.B $16 
    JSR.W Copy_Bytes_from_X_to_7ERAM 
    LDA.W EquipmentScreenData_EquipmentBitmasks_suitsMisc,Y : BIT.W $09A2 
    BNE .nextSuitMisc 
    LDA.W #$0C00 : STA.B $12 
    LDA.W #$0012 : STA.B $16 
    JSR.W Copy_Bytes_of_Palette_from_7E_to_12 

.nextSuitMisc:
    INY #2
    LDA.B [$03],Y : STA.B $00 
    CPY.W #$000C 
    BMI .loopSuitMisc 
    LDY.W #$0000 
    LDA.W #EquipmentScreenData_RAMTilemapOffsets_boots : STA.B $03 
    LDA.W #$0082 : STA.B $05 
    LDA.B [$03],Y : STA.B $00 

.loopBoots:
    LDA.W EquipmentScreenData_EquipmentBitmasks_boots,Y : BIT.W $09A4 
    BNE + 
    LDX.W #EquipmentScreenTilemaps_blankPlaceholder 
    LDA.W #$0012 : STA.B $16 
    JSR.W Copy_Bytes_from_X_to_7ERAM 
    BRA .nextBoots 


  + LDA.W #$0012 : STA.B $16 
    LDX.W EquipmentScreenData_PointersEquipmentTIlemaps_boots,Y 
    JSR.W Copy_Bytes_from_X_to_7ERAM 
    LDA.W EquipmentScreenData_EquipmentBitmasks_boots,Y : BIT.W $09A2 
    BNE .nextBoots 
    LDA.W #$0C00 : STA.B $12 
    LDA.W #$0012 : STA.B $16 
    JSR.W Copy_Bytes_of_Palette_from_7E_to_12 

.nextBoots:
    INY #2
    LDA.B [$03],Y : STA.B $00 
    CPY.W #$0006 
    BMI .loopBoots 
    RTS 


Copy_Bytes_from_X_to_7ERAM:
    PHP : PHY 
    SEP #$20 
    LDA.B #$7E : STA.B $02 
    REP #$30 
    LDY.W #$0000 

.loop:
    LDA.W $0000,X : STA.B [$00],Y 
    INX #2
    INY #2
    DEC.B $16 
    DEC.B $16 
    BNE .loop 
    PLY : PLP 
    RTS 


Copy_Bytes_of_Palette_from_7E_to_12:
    PHP : PHY 
    SEP #$20 
    LDA.B #$7E : STA.B $02 
    REP #$30 
    LDY.W #$0000 

.loop:
    LDA.B [$00],Y : AND.W #$E3FF 
    ORA.B $12 
    STA.B [$00],Y 
    INY #2
    DEC.B $16 
    DEC.B $16 
    BNE .loop 
    PLY : PLP 
    RTS 


Clear_Samus_Beam_Tiles:
    PHP 
    SEP #$30 
    LDA.B #$00 : STA.W $2116 
    LDA.B #$60 : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl Tiles_Standard_Sprite_0 
    dw $1000 
    LDA.B #$02 : STA.W $420B 
    PLP 
    RTS 


ContinueInitialising_GameplayResume:
    SEP #$30 
    PHP 
    REP #$30 
    LDY.W #$0200 
    LDX.W #$0000 

.loop:
    LDA.L $7E3300,X : STA.L $7EC000,X 
    INX #2
    DEY #2
    BNE .loop 
    PLP 
    JSR.W Setup_PPU_for_GameplayResume 
    JSR.W Calculate_BG_Scrolls_bank82 
    JSR.W JSL_to_Update_BeamTiles_and_Palette 
    JSR.W Clear_PauseMenu_Data 
    REP #$30 
    LDA.W #$000C : JSL.L Run_Samus_Command 
    RTS 


Setup_PPU_for_GameplayResume:
    PHP 
    SEP #$30 
    LDA.B #$03 : STA.W $2101 
    STA.B $52 
    LDA.B #$09 : STA.W $2105 
    STA.B $55 
    STZ.B $5D 
    STZ.W $210B 
    LDA.B #$04 : STA.B $5E 
    STA.W $210C 
    LDA.B #$51 : STA.B $58 
    STA.W $2107 
    LDA.B #$49 : STA.B $59 
    STA.W $2108 
    LDA.B #$5A : STA.B $5A 
    STA.W $2109 
    LDA.B #$00 : STA.B $5C 
    STA.W $210A 
    PLP 
    RTS 


Calculate_BG_Scrolls_bank82:
    PHP 
    REP #$30 
    LDA.W $0911 : CLC : ADC.W $091D : STA.B $B1 
    LDA.W $0915 : CLC : ADC.W $091F : STA.B $B3 
    LDA.W $0917 : CLC : ADC.W $0921 : STA.B $B5 
    LDA.W $0919 : CLC : ADC.W $0923 : STA.B $B7 
    PLP 
    RTS 


JSL_to_Update_BeamTiles_and_Palette:
    PHP 
    REP #$30 
    JSL.L Update_Beam_Tiles_and_Palette 
    PLP 
    RTS 


Clear_PauseMenu_Data:
    PHP 
    REP #$30 
    STZ.W $0727 
    STZ.W $0729 
    STZ.W $072B 
    STZ.W $072D 
    STZ.W $072F 
    STZ.W $0731 
    STZ.W $0733 
    STZ.W $0735 
    STZ.W $0737 
    STZ.W $0739 
    STZ.W $073D 
    STZ.W $073F 
    STZ.W $0741 
    STZ.W $0743 
    STZ.W $0745 
    STZ.W $0747 
    STZ.W $0749 
    STZ.W $074B 
    STZ.W $074D 
    STZ.W $0751 
    STZ.W $0753 
    STZ.W $0755 
    STZ.W $0757 
    STZ.W $0759 
    STZ.W $075B 
    STZ.W $075D 
    STZ.W $075F 
    STZ.W $0761 
    PLP 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Change_Pose_Due_to_Equipment_Change:
    PHP 
    REP #$30 
    LDA.W $0A1F : AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    JSL.L LoadSamusSuitPalette 
    PLP 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


.pointers:
    dw RTS_82A425 
    dw RTS_82A425 
    dw RTS_82A425 
    dw ChangePose_DueTo_EquipmentChange_SpinJumping 
    dw ChangePose_DueTo_EquipmentChange_MorphBall 
    dw RTS_82A425 
    dw RTS_82A425 
    dw Change_Pose_due_to_Equipment_Change_MovementTypes_7_9 
    dw ChangePose_DueTo_EquipmentChange_MorphBall 
    dw Change_Pose_due_to_Equipment_Change_MovementTypes_7_9 
    dw RTS_82A425 
    dw RTS_82A425 
    dw RTS_82A425 
    dw RTS_82A425 
    dw RTS_82A425 
    dw RTS_82A425 
    dw RTS_82A425 
    dw ChangePose_DueTo_EquipmentChange_SpringBall 
    dw ChangePose_DueTo_EquipmentChange_SpringBall 
    dw ChangePose_DueTo_EquipmentChange_SpringBall 
    dw RTS_82A425 
    dw RTS_82A425 
    dw RTS_82A425 
    dw RTS_82A425 
    dw RTS_82A425 
    dw RTS_82A425 
    dw RTS_82A425 
    dw RTS_82A425 

RTS_82A425:
    PHP 
    REP #$30 
    PLP 
    RTS 


ChangePose_DueTo_EquipmentChange_SpinJumping:
    PHP 
    REP #$30 
    LDA.W $0A1C : CMP.W #$0081 : BEQ .screwAttack 
    CMP.W #$0082 : BEQ .screwAttack 
    CMP.W #$001B : BEQ .spaceJump 
    CMP.W #$001C : BEQ .spaceJump 
    BRA .return 


.spaceJump:
    LDA.W $09A2 : BIT.W #$0020 
    BNE .return 
    BRA .merge 


.screwAttack:
    LDA.W $09A2 : BIT.W #$0008 
    BNE .return 

.merge:
    LDA.W $0A1E : AND.W #$00FF 
    CMP.W #$0004 : BEQ .facingLeft 
    LDA.W #$0019 : STA.W $0A1C 
    BRA .initialisePose 


.facingLeft:
    LDA.W #$001A : STA.W $0A1C 

.initialisePose:
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 

.return:
    PLP 
    RTS 


Change_Pose_due_to_Equipment_Change_MovementTypes_7_9:
    PHP 
    REP #$30 
    LDA.W $09A2 : BIT.W #$0004 
    BNE .return 
    LDA.W $0A1E : AND.W #$00FF 
    CMP.W #$0004 : BEQ .facingLeft 
    LDA.W #$001D : STA.W $0A1C 
    BRA .initialisePose 


.facingLeft:
    LDA.W #$0041 : STA.W $0A1C 

.initialisePose:
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 

.return:
    PLP 
    RTS 


ChangePose_DueTo_EquipmentChange_MorphBall:
    PHP 
    REP #$30 
    LDA.W $09A2 : BIT.W #$0002 
    BEQ .return 
    LDA.W $0A1E : AND.W #$00FF 
    CMP.W #$0004 : BEQ .facingLeft 
    LDA.W #$0079 : STA.W $0A1C 
    BRA .initialisePose 


.facingLeft:
    LDA.W #$007A : STA.W $0A1C 

.initialisePose:
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 

.return:
    PLP 
    RTS 


ChangePose_DueTo_EquipmentChange_SpringBall:
    PHP 
    REP #$30 
    LDA.W $09A2 : BIT.W #$0002 
    BNE .return 
    LDA.W $0A1E : AND.W #$00FF 
    CMP.W #$0004 : BEQ .facingLeft 
    LDA.W #$001D : STA.W $0A1C 
    BRA .initialisePose 


.facingLeft:
    LDA.W #$0041 : STA.W $0A1C 

.initialisePose:
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 

.return:
    PLP 
    RTS 


Handle_PauseScreen_L_R:
    JSR.W Handle_PauseScreen_L_R_Input 
    JSR.W EquipmentScreen_Draw_L_R_Highlight 
    RTS 


Handle_PauseScreen_L_R_Input:
    PHP 
    REP #$30 
    LDA.W $05E1 : BIT.W #$0020 
    BNE .L 
    BIT.W #$0010 
    BNE .R 
    BRA .return 

    LDA.W $0753 : BNE .highlightL 
    BRA .highlightR 


.R:
    LDA.W $0753 : CMP.W #$0002 : BEQ .return 
    LDA.W Duration_Of_L_R_Button_Pressed_Highlight : STA.W $0729 
    LDA.W #$0002 : STA.W $0727 

.highlightR:
    LDA.W #$0002 : STA.W $0751 
    STA.W $0753 
    JSR.W Set_PauseScreen_ButtonLabelPalettes 
    BRA .merge 


.L:
    LDA.W $0753 : BEQ .return 
    LDA.W Duration_Of_L_R_Button_Pressed_Highlight : STA.W $0729 
    LDA.W #$0005 : STA.W $0727 

.highlightL:
    LDA.W #$0001 : STA.W $0751 
    STZ.W $0753 
    JSR.W Set_PauseScreen_ButtonLabelPalettes 

.merge:
    LDA.W #$0038 : JSL.L QueueSound_Lib1_Max6 

.return:
    PLP 
    RTS 


Handle_PauseMenu_L_R_PressedHighlight:
    PHP 
    REP #$30 
    LDA.W $0729 : BEQ .return 
    DEC A 
    STA.W $0729 
    LDA.W $0751 : BEQ .return 
    DEC A 
    ASL A 
    TAX 
    LDA.W #$0000 : STA.B $03 
    LDA.W L_R_ButtonPressed_HighlightTable_spritemapID,X 
    PHA 
    LDA.W L_R_ButtonPressed_HighlightTable_YposPlus1,X 
    TAY 
    DEY 
    LDA.W L_R_ButtonPressed_HighlightTable_Xpos,X 
    TAX 
    PLA 
    JSL.L AddSpritemapFrom_82C569_TableToOAM 

.return:
    PLP 
    RTS 


EquipmentScreen_Draw_L_R_Highlight:
    PHP 
    REP #$30 
    LDY.W #$00D0 
    LDX.W #$0018 
    LDA.W #$0002 : JSR.W Draw_PauseScreen_SpriteAnimation 
    LDY.W #$00D0 
    LDX.W #$00E8 
    LDA.W #$0002 : JSR.W Draw_PauseScreen_SpriteAnimation 
    PLP 
    RTS 


Handle_PauseScreen_StartButton:
    PHP 
    REP #$30 
    LDA.W $05E1 : BIT.W #$1000 
    BEQ + 
    LDA.W #$0038 : JSL.L QueueSound_Lib1_Max6 
    LDA.W #$0001 : STA.W $0723 
    STA.W $0725 
    LDA.W $0753 
    PHA 
    LDA.W #$0001 : STA.W $0753 
    JSR.W Set_PauseScreen_ButtonLabelPalettes 
    PLA 
    STA.W $0753 
    LDA.W #$000B : STA.W $0729 
    INC.W $0998 

  + JSR.W Update_PauseMenu_L_R_Start_VRAMTilemap 
    PLP 
    RTS 


Handle_PauseMenu_StartPressedHighlight:
    PHP : PHB : PHK : PLB 
    REP #$30 
    LDA.W $0729 : BEQ .return 
    DEC A 
    STA.W $0729 
    LDA.W #$0000 : STA.B $03 
    LDX.W #$0090 
    LDY.W #$00D0 
    LDA.W #$002B : JSL.L AddSpritemapFrom_82C569_TableToOAM 

.return:
    PLB : PLP 
    RTL 


Set_PauseScreen_ButtonLabelPalettes:
    PHP 
    REP #$30 
    LDA.W $0753 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    PLP 
    RTS 


.pointers:
    dw Set_PauseScreen_ButtonLabelPalettes_MapScreen 
    dw Set_PauseScreen_ButtonLabelPalettes_Unpausing 
    dw Set_PauseScreen_ButtonLabelPalettes_EquipmentScreen 

Set_PauseScreen_ButtonLabelPalettes_EquipmentScreen:
    REP #$30 
    PHP 
    REP #$30 
    LDY.W #$000A 
    LDX.W #$0000 

.loopTopMAP:
    LDA.L $7E364A,X : AND.W #$E3FF 
    ORA.W #$0800 
    STA.L $7E364A,X 
    INX #2
    DEY #2
    BNE .loopTopMAP 
    PLP : PHP 
    REP #$30 
    LDY.W #$000A 
    LDX.W #$0000 

.loopBottomMAP:
    LDA.L $7E368A,X : AND.W #$E3FF 
    ORA.W #$0800 
    STA.L $7E368A,X 
    INX #2
    DEY #2
    BNE .loopBottomMAP 
    PLP : PHP 
    REP #$30 
    LDY.W #$0008 
    LDX.W #$0000 

.loopTopEXIT:
    LDA.L $7E3658,X : AND.W #$E3FF 
    ORA.W #$0800 
    STA.L $7E3658,X 
    INX #2
    DEY #2
    BNE .loopTopEXIT 
    PLP : PHP 
    REP #$30 
    LDY.W #$0008 
    LDX.W #$0000 

.loopBottomEXIT:
    LDA.L $7E3698,X : AND.W #$E3FF 
    ORA.W #$0800 
    STA.L $7E3698,X 
    INX #2
    DEY #2
    BNE .loopBottomEXIT 
    PLP : PHP 
    REP #$30 
    LDY.W #$000A 
    LDX.W #$0000 

.loopTopSAMUS:
    LDA.L $7E366C,X : AND.W #$E3FF 
    ORA.W #$1400 
    STA.L $7E366C,X 
    INX #2
    DEY #2
    BNE .loopTopSAMUS 
    PLP : PHP 
    REP #$30 
    LDY.W #$000A 
    LDX.W #$0000 

.loopBottomSAMUS:
    LDA.L $7E36AC,X : AND.W #$E3FF 
    ORA.W #$1400 
    STA.L $7E36AC,X 
    INX #2
    DEY #2
    BNE .loopBottomSAMUS 
    PLP 
    RTS 


Set_PauseScreen_ButtonLabelPalettes_Unpausing:
    REP #$30 
    PHP 
    REP #$30 
    LDY.W #$0008 
    LDX.W #$0000 

.loopTopEXIT:
    LDA.L $7E3658,X : AND.W #$E3FF 
    ORA.W #$0800 
    STA.L $7E3658,X 
    INX #2
    DEY #2
    BNE .loopTopEXIT 
    PLP : PHP 
    REP #$30 
    LDY.W #$0008 
    LDX.W #$0000 

.loopBottomEXIT:
    LDA.L $7E3698,X : AND.W #$E3FF 
    ORA.W #$0800 
    STA.L $7E3698,X 
    INX #2
    DEY #2
    BNE .loopBottomEXIT 
    PLP : PHP 
    REP #$30 
    LDY.W #$000A 
    LDX.W #$0000 

.loopTopMAP:
    LDA.L $7E364A,X : AND.W #$E3FF 
    ORA.W #$1400 
    STA.L $7E364A,X 
    INX #2
    DEY #2
    BNE .loopTopMAP 
    PLP : PHP 
    REP #$30 
    LDY.W #$000A 
    LDX.W #$0000 

.loopBottomMAP:
    LDA.L $7E368A,X : AND.W #$E3FF 
    ORA.W #$1400 
    STA.L $7E368A,X 
    INX #2
    DEY #2
    BNE .loopBottomMAP 
    PLP : PHP 
    REP #$30 
    LDY.W #$000A 
    LDX.W #$0000 

.loopTopSAMUS:
    LDA.L $7E366C,X : AND.W #$E3FF 
    ORA.W #$1400 
    STA.L $7E366C,X 
    INX #2
    DEY #2
    BNE .loopTopSAMUS 
    PLP : PHP 
    REP #$30 
    LDY.W #$000A 
    LDX.W #$0000 

.loopBottomSAMUS:
    LDA.L $7E36AC,X : AND.W #$E3FF 
    ORA.W #$1400 
    STA.L $7E36AC,X 
    INX #2
    DEY #2
    BNE .loopBottomSAMUS 
    PLP 
    RTS 


Set_PauseScreen_ButtonLabelPalettes_MapScreen:
    REP #$30 
    PHP 
    REP #$30 
    LDY.W #$000A 
    LDX.W #$0000 

.loopTopSAMUS:
    LDA.L $7E366C,X : AND.W #$E3FF 
    ORA.W #$0800 
    STA.L $7E366C,X 
    INX #2
    DEY #2
    BNE .loopTopSAMUS 
    PLP : PHP 
    REP #$30 
    LDY.W #$000A 
    LDX.W #$0000 

.loopBottomSAMUS:
    LDA.L $7E36AC,X : AND.W #$E3FF 
    ORA.W #$0800 
    STA.L $7E36AC,X 
    INX #2
    DEY #2
    BNE .loopBottomSAMUS 
    PLP : PHP 
    REP #$30 
    LDY.W #$0008 
    LDX.W #$0000 

.loopTopEXIT:
    LDA.L $7E3658,X : AND.W #$E3FF 
    ORA.W #$0800 
    STA.L $7E3658,X 
    INX #2
    DEY #2
    BNE .loopTopEXIT 
    PLP : PHP 
    REP #$30 
    LDY.W #$0008 
    LDX.W #$0000 

.loopBottomEXIT:
    LDA.L $7E3698,X : AND.W #$E3FF 
    ORA.W #$0800 
    STA.L $7E3698,X 
    INX #2
    DEY #2
    BNE .loopBottomEXIT 
    PLP : PHP 
    REP #$30 
    LDY.W #$000A 
    LDX.W #$0000 

.loopTopMAP:
    LDA.L $7E364A,X : AND.W #$E3FF 
    ORA.W #$1400 
    STA.L $7E364A,X 
    INX #2
    DEY #2
    BNE .loopTopMAP 
    PLP : PHP 
    REP #$30 
    LDY.W #$000A 
    LDX.W #$0000 

.loopBottomMAP:
    LDA.L $7E368A,X : AND.W #$E3FF 
    ORA.W #$1400 
    STA.L $7E368A,X 
    INX #2
    DEY #2
    BNE .loopBottomMAP 
    PLP 
    RTS 


Update_PauseMenu_L_R_Start_VRAMTilemap:
    PHP 
    REP #$30 
    LDX.W $0330 
    LDA.W #$0080 : STA.B $D0,X 
    INX #2
    LDA.W #$3640 : STA.B $D0,X 
    INX #2
    SEP #$20 
    LDA.B #$7E : STA.B $D0,X 
    REP #$20 
    INX 
    LDA.B $59 : AND.W #$00FC 
    XBA 
    CLC : ADC.W #$0320 : STA.B $D0,X 
    INX #2
    STX.W $0330 
    PLP 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Draw_PauseScreen_SpriteAnimation_long:
    JSR.W Draw_PauseScreen_SpriteAnimation 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Draw_PauseScreen_SpriteAnimation:
    PHP : PHX 
    REP #$30 
    STX.B $12 
    STY.B $14 
    DEC A 
    ASL A 
    TAX 
    LDA.W PauseScreen_SpriteAnimationData_timer,X 
    TAY 
    LDA.W $0000,Y 
    DEC A 
    STA.W $0000,Y 
    BEQ + 
    BPL .nonZero 

  + STY.B $18 
    LDA.W PauseScreen_SpriteAnimationData_frame,X 
    TAY 
    LDA.W $0000,Y 
    INC A 
    STA.W $0000,Y 
    ASL A 
    CLC : ADC.W $0000,Y : STA.B $16 
    LDA.W PauseScreen_SpriteAnimationData_data,X : CLC : ADC.B $16 : TAY 
    LDA.W $0000,Y : AND.W #$00FF 
    CMP.W #$00FF : BNE + 
    LDA.W PauseScreen_SpriteAnimationData_frame,X 
    TAY 
    LDA.W #$0000 : STA.W $0000,Y 
    LDA.W PauseScreen_SpriteAnimationData_data,X 
    TAY 
    LDA.W $0000,Y : AND.W #$00FF 

  + LDY.B $18 
    STA.W $0000,Y 

.nonZero:
    LDA.W PauseScreen_SpriteAnimationData_frame,X 
    TAY 
    LDA.W $0000,Y 
    ASL A 
    CLC : ADC.W $0000,Y : STA.B $18 
    LDA.W PauseScreen_SpriteAnimationData_data,X : CLC : ADC.B $18 : INC A 
    TAY 
    PHY 
    LDA.W #$0003 
    ASL A 
    TAY 
    LDA.W SpritePalette_IndexValues,Y : STA.B $03 
    PLY 
    INY 
    LDA.W $0000,Y : AND.W #$00FF : STA.B $18 
    LDA.W PauseScreen_SpriteAnimationData_mode,X 
    TAY 
    LDA.W $0000,Y : AND.W #$00FF 
    ASL A 
    STA.B $1A 
    LDA.W AnimationSpritemapBaseIDPointers,X : CLC : ADC.B $1A : TAY 
    LDA.W $0000,Y : CLC : ADC.B $18 : LDX.B $12 
    LDY.B $14 
    DEY 
    JSL.L AddSpritemapFrom_82C569_TableToOAM 
    PLX : PLP 
    RTS 


Handle_PauseScreen_PaletteAnimation:
    PHP 
    SEP #$20 
    LDA.B #$00 
    XBA 
    LDA.B #$00 
    LDA.W $073B : BEQ .return 
    DEC A 
    STA.W $073B 
    BNE .return 
    LDA.W $074F 
    INC A 

.loop:
    STA.W $074F 
    ASL A 
    CLC : ADC.W $074F : TAX 
    LDA.W L_R_HighlightAnimationData_PauseScreenPaletteAnimationDelays,X : CMP.B #$FF : BNE + 
    REP #$30 
    LDA.W #$002A : JSL.L QueueSound_Lib3_Max6 
    SEP #$20 
    LDA.B #$00 
    XBA 
    LDA.B #$00 : BRA .loop 


  + STA.W $073B 
    LDA.W $074F 
    REP #$30 
    XBA 
    LSR #3
    CLC : ADC.W #$001E : TAY 
    LDX.W #$001E 

.loopAnimationTimer:
    LDA.W .paletteData,Y : STA.L $7EC160,X 
    DEY #2
    DEX #2
    BPL .loopAnimationTimer 

.return:
    PLP 
    RTS 


.paletteData:
    dw $0000,$7E7F,$015F,$7C14,$7FFF,$4E73,$0000,$318C,$0070,$2870,$318C,$0000,$0000,$318C,$0000,$318C
    dw $0000,$6E1C,$011B,$7412,$739C,$5294,$00A6,$294D,$004E,$3092,$294B,$00A6,$1084,$294A,$0000,$298E
    dw $0000,$61BA,$00F9,$6810,$6B5A,$56B5,$012A,$2530,$004C,$34B4,$294B,$012A,$18C6,$2108,$0000,$25B0
    dw $0000,$5577,$00B6,$580C,$6318,$5AD6,$018E,$2111,$004B,$3CF5,$252B,$018E,$294A,$1CE7,$0000,$21B1
    dw $0000,$5156,$0093,$500A,$6318,$6318,$0212,$1CF2,$0028,$3CF6,$210B,$0212,$39CE,$14A5,$0000,$1DD3
    dw $0000,$44F4,$0012,$4407,$5AD6,$6739,$0296,$18D5,$0004,$4518,$18CB,$0296,$4A52,$0C63,$0000,$15D6
    dw $0000,$3CD2,$0070,$3805,$5294,$739C,$02FA,$0C7A,$0002,$495A,$0C6F,$02FA,$6318,$0421,$0000,$0DFA
    dw $0000,$200D,$000A,$2C02,$4E73,$7FFF,$039F,$001F,$0000,$559D,$001D,$039F,$7FFF,$0000,$0000,$023F
    dw $0000,$3CD2,$0070,$3805,$5294,$739C,$02FA,$0C7A,$0002,$495A,$0C6F,$02FA,$6318,$0421,$0000,$0DFA
    dw $0000,$44F4,$0012,$4407,$5AD6,$6739,$0296,$18D5,$0004,$4518,$18CB,$0296,$4A52,$0C63,$0000,$15D6
    dw $0000,$5156,$0093,$500A,$6318,$6318,$0212,$1CF2,$0028,$3CF6,$210B,$0212,$39CE,$14A5,$0000,$1DD3
    dw $0000,$5577,$00B6,$580C,$6318,$5AD6,$018E,$2111,$004B,$3CF5,$252B,$018E,$294A,$1CE7,$0000,$21B1
    dw $0000,$61BA,$00F9,$6810,$6B5A,$56B5,$012A,$2530,$004C,$34B4,$294B,$012A,$18C6,$2108,$0000,$25B0
    dw $0000,$6E1C,$011B,$7412,$739C,$5294,$00A6,$294D,$004E,$3092,$294B,$00A6,$1084,$294A,$0000,$298E

EquipmentScreen_SetupReserveMode_and_DetermineInitialSelect:
    PHP 
    REP #$30 
    LDA.B $B1 : STA.B $BD 
    LDA.B $B3 : STA.B $BF 
    STZ.B $B1 
    STZ.B $B3 
    LDA.W $09D4 : BEQ .noReserves 
    LDA.W $09C0 : BEQ .noReserves 
    LDX.W #EquipmentScreenTilemaps_auto 
    LDY.W #$0082 
    CMP.W #$0001 : BEQ + 
    LDX.W #EquipmentScreenTilemaps_manual 
    LDY.W #$0082 

  + STY.B $02 
    STX.B $00 
    LDA.W #$0004 : STA.B $12 
    LDX.W #$0000 
    LDY.W #$0000 

.loopTilemap:
    LDA.L $7E3A8E,X : AND.W #$FC00 
    ORA.B [$00],Y 
    STA.L $7E3A8E,X 
    INY #2
    INX #2
    DEC.B $12 
    BNE .loopTilemap 

.noReserves:
    STZ.W $0741 
    LDA.W L_R_HighlightAnimationData_PauseScreenPaletteAnimationDelays : AND.W #$00FF : STA.W $072D 
    STZ.W $0743 
    LDA.W ReserveTank_AnimationData : AND.W #$00FF : STA.W $072F 
    LDA.W $09D4 : BEQ + 
    LDA.W #$0000 : STA.W $0755 
    BRA .return 


  + LDA.W $0A76 : BNE .noBeams 
    LDA.W $09A8 
    LDX.W #$0000 

.loopBeams:
    BIT.W EquipmentScreenData_EquipmentBitmasks_weapons,X 
    BNE + 
    INX #2
    CPX.W #$000A 
    BMI .loopBeams 
    BRA .noBeams 


  + TXA 
    LSR A 
    XBA 
    ORA.W #$0001 
    STA.W $0755 
    BRA .return 


.noBeams:
    LDA.W $09A4 
    LDX.W #$0000 

.loopSuitMisc:
    BIT.W EquipmentScreenData_EquipmentBitmasks_suitsMisc,X 
    BNE + 
    INX #2
    CPX.W #$000C 
    BMI .loopSuitMisc 
    BRA .noSuitMisc 


  + TXA 
    LSR A 
    XBA 
    ORA.W #$0002 
    STA.W $0755 
    BRA .return 


.noSuitMisc:
    LDX.W #$0000 

.loopNoSuitMisc:
    BIT.W EquipmentScreenData_EquipmentBitmasks_boots,X 
    INX #2
    CPX.W #$0006 
    BMI .loopNoSuitMisc 
    BRA .return 

    TXA ; dead code
    LSR A 
    XBA 
    ORA.W #$0003 
    STA.W $0755 

.return:
    LDA.W $09D6 : BEQ + 
    JSR.W EquipmentScreen_GlowingArrow_Solid_On 
    JSR.W EquipmentScreen_WriteSamusWireframeTilemap_and_BG1ToVRAM 

  + PLP 
    RTS 


EquipmentScreen_TransferBG1Tilemap:
    PHP : PHB : PHK : PLB 
    SEP #$30 
    LDA.B #$00 : STA.W $2116 
    LDA.B #$30 : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7E3800 
    dw $0800 
    LDA.B #$02 : STA.W $420B 
    STZ.B $B3 
    STZ.B $B4 
    PLB : PLP 
    RTL 


EquipmentScreen_Main:
    PHP 
    REP #$30 
    LDA.W $0755 : AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    JSR.W EquipmentScreen_DrawItemSelector 
    JSR.W EquipmentScreen_DisplayReserveTankAmount_shell 
    JSR.W EquipmentScreen_WriteSamusWireframeTilemap_and_BG1ToVRAM 
    PLP 
    RTS 


.pointers:
    dw EquipmentScreen_Main_Tanks 
    dw EquipmentScreen_Main_Weapons 
    dw EquipmentScreen_Main_SuitsMisc 
    dw EquipmentScreen_Main_Boots 

EquipmentScreen_Main_Tanks:
    PHP 
    REP #$30 
    LDA.W $0755 
    XBA 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    JSR.W EquipmentScreen_Main_Tanks_DPadResponse 
    JSR.W EquipmentScreen_Main_Tanks_GlowingArrow 
    PLP 
    RTS 


.pointers:
    dw EquipmentScreen_Main_Tanks_Mode 
    dw EquipmentScreen_Main_Tanks_ReserveTank 

EquipmentScreen_Main_Tanks_DPadResponse:
    PHP 
    REP #$30 
    LDA.W $0755 : STA.B $12 
    LDA.B $8F : BIT.W #$0100 
    BEQ .notRight 
    BIT.W #$0400 
    BNE .moveToBoots 
    LDX.W #$0000 
    JSR.W EquipmentScreen_MoveLowerOnSuitsMisc 
    CMP.W #$FFFF : BNE .exit 

.moveToBoots:
    LDX.W #$0000 
    JSR.W EquipmentScreen_MoveLowerOnBoots 

.exit:
    PLP 
    RTS 


.notRight:
    BIT.W #$0800 
    BNE .up 
    BIT.W #$0400 
    BEQ .exit 
    LDA.W $0755 : AND.W #$FF00 
    CMP.W #$0100 : BEQ .moveToBeams 
    LDA.W $09C0 : CMP.W #$0001 : BEQ .moveToBeams 
    LDA.W $0755 : CLC : ADC.W #$0100 : STA.W $0755 
    LDA.W $09D6 : BEQ .moveToBeams 
    LDA.W #$0037 : JSL.L QueueSound_Lib1_Max6 
    BRA .return 


.moveToBeams:
    LDX.W #$0000 
    JSR.W EquipmentScreen_MoveLowerOnBeams 
    BRA .return 


.up:
    LDA.W $0755 : AND.W #$FF00 
    BEQ .return 
    LDA.W #$0037 : JSL.L QueueSound_Lib1_Max6 
    LDA.W $0755 : SEC : SBC.W #$0100 : STA.W $0755 

.return:
    PLP 
    RTS 


EquipmentScreen_Main_Tanks_GlowingArrow:
    PHP 
    REP #$30 
    LDA.W $0755 : BIT.W #$00FF 
    BNE .solidOff 
    XBA 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    PLP 
    RTS 


.solidOff:
    JSR.W EquipmentScreen_GlowingArrow_Solid_Off 
    PLP 
    RTS 


.pointers:
    dw EquipmentScreen_GlowingArrow_Animated 
    dw EquipmentScreen_GlowingArrow_Solid_On 

EquipmentScreen_GlowingArrow_Animated:
    LDA.W $09C0 : CMP.W #$0001 : BNE .disableGlow 
    LDA.W $05B5 : AND.W #$001F 
    ASL A 
    TAX 
    LDA.W .palette6,X : STA.L $7EC0CC 
    LDA.W .paletteB,X : STA.L $7EC0D6 
    JSR.W EquipmentScreen_Enable_EnergyArrowGlow 
    RTS 


.disableGlow:
    LDA.W #$039E : STA.L $7EC0D6 
    LDA.W #$0156 : STA.L $7EC0CC 
    JSR.W EquipmentScreen_Disable_EnergyArrowGlow 
    RTS 


.palette6:
    dw $039E,$077D,$0B5C,$0F5B,$133A,$171A,$1F19,$22F8,$26D7,$2AD6,$2EB6,$3695,$3A94,$3E73,$4253,$4A52
    dw $4A52,$4253,$3E73,$3A94,$3695,$2EB6,$2AD6,$26D7,$22F8,$1F19,$171A,$133A,$0F5B,$0B5C,$077D,$039E

.paletteB:
    dw $0156,$0155,$0554,$0954,$0D53,$0D52,$1152,$1551,$1970,$1D70,$1D6F,$216E,$256E,$296D,$296C,$318C
    dw $318C,$296C,$296D,$256E,$216E,$1D6F,$1D70,$1970,$1551,$1152,$0D52,$0D53,$0954,$0554,$0155,$0156

EquipmentScreen_GlowingArrow_Solid_On:
    LDA.W #$039E : STA.L $7EC0D6 
    LDA.W #$0156 : STA.L $7EC0CC 
    JSR.W EquipmentScreen_Enable_EnergyArrowGlow 
    RTS 


EquipmentScreen_GlowingArrow_Solid_Off:
    LDA.W #$039E : STA.L $7EC0D6 
    LDA.W #$0156 : STA.L $7EC0CC 
    JSR.W EquipmentScreen_Disable_EnergyArrowGlow 
    RTS 


EquipmentScreen_Enable_EnergyArrowGlow:
    PHP 
    REP #$30 
    PHP 
    REP #$30 
    LDY.W #$0010 
    LDX.W #$0000 

.loopVertical:
    LDA.L $7E3902,X : AND.W #$E3FF 
    ORA.W #$1800 
    STA.L $7E3902,X 
    TXA 
    CLC : ADC.W #$0040 : TAX 
    DEY #2
    BNE .loopVertical 
    PLP : PHP 
    REP #$30 
    LDY.W #$0004 
    LDX.W #$0000 

.loopHorizontal:
    LDA.L $7E3B02,X : AND.W #$E3FF 
    ORA.W #$1800 
    STA.L $7E3B02,X 
    INX #2
    DEY #2
    BNE .loopHorizontal 
    PLP : PLP 
    RTS 


EquipmentScreen_Disable_EnergyArrowGlow:
    PHP 
    REP #$30 
    PHP 
    REP #$30 
    LDY.W #$0010 
    LDX.W #$0000 

.loopVertical:
    LDA.L $7E3902,X : AND.W #$E3FF 
    ORA.W #$1C00 
    STA.L $7E3902,X 
    TXA 
    CLC : ADC.W #$0040 : TAX 
    DEY #2
    BNE .loopVertical 
    PLP : PHP 
    REP #$30 
    LDY.W #$0004 
    LDX.W #$0000 

.loopHorizontal:
    LDA.L $7E3B02,X : AND.W #$E3FF 
    ORA.W #$1C00 
    STA.L $7E3B02,X 
    INX #2
    DEY #2
    BNE .loopHorizontal 
    PLP : PLP 
    RTS 


EquipmentScreen_Main_Tanks_Mode:
    PHP 
    REP #$30 
    LDA.B $8F : BIT.W #$0080 
    BEQ .return 
    LDA.W $09D4 : BEQ .return 
    LDA.W #$0037 : JSL.L QueueSound_Lib1_Max6 
    LDA.W $09C0 : CMP.W #$0001 : BNE .manual 
    LDA.W #$0002 : STA.W $09C0 
    JSR.W EquipmentScreen_ClearHUDReserveAUTOTilemap 
    PHP 
    REP #$30 
    LDY.W #$0008 
    LDX.W #$0000 

.loopAuto:
    LDA.L $7E3A8E,X : AND.W #$FC00 
    ORA.L EquipmentScreenTilemaps_manual,X 
    STA.L $7E3A8E,X 
    INX #2
    DEY #2
    BNE .loopAuto 
    PLP 
    BRA .return 


.manual:
    LDA.W #$0001 : STA.W $09C0 
    JSR.W EquipmentScreen_SetHUDReserveAUTOTilemap 
    PHP 
    REP #$30 
    LDY.W #$0008 
    LDX.W #$0000 

.loopManual:
    LDA.L $7E3A8E,X : AND.W #$FC00 
    ORA.L EquipmentScreenTilemaps_auto,X 
    STA.L $7E3A8E,X 
    INX #2
    DEY #2
    BNE .loopManual 
    PLP 

.return:
    PLP 
    RTS 


EquipmentScreen_SetHUDReserveAUTOTilemap:
    LDY.W #Tilemap_HUD_autoReserve 
    LDA.W $09D6 : BNE + 
    LDY.W #Tilemap_HUD_emptyAutoReserve 

  + LDA.W $0000,Y : STA.L $7EC618 
    LDA.W $0002,Y : STA.L $7EC61A 
    LDA.W $0004,Y : STA.L $7EC658 
    LDA.W $0006,Y : STA.L $7EC65A 
    LDA.W $0008,Y : STA.L $7EC698 
    LDA.W $000A,Y : STA.L $7EC69A 
    RTS 


EquipmentScreen_ClearHUDReserveAUTOTilemap:
    LDA.W #$2C0F : STA.L $7EC618 
    STA.L $7EC61A 
    STA.L $7EC658 
    STA.L $7EC65A 
    STA.L $7EC698 
    STA.L $7EC69A 
    RTS 


EquipmentScreen_Main_Tanks_ReserveTank:
    PHP 
    REP #$30 
    LDA.W $0757 : BNE .soundTimer 
    LDA.B $8F : BIT.W #$0080 
    BEQ .return 
    LDA.W $09D6 : CLC : ADC.W #$0007 : AND.W #$FFF8 
    STA.W $0757 

.soundTimer:
    LDA.W $0757 
    DEC A 
    STA.W $0757 
    AND.W #$0007 
    CMP.W #$0007 : BNE .incrementEnergy 
    LDA.W #$002D : JSL.L QueueSound_Lib3_Max6 

.incrementEnergy:
    LDA.W $09C2 : CLC : ADC.W ReserveTank_TransferEnergyPerFrame : STA.W $09C2 
    CMP.W $09C4 : BMI .decrementReserve 
    LDA.W $09C4 : STA.W $09C2 
    BRA .emptyReserve 


.decrementReserve:
    LDA.W $09D6 : SEC : SBC.W ReserveTank_TransferEnergyPerFrame : STA.W $09D6 
    BEQ .emptyReserve 
    BPL .return 
    LDA.W $09C2 : CLC : ADC.W $09D6 : STA.W $09C2 

.emptyReserve:
    STZ.W $09D6 
    STZ.W $0757 
    JSR.W EquipmentScreen_Disable_EnergyArrowGlow 
    STZ.W $0755 

.return:
    PLP 
    RTS 


EquipmentScreen_Main_Weapons:
    PHP 
    REP #$30 
    JSR.W EquipmentScreen_Main_Weapons_MoveResponse 
    LDA.W $09A6 : STA.B $24 
    LDA.W $09A8 : BEQ .return 
    LDA.W #$000A : STA.B $18 
    JSR.W EquipmentScreen_Main_ButtonResponse 
    JSR.W EquipmentScreen_Main_Weapons_PlasmaSpazerCheck 

.return:
    PLP 
    RTS 


EquipmentScreen_Main_Weapons_MoveResponse:
    PHP 
    REP #$30 
    LDA.W $0755 : STA.B $12 
    LDA.B $8F : BIT.W #$0100 
    BEQ .rightEnd 
    BIT.W #$0800 
    BNE .top 
    LDX.W #$0004 
    JSR.W EquipmentScreen_MoveLowerOnSuitsMisc 
    CMP.W #$0000 : BEQ .return 
    LDX.W #$0000 
    JSR.W EquipmentScreen_MoveLowerOnBoots 
    BRA .return 


.top:
    LDX.W #$0000 
    JSR.W EquipmentScreen_MoveLowerOnSuitsMisc 
    BRA .return 


.rightEnd:
    BIT.W #$0400 
    BNE .down 
    BIT.W #$0800 
    BEQ .return 
    LDA.W $0755 : AND.W #$FF00 
    BEQ .moveToReserve 
    LDA.W $0755 : SEC : SBC.W #$0100 : STA.W $0755 
    XBA 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W EquipmentScreen_MoveHigherOnBeams 
    CMP.W #$FFFF : BNE .return 

.moveToReserve:
    LDX.W #$0000 
    JSR.W EquipmentScreen_MoveToReserveTanks 
    CMP.W #$0000 : BNE .return 
    LDA.B $12 : STA.W $0755 
    BRA .return 


.down:
    LDA.W $0A76 : BNE .return 
    LDA.W $0755 : CMP.W #$0401 : BEQ .return 
    LDA.W $0755 : CLC : ADC.W #$0100 : STA.W $0755 
    XBA 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W EquipmentScreen_MoveLowerOnBeams 

.return:
    PLP 
    RTS 


EquipmentScreen_Main_Weapons_PlasmaSpazerCheck:
    PHP 
    REP #$30 
    LDA.B $24 : EOR.W #$FFFF : AND.W $09A6 
    BIT.W #$0004 
    BNE .spazerToggled 
    BIT.W #$0008 
    BEQ .return 
    LDA.B $24 : BIT.W #$0008 
    BNE .return 
    LDA.W $09A6 : BIT.W #$0004 
    BEQ .return 
    AND.W #$FFFB 
    STA.W $09A6 
    LDA.W EquipmentScreenData_RAMTilemapOffsets_weapons_spazer : STA.B $00 
    BRA .merge 


.spazerToggled:
    LDA.B $24 : BIT.W #$0004 
    BNE .return 
    LDA.W $09A6 : BIT.W #$0008 
    BEQ .return 
    AND.W #$FFF7 
    STA.W $09A6 
    LDA.W EquipmentScreenData_RAMTilemapOffsets_weapons_plasma : STA.B $00 

.merge:
    LDA.W #$0C00 : STA.B $12 
    LDA.W #$000A : STA.B $16 
    JSR.W Copy_Bytes_of_Palette_from_7E_to_12 

.return:
    PLP 
    RTS 


EquipmentScreen_Main_SuitsMisc:
    PHP 
    REP #$30 
    JSR.W EquipmentScreen_SuitsMisc_MoveResponse 
    LDA.W #$0012 : STA.B $18 
    JSR.W EquipmentScreen_Main_ButtonResponse 
    PLP 
    RTS 


EquipmentScreen_SuitsMisc_MoveResponse:
    PHP 
    REP #$30 
    LDA.W $0755 : STA.B $12 
    LDA.B $8F : BIT.W #$0200 
    BEQ .leftEnd 
    BIT.W #$0400 
    BNE .topOfBeams 
    LDX.W #$0000 
    JSR.W EquipmentScreen_MoveToReserveTanks 
    CMP.W #$0000 : BNE .return 
    LDA.B $12 : STA.W $0755 

.topOfBeams:
    LDX.W #$0000 
    JSR.W EquipmentScreen_MoveLowerOnBeams 
    BRA .return 


.leftEnd:
    BIT.W #$0800 
    BNE .up 
    BIT.W #$0400 
    BEQ .return 
    LDA.W $0755 : AND.W #$FF00 
    CMP.W #$0500 : BEQ .moveToBoots 
    LDA.W $0755 : CLC : ADC.W #$0100 : STA.W $0755 
    XBA 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W EquipmentScreen_MoveLowerOnSuitsMisc 
    CMP.W #$FFFF : BNE .return 

.moveToBoots:
    LDX.W #$0000 
    JSR.W EquipmentScreen_MoveLowerOnBoots 
    BRA .return 


.up:
    LDA.W $0755 : AND.W #$FF00 
    BEQ .return 
    LDA.W $0755 : SEC : SBC.W #$0100 : STA.W $0755 
    XBA 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W EquipmentScreen_MoveHigherOnSuitsMisc 

.return:
    PLP 
    RTS 


EquipmentScreen_Main_Boots:
    PHP 
    REP #$30 
    JSR.W EquipmentScreen_Main_Boots_MoveResponse 
    LDA.W #$0012 : STA.B $18 
    JSR.W EquipmentScreen_Main_ButtonResponse 
    PLP 
    RTS 


EquipmentScreen_Main_Boots_MoveResponse:
    PHP 
    REP #$30 
    LDA.W $0755 : STA.B $12 
    LDA.B $8F : BIT.W #$0200 
    BEQ .leftEnd 
    BIT.W #$0800 
    BNE .moveToReserve 
    LDX.W #$0008 
    JSR.W EquipmentScreen_MoveHigherOnBeams 
    CMP.W #$FFFF : BNE .return 

.moveToReserve:
    LDX.W #$0000 
    JSR.W EquipmentScreen_MoveToReserveTanks 
    CMP.W #$0000 : BNE .return 
    LDA.B $12 : STA.W $0755 
    BRA .return 


.leftEnd:
    BIT.W #$0400 
    BNE .down 
    BIT.W #$0800 
    BEQ .return 
    LDA.W $0755 : AND.W #$FF00 
    BEQ .moveToSuitsMisc 
    LDA.W $0755 : SEC : SBC.W #$0100 : STA.W $0755 
    XBA 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W EquipmentScreen_MoveHigherOnBoots 
    CMP.W #$FFFF : BNE .return 

.moveToSuitsMisc:
    LDX.W #$000A 
    JSR.W EquipmentScreen_MoveHigherOnSuitsMisc 
    BRA .return 


.down:
    LDA.W $0755 : CMP.W #$0203 : BEQ .return 
    LDA.W $0755 : CLC : ADC.W #$0100 : STA.W $0755 
    XBA 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W EquipmentScreen_MoveLowerOnBoots 

.return:
    PLP 
    RTS 


EquipmentScreen_WriteSamusWireframeTilemap_and_BG1ToVRAM:
    PHP 
    REP #$30 
    JSR.W EquipmentScreen_WriteSamusWireframeTilemap 
    LDX.W $0330 
    LDA.W #$0500 : STA.B $D0,X 
    INX #2
    LDA.W #$3900 : STA.B $D0,X 
    INX #2
    SEP #$20 
    LDA.B #$7E : STA.B $D0,X 
    REP #$20 
    INX 
    LDA.W #$3080 : STA.B $D0,X 
    INX #2
    STX.W $0330 
    PLP 
    RTS 


EquipmentScreen_WriteSamusWireframeTilemap:
    PHP 
    REP #$30 
    LDA.W $09A2 : AND.W #$0101 
    LDX.W #$0000 

.loopSuit:
    CMP.W .bitmaps,X : BEQ + 
    INX #2
    BRA .loopSuit 


  + LDA.W .addresses,X : STA.B $00 
    LDA.W #$0082 : STA.B $02 
    LDA.W #$0011 : STA.B $14 
    LDY.W #$0000 
    LDX.W #$01D8 

.loopRow:
    PHX 
    LDA.W #$0008 : STA.B $12 

.loop:
    LDA.B [$00],Y : STA.L $7E3800,X 
    INX #2
    INY #2
    DEC.B $12 
    BNE .loop 
    PLX 
    TXA 
    CLC : ADC.W #$0040 : TAX 
    DEC.B $14 
    BNE .loopRow 
    PLP 
    RTS 


.bitmaps:
    dw $0000,$0100,$0001,$0101 

.addresses:
    dw Samus_Wireframe_Tilemaps_powerSuit 
    dw Samus_Wireframe_Tilemaps_hiJumpBoots 
    dw Samus_Wireframe_Tilemaps_variaSuit 
    dw Samus_Wireframe_Tilemaps_hiJumpBootsVariaSuit 

EquipmentScreen_DrawItemSelector:
    PHP 
    REP #$30 
    LDA.W $09A8 
    ORA.W $09A4 
    ORA.W $09D4 
    BEQ .return 
    LDA.W $0755 : AND.W #$00FF 
    ASL A 
    TAX 
    LDA.W EquipmentScreen_ItemSelectorPositions_pointers,X : STA.B $12 
    LDA.W $0755 
    XBA 
    AND.W #$00FF 
    ASL #2
    CLC : ADC.B $12 : TAY 
    LDA.W $0000,Y 
    TAX 
    DEX 
    INY #2
    LDA.W $0000,Y 
    TAY 
    LDA.W #$0003 : JSR.W Draw_PauseScreen_SpriteAnimation 

.return:
    PLP 
    RTS 


EquipmentScreen_DisplayReserveTankAmount_shell:
    PHP 
    REP #$30 
    JSR.W EquipmentScreen_DisplayReserveTankAmount 
    PLP 
    RTS 


EquipmentScreen_DisplayReserveTankAmount:
    PHP 
    REP #$30 
    STZ.B $03 
    JSR.W EquipmentScreen_Main_DisplayReserves_PaletteSetup 
    STZ.B $34 
    LDA.W $09D4 : BNE + 
    PLP 
    RTS 


  + STA.W $4204 
    SEP #$20 
    LDA.B #$64 : STA.W $4206 
    REP #$20 
    NOP #7
    LDA.W $4214 : STA.B $2C 
    LDA.W $09D6 : STA.W $4204 
    SEP #$20 
    LDA.B #$64 : STA.W $4206 
    REP #$20 
    NOP #7
    LDA.W $4216 : STA.B $32 
    LDA.W $4214 : STA.B $2A 
    STA.B $30 
    STA.B $2E 
    BEQ .empty 
    LDY.W #$0000 

.loopFullTanks:
    PHY 
    LDA.W EquipmentScreen_ReserveTank_Xpositions,Y 
    TAX 
    LDY.W EquipmentScreen_ReserveTank_Yposition 
    DEY 
    LDA.W #$001B : JSL.L AddSpritemapFrom_82C569_TableToOAM 
    PLY 
    INY #2
    DEC.B $2E 
    BNE .loopFullTanks 
    STY.B $34 

.empty:
    LDA.W $4216 : BEQ .loopEmptyTanks 
    STA.W $4204 
    SEP #$20 
    LDA.B #$0E : STA.W $4206 
    REP #$20 
    NOP #7
    LDA.W $4214 
    ASL A 
    TAX 
    CMP.W #$0007 : BPL + 
    LDA.W $4216 : BEQ + 
    LDA.W $05B5 : BIT.W #$0004 
    BNE + 
    INX #2
    + LDA.W $09D6 : CMP.W #$0064 : BMI + 
    TXA 
    CLC : ADC.W #$0010 : TAX 

  + LDA.W .spritemapIDs,X 
    PHA 
    LDX.B $34 
    LDA.W EquipmentScreen_ReserveTank_Xpositions,X 
    TAX 
    LDY.W EquipmentScreen_ReserveTank_Yposition 
    DEY 
    PLA 
    JSL.L AddSpritemapFrom_82C569_TableToOAM 
    INC.B $30 
    INC.B $34 
    INC.B $34 

.loopEmptyTanks:
    LDX.B $34 
    LDA.B $30 : CMP.B $2C : BPL + 
    LDA.W EquipmentScreen_ReserveTank_Xpositions,X 
    TAX 
    LDY.W EquipmentScreen_ReserveTank_Yposition 
    DEY 
    LDA.W #$0020 : JSL.L AddSpritemapFrom_82C569_TableToOAM 
    INC.B $34 
    INC.B $34 
    INC.B $30 
    BRA .loopEmptyTanks 


  + LDX.B $34 
    LDA.W EquipmentScreen_ReserveTank_Xpositions,X 
    TAX 
    LDY.W EquipmentScreen_ReserveTank_Yposition 
    DEY 
    LDA.W #$001F : JSL.L AddSpritemapFrom_82C569_TableToOAM 
    SEP #$20 
    LDA.B $32 : STA.W $4204 
    LDA.B $33 : STA.W $4205 
    LDA.B #$0A : STA.W $4206 
    REP #$20 
    NOP #7
    LDA.W $4216 : CLC : ADC.W #$0804 : STA.L $7E3B14 
    LDA.W $4214 : CLC : ADC.W #$0804 : STA.L $7E3B12 
    LDA.B $2A : CLC : ADC.W #$0804 : STA.L $7E3B10 
    PLP 
    RTS 


.spritemapIDs:
; Partial reserve tank spritemap IDs (for $82:C569 table)
    dw $0020,$0021,$0022,$0023,$0024,$0025,$0026,$0027 ; [Samus reserve health] < 100
    dw $0020,$0021,$0022,$0023,$0024,$0025,$0026,$0027 ; [Samus reserve health] >= 100

EquipmentScreen_Main_DisplayReserves_PaletteSetup:
    PHP 
    REP #$30 
    LDA.W #$0600 : STA.B $03 
    LDA.W $09D6 : BEQ .return 
    DEC.W $072F 
    BEQ .incrementAnimationFrame 
    BPL .positive 

.incrementAnimationFrame:
    LDA.W $0743 
    INC A 
    STA.W $0743 
    ASL A 
    TAX 
    LDA.W ReserveTank_AnimationData,X : AND.W #$00FF 
    CMP.W #$00FF : BNE .animationTimer 
    STZ.W $0743 
    LDA.W ReserveTank_AnimationData : AND.W #$00FF 

.animationTimer:
    STA.W $072F 

.positive:
    LDA.W $0743 
    ASL A 
    INC A 
    TAX 
    LDA.W #$0003 
    ASL A 
    TAX 
    LDA.W SpritePalette_IndexValues,X : STA.B $03 

.return:
    PLP 
    RTS 


EquipmentScreen_MoveToReserveTanks:
    PHP 
    REP #$30 
    LDA.W $09D4 : BEQ .return 
    STZ.W $0755 
    LDA.W #$0037 : JSL.L QueueSound_Lib1_Max6 
    LDA.W #$0001 

.return:
    PLP 
    RTS 


EquipmentScreen_MoveLowerOnBeams:
    PHP 
    REP #$30 
    LDA.W $0A76 : BNE .cancel 

.loop:
    LDA.W $09A8 : BIT.W EquipmentScreenData_EquipmentBitmasks_weapons,X 
    BNE .found 
    INX #2
    CPX.W #$000A 
    BMI .loop 

.cancel:
    LDA.B $12 : STA.W $0755 
    BRA .return 


.found:
    TXA 
    LSR A 
    XBA 
    AND.W #$FF00 
    ORA.W #$0001 
    STA.W $0755 
    LDA.W #$0037 : JSL.L QueueSound_Lib1_Max6 

.return:
    PLP 
    RTS 


EquipmentScreen_MoveHigherOnBeams:
    PHP 
    REP #$30 
    LDA.W $0A76 : BNE .cancel 

.loop:
    LDA.W $09A8 : BIT.W EquipmentScreenData_EquipmentBitmasks_weapons,X 
    BNE .found 
    DEX #2
    BPL .loop 

.cancel:
    LDA.W #$FFFF : BRA .return 


.found:
    LDA.W #$0037 : JSL.L QueueSound_Lib1_Max6 
    TXA 
    LSR A 
    XBA 
    AND.W #$FF00 
    ORA.W #$0001 
    STA.W $0755 

.return:
    PLP 
    RTS 


EquipmentScreen_MoveLowerOnSuitsMisc:
    PHP 
    REP #$30 

.loop:
    LDA.W $09A4 : BIT.W EquipmentScreenData_EquipmentBitmasks_suitsMisc,X 
    BNE + 
    INX #2
    CPX.W #$000A ; Bug: $B4C4 should be CPX #$000C. Can't access Screw Attack without Spring Ball or Boots
    BMI .loop 
    LDA.W #$FFFF : BRA .return 


  + LDA.W #$0037 : JSL.L QueueSound_Lib1_Max6 
    TXA 
    LSR A 
    XBA 
    AND.W #$FF00 
    ORA.W #$0002 
    STA.W $0755 
    LDA.W #$0000 

.return:
    PLP 
    RTS 


EquipmentScreen_MoveHigherOnSuitsMisc:
    PHP 
    REP #$30 

.loop:
    LDA.W $09A4 : BIT.W EquipmentScreenData_EquipmentBitmasks_suitsMisc,X 
    BNE + 
    DEX #2
    BPL .loop 
    LDA.B $12 : STA.W $0755 
    BRA .return 


  + LDA.W #$0037 : JSL.L QueueSound_Lib1_Max6 
    TXA 
    LSR A 
    XBA 
    AND.W #$FF00 
    ORA.W #$0002 
    STA.W $0755 

.return:
    PLP 
    RTS 


EquipmentScreen_MoveLowerOnBoots:
    PHP 
    REP #$30 

.loop:
    LDA.W $09A4 : BIT.W EquipmentScreenData_EquipmentBitmasks_boots,X 
    BNE + 
    INX #2
    CPX.W #$0006 
    BMI .loop 
    LDA.B $12 : STA.W $0755 
    BRA .return 


  + LDA.W #$0037 : JSL.L QueueSound_Lib1_Max6 
    TXA 
    LSR A 
    XBA 
    AND.W #$FF00 
    ORA.W #$0003 
    STA.W $0755 

.return:
    PLP 
    RTS 


EquipmentScreen_MoveHigherOnBoots:
    PHP 
    REP #$30 

.loop:
    LDA.W $09A4 : BIT.W EquipmentScreenData_EquipmentBitmasks_boots,X 
    BNE + 
    DEX #2
    BPL .loop 
    LDA.W #$FFFF : BRA .return 


  + LDA.W #$0037 : JSL.L QueueSound_Lib1_Max6 
    TXA 
    LSR A 
    XBA 
    AND.W #$FF00 
    ORA.W #$0003 
    STA.W $0755 

.return:
    PLP 
    RTS 


EquipmentScreen_Main_ButtonResponse:
    PHP 
    REP #$30 
    LDA.B $8F : BIT.W #$0080 
    BNE + 
    PLP 
    RTS 


  + LDA.W #$0038 : JSL.L QueueSound_Lib1_Max6 
    LDA.W $0755 : AND.W #$00FF 
    ASL A 
    TAX 
    STA.B $1A 
    LDA.W $0755 
    XBA 
    AND.W #$00FF 
    ASL A 
    STA.B $12 
    LDA.W EquipmentScreenDataPointers_tilemapOffsets,X : CLC : ADC.B $12 : TAY 
    LDA.W $0000,Y : STA.B $00 
    LDA.W EquipmentScreenDataPointers_equipmentBitmasks,X 
    TAY 
    LDA.W EquipmentScreenDataPointers_listsEquipmentBitmasks,X : CLC : ADC.B $12 : TAX 
    LDA.W $0000,Y : BIT.W $0000,X 
    BNE + 
    ORA.W $0000,X 
    STA.W $0000,Y 
    LDA.B $18 : STA.B $16 
    LDX.B $1A 
    LDA.W EquipmentScreenDataPointers_listsPointsToEquipmentTilemaps,X : CLC : ADC.B $12 : TAY 
    LDA.W $0000,Y 
    TAX 
    JSR.W Copy_Bytes_from_X_to_7ERAM 
    BRA .return 


  + LDA.W $0000,X : EOR.W #$FFFF : STA.B $12 
    LDA.W $0000,Y : AND.B $12 : STA.W $0000,Y 
    LDA.W #$0C00 : STA.B $12 
    LDA.B $18 : STA.B $16 
    JSR.W Copy_Bytes_of_Palette_from_7E_to_12 

.return:
    PLP 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_ConvertAToThreeDecimalDigits:
    PHP 
    REP #$30 
    STA.B $18 
    STZ.B $12 
    STZ.B $14 
    STZ.B $16 

  - LDA.B $18 : SEC : SBC.W #$0064 : STA.B $18 
    BMI + 
    INC.B $16 
    BRA - 


  + CLC : ADC.W #$0064 : STA.B $18 

  - LDA.B $18 : SEC : SBC.W #$000A : STA.B $18 
    BMI + 
    INC.B $14 
    BRA - 


  + CLC : ADC.W #$000A : STA.B $18 

  - LDA.B $18 : SEC : SBC.W #$0001 : STA.B $18 
    BMI .return 
    INC.B $12 
    BRA - 


.return:
    PLP 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Draw_PauseMenu_during_FadeIn:
    PHP : PHB : PHK : PLB 
    REP #$30 
    LDA.W $0753 
    LDA.W $0727 : BEQ .mapScreen 
    JSR.W EquipmentScreen_DrawItemSelector 
    JSR.W EquipmentScreen_DisplayReserveTankAmount_shell 
    PLB : PLP 
    RTL 


.mapScreen:
    JSR.W MapScreen_DrawSamusPositionIndicator 
    JSL.L Draw_Map_Icons 
    JSL.L Display_Map_Elevator_Destinations 
    PLB : PLP 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_82B650:
    PHP : PHB : PHK : PLB 
    REP #$30 
    LDA.W $0753 : BNE + 
    JSR.W EquipmentScreen_DrawItemSelector 
    JSR.W EquipmentScreen_DisplayReserveTankAmount_shell 
    PLB : PLP 
    RTL 


  + JSL.L Display_Map_Elevator_Destinations 
    JSR.W MapScreen_DrawSamusPositionIndicator 
    JSL.L Draw_Map_Icons 
    PLB : PLP 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Draw_Map_Icons:
    PHB 
    REP #$30 
    PHK : PLB 
    LDX.W #MapIcon_PositionTablePointers_bossIcons 
    LDA.W #$0009 : JSR.W Display_Map_Boss_Icons 
    LDA.W #$0E00 : STA.B $03 
    LDX.W #MapIcon_PositionTablePointers_missileStations 
    LDA.W #$000B : JSR.W Draw_Simple_MapIcons 
    LDX.W #MapIcon_PositionTablePointers_energyStations 
    LDA.W #$000A : JSR.W Draw_Simple_MapIcons 
    LDX.W #MapIcon_PositionTablePointers_mapStations 
    LDA.W #$004E : JSR.W Draw_Simple_MapIcons 
    LDA.W #$0400 : STA.B $03 
    LDX.W #MapIcon_PositionTablePointers_savePoints 
    LDA.W #$0008 : JSR.W Draw_SaveStation_MapIcons 
    LDA.W $05D1 : BEQ + 
    LDX.W #MapIcon_PositionTablePointers_debugSavePoints 
    LDA.W #$0008 : JSR.W Draw_Simple_MapIcons 

  + LDA.W $079F : BNE .return 
    LDA.W #$0E00 : STA.B $03 
    LDA.W Crateria_MapIconPositions_savePoints2 : SEC : SBC.B $B3 : TAY 
    LDA.W Crateria_MapIconPositions_savePoints : SEC : SBC.B $B1 : TAX 
    LDA.W #$0063 : JSL.L AddSpritemapFrom_82C569_TableToOAM 

.return:
    PLB 
    RTL 


Draw_FileSelectMap_Icons:
    PHB 
    REP #$30 
    PHK : PLB 
    JSR.W Handle_PauseScreen_PaletteAnimation 
    LDX.W #MapIcon_PositionTablePointers_bossIcons 
    LDA.W #$0009 : JSR.W Display_Map_Boss_Icons 
    LDA.W #$0E00 : STA.B $03 
    LDX.W #MapIcon_PositionTablePointers_missileStations 
    LDA.W #$000B : JSR.W Draw_Simple_MapIcons 
    LDX.W #MapIcon_PositionTablePointers_energyStations 
    LDA.W #$000A : JSR.W Draw_Simple_MapIcons 
    LDX.W #MapIcon_PositionTablePointers_mapStations 
    LDA.W #$004E : JSR.W Draw_Simple_MapIcons 
    LDA.W #$0E00 : STA.B $03 
    JSR.W Update_Samus_Position_Indicator_Animation 
    PHA 
    LDA.W #$0082 : STA.B $02 
    LDA.W $079F 
    ASL A 
    TAX 
    LDA.W MapIcon_PositionTablePointers_savePoints,X : STA.B $00 
    LDA.W $078B 
    ASL #2
    TAY 
    LDA.B [$00],Y : SEC : SBC.B $B1 : TAX 
    PHX 
    INY #2
    LDA.B [$00],Y : SEC : SBC.B $B3 : TAY 
    PHY 
    LDA.W $077A : BIT.W #$0001 
    BNE + 
    LDA.W #$0012 : JSL.L AddSpritemapFrom_82C569_TableToOAM 

  + PLY : PLX : PLA 
    JSL.L AddSpritemapFrom_82C569_TableToOAM 
    LDA.W $05D1 : BEQ + 
    LDA.W #$0600 : STA.B $03 
    LDX.W #MapIcon_PositionTablePointers_savePoints 
    LDA.W #$000C : JSR.W Draw_Debug_Save_MapIcons 
    LDX.W #MapIcon_PositionTablePointers_debugElevatorMarkers 
    LDA.W #$0017 : JSR.W Draw_Debug_Elevator_Map_Icons 
    LDX.W #MapIcon_PositionTablePointers_debugSavePoints 
    LDA.W #$000C : JSR.W Draw_Simple_MapIcons 

  + LDA.W $079F : BNE .return 
    LDA.W #$0E00 : STA.B $03 
    LDA.W Crateria_MapIconPositions_savePoints2 : SEC : SBC.B $B3 : TAY 
    LDA.W Crateria_MapIconPositions_savePoints : SEC : SBC.B $B1 : TAX 
    LDA.W #$0063 : JSL.L AddSpritemapFrom_82C569_TableToOAM 

.return:
    PLB 
    RTL 


Draw_SaveStation_MapIcons:
    STX.B $20 
    STA.B $22 
    LDA.W $079F : CMP.L $7ED918 : BNE .return 
    ASL A 
    TAX 
    LDA.L $7ED8F8,X : STA.B $24 
    SEP #$20 
    LDX.W $078B 
    LDA.W .bits,X : AND.B $24 : STA.B $24 
    REP #$20 
    LDA.W $079F 
    ASL A 
    CLC : ADC.B $20 : TAX 
    LDA.W $0000,X : BNE Draw_MapIcons_ofGivenType 

.return:
    RTS 


.bits:
    db $01,$02,$04,$08,$10,$20,$40,$80 

Draw_Debug_Save_MapIcons:
    STX.B $20 
    STA.B $22 
    LDA.W $079F 
    ASL A 
    TAX 
    LDA.L $7ED8F8,X : STA.B $24 
    TXA 
    CLC : ADC.B $20 : TAX 
    LDA.W $0000,X : BNE Draw_MapIcons_ofGivenType 
    RTS 


Draw_Debug_Elevator_Map_Icons:
    STX.B $20 
    STA.B $22 
    LDA.W $079F 
    ASL A 
    TAX 
    LDA.L $7ED8F9,X : STA.B $24 
    TXA 
    CLC : ADC.B $20 : TAX 
    LDA.W $0000,X : BNE Draw_MapIcons_ofGivenType 
    RTS 


Draw_Simple_MapIcons:
    STX.B $20 
    STA.B $22 
    LDA.W #$FFFF : STA.B $24 
    LDA.W $079F 
    ASL A 
    CLC : ADC.B $20 : TAX 
    LDA.W $0000,X : BNE Draw_MapIcons_ofGivenType 
    RTS 


Draw_MapIcons_ofGivenType:
    TAX 

.loop:
    LDA.W $0000,X : BIT.W #$8000 
    BNE .return 
    LSR.B $24 
    BCC .next 
    PHX 
    LDA.W $0002,X 
    TAY 
    LDA.W $0000,X 
    TAX 
    JSR.W Check_if_MapPosition_isExplored 
    BEQ .restoreX 
    PLX : PHX 
    LDA.W $0002,X : SEC : SBC.B $B3 : TAY 
    LDA.W $0000,X : SEC : SBC.B $B1 : TAX 
    LDA.B $22 : JSL.L AddSpritemapFrom_82C569_TableToOAM 

.restoreX:
    PLX 

.next:
    INX #4
    BRA .loop 


.return:
    RTS 


Check_if_MapPosition_isExplored:
    TXA 
    AND.W #$FF00 
    LSR A 
    STA.B $12 
    TXA 
    AND.W #$00FF 
    LSR #6
    CLC : ADC.B $12 : STA.B $12 
    TYA 
    AND.W #$FFF8 
    LSR A 
    CLC : ADC.B $12 : STA.B $12 
    TXA 
    LSR #3
    AND.W #$0007 
    TAX 
    LDY.B $12 
    SEP #$20 
    LDA.W $07F7,Y : BIT.W .bits,X 
    REP #$20 
    RTS 


.bits:
    db $80,$40,$20,$10,$08,$04,$02,$01 

Display_Map_Boss_Icons:
    STX.B $20 
    STA.B $22 
    LDX.W $079F 
    LDA.L $7ED828,X : AND.W #$00FF : STA.B $24 
    LDA.W $079F 
    ASL A 
    CLC : ADC.B $20 : TAX 
    LDA.W $0000,X : BEQ .return 
    TAX 

.bossIcons:
    LDA.W $0000,X : CMP.W #$FFFF : BEQ .return 
    CMP.W #$FFFE : BEQ .skip 
    LDA.W #$0E00 : STA.B $03 
    LSR.B $24 
    BCS .bossDead 
    LDA.W $0789 : BEQ .skip 

.drawBossIcon:
    PHX 
    LDA.W $0002,X : SEC : SBC.B $B3 : TAY 
    LDA.W $0000,X : SEC : SBC.B $B1 : TAX 
    LDA.B $22 : JSL.L AddSpritemapFrom_82C569_TableToOAM 
    PLX 

.next:
    INX #4
    BRA .bossIcons 


.return:
    RTS 


.skip:
    LSR.B $24 
    BRA .next 


.bossDead:
    PHX 
    LDA.W $0002,X : SEC : SBC.B $B3 : TAY 
    LDA.W $0000,X : SEC : SBC.B $B1 : TAX 
    LDA.W #$0062 : JSL.L AddSpritemapFrom_82C569_TableToOAM 
    PLX 
    LDA.W #$0C00 : STA.B $03 
    BRA .drawBossIcon 


Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction:
    PHX 
    LDA.W $0000,X 
    PHA 
    LDA.W $0002,X 
    TAY 
    LDA.W $0004,X 
    PLX : PHB : PHK : PLB 
    JSR.W Draw_PauseScreen_SpriteAnimation 
    PLB : PLX 
    LDA.W $0006,X : BIT.B $8B 
    BEQ .return 
    LDA.W $05FD : BNE .return 
    LDA.W $0008,X : STA.W $05FD 

.return:
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_REP30_82B932:
    REP #$30 
endif ; !FEATURE_KEEP_UNREFERENCED

Handle_MapScrollArrows:
    PHP : PHB 
    SEP #$20 
    LDA.B #$82 
    PHA : PLB 
    REP #$20 
    LDA.W $05AC : SEC : SBC.W #$0018 : CMP.B $B1 : BPL + 
    LDX.W #MapScrollArrows_left 
    JSL.L Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction 

  + LDA.W $05AE : CLC : ADC.W #$0018 : SEC : SBC.W #$0100 : CMP.B $B1 : BMI + 
    LDX.W #MapScrollArrows_right 
    JSL.L Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction 

  + LDA.W $05B0 : SEC : SBC.W #$0038 : CMP.B $B3 : BPL + 
    LDX.W #MapScrollArrows_up 
    JSL.L Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction 

  + LDA.W $05B2 : SEC : SBC.W #$00B1 : CMP.B $B3 : BMI .cancelScrollDown 
    LDX.W #MapScrollArrows_down 
    JSL.L Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction 

.return:
    PLB : PLP 
    RTL 


.cancelScrollDown:
    LDA.W $05FD : CMP.W MapScrollArrows_downDirection : BNE .return 
    STZ.W $05FB 
    STZ.W $05FD 
    STZ.W $05FF 
    BRA .return 


MapScrollArrows:
  .left
    dw $0010,$0078,$0009,$0200,$0001 
  .right
    dw $00F0,$0078,$0008,$0100,$0002 
  .up
    dw $0080,$0038,$0006,$0800,$0003 
  .down
    dw $0080,$00B8,$0007,$0400 
  .downDirection
    dw $0004 

MapScreen_DrawSamusPositionIndicator:
    LDA.W #$0E00 : STA.B $03 
    JSR.W Update_Samus_Position_Indicator_Animation 
    PHA 
    LDA.W $0AF6 
    XBA 
    AND.W #$00FF 
    CLC : ADC.W $07A1 : ASL #3
    SEC : SBC.B $B1 : TAX 
    LDA.W $0AFA 
    XBA 
    AND.W #$00FF 
    CLC : ADC.W $07A3 : INC A 
    ASL #3
    SEC : SBC.B $B3 : TAY 
    PLA 
    JSL.L AddSpritemapFrom_82C569_TableToOAM 
    RTS 


Update_Samus_Position_Indicator_Animation:
    LDA.W $0778 : BNE .nonZero 
    LDX.W $0776 
    INX #2
    CPX.W #$0008 
    BMI + 
    INC.W $077A 
    LDX.W #$0000 

  + STX.W $0776 
    LDA.W .delays,X : STA.W $0778 

.nonZero:
    DEC A 
    STA.W $0778 
    LDX.W $0776 
    LDA.W .spritemapIDs,X 
    RTS 


.delays:
    db $08,$00,$04,$00,$08,$00,$04,$00 

.spritemapIDs:
    db $5F,$00,$60,$00,$61,$00,$60,$00 ; (into $82:C569 table)

Draw_Border_Around_SAMUS_DATA:
    LDA.W #$0E00 : STA.B $03 
    LDX.W #$0080 
    LDY.W #$0010 
    LDA.W #$0048 : JSL.L AddSpritemapFrom_82C569_TableToOAM 
    RTL 


Draw_Border_Around_DATA_COPY_MODE:
    LDA.W #$0E00 : STA.B $03 
    LDX.W #$0080 
    LDY.W #$0010 
    LDA.W #$0049 : JSL.L AddSpritemapFrom_82C569_TableToOAM 
    RTL 


Draw_Border_Around_DATA_CLEAR_MODE:
    LDA.W #$0E00 : STA.B $03 
    LDX.W #$007C 
    LDY.W #$0010 
    LDA.W #$004A : JSL.L AddSpritemapFrom_82C569_TableToOAM 
    RTL 


Draw_Menu_Selection_Missile:
    PHB : PHK : PLB 
    LDA.W $198D : BEQ + 
    DEC A 
    STA.W $198D 
    BNE + 
    LDA.W $1997 
    INC A 
    AND.W #$0003 
    STA.W $1997 
    ASL A 
    TAY 
    LDA.W .animTimer,Y : STA.W $198D 

  + LDA.W #$0E00 : STA.B $03 
    LDA.W $1997 
    ASL A 
    TAY 
    LDA.W .animFrame,Y 
    PHA 
    LDA.W $19AB 
    TAY 
    LDA.W $19A1 
    TAX 
    PLA : PLB 
    JML.L AddSpritemapFrom_82C569_TableToOAM 


.animTimer:
    dw $0008,$0008,$0008,$0008 

.animFrame:
    dw $0037,$0036,$0035,$0034 

Draw_FileCopy_Arrow:
    PHB : PHK : PLB 
    LDA.W $19B7 : SEC : SBC.W $19B9 : BPL .upwards 
    EOR.W #$FFFF 
    INC A 
    LDX.W #$0000 
    CMP.W #$0002 : BPL .spawnSprite 
    LDX.W #$0006 
    LDA.W $19B7 : BEQ + 
    LDX.W #$000C 

  + BRA .spawnSprite 


.upwards:
    LDX.W #$0012 
    CMP.W #$0002 : BPL .spawnSprite 
    LDX.W #$0018 
    LDA.W $19B7 : CMP.W #$0001 : BEQ .spawnSprite 
    LDX.W #$001E 

.spawnSprite:
    LDA.W #$0200 : STA.B $03 
    LDA.W .tableIndex,X 
    PHA 
    LDA.W .tableYpos,X 
    TAY 
    LDA.W .tableXpos,X 
    TAX 
    PLA : PLB 
    JML.L AddSpritemapFrom_82C569_TableToOAM 


;        _______________ Spritemap index
;       |      _________ X position
;       |     |      ___ Y position
;       |     |     |
.tableIndex:
    dw $0042 
.tableXpos:
    dw       $0014
.tableYpos:
    dw             $0068 ; 0:   A ------> C
    dw $0040,$0014,$0058 ; 6:   A -> B
    dw $0040,$0014,$0078 ; Ch:       B -> C
    dw $0043,$0014,$0068 ; 12h: A <------ C
    dw $0041,$0014,$0058 ; 18h: A <- B
    dw $0041,$0014,$0078 ; 1Eh:      B <- C

Display_Map_Elevator_Destinations:
    REP #$30 
    PHB : PHK : PLB 
    LDA.W #$0000 : STA.B $03 
    LDX.W $079F 
    LDA.L $7ED908,X : AND.W #$00FF 
    BEQ .return 
    LDA.W $079F 
    ASL A 
    TAX 
    LDA.W Map_Elevator_Destinations,X 
    TAX 

.loop:
    LDA.W $0000,X : CMP.W #$FFFF : BEQ .return 
    PHX 
    SEC : SBC.B $B1 : PHA 
    LDA.W $0002,X : SEC : SBC.B $B3 : TAY 
    LDA.W $0004,X 
    PLX 
    JSL.L AddSpritemapFrom_82C569_TableToOAM 
    PLA 
    CLC : ADC.W #$0006 : TAX 
    BRA .loop 


.return:
    PLB 
    RTL 


Handle_GameOver_BabyMetroid:
    PHB 
    REP #$30 
    PHK : PLB 
    LDA.W $0F94 : BEQ Restart_GameOver_BabyMetroid_InstructionList 

Process_GameOver_BabyMetroid_InstructionList:
    LDX.W $0F92 
    DEC A 
    STA.W $0F94 
    BNE Draw_GameOver_BabyMetroid 
    LDA.W $0006,X : CMP.W #$FFFF : BEQ Restart_GameOver_BabyMetroid_InstructionList 
    BMI Goto_A_82BBEB 
    STA.W $0F94 
    TXA 
    CLC : ADC.W #$0006 : STA.W $0F92 
    TAX 

Draw_GameOver_BabyMetroid:
    PHX 
    LDA.W $0004,X 
    TAY 
    LDX.W #$0000 

.loop:
    LDA.W $0000,Y : STA.L $7EC180,X 
    INY #2
    INX #2
    CPX.W #$0020 
    BMI .loop 
    PLX 
    LDA.W #$0800 : STA.B $03 
    LDA.W $0002,X 
    LDX.W #$007C 
    LDY.W #$0050 
    JSL.L AddSpritemapFrom_82C569_TableToOAM 
    LDA.W #$0A00 : STA.B $03 
    LDA.W #$0064 
    LDX.W #$007C 
    LDY.W #$0050 
    JSL.L AddSpritemapFrom_82C569_TableToOAM 
    PLB 
    RTL 


Restart_GameOver_BabyMetroid_InstructionList:
    LDA.W #GameOver_BabyMetroid_InstructionList : STA.W $0F92 
    LDA.W #$000A : STA.W $0F94 
    BRA Process_GameOver_BabyMetroid_InstructionList 


Goto_A_82BBEB:
    STA.B $12 
    JMP.W ($0012) 


FinishProcessing_GameOver_BabyMetroid_ASMInstruction:
    LDX.W $0F92 
    LDA.W $0008,X : STA.W $0F94 
    TXA 
    CLC : ADC.W #$0008 : STA.W $0F92 
    TAX 
    LDA.W $0000,X : CMP.W #$FFFF : BEQ Restart_GameOver_BabyMetroid_InstructionList 
    BRA Draw_GameOver_BabyMetroid 


Instruction_Queue_BabyMetroid_Cry1_SoundEffect:
    LDA.W #$0023 : JSL.L QueueSound_Lib3_Max6 
    BRA FinishProcessing_GameOver_BabyMetroid_ASMInstruction 


Instruction_Queue_BabyMetroid_Cry2_SoundEffect:
    LDA.W #$0026 : JSL.L QueueSound_Lib3_Max6 
    BRA FinishProcessing_GameOver_BabyMetroid_ASMInstruction 


Instruction_Queue_BabyMetroid_Cry3_SoundEffect:
    LDA.W #$0027 : JSL.L QueueSound_Lib3_Max6 
    BRA FinishProcessing_GameOver_BabyMetroid_ASMInstruction 


GameOver_BabyMetroid_InstructionList:
; Positive instruction format: timer, spritemap index for $82:C569 table, palette pointer
    dw $000A,$0065,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0067,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0065,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0067,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0 
    dw $0006,$0065,GameOver_BabyMetroid_Palettes_1 
    dw Instruction_Queue_BabyMetroid_Cry1_SoundEffect 
    dw $0005,$0066,GameOver_BabyMetroid_Palettes_2 
    dw $0004,$0067,GameOver_BabyMetroid_Palettes_3 
    dw $0003,$0066,GameOver_BabyMetroid_Palettes_2 
    dw $0002,$0065,GameOver_BabyMetroid_Palettes_1 
    dw $0003,$0066,GameOver_BabyMetroid_Palettes_2 
    dw $0004,$0067,GameOver_BabyMetroid_Palettes_3 
    dw $0005,$0066,GameOver_BabyMetroid_Palettes_2 
    dw $000A,$0065,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0067,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0065,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0067,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0065,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0067,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0065,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0067,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0 
    dw $0006,$0065,GameOver_BabyMetroid_Palettes_1 
    dw Instruction_Queue_BabyMetroid_Cry2_SoundEffect 
    dw $0005,$0066,GameOver_BabyMetroid_Palettes_2 
    dw $0004,$0067,GameOver_BabyMetroid_Palettes_3 
    dw $0003,$0066,GameOver_BabyMetroid_Palettes_2 
    dw $0002,$0065,GameOver_BabyMetroid_Palettes_1 
    dw $0003,$0066,GameOver_BabyMetroid_Palettes_2 
    dw $0004,$0067,GameOver_BabyMetroid_Palettes_3 
    dw $0005,$0066,GameOver_BabyMetroid_Palettes_2 
    dw $000A,$0065,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0067,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0065,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0067,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0065,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0067,GameOver_BabyMetroid_Palettes_0 
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0 
    dw $0006,$0065,GameOver_BabyMetroid_Palettes_1 
    dw Instruction_Queue_BabyMetroid_Cry3_SoundEffect 
    dw $0005,$0066,GameOver_BabyMetroid_Palettes_2 
    dw $0004,$0067,GameOver_BabyMetroid_Palettes_3 
    dw $0003,$0066,GameOver_BabyMetroid_Palettes_2 
    dw $0002,$0065,GameOver_BabyMetroid_Palettes_1 
    dw $0003,$0066,GameOver_BabyMetroid_Palettes_2 
    dw $0004,$0067,GameOver_BabyMetroid_Palettes_3 
    dw $0005,$0066,GameOver_BabyMetroid_Palettes_2 
    dw $FFFF 

GameOver_BabyMetroid_Palettes_0: 
    dw $3800,$7F50,$2E40,$2DA0,$2D00,$725A,$2C3A,$240F,$1C05,$1800,$639A,$52D3,$420D,$7F66,$7FFA,$7240

GameOver_BabyMetroid_Palettes_1: 
    dw $3800,$6BF5,$06E1,$0641,$05A1,$5E5F,$183F,$1014,$080A,$0404,$4F9F,$3ED8,$2E12,$6F70,$7FFF,$5EE0

GameOver_BabyMetroid_Palettes_2: 
    dw $3800,$77F8,$1344,$12A4,$1204,$6ABF,$249F,$1C77,$146D,$1067,$5BFF,$4B38,$3A72,$7BD3,$7FFF,$6B43

GameOver_BabyMetroid_Palettes_3: 
    dw $3800,$7FFB,$1FA7,$1F07,$1E67,$771F,$30FF,$28DA,$20D0,$1CCA,$67FF,$579B,$46D5,$7BD6,$7FFF,$77A6

Cancel_Sound_Effects:
    REP #$30 
    LDA.W #$0002 : JSL.L QueueSound_Lib1_Max6 
    LDA.W #$0071 : JSL.L QueueSound_Lib2_Max6 
    LDA.W #$0001 : JSL.L QueueSound_Lib3_Max6 
    RTL 


Queue_Samus_Movement_SoundEffects:
    REP #$30 
    LDA.W $0B3E : AND.W #$FF00 
    CMP.W #$0400 : BNE + 
    LDA.W #$002B : JSL.L QueueSound_Lib3_Max6 

  + LDA.W $0CD0 : CMP.W #$0010 : BMI + 
    LDA.W #$0041 : JSL.L QueueSound_Lib1_Max6 

  + LDA.W #$0014 : JSL.L Run_Samus_Command 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_82BE5A:
    REP #$30 
    LDA.W $079F : STA.B $12 
    ASL A 
    CLC : ADC.B $12 : TAX 
    LDA.W AreaMapPointers,X : STA.B $00 
    LDA.W AreaMapPointers+2,X : STA.B $02 
    LDY.W #$0000 

.clear12:
    STZ.B $12 

.loop:
    LDA.B [$00],Y : AND.W #$03FF 
    CMP.W #$001F : BEQ .clc 
    SEC 
    BRA + 


.clc:
    CLC 

  + ROL.B $12 
    INY #2
    TYA 
    AND.W #$000F 
    BNE .loop 
    CPY.W #$1000 

.crash:
    BPL .crash 
    TYA ; dead code
    LSR #4
    TAX 
    SEP #$20 
    LDA.B $12 : STA.W $07F6,X 
    REP #$20 
    BRA .clear12 


UNUSED_82BEA3:
    REP #$30 
    LDX.W #$0600 
    LDA.W #$0000 

.loop:
    STA.L $7E3000,X 
    STA.L $7E4000,X 
    DEX #2
    BPL .loop 
    STA.L $7E4000 
    STA.L $7E4002 
    STA.L $7E4004 
    STZ.W $079F 

.biggerLoop:
    REP #$20 
    LDA.W $079F 
    XBA 
    TAY 
    TAX 
    SEP #$20 
    LDA.B #$FF : STA.B $12 

.middleLoop:
    LDA.W ReserveTank_TransferEnergyPerFrame,Y : BEQ + 
    TYA 
    STA.L $7E3000,X 
    INX 
    PHX 
    LDX.W $079F 
    LDA.L $7E4000,X 
    INC A 
    STA.L $7E4000,X 
    PLX 

  + INY 
    LDA.B $12 
    DEC A 
    STA.B $12 
    CMP.B #$FF : BNE .middleLoop 
    LDA.W $079F 
    INC A 
    STA.W $079F 
    CMP.B #$07 : BMI .biggerLoop 

.crash:
    BRA .crash 
endif ; !FEATURE_KEEP_UNREFERENCED


ReserveTank_TransferEnergyPerFrame:
    dw $0001 

EquipmentScreenTilemaps:
  .modeManual
; MODE[MANUAL]
    dw $2519,$251A,$251B,$3D46,$3D47,$3D48,$3D49 

  .reserveTank
; RESERVE TANK
    dw $3C80,$3C81,$3C82,$3C83,$3C84,$3C85,$3C86 

  .manual
; [MANUAL]
    dw $3D46,$3D47,$3D48,$3D49 

  .auto
; [ AUTO ]
    dw $3D56,$3D57,$3D58,$3D59 

  .charge
; oCHARGE
    dw $08FF,$08D8,$08D9,$08DA,$08E7 

  .ice
; oICE
    dw $08FF,$08DB,$08DC,$08D4,$08D4 

  .wave
; oWAVE
    dw $08FF,$08DD,$08DE,$08DF,$08D4 

  .spazer
; oSPAZER
    dw $08FF,$08E8,$08E9,$08EA,$08EB 

  .plasma
; oPLASMA
    dw $08FF,$08EC,$08ED,$08EE,$08EF 

  .variaSuit
; oVARIA SUIT
    dw $08FF,$0900,$0901,$0902,$0903,$0904,$0905,$08D4,$08D4 

  .gravitySuit
; oGRAVITY SUIT
    dw $08FF,$08D0,$08D1,$08D2,$08D3,$0903,$0904,$0905,$08D4 

  .morphingBall
; oMORPHING BALL
    dw $08FF,$0920,$0921,$0922,$0923,$0917,$0918,$090F,$091F 

  .bombs
; oBOMBS
    dw $08FF,$08D5,$08D6,$08D7,$08D4,$08D4,$08D4,$08D4,$08D4 

  .springBall
; oSPRING BALL
    dw $08FF,$0910,$0911,$0912,$0913,$0914,$0915,$0916,$08D4 

if !FEATURE_KEEP_UNREFERENCED
  .UNUSED
    dw $0000 
endif ; !FEATURE_KEEP_UNREFERENCED

  .screwAttack
; oSCREW ATTACK
    dw $08FF,$08E0,$08E1,$08E2,$08E3,$08E4,$08E5,$08E6,$08D4 

  .hiJumpBoots
; oHI-JUMP BOOTS
    dw $08FF,$0930,$0931,$0932,$0933,$0934,$0935,$0936,$08D4 

  .spaceJump
; oSPACE JUMP
    dw $08FF,$08F0,$08F1,$08F2,$08F3,$08F4,$08F5,$08D4,$08D4 

  .speedBooster
; oSPEED BOOSTER
    dw $08FF,$0924,$0925,$0926,$0927,$0928,$0929,$092A,$092B 

  .hyper
; oHYPER
    dw $08FF,$0937,$0938,$0939,$092F,$08D4,$08D4,$08D4,$08D4 

  .blankPlaceholder
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 

EquipmentScreenDataPointers:
  .tilemapOffsets:
    dw EquipmentScreenData_RAMTilemapOffsets_tanks 
    dw EquipmentScreenData_RAMTilemapOffsets_weapons 
    dw EquipmentScreenData_RAMTilemapOffsets_suitsMisc 
    dw EquipmentScreenData_RAMTilemapOffsets_boots 


  .listsEquipmentBitmasks:
    dw $0000 
    dw EquipmentScreenData_EquipmentBitmasks_weapons 
    dw EquipmentScreenData_EquipmentBitmasks_suitsMisc 
    dw EquipmentScreenData_EquipmentBitmasks_boots 


  .equipmentBitmasks:
;        _____________________ Tanks
;       |      _______________ Weapons
;       |     |      _________ Suit/misc
;       |     |     |      ___ Boots
;       |     |     |     |
    dw $0000,$09A6,$09A2,$09A2 


  .listsPointsToEquipmentTilemaps:
    dw $0000 
    dw EquipmentScreenData_PointersEquipmentTIlemaps_weapons 
    dw EquipmentScreenData_PointersEquipmentTIlemaps_suitsMisc 
    dw EquipmentScreenData_PointersEquipmentTIlemaps_boots 

EquipmentScreenData:
  .EquipmentBitmasks
  ..weapons 
    dw $1000 ; Weapons - charge
    dw $0002 ; Weapons - ice
    dw $0001 ; Weapons - wave
    dw $0004 ; Weapons - spazer
    dw $0008 ; Weapons - plasma

  ..suitsMisc 
    dw $0001 ; Suit/misc - varia suit
    dw $0020 ; Suit/misc - gravity suit
    dw $0004 ; Suit/misc - morph ball
    dw $1000 ; Suit/misc - bombs
    dw $0002 ; Suit/misc - spring ball
    dw $0008 ; Suit/misc - screw attack

  ..boots 
    dw $0100 ; Boots - hi-jump boots
    dw $0200 ; Boots - space jump
    dw $2000 ; Boots - speed booster

  .RAMTilemapOffsets 
  ..tanks
    dw $3A88 ; Tanks - mode
    dw $3AC8 ; Tanks - reserve tank

  ..weapons 
    dw $3C08 ; Weapons - char
    dw $3C48 ; Weapons - ice
    dw $3C88 ; Weapons - wave
  ...spazer 
    dw $3CC8 ; Weapons - spazer
  ...plasma 
    dw $3D08 ; Weapons - plasma

  ..suitsMisc 
    dw $3A6A ; Suit/misc - varia suit
    dw $3AAA ; Suit/misc - gravity suit
    dw $3B6A ; Suit/misc - morph ball
    dw $3BAA ; Suit/misc - bombs
    dw $3BEA ; Suit/misc - spring ball
    dw $3C2A ; Suit/misc - screw attack

  ..boots 
    dw $3CEA ; Boots - hi-jump boots
    dw $3D2A ; Boots - space jump
    dw $3D6A ; Boots - speed booster

EquipmentScreenData_PointersEquipmentTIlemaps_tanks:
    dw EquipmentScreenTilemaps_modeManual 

EquipmentScreenData_PointersEquipmentTIlemaps_tanksReserve:
    dw EquipmentScreenTilemaps_reserveTank 

EquipmentScreenData_PointersEquipmentTIlemaps_weapons:
    dw EquipmentScreenTilemaps_charge 
    dw EquipmentScreenTilemaps_ice 
    dw EquipmentScreenTilemaps_wave 
    dw EquipmentScreenTilemaps_spazer 
    dw EquipmentScreenTilemaps_plasma 

EquipmentScreenData_PointersEquipmentTIlemaps_suitsMisc:
    dw EquipmentScreenTilemaps_variaSuit 
    dw EquipmentScreenTilemaps_gravitySuit 
    dw EquipmentScreenTilemaps_morphingBall 
    dw EquipmentScreenTilemaps_bombs 
    dw EquipmentScreenTilemaps_springBall 
    dw EquipmentScreenTilemaps_screwAttack 

EquipmentScreenData_PointersEquipmentTIlemaps_boots:
    dw EquipmentScreenTilemaps_hiJumpBoots 
    dw EquipmentScreenTilemaps_spaceJump 
    dw EquipmentScreenTilemaps_speedBooster 

HyperBeamTilemaps:
    dw EquipmentScreenTilemaps_blankPlaceholder 
    dw EquipmentScreenTilemaps_blankPlaceholder 
    dw EquipmentScreenTilemaps_hyper 
    dw EquipmentScreenTilemaps_blankPlaceholder 
    dw EquipmentScreenTilemaps_blankPlaceholder  
PauseScreen_SpriteAnimationData:
;        ___________________________________________________ 1: Unused (used for start / L/R button pressed highlight elsewhere)
;       |      _____________________________________________ 2: L/R highlight
;       |     |      _______________________________________ 3: Item selector
;       |     |     |      _________________________________ 4: Unused (used for reserve tank animation elsewhere)
;       |     |     |     |      ___________________________ 5: Unused
;       |     |     |     |     |      _____________________ 6: Map scroll arrow - up
;       |     |     |     |     |     |      _______________ 7: Map scroll arrow - down
;       |     |     |     |     |     |     |      _________ 8: Map scroll arrow - right
;       |     |     |     |     |     |     |     |      ___ 9: Map scroll arrow - left
;       |     |     |     |     |     |     |     |     |
  .timer 
; Pointers to use for animation timer
    dw $0729,$072B,$072D,$072F,$0731,$0733,$0735,$0737,$0739
  .frame 
; Pointers to use for animation frame, indexes animation data
    dw $073D,$073F,$0741,$0743,$0745,$0747,$0749,$074B,$074D
  .mode 
; Pointers to use for animation mode, indexes [$C1E4 + (animation ID) * 2]
    dw $0751,$0753,$0755,$0757,$0759,$075B,$075D,$075F,$0761
  .data
; Pointers to animation data
    dw Duration_Of_L_R_Button_Pressed_Highlight 
    dw L_R_HighlightAnimationData_PauseScreenPaletteAnimationDelays 
    dw ItemSelector_and_MapScrollArrows 
    dw UNUSED_Animation_4_82C162 
    dw ItemSelector_and_MapScrollArrows 
    dw ItemSelector_and_MapScrollArrows 
    dw ItemSelector_and_MapScrollArrows 
    dw ItemSelector_and_MapScrollArrows 
    dw ItemSelector_and_MapScrollArrows 

SpritePalette_IndexValues:
; Sprite palette index values
    dw $0000,$0200,$0400,$0600,$0800,$0A00,$0C00,$0E00 

Duration_Of_L_R_Button_Pressed_Highlight:
; Duration of L/R button pressed highlight
    dw $0005 

L_R_HighlightAnimationData_PauseScreenPaletteAnimationDelays: 
; FF = loop to start, else timer (1 byte), unknown (1 byte), spritemap ID (1 byte)
; L/R highlight animation data / pause screen palette animation delays
    db $0F,$00,$00, $03,$01,$00, $03,$02,$00, $03,$03,$00, $03,$04,$00
    db $03,$05,$00, $03,$06,$00, $03,$07,$00, $03,$06,$00, $03,$05,$00
    db $03,$04,$00, $03,$03,$00, $03,$02,$00, $03,$01,$00, $FF

ItemSelector_and_MapScrollArrows: 
; Item selector and map scroll arrows
    db $0F,$00,$00, $02,$01,$00, $02,$02,$00, $02,$03,$00, $02,$04,$00
    db $02,$05,$00, $02,$06,$00, $02,$07,$00, $02,$06,$00, $02,$05,$00
    db $02,$04,$00, $02,$03,$00, $02,$02,$00, $02,$01,$00, $FF

UNUSED_Animation_4_82C162:
    db $02,$07,$FF 

ReserveTank_AnimationData: 
; Reserve tank animation data
; FF = loop to start, else timer (1 byte), unknown (1 byte)
    db $0F,$00, $02,$01, $02,$02, $02,$03, $02,$04, $02,$05, $02,$06
    db $02,$07, $02,$06, $02,$05, $02,$04, $02,$03, $02,$02, $02,$01
    db $FF

L_R_ButtonPressed_HighlightTable:
  .spritemapID
; L/R button pressed highlight table
;        ________ L button
;       |     ___ R button
;       |    |
    dw $0028,$0029 
  .Xpos:
    dw $0018,$00E8 
  .YposPlus1:
    dw $00D0,$00D0 

EquipmentScreen_ItemSelectorPositions:
  .pointers
; Pointers to lists of equipment screen item selector positions
    dw EquipmentScreen_ItemSelectorPositions_tanks 
    dw EquipmentScreen_ItemSelectorPositions_weapons 
    dw EquipmentScreen_ItemSelectorPositions_suitsMisc 
    dw EquipmentScreen_ItemSelectorPositions_boots 

;        _________ X position
;       |      ___ Y position
;       |     |
  .tanks: 
    dw $001B,$0054 ; Tanks - mode
    dw $001B,$005C ; Tanks - reserve tank

  .weapons 
    dw $0030,$0084 ; Weapons - charge
    dw $0030,$008C ; Weapons - ice
    dw $0030,$0094 ; Weapons - wave
    dw $0030,$009C ; Weapons - spazer
    dw $0030,$00A4 ; Weapons - plasma

  .suitsMisc: 
    dw $00CC,$004C ; Suit/misc - varia suit
    dw $00CC,$0054 ; Suit/misc - gravity suit
    dw $00CC,$006C ; Suit/misc - morph ball
    dw $00CC,$0074 ; Suit/misc - bombs
    dw $00CC,$007C ; Suit/misc - spring ball
    dw $00CC,$0084 ; Suit/misc - screw attack

  .boots: 
    dw $00CC,$009C ; Boots - hi-jump boots
    dw $00CC,$00A4 ; Boots - space jump
    dw $00CC,$00AC ; Boots - speed booster

EquipmentScreen_ReserveTank:
  .Xpositions
; Equipment screen reserve tank X positions
    dw $0018,$0020,$0028,$0030,$0038,$0040 

  .Yposition
; Equipment screen reserve tank Y position + 1
    dw $0060 

AnimationSpritemapBaseIDPointers:
; Pointers to animation spritemap base IDs (into $82:C569 table)
    dw UNUSED_Animation_0_82C1F6 
    dw L_R_Highlight_PauseScreenButtonLabelMode 
    dw ItemSelector_EquipmentScreenCategoryIndex 
    dw ItemSelector_EquipmentScreenCategoryIndex_UNUSED_Anim4 
    dw ItemSelector_EquipmentScreenCategoryIndex_UNUSED_Anim5 
    dw ItemSelector_EquipmentScreenCategoryIndex_upScrollArrow 
    dw ItemSelector_EquipmentScreenCategoryIndex_downScrollArrow 
    dw ItemSelector_EquipmentScreenCategoryIndex_rightScrollArrow 
    dw ItemSelector_EquipmentScreenCategoryIndex_leftScrollArrow 

UNUSED_Animation_0_82C1F6:
    dw $0000,$0028,$0029 

L_R_Highlight_PauseScreenButtonLabelMode: 
; L/R highlight (pause screen button label mode)
    dw $002A ; 0: Map screen (SAMUS on the right)
    dw $002A ; 1: Unpausing (nothing)
    dw $002A ; 2: Equipment screen (MAP on the left)

ItemSelector_EquipmentScreenCategoryIndex: 
; Item selector (equipment screen category index)
    dw $0014 ; 0: Tanks
    dw $0015 ; 1: Weapons
    dw $0016 ; 2: Suit
    dw $0016 ; 3: Boots

  .UNUSED_Anim4
    dw $002C 

  .UNUSED_Anim5
    dw $0013 

  .upScrollArrow
    dw $0006 

  .downScrollArrow
    dw $0007 

  .rightScrollArrow
    dw $0004 

  .leftScrollArrow
    dw $0005 

MenuSpritemap_2:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $95)

MenuSpritemap_3:
    dw $0001 
    %spritemapEntry(0, $00, $00, 1, 0, 3, 0, $95)

MenuSpritemap_1:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $94)

MenuSpritemap_0:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 1, 3, 0, $94)

MenuSpritemap_6_MapScrollingArrow_Up:
    dw $0002 
    %spritemapEntry(0, $1FF, $FC, 1, 1, 3, 2, $9D)
    %spritemapEntry(0, $1F8, $FC, 1, 0, 3, 2, $9D)

MenuSpritemap_7_MapScrollingArrow_Down:
    dw $0002 
    %spritemapEntry(0, $1FF, $FC, 0, 1, 3, 2, $9D)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 2, $9D)

MenuSpritemap_5_MapScrollingArrow_Left:
    dw $0002 
    %spritemapEntry(0, $1FC, $00, 1, 1, 3, 2, $9E)
    %spritemapEntry(0, $1FC, $F9, 0, 1, 3, 2, $9E)

MenuSpritemap_4_MapScrollingArrow_Right:
    dw $0002 
    %spritemapEntry(0, $1FC, $00, 1, 0, 3, 2, $9E)
    %spritemapEntry(0, $1FC, $F9, 0, 0, 3, 2, $9E)

MenuSpritemap_10:
    dw $0005 
    %spritemapEntry(0, $1FC, $04, 0, 0, 3, 0, $97)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 0, $86)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 0, $88)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 0, $77)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $87)

MenuSpritemap_11:
    dw $0005 
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 0, $8B)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 0, $89)
    %spritemapEntry(0, $1FC, $04, 0, 0, 3, 0, $9A)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $8A)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 0, $7A)

MenuSpritemap_12_FileSelectMapSamusIcon:
    dw $0001 
    %spritemapEntry(0, $01, $00, 0, 0, 2, 7, $89)

MenuSpritemap_14_EquipmentScreenItemSelector_Tanks:
    dw $0001 
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 3, $46)

MenuSpritemap_19:
    dw $0003 
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $63)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $B9)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $B8)

MenuSpritemap_15_EquipmentScreenItemSelector_Weapons:
    dw $000C 
    %spritemapEntry(0, $10, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $10, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1F0, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1F8, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $00, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $08, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $18, $04, 0, 0, 3, 2, $5E)
    %spritemapEntry(0, $18, $FC, 0, 0, 3, 2, $5D)
    %spritemapEntry(0, $08, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 2, $5B)

MenuSpritemap_16_EquipmentScreenItemSelector_SuitMiscBoots:
    dw $0014 
    %spritemapEntry(0, $1C, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1C, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $04, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $14, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $0C, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $14, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $0C, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1FC, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1DC, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1E4, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1EC, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1F4, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $24, $04, 0, 0, 3, 2, $5E)
    %spritemapEntry(0, $24, $FC, 0, 0, 3, 2, $5D)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1E4, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1DC, $FC, 0, 0, 3, 2, $5B)

MenuSpritemap_1B_FullEquipmentScreenReserveTank:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4E)

MenuSpritemap_1C:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4D)

MenuSpritemap_1A:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4F)

MenuSpritemap_1F_EndOfEquipmentScreenReserveHealthBar:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4E)

MenuSpritemap_1D:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $4D)

MenuSpritemap_1E:
    dw $0001 
    %spritemapEntry(0, $1FD, $FC, 0, 0, 3, 7, $1F0)

MenuSpritemap_8_SaveIcon:
    dw $0001 
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $8D)

MenuSpritemap_9_BossIcon:
    dw $0001 
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $8A)

MenuSpritemap_A_EnergyStationIcon:
    dw $0001 
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $8C)

MenuSpritemap_B_MissileStationIcon:
    dw $0001 
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $8B)

MenuSpritemap_4E_MapStationIcon:
    dw $0001 
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $8E)

MenuSpritemap_17_DebugElevatorIcon:
    dw $0001 
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $8F)

MenuSpritemap_C_DebugSaveIcon:
    dw $0001 
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $1F4)

MenuSpritemap_D:
    dw $0001 
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $1F1)

MenuSpritemap_E:
    dw $0001 
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $1F3)

MenuSpritemap_F:
    dw $0001 
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $1F2)

MenuSpritemap_18:
    dw $0001 
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $1F6)

MenuSpritemap_Unknown_82C3D2:
    dw $0001 
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $1F5)

MenuSpritemap_20_EmptyEquipmentScreenReserveTank:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4D)

MenuSpritemap_21_EquipmentScreen_1_7_ReserveTank:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $47)

MenuSpritemap_22_EquipmentScreen_2_7_ReserveTank:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $48)

MenuSpritemap_23_EquipmentScreen_3_7_ReserveTank:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $49)

MenuSpritemap_24_EquipmentScreen_4_7_ReserveTank:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4A)

MenuSpritemap_25_EquipmentScreen_5_7_ReserveTank:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4B)

MenuSpritemap_26_EquipmentScreen_6_7_ReserveTank:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4C)

MenuSpritemap_27_EquipmentScreen_7_7_ReserveTank:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4E)

MenuSpritemap_4F:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $64)

MenuSpritemap_50:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $65)

MenuSpritemap_51:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $66)

MenuSpritemap_52:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $67)

MenuSpritemap_53:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $68)

MenuSpritemap_54:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $69)

MenuSpritemap_55:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $6A)

MenuSpritemap_56:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $6B)

MenuSpritemap_57:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $6C)

MenuSpritemap_58:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $6D)

MenuSpritemap_Unknown_82C457:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $6E)

MenuSpritemap_Unknown_82C45E:
    dw $0001 
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $6F)

MenuSpritemap_2A_L_R_Highlight:
    dw $0008 
    %spritemapEntry(0, $08, $00, 0, 1, 3, 2, $51)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $43)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 2, $43)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 2, $51)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 2, $3D)
    %spritemapEntry(0, $08, $F8, 0, 1, 3, 2, $3C)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 2, $3D)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 2, $3C)

MenuSpritemap_28_LButtonPressedHighlight:
    dw $0003 
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $29)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 2, $2A)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 2, $28)

MenuSpritemap_29_RButtonPressedHighlight:
    dw $0003 
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $2E)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 2, $2A)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 2, $28)

MenuSpritemap_2B_StartButtonPressedHighlight:
    dw $0008 
    %spritemapEntry(0, $08, $00, 0, 0, 3, 2, $C7)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $C6)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 2, $C5)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 2, $C4)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 2, $B6)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 2, $B5)
    %spritemapEntry(0, $08, $F8, 0, 1, 3, 2, $B4)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 2, $B4)

MenuSpritemap_59_ElevatorDestination_Crateria:
    dw $0004 
    %spritemapEntry(0, $10, $F8, 0, 0, 2, 0, $03)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 0, $02)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $01)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $00)

MenuSpritemap_5A_ElevatorDestination_Brinstar:
    dw $0004 
    %spritemapEntry(0, $10, $F8, 0, 0, 2, 0, $07)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 0, $06)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $05)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $04)

MenuSpritemap_5B_ElevatorDestination_Norfair:
    dw $0004 
    %spritemapEntry(0, $10, $F8, 0, 0, 2, 0, $14)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 0, $13)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $12)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $10)

MenuSpritemap_5E_ElevatorDestination_Tourian:
    dw $0004 
    %spritemapEntry(0, $10, $F8, 0, 0, 2, 0, $32)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 0, $20)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $09)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $08)

MenuSpritemap_5D_ElevatorDestination_Maridia:
    dw $0004 
    %spritemapEntry(0, $10, $F8, 0, 0, 2, 0, $19)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 0, $18)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $16)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $15)

MenuSpritemap_5C_ElevatorDestination_WreckedShip:
    dw $0006 
    %spritemapEntry(0, $04, $00, 0, 0, 2, 0, $45)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $44)
    %spritemapEntry(0, $0C, $F8, 0, 0, 2, 0, $56)
    %spritemapEntry(0, $04, $F8, 0, 0, 2, 0, $55)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 0, $54)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 0, $53)

MenuSpritemap_Pointers:
; Spawned by $81:891F
    dw MenuSpritemap_0 
    dw MenuSpritemap_1 
    dw MenuSpritemap_2 
    dw MenuSpritemap_3 
    dw MenuSpritemap_4_MapScrollingArrow_Right 
    dw MenuSpritemap_5_MapScrollingArrow_Left 
    dw MenuSpritemap_6_MapScrollingArrow_Up 
    dw MenuSpritemap_7_MapScrollingArrow_Down 
    dw MenuSpritemap_8_SaveIcon 
    dw MenuSpritemap_9_BossIcon 
    dw MenuSpritemap_A_EnergyStationIcon 
    dw MenuSpritemap_B_MissileStationIcon 
    dw MenuSpritemap_C_DebugSaveIcon 
    dw MenuSpritemap_D 
    dw MenuSpritemap_E 
    dw MenuSpritemap_F 
    dw MenuSpritemap_10 
    dw MenuSpritemap_11 
    dw MenuSpritemap_12_FileSelectMapSamusIcon 
    dw MenuSpritemap_1E 
    dw MenuSpritemap_14_EquipmentScreenItemSelector_Tanks 
    dw MenuSpritemap_15_EquipmentScreenItemSelector_Weapons 
    dw MenuSpritemap_16_EquipmentScreenItemSelector_SuitMiscBoots 
    dw MenuSpritemap_17_DebugElevatorIcon 
    dw MenuSpritemap_18 
    dw MenuSpritemap_19 
    dw MenuSpritemap_1A 
    dw MenuSpritemap_1B_FullEquipmentScreenReserveTank 
    dw MenuSpritemap_1C 
    dw MenuSpritemap_1F_EndOfEquipmentScreenReserveHealthBar 
    dw MenuSpritemap_1D 
    dw MenuSpritemap_1A 
    dw MenuSpritemap_20_EmptyEquipmentScreenReserveTank 
    dw MenuSpritemap_21_EquipmentScreen_1_7_ReserveTank 
    dw MenuSpritemap_22_EquipmentScreen_2_7_ReserveTank 
    dw MenuSpritemap_23_EquipmentScreen_3_7_ReserveTank 
    dw MenuSpritemap_24_EquipmentScreen_4_7_ReserveTank 
    dw MenuSpritemap_25_EquipmentScreen_5_7_ReserveTank 
    dw MenuSpritemap_26_EquipmentScreen_6_7_ReserveTank 
    dw MenuSpritemap_27_EquipmentScreen_7_7_ReserveTank 
    dw MenuSpritemap_28_LButtonPressedHighlight 
    dw MenuSpritemap_29_RButtonPressedHighlight 
    dw MenuSpritemap_2A_L_R_Highlight 
    dw MenuSpritemap_2B_StartButtonPressedHighlight 
    dw TitleMenuSpritemaps_2C_FileSelectMenu_SamusHelmet_0 
    dw TitleMenuSpritemaps_2D_FileSelectMenu_SamusHelmet_1 
    dw TitleMenuSpritemaps_2E_FileSelectMenu_SamusHelmet_2 
    dw TitleMenuSpritemaps_2F_FileSelectMenu_SamusHelmet_3 
    dw TitleMenuSpritemaps_30_FileSelectMenu_SamusHelmet_4 
    dw TitleMenuSpritemaps_31_FileSelectMenu_SamusHelmet_5 
    dw TitleMenuSpritemaps_32_FileSelectMenu_SamusHelmet_6 
    dw TitleMenuSpritemaps_33_FileSelectMenu_SamusHelmet_7 
    dw TitleMenuSpritemaps_34_MenuSelectionMissile_0 
    dw TitleMenuSpritemaps_35_MenuSelectionMissile_1 
    dw TitleMenuSpritemaps_36_MenuSelectionMissile_2 
    dw TitleMenuSpritemaps_37_MenuSelectionMissile_3 
    dw TitleMenuSpritemaps_38_AreaSelect_PlanetZebes 
    dw TitleMenuSpritemaps_39_AreaSelect_Crateria 
    dw TitleMenuSpritemaps_3A_AreaSelect_Brinstar 
    dw TitleMenuSpritemaps_3B_AreaSelect_Norfair 
    dw TitleMenuSpritemaps_3C_AreaSelect_WreckedShip 
    dw TitleMenuSpritemaps_3D_AreaSelect_Maridia 
    dw TitleMenuSpritemaps_3E_AreaSelect_Tourian 
    dw TitleMenuSpritemaps_3F_82CD67 
    dw TitleMenuSpritemaps_40_FileCopyArrow_OneSlotDown 
    dw TitleMenuSpritemaps_41_FileCopyArrow_OneSlotUp 
    dw TitleMenuSpritemaps_42_FileCopyArrow_TwoSlotsDown 
    dw TitleMenuSpritemaps_43_FileCopyArrow_TwoSlotsUp 
    dw TitleMenuSpritemaps_44_82CF3D 
    dw TitleMenuSpritemaps_45 
    dw TitleMenuSpritemaps_46 
    dw TitleMenuSpritemaps_47 
    dw TitleMenuSpritemaps_48_BorderAround_SAMUS_DATA 
    dw TitleMenuSpritemaps_49_BorderAround_DATA_COPY_MODE 
    dw TitleMenuSpritemaps_4A_BorderAround_DATA_CLEAR_MODE 
    dw TitleMenuSpritemaps_4B_BorderAround_OPTIONS_MODE 
    dw TitleMenuSpritemaps_49_BorderAround_CONTROLLER_SETTING_MODE 
    dw TitleMenuSpritemaps_4D_BorderAround_SPECIAL_SETTING_MODE 
    dw MenuSpritemap_4E_MapStationIcon 
    dw MenuSpritemap_4F 
    dw MenuSpritemap_50 
    dw MenuSpritemap_51 
    dw MenuSpritemap_52 
    dw MenuSpritemap_53 
    dw MenuSpritemap_54 
    dw MenuSpritemap_55 
    dw MenuSpritemap_56 
    dw MenuSpritemap_57 
    dw MenuSpritemap_58 
    dw MenuSpritemap_59_ElevatorDestination_Crateria 
    dw MenuSpritemap_5A_ElevatorDestination_Brinstar 
    dw MenuSpritemap_5B_ElevatorDestination_Norfair 
    dw MenuSpritemap_5C_ElevatorDestination_WreckedShip 
    dw MenuSpritemap_5D_ElevatorDestination_Maridia 
    dw MenuSpritemap_5E_ElevatorDestination_Tourian 
    dw TitleMenuSpritemaps_5F_SamusPositionIndicator_0 
    dw TitleMenuSpritemaps_5F_SamusPositionIndicator_1 
    dw TitleMenuSpritemaps_5F_SamusPositionIndicator_2 
    dw TitleMenuSpritemaps_62_BossCrossOutIcon 
    dw TitleMenuSpritemaps_63_GunshipIcon 
    dw TitleMenuSpritemaps_64_GameOverBabyMetroidContainer 
    dw TitleMenuSpritemaps_65_GameOverBabyMetroid_0 
    dw TitleMenuSpritemaps_66_GameOverBabyMetroid_1 
    dw TitleMenuSpritemaps_67_GameOverBabyMetroid_2 

Dummy_Samus_Wireframe_Tilemap:
    dw $0000,$0000,$0000,$25B3,$65B3,$0000,$0000,$0000 
    dw $25C0,$25C1,$25C2,$25C3,$65C3,$65C2,$65C1,$65C0 
    dw $25D0,$25D1,$25D2,$25D3,$65D3,$65D2,$65D1,$65D0 
    dw $25E0,$25E1,$25EF,$25E3,$25E4,$25E5,$25E6,$25E7 
    dw $25F0,$25F1,$25F2,$25F3,$25F4,$25F5,$65F1,$65F0 
    dw $2600,$2601,$2602,$2603,$2604,$2605,$6601,$6600 
    dw $2610,$2611,$2612,$2613,$2614,$2615,$2616,$2617 
    dw $2620,$2621,$2622,$2623,$2624,$2625,$2626,$2627 
    dw $2630,$2631,$2632,$2633,$6633,$6632,$2636,$2637 
    dw $0000,$25C9,$25CA,$25CB,$65CB,$65CA,$0000,$0000 
    dw $0000,$0000,$25DA,$25DB,$65DB,$65DA,$0000,$0000 
    dw $0000,$25E9,$25EA,$25EB,$65EB,$65EA,$65E9,$0000 
    dw $0000,$25F9,$25FA,$25FB,$65FB,$65FA,$65F9,$0000 
    dw $0000,$2609,$260A,$0000,$0000,$660A,$6609,$0000 
    dw $0000,$2619,$261A,$0000,$0000,$661A,$6619,$0000 
    dw $2628,$2629,$262A,$062B,$462B,$662A,$262C,$262D 
    dw $2638,$2639,$263A,$0000,$0000,$663A,$263C,$6638 

AreaSelect_SpritemapBaseIndex:
    dw $0038 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DPadIcon_SpritemapIndex:
    dw $0044 
endif ; !FEATURE_KEEP_UNREFERENCED

Map_Elevator_Destinations:
    dw SpritemapIndices_crateria 
    dw SpritemapIndices_brinstar 
    dw SpritemapIndices_norfair 
    dw SpritemapIndices_wreckedShip 
    dw SpritemapIndices_maridia 
    dw SpritemapIndices_tourian 

SpritemapIndices:
;        _______________ X position
;       |      _________ Y position
;       |     |      ___ Spritemap index
;       |     |     |
  .crateria 
    dw $0030,$0070,$005A
    dw $00B8,$00B8,$005A
    dw $0110,$0068,$005A
    dw $0178,$0020,$005C
    dw $01A0,$0080,$005D
    dw $FFFF
  .brinstar 
    dw $0048,$0008,$0059
    dw $00D0,$0040,$0059
    dw $0128,$0020,$0059
    dw $0140,$0090,$005D
    dw $0148,$00C0,$005B
    dw $FFFF
  .norfair 
    dw $0050,$0008,$005A
    dw $FFFF
  .wreckedShip 
    dw $0040,$0080,$0059
    dw $00C0,$0080,$0059
    dw $FFFF
  .maridia 
    dw $0108,$0008,$0059
    dw $0030,$00A0,$005A
    dw $0078,$00A0,$005A
    dw $FFFF
  .tourian 
    dw $0098,$0048,$0059
    dw $FFFF

MapIcon_PositionTablePointers:
  .bossIcons
    dw Crateria_MapIconPositions_bossIcons ; Crateria
    dw Brinstar_MapIconPositions_bossIcons ; Brinstar
    dw Norfair_MapIconPositions_bossIcons ; Norfair
    dw WreckedShip_MapIconPositions_bossIcons ; Wrecked Ship
    dw Maridia_MapIconPositions_bossIcons ; Maridia
    dw $0000 ; Tourian
    dw Ceres_MapIconPositions_bossIcons ; Ceres
    dw $0000 ; Debug

  .missileStations
    dw $0000 ; Crateria
    dw Brinstar_MapIconPositions_missileStations ; Brinstar
    dw $0000 ; Norfair
    dw $0000 ; Wrecked Ship
    dw Maridia_MapIconPositions_missileStations ; Maridia
    dw $0000 ; Tourian
    dw $0000 ; Ceres
    dw $0000 ; Debug

  .energyStations
    dw $0000 ; Crateria
    dw Brinstar_MapIconPositions_energyStations ; Brinstar
    dw Norfair_MapIconPositions_energyStations ; Norfair
    dw $0000 ; Wrecked Ship
    dw Maridia_MapIconPositions_energyStations ; Maridia
    dw Tourian_MapIconPositions_energyStations ; Tourian
    dw $0000 ; Ceres
    dw $0000 ; Debug

  .mapStations
    dw Crateria_MapIconPositions_mapStations ; Crateria
    dw Brinstar_MapIconPositions_mapStations ; Brinstar
    dw Norfair_MapIconPositions_mapStations ; Norfair
    dw WreckedShip_MapIconPositions_mapStations ; Wrecked Ship
    dw Maridia_MapIconPositions_mapStations ; Maridia
    dw Tourian_MapIconPositions_mapStations ; Tourian
    dw $0000 ; Ceres
    dw $0000 ; Debug

  .savePoints
    dw Crateria_MapIconPositions_savePoints ; Crateria
    dw Brinstar_MapIconPositions_savePoints ; Brinstar
    dw Norfair_MapIconPositions_savePoints ; Norfair
    dw WreckedShip_MapIconPositions_savePoints ; Wrecked Ship
    dw Maridia_MapIconPositions_savePoints ; Maridia
    dw Tourian_MapIconPositions_savePoints ; Tourian
    dw $0000 ; Ceres
    dw $0000 ; Debug

  .debugElevatorMarkers
    dw Crateria_MapIconPositions_debugElevatorMarkers ; Crateria
    dw Brinstar_MapIconPositions_debugElevatorMarkers ; Brinstar
    dw Norfair_MapIconPositions_debugElevatorMarkers ; Norfair
    dw WreckedShip_MapIconPositions_debugElevatorMarkers ; Wrecked Ship
    dw Maridia_MapIconPositions_debugElevatorMarkers ; Maridia
    dw Tourian_MapIconPositions_debugElevatorMarkers ; Tourian
    dw $0000 ; Ceres
    dw $0000 ; Debug

  .debugSavePoints
    dw Crateria_MapIconPositions_debugSavePoints ; Crateria
    dw Brinstar_MapIconPositions_debugSaveStations ; Brinstar
    dw Norfair_MapIconPositions_debugSavePoints ; Norfair
    dw WreckedShip_MapIconPositions_debugSavePoints ; Wrecked Ship
    dw Maridia_MapIconPositions_debugSavePoints ; Maridia
    dw Tourian_MapIconPositions_debugSavePoints ; Tourian
    dw $0000 ; Ceres
    dw $0000 ; Debug

Crateria_MapIconPositions:
  .bossIcons
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFF 
  .missileStations
    dw $FFFF 
  .energyStations
    dw $FFFF 
  .mapStations
    dw $00B8,$0040, $FFFF 
  .savePoints
    dw $00D8 
  .savePoints2
    dw $0028,$0090, $0038,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE 
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE 
  .debugElevatorMarkers
    dw $01A0,$0058, $0110,$0040, $00B8,$0090, $0030,$0048 
    dw $0088,$0050, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE 
  .debugSavePoints
    dw $00D8,$0028, $0188,$0028, $FFFF 

Brinstar_MapIconPositions:
  .bossIcons
    dw $01BC,$009C, $FFFF 
  .missileStations
    dw $0028,$0040, $FFFF 
  .energyStations
    dw $0048,$0068, $0100,$0098, $01B0,$0098, $FFFF 
  .mapStations
    dw $0028,$0028, $FFFF 
  .savePoints
    dw $0078,$0028, $0040,$0030, $0028,$0060, $0188,$0098 
    dw $0130,$0048, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE 
  .debugElevatorMarkers
    dw $0048,$0018, $00D0,$0058, $0128,$0038, $0148,$0098 
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE 
  .debugSaveStations
    dw $0048,$0018, $01B8,$00A0, $0090,$0020, $FFFF 

Norfair_MapIconPositions:
  .bossIcons
    dw $00B8,$0090, $FFFF 
  .missileStations
    dw $FFFF 
  .energyStations
    dw $00A0,$0050, $00A8,$0080,$FFFF 
  .mapStations
    dw $0048,$0028, $FFFF 
  .savePoints
    dw $0060,$0060, $00A8,$0020, $0058,$0030, $0080,$0048 
    dw $00A0,$0058, $0120,$0068, $FFFE,$FFFE, $FFFE,$FFFE 
  .debugElevatorMarkers
    dw $0050,$0018, $00A8,$0058, $00A8,$0070, $FFFE,$FFFE 
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE 
  .debugSavePoints
    dw $0050,$0010, $0078,$0050, $00B0,$0088, $0050,$0058 
    dw $00A8,$0070, $00A0,$0080, $0010,$0008, $FFFF 

WreckedShip_MapIconPositions:
  .bossIcons
    dw $0098,$00A0, $FFFF 
  .missileStations
    dw $FFFF 
  .energyStations
    dw $FFFF 
  .mapStations
    dw $0068,$00A0, $FFFF 
  .savePoints
    dw $0088,$0078, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE 
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE 
  .debugElevatorMarkers
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE 
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE 
  .debugSavePoints
    dw $0050,$0078, $0090,$00A0, $FFFF 

Maridia_MapIconPositions:
  .bossIcons
    dw $013C,$0054, $FFFF 
  .missileStations
    dw $0130,$0048, $FFFF 
  .energyStations
    dw $0150,$0038, $FFFF 
  .mapStations
    dw $0088,$0090, $FFFF 
  .savePoints
    dw $0060,$00A0, $0118,$0028, $0098,$0060, $0148,$0038 
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE 
  .debugElevatorMarkers
    dw $0110,$0018, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE 
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE 
  .debugSavePoints
    dw $0090,$0028, $0148,$0050, $00B8,$0048, $00B0,$0088 
    dw $FFFF 

Tourian_MapIconPositions:
  .bossIcons
    dw $FFFF 
  .missileStations
    dw $FFFF 
  .energyStations
    dw $0058,$0088, $FFFF 
  .mapStations
    dw $FFFF 
  .savePoints
    dw $0080,$0090, $00A8,$0068, $FFFE,$FFFE, $FFFE,$FFFE 
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE 
  .debugElevatorMarkers
    dw $00A0,$0060, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE 
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE 
  .debugSavePoints
    dw $0088,$0050, $0068,$00C0, $FFFF 

Ceres_MapIconPositions:
  .bossIcons
    dw $00A0,$0088, $FFFF 
  .missileStations
    dw $FFFF 
  .energyStations
    dw $FFFF 
  .mapStations
    dw $FFFF 
  .savePoints
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE 
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE 
  .debugElevatorMarkers
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE 
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE 
  .debugSavePoints
    dw $FFFF 


; Some of these spritemap entries have extra bits set,
; making them incompatible with the spritemapEntry macro
TitleMenuSpritemaps_2C_FileSelectMenu_SamusHelmet_0:
    dw $0004 
    dw $C3FC : db $F4 : dw $3ED1
    dw $C3FC : db $FC : dw $3EE1
    dw $C3F4 : db $FC : dw $3EE0
    dw $C3F4 : db $F4 : dw $3ED0

TitleMenuSpritemaps_2D_FileSelectMenu_SamusHelmet_1:
    dw $0004 
    dw $C3F4 : db $FC : dw $3EE3
    dw $C3F4 : db $F4 : dw $3ED3
    dw $C3FC : db $F4 : dw $3ED4
    dw $C3FC : db $FC : dw $3EE4

TitleMenuSpritemaps_2E_FileSelectMenu_SamusHelmet_2:
    dw $0004 
    dw $C3FC : db $F4 : dw $3ED7
    dw $C3F4 : db $F4 : dw $3ED6
    dw $C3F4 : db $FC : dw $3EE6
    dw $C3FC : db $FC : dw $3EE7

TitleMenuSpritemaps_2F_FileSelectMenu_SamusHelmet_3:
    dw $0006 
    %spritemapEntry(0, $00, $FE, 0, 0, 3, 7, $DA)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 3, 7, $D9)
    dw $C3FC : db $F4 : dw $3ED7
    dw $C3F4 : db $F4 : dw $3ED6
    dw $C3F4 : db $FC : dw $3EE6
    dw $C3FC : db $FC : dw $3EE7

TitleMenuSpritemaps_30_FileSelectMenu_SamusHelmet_4:
    dw $0006 
    %spritemapEntry(0, $00, $FE, 0, 0, 3, 7, $DC)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 3, 7, $DB)
    dw $C3FC : db $F4 : dw $3ED7
    dw $C3F4 : db $F4 : dw $3ED6
    dw $C3F4 : db $FC : dw $3EE6
    dw $C3FC : db $FC : dw $3EE7

TitleMenuSpritemaps_31_FileSelectMenu_SamusHelmet_5:
    dw $0006 
    %spritemapEntry(0, $00, $FE, 0, 0, 3, 7, $DE)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 3, 7, $DD)
    dw $C3FC : db $F4 : dw $3ED7
    dw $C3F4 : db $F4 : dw $3ED6
    dw $C3F4 : db $FC : dw $3EE6
    dw $C3FC : db $FC : dw $3EE7

TitleMenuSpritemaps_32_FileSelectMenu_SamusHelmet_6:
    dw $0006 
    %spritemapEntry(0, $00, $FE, 0, 0, 3, 7, $EA)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 3, 7, $E9)
    dw $C3FC : db $F4 : dw $3ED7
    dw $C3F4 : db $F4 : dw $3ED6
    dw $C3F4 : db $FC : dw $3EE6
    dw $C3FC : db $FC : dw $3EE7

TitleMenuSpritemaps_33_FileSelectMenu_SamusHelmet_7:
    dw $0006 
    %spritemapEntry(0, $00, $FE, 0, 0, 3, 7, $EC)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 3, 7, $EB)
    dw $C3FC : db $F4 : dw $3ED7
    dw $C3F4 : db $F4 : dw $3ED6
    dw $C3F4 : db $FC : dw $3EE6
    dw $C3FC : db $FC : dw $3EE7

TitleMenuSpritemaps_34_MenuSelectionMissile_0:
    dw $0002 
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 7, $EF)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 7, $DF)

TitleMenuSpritemaps_35_MenuSelectionMissile_1:
    dw $0002 
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 7, $FF)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 7, $EE)

TitleMenuSpritemaps_36_MenuSelectionMissile_2:
    dw $0002 
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 7, $CC)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 7, $FE)

TitleMenuSpritemaps_37_MenuSelectionMissile_3:
    dw $0002 
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 7, $C8)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 7, $FF)

TitleMenuSpritemaps_38_AreaSelect_PlanetZebes:
    dw $0016 
    %spritemapEntry(0, $28, $00, 0, 0, 3, 0, $3B)
    %spritemapEntry(0, $28, $F8, 0, 0, 3, 0, $2B)
    %spritemapEntry(0, $20, $00, 0, 0, 3, 0, $1E)
    %spritemapEntry(0, $20, $F8, 0, 0, 3, 0, $0E)
    %spritemapEntry(0, $18, $00, 0, 0, 3, 0, $1B)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 0, $0B)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 0, $1E)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 0, $0E)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 0, $52)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $42)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $11)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $2C)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 0, $1E)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $0E)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 0, $37)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $27)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 0, $1A)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $0A)
    %spritemapEntry(0, $1D8, $00, 0, 0, 3, 0, $35)
    %spritemapEntry(0, $1D8, $F8, 0, 0, 3, 0, $25)
    %spritemapEntry(0, $1D0, $F8, 0, 0, 3, 0, $0D)
    %spritemapEntry(0, $1D0, $00, 0, 0, 3, 0, $38)

TitleMenuSpritemaps_39_AreaSelect_Crateria:
    dw $0008 
    %spritemapEntry(0, $17, $FC, 0, 0, 3, 0, $6A)
    %spritemapEntry(0, $10, $FC, 0, 0, 3, 0, $72)
    %spritemapEntry(0, $0A, $FC, 0, 0, 3, 0, $7B)
    %spritemapEntry(0, $02, $FC, 0, 0, 3, 0, $6E)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 3, 0, $7D)
    %spritemapEntry(0, $1F2, $FC, 0, 0, 3, 0, $6A)
    %spritemapEntry(0, $1EA, $FC, 0, 0, 3, 0, $7B)
    %spritemapEntry(0, $1E2, $FC, 0, 0, 3, 0, $6C)

TitleMenuSpritemaps_3A_AreaSelect_Brinstar:
    dw $0008 
    %spritemapEntry(0, $17, $FC, 0, 0, 3, 0, $7B)
    %spritemapEntry(0, $0E, $FC, 0, 0, 3, 0, $6A)
    %spritemapEntry(0, $07, $FC, 0, 0, 3, 0, $7D)
    %spritemapEntry(0, $1FF, $FC, 0, 0, 3, 0, $7C)
    %spritemapEntry(0, $1F7, $FC, 0, 0, 3, 0, $77)
    %spritemapEntry(0, $1EF, $FC, 0, 0, 3, 0, $72)
    %spritemapEntry(0, $1E9, $FC, 0, 0, 3, 0, $7B)
    %spritemapEntry(0, $1E1, $FC, 0, 0, 3, 0, $6B)

TitleMenuSpritemaps_3B_AreaSelect_Norfair:
    dw $0007 
    %spritemapEntry(0, $14, $FC, 0, 0, 3, 0, $7B)
    %spritemapEntry(0, $0C, $FC, 0, 0, 3, 0, $72)
    %spritemapEntry(0, $05, $FC, 0, 0, 3, 0, $6A)
    %spritemapEntry(0, $1FD, $FC, 0, 0, 3, 0, $6F)
    %spritemapEntry(0, $1F5, $FC, 0, 0, 3, 0, $7B)
    %spritemapEntry(0, $1ED, $FC, 0, 0, 3, 0, $78)
    %spritemapEntry(0, $1E5, $FC, 0, 0, 3, 0, $77)

TitleMenuSpritemaps_3E_AreaSelect_Tourian:
    dw $0007 
    %spritemapEntry(0, $13, $FC, 0, 0, 3, 0, $77)
    %spritemapEntry(0, $0A, $FC, 0, 0, 3, 0, $6A)
    %spritemapEntry(0, $03, $FC, 0, 0, 3, 0, $72)
    %spritemapEntry(0, $1FD, $FC, 0, 0, 3, 0, $7B)
    %spritemapEntry(0, $1F5, $FC, 0, 0, 3, 0, $7E)
    %spritemapEntry(0, $1ED, $FC, 0, 0, 3, 0, $78)
    %spritemapEntry(0, $1E6, $FC, 0, 0, 3, 0, $7D)

TitleMenuSpritemaps_3D_AreaSelect_Maridia:
    dw $0007 
    %spritemapEntry(0, $13, $FC, 0, 0, 3, 0, $6A)
    %spritemapEntry(0, $0B, $FC, 0, 0, 3, 0, $72)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 0, $6D)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $72)
    %spritemapEntry(0, $1F6, $FC, 0, 0, 3, 0, $7B)
    %spritemapEntry(0, $1EE, $FC, 0, 0, 3, 0, $6A)
    %spritemapEntry(0, $1E6, $FC, 0, 0, 3, 0, $76)

TitleMenuSpritemaps_3C_AreaSelect_WreckedShip:
    dw $000B 
    %spritemapEntry(0, $18, $00, 0, 0, 3, 0, $79)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 0, $72)
    %spritemapEntry(0, $09, $00, 0, 0, 3, 0, $71)
    %spritemapEntry(0, $01, $00, 0, 0, 3, 0, $7C)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 0, $6D)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $6E)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $74)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $6C)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $6E)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $7B)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $80)

TitleMenuSpritemaps_3F_82CD67:
    dw $0014 
    %spritemapEntry(0, $10, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $08, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $00, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1E8, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $10, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $18, $00, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $18, $08, 0, 0, 3, 7, $FD)
    %spritemapEntry(0, $1E0, $08, 0, 0, 3, 7, $FC)
    %spritemapEntry(0, $18, $F0, 0, 0, 3, 7, $FB)
    %spritemapEntry(0, $1E0, $F0, 0, 0, 3, 7, $F9)

TitleMenuSpritemaps_40_FileCopyArrow_OneSlotDown:
    dw $000E 
    %spritemapEntry(0, $02, $F0, 0, 0, 3, 1, $CF)
    %spritemapEntry(0, $1FA, $F0, 0, 0, 3, 1, $CE)
    %spritemapEntry(0, $02, $E8, 0, 0, 3, 1, $BF)
    %spritemapEntry(0, $1FA, $E8, 0, 0, 3, 1, $BE)
    %spritemapEntry(0, $1FA, $08, 0, 0, 3, 1, $B9)
    %spritemapEntry(0, $1FA, $10, 0, 0, 3, 1, $C9)
    %spritemapEntry(0, $02, $10, 0, 0, 3, 1, $CB)
    %spritemapEntry(0, $02, $08, 0, 0, 3, 1, $BB)
    %spritemapEntry(0, $1F2, $08, 0, 0, 3, 1, $B8)
    %spritemapEntry(0, $1F2, $00, 0, 0, 3, 1, $BC)
    %spritemapEntry(0, $1FA, $00, 0, 0, 3, 1, $BD)
    %spritemapEntry(0, $1F2, $F0, 0, 0, 3, 1, $CD)
    %spritemapEntry(0, $1FA, $F8, 0, 0, 3, 1, $BD)
    %spritemapEntry(0, $1F2, $F8, 0, 0, 3, 1, $BC)

TitleMenuSpritemaps_41_FileCopyArrow_OneSlotUp:
    dw $000E 
    %spritemapEntry(0, $1F2, $F0, 1, 0, 3, 1, $B8)
    %spritemapEntry(0, $1F2, $F8, 1, 0, 3, 1, $BC)
    %spritemapEntry(0, $1FA, $F8, 1, 0, 3, 1, $BD)
    %spritemapEntry(0, $1FA, $E8, 1, 0, 3, 1, $C9)
    %spritemapEntry(0, $1FA, $F0, 1, 0, 3, 1, $B9)
    %spritemapEntry(0, $02, $08, 1, 0, 3, 1, $CF)
    %spritemapEntry(0, $1FA, $08, 1, 0, 3, 1, $CE)
    %spritemapEntry(0, $02, $10, 1, 0, 3, 1, $BF)
    %spritemapEntry(0, $1FA, $10, 1, 0, 3, 1, $BE)
    %spritemapEntry(0, $1F2, $08, 1, 0, 3, 1, $CD)
    %spritemapEntry(0, $1FA, $00, 1, 0, 3, 1, $BD)
    %spritemapEntry(0, $1F2, $00, 1, 0, 3, 1, $BC)
    %spritemapEntry(0, $02, $E8, 1, 0, 3, 1, $CB)
    %spritemapEntry(0, $02, $F0, 1, 0, 3, 1, $BB)

TitleMenuSpritemaps_42_FileCopyArrow_TwoSlotsDown:
    dw $0016 
    %spritemapEntry(0, $1FA, $08, 0, 0, 3, 1, $BD)
    %spritemapEntry(0, $1F2, $08, 0, 0, 3, 1, $BC)
    %spritemapEntry(0, $1FA, $00, 0, 0, 3, 1, $BD)
    %spritemapEntry(0, $1F2, $00, 0, 0, 3, 1, $BC)
    %spritemapEntry(0, $1FA, $F8, 0, 0, 3, 1, $BD)
    %spritemapEntry(0, $1F2, $F8, 0, 0, 3, 1, $BC)
    %spritemapEntry(0, $1FA, $F0, 0, 0, 3, 1, $BD)
    %spritemapEntry(0, $1F2, $F0, 0, 0, 3, 1, $BC)
    %spritemapEntry(0, $1F2, $18, 0, 0, 3, 1, $B8)
    %spritemapEntry(0, $1F2, $10, 0, 0, 3, 1, $BC)
    %spritemapEntry(0, $1FA, $10, 0, 0, 3, 1, $BD)
    %spritemapEntry(0, $1FA, $20, 0, 0, 3, 1, $C9)
    %spritemapEntry(0, $1FA, $18, 0, 0, 3, 1, $B9)
    %spritemapEntry(0, $02, $E0, 0, 0, 3, 1, $CF)
    %spritemapEntry(0, $1FA, $E0, 0, 0, 3, 1, $CE)
    %spritemapEntry(0, $02, $D8, 0, 0, 3, 1, $BF)
    %spritemapEntry(0, $1FA, $D8, 0, 0, 3, 1, $BE)
    %spritemapEntry(0, $1F2, $E0, 0, 0, 3, 1, $CD)
    %spritemapEntry(0, $1FA, $E8, 0, 0, 3, 1, $BD)
    %spritemapEntry(0, $1F2, $E8, 0, 0, 3, 1, $BC)
    %spritemapEntry(0, $02, $20, 0, 0, 3, 1, $CB)
    %spritemapEntry(0, $02, $18, 0, 0, 3, 1, $BB)

TitleMenuSpritemaps_43_FileCopyArrow_TwoSlotsUp:
    dw $0016 
    %spritemapEntry(0, $1FA, $F0, 1, 0, 3, 1, $BD)
    %spritemapEntry(0, $1F2, $F0, 1, 0, 3, 1, $BC)
    %spritemapEntry(0, $1FA, $F8, 1, 0, 3, 1, $BD)
    %spritemapEntry(0, $1F2, $F8, 1, 0, 3, 1, $BC)
    %spritemapEntry(0, $1FA, $00, 1, 0, 3, 1, $BD)
    %spritemapEntry(0, $1F2, $00, 1, 0, 3, 1, $BC)
    %spritemapEntry(0, $1FA, $08, 1, 0, 3, 1, $BD)
    %spritemapEntry(0, $1F2, $08, 1, 0, 3, 1, $BC)
    %spritemapEntry(0, $1F2, $E0, 1, 0, 3, 1, $B8)
    %spritemapEntry(0, $1F2, $E8, 1, 0, 3, 1, $BC)
    %spritemapEntry(0, $1FA, $E8, 1, 0, 3, 1, $BD)
    %spritemapEntry(0, $1FA, $D8, 1, 0, 3, 1, $C9)
    %spritemapEntry(0, $1FA, $E0, 1, 0, 3, 1, $B9)
    %spritemapEntry(0, $02, $18, 1, 0, 3, 1, $CF)
    %spritemapEntry(0, $1FA, $18, 1, 0, 3, 1, $CE)
    %spritemapEntry(0, $02, $20, 1, 0, 3, 1, $BF)
    %spritemapEntry(0, $1FA, $20, 1, 0, 3, 1, $BE)
    %spritemapEntry(0, $1F2, $18, 1, 0, 3, 1, $CD)
    %spritemapEntry(0, $1FA, $10, 1, 0, 3, 1, $BD)
    %spritemapEntry(0, $1F2, $10, 1, 0, 3, 1, $BC)
    %spritemapEntry(0, $02, $D8, 1, 0, 3, 1, $CB)
    %spritemapEntry(0, $02, $E0, 1, 0, 3, 1, $BB)

TitleMenuSpritemaps_44_82CF3D:
    dw $0004 
    %spritemapEntry(0, $1FF, $FF, 1, 1, 3, 0, $B3)
    %spritemapEntry(0, $1F8, $FF, 1, 0, 3, 0, $B3)
    %spritemapEntry(0, $1FF, $F8, 0, 1, 3, 0, $B3)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $B3)

TitleMenuSpritemaps_45:
    dw $0002 
    dw $C3F4 : db $F8 : dw $3095
    dw $C3FC : db $F8 : dw $3096

TitleMenuSpritemaps_46:
    dw $0001 
    dw $C3F8 : db $F8 : dw $3091

TitleMenuSpritemaps_47:
    dw $0004 
    %spritemapEntry(0, $00, $00, 0, 1, 3, 0, $A0)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $90)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $A0)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $90)

TitleMenuSpritemaps_5F_SamusPositionIndicator_0:
    dw $0004 
    %spritemapEntry(0, $04, $04, 1, 1, 2, 7, $AF)
    %spritemapEntry(0, $1FC, $04, 1, 0, 2, 7, $AF)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 7, $AF)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 7, $AF)

TitleMenuSpritemaps_5F_SamusPositionIndicator_1:
    dw $0004 
    %spritemapEntry(0, $05, $05, 1, 1, 2, 7, $AF)
    %spritemapEntry(0, $1FB, $05, 1, 0, 2, 7, $AF)
    %spritemapEntry(0, $05, $FB, 0, 1, 2, 7, $AF)
    %spritemapEntry(0, $1FB, $FB, 0, 0, 2, 7, $AF)

TitleMenuSpritemaps_5F_SamusPositionIndicator_2:
    dw $0004 
    %spritemapEntry(0, $06, $06, 1, 1, 2, 7, $AF)
    %spritemapEntry(0, $1FA, $06, 1, 0, 2, 7, $AF)
    %spritemapEntry(0, $06, $FA, 0, 1, 2, 7, $AF)
    %spritemapEntry(0, $1FA, $FA, 0, 0, 2, 7, $AF)

TitleMenuSpritemaps_62_BossCrossOutIcon:
    dw $0004 
    %spritemapEntry(0, $03, $04, 1, 1, 2, 7, $9F)
    %spritemapEntry(0, $03, $FC, 0, 1, 2, 7, $9F)
    %spritemapEntry(0, $1FC, $04, 1, 0, 2, 7, $9F)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 7, $9F)

TitleMenuSpritemaps_63_GunshipIcon:
    dw $0002 
    %spritemapEntry(0, $04, $FE, 0, 1, 2, 7, $8F)
    %spritemapEntry(0, $1FC, $FE, 0, 0, 2, 7, $8F)

TitleMenuSpritemaps_64_GameOverBabyMetroidContainer:
    dw $0004 
    %spritemapEntry(0, $00, $08, 1, 1, 3, 5, $9A)
    %spritemapEntry(0, $1F8, $08, 1, 0, 3, 5, $9A)
    %spritemapEntry(0, $00, $F0, 0, 1, 3, 5, $9A)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 5, $9A)

TitleMenuSpritemaps_65_GameOverBabyMetroid_0:
    dw $0001 
    dw $C3F8 : db $F8 : dw $3890

TitleMenuSpritemaps_66_GameOverBabyMetroid_1:
    dw $0001 
    dw $C3F8 : db $F8 : dw $3892

TitleMenuSpritemaps_67_GameOverBabyMetroid_2:
    dw $0001 
    dw $C3F8 : db $F8 : dw $389B

TitleMenuSpritemaps_48_BorderAround_SAMUS_DATA:
    dw $0020 
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $30, $00, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $30, $F8, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $30, $08, 0, 0, 3, 7, $FD)
    %spritemapEntry(0, $1C8, $08, 0, 0, 3, 7, $FC)
    %spritemapEntry(0, $30, $F0, 0, 0, 3, 7, $FB)
    %spritemapEntry(0, $1C8, $F0, 0, 0, 3, 7, $F9)
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1E8, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1E0, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1D8, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1D0, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $28, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $20, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $18, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $10, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $08, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $00, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $28, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $20, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $18, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $10, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1E0, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1D8, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1D0, $F0, 0, 0, 3, 7, $FA)

TitleMenuSpritemaps_49_BorderAround_DATA_COPY_MODE:
    dw $0028 
    %spritemapEntry(0, $00, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $08, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1B8, $00, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $1B8, $F8, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $40, $00, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $40, $F8, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $40, $08, 0, 0, 3, 7, $FD)
    %spritemapEntry(0, $1B8, $08, 0, 0, 3, 7, $FC)
    %spritemapEntry(0, $40, $F0, 0, 0, 3, 7, $FB)
    %spritemapEntry(0, $1B8, $F0, 0, 0, 3, 7, $F9)
    %spritemapEntry(0, $1E8, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1E0, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1D8, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1D0, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1C8, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1C0, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $38, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $30, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $28, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $20, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $18, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $10, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $38, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $30, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $28, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $20, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $18, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $10, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1E0, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1D8, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1D0, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1C8, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1C0, $F0, 0, 0, 3, 7, $FA)

TitleMenuSpritemaps_4A_BorderAround_DATA_CLEAR_MODE:
    dw $002A 
    %spritemapEntry(0, $1EC, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1EC, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $04, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $0C, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1F4, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $04, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $0C, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1B4, $00, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $1B4, $F8, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $44, $00, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $44, $F8, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $44, $08, 0, 0, 3, 7, $FD)
    %spritemapEntry(0, $1B4, $08, 0, 0, 3, 7, $FC)
    %spritemapEntry(0, $44, $F0, 0, 0, 3, 7, $FB)
    %spritemapEntry(0, $1B4, $F0, 0, 0, 3, 7, $F9)
    %spritemapEntry(0, $1E4, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1DC, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1D4, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1CC, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1C4, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1BC, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $3C, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $34, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $2C, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $24, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1C, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $14, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $3C, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $34, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $2C, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $24, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1C, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $14, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1E4, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1DC, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1D4, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1CC, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1C4, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1BC, $F0, 0, 0, 3, 7, $FA)

TitleMenuSpritemaps_4B_BorderAround_OPTIONS_MODE:
    dw $0022 
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1F4, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1C4, $00, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $1C4, $F8, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $34, $00, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $34, $F8, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $34, $08, 0, 0, 3, 7, $FD)
    %spritemapEntry(0, $1C4, $08, 0, 0, 3, 7, $FC)
    %spritemapEntry(0, $34, $F0, 0, 0, 3, 7, $FB)
    %spritemapEntry(0, $1C4, $F0, 0, 0, 3, 7, $F9)
    %spritemapEntry(0, $1EC, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1E4, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1DC, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1D4, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1CC, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $2C, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $24, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1C, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $14, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $0C, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $04, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $2C, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $24, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1C, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $14, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $0C, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $04, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1EC, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1E4, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1DC, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1D4, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1CC, $F0, 0, 0, 3, 7, $FA)

TitleMenuSpritemaps_49_BorderAround_CONTROLLER_SETTING_MODE:
    dw $003A 
    %spritemapEntry(0, $1DC, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1E4, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $14, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $0C, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $04, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1EC, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1F4, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1DC, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1E4, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $14, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $0C, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $04, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1EC, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1CC, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1CC, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $24, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $2C, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1D4, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1C, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $24, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $2C, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1D4, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1C, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $194, $00, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $194, $F8, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $64, $00, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $64, $F8, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $64, $08, 0, 0, 3, 7, $FD)
    %spritemapEntry(0, $194, $08, 0, 0, 3, 7, $FC)
    %spritemapEntry(0, $64, $F0, 0, 0, 3, 7, $FB)
    %spritemapEntry(0, $194, $F0, 0, 0, 3, 7, $F9)
    %spritemapEntry(0, $1C4, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1BC, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1B4, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1AC, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1A4, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $19C, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $5C, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $54, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $4C, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $44, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $3C, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $34, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $5C, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $54, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $4C, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $44, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $3C, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $34, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1C4, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1BC, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1B4, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1AC, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1A4, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $19C, $F0, 0, 0, 3, 7, $FA)

TitleMenuSpritemaps_4D_BorderAround_SPECIAL_SETTING_MODE:
    dw $0034 
    %spritemapEntry(0, $1E8, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $08, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $00, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1D8, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1D8, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $18, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $20, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1E0, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $10, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $18, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $20, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1E0, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $10, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1A0, $00, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $1A0, $F8, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $58, $00, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $58, $F8, 0, 0, 3, 7, $ED)
    %spritemapEntry(0, $58, $08, 0, 0, 3, 7, $FD)
    %spritemapEntry(0, $1A0, $08, 0, 0, 3, 7, $FC)
    %spritemapEntry(0, $58, $F0, 0, 0, 3, 7, $FB)
    %spritemapEntry(0, $1A0, $F0, 0, 0, 3, 7, $F9)
    %spritemapEntry(0, $1D0, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1C8, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1C0, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1B8, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1B0, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1A8, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $50, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $48, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $40, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $38, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $30, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $28, $08, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $50, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $48, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $40, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $38, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $30, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $28, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1D0, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1C8, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1C0, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1B8, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1B0, $F0, 0, 0, 3, 7, $FA)
    %spritemapEntry(0, $1A8, $F0, 0, 0, 3, 7, $FA)

Samus_Wireframe_Tilemaps_powerSuit:
    dw $0000,$0000,$0000,$25B3,$65B3,$0000,$0000,$0000 
    dw $25BC,$25BD,$25BE,$25C3,$65C3,$65BE,$65BD,$65BC 
    dw $25CC,$25CD,$25CE,$25D3,$65D3,$65CE,$65CD,$65CC 
    dw $25DC,$25DD,$25EC,$25ED,$257C,$257D,$257E,$257F 
    dw $25F0,$25F1,$25FC,$25FD,$65FD,$65FC,$65F1,$65F0 
    dw $2570,$2571,$2572,$2573,$2574,$6572,$6571,$6570 
    dw $2580,$2581,$2594,$2583,$2584,$2578,$2586,$2587 
    dw $2590,$2591,$25A4,$25A5,$65A5,$2588,$2596,$2597 
    dw $25A0,$25A1,$25B4,$25B5,$65B5,$65B4,$25A6,$25A7 
    dw $0000,$25C9,$25C4,$25C5,$65C5,$65C4,$0000,$0000 
    dw $0000,$0000,$25D4,$25D5,$65D5,$65D4,$0000,$0000 
    dw $0000,$0000,$25B6,$25B7,$65B7,$65B6,$0000,$0000 
    dw $0000,$0000,$25C6,$25C7,$65C7,$65C6,$0000,$0000 
    dw $0000,$0000,$25D6,$05D7,$45D7,$65D6,$0000,$0000 
    dw $0000,$0000,$258F,$0000,$0000,$658F,$0000,$F955 
    dw $258E,$259E,$259F,$0000,$0000,$659F,$25EE,$259D 
    dw $25AD,$25AE,$25AF,$0000,$0000,$65AF,$25FE,$65AD 

Samus_Wireframe_Tilemaps_hiJumpBoots:
    dw $0000,$0000,$0000,$25B3,$65B3,$0000,$0000,$0000 
    dw $25BC,$25BD,$25BE,$25C3,$65C3,$65BE,$65BD,$65BC 
    dw $25CC,$25CD,$25CE,$25D3,$65D3,$65CE,$65CD,$65CC 
    dw $25DC,$25DD,$25EC,$25ED,$257C,$257D,$257E,$257F 
    dw $25F0,$25F1,$25FC,$25FD,$65FD,$65FC,$65F1,$65F0 
    dw $2570,$2571,$2572,$2573,$2574,$6572,$6571,$6570 
    dw $2580,$2581,$2594,$2583,$2584,$2578,$2586,$2587 
    dw $2590,$2591,$25A4,$25A5,$65A5,$2588,$2596,$2597 
    dw $25A0,$25A1,$25B4,$25B5,$65B5,$65B4,$25A6,$25A7 
    dw $0000,$25C9,$25C4,$25C5,$65C5,$65C4,$0000,$0000 
    dw $0000,$0000,$25D4,$25D5,$65D5,$65D4,$0000,$0000 
    dw $0000,$0000,$25B6,$25B7,$65B7,$65B6,$0000,$0000 
    dw $0000,$0000,$25C6,$25C7,$65C7,$65C6,$0000,$0000 
    dw $0000,$0579,$258C,$05D7,$45D7,$658C,$4579,$0000 
    dw $0000,$0589,$258A,$0000,$0000,$658A,$4589,$E955 
    dw $2598,$2599,$259A,$059B,$459B,$659A,$259C,$259D 
    dw $25A8,$25A9,$25AA,$0000,$0000,$65AA,$25AC,$65A8 

Samus_Wireframe_Tilemaps_variaSuit:
    dw $0000,$0000,$0000,$25B3,$65B3,$0000,$0000,$0000 
    dw $25C0,$25C1,$25C2,$25C3,$65C3,$65C2,$65C1,$65C0 
    dw $25D0,$25D1,$25D2,$25D3,$65D3,$65D2,$65D1,$65D0 
    dw $25E0,$25E1,$25E2,$25E3,$25E4,$25E5,$25E6,$25E7 
    dw $25F0,$25F1,$25F2,$25F3,$65F3,$65F2,$65F1,$65F0 
    dw $2570,$2571,$2572,$2573,$2574,$6572,$6571,$6570 
    dw $2580,$2581,$2582,$2583,$2584,$2585,$2586,$2587 
    dw $2590,$2591,$2592,$2593,$6593,$2595,$2596,$2597 
    dw $25A0,$25A1,$25A2,$25A3,$65A3,$65A2,$25A6,$25A7 
    dw $0000,$25C9,$25CA,$25CB,$65CB,$65CA,$0000,$0000 
    dw $0000,$0000,$25DA,$25DB,$65DB,$65DA,$0000,$0000 
    dw $0000,$05E9,$25EA,$25EB,$45EB,$65EA,$65E9,$0000 
    dw $0000,$05F9,$25FA,$25FB,$45FB,$65FA,$65F9,$0000 
    dw $0000,$0000,$257B,$05D7,$45D7,$657B,$0000,$0000 
    dw $0000,$0000,$258B,$0000,$0000,$658B,$0000,$E955 
    dw $258E,$259E,$259F,$0000,$0000,$659F,$25EE,$259D 
    dw $25AD,$25AE,$25AF,$0000,$0000,$65AF,$25FE,$25FF 

Samus_Wireframe_Tilemaps_hiJumpBootsVariaSuit:
    dw $0000,$0000,$0000,$25B3,$65B3,$0000,$0000,$0000 
    dw $25C0,$25C1,$25C2,$25C3,$65C3,$65C2,$65C1,$65C0 
    dw $25D0,$25D1,$25D2,$25D3,$65D3,$65D2,$65D1,$65D0 
    dw $25E0,$25E1,$25E2,$25E3,$25E4,$25E5,$25E6,$25E7 
    dw $25F0,$25F1,$25F2,$25F3,$65F3,$65F2,$65F1,$65F0 
    dw $2570,$2571,$2572,$2573,$2574,$6572,$6571,$6570 
    dw $2580,$2581,$2582,$2583,$2584,$2585,$2586,$2587 
    dw $2590,$2591,$2592,$2593,$6593,$2595,$2596,$2597 
    dw $25A0,$25A1,$25A2,$25A3,$65A3,$65A2,$25A6,$25A7 
    dw $0000,$25C9,$25CA,$25CB,$65CB,$65CA,$0000,$0000 
    dw $0000,$0000,$25DA,$25DB,$65DB,$65DA,$0000,$0000 
    dw $0000,$25E9,$25EA,$25EB,$65EB,$65EA,$65E9,$0000 
    dw $0000,$25F9,$25FA,$25FB,$65FB,$65FA,$65F9,$0000 
    dw $0000,$2579,$257A,$0000,$0000,$657A,$6579,$0000 
    dw $0000,$2589,$258A,$0000,$0000,$658A,$6589,$F955 
    dw $2598,$2599,$259A,$059B,$459B,$659A,$259C,$259D 
    dw $25A8,$25A9,$25AA,$0000,$0000,$65AA,$25AC,$65A8 

Advance_GradualColorChange_ofAllPalettes_Denominator_C:
    LDA.W #$000C : STA.L $7EC402 
    JSR.W Advance_GradualColorChange_ofAllPalettes 
    RTS 


Advance_GradualColorChange_ofBGPalette6:
    REP #$30 
    LDA.W #$000C : STA.L $7EC402 
    INC A 
    CMP.L $7EC400 : BCS .advance 
    LDA.W #$0000 : STA.L $7EC400 
    SEC 
    RTL 


.advance:
    PHB : PEA.W $7E7E 
    PLB : PLB 
    LDX.W #$00C0 

.loop:
    PHX 
    LDA.L $7EC200,X 
    TAY 
    LDA.L $7EC000,X 
    TAX 
    LDA.L $7EC400 : JSR.W CalculateTheAth_TransitionalColor_fromXtoY 
    PLX 
    STA.L $7EC000,X 
    INX #2
    CPX.W #$00E0 
    BCC .loop 
    PLB 
    LDA.L $7EC400 
    INC A 
    STA.L $7EC400 
    CLC 
    RTL 


Advance_GradualColorChange_ofPaletteRAM:
    REP #$30 
    LDA.W #$000F : STA.L $7EC402 
    CMP.L $7EC400 : BPL .advance 
    LDA.W #$0000 : STA.L $7EC400 
    SEC 
    RTL 


.advance:
    STY.B $22 
    PHB : PEA.W $7E7E 
    PLB : PLB 

.loop:
    PHX 
    LDA.L $7EC200,X 
    TAY 
    LDA.L $7EC000,X 
    TAX 
    LDA.L $7EC400 
    INC A 
    JSR.W CalculateTheAth_TransitionalColor_fromXtoY 
    PLX 
    STA.L $7EC000,X 
    INX #2
    CPX.B $22 
    BCC .loop 
    PLB 
    LDA.L $7EC400 
    INC A 
    STA.L $7EC400 
    CLC 
    RTL 


Advance_GradualColorChange_ofAllPalettes:
    REP #$30 
    LDA.L $7EC402 
    INC A 
    CMP.L $7EC400 : BCS .advance 
    LDA.W #$0000 : STA.L $7EC400 
    SEC 
    RTS 


.advance:
    PHB : PEA.W $7E7E 
    PLB : PLB 
    LDX.W #$0000 

.loop:
    STX.W $C404 
    LDA.W $C200,X : CMP.W $C000,X : BEQ .next 
    TAY 
    LDA.W $C000,X 
    TAX 
    LDA.W $C400 : JSR.W CalculateTheAth_TransitionalColor_fromXtoY 
    LDX.W $C404 
    STA.W $C000,X 

.next:
    INX #2
    CPX.W #$0200 
    BCC .loop 
    INC.W $C400 
    PLB 
    CLC 
    RTS 


CalculateTheAth_TransitionalColor_fromXtoY:
    PHA : PHA : PHX : PHY 
    LDA.B $01,S : AND.W #$001F 
    TAY 
    LDA.B $03,S : AND.W #$001F 
    TAX 
    LDA.B $05,S : JSR.W CalculateTheAth_TransitionalColorComponent_fromXtoY 
    STA.B $07,S 
    LDA.B $01,S 
    ASL #3
    XBA 
    AND.W #$001F 
    TAY 
    LDA.B $03,S 
    ASL #3
    XBA 
    AND.W #$001F 
    TAX 
    LDA.B $05,S : JSR.W CalculateTheAth_TransitionalColorComponent_fromXtoY 
    ASL #5
    ORA.B $07,S 
    STA.B $07,S 
    LDA.B $01,S 
    LSR #2
    XBA 
    AND.W #$001F 
    TAY 
    LDA.B $03,S 
    LSR #2
    XBA 
    AND.W #$001F 
    TAX 
    LDA.B $05,S : JSR.W CalculateTheAth_TransitionalColorComponent_fromXtoY 
    ASL #2
    XBA 
    ORA.B $07,S 
    STA.B $07,S 
    PLY : PLX : PLA : PLA 
    RTS 


CalculateTheAth_TransitionalColorComponent_fromXtoY:
    CMP.W #$0000 : BNE .AisNonZero 
    TXA 
    RTS 


.AisNonZero:
    DEC A 
    CMP.W $C402 : BNE + 
    TYA 
    RTS 


  + PHX 
    INC A 
    STA.B $14 
    TYA 
    SEC : SBC.B $01,S : STA.B $12 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + XBA 
    AND.W #$FF00 
    STA.L $004204 
    SEP #$21 
    LDA.W $C402 : SBC.B $14 : INC A 
    STA.L $004206 
    REP #$20 
    XBA 
    XBA 
    NOP #2
    LDA.L $004214 : BIT.B $12 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.B $12 
    PLA 
    XBA 
    CLC : ADC.B $12 : XBA 
    AND.W #$00FF 
    RTS 


Advance_GradualColorChange_ofPalettesInA_Denominator_C:
    PHX : PHY : PHB : PEA.W $7E7E 
    PLB : PLB 
    LDX.W #$000C 
    STX.W $C402 
    JSR.W Advance_GradualColorChange_ofPalettesInA 
    PLB : PLY : PLX 
    RTL 


Advance_GradualColorChange_ofPalettesInA:
    REP #$30 
    PHA 
    LDA.W $C402 
    INC A 
    CMP.W $C400 : BCS + 
    LDA.W #$0000 : STA.W $C400 
    PLA 
    SEC 
    RTS 


  + STZ.W $C404 

.loop:
    PLA 
    BEQ + 
    LSR A 
    PHA 
    BCS .advance 
    LDA.W $C404 : ADC.W #$0020 : STA.W $C404 
    BRA .loop 


.advance:
    JSR.W Advance_GradualColorChange_ofPaletteX_DividedBy_20 
    BRA .loop 

    PLA ; dead code (just the PLA)

  + INC.W $C400 
    CLC 
    RTS 


Advance_GradualColorChange_ofPaletteX_DividedBy_20:
    LDX.W $C404 

.loop:
    LDA.W $C200,X : CMP.W $C000,X : BEQ .next 
    TAY 
    LDA.W $C000,X 
    TAX 
    LDA.W $C400 : JSR.W CalculateTheAth_TransitionalColor_fromXtoY 
    LDX.W $C404 
    STA.W $C000,X 

.next:
    INX #2
    STX.W $C404 
    TXA 
    AND.W #$001F 
    BNE .loop 
    RTS 


HandleSamusRunningOutOfEnergy_and_IncrementGameTime:
    PHP 
    REP #$30 
    LDA.W $09C2 : BEQ .zeroEnergy 
    BPL .tickGameTime 

.zeroEnergy:
    LDA.W $09C0 : BIT.W #$0001 
    BEQ .noAutoReserve 
    LDA.W $09D6 : BEQ .noAutoReserve 
    LDA.W #$8000 : STA.W $0A78 
    LDA.W #$001B : STA.W $0998 
    LDA.W #$001B : JSL.L Run_Samus_Command 
    BRA .tickGameTime 


.noAutoReserve:
    LDA.W $0998 : CMP.W #$0008 : BEQ .normalGameplay 
    PLP 
    RTS 


.normalGameplay:
    LDA.W #$8000 : STA.W $0A78 
    LDA.W #$0011 : JSL.L Run_Samus_Command 
    LDA.W #$0013 : STA.W $0998 

.tickGameTime:
    LDA.W $09DA : CLC : ADC.W #$0001 : STA.W $09DA 
    CMP.W #$003C : BMI .checkGameTime 
    STZ.W $09DA 
    LDA.W $09DC : CLC : ADC.W #$0001 : STA.W $09DC 
    CMP.W #$003C : BMI .checkGameTime 
    STZ.W $09DC 
    LDA.W $09DE : CLC : ADC.W #$0001 : STA.W $09DE 
    CMP.W #$003C : BMI .checkGameTime 
    STZ.W $09DE 
    LDA.W $09E0 : CLC : ADC.W #$0001 : STA.W $09E0 

.checkGameTime:
    LDA.W $09E0 : CMP.W #$0064 : BPL .capGameTime 
    PLP 
    RTS 


.capGameTime:
    LDA.W #$003B : STA.W $09DA 
    STA.W $09DC 
    STA.W $09DE 
    LDA.W #$0063 : STA.W $09E0 
    PLP 
    RTS 


GameState_1B_ReserveTankAuto:
    PHP 
    REP #$30 
    JSR.W Reserve_Tank_Auto_Refill 
    BCC + 
    STZ.W $0A78 
    LDA.W #$0008 : STA.W $0998 
    LDA.W #$0010 : JSL.L Run_Samus_Command 

  + JSR.W GameState_8_MainGameplay 
    JSL.L Low_Health_Check_external 
    PLP 
    RTS 


Reserve_Tank_Auto_Refill:
    LDA.W $09D6 : BEQ .return 
    LDA.W $05B6 : BIT.W #$0007 
    BNE + 
    LDA.W #$002D : JSL.L QueueSound_Lib3_Max3 

  + LDA.W $09C2 : CLC : ADC.W #$0001 : STA.W $09C2 
    CMP.W $09C4 : BMI + 
    LDA.W $09C4 : STA.W $09C2 
    BRA .zeroReserve 


  + LDA.W $09D6 : SEC : SBC.W #$0001 : STA.W $09D6 
    BEQ .zeroReserve 
    BPL .return 
    LDA.W $09C2 : CLC : ADC.W $09D6 : STA.W $09C2 

.zeroReserve:
    STZ.W $09D6 

.return:
    LDA.W $09D6 : BNE .notDoneRefilling 
    SEC 
    RTS 


.notDoneRefilling:
    CLC 
    RTS 


GameState_13_DeathSequence_Start:
    PHP 
    REP #$30 
    JSR.W GameState_8_MainGameplay 
    LDX.W #$01FE 

  - LDA.L $7EC000,X : STA.L $7E3300,X 
    DEX #2
    BPL - 
    LDX.W #$017E 
    LDA.W #$0000 

  - STA.L $7EC200,X 
    DEX #2
    BPL - 
    LDX.W #$005E 
    LDA.W #$0000 

  - STA.L $7EC3A0,X 
    DEX #2
    BPL - 
    LDX.W #$001E 

  - LDA.L $7EC180,X : STA.L $7EC380,X 
    DEX #2
    BPL - 
    LDA.W #$0003 : STA.W $0DE2 
    STZ.W $0DE4 
    STZ.W $0DE6 
    STZ.W $0DE8 
    STZ.W $09D2 
    STZ.W $0A04 
    STZ.W $18A8 
    STZ.W $18AA 
    INC.W $0998 
    PLP 
    RTS 


GameState_14_DeathSequence_BlackOutSurroundings:
    PHP 
    REP #$30 
    JSR.W GameState_8_MainGameplay 
    LDA.W #$0006 : STA.L $7EC402 
    JSR.W Advance_GradualColorChange_ofAllPalettes 
    BCS + 
    PLP 
    RTS 


  + JSL.L Wait_End_VBlank_Clear_HDMA 
    JSL.L DisableHVCounterInterrupts 
    STZ.W $1982 
    STZ.B $AB 
    SEP #$20 
    STZ.B $6E 
    STZ.B $71 
    LDA.B #$10 : STA.B $69 
    STZ.B $6B 
    STZ.B $6C 
    STZ.B $6D 
    LDA.B #$09 : STA.B $55 
    REP #$20 
    STZ.W $0DE2 
    STZ.W $0723 
    STZ.W $0725 
    LDX.W #$00FE 

  - STZ.W $1A8D,X 
    DEX #2
    BPL - 
    LDA.W #$0010 : STA.W $0DE8 
    LDA.W #$0003 : STA.W $0DE2 
    STZ.W $0DE4 
    STZ.W $0DE6 
    INC.W $0998 
    STZ.W $0592 
    LDA.W #$0002 : JSL.L QueueSound 
    LDA.W #$0071 : JSL.L QueueSound_Lib2_Max15 
    LDA.W #$0001 : JSL.L QueueSound_Lib3_Max15 
    LDA.W #$0000 : JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$FF39 : JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$0005 
    LDY.W #$000E 
    JSL.L QueueMusicDataOrTrack_YFrameDelay 
    PLP 
    RTS 


GameState_15_DeathSequence_WaitForMusic:
    PHP 
    REP #$30 
    JSL.L Draw_Inanimate_Samus 
    JSL.L CheckIfMusicIsQueued 
    BCS .reutrn 
    JSL.L SetSamusDeathSequencePose 
    INC.W $0998 

.reutrn:
    PLP 
    RTS 


GameState_16_DeathSequence_PreFlashing:
    PHP 
    REP #$30 
    JSL.L Draw_Samus_Starting_Death_Animation_JSL 
    DEC.W $0DE8 
    BEQ + 
    BPL .return 

  + INC.W $0998 

.return:
    PLP 
    RTS 


GameState_17_DeathSequence_Flashing:
    PHP 
    REP #$30 
    JSL.L Handle_Death_Animation_Flashing 
    TAX 
    BEQ .flashingEnded 
    INC.W $0998 
    BRA .return 


.flashingEnded:
    JSL.L Draw_Samus_During_Death_Animation 

.return:
    PLP 
    RTS 


GameState_18_DeathSequence_ExplosionWhiteOut:
    PHP 
    REP #$30 
    JSL.L Handle_DeathSequence_SuitExplosionWhiteOut 
    TAX 
    BEQ .return 
    LDA.W #$0001 : STA.W $0723 
    STA.W $0725 
    INC.W $0998 

.return:
    PLP 
    RTS 


GameState_19_DeathSequence_BlackOut:
    PHP 
    REP #$30 
    JSL.L HandleFadingOut 
    SEP #$20 
    LDA.B $51 : CMP.B #$80 : BNE .return 
    JSL.L EnableNMI 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    INC.W $0998 
    STZ.W $0727 
    STZ.W $05F5 
    PLP 
    RTS 


.return:
    REP #$20 
    PLP 
    RTS 


Load_Destination_RoomCRE_Bitset:
    PHB : PHX : PEA.W $8F00 
    PLB : PLB 
    LDX.W $078D 
    LDA.L $830000,X 
    TAX 
    LDA.W $07B3 : STA.W $07B1 
    LDA.W $0008,X : AND.W #$00FF : STA.W $07B3 
    PLX : PLB 
    RTS 


Load_Door_Header:
    PEA.W $8300 
    PLB : PLB 
    LDX.W $078D 
    LDA.W $0000,X : STA.W $079B 
    LDA.W $0002,X : STA.W $0793 
    AND.W #$0080 
    STA.W $0E16 
    LDA.W $0003,X : AND.W #$00FF : STA.W $0791 
    LDA.W $0006,X : AND.W #$00FF 
    XBA 
    STA.W $0927 
    LDA.W $0007,X : AND.W #$00FF 
    XBA 
    STA.W $0929 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0008,X : BPL .positive 
    LDA.W $0791 : BIT.W #$0002 
    BNE .vertical 
    LDA.W #$00C8 : BRA .positive 


.vertical:
    LDA.W #$0180 

.positive:
    STA.B $13 
    LDA.B $12 : STA.W $092B 
    LDA.B $14 : STA.W $092D 
    RTS 


Load_Room_Header:
    PEA.W $8F00 
    PLB : PLB 
    LDX.W $079B 
    LDA.W $0000,X : AND.W #$00FF : STA.W $079D 
    LDA.W $0001,X : AND.W #$00FF : STA.W $079F 
    LDA.W $0002,X : AND.W #$00FF : STA.W $07A1 
    LDA.W $0003,X : AND.W #$00FF : STA.W $07A3 
    LDA.W $0004,X : AND.W #$00FF : STA.W $07A9 
    ASL #4
    STA.W $07A5 
    LDA.W $0005,X : AND.W #$00FF : STA.W $07AB 
    ASL #4
    STA.W $07A7 
    LDA.W $0006,X : AND.W #$00FF : STA.W $07AD 
    LDA.W $0007,X : AND.W #$00FF : STA.W $07AF 
    LDA.W $0009,X : STA.W $07B5 
    JSL.L Room_State_Checking_Handler 
    SEP #$20 
    LDA.W $07A5 : STA.W $4202 
    LDA.W $07A7 : STA.W $4203 
    REP #$20 
    NOP #3
    LDA.W $4216 
    ASL A 
    STA.W $07B9 
    RTS 


Load_State_Header:
    PEA.W $8F00 
    PLB : PLB 
    LDX.W $07BB 
    LDA.W $0003,X : AND.W #$00FF 
    ASL A 
    TAY 
    LDX.W Tileset_Pointers,Y 
    LDA.W $0001,X : STA.W $07C1 
    LDA.W $0000,X : STA.W $07C0 
    LDA.W $0004,X : STA.W $07C4 
    LDA.W $0003,X : STA.W $07C3 
    LDA.W $0007,X : STA.W $07C7 
    LDA.W $0006,X : STA.W $07C6 
    LDX.W $07BB 
    LDA.W $0001,X : STA.W $07BE 
    LDA.W $0000,X : STA.W $07BD 
    LDA.W $0004,X : AND.W #$00FF : STA.W $07CB 
    LDA.W $0005,X : AND.W #$00FF : STA.W $07C9 
    LDA.W $0006,X : STA.W $07CD 
    LDA.W $0008,X : STA.W $07CF 
    LDA.W $000A,X : STA.W $07D1 
    LDA.W $000C,X : STA.W $091B 
    LDA.W $0012,X : STA.W $07DF 
    RTS 


WaitUntilTheEndOfAVBlank_and_Enable_H_V_CounterInterrupts:
    PHP 
    SEP #$20 
    JSL.L WaitUntilTheEndOfAVBlank 
    LDA.B $84 : AND.B #$30 
    CMP.B #$30 : BEQ .return 
    JSL.L EnableHVCounterInterruptsNow 

.return:
    REP #$20 
    PLP 
    RTS 


Much_ado_about_nothing:
    PHP 
    SEP #$20 
    LDA.L EnableHVCounterInterrupts ; >.<
    CMP.L Much_ado_about_nothing ; >.<
    BEQ .return 
    JSL.L DisableHVCounterInterrupts 
    JSL.L EnableHVCounterInterrupts 

.return:
    REP #$20 ; >.<
    PLP 
    RTS 


Save_Map_Explored_If_Elevator:
    LDA.W $0793 : AND.W #$000F 
    BEQ + 
    JSL.L SetDebugElevatorAsUsed 

  + LDX.W $078D 
    LDA.L $830002,X : BIT.W #$0040 
    BEQ .return 
    JSL.L MirrorCurrentAreasMapExplored 

.return:
    RTS 


Load_Map_Explored_If_Elevator:
    LDX.W $078D 
    LDA.L $830002,X : BIT.W #$0040 
    BEQ .return 
    JSL.L LoadMirrorOfCurrentAreasMapExplored 

.return:
    RTS 


Draw_Inanimate_Samus_Bank82:
    LDA.W $0E16 : BNE .return 
    JSL.L Draw_Inanimate_Samus 

.return:
    RTS 


Load_EnemyGFX_to_VRAM:
    LDA.W #$7000 : STA.B $12 
    LDX.W $07D1 
    BEQ .return 
    TXY 

.loop:
    LDA.L $B40000,X : CMP.W #$FFFF : BEQ .return 
    TAX 
    LDA.L $A00036,X : STA.W $05C0 
    LDA.L $A00037,X : STA.W $05C1 
    LDA.L $A00000,X : BMI + 
    STA.W $05C3 
    LDA.B $12 : STA.W $05BE 
    LDA.L $A00000,X 
    LSR A 
    CLC : ADC.B $12 : STA.B $12 
    BRA .doorFlag 


  + AND.W #$7FFF 
    STA.W $05C3 
    TYX 
    LDA.L $B40002,X : AND.W #$F000 
    LSR #4
    ORA.W #$6000 
    STA.W $05BE 

.doorFlag:
    LDA.W #$8000 
    TSB.W $05BC 

.wait:
    LDA.W $05BC : BMI .wait 
    INY #4
    TYX 
    BRA .loop 


.return:
    RTS 


Perform_Door_Transition_VRAM_Update:
    LDA.B $01,S 
    INC A 
    STA.B $AD 
    PHB : PHK : PLB 
    LDA.B ($AD) : STA.W $05C0 
    INC.B $AD 
    LDA.B ($AD) : STA.W $05C1 
    INC.B $AD 
    INC.B $AD 
    LDA.B ($AD) : STA.W $05BE 
    INC.B $AD 
    INC.B $AD 
    LDA.B ($AD) : STA.W $05C3 
    PLB 
    LDA.B $AD 
    INC A 
    STA.B $01,S 
    LDA.W #$8000 
    TSB.W $05BC 

.wait:
    LDA.W $05BC : BMI .wait 
    RTS 


Queue_Room_Music_Data:
    PHP : PHB 
    REP #$30 
    LDA.W $0998 : CMP.W #$0028 : BCS .return 
    LDA.W $07CB : BEQ .return 
    CMP.W $07F3 : BEQ .return 
    LDA.W #$0000 : JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W $07CB 
    ORA.W #$FF00 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 

.return:
    PLB : PLP 
    RTL 


Update_Music_Track_Index:
    PHP : PHB 
    REP #$30 
    LDA.W $0998 : CMP.W #$0028 : BCS .return 
    LDA.W $07C9 : BEQ .return 
    LDA.W $07CA : AND.W #$FF00 : STA.B $12 
    LDA.W $07C9 
    TSB.B $12 
    LDA.W $07F2 : AND.W #$FF00 : STA.B $14 
    LDA.W $07F5 
    TSB.B $14 
    LDA.B $12 : CMP.B $14 : BEQ .return 
    LDA.W $07C9 : STA.W $07F5 

.return:
    PLB : PLP 
    RTL 


Load_New_Music_Track_If_Changed:
    PHP : PHB 
    REP #$30 
    LDA.W $0998 : CMP.W #$0028 : BCS .return 
    LDA.W $07C9 : BEQ .return 
    LDA.W $07CA : AND.W #$FF00 : STA.B $12 
    LDA.W $07C9 
    TSB.B $12 
    LDA.W $07F2 : AND.W #$FF00 : STA.B $14 
    LDA.W $07F5 
    TSB.B $14 
    LDA.B $12 : CMP.B $14 : BEQ .return 
    LDY.W #$0006 
    LDA.W $07C9 : JSL.L QueueMusicDataOrTrack_YFrameDelay 

.return:
    PLB : PLP 
    RTL 


RTL_82E113:
    PHP 
    REP #$20 
    PLP 
    RTL 


Play_Room_Music_Track_After_A_Frames:
    PHP : PHB 
    REP #$30 
    PHY 
    TAY 
    LDA.W $0998 : CMP.W #$0028 : BCS .return 
    LDA.W #$0000 : JSL.L QueueMusicDataOrTrack_YFrameDelay 
    LDA.W $07F5 : JSL.L QueueMusicDataOrTrack_8FrameDelay 

.return:
    PLY : PLB : PLP 
    RTL 


RTL_82E138:
    RTL 


Load_Target_Colors_for_Common_SpritesBeamsFlashingEnemies:
    REP #$30 
    LDX.W #$001E 

  - LDA.L Initial_Palette_spritePalette5,X : STA.L $7EC3A0,X 
    DEX #2
    BPL - 
    LDX.W #$001E 

  - LDA.L $7EC1C0,X : STA.L $7EC3C0,X 
    DEX #2
    BPL - 
    LDX.W #$001E 

  - LDA.L Standard_Target_Sprite_Palette_Line0,X : STA.L $7EC300,X 
    DEX #2
    BPL - 
    RTL 


GameState_9_HitADoorBlock:
    PHP 
    REP #$30 
    PEA.W .manualReturn-1 
    JMP.W ($099C) 


.manualReturn:
    BCS .gameStateA 
    PLP 
    RTS 


.gameStateA:
    INC.W $0998 
    PLP 
    JMP.W GameState_A_LoadingNextRoom 


DoorTransitionFunction_HandleElevator:
    LDA.W $0E16 : BEQ .return 
    LDA.W #$0000 : JSL.L Run_Samus_Command 
    LDA.W $0799 : BMI .return 
    LDA.W #$0030 : STA.W $092F 
    LDA.W #DoorTransitionFunction_Wait48FramesForDownElevator : STA.W $099C 
    JMP.W DoorTransitionFunction_Wait48FramesForDownElevator 


.return:
    SEC 
    RTS 


DoorTransitionFunction_Wait48FramesForDownElevator:
    DEC.W $092F 
    BMI .return 
    JSL.L Determine_Which_Enemies_to_Process 
    JSL.L Main_Enemy_Routine 
    JSL.L Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles 
    JSR.W Draw_Inanimate_Samus_Bank82 
    CLC 
    RTS 


.return:
    SEC 
    RTS 


GameState_A_LoadingNextRoom:
    PHP : PHB 
    REP #$30 
    LDA.W #$0001 : STA.W $0797 
    STA.W $0795 
    STZ.W $05F7 
    STZ.W $1E75 
    JSL.L Determine_Which_Enemies_to_Process 
    JSL.L Main_Enemy_Routine 
    JSL.L Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles 
    JSR.W Draw_Inanimate_Samus_Bank82 
    JSR.W Load_Destination_RoomCRE_Bitset 
    PEA.W $7E00 
    PLB : PLB 
    LDX.W #$00FE 
    LDA.W #$0000 

  - STA.W $C200,X 
    STA.W $C300,X 
    DEX #2
    BPL - 
    LDA.W $C012 : STA.W $C212 
    LDA.W $C014 : STA.W $C214 
    LDA.W $C01A : STA.W $C21A 
    LDA.W $C01C : STA.W $C21C 
    LDA.W $C022 : STA.W $C222 
    LDA.W $C024 : STA.W $C224 
    LDA.W $C026 : STA.W $C226 
    LDA.W $C03A : STA.W $C23A 
    LDA.W $07B3 
    ORA.W $07B1 
    BIT.W #$0001 
    BNE .clearSounds 
    LDA.W $C028 : STA.W $C228 
    LDA.W $C02A : STA.W $C22A 
    LDA.W $C02C : STA.W $C22C 
    LDA.W $C02E : STA.W $C22E 
    LDA.W $C038 : STA.W $C238 
    LDA.W $0943 : BEQ .clearSounds 
    LDA.W $C1A2 : STA.W $C3A2 
    LDA.W $C1A4 : STA.W $C3A4 
    LDA.W $C1A8 : STA.W $C3A8 
    LDA.W $C1BA : STA.W $C3BA 
    JSL.L DrawTimer 

.clearSounds:
    JSL.L Clear_Sounds_When_Going_Through_Door 
    LDA.W #$0071 : JSL.L QueueSound_Lib2_Max15 
    LDA.W #$FFFF : STA.W $05F5 
    LDA.W #DoorTransitionFunction_WaitForSoundsToFinish : STA.W $099C 
    INC.W $0998 
    PLB : PLP 
    RTS 


GameState_B_LoadingNextRoom:
    PHP : PHB 
    REP #$30 
    PEA.W .manualReturn-1 
    JMP.W ($099C) 


.manualReturn:
    LDA.W $0943 : BEQ .return 
    JSL.L DrawTimer 

.return:
    PLB : PLP 
    RTS 


DoorTransitionFunction_WaitForSoundsToFinish:
    PHP 
    JSL.L Determine_Which_Enemies_to_Process 
    JSL.L Main_Enemy_Routine 
    JSL.L Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles 
    JSR.W Draw_Inanimate_Samus_Bank82 
    SEP #$20 
    LDA.W $0646 : SEC : SBC.W $0643 : AND.B #$0F 
    BNE .return 
    LDA.W $0647 : SEC : SBC.W $0644 : AND.B #$0F 
    BNE .return 
    LDA.W $0648 : SEC : SBC.W $0645 : AND.B #$0F 
    BNE .return 
    REP #$20 
    LDA.W #DoorTransitionFunction_FadeOutTheScreen : STA.W $099C 

.return:
    PLP 
    RTS 


DoorTransitionFunction_FadeOutTheScreen:
    JSR.W Advance_GradualColorChange_ofAllPalettes_Denominator_C 
    BCS + 
    JSL.L Determine_Which_Enemies_to_Process 
    JSL.L Main_Enemy_Routine 
    JSL.L Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles 
    JSR.W Draw_Inanimate_Samus_Bank82 
    RTS 


  + LDA.W #DoorTransitionFunction_LoadDoorHeader_DeleteHDMAObjects_IRQ : STA.W $099C 
    RTS 


DoorTransitionFunction_LoadDoorHeader_DeleteHDMAObjects_IRQ:
    JSR.W Load_Door_Header 
    JSL.L Delete_HDMAObjects 
    LDA.W #$8000 
    TRB.W $18B0 
    LDA.W #$0008 : STA.B $A7 
    LDA.W #DoorTransitionFunction_ScrollScreenToAlignment : STA.W $099C 
    RTS 


DoorTransitionFunction_ScrollScreenToAlignment:
    PEA.W $8F00 
    PLB : PLB 
    LDA.W $0791 : BIT.W #$0002 
    BNE .vertical 
    LDA.W $0914 : BIT.W #$FF00 
    BEQ .done 
    BMI + 
    DEC.W $0915 
    BRA .return 


  + INC.W $0915 
    BRA .return 


.vertical:
    LDA.W $0910 : BIT.W #$FF00 
    BEQ .done 
    BMI + 
    DEC.W $0911 
    BRA .return 


  + INC.W $0911 

.return:
    JSL.L Calc_Layer2Position_BGScrolls_UpdateBGGraphics_WhenScrolling 
    RTS 


.done:
    JSL.L Calc_Layer2Position_BGScrolls_UpdateBGGraphics_WhenScrolling 
    LDA.W #DoorTransitionFunction_FixDoorsMovingUp : STA.W $099C 
    RTS 


DoorTransitionFunction_FixDoorsMovingUp:
    PEA.W $8F00 
    PLB : PLB 
    LDA.W $0791 : AND.W #$0003 
    CMP.W #$0003 : BNE + 
    JSL.L DrawTopRowOfScreenForUpwardsDoorTransition 

  + LDA.W #DoorTransitionFunction_LoadRoomHeader_SetupMap_Decompress : STA.W $099C 
    RTS 


DoorTransitionFunction_LoadRoomHeader_SetupMap_Decompress:
    PEA.W $8F00 
    PLB : PLB 
    JSR.W Save_Map_Explored_If_Elevator 
    JSR.W Load_Room_Header 
    JSR.W Load_State_Header 
    JSR.W Load_Map_Explored_If_Elevator 
    JSL.L Initialise_Special_Effects_for_New_Room 
    JSL.L Load_Level_Scroll_and_CRE_Data 
    LDA.W #DoorTransitionFunction_SetupScrolling : STA.W $099C 
    RTS 


DoorTransitionFunction_SetupScrolling:
    PEA.W $8F00 
    PLB : PLB 
    STZ.B $B5 
    STZ.B $B7 
    STZ.W $07E9 
    LDA.W $0791 : AND.W #$0003 
    CMP.W #$0002 : BNE + 
    INC.B $B3 

  + LDA.W $0791 : AND.W #$0003 
    CMP.W #$0003 : BEQ + 
    STZ.W $0925 

  + JSL.L DoorTransitionScrollingSetup 
    LDA.W #DoorTransitionFunction_PlaceSamus_LoadTiles : STA.W $099C 
    RTS 


DoorTransitionFunction_PlaceSamus_LoadTiles:
    PEA.W $8F00 
    PLB : PLB 
    LDA.W $0AF6 : AND.W #$00FF 
    CLC : ADC.W $0911 : STA.W $0AF6 
    STA.W $0B10 
    LDA.W $0AFA : AND.W #$00FF 
    CLC : ADC.W $0915 : STA.W $0AFA 
    STA.W $0B14 
    STZ.W $0931 
    STZ.W $05BC 
    LDA.W $0791 : AND.W #$0003 
    CMP.W #$0002 : BNE .horizontal 
    LDA.W #$0010 : BRA .vertical 


.horizontal:
    LDA.W #$0016 

.vertical:
    STA.B $A7 
    JSR.W WaitUntilTheEndOfAVBlank_and_Enable_H_V_CounterInterrupts 
    LDA.W $07B3 : BIT.W #$0002 
    BEQ .decompress 
    LDA.W $078D : CMP.W #Door_PostCrocShaft_0 : BEQ .decompress 
    LDA.W #CRE_Tiles_Compressed>>8&$FF00 : STA.B $48 
    LDA.W #CRE_Tiles_Compressed : STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7E7000 

.decompress:
    LDA.W $07C4 : STA.B $48 
    LDA.W $07C3 : STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7E2000 
    LDA.W $07C7 : STA.B $48 
    LDA.W $07C6 : STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7EC200 
    JSR.W Perform_Door_Transition_VRAM_Update 
    dl $7E2000 
    dw $0000,$2000 
    JSR.W Perform_Door_Transition_VRAM_Update 
    dl $7E4000 
    dw $1000,$2000 
    JSR.W Perform_Door_Transition_VRAM_Update 
    dl $7E6000 
    dw $2000,$1000 
    LDA.W $07B3 : BIT.W #$0006 
    BEQ .checkUp 
    LDA.W $078D : CMP.W #Door_PostCrocShaft_0 : BEQ .checkUp 
    JSR.W Perform_Door_Transition_VRAM_Update 
    dl $7E7000 
    dw $2800,$1000 
    JSR.W Perform_Door_Transition_VRAM_Update 
    dl $7E8000 
    dw $3000,$2000 
    JSR.W Perform_Door_Transition_VRAM_Update 
    dl Tiles_Standard_BG3 
    dw $4000,$1000 

.checkUp:
    LDA.W $0791 : AND.W #$0003 
    CMP.W #$0003 : BNE + 
    LDA.W #$0010 : STA.B $A7 

  + LDA.W #DoorTransitionFunction_LoadSpritesBGPLMsAudio_RunDoorRoomASM : STA.W $099C 
    RTS 


DoorTransitionFunction_LoadSpritesBGPLMsAudio_RunDoorRoomASM:
    PHP 
    JSR.W Load_EnemyGFX_to_VRAM 
    JSL.L Queue_Room_Music_Data 
    JSL.L Clear_Enemy_Projectiles 
    JSL.L Clear_AnimatedTilesObjects 
    JSL.L Clear_PaletteFXObjects 
    JSL.L Clear_PLMs 
    JSL.L CreatePLMs_ExecuteDoorASM_RoomSetupASM_SetElevatorStatus 
    JSL.L Load_FX_Header 
    JSR.W Spawn_Door_Closing_PLM 
    JSL.L Update_Beam_Tiles_and_Palette 
    JSL.L Load_Target_Colors_for_Common_SpritesBeamsFlashingEnemies 
    JSL.L Load_Enemies 
    JSL.L Initialise_Enemies 
    JSL.L Reset_Projectile_Data 
    JSL.L LoadSamusSuitTargetPalette 
    PLP : PEA.W $8F00 
    PLB : PLB 
    JSR.W Clear_FX_Tilemap_bank82 
    LDA.W #$8A00 : STA.W $05C1 
    LDA.W $1964 : BEQ + 
    STA.W $05C0 
    LDA.W #$5BE0 : STA.W $05BE 
    LDA.W #$0840 : STA.W $05C3 
    LDA.W #$8000 
    TSB.W $05BC 

.waitVRAM:
    BIT.W $05BC 
    BMI .waitVRAM 

  + LDX.W $07BB 
    LDY.W $0016,X 
    BPL .noLibraryBackground 

.loop:
    LDX.W $0000,Y 
    INY #2
    JSR.W (Library_Background_Function_Pointers,X) 
    BCC .loop 

.noLibraryBackground:
    REP #$30 

.waitDoor:
    LDA.W $0931 : BPL .waitDoor 
    LDA.W #$3BE0 : STA.L $7EC188 
    JSL.L Spawn_BG3_Scroll_HDMA_Object 
    LDA.W #$8000 
    TSB.W $18B0 
    JSL.L PLM_Handler 
    JSL.L WaitForNMI 
    LDA.W $0791 : BIT.W #$0002 
    BNE .return 
    AND.W #$0003 
    BEQ .right 
    LDA.W #$0007 
    TRB.W $0AF6 
    BRA .return 


.right:
    LDA.W #$0007 
    TSB.W $0AF6 

.return:
    LDA.W #DoorTransitionFunction_HandleAnimatedTiles : STA.W $099C 
    RTS 


Clear_FX_Tilemap_bank82:
    LDX.W #$077E 
    LDA.W #$184E 

.loop:
    STA.L $7E4000,X 
    STA.L $7E4780,X 
    DEX #2
    BPL .loop 
    JSR.W Perform_Door_Transition_VRAM_Update 
    dl $7E4000 
    dw $5880,$0F00 
    RTS 


Clear_BG2_Tilemap_bank82:
    LDX.W #$07FE 
    LDA.W #$0338 

.loop:
    STA.L $7E4000,X 
    STA.L $7E4800,X 
    DEX #2
    BPL .loop 
    JSR.W Perform_Door_Transition_VRAM_Update 
    dl $7E4000 
    dw $4800,$1000 
    RTS 


Clear_Kraids_BG2_Tilemap:
    LDX.W #$07FE 
    LDA.W #$0338 

.loop:
    STA.L $7E4000,X 
    STA.L $7E4800,X 
    DEX #2
    BPL .loop 
    JSR.W Perform_Door_Transition_VRAM_Update 
    dl $7E4000 
    dw $4000,$1000 
    JSR.W Perform_Door_Transition_VRAM_Update 
    dl $7E4000 
    dw $4800,$1000 
    RTS 


Library_Background_Function_Pointers:
    dw LoadLibraryBackground_0_Terminator 
    dw LoadLibraryBackground_2_TransferToVRAM 
    dw LoadLibraryBackground_4_Decompression 
    dw LoadLibraryBackground_6_ClearFXTilemap 
    dw LoadLibraryBackground_8_TransferToVRAM_SetBG3TilesBaseAddr 
    dw LoadLibraryBackground_A_ClearBG2Tilemap 
    dw LoadLibraryBackground_C_ClearKraidsLayer2 
    dw LoadLibraryBackground_E_DoorDependentTransferToVRAM 

LoadLibraryBackground_0_Terminator:
    SEC 
    RTS 


LoadLibraryBackground_E_DoorDependentTransferToVRAM:
    LDA.W $078D : CMP.W $0000,Y : BEQ + 
    TYA 
    CLC : ADC.W #$0009 : TAY 
    CLC 
    RTS 


  + INY #2
    LoadLibraryBackground_2_TransferToVRAM:
    LDA.W $0003,Y : STA.W $05BE 
    LDA.W $0000,Y : STA.W $05C0 
    LDA.W $0001,Y : STA.W $05C1 
    LDA.W $0005,Y : STA.W $05C3 
    LDA.W #$8000 
    TSB.W $05BC 

.wait:
    BIT.W $05BC 
    BMI .wait 
    TYA 
    CLC : ADC.W #$0007 : TAY 
    CLC 
    RTS 


LoadLibraryBackground_4_Decompression:
    PHY 
    LDA.W $0000,Y : STA.B $47 
    LDA.W $0001,Y : STA.B $48 
    LDA.W #$7E00 : STA.B $4D 
    LDA.W $0003,Y : STA.B $4C 
    JSL.L Decompression_VariableDestination 
    PLA 
    CLC : ADC.W #$0005 : TAY 
    CLC 
    RTS 


LoadLibraryBackground_6_ClearFXTilemap:
    PHY 
    JSR.W Clear_FX_Tilemap_bank82 
    PLY 
    CLC 
    RTS 


LoadLibraryBackground_8_TransferToVRAM_SetBG3TilesBaseAddr:
    JSR.W LoadLibraryBackground_2_TransferToVRAM 
    SEP #$20 
    LDA.B #$02 : STA.B $5E 
    REP #$20 
    CLC 
    RTS 


LoadLibraryBackground_A_ClearBG2Tilemap:
    PHY 
    JSR.W Clear_BG2_Tilemap_bank82 
    PLY 
    CLC 
    RTS 


LoadLibraryBackground_C_ClearKraidsLayer2:
    PHY 
    JSR.W Clear_Kraids_BG2_Tilemap 
    PLY 
    CLC 
    RTS 


DoorTransitionFunction_HandleAnimatedTiles:
    JSL.L AnimatedTilesObject_Handler 
    LDA.W #DoorTransitionFunction_WaitForMusicQueueClear_and_LoadMusic : STA.W $099C 
    RTS 


DoorTransitionFunction_WaitForMusicQueueClear_and_LoadMusic:
    JSL.L CheckIfMusicIsQueued 
    BCS .return 
    LDA.W #DoorTransitionFunction_NudgeSamusIfInterceptingTheDoor : STA.W $099C 
    JSL.L Load_New_Music_Track_If_Changed 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_DoorTransitionFunction:
    JSL.L HandleMusicQueue 
    JSL.L Determine_Which_Enemies_to_Process 
    STZ.W $0795 
    JSL.L Main_Enemy_Routine 
    INC.W $0795 
    JSL.L Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles 
    JSL.L Main_Scrolling_Routine 
    JSR.W Draw_Inanimate_Samus_Bank82 
    JSL.L Calc_Layer2Position_BGScrolls_UpdateBGGraphics_WhenScrolling 
    DEC.W $092F 
    BPL .return 
    LDA.W #DoorTransitionFunction_NudgeSamusIfInterceptingTheDoor : STA.W $099C 

.return:
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


DoorTransitionFunction_NudgeSamusIfInterceptingTheDoor:
    LDA.W $0AF6 : AND.W #$00F0 
    CMP.W #$0010 : BNE .X 
    LDA.W $0AF6 
    ORA.W #$000F 
    CLC : ADC.W #$0008 : STA.W $0AF6 
    BRA .Y 


.X:
    CMP.W #$00E0 : BNE .Y 
    LDA.W $0AF6 : AND.W #$FFF0 
    SEC : SBC.W #$0008 : STA.W $0AF6 

.Y:
    LDA.W $0AFA : AND.W #$00F0 
    CMP.W #$0010 : BNE .what 
    LDA.W $0AFA 
    ORA.W #$000F 
    CLC : ADC.W #$0008 : STA.W $0AFA 
    BRA + 


.what:
    CMP.W #$00E0 

  + PHB : PEA.W $7E00 
    PLB : PLB 
    LDX.W #$01FE 

.loop:
    STZ.W $9C00,X 
    STZ.W $9E00,X 
    DEX #2
    BPL .loop 
    PLB 
    LDA.B $A9 : BNE + 
    LDA.W #$0004 

  + STA.B $A7 
    JSR.W Much_ado_about_nothing 
    LDA.W $0E16 : BEQ .notElevator 
    BIT.W $0799 
    BPL .samusCmd 
    LDA.W #$0000 : JSL.L Run_Samus_Command 
    BRA .notElevator 


.samusCmd:
    LDA.W #$0007 : JSL.L Run_Samus_Command 

.notElevator:
    JSL.L SetLiquidPhysicsType 
    LDA.W #DoorTransitionFunction_FadeInTheScreen_and_RunEnemies_Finish : STA.W $099C 
    LDA.B $51 : ORA.W #$001F : STA.B $51 
    RTS 


DoorTransitionFunction_FadeInTheScreen_and_RunEnemies_Finish:
    JSL.L AnimatedTilesObject_Handler 
    JSL.L Determine_Which_Enemies_to_Process 
    JSL.L Main_Enemy_Routine 
    JSL.L Enemy_Projectile_Handler 
    JSL.L Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles 
    JSR.W Draw_Inanimate_Samus_Bank82 
    JSL.L Handle_Queuing_Enemy_BG2_Tilemap_VRAM_Transfer 
    JSR.W Advance_GradualColorChange_ofAllPalettes_Denominator_C 
    BCC .return 
    STZ.W $05F5 
    JSL.L Play_SpinJumpSound_if_SpinJumping 
    STZ.W $0795 
    STZ.W $0797 
    LDA.W #$0008 : STA.W $0998 

.return:
    RTS 


Load_Destination_Room:
    PHP : PHB 
    REP #$30 
    PEA.W $8F00 
    PLB : PLB 
    JSR.W Load_Destination_RoomCRE_Bitset 
    JSR.W Load_Door_Header 
    JSR.W Load_Room_Header 
    JSR.W Load_State_Header 
    JMP.W Load_CRETiles_TilesetTiles_and_TilesetPalette 


Load_CRETiles_TilesetTiles_and_TilesetPalette_DB_8F:
    PHP : PHB 
    REP #$30 
    PEA.W $8F00 
    PLB : PLB 

Load_CRETiles_TilesetTiles_and_TilesetPalette:
    STZ.W $0E16 
    LDA.W #$0080 : STA.W $2115 
    LDA.W #CRE_Tiles_Compressed>>8&$FF00 : STA.B $48 
    LDA.W #CRE_Tiles_Compressed : STA.B $47 
    LDA.W #$5000 : STA.B $4C 
    LSR A 
    STA.W $2116 
    JSL.L DecompressionToVRAM 
    LDA.W $07C4 : STA.B $48 
    LDA.W $07C3 : STA.B $47 
    STZ.W $2116 
    STZ.B $4C 
    JSL.L DecompressionToVRAM 
    LDA.W $07C7 : STA.B $48 
    LDY.W $07C6 
    STY.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7EC200 
    PLB : PLP 
    RTL 


LoadLevelData_CRE_TileTable_ScrollData_PLMs_DoorASM_RoomASM:
    PHP : PHB 
    REP #$30 
    PEA.W $8F00 
    PLB : PLB 
    LDX.W #$63FE 
    LDA.W #$8000 

.loopA:
    STA.L $7F0002,X 
    DEX #2
    BPL .loopA 
    LDA.W $07BE : STA.B $48 
    LDA.W $07BD : STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F0000 
    PHB : PEA.W $7F00 
    PLB : PLB 
    LDA.W $0000 
    TAX 
    LSR A 
    ADC.W $0000 : ADC.W $0000 : TAY 
    BRA + 


.loopB:
    LDA.W $0002,Y : STA.W $9602,X 

  + DEY #2
    DEX #2
    BPL .loopB 
    LDA.W $0000 
    LSR A 
    TAX 
    ADC.W $0000 : TAY 
    BRA + 


.loopC:
    LDA.W $0002,Y : STA.W $6402,X 

  + DEY #2
    DEX #2
    BPL .loopC 
    PLB 
    LDA.W $079F : CMP.W #$0006 : BEQ .skipCRE 
    LDA.W #CRE_TileTable_Compressed>>8&$FF00 : STA.B $48 
    LDA.W #CRE_TileTable_Compressed : STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7EA000 
    LDA.W $07C1 : STA.B $48 
    LDA.W $07C0 : STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7EA800 
    BRA .scrolls 


.skipCRE:
    LDA.W $07C1 : STA.B $48 
    LDA.W $07C0 : STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7EA000 

.scrolls:
    LDX.W $07BB 
    LDY.W $000E,X 
    BPL .presetScrolls 
    LDX.W #$0000 

.loopD:
    LDA.W $0000,Y : STA.L $7ECD20,X 
    INY #2
    INX #2
    CPX.W #$0032 
    BNE .loopD 
    BRA .scrollsEnd 


.presetScrolls:
    STY.B $12 
    SEP #$30 
    LDA.W $07AB 
    DEC A 
    STA.B $14 
    LDA.B #$02 
    LDX.B #$00 
    LDY.B #$00 

.loop:
    CPY.B $14 
    BNE + 
    LDA.B $12 
    INC A 

  + PHY 
    LDY.B #$00 

.loopE:
    STA.L $7ECD20,X 
    INX 
    INY 
    CPY.W $07A9 
    BNE .loopE 
    PLY 
    INY 
    CPY.W $07AB 
    BNE .loop 

.scrollsEnd:
    REP #$30 
    LDX.W $07BB 
    LDA.W $0014,X : BEQ + 
    TAX 

.loopF:
    LDA.W $0000,X : BEQ + 
    JSL.L Spawn_Room_PLM 
    TXA 
    CLC : ADC.W #$0006 : TAX 
    BRA .loopF 


  + JSL.L Execute_Door_ASM 
    JSL.L Execute_Room_Setup_ASM 
    LDA.W $0E16 : BEQ .return 
    LDA.W #$0002 : STA.W $0E18 

.return:
    PLB : PLP 
    RTL 


Spawn_Door_Closing_PLM:
    PHP : PHB 
    REP #$30 
    PEA.W $8F00 
    PLB : PLB 
    JSR.W CheckIfColoredDoorcapWasSpawned_SwitchDoorPLMInstruction 
    BCS .return 
    LDA.W $0791 
    ASL A 
    CLC : ADC.W #Door_Closing_PLMs : TAX 
    LDA.W $0000,X : BEQ .return 
    STA.B $12 
    LDX.W $078D 
    LDA.L $830004,X : STA.B $14 
    LDX.W #$0012 
    JSL.L Spawn_Room_PLM 

.return:
    PLB : PLP 
    RTS 


CheckIfColoredDoorcapWasSpawned_SwitchDoorPLMInstruction:
    LDX.W $078D 
    SEI 
    SEP #$20 
    LDA.L $830005,X : STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    LDA.L $830004,X 
    REP #$20 
    AND.W #$00FF 
    CLC : ADC.W $4216 : ASL A 
    CLI 
    LDX.W #$004E 

.loop:
    CMP.W $1C87,X : BEQ .found 
    DEX #2
    BPL .loop 

.noColoredDoor:
    CLC 
    RTS 


.found:
    LDA.W $1C37,X : BEQ .noColoredDoor 
    LDA.W $1DC7,X : BMI + 
    PHX 
    JSL.L BitIndexToByteIndexAndBitmask 
    LDA.L $7ED8B0,X 
    PLX 
    AND.W $05E7 
    BNE .noColoredDoor 

  + LDA.W #$0001 : STA.L $7EDE1C,X 
    TXY 
    LDA.W $1C37,X : BEQ .noColoredDoor 
    TAX 
    LDA.L $840004,X : STA.W $1D27,Y 
    SEC 
    RTS 


LoadLibraryBackground_LoadingPausing:
    PHP : PHB 
    REP #$30 
    JSL.L ClearFXTilemap 
    LDA.W $1964 : BEQ + 
    STA.W $4312 
    LDA.W #$5BE0 : STA.W $2116 
    LDA.W #$1801 : STA.W $4310 
    LDA.W #$008A : STA.W $4314 
    LDA.W #$0840 : STA.W $4315 
    SEP #$20 
    LDA.B #$80 : STA.W $2115 
    LDA.B #$02 : STA.W $420B 
    REP #$20 
    TYA 
    CLC : ADC.W #$0007 : TAY 
    CLC 

  + PEA.W $8F00 
    PLB : PLB 
    REP #$20 
    LDX.W $07BB 
    LDY.W $0016,X 
    BPL .return 

.loop:
    LDX.W $0000,Y 
    INY #2
    JSR.W (.pointers,X) 
    BCC .loop 

.return:
    PLB : PLP 
    RTL 


.pointers:
    dw LoadLibraryBackgroundLP_0_Terminator 
    dw LoadLibraryBackgroundLP_2_TransferToVRAM 
    dw LoadLibraryBackgroundLP_4_Decompression 
    dw LoadLibraryBackgroundLP_6_ClearFXTilemap 
    dw LoadLibraryBackgroundLP_8_TransferVRAM_and_SetBG3TilesAddr 
    dw LoadLibraryBackgroundLP_A_ClearBG2Tilemap 
    dw LoadLibraryBackgroundLP_C_ClearKraidsLayer2 
    dw LoadLibraryBackgroundLP_E_DoorDependentTransferToVRAM 

LoadLibraryBackgroundLP_0_Terminator:
    SEC 
    RTS 


LoadLibraryBackgroundLP_E_DoorDependentTransferToVRAM:
    LDA.W $078D : CMP.W $0000,Y : BEQ + 
    TYA 
    CLC : ADC.W #$0009 : TAY 
    CLC 
    RTS 


  + INY #2
    LoadLibraryBackgroundLP_2_TransferToVRAM:
    LDA.W $0003,Y : STA.W $2116 
    LDA.W #$1801 : STA.W $4310 
    LDA.W $0000,Y : STA.W $4312 
    LDA.W $0002,Y : STA.W $4314 
    LDA.W $0005,Y : STA.W $4315 
    SEP #$20 
    LDA.B #$80 : STA.W $2115 
    LDA.B #$02 : STA.W $420B 
    REP #$20 
    TYA 
    CLC : ADC.W #$0007 : TAY 
    CLC 
    RTS 


LoadLibraryBackgroundLP_4_Decompression:
    PHY 
    LDA.W $0000,Y : STA.B $47 
    LDA.W $0001,Y : STA.B $48 
    LDA.W #$7E00 : STA.B $4D 
    LDA.W $0003,Y : STA.B $4C 
    JSL.L Decompression_VariableDestination 
    PLA 
    CLC : ADC.W #$0005 : TAY 
    CLC 
    RTS 


LoadLibraryBackgroundLP_6_ClearFXTilemap:
    PHY 
    JSL.L ClearFXTilemap 
    PLY 
    CLC 
    RTS 


LoadLibraryBackgroundLP_A_ClearBG2Tilemap:
    PHY 
    JSL.L ClearBG2Tilemap 
    PLY 
    CLC 
    RTS 


LoadLibraryBackgroundLP_C_ClearKraidsLayer2:
    PHY 
    JSL.L ClearBG2Tilemap 
    PLY 
    CLC 
    RTS 


LoadLibraryBackgroundLP_8_TransferVRAM_and_SetBG3TilesAddr:
    JSR.W LoadLibraryBackgroundLP_2_TransferToVRAM 
    SEP #$20 
    LDA.B #$02 : STA.B $5E 
    REP #$20 
    CLC 
    RTS 


Load_Level_Scroll_and_CRE_Data:
    PEA.W $8F00 
    PLB : PLB 
    LDX.W #$18FE 
    LDA.W #$8000 

  - STA.L $7F0002,X 
    STA.L $7F1902,X 
    STA.L $7F3202,X 
    STA.L $7F4B02,X 
    DEX #2
    BPL - 
    LDA.W $07BE : STA.B $48 
    LDA.W $07BD : STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F0000 
    PHB : PEA.W $7F00 
    PLB : PLB 
    LDA.W $0000 
    TAX 
    LSR A 
    ADC.W $0000 : ADC.W $0000 : TAY 
    BRA + 


  - LDA.W $0002,Y : STA.W $9602,X 

  + DEY #2
    DEX #2
    BPL - 
    LDA.W $0000 
    LSR A 
    TAX 
    ADC.W $0000 : TAY 
    BRA + 


  - LDA.W $0002,Y : STA.W $6402,X 

  + DEY #2
    DEX #2
    BPL - 
    PLB 
    LDA.W $079F : CMP.W #$0006 : BEQ .inCeres 
    LDA.W $07B3 : BIT.W #$0002 
    BEQ + 
    LDA.W #CRE_TileTable_Compressed>>8&$FF00 : STA.B $48 
    LDA.W #CRE_TileTable_Compressed : STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7EA000 

  + LDA.W $07C1 : STA.B $48 
    LDA.W $07C0 : STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7EA800 
    BRA + 


.inCeres:
    LDA.W $07C1 : STA.B $48 
    LDA.W $07C0 : STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7EA000 

  + LDX.W $07BB 
    LDY.W $000E,X 
    BPL .presetScrolls 
    LDX.W #$0000 

  - LDA.W $0000,Y : STA.L $7ECD20,X 
    INY #2
    INX #2
    CPX.W #$0032 
    BNE - 
    BRA .return 


.presetScrolls:
    STY.B $12 
    SEP #$30 
    LDA.W $07AB 
    DEC A 
    STA.B $14 
    LDA.B #$02 
    LDX.B #$00 
    LDY.B #$00 

.loop:
    CPY.B $14 
    BNE + 
    LDA.B $12 
    INC A 

  + PHY 
    LDY.B #$00 

  - STA.L $7ECD20,X 
    INX 
    INY 
    CPY.W $07A9 
    BNE - 
    PLY 
    INY 
    CPY.W $07AB 
    BNE .loop 

.return:
    REP #$30 
    RTL 


CreatePLMs_ExecuteDoorASM_RoomSetupASM_SetElevatorStatus:
    PEA.W $8F00 
    PLB : PLB 
    LDX.W $07BB 
    LDA.W $0014,X : BEQ .noPLMs 
    TAX 

.loop:
    LDA.W $0000,X : BEQ .noPLMs 
    JSL.L Spawn_Room_PLM 
    TXA 
    CLC : ADC.W #$0006 : TAX 
    BRA .loop 


.noPLMs:
    JSL.L Execute_Door_ASM 
    JSL.L Execute_Room_Setup_ASM 
    LDA.W $0E16 : BEQ .return 
    LDA.W #$0002 : STA.W $0E18 

.return:
    RTL 


GameState_2_GameOptionsMenu:
    PHP : PHB : PHK : PLB 
    REP #$30 
    LDA.W $0DE2 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    JSR.W GameOptionsMenu_ObjectHandler 
    JSR.W Draw_GameOptionsMenu_Spritemaps 
    LDA.W $0DE2 : CMP.W #$0002 : BMI .return 
    JSR.W Draw_GameOptionsMenu_BG1 

.return:
    PLB : PLP 
    RTS 


.pointers:
    dw GameOptionsMenu_0_FinishFadingOut 
    dw GameOptionsMenu_1_LoadingOptionsMenu 
    dw GameOptionsMenu_2_FadingInOptionsMenu 
    dw GameOptionsMenu_3_OptionsMenu 
    dw GameOptionsMenu_4_StartGame 
    dw GameOptionsMenu_5_DissolveOutScreen 
    dw GameOptionsMenu_6_DissolveInScreen 
    dw GameOptionsMenu_7_ControllerSettings 
    dw GameOptionsMenu_8_SpecialSettings 
    dw GameOptionsMenu_9_ScrollControllerSettingsDown 
    dw GameOptionsMenu_A_ScrollControllerSettingsUp 
    dw GameOptionsMenu_B_TransitionBackToFileSelect 
    dw GameOptionsMenu_C_FadingOutOptionsMenuToStartGame 

GameOptionsMenu_0_FinishFadingOut:
    JSL.L HandleFadingOut 
    SEP #$20 
    LDA.B $51 : CMP.B #$80 : BNE + 
    JSL.L EnableNMI 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    INC.W $0DE2 
    RTS 


  + SEP #$20 
    LDA.B $51 : CMP.B #$0E : BNE .return 
    LDA.B $6B : BIT.B #$04 
    BNE .return 
    REP #$20 
    LDY.W #GameOptionsMenu_Objects_SAMUS_DATA_Border 
    JSR.W Spawn_GameOptionsMenu_Object ; Spawn border around SAMUS DATA
    RTS 


.return:
    REP #$20 
    RTS 


GameOptionsMenu_1_LoadingOptionsMenu:
    PHP 
    SEP #$30 
    LDA.B #$00 : STA.B $5D 
    LDA.B #$13 : STA.B $69 
    STZ.B $6B 
    STZ.B $6C 
    STZ.B $6D 
    STZ.B $6E 
    STZ.B $71 
    STZ.B $6F 
    STZ.B $72 
    LDA.B #$00 : STA.W $2116 
    LDA.B #$58 : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl Zebes_and_Stars_Tilemap 
    dw $0800 
    LDA.B #$02 : STA.W $420B 
    REP #$30 
    STZ.B $B1 
    STZ.B $B3 
    STZ.B $B5 
    STZ.B $B7 
    STZ.W $0DE0 
    LDX.W #$01FE 

  - LDA.L Menu_Palettes,X : STA.L $7EC000,X 
    DEX #2
    BPL - 
    LDA.W #GameOptionsMenu_OptionsScreen_Tilemap>>8&$FF00 : STA.B $48 
    LDA.W #GameOptionsMenu_OptionsScreen_Tilemap : STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7FC000 
    LDA.W #GameOptionsMenu_ControllerSettings_English_Tilemap>>8&$FF00 : STA.B $48 
    LDA.W #GameOptionsMenu_ControllerSettings_English_Tilemap : STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7FC800 
    LDA.W #GameOptionsMenu_ControllerSettings_Japanese_Tilemap>>8&$FF00 : STA.B $48 
    LDA.W #GameOptionsMenu_ControllerSettings_Japanese_Tilemap : STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7FD000 
    LDA.W #GameOptionsMenu_SpecialSettings_English_Tilemap>>8&$FF00 : STA.B $48 
    LDA.W #GameOptionsMenu_SpecialSettings_English_Tilemap : STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7FD800 
    LDA.W #GameOptionsMenu_SpecialSettings_Japanese_Tilemap>>8&$FF00 : STA.B $48 
    LDA.W #GameOptionsMenu_SpecialSettings_Japanese_Tilemap : STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7FE000 
    LDX.W #$07FE 

  - LDA.L $7FC000,X : STA.L $7E3000,X 
    DEX #2
    BPL - 
    STZ.W $099E 
    JSR.W Delete_GameOptionsMenu_Objects 
    LDY.W #GameOptionsMenu_Objects_MenuSelectionMissile_setup 
    JSR.W Spawn_GameOptionsMenu_Object 
    LDY.W #GameOptionsMenu_Objects_OPTION_MODE_Border 
    JSR.W Spawn_GameOptionsMenu_Object 
    INC.W $0DE2 
    JSR.W Set_Language_Text_Option_Highlight 
    PLP 
    RTS 


GameOptionsMenu_2_FadingInOptionsMenu:
    JSL.L HandleFadingIn 
    SEP #$20 
    LDA.B $51 : CMP.B #$0F : BNE .return 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    INC.W $0DE2 
    RTS 


.return:
    REP #$20 
    RTS 


Draw_GameOptionsMenu_BG1:
    PHP 
    REP #$30 
    LDX.W $0330 
    LDA.W #$0800 : STA.B $D0,X 
    INX #2
    LDA.W #$3000 : STA.B $D0,X 
    INX #2
    SEP #$20 
    LDA.B #$7E : STA.B $D0,X 
    REP #$20 
    INX 
    LDA.W #$5000 : STA.B $D0,X 
    INX #2
    STX.W $0330 
    PLP 
    RTS 


Set_GameOptionsMenu_TilePalettes:
    PHP 
    REP #$30 
    STA.B $12 

.loop:
    LDA.L $7E3000,X : AND.W #$E3FF 
    ORA.B $12 
    STA.L $7E3000,X 
    INX #2
    DEY #2
    BNE .loop 
    PLP 
    RTS 


GameOptionsMenu_3_OptionsMenu:
    PHP 
    REP #$30 
    LDA.B $8F : AND.W #$0800 
    BEQ .checkDown 
    LDA.W #$0037 : JSL.L QueueSound_Lib1_Max6 
    DEC.W $099E 
    BPL .checkB 
    LDA.W #$0004 : STA.W $099E 
    BRA .checkB 


.checkDown:
    LDA.B $8F : AND.W #$0400 
    BEQ .checkB 
    LDA.W #$0037 : JSL.L QueueSound_Lib1_Max6 
    LDA.W $099E 
    INC A 
    STA.W $099E 
    CMP.W #$0005 : BNE .checkB 
    STZ.W $099E 

.checkB:
    LDA.B $8F : BIT.W #$8000 
    BNE .cancel 
    BIT.W #$0080 
    BNE .actiate 
    BIT.W #$1000 
    BEQ .return 

.actiate:
    LDA.W #$0038 : JSL.L QueueSound_Lib1_Max6 
    LDA.W $099E 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 

.return:
    PLP 
    RTS 


.cancel:
    LDA.W #$000B : STA.W $0DE2 
    PLP 
    RTS 


.pointers:
    dw GameOptionsMenu_StartGame ; Start game
    dw GameOptionsMenu_OptionsMenu_ToggleLanguageText ; English text
    dw GameOptionsMenu_OptionsMenu_ToggleLanguageText ; Japanese Text
    dw Start_GameOptionsMenu_DissolveTransition ; Controller setting mode
    dw Start_GameOptionsMenu_DissolveTransition ; Special setting mode

GameOptionsMenu_StartGame:
    LDA.W $05D1 : BEQ .debug 
    LDA.B $8B : BIT.W #$0020 
    BEQ .startGame 

.debug:
    LDA.L $7ED914 : CMP.W #$0005 : BNE .fadeScreen 

.startGame:
    LDA.W #$0004 : STA.W $0DE2 
    RTS 


.fadeScreen:
    STZ.W $0723 
    STZ.W $0725 
    LDA.W #$000C : STA.W $0DE2 
    RTS 


GameOptionsMenu_OptionsMenu_ToggleLanguageText:
    STZ.W $099E 
    LDA.W $09E2 : BEQ .japaneseText 
    STZ.W $09E2 
    BRA Set_Language_Text_Option_Highlight 


.japaneseText:
    LDA.W #$0001 : STA.W $09E2 

Set_Language_Text_Option_Highlight:
    LDA.W $09E2 : BNE .japaneseText 
    LDX.W #$0288 
    LDY.W #$0018 
    LDA.W #$0000 : JSR.W Set_GameOptionsMenu_TilePalettes 
    LDX.W #$02C8 
    LDY.W #$0018 
    LDA.W #$0000 : JSR.W Set_GameOptionsMenu_TilePalettes 
    LDX.W #$0348 
    LDY.W #$0032 
    LDA.W #$0400 : JSR.W Set_GameOptionsMenu_TilePalettes 
    LDX.W #$0388 
    LDY.W #$0032 
    LDA.W #$0400 : JSR.W Set_GameOptionsMenu_TilePalettes 
    BRA .return 


.japaneseText:
    LDX.W #$0288 
    LDY.W #$0018 
    LDA.W #$0400 : JSR.W Set_GameOptionsMenu_TilePalettes 
    LDX.W #$02C8 
    LDY.W #$0018 
    LDA.W #$0400 : JSR.W Set_GameOptionsMenu_TilePalettes 
    LDX.W #$0348 
    LDY.W #$0032 
    LDA.W #$0000 : JSR.W Set_GameOptionsMenu_TilePalettes 
    LDX.W #$0388 
    LDY.W #$0032 
    LDA.W #$0000 : JSR.W Set_GameOptionsMenu_TilePalettes 

.return:
    RTS 


Start_GameOptionsMenu_DissolveTransition:
    SEP #$20 
    LDA.B #$03 : STA.B $57 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    LDA.W #$0005 : STA.W $0DE2 
    RTS 


GameOptionsMenu_B_TransitionBackToFileSelect:
    JSL.L HandleFadingOut 
    SEP #$20 
    LDA.B $51 : CMP.B #$80 : BNE .return 
    JSL.L EnableNMI 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    LDA.W #$0004 : STA.W $0998 
    STZ.W $0727 
    STZ.W $0DE2 
    RTS 


.return:
    REP #$20 
    RTS 


GameOptionsMenu_C_FadingOutOptionsMenuToStartGame:
    JSL.L HandleFadingOut 
    SEP #$20 
    LDA.B $51 : CMP.B #$80 : BNE .return 
    JSL.L EnableNMI 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    LDA.W #$0004 : STA.W $0DE2 
    RTS 


.return:
    REP #$20 
    RTS 


GameOptionsMenu_4_StartGame:
    STZ.W $0DE2 
    LDA.W $05D1 : BEQ .checkLoadingState 
    LDA.B $8B : BIT.W #$0020 
    BEQ .debug 

.checkLoadingState:
    LDA.L $7ED914 : BEQ .intro 
    STA.W $0998 
    CMP.W #$0022 : BNE .cutscene 
    LDA.W #CinematicFunction_CeresGoesBoom_Initial : STA.W $1F51 
    BRA .cutscene 


.intro:
    LDA.W #$001E : STA.W $0998 
    LDA.W #CinematicFunction_Intro_Initial : STA.W $1F51 
    STZ.W $099E 
    STZ.W $0723 
    STZ.W $0725 
    RTS 


.cutscene:
    STZ.W $099E 
    STZ.W $0DE2 
    RTS 


.debug:
    LDA.L $7ED914 : CMP.W #$0005 : BEQ .fileSelectMap 
    LDA.W #$0005 : STA.W $0998 
    STA.L $7ED914 
    LDA.W $0952 : JSL.L SaveToSRAM 
    RTS 


.fileSelectMap:
    LDA.W #$0005 : STA.W $0998 
    RTS 


GameOptionsMenu_5_DissolveOutScreen:
    JSL.L HandleFadingOut 
    SEP #$20 
    LDA.B $57 : CMP.B #$F3 : BEQ .notFinishedFadingOut 
    CLC : ADC.B #$10 : STA.B $57 

.notFinishedFadingOut:
    LDA.B $51 : CMP.B #$80 : BEQ .finishedFadingOut 
    REP #$20 
    RTS 


.finishedFadingOut:
    JSL.L EnableNMI 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    STZ.B $B3 
    INC.W $0DE2 
    LDA.W $099E : BEQ .gotoOptionsMenu 
    BIT.W #$0004 
    BNE .specialSubmenu 
    LDA.W $09E2 : BNE .japaneseControllerSettings 
    LDX.W #$07FE 

.englishCtrlLoop:
    LDA.L $7FC800,X : STA.L $7E3000,X 
    DEX #2
    BPL .englishCtrlLoop 
    BRA .continueControllerSettingsSettings 


.japaneseControllerSettings:
    LDX.W #$07FE 

.japaneseCtrlLoop:
    LDA.L $7FD000,X : STA.L $7E3000,X 
    DEX #2
    BPL .japaneseCtrlLoop 

.continueControllerSettingsSettings:
    LDY.W #GameOptionsMenu_Objects_CONTROLLER_SETTING_MODE_Border 
    JSR.W Spawn_GameOptionsMenu_Object 
    JSR.W GameOptionsMenu_ControllerBindings 
    JSR.W Draw_GameOptionsMenu_ControllerBindings 
    RTS 


.gotoOptionsMenu:
    BRA .optionsMenu 


.specialSubmenu:
    LDA.W $09E2 : BNE .japaneseSettings 
    LDX.W #$07FE 

.englishSettingsLoop:
    LDA.L $7FD800,X : STA.L $7E3000,X 
    DEX #2
    BPL .englishSettingsLoop 
    BRA .continueSpecial 


.japaneseSettings:
    LDX.W #$07FE 

.japaneseSettingsLoop:
    LDA.L $7FE000,X : STA.L $7E3000,X 
    DEX #2
    BPL .japaneseSettingsLoop 

.continueSpecial:
    STZ.W $099E 
    JSR.W Set_SpecialSetting_Highlights 
    LDA.W #$0001 : STA.W $099E 
    JSR.W Set_SpecialSetting_Highlights 
    LDA.W #$0004 : STA.W $099E 
    LDY.W #GameOptionsMenu_Objects_SPECIAL_SETTING_MODE_Border 
    JSR.W Spawn_GameOptionsMenu_Object 
    RTS 


.optionsMenu:
    LDX.W #$07FE 

.optionsMenuLoop:
    LDA.L $7FC000,X : STA.L $7E3000,X 
    DEX #2
    BPL .optionsMenuLoop 
    JSR.W Set_Language_Text_Option_Highlight 
    LDY.W #GameOptionsMenu_Objects_OPTION_MODE_Border 
    JSR.W Spawn_GameOptionsMenu_Object 
    RTS 


GameOptionsMenu_6_DissolveInScreen:
    JSL.L HandleFadingIn 
    SEP #$20 
    LDA.B $57 : CMP.B #$03 : BEQ .brightness 
    SEC : SBC.B #$10 : STA.B $57 

.brightness:
    LDA.B $51 : CMP.B #$0F : BNE .return 
    STZ.B $57 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    LDA.W $099E : BEQ .OptionsMenu 
    BIT.W #$0004 
    BNE .specialSubmenu 
    LDA.W #$0007 : STA.W $0DE2 
    STZ.W $099E 
    RTS 


.specialSubmenu:
    LDA.W #$0008 : STA.W $0DE2 
    STZ.W $099E 
    RTS 


.OptionsMenu:
    LDA.W #$0003 : STA.W $0DE2 
    RTS 


.return:
    REP #$20 
    RTS 


GameOptionsMenu_8_SpecialSettings:
    LDA.B $8F : AND.W #$0800 
    BEQ .checkDown 
    LDA.W #$0037 : JSL.L QueueSound_Lib1_Max6 
    DEC.W $099E 
    BPL .checkB 
    LDA.W #$0002 : STA.W $099E 
    BRA .checkB 


.checkDown:
    LDA.B $8F : AND.W #$0400 
    BEQ .checkB 
    LDA.W #$0037 : JSL.L QueueSound_Lib1_Max6 
    LDA.W $099E 
    INC A 
    STA.W $099E 
    CMP.W #$0003 : BNE .checkB 
    STZ.W $099E 

.checkB:
    LDA.B $8F : BIT.W #$8000 
    BEQ .checkActivate 
    LDA.W #$0038 : JSL.L QueueSound_Lib1_Max6 
    STZ.W $099E 
    JSR.W Start_GameOptionsMenu_DissolveTransition 
    RTS 


.checkActivate:
    LDA.B $8F : BIT.W #$1380 
    BEQ .return 
    LDA.W #$0038 : JSL.L QueueSound_Lib1_Max6 
    LDA.W $099E 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 

.return:
    RTS 


.pointers:
    dw GameOptions_SpecialSettings_ToggleSetting 
    dw GameOptions_SpecialSettings_ToggleSetting 
    dw GameOptions_SpecialSettings_End 

GameOptions_SpecialSettings_ToggleSetting:
    LDA.W $099E 
    ASL A 
    TAX 
    LDA.W SpecialSettingRAMAddresses,X 
    TAX 
    LDA.W $0000,X : BEQ .toggleOn 
    LDA.W #$0000 ; toggle off
    STA.W $0000,X 
    BRA .highlight 


.toggleOn:
    LDA.W #$0001 : STA.W $0000,X 

.highlight:
    JSR.W Set_SpecialSetting_Highlights 
    RTS 


SpecialSettingRAMAddresses: 
    dw $09EA ; Icon cancel flag
    dw $09E4 ; Moonwalk flag

GameOptions_SpecialSettings_End:
    STZ.W $099E 
    JSR.W Start_GameOptionsMenu_DissolveTransition 
    RTS 


Set_SpecialSetting_Highlights:
    LDA.W $099E 
    ASL A 
    TAX 
    LDA.W SpecialSettingRAMAddresses,X 
    TAX 
    LDA.W $0000,X : BNE .settingIsOn 
    LDA.W $099E 
    ASL #2
    TAX 
    PHX 
    LDA.W .iconCancelManualRow0,X 
    TAX 
    LDY.W #$000C 
    LDA.W #$0400 : JSR.W Set_GameOptionsMenu_TilePalettes 
    PLX : PHX 
    LDA.W .iconCancelManualRow1,X 
    TAX 
    LDY.W #$000C 
    LDA.W #$0400 : JSR.W Set_GameOptionsMenu_TilePalettes 
    PLX : PHX 
    LDA.W .iconCancelAutoRow0,X 
    TAX 
    LDY.W #$000C 
    LDA.W #$0000 : JSR.W Set_GameOptionsMenu_TilePalettes 
    PLX 
    LDA.W .iconCancelAutoRow1,X 
    TAX 
    LDY.W #$000C 
    LDA.W #$0000 : JSR.W Set_GameOptionsMenu_TilePalettes 
    RTS 


.settingIsOn:
    LDA.W $099E 
    ASL #2
    TAX 
    PHX 
    LDA.W .iconCancelManualRow0,X 
    TAX 
    LDY.W #$000C 
    LDA.W #$0000 : JSR.W Set_GameOptionsMenu_TilePalettes 
    PLX : PHX 
    LDA.W .iconCancelManualRow1,X 
    TAX 
    LDY.W #$000C 
    LDA.W #$0000 : JSR.W Set_GameOptionsMenu_TilePalettes 
    PLX : PHX 
    LDA.W .iconCancelAutoRow0,X 
    TAX 
    LDY.W #$000C 
    LDA.W #$0400 : JSR.W Set_GameOptionsMenu_TilePalettes 
    PLX 
    LDA.W .iconCancelAutoRow1,X 
    TAX 
    LDY.W #$000C 
    LDA.W #$0400 : JSR.W Set_GameOptionsMenu_TilePalettes 
    RTS 


.iconCancelManualRow0:
    dw $01E0 
.iconCancelManualRow1:
    dw $0220 
.moonwalkOnRow0:
    dw $0360 
.moonwalkOnRow1:
    dw $03A0 
.iconCancelAutoRow0:
    dw $01EE 
.iconCancelAutoRow1:
    dw $022E 
.moonwalkOffRow0:
    dw $036E 
.moonwalkOffRow1:
    dw $03AE 

GameOptionsMenu_7_ControllerSettings:
    LDA.B $8F : AND.W #$0800 
    BEQ .upEnd 
    LDA.W #$0037 : JSL.L QueueSound_Lib1_Max6 
    LDA.W $099E 
    DEC A 
    STA.W $099E 
    BMI .gotoScrollDown 
    CMP.W #$0006 : BEQ .scrollUp 
    RTS 


.gotoScrollDown:
    LDA.W #$0008 : STA.W $099E 
    BRA .scrollDown 


.return:
    RTS 


.upEnd:
    LDA.B $8F : AND.W #$0400 
    BEQ .downEnd 
    LDA.W #$0037 : JSL.L QueueSound_Lib1_Max6 
    LDA.W $099E 
    INC A 
    STA.W $099E 
    CMP.W #$0007 : BEQ .scrollDown 
    CMP.W #$0009 : BNE .return 
    STZ.W $099E 
    BRA .scrollUp 


.scrollDown:
    LDA.W #$0009 : STA.W $0DE2 
    RTS 


.scrollUp:
    LDA.W #$000A : STA.W $0DE2 
    RTS 


.downEnd:
    LDA.B $8F : BEQ .misplacedCode 
    LDA.W #$0038 : JSL.L QueueSound_Lib1_Max6 
    LDA.W $099E 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    RTS 


.misplacedCode:
    LDA.B $91 : BRA .backOnTrack 


.pointers:
    dw GameOptions_ControllerSettings_SetBinding 
    dw GameOptions_ControllerSettings_SetBinding 
    dw GameOptions_ControllerSettings_SetBinding 
    dw GameOptions_ControllerSettings_SetBinding 
    dw GameOptions_ControllerSettings_SetBinding 
    dw GameOptions_ControllerSettings_SetBinding 
    dw GameOptions_ControllerSettings_SetBinding 
    dw GameOptions_ControllerSettings_End 
    dw GameOptions_ControllerSettings_ResetToDefault 

.backOnTrack:
    TAY 
    BEQ .otherReturn 
    LDA.W $099E : CMP.W #$0008 : BNE .otherReturn 
    LDA.W $0DE0 : CMP.W #$0010 : BPL .otherReturn 
    LDA.W $0DE0 
    ASL A 
    TAX 
    TYA 
    AND.W .inputs,X 
    CMP.W .inputs,X : BNE .debugInvulOff 
    INC.W $0DE0 
    RTS 


.debugInvulOff:
    STZ.W $0DE0 

.otherReturn:
    RTS 


.inputs: 
    dw $0020,$0020,$0020,$0020 ; L
    dw $0010,$0010,$0010,$0010,$0010,$0010 ; R
    dw $4000 ; Y
    dw $0040,$0040 ; X
    dw $0080,$0080,$0080 ; A

GameOptions_ControllerSettings_ResetToDefault:
    LDA.B $8F : BIT.W #$1080 
    BNE .reset 
    RTS 


.reset:
    LDA.W #$0040 : STA.W $09B2 
    LDA.W #$0080 : STA.W $09B4 
    LDA.W #$8000 : STA.W $09B6 
    LDA.W #$4000 : STA.W $09B8 
    LDA.W #$2000 : STA.W $09BA 
    LDA.W #$0010 : STA.W $09BE 
    LDA.W #$0020 : STA.W $09BC 
    JSR.W GameOptionsMenu_ControllerBindings 
    JSR.W Draw_GameOptionsMenu_ControllerBindings 
    RTS 


GameOptions_ControllerSettings_End:
    LDA.B $8F : BIT.W #$1080 
    BNE .end 
    RTS 


.end:
    JSR.W Save_GameOptionsMenu_ControllerBindings 
    BCS .return 
    STZ.W $099E 
    JSR.W Start_GameOptionsMenu_DissolveTransition 

.return:
    RTS 


GameOptionsMenu_9_ScrollControllerSettingsDown:
    LDA.B $B3 : CLC : ADC.W #$0002 : STA.B $B3 
    CMP.W #$0020 : BNE .return 
    LDA.W #$0007 : STA.W $0DE2 

.return:
    RTS 


GameOptionsMenu_A_ScrollControllerSettingsUp:
    LDA.B $B3 : SEC : SBC.W #$0002 : STA.B $B3 
    BNE RTS_82F295 
    LDA.W #$0007 : STA.W $0DE2 

RTS_82F295:
    RTS 


Setup_MenuSelectionMissile:
    LDA.W #$0018 : STA.W $1AAD,Y 
    LDA.W #$0038 : STA.W $1ABD,Y 
    LDA.W #$0E00 : STA.W $1ACD,Y 
    RTS 


PreInstruction_MenuSelectionMissile:
    LDA.W $0998 : CMP.W #$0002 : BEQ + 
    LDA.W #$0001 : STA.W $1B1D,X 
    LDA.W #InstList_GameOptionsMenu_Delete : STA.W $1AFD,X 
    RTS 


  + LDA.W $0DE2 
    ASL A 
    TAY 
    LDA.W .pointers,Y : BEQ + 
    STA.B $12 
    LDA.W $099E 
    ASL #2
    CLC : ADC.B $12 : TAY 
    LDA.W $0000,Y : STA.W $1AAD,X 
    LDA.W $0002,Y : STA.W $1ABD,X 
    RTS 


  + LDA.W #$0180 : STA.W $1AAD,X 
    LDA.W #$0010 : STA.W $1ABD,X 
    RTS 


.pointers:
    dw $0000,$0000 ; 0 - Finish fading out
    dw .OptionsMenu_X ; 2 - Fading in options menu
    dw .OptionsMenu_X ; 3 - Options menu
    dw $0000,$0000,$0000 ; 4 - Start game
    dw .ControllerSettings_X ; 7 - Controller settings
    dw .SpecialSettings_X ; 8 - Special settings
    dw $0000,$0000 ; 9 - Scroll controller settings down
    dw .OptionsMenu_X ; B - Transition back to file selection
    dw $0000 ; C - Fading out options menu to start game

.OptionsMenu_X:
    dw $0018 
.OptionsMenu_Y: 
    dw       $0038
    dw $0018,$0058
    dw $0018,$0070
    dw $0018,$0090
    dw $0018,$00B0

.ControllerSettings_X:
    dw $0028 
.ControllerSettings_Y: 
    dw       $0030
    dw $0028,$0048
    dw $0028,$0060
    dw $0028,$0078
    dw $0028,$0090
    dw $0028,$00A8
    dw $0028,$00C0
    dw $0028,$00B8
    dw $0028,$00D0

.SpecialSettings_X:
    dw $0010 
.SpecialSettings_Y: 
    dw       $0040
    dw $0010,$0070
    dw $0010,$00A0                                     

Setup_BorderAround_OPTION_MODE:
    LDA.W #$007C : STA.W $1AAD,Y 
    BRA Common_Border_Setup 


Setup_BorderAround_CONTRLLER_SETTING_MODE:
    LDA.W #$0084 : STA.W $1AAD,Y 
    BRA Common_Border_Setup 


Setup_BorderAround_SPECIAL_SETTING_MODE:
    LDA.W #$0080 : STA.W $1AAD,Y 
    BRA Common_Border_Setup 


Setup_BorderAround_SAMUS_DATA:
    LDA.W #$0080 : STA.W $1AAD,Y 

Common_Border_Setup:
    LDA.W #$0010 : STA.W $1ABD,Y 
    LDA.W #$0E00 : STA.W $1ACD,Y 
    RTS 


PreInstruction_BorderAround_OPTIONS_MODE:
    LDA.W $0998 : CMP.W #$0002 : BNE .delete 
    LDA.W $0DE2 : CMP.W #$0006 : BNE .return 
    SEP #$20 
    LDA.B $51 : CMP.B #$80 : BEQ .delete 
    REP #$20 
    RTS 


.delete:
    REP #$20 
    LDA.W #$0001 : STA.W $1B1D,X 
    LDA.W #InstList_GameOptionsMenu_Delete : STA.W $1AFD,X 

.return:
    RTS 


PreInstruction_BorderAround_CONTRLLER_SETTING_MODE:
    LDA.W $0DE2 : CMP.W #$0006 : BNE .dissolveInEnd 
    SEP #$20 
    LDA.B $51 : CMP.B #$80 : BEQ .delete 
    REP #$20 
    RTS 


.delete:
    REP #$20 
    LDA.W #$0001 : STA.W $1B1D,X 
    LDA.W #InstList_GameOptionsMenu_Delete : STA.W $1AFD,X 
    RTS 


.dissolveInEnd:
    CMP.W #$0009 : BNE .checkScrollingUp 
    LDA.W $1ABD,X : SEC : SBC.W #$0002 : STA.W $1ABD,X 
    RTS 


.checkScrollingUp:
    CMP.W #$000A : BNE .return 
    LDA.W $1ABD,X : CLC : ADC.W #$0002 : STA.W $1ABD,X 

.return:
    RTS 


PreInstruction_BorderAround_SPECIAL_SETTING_MODE:
    LDA.W $0DE2 : CMP.W #$0006 : BNE .return 
    SEP #$20 
    LDA.B $51 : CMP.B #$80 : BEQ .startedFadingIn 
    REP #$20 
    RTS 


.startedFadingIn:
    REP #$20 
    LDA.W #$0001 : STA.W $1B1D,X 
    LDA.W #InstList_GameOptionsMenu_Delete : STA.W $1AFD,X 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_PreInstruction_82F404:
    LDA.W $0DE2 : CMP.W #$0001 : BNE .return 
    LDA.W #$0001 : STA.W $1B1D,X 
    LDA.W #InstList_GameOptionsMenu_Delete : STA.W $1AFD,X 

.return:
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Setup_FileSelectMenu_SamusHelmet:
    LDA.W #$00D8 : STA.W $1AAD,Y 
    LDA.W #$0010 : STA.W $1ABD,Y 
    LDA.W #$0E00 : STA.W $1ACD,Y 
    RTS 


PreInstruction_FileSelectMenu_SamusHelmet:
    LDA.W $0998 : CMP.W #$0002 : BEQ .extraRTS 
    LDA.W #$0001 : STA.W $1B1D,X 
    LDA.W #InstList_GameOptionsMenu_Delete : STA.W $1AFD,X 
    RTS 


.extraRTS:
    RTS 


InstList_GameOptionsMenu_MenuSelectionMissile:
    dw $0008,TitleMenuSpritemaps_34_MenuSelectionMissile_0 
    dw $0008,TitleMenuSpritemaps_35_MenuSelectionMissile_1 
    dw $0008,TitleMenuSpritemaps_36_MenuSelectionMissile_2 
    dw $0008,TitleMenuSpritemaps_37_MenuSelectionMissile_3 
    dw Instruction_GameOptionsMenu_GotoY 
    dw InstList_GameOptionsMenu_MenuSelectionMissile 

InstList_GameOptionsMenu_FileSelectMenu_SamusHelmet:
    dw $0090,TitleMenuSpritemaps_2C_FileSelectMenu_SamusHelmet_0 
    dw $0006,TitleMenuSpritemaps_2D_FileSelectMenu_SamusHelmet_1 
    dw $0008,TitleMenuSpritemaps_2E_FileSelectMenu_SamusHelmet_2 
    dw $0001,TitleMenuSpritemaps_2F_FileSelectMenu_SamusHelmet_3 
    dw $0002,TitleMenuSpritemaps_30_FileSelectMenu_SamusHelmet_4 
    dw $0004,TitleMenuSpritemaps_31_FileSelectMenu_SamusHelmet_5 
    dw $0002,TitleMenuSpritemaps_32_FileSelectMenu_SamusHelmet_6 
    dw $0001,TitleMenuSpritemaps_33_FileSelectMenu_SamusHelmet_7 
    dw $009F,TitleMenuSpritemaps_2E_FileSelectMenu_SamusHelmet_2 
    dw Instruction_GameOptionsMenu_GotoY 
    dw InstList_GameOptionsMenu_FileSelectMenu_SamusHelmet 

InstList_GameOptionsMenu_BorderAround_OPTIONS_MODE_0:
    dw $0002,TitleMenuSpritemaps_4B_BorderAround_OPTIONS_MODE 
    dw Instruction_GameOptionsMenu_PreInstruction_inY 
    dw PreInstruction_BorderAround_OPTIONS_MODE 

InstList_GameOptionsMenu_BorderAround_OPTIONS_MODE_1:
    dw $0090,TitleMenuSpritemaps_4B_BorderAround_OPTIONS_MODE 
    dw Instruction_GameOptionsMenu_GotoY 
    dw InstList_GameOptionsMenu_BorderAround_OPTIONS_MODE_1 

InstList_GameOptionsMenu_BorderAround_CTRL_SETTING_MODE_0:
    dw $0002,TitleMenuSpritemaps_49_BorderAround_CONTROLLER_SETTING_MODE 
    dw Instruction_GameOptionsMenu_PreInstruction_inY 
    dw PreInstruction_BorderAround_CONTRLLER_SETTING_MODE 

InstList_GameOptionsMenu_BorderAround_CTRL_SETTING_MODE_1:
    dw $0090,TitleMenuSpritemaps_49_BorderAround_CONTROLLER_SETTING_MODE 
    dw Instruction_GameOptionsMenu_GotoY 
    dw InstList_GameOptionsMenu_BorderAround_CTRL_SETTING_MODE_1 

InstList_GameOptionsMenu_BorderAround_SPECIAL_SETTING_MODE_0:
    dw $0002,TitleMenuSpritemaps_4D_BorderAround_SPECIAL_SETTING_MODE 
    dw Instruction_GameOptionsMenu_PreInstruction_inY 
    dw PreInstruction_BorderAround_SPECIAL_SETTING_MODE 

InstList_GameOptionsMenu_BorderAround_SPECIAL_SETTING_MODE_1:
    dw $0090,TitleMenuSpritemaps_4D_BorderAround_SPECIAL_SETTING_MODE 
    dw Instruction_GameOptionsMenu_GotoY 
    dw InstList_GameOptionsMenu_BorderAround_SPECIAL_SETTING_MODE_1 

InstList_GameOptionsMenu_BorderAround_SAMUS_DATA:
    dw $0090,TitleMenuSpritemaps_48_BorderAround_SAMUS_DATA 
    dw Instruction_GameOptionsMenu_GotoY 
    dw InstList_GameOptionsMenu_BorderAround_SAMUS_DATA 

InstList_GameOptionsMenu_Delete:
    dw Instruction_GameOptionsMenu_Delete 

GameOptionsMenu_Objects_MenuSelectionMissile_setup:
    dw Setup_MenuSelectionMissile 

GameOptionsMenu_Objects_MenuSelectionMissile_preInstruction:
    dw PreInstruction_MenuSelectionMissile 

GameOptionsMenu_Objects_MenuSelectionMissile_instructionList:
    dw InstList_GameOptionsMenu_MenuSelectionMissile 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_GameOptionsMenu_Objects_FileSelectMenuSamusHelmet_82F4BE:
    dw Setup_FileSelectMenu_SamusHelmet 
    dw PreInstruction_FileSelectMenu_SamusHelmet 
    dw InstList_GameOptionsMenu_FileSelectMenu_SamusHelmet 
endif ; !FEATURE_KEEP_UNREFERENCED

GameOptionsMenu_Objects_OPTION_MODE_Border:
    dw Setup_BorderAround_OPTION_MODE 
    dw RTS_828C10 
    dw InstList_GameOptionsMenu_BorderAround_OPTIONS_MODE_0 

GameOptionsMenu_Objects_CONTROLLER_SETTING_MODE_Border:
    dw Setup_BorderAround_CONTRLLER_SETTING_MODE 
    dw RTS_828C10 
    dw InstList_GameOptionsMenu_BorderAround_CTRL_SETTING_MODE_0 

GameOptionsMenu_Objects_SPECIAL_SETTING_MODE_Border:
    dw Setup_BorderAround_SPECIAL_SETTING_MODE 
    dw RTS_828C10 
    dw InstList_GameOptionsMenu_BorderAround_SPECIAL_SETTING_MODE_0 

GameOptionsMenu_Objects_SAMUS_DATA_Border:
    dw Setup_BorderAround_SAMUS_DATA 
    dw RTS_828C10 
    dw InstList_GameOptionsMenu_BorderAround_SAMUS_DATA 

GameOptionsMenu_ControllerBindings:
    LDX.W #$0000 

.loop:
    LDA.W Configurable_Controller_Binding_RAM_Addresses,X 
    TAY 
    LDA.W $0000,Y : BIT.W #$0040 
    BNE .X 
    BIT.W #$0080 
    BNE .A 
    BIT.W #$8000 
    BNE .B 
    BIT.W #$2000 
    BNE .Select 
    BIT.W #$4000 
    BNE .Y 
    BIT.W #$0020 
    BNE .L 
    BIT.W #$0010 
    BNE .R 

.X:
    LDA.W #$0000 : STA.W $1B3D,X 
    BRA .next 


.A:
    LDA.W #$0001 : STA.W $1B3D,X 
    BRA .next 


.B:
    LDA.W #$0002 : STA.W $1B3D,X 
    BRA .next 


.Select:
    LDA.W #$0003 : STA.W $1B3D,X 
    BRA .next 


.Y:
    LDA.W #$0004 : STA.W $1B3D,X 
    BRA .next 


.L:
    LDA.W #$0005 : STA.W $1B3D,X 
    BRA .next 


.R:
    LDA.W #$0006 : STA.W $1B3D,X 

.next:
    INX #2
    CPX.W #$000E 
    BPL .return 
    JMP.W .loop 


.return:
    RTS 


Configurable_Controller_Binding_RAM_Addresses: 
    dw $09B2 ; Shot
    dw $09B4 ; Jump
    dw $09B6 ; Run
    dw $09BA ; Item Select
    dw $09B8 ; Item Cancel
    dw $09BE ; Angle Up
    dw $09BC ; Angle Down

Save_GameOptionsMenu_ControllerBindings:
    LDX.W #$0000 

.loop:
    PHX 
    LDA.W Configurable_Controller_Binding_RAM_Addresses,X 
    TAY 
    LDA.W $1B3D,X 

.L:
    ASL A 
    TAX 
    LDA.W Controller_Input_Bitmasks,X : STA.W $0000,Y 
    PLX 
    INX #2
    CPX.W #$000E 
    BMI .loop 
    CLC 
    RTS 


Controller_Input_Bitmasks:
    dw $0040 ; X
    dw $0080 ; A
    dw $8000 ; B
    dw $2000 ; Select
    dw $4000 ; Y
    dw $0020 ; L
    dw $0010 ; R
    dw $0200 ; Left
    dw $0100 ; Right

Draw_GameOptionsMenu_ControllerBindings:
    LDX.W #$0000 

.loop:
    PHX 
    LDA.W $1B3D,X 
    ASL A 
    TAY 
    LDA.W GameOptionsMenu_TilemapOffsets,X 
    TAX 
    LDA.W ControllerButton_TilemapPointers,Y 
    TAY 
    LDA.W $0000,Y : STA.L $7E3000,X 
    LDA.W $0002,Y : STA.L $7E3002,X 
    LDA.W $0004,Y : STA.L $7E3004,X 
    LDA.W $0006,Y : STA.L $7E3040,X 
    LDA.W $0008,Y : STA.L $7E3042,X 
    LDA.W $000A,Y : STA.L $7E3044,X 
    PLX 
    INX #2
    CPX.W #$000E 
    BMI .loop 
    LDA.W $1B47 : CMP.W #$0005 : BEQ .shoulderButton 
    CMP.W #$0006 : BEQ .shoulderButton 
    LDA.W ButtonTilemaps_OFF : STA.L $7E352E 
    LDA.W ButtonTilemaps_OFF+$2 : STA.L $7E3530 
    LDA.W ButtonTilemaps_OFF+$4 : STA.L $7E3532 
    LDA.W ButtonTilemaps_OFF+$6 : STA.L $7E356E 
    LDA.W ButtonTilemaps_OFF+$8 : STA.L $7E3570 
    LDA.W ButtonTilemaps_OFF+$A : STA.L $7E3572 

.shoulderButton:
    LDA.W $1B49 : CMP.W #$0005 : BEQ .return 
    CMP.W #$0006 : BEQ .return 
    LDA.W ButtonTilemaps_OFF : STA.L $7E35EE 
    LDA.W ButtonTilemaps_OFF+$2 : STA.L $7E35F0 
    LDA.W ButtonTilemaps_OFF+$4 : STA.L $7E35F2 
    LDA.W ButtonTilemaps_OFF+$6 : STA.L $7E362E 
    LDA.W ButtonTilemaps_OFF+$8 : STA.L $7E3630 
    LDA.W ButtonTilemaps_OFF+$A : STA.L $7E3632 

.return:
    RTS 


GameOptionsMenu_TilemapOffsets:
    dw $016E,$022E,$02EE,$03AE,$046E,$052E,$05EE 

ControllerButton_TilemapPointers:
    dw ButtonTilemaps_X 
    dw ButtonTilemaps_A 
    dw ButtonTilemaps_B 
    dw ButtonTilemaps_Select 
    dw ButtonTilemaps_Y 
    dw ButtonTilemaps_L 
    dw ButtonTilemaps_R 
    dw ButtonTilemaps_OFF 
    dw ButtonTilemaps_OFF 

ButtonTilemaps_X: 
    dw $0093,$C0A3,$000F
    dw $00A3,$C093,$000F                               

ButtonTilemaps_A: 
    dw $0090,$4090,$000F
    dw $00A0,$40A0,$000F                               

ButtonTilemaps_B: 
    dw $0091,$0092,$000F
    dw $00A1,$00A2,$000F                               

ButtonTilemaps_Select: 
    dw $0095,$0096,$0097
    dw $00A5,$00A6,$00A7                               

ButtonTilemaps_Y: 
    dw $0094,$4094,$000F
    dw $00A4,$40A4,$000F                               

ButtonTilemaps_L: 
    dw $009A,$009B,$409A
    dw $809A,$00AB,$C09A                               

ButtonTilemaps_R: 
    dw $009A,$009C,$409A
    dw $809A,$00AC,$C09A                               

ButtonTilemaps_OFF: 
    dw $0000,$000E,$000E
    dw $0010,$001F,$001F

GameOptions_ControllerSettings_SetBinding:
    LDX.W #$000C 
    LDA.B $8F 

.loopInput:
    BIT.W Controller_Input_Bitmasks,X 
    BNE + 
    DEX #2
    BPL .loopInput 
    RTS 


  + TXA 
    LSR A 
    STA.B $12 
    LDA.W $099E 
    ASL A 
    CLC : ADC.W #$0002 : CMP.W #$000E : BMI + 
    LDA.W #$0000 

  + TAY 
    LDX.W #$0005 

.loopFindExisting:
    LDA.W $1B3D,Y : CMP.B $12 : BEQ .found 
    INY #2
    CPY.W #$000E 
    BMI .next 
    LDY.W #$0000 

.next:
    DEX 
    BPL .loopFindExisting 

.found:
    PHY 
    LDA.W $099E 
    ASL A 
    TAY 
    LDA.W $1B3D,Y : STA.B $14 
    LDA.B $12 : STA.W $1B3D,Y 
    PLY 
    LDA.B $14 : STA.W $1B3D,Y 
    JSR.W Draw_GameOptionsMenu_ControllerBindings 
    RTS 


RTL_82F70E:
    RTL 


Freespace_Bank82_F70F: 
; $8F1 bytes
